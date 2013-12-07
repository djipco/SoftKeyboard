/*

Copyright (c) 2013, Jean-Philippe Côté (jp@cote.cc)
All rights reserved.

This library can be used freely for non-profit purposes. For-profit usage requires written 
approval or a donation (see http://cote.cc/projects/softkeyboard). The donation amount is set to 
whatever the user deems fair.

Even though this library is open source, it cannot be redistributed or modified without prior 
consent from its author. Comments and suggestions are always encouraged.

This library is provided "as is" with no guarantees whatsoever. Use it at your own risk.

*/

package cc.cote.feathers.softkeyboard
{
	import flash.geom.Point;
	import flash.text.engine.TypographicCase;
	import flash.ui.Keyboard;
	
	import cc.cote.feathers.softkeyboard.layouts.Layout;
	
	import feathers.controls.Callout;
	import feathers.core.FeathersControl;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	
	/**
	 * Dispatched when an on-screen key is pressed.
	 * 
	 * @eventType cc.cote.feathers.softkeyboard.KeyEvent.KEY_DOWN
	 */
	[Event(name="cc.cote.feathers.softkeyboard.KeyEvent.keyDown",type="cc.cote.feathers.softkeyboard.KeyEvent")]

	/**
	 * Dispatched when an on-screen key is released. The release must be above the key that was 
	 * initially pressed otherwise the event is not fired.
	 *
	 * @eventType cc.cote.feathers.softkeyboard.KeyEvent.KEY_UP
	 */
	[Event(name="cc.cote.feathers.softkeyboard.KeyEvent.keyUp",type="cc.cote.feathers.softkeyboard.KeyEvent")]
	
	/**
	 * This class allows the creation of virtual on-screen keyboards. Various types of keyboard 
	 * configurations are included in the package such as QWERTY, NUMPAD, etc. However, if a custom 
	 * layout is needed, it is easy to create one by extending the <code>Layout</code> base class.
	 * 
	 * <p>Creating a keyboard and listening for input is very easy. All you need to do is pass the
	 * desired layout to the SoftKeyboard constructor and add an event listener:</p>
	 * 
	 * <listing version="3.0">
	 * var keyboard:SoftKeyboard = new SoftKeyboard(new QwertyEn());
	 * keyboard.addEventListener(SoftKeyboardEvent.KEY_UP, _onKeyUp);
	 * addChild(keyboard);</listing>
	 * 
	 * <p>It is also possible to create keyboards with multiple layouts by passing a vector of 
	 * <code>Layout</code> objects to the constructor. This makes it easy to have a keyboard with 
	 * one layout for regular letters and another one for numbers and symbols, for example. 
	 * Switching between them is possible by pressing the special <code>SWITCH_LAYOUT</code> key.</p> 
	 * 
	 * <p>Layouts that have a <code>SWITCH_LAYOUT</code> key generally accept as a constructor 
	 * parameter the class of the layout that the <code>SWITCH_LAYOUT</code> key should instantiate
	 * when pressed. Here is an example that will toggle between the <code>QwertyEnSingleSwitch</code> 
	 * and <code>NumbersAndSymbolsSingleSwitch</code> layouts:</p>
	 * 
	 * <listing version="3.0">
	 * var layouts:Vector.&lt;Layout&gt; = new &lt;Layout&gt;[
	 *     new QwertyEnSingleSwitch(NumbersAndSymbolsSingleSwitch), 
	 *     new NumbersAndSymbolsSingleSwitch(QwertyEnSingleSwitch)
	 * ];
	 * var keyboard:SoftKeyboard = new SoftKeyboard(layouts);
	 * addChild(keyboard);</listing>
	 * 
	 * <p>A full, working code example is provided with the <code>SoftKeyboard</code> download 
	 * package.</p>
	 * 
	 * <p>In order for the keyboard to display properly, you must skin it through the use of a 
	 * Feathers' theme (a sample theme is provided in the download package). If you don't, a generic
	 * grey skin will be used for reference. Besides assigning skins in your theme, you should also
	 * define a TextRenderer and assign a TextFormat. For more information, see the 
	 * <a href="http://wiki.starling-framework.org/feathers/start">Feathers documentation</a>.</p>
	 * 
	 * <p><code>SoftKeyboard</code> requires <a href="http://feathersui.com/">Feathers 1.0 or newer</a> 
	 * which itself requires the <a href="http://gamua.com/starling/">Starling framework</a>.</p>
	 * 
	 * @see cc.cote.feathers.softkeyboard.layouts
	 * @see cc.cote.feathers.softkeyboard.KeyEvent
	 * @see http://cote.cc/projects/softkeyboard
	 * @see http://feathersui.com/
	 * @see http://gamua.com/starling/
	 * 
 	 *	@TODO	When the keyboard is small, the _callout makes the variants keys taller than 
	 * 				they should be. This probably warrants a support request to Josh. I SHOULD JUST 
	 * 				GET RID OF THE FUCKING CALLOUT AND DO IT MYSELF!!!! When I fix this, the callout 
	 * 				arrow of bottom key rows is screwed...
	 * 
	 * Ideas for later : 
	 * 
	 * 		@TODO	Add left/rigth key padding
	 * 		@TODO	Add the ability to temporarily switch to another layout while pressing the 
	 * 				SWITCH_LAYOUT key
	 * 		@TODO 	Should we use some sort of autoscale on the key labels ? This is a minor problem
	 * 				since the size can be changed in the theme.
	 * 		@TODO	Remove the KeyRow object. It just feels silly. Use a layout machin ?
	 * 		@TODO	Do we need to bother with the NUM_LOCK key ?
	 * 		@TODO	The key icons should be resized according to the key's size (this is not such a 
	 * 				big problem since you can always change the icons themselves).
	 * 		@TODO 	Add the ability to modify the layouts var. This means adding several methods 
	 * 				(addLayout, addLayoutAt, etc) or finding a way to trap modifications done 
	 * 				directly on the vector).
	 * 		@TODO	Can we do something about the fact that the callout component requires a 
	 * 				background skin ?
	 * 
	 */
	public class SoftKeyboard extends FeathersControl
	{
		
		/** Version of this SoftKeyboard library */
		public const VERSION:String = '1.0a rev5';
		
		/** The background to use for the SoftKeyboard. */
		public var backgroundSkin:DisplayObject;
		
		/** The free space between the outside of the keyboard and the keys. */
		public var padding:Number = 0;
		
		/** 
		 * The vector containing all active keyboard configurations. A single keyboard can have more 
		 * than one configuration. A configuration is the container of all keys defined by a layout.
		 * Configurations are place on the display list, they are DisplayObjects.
		 */
		private var _configurations:Vector.<Sprite> = new Vector.<Sprite>();

		/** A vector containing all layouts passed in via the constructor. */
		private var _layouts:Vector.<Layout>;
		
		/** The index of the currently displayed layout. */
		private var _currentLayoutIndex:uint = 0;
		
		/** The container of key variants displayed when the user holds down a key. */
		private var _callout:Callout;
		
		/**
		 * Creates a new SoftKeyboard object. 
		 * 
		 * @param layouts A single <code>Layout</code> object or a vector of <code>Layout</code>
		 * objects to use with the keyboard
		 * @param width Full outer width of the keyboard (including any padding)
		 * @param height Full outer height of the keyboard (including any padding)
		 * 
		 * @see cc.cote.feathers.softkeyboard.layouts
		 * 
		 * @throws Error First parameter must be a Layout object or a vector of Layout objects.
		 */
		public function SoftKeyboard(
			layouts:Object, 
			width:Number = 320, 
			height:Number = 160
		):void {

			// Check if a single layout or a vector of layouts was used
			if (layouts is Vector.<Layout>) {
				_layouts = layouts as Vector.<Layout>;
			} else if (layouts is Layout) {
				_layouts = new <Layout>[layouts as Layout];
			} else {
				throw(
					new Error(
						'First parameter must be a Layout object or a vector of Layout objects.'
					)
				);
			}
			
			// Assign parameters locally
			if (width > 0) this.width = width;
			if (height > 0) this.height = height;
			
		}
		
		/** @private */
		override protected function initialize():void {
			
			// Build all configurations from the specified layouts
			for each (var layout:Layout in _layouts) {
				_configurations.push(_buildConfiguration(layout));
			}
			
			// Add the currently selected configuration to the stage and set up key listeners
			addChild(_configurations[_currentLayoutIndex]);
			_addKeyListenersToConfiguration(_configurations[_currentLayoutIndex]);
			capsLock = _layouts[_currentLayoutIndex].capsLock;
			
			// Add background skin (if any has been specified)
			if (backgroundSkin) addChildAt(backgroundSkin, 0);
			
			super.initialize();
			
		}
		
		/** @private */
		private function _addKeyListenersToConfiguration(conf:Sprite):void {
			
			for (var i:uint = 0; i < conf.numChildren; i++) {
				
				var kr:KeyRow = conf.getChildAt(i) as KeyRow;
				
				for (var j:uint = 0; j < kr.numChildren; j++) {
					
					var k:Key = kr.getChildAt(j) as Key;
					k.addEventListener(KeyEvent.KEY_DOWN, _onKeyDown);
					k.addEventListener(KeyEvent.KEY_UP, _onKeyUp);
					k.addEventListener(KeyEvent.SHOW_VARIANTS, _onShowVariants);
					
				}
				
			}
			
		}
		
		/** @private */
		private function _removeKeyListenersFromConfiguration(conf:Sprite):void {
				
			for (var i:uint = 0; i < conf.numChildren; i++) {
				
				var kr:KeyRow = conf.getChildAt(i) as KeyRow;
				
				for (var j:uint = 0; j < kr.numChildren; j++) {
					
					var k:Key = kr.getChildAt(j) as Key;
					k.removeEventListener(KeyEvent.KEY_DOWN, _onKeyDown);
					k.removeEventListener(KeyEvent.KEY_UP, _onKeyUp);
					k.removeEventListener(KeyEvent.SHOW_VARIANTS, _onShowVariants);
					
				}
				
			}
			
		}
		
		/** @private */
		private function _onShowVariants(e:KeyEvent):void {
			
			// If the callout is already on the stage, it means that the user rolled out and back in
			// while keeping the key pressed. In that case, it shouldn't be displayed again.
			if (_callout != null && _callout.stage != null) return;
			
			// Retrieve the key that was originally pressed
			var key:Key = e.currentTarget as Key;
			
			// The callout should always be displayed above the key to prevent fingers from hiding
			// it (unless there's no room).
			var globalPos:Point = key.parent.localToGlobal(new Point(key.x, key.y));
			var direction:String = Callout.DIRECTION_UP;
			if (key.height * 1.5 > globalPos.y) direction = Callout.DIRECTION_DOWN;
			
			// A background image must be defined on the callout or else it dies
			try {
				_callout = Callout.show(key.variantsContainer, key, direction, true);
			} catch (e:TypeError) {
//				var error:Error = new Error(
//					"The Callout subcomponent requires that it's 'backgroundSkin' property be set."
//				);
//				error.name = 'SoftKeyboard error';
//				throw(error);
			}

			
			
			
			
			
			
			
			// For whatever reason, we need to manually resize the Callout otherwise in some cases
			// (when the keyboard is small for instance) the variant keys are too small. 
			_callout.height = key.height + 
				_callout.paddingBottom + 
				_callout.paddingTop + 
				_callout.topArrowSkin.height + 
				_callout.topArrowGap;
			_callout.width = (key.width * key.variants.length) +
				(key.variants.length - 1) * 5 + 
				_callout.paddingLeft + 
				_callout.paddingRight;
			
			// THIS BREAKS THE TOP ARROW !!!!!
			

			
			
		}
		
		/** @private */
		private function _buildConfiguration(layout:Layout):Sprite {
			
			var keyboard:Sprite = new Sprite();
			
			// Check if rows have been defined properly in the layout
			if ( !layout.rows || !(layout.rows is Vector.<Vector.<Key>>) || layout.rows.length < 1 ) {
				throw new Error(
					'SoftKeyboard error: no rows have been defined in the specified layout.'
				)
			}
			
			for (var i:uint = 0; i < layout.rows.length; i++) {
				keyboard.addChild(new KeyRow(layout.rows[i], layout.horizontalGap));
			}
			
			return keyboard;
			
		}

		/** @private */
		private function _onKeyDown(e:KeyEvent):void {
			
			// Re-dispatch the event so implementors can easily listen on the SoftKeyboard object
			// directly
			dispatchEvent(e);
			
		}
		
		/** @private */
		private function _onKeyUp(e:KeyEvent):void {
			
			var key:Key = e.currentTarget as Key;
			
			// Treat the special SWITCH_LAYOUT case
			if (e.charCode == CharCode.SWITCH_LAYOUT) {
				
				// If a layout to switch to has been defined on the key, use it first. If not, go to
				// next layout by default.
				var currentLayout:Layout = layouts[layoutIndex];
				if (key.switchToLayoutClass) {
					layoutIndex = _getLayoutIndex(key.switchToLayoutClass);
				} else {
					
					// Otherwise, go to next layout
					if (layoutIndex + 1 < layouts.length) {
						layoutIndex++;
					} else {
						layoutIndex = 0;
					}
					
				}
				
				return;
				
			}
			
			// Treat the special CAPS_LOCK case
			if (e.charCode == CharCode.CAPS_LOCK) capsLock = !capsLock;
			
			// Re-dispatch the key event so implementors can easily listen on the SoftKeyboard object
			// directly
			dispatchEvent(e);
			
			// If the key also happens to have a switchToLayoutClass, switch layout
			if (key.switchToLayoutClass) {
				layoutIndex = _getLayoutIndex(key.switchToLayoutClass);
			}
			
		}
		
		/** @private */
		private function _getLayoutIndex(layoutClass:Class):uint {
			
			for (var i:int = 0; i < _layouts.length; i++) {
				if (_layouts[i] is layoutClass) return i;
			}
			
			return _currentLayoutIndex;
		}
		
		/** @private */
		override protected function draw():void {
			
			setSizeInternal(actualWidth, actualHeight, false);
				
			// Fetch info about current keyboard
			var keyboard:Sprite = _configurations[_currentLayoutIndex];
			var rowCount:uint = keyboard.numChildren;
			var currentLayout:Layout = _layouts[_currentLayoutIndex];
			
			// Calculate horizontal unit size (in pixels) based on the largest row and vertical unit
			// size based on the number of rows;
			var widest:KeyRow = _getWidestRow(keyboard);
			var hUnit:Number = (actualWidth - 2 * padding) / widest.relativeWidth;
			var vUnit:Number = (actualHeight - 2 * padding) / (rowCount + ((rowCount - 1) * currentLayout.verticalGap));
			
			// Loop through all rows of keys
			for (var i:uint = 0; i < rowCount; i++) {
				
				var row:KeyRow = keyboard.getChildAt(i) as KeyRow;
				
				// Position and size each key (keeping track of where we are with xPos)
				var xPos:Number = 0;
				for (var j:uint = 0; j < row.keys.length; j++) {
					
					var key:Key = row.keys[j];
					
					key.width = key.relativeWidth * hUnit;
					key.height = key.relativeHeight * vUnit;
					
					key.x = xPos;
					xPos += key.width + currentLayout.horizontalGap * hUnit;
					
				}
				
			}
			
			// Key rows are centered in a second stage because they do not all have the same width.
			for (var k:uint = 0; k < rowCount; k++) {
				var r:KeyRow = (keyboard.getChildAt(k) as KeyRow);
				r.x = ((width - 2 * padding) - r.width) / 2 + padding;
				r.y = ((key.height + currentLayout.verticalGap * vUnit) * k) + padding;
			}
			
			// Size background (if any is present)
			if (backgroundSkin) {
				backgroundSkin.width = width;
				backgroundSkin.height = height;
			}
			
		}
		
		/** @private */
		private function _getWidestRow(keyboard:Sprite):KeyRow {
			
			var widest:KeyRow = (keyboard.getChildAt(0) as KeyRow);
			
			for (var i:uint = 0; i < keyboard.numChildren; i++) {
				var row:KeyRow = keyboard.getChildAt(i) as KeyRow;
				if (row.relativeWidth > widest.relativeWidth) widest = row;
			}
			
			return widest;
			
		}
		
		/** @private */
		private function _changeCapsLockKeyStatus(highlight:Boolean = true):void {
			
			var config:Sprite = _configurations[_currentLayoutIndex];
			
			for (var i:uint = 0; i < config.numChildren; i++) {
				
				var keyRow:KeyRow = config.getChildAt(i) as KeyRow;
				
				// This allows for more than one capsLock keys on the same layout
				for each (var key:Key in keyRow.keys) {
					if (key.charCode == Keyboard.CAPS_LOCK) {
						key.isSelected = highlight;
					}
				}
				
			}
			
		}
		
		/** Indicates whether the caps lock key is currently activated (true) or not (false). */
		public function get capsLock():Boolean { 
			return _layouts[_currentLayoutIndex].capsLock;
		}

		/** @private  */
		public function set capsLock(value:Boolean):void {

			_layouts[_currentLayoutIndex].capsLock = value;
			
			if (value) {
				_changeKeyCase(TypographicCase.UPPERCASE);
			} else {
				_changeKeyCase(TypographicCase.LOWERCASE);
			}
			
			_changeCapsLockKeyStatus(value);
			
		}
		
		/** @private */
		private function _changeKeyCase(keyCase:String):void {
			
			var c:Sprite = _configurations[layoutIndex];
			
			for (var i:uint = 0; i < c.numChildren; i++) {
				var keyRow:KeyRow = c.getChildAt(i) as KeyRow;
				for each (var key:Key in keyRow.keys) key.changeCase(keyCase);
			}
			
		}
		
		/** A vector of all Layout objects assigned to the keyboard. */
		public function get layouts():Vector.<Layout> {
			return _layouts;
		}

		/** The index of the currently displayed layout from the <code>layouts</code> vector. */
		public function get layoutIndex():uint {
			return _currentLayoutIndex;
		}
		
		/** @private */
		public function set layoutIndex(value:uint):void {
			
			// Check if value is valid
			if (value >= layouts.length) {
				throw(new Error('Requested layout index is invalid.'));
				return;
			}
			
			// Remove previous configuration 
			_removeKeyListenersFromConfiguration(_configurations[layoutIndex]);
			removeChild(_configurations[layoutIndex]);
			
			// Add new one
			_currentLayoutIndex = value;
			addChild(_configurations[layoutIndex]);
			_addKeyListenersToConfiguration(_configurations[layoutIndex]);
			capsLock = _layouts[_currentLayoutIndex].capsLock;
			invalidate(INVALIDATION_FLAG_STATE);
			
		}

	}
	
}
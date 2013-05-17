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
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.text.TextFormat;
	import flash.text.engine.TypographicCase;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	
	import feathers.controls.Label;
	import feathers.core.FeathersControl;
	
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	
	/**
	 * Dispatched when a key is pressed down.
	 * 
	 * @eventType cc.cote.feathers.softkeyboard.KeyEvent.KEY_DOWN
	 */
	[Event(name="keyDown",type="cc.cote.feathers.softkeyboard.KeyEvent")]
	
	/**
	 * Dispatched when a the key is released. The release position must be above the key that was 
	 * initially pressed down otherwise the event is not fired. This allows the user to cancel the 
	 * <code>keyUp</code> event.
	 * 
	 * @eventType cc.cote.feathers.softkeyboard.KeyEvent.KEY_UP
	 */
	[Event(name="keyUp",type="cc.cote.feathers.softkeyboard.KeyEvent")]

	/**
	 * Dispatched when the variants for a key should be displayed.
	 * 
	 * @eventType cc.cote.feathers.softkeyboard.KeyEvent.SHOW_VARIANTS
	 */
	[Event(name="showVariants",type="cc.cote.feathers.softkeyboard.KeyEvent")]
	
	/**
	 * The <code>Key</code> class creates individual soft-keyboard keys to use in keyboard 
	 * <code>Layouts</code> and key collections. <code>Key</code> objects can be skinned through the
	 * standard use of a Feathers theme.
	 * 
	 * @see cc.cote.feathers.softkeyboard.layouts
	 * @see cc.cote.feathers.softkeyboard.keycollections
	 */
	public class Key extends FeathersControl
	{
		
		/** Constant associated with the text representation of the key up state */
		public static const UP_STATE:String = 'Up';
		
		/** Constant associated with the text representation of the key down state */
		public static const DOWN_STATE:String = 'Down';
		
		/** Constant associated with the text representation of the key hover state */
		public static const HOVER_STATE:String = 'Hover';
		
		/** Array of valid key states */
		public const AVAILABLE_STATES:Array = [UP_STATE, DOWN_STATE, HOVER_STATE];
		
		/** An identifier for regular alphanumeric character keys. */
		public static const CHARACTER_KEY:String = 'characterKey';
		
		/** An identifier for modifier keys. */
		public static const MODIFIER_KEY:String = 'modifierKey';
		
		/** An identifier for editing keys. */
		public static const EDITING_KEY:String = 'editingKey';
		
		/** An identifier for system keys. */
		public static const SYSTEM_KEY:String = 'systemKey';
		
		/** An identifier for navigation keys. */
		public static const NAVIGATION_KEY:String = 'navigationKey';
		
		/** An identifier for function keys. */
		public static const FUNCTION_KEY:String = 'functionKey';
		
		/** An identifier for numeric keypad keys. */
		public static const NUMERIC_KEYPAD_KEY:String = 'numericKeypadKey';
		
		/** An identifier for lock keys. */
		public static const LOCK_KEY:String = 'lockKey';
		
		/**  
		 * A layout (specified by its class) to switch to when the key is released. It is mostly 
		 * used with the <code>SWITCH_LAYOUT</code> key but also works with other keys.
		 */
		public var switchToLayoutClass:Class;
		
		/** 
		 * The number of milliseconds to wait after a key has been pressed before displaying the 
		 * variants (if any are available).
		 */
		public var keyVariantsDelay:uint = 150;
		
		/** 
		 * The key's icon (if any). Icons are usually reserved for 'special' keys such as: 
		 * CAPS_LOCK, ENTER, TAB, etc.
		 */
		public var icon:DisplayObject;
		
		/** The key's icon while in 'selected' state. */
		public var selectedIcon:DisplayObject;
		
		/** The skin to use for regular keys in the 'up' state. */
		public var regularKeyUpSkin:DisplayObject;

		/** The skin to use for regular keys in the 'hover' state. */
		public var regularKeyHoverSkin:DisplayObject;
		
		/** The skin to use for regular keys in the 'down' state. */
		public var regularKeyDownSkin:DisplayObject;
		
		/** The skin to use for special keys in the 'up' state. */
		public var specialKeyUpSkin:DisplayObject;

		/** The skin to use for special keys in the 'hover' state. */
		public var specialKeyHoverSkin:DisplayObject;

		/** The skin to use for special keys in the 'down' state. */
		public var specialKeyDownSkin:DisplayObject;

		/** The skin to use for keys that have variants, the 'up' state. */
		public var hasVariantsKeyUpSkin:DisplayObject;

		/** The skin to use for keys that have variants, in the 'hover' state. */
		public var hasVariantsKeyHoverSkin:DisplayObject;

		/** The skin to use for keys that have variants, in the 'hover' state. */
		public var hasVariantsKeyDownSkin:DisplayObject;
		
		private var _character:String;
		private var _charCode:int;
		private var _icon:DisplayObject;
		private var _isSelected:Boolean;
		private var _isVariant:Boolean = false;
		private var _label:Label;
		private var _relativeWidth:Number;
		private var _relativeHeight:Number;
		private var _skin:DisplayObject;
		private var _state:String;
		private var _type:String;
		private var _variants:Vector.<Key>;
		private var _variantsTimer:Timer;
		private var _variantsContainer:Sprite;

		/**
		 * Creates a new instance of the Key object.
		 * 
		 * @param charCode Character-code to assign to the key.
		 * @param variants A vector of <code>Keys</code> to use as variations of the main key. The 
		 * key variants are displayed when the user keeps its finger for a little while on a key. 
		 * For example, variants of the 'e' key could be 'é', 'è', 'ë', etc.
		 * @param type The type of key (CHARACTER_KEY, SYSTEM_KEY, etc.).
		 * @param label The textual label to display on the key.
		 * @param relativeWidth A ratio of the normal key width used to relatively enlarge or make a 
		 * key smaller. For example, if you wanted a key to be twice as wide as usual, you would 
		 * specify a relative width of 2.
		 * @param relativeHeight A ratio of the normal key height used to enlarge or make a key 
		 * smaller. For example, if you wanted a key to be twice as high as usual, you would specify 
		 * a relative height of 2.
		 * @param switchToClass A layout (specified by its class) to switch to when the key is 
		 * released. Only works with <code>SoftKeyboard.SWITCH_LAYOUT</code> keys.
		 */
		public function Key(
			charCode:int,
			variants:Vector.<Key> = null,
			type:String = 'characterKey',
			label:String = null, 
			relativeWidth:Number = 1,
			relativeHeight:Number = 1,
			switchToLayoutClass:Class = null
		) {

			// Keep parameters locally
			_charCode = charCode;
			_variants = variants;
			_type = type;
			_relativeWidth = relativeWidth;
			_relativeHeight = relativeHeight;
			this.switchToLayoutClass = switchToLayoutClass;
			
			// Flag each variant as such (if any)
			if (variants) {
				for each (var k:Key in variants) k.isVariant = true;
			}

			// If no label has been specified, use the character as the label (if printable and 
			// visible)
			_label = new Label();
			if (label) {
				_label.text = label;
			} else if (isPrintable && isVisible) {
				_character = String.fromCharCode(_charCode);
				_label.text = character;
			} else if (isPrintable) {
				_character = String.fromCharCode(_charCode);
			}
			
			// A string representation of the charCode is added to the nameList so keys can be 
			// styled individually (if needed). 
			nameList.add(String(charCode));
			
			// Modify the name list to reflect the fact that a key has variants
			if (variants) nameList.add('hasVariants');
			
			// If the key is the special SPACER type, hide it
			if (_charCode == CharCode.SPACER) visible = false;
			
		}
		
		/** @private */
		override protected function initialize():void {
			
			// This is for desktop usage and easier debugging
			useHandCursor = true;
			
			// If there are variants, prepare the timer and the container.
			if (_variants) {
				_variantsTimer = new Timer(keyVariantsDelay, 1);
				_variantsContainer = new Sprite();
			}
			
			// Assign icon (if any has been defined in the theme)
			if (icon) _icon = icon;
			
			// Assign default state. This also loads the appropriate skin (uses builtin default if 
			// none is available) 
			changeState(UP_STATE);
			addChild(_skin);
			
			// If an icon is specified, the label is made invisible
			if (_icon) {
				_label.visible = false;
				addChild(_icon);
			}
			addChild(_label);
			//if (variants) addChild(_variantsContainer);
			
			// If a TextFormat has been specified in the theme, use it. Otherwise, stick to the 
			// Feathers defaults.
			if (textFormat) _label.textRendererProperties.textFormat = textFormat;
			
			// Now that everything is ready, listen to touch events
			addEventListener(TouchEvent.TOUCH, _onTouch);
			addEventListener(Event.REMOVED_FROM_STAGE, _onRemovedFromStage);
			
		}
		
		/** @private */
		private function _onRemovedFromStage():void {
			
			if (_variantsTimer) {
				_variantsTimer.stop();
				if (_variantsTimer.hasEventListener(TimerEvent.TIMER_COMPLETE)) {
					_variantsTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, _onShowAlternates);
				}
			}
			
		}
		
		override public function dispose():void {
			
			if (_variantsTimer) {
				_variantsTimer.stop();
				if (_variantsTimer.hasEventListener(TimerEvent.TIMER_COMPLETE)) {
					_variantsTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, _onShowAlternates);
				}
			}
			
			removeEventListener(TouchEvent.TOUCH, _onTouch);
			removeEventListener(Event.REMOVED_FROM_STAGE, _onRemovedFromStage);
			
			super.dispose();
		}
		
		
		/** @private */
		override protected function draw():void {
			
//			if (_skin) {
				setSizeInternal(_skin.width, _skin.height, false);
				_skin.width = width;
				_skin.height = height;
//			} else {
//				setSizeInternal(44, 52, false);
//				_skin.width = 44;
//				_skin.height = 52;
//			}
			
			_label.validate();
			_label.width = _skin.width;
			_label.y = _skin.height / 2 - _label.height / 2;
			
			// If an icon has been defined, center it.
			if (_icon) {
				_icon.x = width / 2 - _icon.width / 2;
				_icon.y = height / 2 - _icon.height / 2;
			}
			
		}
		
		/**
		 * Changes the key's current state (which in turn will likely change its skin).
		 * 
		 * @param state The state to change to. Allowed states are defined in the 
		 * <code>AVAILABLE_STATES</code> constant array.
		 */
		public function changeState(state:String):void {
			
			// If the state is invalid or not being changed, abort!
			if (AVAILABLE_STATES.indexOf(state) == -1 || state == _state) return;
			_state = state;
			
			// Remove old skin
			var index:int = getChildIndex(_skin);
			if (index >= 0) removeChildAt(index);
			
			// Fetch new skin by using dynamic variable name
			if (isSpecial) {
				_skin = this['specialKey' + _state + 'Skin'];
			} else if (hasVariants) {
				_skin = this['hasVariantsKey' + _state + 'Skin'];
			} else {
				_skin = this['regularKey' + _state + 'Skin'];
			}
			
			// If the requested skin cannot be found, use the generic template
			if (!_skin) _skin = _buildGenericSkin();
			
			// Insert new skin
			addChildAt(_skin, 0);
			invalidate(INVALIDATION_FLAG_SKIN);
			
		}
		
		/** @private */
		private function _onTouch(e:TouchEvent):void {
			
			// Retrieve touch
			var touch:Touch = e.getTouch(this);
			
			// Check if the event is a MOUSE_OUT (which, in Starling, is a TouchEvent with no touch
			// object attached)
			if (!touch) {
				changeState(UP_STATE);
				return;
			}
			
			// Positions of the original touch and variants touch (if any)
			var touchPosInOriginalKeySpace:Point = touch.getLocation(this);
			var touchPosInAltKeySpace:Point;
			
			if (touch.phase == TouchPhase.BEGAN) {
				
				changeState(DOWN_STATE);
				
				// Trigger keyDown event (unless its the SWITCH_LAYOUT button which is ignored)				
				if (charCode != CharCode.SWITCH_LAYOUT) {
					_triggerEvent(this, KeyEvent.KEY_DOWN);
				}
				
				// Check if the key has variants attached to it
				if (variants) {
					_variantsTimer.start();
					_variantsTimer.addEventListener(TimerEvent.TIMER_COMPLETE, _onShowAlternates);
				}
				
			} else if (touch.phase == TouchPhase.HOVER) {
				
				// For mouse input only
				changeState(HOVER_STATE);
				
			} else if (touch.phase == TouchPhase.MOVED) { // Moving while pressing
			
				// Check if the user is staying over the original key when moving or not.
				if ( hitTest(touchPosInOriginalKeySpace, true) ) {
					changeState(DOWN_STATE);
					if (variants && !_variantsTimer.running) _variantsTimer.start();
				} else {
					changeState(UP_STATE);
					if (variants) _variantsTimer.reset();
				}
				
				// If the key has variants and the variants are currently being displayed, check if
				// one should be highlighted
				if (variants && _variantsContainer.numChildren > 0) {
					
					// Loop through all alternate keys to see if we are above one
					for each (var altKey:Key in variants) {
						
						touchPosInAltKeySpace = touch.getLocation(altKey);
						
						if ( altKey.hitTest(touchPosInAltKeySpace, true) ) {
							altKey.changeState(DOWN_STATE);
						} else {
							altKey.changeState(UP_STATE);
						}
						
					}
					
				}
				
				
			} else if (touch.phase == TouchPhase.ENDED) {
				
				if (variants) {
					
					// Reset
					_variantsTimer.removeEventListener(TimerEvent.TIMER, _onShowAlternates);
					_variantsTimer.reset();
					
					// Loop through all alternate keys to see if we are above one of them. If it's
					// the case, trigger event for that variant key
					for each (var altK:Key in variants) {
						
						touchPosInAltKeySpace = touch.getLocation(altK);
						
						if ( altK.hitTest(touchPosInAltKeySpace, true) ) {
							_triggerEvent(altK, KeyEvent.KEY_UP);
							altK.changeState(UP_STATE);
							break;
						}
					}
					
					// Empty the callout container when done.
					_variantsContainer.removeChildren();
					
				}
				
				// Abort if the release is outside the original key
				if ( !hitTest(touchPosInOriginalKeySpace, true) ) return;
				
				// Trigger event
				changeState(HOVER_STATE);
				_triggerEvent(this, KeyEvent.KEY_UP);
				
			}
			
		}
		
		/** @private */
		private function _triggerEvent(key:Key, type:String):void {
			
			// Trigger requested keyboard event
			var event:KeyEvent = new KeyEvent(
				type,
				key.charCode,
				key.character
			)
			dispatchEvent(event);
			
		}
		
		/** @private */
		private function _onShowAlternates(e:TimerEvent):void {

			// Place variants in the container
			var pos:Point = new Point();
			for each (var altKey:Key in variants) {
				_variantsContainer.addChild(altKey);
				altKey.x = pos.x;
				altKey.width = width;
				altKey.height = height;
				pos.x += altKey.width + 5;
			}
			
			// Dispatch event
			var event:Event = new KeyEvent(
				KeyEvent.SHOW_VARIANTS, 
				charCode,
				character
			)
			dispatchEvent(event);
			
		}
		
		/**
		 * Changes the case of the character, label and variants of the key. This only affects keys 
		 * whose <code>isVisible</code> property return <code>true</code>.
		 * 
		 * @param keyCase Desired case: <code>TypographicCase.UPPERCASE</code> or 
		 * <code>TypographicCase.LOWERCASE</code>.
		 */
		public function changeCase(keyCase:String):void {
			
			if (keyCase == TypographicCase.UPPERCASE) {
				uppercase();
			} else if (keyCase == TypographicCase.LOWERCASE) {
				lowercase();
			}
			
		}
		
		/**
		 * Uppercases the character, label and variants of the key. This only affects keys whose 
		 * <code>isVisible</code> property return <code>true</code>.
		 */		
		public function uppercase():void {
			
			if (isVisible) {
				_label.text = _label.text.toLocaleUpperCase();
				_character = character.toLocaleUpperCase();
				_charCode = _character.charCodeAt();
				
				for each (var k:Key in _variants) {
					if (k.isVisible) k.uppercase();
				}
			}
			
		}
		
		/**
		 * Lowercases the character, label and variants of the key. This only affects keys whose 
		 * <code>isVisible</code> property return <code>true</code>.
		 */
		public function lowercase():void {
			
			if (isVisible) {
				_label.text = _label.text.toLocaleLowerCase();
				_character = character.toLocaleLowerCase();				
				_charCode = _character.charCodeAt();
				
				for each (var k:Key in _variants) {
					if (k.isVisible) k.lowercase();
				}
			}
			
		}
		
		/** @private */
		private function _buildGenericSkin():DisplayObject {
			
			// Temporarily draw into a Shape object
			var canvas:Shape = new Shape();
			canvas.graphics.beginFill(0x666666);
			canvas.graphics.drawRect(0, 0, 44, 52);
			canvas.graphics.endFill();
			
			// Create a texture from the Shape object and return it
			var bmd:BitmapData = new BitmapData(44, 52);
			bmd.draw(canvas);
			var texture:Texture = Texture.fromBitmapData(bmd);
			return new Image(texture);
			
		}
		
		/** Relative width of the key expressed as a ratio of the default key width. */
		public function get relativeWidth():Number { 
			return _relativeWidth; 
		}
		
		/** Relative height of the key expressed as a ratio of the default key height. */
		public function get relativeHeight():Number { 
			return _relativeHeight; 
		}	

		/** The type of key (character, navigation, modifier, etc.). */
		public function get type():String { 
			return _type; 
		}

		/** Vector of keys accessible by pressing and holding the key. */
		public function get variants():Vector.<Key> {
			return _variants;
		}

		/** The single character associated to the key. */
		public function get character():String {
			return _character;
		}

		/** The character code of the key. */
		public function get charCode():uint {
			return _charCode;
		}

		/** 
		 * Indicates if the key is associated with a printable character. Printable characters 
		 * include all letters, numbers and symbols as well as the ENTER, SPACE and TAB keys.
		 */
		public function get isPrintable():Boolean {
			return (
				type == CHARACTER_KEY || 
				type == NUMERIC_KEYPAD_KEY ||
				_charCode == Keyboard.ENTER ||
				_charCode == Keyboard.TAB
			);
		}
		
		/** 
		 * Indicates if the key is associated with a visible character. Visible characters include 
		 * all letters, numbers and symbols.
		 */
		public function get isVisible():Boolean {
			return (
				(type == CHARACTER_KEY || type == NUMERIC_KEYPAD_KEY) 
				&&
				!(_charCode == Keyboard.ENTER || _charCode == Keyboard.TAB || _charCode == Keyboard.SPACE)
			);
		}

		/**
		 * Indicates if the key is 'selected'. The selected state is currently only used for the
		 * <code>CAPS_LOCK</code> key. When the <code>CAPS_LOCK</code> is engaged, a different icon
		 * is shown.
		 */
		public function get isSelected():Boolean {
			return _isSelected;
		}
		
		/** @private */
		public function set isSelected(value:Boolean):void {
			
			if (value == _isSelected) return;
			_isSelected = value;
			
			// Swap icon (if an appropriate one has been defined)
			if ( (_isSelected && selectedIcon) || (!_isSelected && icon) ) {
				
				var index:uint = getChildIndex(_icon);
				_icon = _isSelected ? selectedIcon : icon;
				removeChildAt(index);
				addChildAt(_icon, index);
				invalidate(INVALIDATION_FLAG_SKIN);
				
			}
			
		}
		
		/**
		 * Indicates if the key is 'special'. A 'special' key is any key that is not a regular 
		 * alpha-numeric character or the space character key.
		 */
		public function get isSpecial():Boolean {
			return (type != CHARACTER_KEY);
		}
		
		/** The current TextFormat object used for the key's label rendering */
		public function get textFormat():TextFormat {
			return _label.textRendererProperties.textFormat;
		}
	
		/** @private */
		public function set textFormat(value:TextFormat):void {
			_label.textRendererProperties.textFormat = value;
		}

		/** Indicates whether the key is a variant key (true) or a primary key (false) */
		public function get isVariant():Boolean {
			return _isVariant;
		}
		
		/** @private */
		public function set isVariant(value:Boolean):void {
			_isVariant = value;
		}	

		/** Indicates whether the key is a variant key (true) or a primary key (false) */
		public function get hasVariants():Boolean {
			return Boolean(_variants);
		}

		public function get variantsContainer():Sprite {
			return _variantsContainer;
		}


	}
	
}
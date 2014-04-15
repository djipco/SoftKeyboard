package 
{

	import flash.display.Bitmap;
	import flash.geom.Rectangle;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	
	import cc.cote.feathers.softkeyboard.CharCode;
	import cc.cote.feathers.softkeyboard.Key;
	import cc.cote.feathers.softkeyboard.SoftKeyboard;
	
	import feathers.controls.Callout;
	import feathers.controls.Label;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.DisplayListWatcher;
	import feathers.core.FeathersControl;
	import feathers.core.ITextRenderer;
	import feathers.display.Scale9Image;
	import feathers.textures.Scale9Textures;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.textures.Texture;
	
	public class Theme extends DisplayListWatcher
	{
		
		/**
		 * Embed all skins, icons and fonts necessary to skin the SoftKeyboard component.
		 */
		[Embed(source="assets/SoftKeyboardKeySkinRegularUp.png")]
		public static const SoftKeyboardKeySkinRegularUp:Class;
		
		[Embed(source="assets/SoftKeyboardKeySkinRegularHover.png")]
		public static const SoftKeyboardKeySkinRegularHover:Class;
		
		[Embed(source="assets/SoftKeyboardKeySkinRegularDown.png")]
		public static const SoftKeyboardKeySkinRegularDown:Class;
		
		[Embed(source="assets/SoftKeyboardKeySkinSpecialUp.png")]
		public static const SoftKeyboardKeySkinSpecialUp:Class;
		
		[Embed(source="assets/SoftKeyboardKeySkinSpecialHover.png")]
		public static const SoftKeyboardKeySkinSpecialHover:Class;
		
		[Embed(source="assets/SoftKeyboardKeySkinSpecialDown.png")]
		public static const SoftKeyboardKeySkinSpecialDown:Class;
		
		[Embed(source="assets/SoftKeyboardKeySkinHasVariantsUp.png")]
		public static const SoftKeyboardKeySkinHasVariantsUp:Class;
		
		[Embed(source="assets/SoftKeyboardKeySkinHasVariantsHover.png")]
		public static const SoftKeyboardKeySkinHasVariantsHover:Class;
		
		[Embed(source="assets/SoftKeyboardKeySkinHasVariantsDown.png")]
		public static const SoftKeyboardKeySkinHasVariantsDown:Class;

		[Embed(source="assets/SoftKeyboardIconBackspace.png")]
		public static const SoftKeyboardIconBackspace:Class;
		
		[Embed(source="assets/SoftKeyboardIconCapsLock.png")]
		public static const SoftKeyboardIconCapsLock:Class;
		
		[Embed(source="assets/SoftKeyboardIconCapsLockSelected.png")]
		public static const SoftKeyboardIconCapsLockSelected:Class;
		
		[Embed(source="assets/SoftKeyboardIconEnter.png")]
		public static const SoftKeyboardIconEnter:Class;
		
		[Embed(source="assets/SoftKeyboardIconTab.png")]
		public static const SoftKeyboardIconTab:Class;
		
		[Embed(source="assets/SoftKeyboardCalloutBackground.png")]
		public static const SoftKeyboardCalloutBackground:Class;
		
		[Embed(source="assets/SoftKeyboardCalloutRightArrow.png")]
		public static const SoftKeyboardCalloutRightArrow:Class;
		
		[Embed(source="assets/SoftKeyboardCalloutLeftArrow.png")]
		public static const SoftKeyboardCalloutLeftArrow:Class;
		
		[Embed(source="assets/SoftKeyboardCalloutTopArrow.png")]
		public static const SoftKeyboardCalloutTopArrow:Class;
		
		[Embed(source="assets/SoftKeyboardCalloutBottomArrow.png")]
		public static const SoftKeyboardCalloutBottomArrow:Class;
		
		[Embed(source="assets/SoftKeyboardGlobalBackground.png")]
		public static const SoftKeyboardGlobalBackground:Class;
		
		/**
		 * Define a text format to use for the key labels.
		 */
		public var keyLabelTextFormat:TextFormat = new TextFormat(
			'_sans', 				// font
			16,						// size (in pixels)
			0xFFFFFF,		 		// color
			true, 					// bold
			false, 					// italic
			false, 					// underline
			null, 					// url
			null, 					// target window (html)
			TextFormatAlign.CENTER,	// alignement
			null, 					// left margin
			null, 					// right margin
			null, 					// indent
			null 					// leading (extra space between lines)
		);
		
		/** 
		 * Instantiates a new feathers theme which will be actively monitoring the Starling stage 
		 * and skinning components as they are added to it.
		 */		
		public function Theme(root:DisplayObject) {
			
			super(root as DisplayObjectContainer);
			
			// Here we use the TextFieldTextRenderer but you could also use the BitmapTextRenderer
			FeathersControl.defaultTextRendererFactory = function():ITextRenderer {
				var tfr:TextFieldTextRenderer = new TextFieldTextRenderer();
				return tfr;
			};
			
			// Assign skinning initializers for the 4 elements that can be skinned : SoftKeyboard 
			// (the overall keyboard), Key (each individual key), Key label (only the label 
			// belonging to a SoftKeyboard Key object) and Callout (the key variants pop-up).
			setInitializerForClass(SoftKeyboard, _softKeyboard);
			setInitializerForClass(Key, _key);
			setInitializerForClass(Label, _softkeyboardKeyLabel, Key.SOFTKEYBOARD_KEY_LABEL);
			setInitializerForClass(Callout, _callout);
			
		}
		
		/** Initializer for the Key subcomponent */
		private function _key(k:Key):void {
			
			// Assign regular key skins
			k.regularKeyUpSkin = Theme.getScale9Image(SoftKeyboardKeySkinRegularUp, 5, 5);
			k.regularKeyHoverSkin = Theme.getScale9Image(SoftKeyboardKeySkinRegularHover, 5, 5);
			k.regularKeyDownSkin = Theme.getScale9Image(SoftKeyboardKeySkinRegularDown, 5, 5);
			
			// Assign special key skins
			k.specialKeyUpSkin = Theme.getScale9Image(SoftKeyboardKeySkinSpecialUp, 5, 5);
			k.specialKeyHoverSkin = Theme.getScale9Image(SoftKeyboardKeySkinSpecialHover, 5, 5);
			k.specialKeyDownSkin = Theme.getScale9Image(SoftKeyboardKeySkinSpecialDown, 5, 5);
			
			// Assign skins for key that have variants
			k.hasVariantsKeyUpSkin = Theme.getScale9Image(SoftKeyboardKeySkinHasVariantsUp, 5, 5);
			k.hasVariantsKeyHoverSkin = Theme.getScale9Image(SoftKeyboardKeySkinHasVariantsHover, 5, 5);
			k.hasVariantsKeyDownSkin = Theme.getScale9Image(SoftKeyboardKeySkinHasVariantsDown, 5, 5);
			
			// Assign icons to special keys
			if (k.charCode == CharCode.NUM_LOCK) 	k.icon = Theme.getImage(SoftKeyboardIconBackspace);
			if (k.charCode == CharCode.BACKSPACE) 	k.icon = Theme.getImage(SoftKeyboardIconBackspace);
			if (k.charCode == CharCode.RETURN) 		k.icon = Theme.getImage(SoftKeyboardIconEnter);
			if (k.charCode == CharCode.TAB) 		k.icon = Theme.getImage(SoftKeyboardIconTab);
			
			if (k.charCode == CharCode.CAPS_LOCK) {
				k.icon = Theme.getImage(SoftKeyboardIconCapsLock);
				k.selectedIcon = Theme.getImage(SoftKeyboardIconCapsLockSelected);
			}
			
		}
		
		private function _softkeyboardKeyLabel(l:Label):void {

			l.textRendererProperties.textFormat = keyLabelTextFormat;
			
			// Example: if you want to style the letter 'M' differently
//			if (l.nameList.contains('M')) {
//				l.textRendererProperties.textFormat = new TextFormat('_sans', 22, 0xFF0000);
//			}
			
		}
		
		/** Initializer for the Callout component */
		public function _callout(c:Callout):void {
			c.backgroundSkin = Theme.getScale9Image(SoftKeyboardCalloutBackground, 15, 15);
			
			c.topArrowSkin = Theme.getScale9Image(SoftKeyboardCalloutTopArrow, 15, 15);
			c.rightArrowSkin = Theme.getScale9Image(SoftKeyboardCalloutRightArrow, 15, 15);
			c.bottomArrowSkin = Theme.getScale9Image(SoftKeyboardCalloutBottomArrow, 15, 15);
			c.leftArrowSkin = Theme.getScale9Image(SoftKeyboardCalloutLeftArrow, 15, 15);
			
			c.paddingLeft = 8;
			c.paddingRight = 12;
			c.paddingTop = 7;
			c.paddingBottom = 12;
			
			c.bottomArrowGap = c.topArrowGap = c.leftArrowGap = c.rightArrowGap = -2;
		}
		
		private function _softKeyboard(s:SoftKeyboard):void {
			s.backgroundSkin = Theme.getScale9Image(SoftKeyboardGlobalBackground, 15, 15);
			s.padding = 10;
		}
		
		
		
		
		
		
		
		
		/************** BELOW ARE UTILITY METHODS FOR WORKING WITH IMAGES & TEXTURES **************/
		
		/** Dictionary to store the textures as they are created during runtime */
		private static var _textures:Dictionary = new Dictionary;
		
		/**
		 * Returns a texture matching the specified class.
		 * @param source The class from which to fetch the textures
		 */
		public static function getTexture(source:Class):Texture {
			
			var qName:String = getQualifiedClassName(source);
			
			if (!_textures[qName]) {
				var bitmap:Bitmap = new source();
				_textures[qName] = Texture.fromBitmap(bitmap);
			}
			return _textures[qName];
			
		}
		
		/**
		 * Returns an image built from the texture associated to the class passed as a parameter.
		 * @param source Class associated to the embedded asset
		 */
		public static function getImage(source:Class):Image {
			return new Image(Theme.getTexture(source));
		}
		
		/**
		 * Returns a Scale9Image object from the specified texture name and class
		 * @param name Texture name
		 * @param rect Stretching rectangle
		 */
		public static function getScale9Image(source:Class, 
											  staticWidth:Number = 25, 
											  staticHeight:Number = 25):Scale9Image {
			
			var texture:Texture = Theme.getTexture(source);
			
			var rect:Rectangle = new Rectangle(
				staticWidth, 
				staticHeight, 
				texture.width - 2 * staticWidth,
				texture.height - 2 * staticHeight
			)
			
			var s9Textures:Scale9Textures = new Scale9Textures(texture, rect);
			return new Scale9Image(s9Textures);
			
		}
		
	}
	
}

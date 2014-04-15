/*

Copyright (c) 2013-2014, Jean-Philippe Côté (www.cote.cc)
All rights reserved.

This library is provided "as is" with no guarantees whatsoever. Use it at your own risk.

*/

package cc.cote.feathers.softkeyboard
{
	import flash.utils.getQualifiedClassName;
	
	import starling.events.Event;
	import starling.utils.formatString;
	
	/** 
	 * A <code>KeyEvent</code> object is dispatched in response to a user pressing or releasing one 
	 * of the keys on a <code>SoftKeyboard</code> object. Please note that this object inherits 
	 * properties and methods from <code>starling.events.event</code>. You will have to look up 
	 * <a href="http://doc.starling-framework.org/" target="blank">Starling's API documentation</a> 
	 * for those inherited elements.
	 * 
	 * @see cc.cote.feathers.softkeyboard.SoftKeyboard
	 * @see http://doc.starling-framework.org/ Starling API documentation
	 */  
	public class KeyEvent extends Event
	{
		
		/** 
		 * The <code>KEY_UP</code> constant defines the value of the <code>type</code> property of a 
		 * <code>keyUp</code> event object.
		 * 
		 * @eventType cc.cote.feathers.softkeyboard.KeyEvent.keyUp
		 */
		public static const KEY_UP:String = "cc.cote.feathers.softkeyboard.KeyEvent.keyUp";
		
		/** 
		 * The <code>KEY_DOWN</code> constant defines the value of the <code>type</code> property of 
		 * a <code>keyDown</code> event object.
		 * 
		 * @eventType cc.cote.feathers.softkeyboard.KeyEvent.keyDown
		 */
		public static const KEY_DOWN:String = "cc.cote.feathers.softkeyboard.KeyEvent.keyDown";
		
		/** 
		 * The <code>SHOW_VARIANTS</code> constant defines the value of the <code>type</code> 
		 * property of a <code>showVariants</code> event object.
		 * 
		 * @eventType cc.cote.feathers.softkeyboard.KeyEvent.showVariants
		 */
		public static const SHOW_VARIANTS:String = "cc.cote.feathers.softkeyboard.KeyEvent.showVariants";
		
		private var _char:String;
		private var _charCode:uint;
		
		/**
		 * Creates a new <code>SoftKeyboardEvent</code> object.
		 * 
		 * @param type Type of the event
		 * @param charCode The code of the character associated to the key that triggered the event.
		 * @param char The actual printable character associated to the key that triggered the event.
		 * @param data Arbitrary data to pass along with the event
		 */
		public function KeyEvent(
			type:String, 
			charCode:uint, 
			char:String = null,
			data:Object = null
		) {

			super(type, false, data);
			_charCode = charCode;
			_char = char;
			
		}
		
		/** 
		 * Returns a textual description of the event (useful in debugging situations).
		 */
		override public function toString():String {
			
			return formatString(
				'[{0} type="{1}" char="{2}" charCode={3} bubbles={4}]', 
				getQualifiedClassName(this).split("::").pop(), 
				type,
				char,
				charCode,
				bubbles
			);
			
		}

		/** 
		 * The actual printable character associated to the key that triggered the event. The value 
		 * for non-printable characters will be <code>null</code>.
		 */
		public function get char():String {
			return _char;
		}

		/** 
		 * The code of the character associated to the key that triggered the event. Many basic 
		 * characters have constants defined for them in the <code>CharCode</code> class. For others, 
		 * use Unicode as a base reference.
		 * 
		 * @see cc.cote.feathers.softkeyboard.CharCode
		 * @see http://www.unicode.org/charts/
		 */
		public function get charCode():uint {
			return _charCode;
		}
		
	}
	
}
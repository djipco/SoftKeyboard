/*

Copyright (c) 2013-2014, Jean-Philippe Côté (www.cote.cc)
All rights reserved.

This library is provided "as is" with no guarantees whatsoever. Use it at your own risk.

*/

package cc.cote.feathers.softkeyboard.layouts
{
	import cc.cote.feathers.softkeyboard.CharCode;
	import cc.cote.feathers.softkeyboard.Key;
	
	/**
	 * The <code>EmailNumbersSymbolsSwitch</code> class defines a keyboard layout containing all 10 
	 * digits and the symbols allowed in email addresses. It also features a 
	 * <code>SWITCH_LAYOUT</code> key.
	 * 
	 * <p>The referencee used to determine which symbols should be included is the following: 
	 * http://en.wikipedia.org/wiki/E-mail_address#RFC_specification</p>
	 */
	public class EmailNumbersSymbolsSwitch extends Layout
	{
		
		/** The label to use on <code>SWITCH_LAYOUT</code> keys pointing to this layout. */
		public static const SWITCH_KEY_LABEL:String = '123 &+$';
		
		/** 
		 * Creates a new EmailNumbersSymbolsSwitch object.
		 * 
		 * @param switchKeyClass The class to use with the <code>SWITCH_KEY</code> defined by this
		 * layout.
		 */
		public function EmailNumbersSymbolsSwitch(switchKeyClass:Class):void {
			
			// Define all rows of keys for that layout
			rows = new <Vector.<Key>>[
				new <Key>[
					new Key(CharCode.DIGIT_1),
					new Key(CharCode.DIGIT_2),
					new Key(CharCode.DIGIT_3),
					new Key(CharCode.DIGIT_4),
					new Key(CharCode.DIGIT_5),
					new Key(CharCode.DIGIT_6),
					new Key(CharCode.DIGIT_7),
					new Key(CharCode.DIGIT_8),
					new Key(CharCode.DIGIT_9),
					new Key(CharCode.DIGIT_0),
					new Key(CharCode.BACKSPACE, null, Key.EDITING_KEY, 'BACKSPACE', 2.5)
				],
				new <Key>[
					new Key(CharCode.HYPHEN),
					new Key(CharCode.UNDERSCORE),
					new Key(CharCode.PLUS),
					new Key(CharCode.EQUAL),
					new Key(CharCode.SLASH),
					new Key(CharCode.TILDE),
					new Key(CharCode.LEFT_BRACE), 
					new Key(CharCode.RIGHT_BRACE),
					new Key(CharCode.DOLLAR),
					new Key(CharCode.AMPERSAND),
					new Key(CharCode.BACKTICK),
					new Key(CharCode.CIRCUMFLEX_ACCENT)
				],
				new <Key>[
					new Key(CharCode.AT_SIGN),
					new Key(CharCode.PIPE),
					new Key(CharCode.QUESTION_MARK),
					new Key(CharCode.EXCLAMATION_MARK),
					new Key(CharCode.HASH),
					new Key(CharCode.PERCENT),
					new Key(CharCode.ASTERISK),
					new Key(CharCode.APOSTROPHE),
					new Key(CharCode.PERIOD),
					new Key(CharCode.SWITCH_LAYOUT, null, Key.SYSTEM_KEY, switchKeyClass.SWITCH_KEY_LABEL, 2.5, 1, switchKeyClass)
				]
			];
			
		}					
		
	}
	
}


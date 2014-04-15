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
	 * The <code>Email</code> class defines a basic qwerty-inspired keyboard layout specially 
	 * designed for email address entry.
	 */
	public class EmailSwitch extends Layout
	{
		
		/** The label to use on <code>SWITCH_LAYOUT</code> keys pointing to this layout. */
		public static const SWITCH_KEY_LABEL:String = 'ABC';
		
		/** 
		 * Creates a new Email object.
		 */
		public function EmailSwitch(switchKeyClass:Class):void {
				
			// Define all rows of keys for that layout
			rows = new <Vector.<Key>>[
				new <Key>[
					new Key(CharCode.UPPERCASE_Q),
					new Key(CharCode.UPPERCASE_W),
					new Key(CharCode.UPPERCASE_E),
					new Key(CharCode.UPPERCASE_R),
					new Key(CharCode.UPPERCASE_T),
					new Key(CharCode.UPPERCASE_Y),
					new Key(CharCode.UPPERCASE_U),
					new Key(CharCode.UPPERCASE_I),
					new Key(CharCode.UPPERCASE_O),
					new Key(CharCode.UPPERCASE_P),
					new Key(CharCode.BACKSPACE, null, Key.EDITING_KEY, 'BACKSPACE', 2.5)
				],
				new <Key>[
					new Key(CharCode.UPPERCASE_A),
					new Key(CharCode.UPPERCASE_S),
					new Key(CharCode.UPPERCASE_D),
					new Key(CharCode.UPPERCASE_F),
					new Key(CharCode.UPPERCASE_G),
					new Key(CharCode.UPPERCASE_H),
					new Key(CharCode.UPPERCASE_J),
					new Key(CharCode.UPPERCASE_K),
					new Key(CharCode.UPPERCASE_L),
					new Key(CharCode.CAPS_LOCK, null, Key.SYSTEM_KEY, 'CAPSLOCK', 2)
				],
				new <Key>[
					new Key(CharCode.AT_SIGN),
					new Key(CharCode.UPPERCASE_Z),
					new Key(CharCode.UPPERCASE_X),
					new Key(CharCode.UPPERCASE_C),
					new Key(CharCode.UPPERCASE_V),
					new Key(CharCode.UPPERCASE_B),
					new Key(CharCode.UPPERCASE_N),
					new Key(CharCode.UPPERCASE_M),
					new Key(CharCode.PERIOD),
					new Key(CharCode.SWITCH_LAYOUT, null, Key.SYSTEM_KEY, switchKeyClass.SWITCH_KEY_LABEL, 2.5, 1, switchKeyClass)
				]
			];
			
		}					
		
	}
	
}


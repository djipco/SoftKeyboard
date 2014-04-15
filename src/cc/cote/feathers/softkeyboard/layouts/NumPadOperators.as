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
	 * The <code>NumPadOperators</code> class defines a numpad-style keypad with operators.
	 */
	public class NumPadOperators extends Layout
	{
		
		/** The label to use on <code>SWITCH_LAYOUT</code> keys pointing to this layout. */
		public static const SWITCH_KEY_LABEL:String = '123';
		
		/** 
		 * Creates a new NumPadOperators object.
		 */
		public function NumPadOperators():void {
			
			verticalGap = .2;
			
			// Define all rows of keys for that layout
			rows = new <Vector.<Key>>[
				new <Key>[
					new Key(CharCode.NUM_LOCK, null, Key.LOCK_KEY, 'NUMLOCK'),
					new Key(CharCode.EQUAL),
					new Key(CharCode.SLASH),
					new Key(CharCode.ASTERISK)
				],
				new <Key>[
					new Key(CharCode.DIGIT_7),
					new Key(CharCode.DIGIT_8),
					new Key(CharCode.DIGIT_9),
					new Key(CharCode.MINUS)
				],
				new <Key>[
					new Key(CharCode.DIGIT_4),
					new Key(CharCode.DIGIT_5),
					new Key(CharCode.DIGIT_6),
					new Key(CharCode.PLUS)
				],
				new <Key>[
					new Key(CharCode.DIGIT_1),
					new Key(CharCode.DIGIT_2),
					new Key(CharCode.DIGIT_3),
					new Key(CharCode.SPACER),
				],
				new <Key>[
					new Key(CharCode.DIGIT_0, null, Key.CHARACTER_KEY, null, 2.1),
					new Key(CharCode.PERIOD),
					new Key(CharCode.ENTER, null, Key.EDITING_KEY)
				]
			];
			
		}					
		
	}
	
}


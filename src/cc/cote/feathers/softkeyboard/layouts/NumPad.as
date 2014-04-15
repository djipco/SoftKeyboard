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
	 * The <code>NumPad</code> class defines a numpad-style keypad.
	 */
	public class NumPad extends Layout
	{
		
		/** The label to use on <code>SWITCH_LAYOUT</code> keys pointing to this layout. */
		public static const SWITCH_KEY_LABEL:String = '123';
		
		/** 
		 * Creates a new NumPad object.
		 */
		public function NumPad():void {
			
			verticalGap = .2;
			
			// Define all rows of keys for that layout
			rows = new <Vector.<Key>>[
				new <Key>[
					new Key(CharCode.DIGIT_7),
					new Key(CharCode.DIGIT_8),
					new Key(CharCode.DIGIT_9)
				],
				new <Key>[
					new Key(CharCode.DIGIT_4),
					new Key(CharCode.DIGIT_5),
					new Key(CharCode.DIGIT_6)
				],
				new <Key>[
					new Key(CharCode.DIGIT_1),
					new Key(CharCode.DIGIT_2),
					new Key(CharCode.DIGIT_3)
				],
				new <Key>[
					new Key(CharCode.DIGIT_0, null, Key.CHARACTER_KEY, null, 2.1),
					new Key(CharCode.PERIOD)
				]
			];
			
		}					
		
	}
	
}


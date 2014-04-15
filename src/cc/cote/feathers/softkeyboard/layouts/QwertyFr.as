/*

Copyright (c) 2013-2014, Jean-Philippe Côté (www.cote.cc)
All rights reserved.

This library is provided "as is" with no guarantees whatsoever. Use it at your own risk.

*/

package cc.cote.feathers.softkeyboard.layouts
{
	import cc.cote.feathers.softkeyboard.CharCode;
	import cc.cote.feathers.softkeyboard.Key;
	import cc.cote.feathers.softkeyboard.keycollections.FrenchKeyVariants;
	
	/**
	 * The <code>QwertyFr</code> class defines a qwerty-inspired keyboard layout including the most 
	 * useful key variants in a French context.
	 */
	public class QwertyFr extends Layout
	{
		
		/** The label to use on <code>SWITCH_LAYOUT</code> keys pointing to this layout. */
		public static const SWITCH_KEY_LABEL:String = 'ABC';
		
		/** 
		 * Creates a new QwertyFr object.
		 */
		public function QwertyFr():void {
			
			// Define all rows of keys for that layout
			rows = new <Vector.<Key>>[
				new <Key>[
					new Key(CharCode.UPPERCASE_Q),
					new Key(CharCode.UPPERCASE_W),
					new Key(CharCode.UPPERCASE_E, FrenchKeyVariants.E),
					new Key(CharCode.UPPERCASE_R),
					new Key(CharCode.UPPERCASE_T, FrenchKeyVariants.T),
					new Key(CharCode.UPPERCASE_Y, FrenchKeyVariants.Y),
					new Key(CharCode.UPPERCASE_U, FrenchKeyVariants.U),
					new Key(CharCode.UPPERCASE_I, FrenchKeyVariants.I),
					new Key(CharCode.UPPERCASE_O, FrenchKeyVariants.O),
					new Key(CharCode.UPPERCASE_P)
				],
				new <Key>[
					new Key(CharCode.TAB, null, Key.NAVIGATION_KEY, null, 1.55),
					new Key(CharCode.UPPERCASE_A, FrenchKeyVariants.A),
					new Key(CharCode.UPPERCASE_S, FrenchKeyVariants.S),
					new Key(CharCode.UPPERCASE_D),
					new Key(CharCode.UPPERCASE_F),
					new Key(CharCode.UPPERCASE_G),
					new Key(CharCode.UPPERCASE_H),
					new Key(CharCode.UPPERCASE_J),
					new Key(CharCode.UPPERCASE_K),
					new Key(CharCode.UPPERCASE_L)
				],
				new <Key>[
					new Key(CharCode.CAPS_LOCK, null, Key.SYSTEM_KEY, null, 1.55),
					new Key(CharCode.UPPERCASE_Z, FrenchKeyVariants.Z),
					new Key(CharCode.UPPERCASE_X),
					new Key(CharCode.UPPERCASE_C, FrenchKeyVariants.C),
					new Key(CharCode.UPPERCASE_V),
					new Key(CharCode.UPPERCASE_B),
					new Key(CharCode.UPPERCASE_N, FrenchKeyVariants.N),
					new Key(CharCode.UPPERCASE_M),
					new Key(CharCode.BACKSPACE, null, Key.EDITING_KEY, '', 1.55)
				],
				new <Key>[
					new Key(CharCode.SPACE, null, Key.CHARACTER_KEY, '', 8),
					new Key(CharCode.RETURN, null, Key.EDITING_KEY, '', 1.55)
				]
			];
			
		}					
		
	}
	
}
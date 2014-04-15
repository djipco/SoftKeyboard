/*

Copyright (c) 2013-2014, Jean-Philippe Côté (www.cote.cc)
All rights reserved.

This library is provided "as is" with no guarantees whatsoever. Use it at your own risk.

*/

package cc.cote.feathers.softkeyboard
{
	
	/**
	 * The <code>CharCode</code> class is an enumeration class containing constants associated to 
	 * common characters or keys. Each constant contains the <code>charCode</code> value of the 
	 * character in question. All ASCII characters are currently included as well as codes for the 
	 * special <code>SWITCH_LAYOUT</code>, <code>DONE</code> and <code>SPACER</code> keys.
	 * 
	 * <p>These constants are particularly useful when building <code>Layout</code> classes and key 
	 * collections or when checking input received in a <code>KeyEvent</code> object.</p>
	 * 
	 * @see cc.cote.feathers.softkeyboard.layouts
	 * @see cc.cote.feathers.softkeyboard.keycollections
	 */
	public class CharCode
	{
		
		/** Constant associated with the character code value for the special <code>SWITCH_LAYOUT</code> key. */
		public static const SWITCH_LAYOUT:int = -1;
		
		/** Constant associated with the character code value for the special <code>DONE</code> key. */
		public static const DONE:int = -2;
		
		/** Constant associated with the character code value for the special <code>SPACER</code> key. */
		public static const SPACER:int = -3;
		
		/** Constant associated with the character code value for the <code>BACKSPACE</code> key. */
		public static const BACKSPACE:int = 8;
		
		/** Constant associated with the character code value for the <code>TAB</code> key. */
		public static const TAB:int = 9;
		
		/** Constant associated with the character code value for the <code>ENTER/RETURN</code> key. */
		public static const RETURN:int = 13;
		
		/** Constant associated with the character code value for the <code>ENTER/RETURN</code> key. */
		public static const ENTER:int = RETURN;
		
		/** Constant associated with the character code value for the <code>SHIFT</code> key. */
		public static const SHIFT:int = 16;
		
		/** Constant associated with the character code value for the <code>CONTROL</code> key. */
		public static const CONTROL:int = 17;
		
		/** Constant associated with the character code value for the <code>PAUSE_BREAK</code> key. */
		public static const PAUSE_BREAK:int = 19;
		
		/** Constant associated with the character code value for the <code>CAPS_LOCK</code> key. */
		public static const CAPS_LOCK:int = 20;
		
		/** Constant associated with the character code value for the <code>ESCAPE</code> key. */
		public static const ESCAPE:int = 27;

		/** Constant associated with the character code value for the <code>SPACE</code> character. */
		public static const SPACE:int = 32;
		
		/** Constant associated with the character code value for the <code>!</code> character. */
		public static const EXCLAMATION_MARK:int = 33;
		
		/** Constant associated with the character code value for the <code>"</code> character. */
		public static const QUOTE:int = 34;
		
		/** Constant associated with the character code value for the <code>#</code> character. */
		public static const HASH:int = 35;
		
		/** Constant associated with the character code value for the <code>$</code> character. */
		public static const DOLLAR:int = 36;
		
		/** Constant associated with the character code value for the <code>%</code> character. */
		public static const PERCENT:int = 37;
		
		/** Constant associated with the character code value for the <code>&amp;</code> character. */
		public static const AMPERSAND:int = 38;
		
		/** Constant associated with the character code value for the <code>'</code> character. */
		public static const APOSTROPHE:int = 39;
		
		/** Constant associated with the character code value for the <code>(</code> character. */
		public static const LEFT_PARENTHESIS:int = 40;
		
		/** Constant associated with the character code value for the <code>)</code> character. */
		public static const RIGHT_PARENTHESIS:int = 41;
		
		/** Constant associated with the character code value for the <code>~~</code> character. */
		public static const ASTERISK:int = 42;
		
		/** Constant associated with the character code value for the <code>+</code> character. */
		public static const PLUS:int = 43;
		
		/** Constant associated with the character code value for the <code>,</code> character. */
		public static const COMMA:int = 44;
		
		/** Constant associated with the character code value for the <code>-</code> character. */
		public static const HYPHEN:int = 45;
		
		/** Constant associated with the character code value for the <code>-</code> character. */
		public static const MINUS:int = HYPHEN;
		
		/** Constant associated with the character code value for the <code>.</code> character. */
		public static const PERIOD:int = 46;
		
		/** Constant associated with the character code value for the <code>/</code> character. */
		public static const SLASH:int = 47;
		
		/** Constant associated with the character code value for digit 0. */
		public static const DIGIT_0:int = 48;
		
		/** Constant associated with the character code value for digit 1. */
		public static const DIGIT_1:int = 49;
		
		/** Constant associated with the character code value for digit 2. */
		public static const DIGIT_2:int = 50;
		
		/** Constant associated with the character code value for digit 3. */
		public static const DIGIT_3:int = 51;
		
		/** Constant associated with the character code value for digit 4. */
		public static const DIGIT_4:int = 52;
		
		/** Constant associated with the character code value for digit 5. */
		public static const DIGIT_5:int = 53;
		
		/** Constant associated with the character code value for digit 6. */
		public static const DIGIT_6:int = 54;
		
		/** Constant associated with the character code value for digit 7. */
		public static const DIGIT_7:int = 55;
		
		/** Constant associated with the character code value for digit 8. */
		public static const DIGIT_8:int = 56;
		
		/** Constant associated with the character code value for digit 9. */
		public static const DIGIT_9:int = 57;
		
		/** Constant associated with the character code value for the <code>:</code> character. */
		public static const COLON:int = 58;
		
		/** Constant associated with the character code value for the <code>;</code> character. */
		public static const SEMICOLON:int = 59;
		
		/** Constant associated with the character code value for the <code>&lt;</code> character. */
		public static const LESS_THAN:int = 60;
		
		/** Constant associated with the character code value for the <code>=</code> character. */
		public static const EQUAL:int = 61;
		
		/** Constant associated with the character code value for the <code>&gt;</code> character. */
		public static const GREATER_THAN:int = 62;
		
		/** Constant associated with the character code value for the <code>?</code> character. */
		public static const QUESTION_MARK:int = 63;
		
		/** Constant associated with the character code value for the <code>&#64;</code> character. */
		public static const AT_SIGN:int = 64;

		/** Constant associated with the character code value for the uppercase <code>A</code> character. */
		public static const UPPERCASE_A:int = 65;
		
		/** Constant associated with the character code value for the uppercase <code>B</code> character. */
		public static const UPPERCASE_B:int = 66;
		
		/** Constant associated with the character code value for the uppercase <code>C</code> character. */
		public static const UPPERCASE_C:int = 67;
		
		/** Constant associated with the character code value for the uppercase <code>D</code> character. */
		public static const UPPERCASE_D:int = 68;
		
		/** Constant associated with the character code value for the uppercase <code>E</code> character. */
		public static const UPPERCASE_E:int = 69;
		
		/** Constant associated with the character code value for the uppercase <code>F</code> character. */
		public static const UPPERCASE_F:int = 70;
		
		/** Constant associated with the character code value for the uppercase <code>G</code> character. */
		public static const UPPERCASE_G:int = 71;
		
		/** Constant associated with the character code value for the uppercase <code>H</code> character. */
		public static const UPPERCASE_H:int = 72;
		
		/** Constant associated with the character code value for the uppercase <code>I</code> character. */
		public static const UPPERCASE_I:int = 73;
		
		/** Constant associated with the character code value for the uppercase <code>J</code> character. */
		public static const UPPERCASE_J:int = 74;
		
		/** Constant associated with the character code value for the uppercase <code>K</code> character. */
		public static const UPPERCASE_K:int = 75;
		
		/** Constant associated with the character code value for the uppercase <code>L</code> character. */
		public static const UPPERCASE_L:int = 76;
		
		/** Constant associated with the character code value for the uppercase <code>M</code> character. */
		public static const UPPERCASE_M:int = 77;
		
		/** Constant associated with the character code value for the uppercase <code>N</code> character. */
		public static const UPPERCASE_N:int = 78;
		
		/** Constant associated with the character code value for the uppercase <code>O</code> character. */
		public static const UPPERCASE_O:int = 79;
		
		/** Constant associated with the character code value for the uppercase <code>P</code> character. */
		public static const UPPERCASE_P:int = 80;
		
		/** Constant associated with the character code value for the uppercase <code>Q</code> character. */
		public static const UPPERCASE_Q:int = 81;
		
		/** Constant associated with the character code value for the uppercase <code>R</code> character. */
		public static const UPPERCASE_R:int = 82;
		
		/** Constant associated with the character code value for the uppercase <code>S</code> character. */
		public static const UPPERCASE_S:int = 83;
		
		/** Constant associated with the character code value for the uppercase <code>T</code> character. */
		public static const UPPERCASE_T:int = 84;
		
		/** Constant associated with the character code value for the uppercase <code>U</code> character. */
		public static const UPPERCASE_U:int = 85;
		
		/** Constant associated with the character code value for the uppercase <code>V</code> character. */
		public static const UPPERCASE_V:int = 86;
		
		/** Constant associated with the character code value for the uppercase <code>W</code> character. */
		public static const UPPERCASE_W:int = 87;
		
		/** Constant associated with the character code value for the uppercase <code>X</code> character. */
		public static const UPPERCASE_X:int = 88;
		
		/** Constant associated with the character code value for the uppercase <code>Y</code> character. */
		public static const UPPERCASE_Y:int = 89;
		
		/** Constant associated with the character code value for the uppercase <code>Z</code> character. */
		public static const UPPERCASE_Z:int = 90;
		
		/** Constant associated with the character code value for the <code>[</code> character. */
		public static const LEFT_BRACKET:int = 91;
		
		/** Constant associated with the character code value for the <code>\</code> character. */
		public static const BACKSLASH:int = 92;
		
		/** Constant associated with the character code value for the <code>]</code> character. */
		public static const RIGHT_BRACKET:int = 93;
		
		/** Constant associated with the character code value for the <code>^</code> character. */
		public static const CIRCUMFLEX_ACCENT:int = 94;
		
		/** Constant associated with the character code value for the <code>_</code> character. */
		public static const UNDERSCORE:int = 95;
		
		/** Constant associated with the character code value for the <code>`</code> character. */
		public static const BACKTICK:int = 96;
		
		/** Constant associated with the character code value for the lowercase <code>A</code> character. */
		public static const LOWERCASE_A:int = 97;
		
		/** Constant associated with the character code value for the lowercase <code>B</code> character. */
		public static const LOWERCASE_B:int = 98;
		
		/** Constant associated with the character code value for the lowercase <code>C</code> character. */
		public static const LOWERCASE_C:int = 99;
		
		/** Constant associated with the character code value for the lowercase <code>D</code> character. */
		public static const LOWERCASE_D:int = 100;
		
		/** Constant associated with the character code value for the lowercase <code>E</code> character. */
		public static const LOWERCASE_E:int = 101;
		
		/** Constant associated with the character code value for the lowercase <code>F</code> character. */
		public static const LOWERCASE_F:int = 102;
		
		/** Constant associated with the character code value for the lowercase <code>G</code> character. */
		public static const LOWERCASE_G:int = 103;
		
		/** Constant associated with the character code value for the lowercase <code>H</code> character. */
		public static const LOWERCASE_H:int = 104;
		
		/** Constant associated with the character code value for the lowercase <code>I</code> character. */
		public static const LOWERCASE_I:int = 105;
		
		/** Constant associated with the character code value for the lowercase <code>J</code> character. */
		public static const LOWERCASE_J:int = 106;
		
		/** Constant associated with the character code value for the lowercase <code>K</code> character. */
		public static const LOWERCASE_K:int = 107;
		
		/** Constant associated with the character code value for the lowercase <code>L</code> character. */
		public static const LOWERCASE_L:int = 108;
		
		/** Constant associated with the character code value for the lowercase <code>M</code> character. */
		public static const LOWERCASE_M:int = 109;
		
		/** Constant associated with the character code value for the lowercase <code>N</code> character. */
		public static const LOWERCASE_N:int = 110;
		
		/** Constant associated with the character code value for the lowercase <code>O</code> character. */
		public static const LOWERCASE_O:int = 111;
		
		/** Constant associated with the character code value for the lowercase <code>P</code> character. */
		public static const LOWERCASE_P:int = 112;
		
		/** Constant associated with the character code value for the lowercase <code>Q</code> character. */
		public static const LOWERCASE_Q:int = 113;
		
		/** Constant associated with the character code value for the lowercase <code>R</code> character. */
		public static const LOWERCASE_R:int = 114;
		
		/** Constant associated with the character code value for the lowercase <code>S</code> character. */
		public static const LOWERCASE_S:int = 115;
		
		/** Constant associated with the character code value for the lowercase <code>T</code> character. */
		public static const LOWERCASE_T:int = 116;
		
		/** Constant associated with the character code value for the lowercase <code>U</code> character. */
		public static const LOWERCASE_U:int = 117;
		
		/** Constant associated with the character code value for the lowercase <code>V</code> character. */
		public static const LOWERCASE_V:int = 118;
		
		/** Constant associated with the character code value for the lowercase <code>W</code> character. */
		public static const LOWERCASE_W:int = 119;
		
		/** Constant associated with the character code value for the lowercase <code>X</code> character. */
		public static const LOWERCASE_X:int = 120;
		
		/** Constant associated with the character code value for the lowercase <code>Y</code> character. */
		public static const LOWERCASE_Y:int = 121;
		
		/** Constant associated with the character code value for the lowercase <code>Z</code>character. */
		public static const LOWERCASE_Z:int = 122;
		
		/** Constant associated with the character code value for the <code>{</code> character. */
		public static const LEFT_BRACE:int = 123;
		
		/** Constant associated with the character code value for the <code>|</code> character. */
		public static const PIPE:int = 124;
		
		/** Constant associated with the character code value for the <code>}</code> character. */
		public static const RIGHT_BRACE:int = 125;
		
		/** Constant associated with the character code value for the <code>~</code> character. */
		public static const TILDE:int = 126;

		/** Constant associated with the character code value for the <code>DELETE</code> key. */
		public static const DELETE:int = 127;

		/** Constant associated with the character code value for the <code>DELETE</code> key. */
		public static const NUM_LOCK:int = 144;

		/** Constant associated with the character code value for the <code>DELETE</code> key. */
		public static const SCROLL_LOCK:int = 145;
		
	}
	
}
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

package cc.cote.feathers.softkeyboard.keycollections
{

	import cc.cote.feathers.softkeyboard.CharCode;
	import cc.cote.feathers.softkeyboard.Key;

	/**
	 * The <code>SymbolKeyVariants</code> class is an enumeration class that provides references to 
	 * variants of common symbol characters useful in a latin-based language context.
	 */
	public class SymbolKeyVariants
	{

		/** Variants of the left-parenthesis character */
		public static const LEFT_PARENTHESIS:Vector.<Key> = new <Key>[
			new Key(CharCode.LEFT_BRACKET),
			new Key(CharCode.LEFT_BRACE),
			new Key(CharCode.LESS_THAN)
		];
		
		/** Variants of the right-parenthesis character */
		public static const RIGHT_PARENTHESIS:Vector.<Key> = new <Key>[
			new Key(CharCode.RIGHT_BRACKET),
			new Key(CharCode.RIGHT_BRACE),
			new Key(CharCode.GREATER_THAN)
		];

		/** Variants of the dollar sign character */
		public static const DOLLAR_SIGN:Vector.<Key> = new <Key>[
			new Key('€'.charCodeAt()),
			new Key('£'.charCodeAt()),
			new Key('¥'.charCodeAt())
		];

		/** Variants of the forward slash character */
		public static const SLASH:Vector.<Key> = new <Key>[
			new Key(CharCode.BACKSLASH),
			new Key(CharCode.PIPE)
		];

		/** Variants of the minus character */
		public static const MINUS:Vector.<Key> = new <Key>[
			new Key(CharCode.UNDERSCORE),
			new Key(CharCode.PLUS),
			new Key(CharCode.EQUAL)
		];

		/** Variants of the asterisk character */
		public static const ASTERISK:Vector.<Key> = new <Key>[
			new Key('•'.charCodeAt()),
			new Key('°'.charCodeAt())
		];

		/** Variants of the at-sign character */
		public static const AT_SIGN:Vector.<Key> = new <Key>[
			new Key('©'.charCodeAt()),
			new Key('®'.charCodeAt()),
		];

		/** Variants of the colon character */
		public static const COLON:Vector.<Key> = new <Key>[
			new Key(CharCode.SEMICOLON)
		];

		/** Variants of the percent character */
		public static const PERCENT:Vector.<Key> = new <Key>[
			new Key('‰'.charCodeAt()),
			new Key('‱'.charCodeAt())
		];

		/** Variants of the question mark character */
		public static const QUESTION_MARK:Vector.<Key> = new <Key>[
			new Key('¿'.charCodeAt())
		];

		/** Variants of the question mark character */
		public static const EXCLAMATION_MARK:Vector.<Key> = new <Key>[
			new Key('¡'.charCodeAt())
		];

	}
	
}
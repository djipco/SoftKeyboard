/*

Copyright (c) 2013-2014, Jean-Philippe Côté (www.cote.cc)
All rights reserved.

This library is provided "as is" with no guarantees whatsoever. Use it at your own risk.

*/

package cc.cote.feathers.softkeyboard.keycollections
{
	import cc.cote.feathers.softkeyboard.Key;

	/**
	 * The <code>FrenchKeyVariants</code> class is an enumeration class that provides references to 
	 * variants of latin letters useful in a French context. The variants included here are based on 
	 * the Wikipedia article listed below.
	 * 
	 * @see http://fr.wikipedia.org/wiki/Diacritiques_utilis%C3%A9s_en_fran%C3%A7ais
	 */
	public class FrenchKeyVariants
	{
		
		/** Latin letter A variants useful in a French context */
		public static const A:Vector.<Key> = new <Key>[
			new Key('à'.charCodeAt()),
			new Key('á'.charCodeAt()),
			new Key('â'.charCodeAt()),
			new Key('ã'.charCodeAt()),
			new Key('ā'.charCodeAt()),
			new Key('ä'.charCodeAt()),
			new Key('å'.charCodeAt()),
			new Key('æ'.charCodeAt())
		];

		/** Latin letter C variants useful in a French context */
		public static const C:Vector.<Key> = new <Key>[
			new Key('ç'.charCodeAt()),
			new Key('č'.charCodeAt())
		];
		
		/** Latin letter E variants useful in a French context */
		public static const E:Vector.<Key> = new <Key>[
			new Key('è'.charCodeAt()),
			new Key('é'.charCodeAt()),
			new Key('ê'.charCodeAt()),
			new Key('ë'.charCodeAt()),
			new Key('ę'.charCodeAt())
		];
		
		/** Latin letter I variants useful in a French context */
		public static const I:Vector.<Key> = new <Key>[
			new Key('í'.charCodeAt()),
			new Key('î'.charCodeAt()),
			new Key('ī'.charCodeAt()),
			new Key('ï'.charCodeAt()),
			new Key('ĳ'.charCodeAt())
		];
		
		/** Latin letter N variants useful in a French context */
		public static const N:Vector.<Key> = new <Key>[
			new Key('ñ'.charCodeAt()),
			new Key('ṇ'.charCodeAt())
		];
		
		/** Latin letter O variants useful in a French context */
		public static const O:Vector.<Key> = new <Key>[
			new Key('ó'.charCodeAt()),
			new Key('ô'.charCodeAt()),
			new Key('õ'.charCodeAt()),
			new Key('ō'.charCodeAt()),
			new Key('ö'.charCodeAt()),
			new Key('ø'.charCodeAt()),
			new Key('œ'.charCodeAt())
		];
			
		/** Latin letter S variants useful in a French context */
		public static const S:Vector.<Key> = new <Key>[
			new Key('š'.charCodeAt()),
			new Key('ṣ'.charCodeAt())
		];
		
		/** Latin letter T variants useful in a French context */
		public static const T:Vector.<Key> = new <Key>[
			new Key('ṭ'.charCodeAt())
		];
	
		/** Latin letter U variants useful in a French context */
		public static const U:Vector.<Key> = new <Key>[
			new Key('ù'.charCodeAt()),
			new Key('ú'.charCodeAt()),
			new Key('û'.charCodeAt()),
			new Key('ü'.charCodeAt()),
		];
		
		/** Latin letter Y variants useful in a French context */
		public static const Y:Vector.<Key> = new <Key>[
			new Key('ÿ'.charCodeAt())
		];

		/** Latin letter Z variants useful in a French context */
		public static const Z:Vector.<Key> = new <Key>[
			new Key('ž'.charCodeAt()),
			new Key('ẓ'.charCodeAt())
		];
		
	}
	
}
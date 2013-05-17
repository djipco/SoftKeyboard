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

package cc.cote.feathers.softkeyboard
{
	import starling.display.Sprite;

	/**
	 * The <code>KeyRow</code> class contains all the keys in a single keyboard row. It basically 
	 * acts as a <code>DisplayObjectContainer</code> with a few extra properties.
	 * 
	 * @see cc.cote.feathers.softkeyboard.Key
	 */
	public class KeyRow extends Sprite
	{
		/** A vector of all <code>Key</code> objects in the <code>KeyRow</code>. */
		public var keys:Vector.<Key>;
		
		/** Relative width of the <code>KeyRow</code> in arbitraty units. */
		public var relativeWidth:Number = 0;
		
		private var _gap:Number = 0;
		
		/**
		 * Creates a new <code>KeyRow</code> object.
		 * 
		 * @param keys Vector of <code>Key</code> objects to add to the <code>KeyRow</code>.
		 * @param gap Gap to leave between keys (in arbitraty units).
		 */
		public function KeyRow(keys:Vector.<Key>, gap:Number) {
			
			this.keys = keys;
			this._gap = gap;
			
			// Calculate relative width in units (including the gap between keys)
			for each (var key:Key in keys) {
				addChild(key);
				relativeWidth += key.relativeWidth;
			}
			relativeWidth += (length - 1) * _gap;
			
		}
		
		/** Number of keys in the key row. */
		public function get length():uint {
			return keys.length;
		}

	}
	
}
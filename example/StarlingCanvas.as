package {
	
	import flash.geom.Rectangle;
	
	import cc.cote.feathers.softkeyboard.KeyEvent;
	import cc.cote.feathers.softkeyboard.SoftKeyboard;
	import cc.cote.feathers.softkeyboard.layouts.EmailNumbersSymbolsSwitch;
	import cc.cote.feathers.softkeyboard.layouts.EmailSwitch;
	import cc.cote.feathers.softkeyboard.layouts.Layout;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;

	public class StarlingCanvas extends Sprite {
		
		public function StarlingCanvas() {
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);			
		}
		
		public function onAddedToStage(e:Event):void {
			
			// Set Starling's viewport, width and height
			Starling.current.viewPort = new Rectangle(0, 0, 600, 600);
			stage.stageWidth = stage.stageHeight = 600;
			
			// Instantiate Feathers theme
			new Theme(stage);
			
			// Instantiate a keyboard with a single layout
			//var l:Layout = new Qwerty();
			//var l:Layout = new AzertyFr();
			
			// Instantiate a keyboard with multiple layouts
			var l:Vector.<Layout> = new <Layout>[
				new EmailSwitch(EmailNumbersSymbolsSwitch),
				new EmailNumbersSymbolsSwitch(EmailSwitch)
			];
			
			// Create keyboard and add it to the stage
			var keyboard:SoftKeyboard = new SoftKeyboard(l, 400, 200);
			keyboard.addEventListener(KeyEvent.KEY_UP, onKeyUp);
			addChild(keyboard);
			
			// Center keyboard
			keyboard.validate();
			keyboard.x = stage.stageWidth / 2 - keyboard.width / 2;
			keyboard.y = stage.stageHeight / 2 - keyboard.height / 2;
			
		}
		
		public function onKeyUp(e:KeyEvent):void {
			trace(e);
		}
		
	}

}
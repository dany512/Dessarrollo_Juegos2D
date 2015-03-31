package utils 
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author Dany
	 */
	public class DKeyboard 
	{
		static private var stage:Stage;
		static public var left_down:Boolean;
		static public var right_down:Boolean;
		static public var up_down:Boolean;
		static public var down_down:Boolean;
		static public var space_down:Boolean;
		
		
		static public function init(_stage:Stage):void 
		{
			
			stage = _stage;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, down);
			stage.addEventListener(KeyboardEvent.KEY_UP, up);
		}
		
		static private function down(e:KeyboardEvent):void 
		{
			switch(e.keyCode)
			{
				case Keyboard.LEFT:
					left_down = true;
					break;
				case Keyboard.RIGHT:
					right_down = true;
					break;
				case Keyboard.UP:
					up_down = true;
					break;
				case Keyboard.DOWN:
					down_down = true;
					break;
				case Keyboard.SPACE:
					space_down = true;
					break;
			}
		}
		
		static private function up(e:KeyboardEvent):void 
		{
			switch(e.keyCode)
			{
				case Keyboard.LEFT:
					left_down = false;
					break;
				case Keyboard.RIGHT:
					right_down = false;
					break;
				case Keyboard.UP:
					up_down = false;
					break;
				case Keyboard.DOWN:
					down_down = false;
					break;
				case Keyboard.SPACE:
					space_down = false;
					break;
			}
		}
		static public function clear():void {
			if ( stage.hasEventListener(KeyboardEvent.KEY_DOWN))
			{
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, down);
			}
			if (stage.hasEventListener(KeyboardEvent.KEY_UP))
			{
				stage.removeEventListener(KeyboardEvent.KEY_UP, up);
			}
		}
		
	}

}
package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import utils.DKeyboard;
	/**
	 * ...
	 * @author Dany
	 */
	public class Game extends Sprite
	{
		private var ship:Ship;
		
		public function Game() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			ship = new Ship();
			addChild(ship);
			DKeyboard.init(stage);
			addEventListener(Event.ENTER_FRAME, loop);
			stage.focus = stage;
		}
		
		private function loop(e:Event):void 
		{
			ship.update();
			
		}
		
	}

}
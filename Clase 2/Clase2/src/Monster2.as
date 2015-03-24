package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Dany
	 */
	public class Monster2 extends Sprite
	{
		private var skin:Sprite;
		
		public function Monster2() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var c:Class = DLoader.getAssets("KPTP")
			skin = new c();
			addChild(skin);
			skin.x = skin.width / 2;
			skin.y = skin.height / 2;
		}
		
	}

}
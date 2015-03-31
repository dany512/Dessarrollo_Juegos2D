package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import utils.DLoader;
	import utils.DMath;
	
	/**
	 * ...
	 * @author Dany
	 */
	public class Bullet extends Sprite 
	{
		private var skin:Sprite
		private var posX:Number;
		private var posY:Number;
		private var shipRotation:Number;
		private var vX:Number;
		private var vY:Number;
		private var speed:Number;
		public function Bullet(_x:Number, _y:Number,_rotation:Number) 
		{
			super();
			posX = _x;
			posY = _y;
			vY = 0;
			vX = 0;
			speed = 5;
			shipRotation = _rotation;
			addEventListener(Event.ADDED_TO_STAGE, added)
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			var c:Class = DLoader.getAsset("bullet") as Class;
			skin = new c();
			rotation = shipRotation;
			addChild(skin)
			x = posX;
			y = posY;
			vX = Math.cos(DMath.radiansToDegrees(rotation))*speed;
			vY = Math.sin(DMath.radiansToDegrees(rotation))*speed;
		}
		public function update():void
		{
			
			x += vX;
			y += vY;
		}
	}

}
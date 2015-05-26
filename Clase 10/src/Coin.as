package 
{
	import flash.geom.Point;
	import utils.objects.DGameObject;
	
	/**
	 * ...
	 * @author Dany
	 */
	public class Coin extends DGameObject 
	{
		private var posX:int;
		private var posY:int;
		public function Coin(pX:int,pY:int) 
		{
			super();
			posX = pX;
			posY = pY;
			currentClip = 'coins'
		}
		override public function init():void 
		{
			super.init();
			x = posX*width;
			y = posY*height;
		}
		
		public function getPos():Point 
		{
			return new Point(x, y);
		}
	}

}
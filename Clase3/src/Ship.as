package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.setTimeout;
	import utils.DLoader;
	import utils.DKeyboard;
	import utils.DMath;
	
	/**
	 * ...
	 * @author Dany
	 */
	public class Ship extends Sprite 
	{
		private var skin:Sprite;
		private var c:Class;
		private var vX:Number;
		private var vY:Number;
		private var friction:Number;
		private var speed:Number;
		private var canShoot:Boolean;
		private var bullets:Vector.<Bullet>
		
		public function Ship() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			c = DLoader.getAsset("ship") as Class;
			skin = new c();
			vX = 0;
			vY = 0;
			friction = 0.95;
			speed = 5;
			canShoot = true;
			bullets = new Vector.<Bullet>();
			addChild(skin);
			x = stage.stageWidth / 2;
			y = stage.stageHeight / 2;
		}
		
		public function update():void 
		{
			if (DKeyboard.left_down)
			{
				rotation -= 5;
			}
			if (DKeyboard.right_down)
			{
				rotation += 5;
			}
			if (DKeyboard.up_down)
			{
				vY = Math.sin(DMath.radiansToDegrees(rotation))*speed;
				vX = Math.cos(DMath.radiansToDegrees(rotation))*speed;
			}
			else
			{
				vY *= friction;
				vX *= friction;
			}
			if (DKeyboard.space_down)
			{
				if(canShoot)
				{
					canShoot = false;
					var bullet:Bullet = new Bullet(x, y,rotation);
					stage.addChild(bullet);
					bullets.push(bullet);
					setTimeout(enableGun, 500);
				}
			}
			if (bullets.length > 0)
			{
				for (var i:int = 0; i < bullets.length; i++) 
				{
					bullets[i].update();
				}
			}
			
			if (x < -width*2)
			{
				x = stage.stageWidth;
					if (y < -height / 2)
					{
						y = stage.stageHeight;
					}
					if (y >stage.stageHeight +height / 2)
					{
						y = -height/2;
					}
			}
			if (x >stage.stageWidth+width*2)
			{
				x = -width / 2;
					if (y < -height/2)
					{
						y = stage.stageHeight;
					}
					if (y >stage.stageHeight +height/2)
					{
						y = -height/2;
					}
			}
			if (y < -height*2)
			{
				y = stage.stageHeight;
				if (x < -width / 2)
					{
						x = stage.stageWidth;
					}
				if (x >stage.stageWidth+width/2)
					{
						x = -width/2;
					}
			}
			if (y >stage.stageHeight +height*2)
			{
				y = -height / 2;
				if (x < -width *3)
					{
						x = stage.stageWidth;
					}
				if (x >stage.stageWidth+width/2)
					{
						x = -width/2;
					}
			}
				
				y += vY;
				x += vX;
		}
		
		private function enableGun():void 
		{
				canShoot = true;
		}
		
	}

}
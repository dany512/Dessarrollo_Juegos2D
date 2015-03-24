package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.ui.Keyboard;
	import flash.utils.getTimer;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Dany
	 */
	public class Monster extends Sprite
	{
		private var skin:Sprite;
		private var leftPress:Boolean;
		private var rightPress:Boolean;
		private var vel:Number;
		private var accel:Number;
		private var maxvel:Number;
		private var frict:Number;
		private var timer:Timer;
		private var start:int;
		private var dt:Number;
		private var elapsed:Number;
		
		public function Monster() 
		{
			super();
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			vel = 0;
			accel = 0.2;
			maxvel = 2;
			frict = 0.95;
			elapsed = 0;
			start = getTimer();
			var c:Class = DLoader.getAssets("KPTP")
			skin = new c();
			addChild(skin);
			skin.x = skin.width / 2;
			skin.y = skin.height / 2;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onPress);
			stage.addEventListener(KeyboardEvent.KEY_UP, onRelease);
			stage.addEventListener(Event.ENTER_FRAME, loop);
			//timer = new Timer(500);
			//timer.start();
			//timer.addEventListener(TimerEvent.TIMER, onTimer);
		}
		
		private function onTimer():void 
		{
			var m:Monster2 = new Monster2();
			addChild(m);
			m.x = Math.random() * stage.stageWidth;
		}
		
		private function loop(e:Event):void 
		{
			dt = (getTimer() - start)*0.001;
			start = getTimer();
			elapsed += dt;
			trace(elapsed);
			
			if (elapsed >= 1)
			{
				onTimer();
				elapsed = 0;
			}
			if (leftPress)
			{
				
				vel -= accel;
				if (vel < -maxvel)
				{
					vel = -maxvel;
					skin.scaleX = 1;
				}
				
				
			}
			if (rightPress)
			{
				vel += accel;
				if (vel > maxvel)
				{
					vel = maxvel;
					skin.scaleX = -1;
				}
				
			}
			
			vel *= frict;
			skin.x += vel;
			
		}
		
		private function onPress (e:KeyboardEvent):void 
		{
			switch (e.keyCode)
			{
				case Keyboard.LEFT:
					leftPress = true;
					break;
				case Keyboard.RIGHT:
					rightPress = true;
					break;
			}
		}
		
		private function onRelease (e:KeyboardEvent):void 
		{
			
			switch (e.keyCode)
			{
				case Keyboard.LEFT:
					leftPress = false;
					break;
				case Keyboard.RIGHT:
					rightPress = false;
					break;
			}
		}
		
	}

}
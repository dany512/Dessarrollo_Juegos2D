package 
{
	import flash.events.MouseEvent;
	import utils.objects.DGameObject;
	
	/**
	 * ...
	 * @author Dany
	 */
	public class BtnAddCoin extends DGameObject 
	{
		public var onAddCoin:Function;
		public function BtnAddCoin() 
		{
			super();
			currentClip = 'add_coins';
		}
		
		override public function init():void 
		{
			super.init();
			mouseChildren = false;
			x = 850;
			y = 300;
			buttonMode = true;
			addEventListener(MouseEvent.CLICK, Add);
		}
		
		private function Add(e:MouseEvent):void 
		{
			onAddCoin();
		}
	}

}
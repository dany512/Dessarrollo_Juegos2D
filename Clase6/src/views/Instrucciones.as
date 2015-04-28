package views 
{
	import events.NavigationEvent;
	import flash.events.MouseEvent;
	import utils.DView;
	
	/**
	 * ...
	 * @author Dany
	 */
	public class Instrucciones extends DView 
	{
		
		public function Instrucciones() 
		{
			super();
			currentClip = "view_inst";
		}
		
		override public function init():void 
		{
			super.init();
			skin.btnBack.buttonMode = true;
			skin.btnBack.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_VIEW,'view_menu'));
		}
	}

}
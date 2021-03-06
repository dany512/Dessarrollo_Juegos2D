package utils.time 
{
	import flash.utils.getTimer;
	/**
	 * ...
	 * @author 
	 */
	public class DTempo 
	{
		static public var dt:Number;
		static public var currentTime:Number;
		public static function start():void {
			dt = 0;
			currentTime = getTimer();
		}
		
		public static function update():void {
			dt = (getTimer() - currentTime) * 0.001;
			currentTime = getTimer();
		}
		
	}

}
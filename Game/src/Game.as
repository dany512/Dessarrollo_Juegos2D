package 
{
	import utils.loaders.DLoadData;
	import utils.views.DView;
	
	/**
	 * ...
	 * @author Dany
	 */
	
	public class Game extends DView 
	{
		private var Map:Array;
		public function Game() 
		{
			super();
		}
		override public function init():void 
		{
			super.init();
			DLoadData.load('map.json');
			DLoadData.onComplete = Parse;
		}
		private function Parse(obj:Object):void 
		{
			Map = new Array();
			for (var i:int = 0; i < obj.map.length; i++) 
			{
				Map[i] = new Array();
				for (var j:int = 0; j < obj.map[i].length; j++) 
				{
					var t:Tile = new Tile(i, j, obj.map[i][j]);
					addChild(t);
					Map[i].push(obj.map[i][j]);
				}
			}
		}
		
	}

}
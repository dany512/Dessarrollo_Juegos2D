package 
{
	import flash.events.Event;
	import utils.input.DKeyboard;
	import utils.loaders.DLoadData;
	import utils.views.DView;
	
	/**
	 * ...
	 * @author Dany
	 */
	
	public class Game extends DView 
	{
		private var Map:Array;
		private var hero:Hero;
		private var Row:int;
		private var Column:int;	
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
			hero = new Hero();
			addChild(hero);
			Row = 1;
			Column = 1;
			hero.x = Row * 50;
			hero.y = Column * 50;
			stage.addEventListener(Event.ENTER_FRAME, loop);
			DKeyboard.init(stage);
		}
		
		private function loop(e:Event):void 
		{
			var tRow:int = Row;
			var tCol:int = Column;
			trace(tRow, tCol);
			if (DKeyboard.leftPress)
			{
				tRow--;
				
				if(Map[tRow][tCol]==0)
				{
					Row = tRow;
					hero.x = Row * 50;
					hero.y = Column * 50;
					hero.setState('Izquierda');
				}
				DKeyboard.leftPress = false;
			}
			if (DKeyboard.rightPress)
			{
				tRow++;
				if(Map[tRow][tCol]==0)
				{
					Row = tRow;
					hero.x = Row * 50;
					hero.y = Column * 50;
					hero.setState('Derecha');
				}
				DKeyboard.rightPress = false;
			}
			if (DKeyboard.upPress)
			{
				tCol--;
				
				if(Map[tRow][tCol]==0)
				{
					Column = tCol;
					hero.x = Row * 50;
					hero.y = Column * 50;
					hero.setState('Arriba');
				}
				DKeyboard.upPress = false;
			}
			if (DKeyboard.downPress)
			{
				tCol++;
				
				if(Map[tRow][tCol]==0)
				{
					Column = tCol;
					hero.x = Row * 50;
					hero.y = Column * 50;
					hero.setState('Abajo');
				}
				DKeyboard.downPress = false;
			}
		}
		
	}

}
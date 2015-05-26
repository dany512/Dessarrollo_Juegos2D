package 
{
	import utils.objects.DGameObject;
	
	/**
	 * ...
	 * @author Dany
	 */
	public class Hero extends DGameObject 
	{
		
		public function Hero() 
		{
			super();
			currentClip = 'player';
			addState("Derecha", "playerDer");
			addState("Izquierda", "platerIzq");
			addState("Abajo", "playerDown");
			addState("Arriba", "player");
		}
		
	}

}
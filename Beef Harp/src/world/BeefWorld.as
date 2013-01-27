package world 
{
	import game.beef.Beef;
	import net.flashpunk.World;
	import values.Game;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class BeefWorld extends World 
	{
		
		public function BeefWorld() 
		{
			add(new Beef(Game.WIDTH/2, Game.HEIGHT/2));
		}
		
	}

}
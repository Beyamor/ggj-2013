package world 
{
	import flash.geom.Rectangle;
	import game.beef.Beef;
	import game.beef.Harp;
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
			var beef:Beef = new Beef(Game.WIDTH / 2, Game.HEIGHT / 2, new Rectangle(0, Game.HEIGHT/2, Game.WIDTH, Game.HEIGHT/2));
			add(beef);
			add(new Harp(beef.x - Game.HARP_FOLLOW_DISTANCE, beef.y, beef));
		}
		
	}

}
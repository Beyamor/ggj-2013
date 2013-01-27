package worlds 
{
	import flash.geom.Rectangle;
	import game.beef.Beef;
	import game.beef.EnemySpawner;
	import game.beef.Harp;
	import net.flashpunk.World;
	import values.Game;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class BeefWorld extends World 
	{
		private var enemySpawner:EnemySpawner;
		
		public function BeefWorld() 
		{
			var bounds:Rectangle = new Rectangle(0, 50, Game.WIDTH, Game.HEIGHT - 100);
			
			var beef:Beef = new Beef(Game.WIDTH / 2, Game.HEIGHT / 2, bounds);
			add(beef);
			add(new Harp(beef));
			
			enemySpawner = new EnemySpawner(this, bounds);
		}
		
		override public function update():void 
		{
			super.update();
			
			enemySpawner.update();
		}
	}

}
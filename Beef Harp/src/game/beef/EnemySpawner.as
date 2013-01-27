package game.beef 
{
	import flash.geom.Rectangle;
	import net.flashpunk.World;
	import util.Timer;
	import values.Game;
	/**
	 * ...
	 * @author beyamor
	 */
	public class EnemySpawner 
	{
		private var _world:World;			private function get world():World { return _world; }
		private var _beefBounds:Rectangle;	private function get beefBounds():Rectangle { return _beefBounds; }
		private var spawnTimer:Timer;
		
		public function EnemySpawner(world:World, beefBounds:Rectangle)
		{
			_world = world;
			_beefBounds = beefBounds;
			
			spawnTimer = new Timer(Game.BASE_ENEMY_SPAWN_DELAY);
		}
		
		public function update():void {
			
			spawnTimer.update();
			
			if (spawnTimer.hasFired()) {
				
				spawnTimer.reset();
				world.add(new Enemy(
								beefBounds.right + 30,
								beefBounds.top + Math.random() * (beefBounds.height)));
			}
		}
	}

}
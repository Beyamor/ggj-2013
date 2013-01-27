package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import game.beef.EnemySpawner;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import values.Game;
	import worlds.BeefWorld;
	import worlds.GameWorld;
	import worlds.HarpWorld;
	import worlds.IntroScreen;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Main extends Engine 
	{	
		public function Main():void 
		{
			super(Game.WIDTH, Game.HEIGHT);
			
			Input.define("harp-up", Key.UP);
			Input.define("harp-down", Key.DOWN);
			
			Input.define("beef-up", Key.W);
			Input.define("beef-down", Key.S);
			Input.define("beef-left", Key.A);
			Input.define("beef-right", Key.D);
			Input.define("beef-shot", Key.SPACE);
			
			Input.define("restart", Key.R);
		}
		
		override public function init():void 
		{
			super.init();
			
			FP.world = new IntroScreen;
		}
		
	}
	
}
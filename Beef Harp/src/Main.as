package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import values.Game;
	import world.BeefWorld;
	import world.HarpWorld;
	
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
		}
		
		override public function init():void 
		{
			super.init();
			
			FP.world = new BeefWorld;
		}
		
	}
	
}
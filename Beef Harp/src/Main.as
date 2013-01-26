package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import values.Game;
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
		}
		
		override public function init():void 
		{
			super.init();
			
			FP.world = new HarpWorld;
		}
		
	}
	
}
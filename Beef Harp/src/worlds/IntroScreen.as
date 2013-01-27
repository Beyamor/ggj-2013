package worlds 
{
	import flash.events.TextEvent;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class IntroScreen extends World 
	{
		
		public function IntroScreen() 
		{
			var startText:Text = new Text("Press any key to start", FP.width - 250, FP.height - 50)
			var gameText:Text = new Text("Beef and Harp", 40, 35);
			
			addGraphic(startText);
			addGraphic(gameText);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.pressed(Key.ANY)) FP.world = new Tutorial;
		}
	}

}
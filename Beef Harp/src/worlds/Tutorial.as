package worlds 
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	import values.Sprites;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Tutorial extends World 
	{
		
		public function Tutorial() 
		{
			addGraphic(new Image(Sprites.BEEF_INTRO), 0, 430, 45);
			addGraphic(new Image(Sprites.HARP_INTRO), 0, 30, 310);
			addGraphic(new Text("Beef protects Harp by shooting the baddies.\n\nControls: WASD + Space", 30, 120, 400, 400));
			addGraphic(new Text("Beef's strength comes from Harp.\nIf Harp fall out of sync,\nBeef's heart will get weaker.\n\nControls: Up + Down", 490, 400, 400, 400));
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.pressed(Key.ANY)) FP.world = new GameWorld;
		}
	}

}
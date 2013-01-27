package game.beef 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Score extends Entity 
	{
		private var score:uint = 0;
		private var display:Text;
		
		public function Score(x:Number, y:Number)
		{
			display = new Text("0", 0, 0, 100, 30);
			
			super(x, y, display);
		}
		
		override public function update():void 
		{
			super.update();
			
			display.text = score.toString();
		}
		
		public function increase():void {
			
			++score;
		}
	}

}
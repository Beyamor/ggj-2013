package game.harp 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Input;
	import util.ImageMaker;
	import util.Timer;
	import values.Depths;
	import values.Game;
	import values.Sprites;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Cursor extends Entity 
	{
		private var _yConstraint:YConstraint;		private function get yConstraint():YConstraint { return _yConstraint; }
		private var _heartSync:HeartSync;			private function get heartSync():HeartSync { return _heartSync; }
		
		private var heartSyncDisplay:Image;
		private var hasLost:Boolean = false;
		
		private var cursor:Image;
		public var cursorAlpha:Number = 1;
		private var cursorAlphaTweener:VarTween = new VarTween();
		private var cursorAlphaTweenerHasStarted:Boolean = false;
		
		private var sparkleTimer:Timer = new Timer(Game.MIN_SPARKLE_TIME);
		
		public function Cursor(x:Number, yConstraint:YConstraint, heartSync:HeartSync)
		{
			_yConstraint = yConstraint;
			_heartSync = heartSync;
			
			var graphics:Graphiclist = new Graphiclist;
			
			//graphics.add(ImageMaker.centered(Sprites.HARP_CURSOR));
			cursor = ImageMaker.centeredAndConstrained(Sprites.HARP, 16, 16);
			
			heartSyncDisplay = ImageMaker.centered(Sprites.CURSOR_HEART);
			graphics.add(heartSyncDisplay);
			graphics.add(cursor);
			
			super(x, yConstraint.center, graphics);
			
			layer = Depths.HARP_CURSOR;
			
			cursorAlphaTweener.tween(this, "cursorAlpha", 0, 4);
		}
		
		override public function update():void 
		{
			super.update();
			
			cursor.alpha = cursorAlpha;
			
			var dY:Number = 0;
			if (Input.check("harp-up"))		dY -= 1;
			if (Input.check("harp-down"))	dY += 1;
			
			y += Game.HARP_CURSOR_SPEED * FP.elapsed * dY;
			y = FP.clamp(y, yConstraint.min, yConstraint.max);
			
			var t:Number;
			
			if (heartSync.sync >= 0) {
				
				t = heartSync.sync / 100;
				
				heartSyncDisplay.color = FP.colorLerp(0xB3B1B1, 0xFAA5C7, t);
				heartSyncDisplay.alpha = FP.lerp(0.9, 1, t);;
			}
			
			else {
				
				t = heartSync.sync / -100;
				
				heartSyncDisplay.color = FP.colorLerp(0xB3B1B1, 0x000000, t);
				heartSyncDisplay.alpha = FP.lerp(0.9, 0, t);
			}
			
			if (hasLost && !cursorAlphaTweenerHasStarted && heartSync.sync <= -100) {
				
				world.addTween(cursorAlphaTweener, true);
				cursorAlphaTweenerHasStarted = true;
			}
			
			sparkleTimer.update();
			if (!hasLost && heartSync.isInSync) {
				
				if (sparkleTimer.hasFired()) {
					
					sparkleTimer = new Timer(Game.MIN_SPARKLE_TIME + Math.random() * (Game.MAX_SPARKLE_TIME - Game.MIN_SPARKLE_TIME));
					world.add(new Sparkle(
									x - 16,
									y - cursor.height / 4 + Math.random() * cursor.height/2));
									
				}
			}
		}
		
		public function registerLoss():void {
			
			hasLost = true;
		}
	}

}
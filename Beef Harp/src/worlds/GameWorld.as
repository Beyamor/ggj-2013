package worlds 
{
	import flash.geom.Rectangle;
	import game.beef.Beef;
	import game.beef.EnemySpawner;
	import game.beef.Harp;
	import game.harp.Cursor;
	import game.harp.HeartRate;
	import game.harp.HeartSync;
	import game.harp.YConstraint;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	import net.flashpunk.World;
	import util.Timer;
	import values.Depths;
	import values.Game;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class GameWorld extends World 
	{
		private var beef:Beef;
		private var harp:Harp;
		private var sync:HeartSync;
		private var heartRate:HeartRate;
		private var cursor:Cursor;
		private var enemySpawner:EnemySpawner;
		
		private var hasLost:Boolean = false;
		private var restartTimer:Timer = new Timer(4);
		
		private var restartNotice:Text;
		
		public function GameWorld() 
		{
			var spacer:Number = 50;
			
			sync = new HeartSync;
			
			var beefBounds:Rectangle = new Rectangle(0, Game.HEIGHT / 2 + 50, Game.WIDTH, Game.HEIGHT / 2 - spacer * 2);
			
			beef = new Beef(Game.WIDTH / 2,
							Game.HEIGHT * 0.75,
							beefBounds,
							sync);
			add(beef);
			
			harp = new Harp(beef);
			add(harp);
			
			var yConstraint:YConstraint = new YConstraint(0 + spacer, Game.HEIGHT / 2 - spacer);
			
			heartRate = new HeartRate(yConstraint);
			add(heartRate);
			
			cursor = new Cursor(50, yConstraint, sync);
			add(cursor);
			
			enemySpawner = new EnemySpawner(this, beefBounds);
			
			restartNotice = new Text("Press R to restart",
										0.5 * (beefBounds.left + beefBounds.right) - 54,
										0.5 * (beefBounds.top + beefBounds.bottom) - 32);
			restartNotice.alpha = 0;
			addGraphic(restartNotice, Depths.OVERLAY);
		}
		
		override public function update():void 
		{
			super.update();
			
			var yDistance:Number = heartRate.getNormalizedYDistance(cursor.x, cursor.y);
			sync.addAccuracyPoint(yDistance);
			
			enemySpawner.update();
			
			sync.update();
			
			if (hasLost) {
				
				restartTimer.update();
				
				if (restartTimer.hasFired()) {
					
					var restartNoticeTweener:VarTween = new VarTween();
					restartNoticeTweener.tween(restartNotice, "alpha", 1, 1);
					addTween(restartNoticeTweener);
					
					if (Input.check("restart")) FP.world = new GameWorld;
				}
			}
		}
		
		override public function render():void 
		{
			super.render();
			
			Draw.linePlus(0, Game.HEIGHT / 2, Game.WIDTH, Game.HEIGHT / 2, 0x333333, 1, 2);
		}
		
		public function harpDied():void {
			
			hasLost = true;
			restartTimer.reset();
			
			heartRate.registerLoss();
			sync.registerLoss();
			cursor.registerLoss();
		}
	}

}
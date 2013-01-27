package game.beef 
{
	import flash.display.NativeMenuItem;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import util.Hitboxer;
	import util.ImageMaker;
	import values.Depths;
	import values.Sprites;
	import values.Types;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Shot extends Entity 
	{
		private var xVel:Number;
		private var yVel:Number;
		
		private var team:String;
		
		private var damage:Number;
		
		public function Shot(x:Number, y:Number, speed:Number, directionInRadians:Number, damage:Number)
		{
			super(x, y, ImageMaker.centered(Sprites.SHOT));
			
			xVel = speed * Math.cos(directionInRadians);
			yVel = speed * Math.sin(directionInRadians);
			
			this.damage = damage;
			
			layer = Depths.SHOT;
			
			Hitboxer.matchImage(this);
		}
		
		override public function update():void 
		{
			super.update();
			
			x += xVel * FP.elapsed;
			y += yVel * FP.elapsed;
			
			if (x < 0 || y < 0 || x > FP.width || y > FP.height) {
				
				if (world) world.remove(this);
			}
			
			var enemyEntity:Entity = collide(Types.ENEMY, x, y);
			
			if (enemyEntity) {
				
				var enemy:Enemy = enemyEntity as Enemy;
				
				enemy.takeHit(damage);
				
				if (world) world.remove(this);
			}
		}
	}

}
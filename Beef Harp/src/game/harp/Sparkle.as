package game.harp 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.misc.NumTween;
	import util.ImageMaker;
	import values.Game;
	import values.Sprites;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Sparkle extends Entity 
	{
		private var xVel:Number;
		private var yVel:Number;
		
		private var alphaTweener:NumTween;
		
		public function Sparkle(x:Number, y:Number)
		{
			super(x, y, ImageMaker.centeredAndConstrained(Sprites.SPARKLE, 4, 4));
			
			var direction:Number = Math.PI - 0.3 + Math.random() * 0.6;
			
			xVel = Game.SPARKLE_SPEED * Math.cos(direction);
			yVel = Game.SPARKLE_SPEED * Math.sin(direction);
		}
		
		override public function added():void 
		{
			super.added();
			
			alphaTweener = new NumTween();
			alphaTweener.tween(1, 0, Game.MIN_SPARKLE_DURATION + Math.random() * (Game.MAX_SPARKLE_DURATION - Game.MIN_SPARKLE_DURATION));
			world.addTween(alphaTweener);
		}
		
		override public function update():void 
		{
			super.update();
			
			x += xVel * FP.elapsed;
			y += yVel * FP.elapsed;
			
			(graphic as Image).alpha = alphaTweener.value;
			if ((graphic as Image).alpha == 0) {
				
				if (world) world.remove(this);
			}
		}
	}

}
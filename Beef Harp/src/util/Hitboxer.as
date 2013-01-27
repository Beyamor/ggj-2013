package util 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Hitbox;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Hitboxer 
	{
		public static function matchImage(entity:Entity):Entity {
			
			var image:Image = entity.graphic as Image;
			if (!image) return entity;
			
			entity.setHitbox(image.width, image.height, image.x, image.y);
			
			return entity;
		}
	}

}
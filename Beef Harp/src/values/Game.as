package values 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class Game 
	{
		public static const WIDTH:uint = 800;
		public static const HEIGHT:uint = 600;
		
		public static const HARP_CURSOR_SPEED:Number	= 200;
		public static const BEEF_SPEED:Number			= 125;
		public static const HARP_SPEED:Number			= 100;
		public static const HARP_FOLLOW_DISTANCE:Number	= 64;
		public static const BEEF_SHOT_DELAY:Number		= 1.2;
		
		public static const BASE_ENEMY_SPEED:Number			= 100;
		public static const BASE_ENEMY_SPAWN_DELAY:Number	= 2;
		
		public static const MIN_BEEF_STRENGTH:Number		= 0;
		public static const MAX_BEEF_STRENGTH:Number		= 3;
		
		public static const ENEMY_HEALTH:Number				= 2.5; // slightly less than max beef strength for noticeable overkill
	}

}
package
{
  import org.flixel.FlxGroup;
	/**
   * ...
   * @author Rafael Wenzel
   */
  public class Globals
  {

    public function Globals()
    {
    }
    // graphics
    [Embed(source = '../assets/graphics/tiles.png')] public static const GFX_TILES:Class;

    [Embed(source = '../assets/music/beat1.mp3')] public static const MUSIC_BEAT_1:Class;

    public static const GAME_SCALE:Number = 2;
    public static const GAME_WIDTH:int = 640;
    public static const GAME_HEIGHT:int = 480;

    public static const GAME_TILE_WIDTH:int = 16;
    public static const GAME_TILE_HEIGHT:int = 16;

    //public static var GAME_LAYER_WORLD:FlxGroup;

    public static const PLAYER_FPS:int = 10;
    public static const PLAYER_SPEED:int = 132;
    public static const PLAYER_SPEED_JUMP:int = 180;
    public static const PLAYER_JUMP:int = 210;
    public static const PLAYER_JUMP_MAX:Number = 0.30;
    public static const PLAYER_JUMP_MIN:Number = 0.0325;
    public static const PLAYER_GRAVITY:int = 300;
    public static const PLAYER_ACCELERATION:Number = Globals.PLAYER_SPEED / 5;
    public static const PLAYER_DECELERATION:Number = Globals.PLAYER_SPEED / 20;
    public static const PLAYER_OVERLEDGE:Number = 0.095;

  }

}
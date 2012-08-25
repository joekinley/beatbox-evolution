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

    [Embed(source = '../assets/sounds/wub1.mp3')] public static const SOUND_WUB_1:Class;
    [Embed(source = '../assets/sounds/wub2.mp3')] public static const SOUND_WUB_2:Class;

    [Embed(source = '../assets/sounds/bm.mp3')] public static const SOUND_BM_1:Class;
    [Embed(source = '../assets/sounds/b1.mp3')] public static const SOUND_B_1:Class;
    [Embed(source = '../assets/sounds/eh1.mp3')] public static const SOUND_EH_1:Class;
    [Embed(source = '../assets/sounds/k1.mp3')] public static const SOUND_K_1:Class;
    [Embed(source = '../assets/sounds/pf1.mp3')] public static const SOUND_PF_1:Class;
    [Embed(source = '../assets/sounds/pft.mp3')] public static const SOUND_PFT_1:Class;
    [Embed(source = '../assets/sounds/tz1.mp3')] public static const SOUND_TZ_1:Class;
    [Embed(source = '../assets/sounds/psch1.mp3')] public static const SOUND_PSCH_1:Class;

    public static var GAME_SOUNDS:Array;

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
    public static const PLAYER_GRAVITY:int = 150;
    public static const PLAYER_ACCELERATION:Number = Globals.PLAYER_SPEED / 5;
    public static const PLAYER_DECELERATION:Number = Globals.PLAYER_SPEED / 20;
    public static const PLAYER_OVERLEDGE:Number = 0.095;


    public static function getSingleArray( no:int ):Array {
      var ret:Array = new Array( 1 );
      ret[ 0 ] = no;
      return ret;
    }
  }

}
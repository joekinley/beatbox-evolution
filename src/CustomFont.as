package
{
  import org.flixel.plugin.photonstorm.FlxBitmapFont;
	/**
   * ...
   * @author Rafael Wenzel
   */
  public class CustomFont extends FlxBitmapFont
  {

    public function CustomFont()
    {
      super( Globals.GFX_PARTICLES, Globals.GAME_PARTICLE_WIDHT, Globals.GAME_PARTICLE_HEIGHT, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 10 );
    }

  }

}
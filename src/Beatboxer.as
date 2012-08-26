package
{
  import org.flixel.FlxSprite;
	/**
   * ...
   * @author Rafael Wenzel
   */
  public class Beatboxer extends FlxSprite
  {

    public function Beatboxer( no:int, xPos:int, yPos:int )
    {
      super( xPos, yPos );
      this.loadGraphic( Globals.GFX_TILES, true, false, Globals.GAME_TILE_WIDTH, Globals.GAME_TILE_HEIGHT );
      this.addAnimation( 'play1', [3, 3, 3, 4, 3, 4, 4, 3, 4], Globals.BB_FPS );
      this.addAnimation( 'play2', [4, 3, 4, 3, 3, 4, 3, 4, 4], Globals.BB_FPS );

      if ( no == 0 ) this.play( 'play1' );
      else this.play( 'play2' );
    }

  }

}
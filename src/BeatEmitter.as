package
{
  import org.flixel.FlxEmitter;
  import org.flixel.FlxParticle;
  import org.flixel.FlxText;
	/**
   * ...
   * @author Rafael Wenzel
   */
  public class BeatEmitter extends FlxEmitter
  {
    private var max:int;

    public function BeatEmitter( xPos:int, yPos:int, type:String )
    {
      this.max = 1;
      super( xPos, yPos, this.max );
      this.bounce = 1;
      this.gravity = Globals.PARTICLE_GRAVITY;
      this.lifespan = 1.3;

      this.setXSpeed( -Globals.PLAYER_SPEED / 2, Globals.PLAYER_SPEED / 2 );
      this.setYSpeed( -Globals.PLAYER_SPEED / 2, Globals.PLAYER_SPEED / 2 );

      for ( var i:int = 0; i < this.max; i++ ) {
        var particle:BeatParticle = new BeatParticle( type );
        this.add( particle );
      }
    }

    public function updatePosition( xPos:int, yPos:int ):void {
      this.x = xPos + Globals.GAME_TILE_WIDTH / 2;
      this.y = yPos + Globals.GAME_TILE_HEIGHT;
      this.start( true, this.lifespan );
    }

  }

}
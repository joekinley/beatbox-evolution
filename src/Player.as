package
{
  import org.flixel.FlxG;
  import org.flixel.FlxObject;
  import org.flixel.FlxSprite;
	/**
   * ...
   * @author Rafael Wenzel
   */
  public class Player extends FlxSprite
  {

    private var jump:Number;
    private var inAirTime:Number;

    public function Player()
    {
      super( 16, 16);

      this.jump = 0;
      this.inAirTime = 0;

      this.acceleration.y = Globals.PLAYER_GRAVITY;
      this.maxVelocity.y = Globals.PLAYER_GRAVITY * 2;

      this.loadGraphic( Globals.GFX_TILES, false, false, Globals.GAME_TILE_WIDTH, Globals.GAME_TILE_HEIGHT );
      this.addAnimation( 'idle', [1], Globals.PLAYER_FPS );
    }

    override public function update( ):void {
      super.update( );

      this.handleMovement( );
      this.handleAnimation( );
    }

    public function handleMovement( ):void {
      // handle deceleration
      if ( velocity.x != 0 && !FlxG.keys.LEFT && !FlxG.keys.RIGHT ) {
        if ( velocity.x > 0 ) velocity.x -= Globals.PLAYER_DECELERATION;
        else if ( velocity.x < 0 ) velocity.x += Globals.PLAYER_DECELERATION;

        // minimal values
        if ( Math.abs( velocity.x ) < Globals.PLAYER_DECELERATION ) velocity.x = 0;
      }

      // handle basic movement
      this.inAirTime += FlxG.elapsed;

      // left
      if ( FlxG.keys.LEFT ) {
        velocity.x -= Globals.PLAYER_ACCELERATION;

        // max values
        if ( this.jump > 0 && velocity.x < -Globals.PLAYER_SPEED_JUMP ) velocity.x = -Globals.PLAYER_SPEED_JUMP;
        else if ( velocity.x < -Globals.PLAYER_SPEED ) velocity.x = -Globals.PLAYER_SPEED;
      }

      // right
      if ( FlxG.keys.RIGHT ) {
        velocity.x += Globals.PLAYER_ACCELERATION;

        // max values
        if ( this.jump > 0 && velocity.x > Globals.PLAYER_SPEED_JUMP ) velocity.x = Globals.PLAYER_SPEED_JUMP;
        else if ( velocity.x > Globals.PLAYER_SPEED ) velocity.x = Globals.PLAYER_SPEED;
      }

      // jump
      // key handling
      if ( FlxG.keys.UP && this.jump >= 0 ) {
        this.jump += FlxG.elapsed;
        if ( this.jump > Globals.PLAYER_JUMP_MAX ) this.jump = -1;
      } else if ( this.inAirTime > Globals.PLAYER_OVERLEDGE ) {
        this.jump = -1;
      }
      // actual jump
      if ( this.jump > 0 ) {
        if ( this.jump < Globals.PLAYER_JUMP_MIN ) velocity.y = -Globals.PLAYER_JUMP;
      } else if ( !this.isTouching( FlxObject.FLOOR ) ) {
        velocity.y += Globals.PLAYER_GRAVITY;
      }

      // touching floor
      if ( this.isTouching( FlxObject.FLOOR ) ) {
        this.jump = 0;
        this.inAirTime = 0;
      }
    }

    public function handleAnimation( ):void {
      if ( velocity.x == 0 && velocity.y == 0 ) play( 'idle' );
    }

  }

}
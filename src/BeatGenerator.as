package
{
  import org.flixel.FlxG;
  import org.flixel.plugin.photonstorm.FlxMath;
	/**
   * ...
   * @author Rafael Wenzel
   */
  public class BeatGenerator
  {

    public function BeatGenerator()
    {

    }

    public function generateBeat( ):Beat {
      var beat:Beat = new Beat;

      beat.applyBeat1( this.randomBeat( 16, 2, 5 ) );
      beat.applyBeat4( this.randomBeat( 16, 4, 35 ) );
      beat.applyBeat8( this.randomBeat( 16, 4, 55 ) );
      beat.applyBeat16( this.randomBeat( 16, 2, 20 ) );

      return beat;
    }

    private function randomBeat( count:int, different:int, chance:int ):Array {
      var ret:Array = new Array;
      var useBeats:Array = new Array;

      // fill use Beats with random
      for ( var i:int = 0; i < different; i++ ) {
        useBeats.push( FlxMath.rand( 1, Globals.GAME_SOUNDS.length, useBeats ) );
      }

      for ( i = 0; i < count; i++ ) {
        var rand:int = FlxMath.rand( 0, 100 );
        if ( rand <= chance ) {
          ret.push( FlxG.getRandom( useBeats ) );
        } else {
          ret.push( 0 );
        }
      }

      return ret;
    }

    public function testBeat( ):Beat {
      var beat:Beat = new Beat;

      beat.applyBeat1( Globals.getSingleArray( 0 ) );
      beat.applyBeat4( new Array( 0 ) );
      beat.applyBeat8( new Array( 3, 4, 7, 4, 3, 8, 6, 4 ) );
      beat.applyBeat16( new Array( 0, 4, 0, 5) );

      return beat;
    }
  }

}
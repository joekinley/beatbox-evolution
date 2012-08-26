package
{
  import org.flixel.FlxParticle;
	/**
   * ...
   * @author Rafael Wenzel
   */
  public class BeatParticle extends FlxParticle
  {
    private var type:String;

    public function BeatParticle( type:String )
    {
      this.loadGraphic( Globals.GFX_PARTICLES, true, false, Globals.GAME_PARTICLE_WIDHT, Globals.GAME_PARTICLE_HEIGHT );
      this.initializeAnimation( );
      this.play( 'idle' );
      this.type = type;
    }

    override public function onEmit( ):void {
      this.play( this.type );
      this.alpha = 1;
    }

    override public function update( ):void {
      this.alpha -= 0.01;
    }

    private function initializeAnimation( ):void {
      this.addAnimation( 'IDLE', [ 14 ] );
      this.addAnimation( 'BM', [ 0 ] );
      this.addAnimation( 'PFT', [ 1 ] );
      this.addAnimation( 'B', [ 2 ] );
      this.addAnimation( 'TZ', [ 3 ] );
      this.addAnimation( 'K', [ 4 ] );
      this.addAnimation( 'PF', [ 5 ] );
      this.addAnimation( 'EH', [ 6 ] );
      this.addAnimation( 'POP', [ 7 ] );
      this.addAnimation( 'DROP', [ 8 ] );
      this.addAnimation( 'PSH', [ 9 ] );
      this.addAnimation( 'WUH', [ 10 ] );
      this.addAnimation( 'TSH', [ 11 ] );
      this.addAnimation( 'CHA', [ 12 ] );
      this.addAnimation( 'TING', [ 13 ] );
    }

  }

}
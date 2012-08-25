package
{
  import org.flixel.FlxG;
  import org.flixel.FlxGroup;
  import org.flixel.FlxState;
	/**
   * ...
   * @author Rafael Wenzel
   */
  public class Game extends FlxState
  {

    private var level:Level;
    private var player:Player;
    private var beatbox:Beatbox;
    private var beatgenerator:BeatGenerator;

    private var layer_world:FlxGroup;
    private var layer_player:FlxGroup;

    public function Game()
    {

    }

    override public function create( ):void {
      super.create( );
      this.initLayers( );
      this.initLevel( );
      this.initPlayer( );
      this.initBeatbox( );
      this.initBeatgenerator( );

      //FlxG.playMusic( Globals.MUSIC_BEAT_1 );
    }

    public function initLayers( ):void {
      this.layer_world = new FlxGroup;
      this.layer_player = new FlxGroup;

      this.add( this.layer_world );
      this.add( this.layer_player );

      // register globals
      //Globals.GAME_LAYER_WORLD = this.layer_world;
    }

    public function initLevel( ):void {
      this.level = new Level;
      this.layer_world.add( this.level.getLvlMap( ) );
    }

    public function initPlayer( ):void {
      this.player = new Player( );
      this.layer_player.add( this.player );
    }

    public function initBeatbox( ):void {
      this.beatbox = new Beatbox( 120 );
    }

    public function initBeatgenerator( ):void {
      this.beatgenerator = new BeatGenerator;
      this.beatbox.addBeat( this.beatgenerator.generateBeat( ) );
    }

    override public function destroy( ):void {
      //FlxG.music.stop( );
      super.destroy( );
    }

    override public function update( ):void {
      super.update( );
      this.debug( );
      // update beatbox
      this.beatbox.update( );

      // collide player with world
      FlxG.collide( this.layer_player, this.layer_world );
    }

    public function debug( ):void {
      if ( FlxG.keys.justPressed( 'ONE' ) ) FlxG.switchState( new Game( ) );
    }

  }

}
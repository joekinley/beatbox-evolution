package
{
  import org.flixel.FlxG;
  import org.flixel.FlxGroup;
  import org.flixel.FlxObject;
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
    private var layer_beatboxers:FlxGroup;
    private var layer_enemies:FlxGroup;
    private var layer_particles:FlxGroup;
    private var layer_player:FlxGroup;

    public function Game()
    {

    }

    override public function create( ):void {
      super.create( );
      this.initLayers( );
      this.initPlayer( );
      this.initBeatbox( );
      this.initBeatgenerator( );
      this.initLevel( );
    }

    public function initLayers( ):void {
      this.layer_world = new FlxGroup;
      this.layer_beatboxers = new FlxGroup;
      this.layer_enemies = new FlxGroup;
      this.layer_particles = new FlxGroup;
      this.layer_player = new FlxGroup;

      this.add( this.layer_world );
      this.add( this.layer_beatboxers );
      this.add( this.layer_enemies );
      this.add( this.layer_particles );
      this.add( this.layer_player );

      // register globals
      Globals.GAME_LAYER_BEATBOXERS = this.layer_beatboxers;
      Globals.GAME_LAYER_ENEMIES = this.layer_enemies;
      Globals.GAME_LAYER_PARTICLES = this.layer_particles;
    }

    public function initLevel( ):void {
      this.level = new Level;
      this.level.spawnEnemies( this.beatbox );
      this.layer_world.add( this.level.getLvlMap( ) );
    }

    public function initPlayer( ):void {
      this.player = new Player( );
      this.layer_player.add( this.player );
    }

    public function initBeatbox( ):void {
      this.beatbox = new Beatbox( 120 );
      Globals.GAME_BEATBOX = this.beatbox;
    }

    public function initBeatgenerator( ):void {
      this.beatgenerator = new BeatGenerator;
      this.beatbox.addBeat( this.beatgenerator.generateBeat( ) );
    }

    override public function destroy( ):void {
      if( FlxG.music != null ) FlxG.music.stop( );
      super.destroy( );
    }

    override public function update( ):void {
      super.update( );
      this.debug( );
      // update beatbox
      this.beatbox.update( );

      // collide player with world
      FlxG.collide( this.layer_player, this.layer_world );
      FlxG.collide( this.layer_enemies, this.layer_world );
      FlxG.collide( this.layer_player, this.layer_enemies, this.playerEnemyCollision );
    }

    private function playerEnemyCollision( player:Player, enemy:Enemy ):void {

      if ( player.justTouched( FlxObject.FLOOR ) && enemy.justTouched( FlxObject.CEILING ) ) {
        if ( !enemy.isAttacking( ) ) {
          this.beatbox.killEnemy( enemy );
          return;
        }
      }

      FlxG.switchState( new Game( ) );
    }

    public function debug( ):void {
      if ( FlxG.keys.justPressed( 'ONE' ) || FlxG.keys.justPressed( 'SPACE' ) ) FlxG.switchState( new Game( ) );
      if ( FlxG.keys.justPressed( 'TWO' ) ) this.beatbox.addBeat( this.beatgenerator.generateBeat( ) );
    }

  }

}
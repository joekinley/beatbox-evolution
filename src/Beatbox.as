package
{
  import org.flixel.FlxG;
  import org.flixel.FlxSound;
	/**
   * ...
   * @author Rafael Wenzel
   */
  public class Beatbox
  {

    private var queue:Array;
    private var queueNo:int = 0;
    private var queueBeats:int = 0;
    private var queueItem:Beat = null;

    private var bpm:int = 0;
    private var bps:int = 0; // calculating beats per second
    private var beattimer:Number = 0;
    private var beatcounter:Number = 0;
    private var beattick:Number = 0;

    private var beat1:int = 1; // will count current beats (1 on first strike, 0 instead)
    private var beat4:int = 1; // will count quarter beats (1, 2, 3, 4, 0 instead)
    private var beat8:int = 1; // will count eighth beats (1, 2, 3, 4, 5, 6, 7, 8, 0 instead)
    private var beat16:int = 1; // counts sixteenth beats( 1-16, 0 instead)

    private var justbeat1:Boolean = false;
    private var justbeat4:Boolean = false;
    private var justbeat8:Boolean = false;
    private var justbeat16:Boolean = false;

    private var currentBeat1:Array;
    private var currentBeat4:Array;
    private var currentBeat8:Array;
    private var currentBeat16:Array;

    private var enemy1:Array;
    private var enemy4:Array;
    private var enemy8:Array;
    private var enemy16:Array;

    private var sounds:Array;
    private var wubSound:FlxSound;

    public function Beatbox( bpm:int )
    {
      this.bpm = bpm;
      this.bps = this.bpm / 60;
      this.queue = new Array;
      this.sounds = new Array;

      this.enemy1 = new Array;
      this.enemy4 = new Array;
      this.enemy8 = new Array;
      this.enemy16 = new Array;

      this.initializeSounds( );
    }

    public function getQueue( ):Array {
      return this.queue;
    }

    public function hasJustbeat1( ):Boolean {
      return this.justbeat1;
    }
    public function hasJustbeat4( ):Boolean {
      return this.justbeat4;
    }
    public function hasJustbeat8( ):Boolean {
      return this.justbeat8;
    }
    public function hasJustbeat16( ):Boolean {
      return this.justbeat16;
    }

    public function addEnemy1( idx:int, enemy:Enemy ):void {
      this.enemy1[ idx ] = enemy;
    }
    public function addEnemy4( idx:int, enemy:Enemy ):void {
      this.enemy4[ idx ] = enemy;
    }
    public function addEnemy8( idx:int, enemy:Enemy ):void {
      this.enemy8[ idx ] = enemy;
    }
    public function addEnemy16( idx:int, enemy:Enemy ):void {
      this.enemy16[ idx ] = enemy;
    }

    public function update( ):void {
      this.countBeats( );

       // check for new queue
       this.updateQueue( );

       // play queue
       this.playQueue( );
    }

    private function updateQueue( ):void {
      // handle new queue item
      if ( this.queueItem == null || this.queueBeats > this.queueItem.getBeats( ) ) {
        // properly handle queue no
        this.queueNo++;
        if ( this.queueNo > this.queue.length - 1 ) {
          this.queueNo = 0;
        }

        // select new queue item
        this.queueItem = this.queue[ this.queueNo ];

        this.currentBeat1 = this.queueItem.getBeat1( ).slice( );
        this.currentBeat4 = this.queueItem.getBeat4( ).slice( );
        this.currentBeat8 = this.queueItem.getBeat8( ).slice( );
        this.currentBeat16 = this.queueItem.getBeat16( ).slice( );
        this.queueBeats = 0;

        if( FlxG.music != null ) FlxG.music.stop( );
        FlxG.playMusic( Globals.MUSIC_BEAT_1 );
      }

      // handle empty beat queues
      if ( this.currentBeat1.length == 0 ) this.currentBeat1 = this.queueItem.getBeat1( ).slice( );
      if ( this.currentBeat4.length == 0 ) this.currentBeat4 = this.queueItem.getBeat4( ).slice( );
      if ( this.currentBeat8.length == 0 ) this.currentBeat8 = this.queueItem.getBeat8( ).slice( );
      if ( this.currentBeat16.length == 0 ) this.currentBeat16 = this.queueItem.getBeat16( ).slice( );

    }

    public function playQueue( ):void {
      if ( this.justbeat1 ) this.playBeat( this.currentBeat1.shift( ), 1 );
      if ( this.justbeat4 ) this.playBeat( this.currentBeat4.shift( ), 4 );
      if ( this.justbeat8 ) this.playBeat( this.currentBeat8.shift( ), 8 );
      if ( this.justbeat16 ) this.playBeat( this.currentBeat16.shift( ), 16 );
    }

    public function addBeat( beat:Beat ):void {
      this.queue.push( beat );
    }

    private function countBeats( ):void {
      var oldbeat1:int = this.beat1;
      var oldbeat4:int = this.beat4;
      var oldbeat8:int = this.beat8;
      var oldbeat16:int = this.beat16;
      var oldbeattick:Number = Math.floor( ( this.beattick / ( 1 / ( this.bps * 4 ) ) ) );
      var newbeattick:Number = Math.floor( ( ( this.beattick+FlxG.elapsed ) / ( 1 / ( this.bps * 4 ) ) ) );

      // main beat timer counter
      this.beattick += FlxG.elapsed;
      this.beattimer += FlxG.elapsed;

      // full beat
      this.beat1 = 0;

      // quarter beat
      this.beat4 = this.beattimer / ( 1 / this.bps );

      // eigth beat
      this.beat8 = this.beattimer / ( 1 / ( this.bps * 2 ) );

      // sixteenth beat
      this.beat16 = this.beattimer / ( 1 / ( this.bps * 4 ) );

      // reset
      if ( this.beat4 == 4 ) {
        this.beat1 = 1;
        this.beat4 = 0;
        this.beat8 = 0;
        this.beat16 = 0;
        this.beattimer = 0;
        this.queueBeats++;
      }

      if ( oldbeat1 != this.beat1 ) this.justbeat1 = true;
      else this.justbeat1 = false;

      if ( oldbeat4 != this.beat4 ) this.justbeat4 = true;
      else this.justbeat4 = false;

      if ( oldbeat8 != this.beat8 ) this.justbeat8 = true;
      else this.justbeat8 = false;

      if ( oldbeat16 != this.beat16 ) this.justbeat16 = true;
      else this.justbeat16 = false;
    }

    private function initializeSounds( ):void {
      this.sounds[ 1 ] = FlxG.loadSound( Globals.SOUND_BM_1 );
      this.sounds[ 2 ] = FlxG.loadSound( Globals.SOUND_PFT_1 );
      this.sounds[ 3 ] = FlxG.loadSound( Globals.SOUND_B_1 );
      this.sounds[ 4 ] = FlxG.loadSound( Globals.SOUND_TZ_1 );
      this.sounds[ 5 ] = FlxG.loadSound( Globals.SOUND_K_1 );
      this.sounds[ 6 ] = FlxG.loadSound( Globals.SOUND_PF_1 );
      this.sounds[ 7 ] = FlxG.loadSound( Globals.SOUND_PSCH_1 );
      this.sounds[ 8 ] = FlxG.loadSound( Globals.SOUND_EH_1 );
      this.sounds[ 9 ] = FlxG.loadSound( Globals.SOUND_POP_1 );
      this.sounds[ 10 ] = FlxG.loadSound( Globals.SOUND_DROP_1 );
      this.sounds[ 11 ] = FlxG.loadSound( Globals.SOUND_POP_2 );
      this.sounds[ 12 ] = FlxG.loadSound( Globals.SOUND_TSCH_1 );
      this.sounds[ 13 ] = FlxG.loadSound( Globals.SOUND_WUH_1 );
      this.sounds[ 14 ] = FlxG.loadSound( Globals.SOUND_BM_2 );
      this.sounds[ 15 ] = FlxG.loadSound( Globals.SOUND_CHA_1 );
      this.sounds[ 16 ] = FlxG.loadSound( Globals.SOUND_TING_1 );
      this.wubSound = FlxG.loadSound( Globals.SOUND_WUB_1 );
      Globals.GAME_SOUNDS = this.sounds;
    }

    public function killEnemy( enemy:Enemy ):void {
      var type:int = enemy.getBoundType( );
      switch( type ) {
        case 1: this.enemy1.splice( enemy.getBoundBeat( ) ); break;
        case 4: this.enemy4.splice( enemy.getBoundBeat( ) ); break;
        case 8: this.enemy8.splice( enemy.getBoundBeat( ) ); break;
        case 16: this.enemy16.splice( enemy.getBoundBeat( ) ); break;
      }
      this.removeBeat( enemy.getBoundBeat( ), enemy.getBoundType( ) );
      Globals.GAME_LAYER_ENEMIES.remove( enemy, true );
    }

    private function removeBeat( beat:int, type:int ):void {
      var temp:Array;
      var beatObj:Beat = this.queue[ 0 ];
      switch( type ) {
        case 1: temp = beatObj.getBeat1( ); break;
        case 4: temp = beatObj.getBeat4( ); break;
        case 8: temp = beatObj.getBeat8( ); break;
        case 16: temp = beatObj.getBeat16( ); break;
      }

      for ( var i:int = 0; i < temp.length; i++ ) {
        if ( temp[ i ] == beat ) temp[ i ] = 0; // -1;
      }
    }

    private function playBeat( no:int, beat:int ):void {

      switch( no ) {
        case -1: this.wubSound.play( true ); break;
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
          (FlxSound)(this.sounds[ no ]).play( true );
          switch( beat ) {
            case 1: if( this.enemy1[ no ] != null ) (Enemy)(this.enemy1[ no ]).attack( 1 ); break;
            case 4: if( this.enemy4[ no ] != null ) (Enemy)(this.enemy4[ no ]).attack( 4 ); break;
            case 8: if( this.enemy8[ no ] != null ) (Enemy)(this.enemy8[ no ]).attack( 8 ); break;
            case 16: if( this.enemy16[ no ] != null ) (Enemy)(this.enemy16[ no ]).attack( 16 ); break;
          }
          break;
        case 20:
          (FlxSound)(this.sounds[ no ]).play( true );
          break;
        default: break;
      }
    }

  }

}
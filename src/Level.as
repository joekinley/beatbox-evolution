package
{
  import org.flixel.FlxPoint;
  import org.flixel.FlxTilemap;
  import org.flixel.plugin.photonstorm.FlxMath;
  import org.flixel.system.FlxTile;
	/**
   * ...
   * @author Rafael Wenzel
   */
  public class Level
  {

    private var lvlMap:FlxTilemap;

    public function Level()
    {
      this.lvlMap = new FlxTilemap;
      this.initializeLevel( );
      this.initializeBeatboxers( );
    }

    public function getLvlMap( ):FlxTilemap {
      return this.lvlMap;
    }

    public function spawnEnemies( beatbox:Beatbox ):void {
      var beat:Beat = beatbox.getQueue( )[ 0 ];
      var taken:Array = new Array;
      var current:Array;
      var i:int;

      // 1 beats
      current = beat.getBeat1( );
      for ( i = 0; i < current.length; i++ ) {
        // create new enemy
        if ( current[ i ] > 0 && taken.indexOf( current[ i ] ) == -1 ) {
          beatbox.addEnemy1( current[ i ], this.spawnEnemy( current[ i ], 1 ) );
          taken.push( current[ i ] );
        }
      }
      taken = new Array;

      // 4 beats
      current = beat.getBeat4( );
      for ( i = 0; i < current.length; i++ ) {
        // create new enemy
        if ( current[ i ] > 0 && taken.indexOf( current[ i ] ) == -1 ) {
          beatbox.addEnemy4( current[ i ], this.spawnEnemy( current[ i ], 4 ) );
          taken.push( current[ i ] );
        }
      }
      taken = new Array;

      // 8 beats
      current = beat.getBeat8( );
      for ( i = 0; i < current.length; i++ ) {
        // create new enemy
        if ( current[ i ] > 0 && taken.indexOf( current[ i ] ) == -1 ) {
          beatbox.addEnemy8( current[ i ], this.spawnEnemy( current[ i ], 8 ) );
          taken.push( current[ i ] );
        }
      }
      taken = new Array;

      // 16 beats
      current = beat.getBeat16( );
      for ( i = 0; i < current.length; i++ ) {
        // create new enemy
        if ( current[ i ] > 0 && taken.indexOf( current[ i ] ) == -1 ) {
          beatbox.addEnemy16( current[ i ], this.spawnEnemy( current[ i ], 16 ) );
          taken.push( current[ i ] );
        }
      }
      taken = new Array;
    }

    private function spawnEnemy( beat:int, type:int ):Enemy {
      var enemy:Enemy;
      var point:FlxPoint;

      point = this.getRandomSpawnPoint( );
      enemy = new Enemy( beat, point.x * Globals.GAME_TILE_WIDTH, point.y * Globals.GAME_TILE_HEIGHT );
      enemy.setBoundBeat( beat );
      enemy.setBoundType( type );

      Globals.GAME_LAYER_ENEMIES.add( enemy );
      return enemy;
    }

    private function getRandomSpawnPoint( ):FlxPoint {
      var xPos:int, yPos:int;

      while ( true ) {
        xPos = FlxMath.rand( 2, this.lvlMap.widthInTiles - 2 );
        yPos = FlxMath.rand( 2, this.lvlMap.heightInTiles -2 );
        if ( this.lvlMap.getTile( xPos, yPos ) == 0 ) break;
      }

      var point:FlxPoint = new FlxPoint( xPos, yPos );
      return point;
    }

    public function initializeLevel( ):void {
      this.lvlMap.loadMap( this.dummyLevelMap( ), Globals.GFX_TILES, Globals.GAME_TILE_WIDTH, Globals.GAME_TILE_HEIGHT, 0, 1, 1, 1 );
    }

    public function initializeBeatboxers( ):void {
      var points:Array = this.lvlMap.getTileCoords( 4, false );
      var tile:FlxPoint;
      var i:int;
      var bb:Beatboxer;

      for ( i = 0; i < points.length; i++ ) {
        tile = points[ i ];
        bb = new Beatboxer( 0, tile.x, tile.y );
        Globals.GAME_LAYER_BEATBOXERS.add( bb );

        this.lvlMap.setTile( tile.x / Globals.GAME_TILE_WIDTH, tile.y / Globals.GAME_TILE_HEIGHT, 0 );
      }

      points = this.lvlMap.getTileCoords( 5, false );
      for ( i = 0; i < points.length; i++ ) {
        tile = points[ i ];
        bb = new Beatboxer( 1, tile.x, tile.y );
        Globals.GAME_LAYER_BEATBOXERS.add( bb );

        this.lvlMap.setTile( tile.x / Globals.GAME_TILE_WIDTH, tile.y / Globals.GAME_TILE_HEIGHT, 0 );
      }
    }

    public function dummyLevelMap( ):String {
      return FlxTilemap.arrayToCSV( new Array(
         3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
         3, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5, 0, 0, 0, 0, 0, 0, 0, 0, 3,
         3, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 3,
         3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3,
         3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3,
         3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3,
         3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3,
         3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3,
         3, 0, 0, 0, 0, 0, 3, 3, 0, 0, 0, 0, 3, 3, 0, 0, 0, 0, 0, 3,
         3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3,
         3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3,
         3, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 3,
         3, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 3,
         3, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 3,
         3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3
      ), 20 );
    }
  }

}
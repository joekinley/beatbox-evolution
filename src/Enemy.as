package
{
  import org.flixel.FlxG;
  import org.flixel.FlxSprite;
	/**
   * ...
   * @author Rafael Wenzel
   */
  public class Enemy extends FlxSprite
  {
    private var particleEmitter:BeatEmitter;
    private var attacking:Boolean = false;
    private var attackingTimer:Number = 0;

    private var boundBeat:int = 0;
    private var boundType:int = 0;

    public function Enemy( type:int, xPos:int, yPos:int )
    {
      super( xPos, yPos );
      this.loadGraphic( Globals.GFX_ENEMIES, true, false, Globals.GAME_ENEMY_WIDTH, Globals.GAME_ENEMY_HEIGHT );
      this.initializeEnemy( type );
      this.play( 'idle' );
      this.acceleration.y = Globals.PLAYER_GRAVITY;
      this.maxVelocity.y = Globals.PLAYER_GRAVITY * 5;
    }

    public function getBoundBeat( ):int {
      return this.boundBeat;
    }
    public function setBoundBeat( to:int ):void {
      this.boundBeat = to;
    }
    public function getBoundType( ):int {
      return this.boundType;
    }
    public function setBoundType( to:int ):void {
      this.boundType = to;
    }

    public function isAttacking( ):Boolean {
      return this.attacking;
    }

    override public function update( ):void {
      super.update( );

      // handle attacking
      if ( this.attacking ) {
        this.attackingTimer -= FlxG.elapsed;

        if ( this.attackingTimer <= 0 ) {
          this.attacking = false;
          this.play( 'idle' );
        }
      }
    }

    private function initializeEnemy( type:int ):void {
      switch( type ) {
        case 1: // BM1
          this.addAnimation( 'idle', [0, 1], Globals.ENEMY_FPS );
          this.addAnimation( 'right', [2, 3], Globals.ENEMY_FPS );
          this.addAnimation( 'left', [4, 5], Globals.ENEMY_FPS );
          this.addAnimation( 'beat', [6, 7], Globals.ENEMY_FPS );
          this.addAnimation( 'die', [8, 9], Globals.ENEMY_FPS );
          this.particleEmitter = new BeatEmitter( this.x, this.y, 'BM' );
          break;
        case 2: // PFT1
          this.addAnimation( 'idle', [10, 11], Globals.ENEMY_FPS );
          this.addAnimation( 'right', [12, 13], Globals.ENEMY_FPS );
          this.addAnimation( 'left', [14, 15], Globals.ENEMY_FPS );
          this.addAnimation( 'beat', [16, 17], Globals.ENEMY_FPS );
          this.addAnimation( 'die', [18, 19], Globals.ENEMY_FPS );
          this.particleEmitter = new BeatEmitter( this.x, this.y, 'PFT' );
          break;
        case 3: // B1
          this.addAnimation( 'idle', [20, 21], Globals.ENEMY_FPS );
          this.addAnimation( 'right', [22, 23], Globals.ENEMY_FPS );
          this.addAnimation( 'left', [24, 25], Globals.ENEMY_FPS );
          this.addAnimation( 'beat', [26, 27], Globals.ENEMY_FPS );
          this.addAnimation( 'die', [28, 29], Globals.ENEMY_FPS );
          this.particleEmitter = new BeatEmitter( this.x, this.y, 'B' );
          break;
        case 4: // TZ1
          this.addAnimation( 'idle', [30, 31], Globals.ENEMY_FPS );
          this.addAnimation( 'right', [32, 33], Globals.ENEMY_FPS );
          this.addAnimation( 'left', [34, 35], Globals.ENEMY_FPS );
          this.addAnimation( 'beat', [36, 37], Globals.ENEMY_FPS );
          this.addAnimation( 'die', [38, 39], Globals.ENEMY_FPS );
          this.particleEmitter = new BeatEmitter( this.x, this.y, 'TZ' );
          break;
        case 5: // K1
          this.addAnimation( 'idle', [40, 41], Globals.ENEMY_FPS );
          this.addAnimation( 'right', [42, 43], Globals.ENEMY_FPS );
          this.addAnimation( 'left', [44, 45], Globals.ENEMY_FPS );
          this.addAnimation( 'beat', [46, 47], Globals.ENEMY_FPS );
          this.addAnimation( 'die', [48, 49], Globals.ENEMY_FPS );
          this.particleEmitter = new BeatEmitter( this.x, this.y, 'K' );
          break;
        case 6: // PF1
          this.addAnimation( 'idle', [50, 51], Globals.ENEMY_FPS );
          this.addAnimation( 'right', [52, 53], Globals.ENEMY_FPS );
          this.addAnimation( 'left', [54, 55], Globals.ENEMY_FPS );
          this.addAnimation( 'beat', [56, 57], Globals.ENEMY_FPS );
          this.addAnimation( 'die', [58, 59], Globals.ENEMY_FPS );
          this.particleEmitter = new BeatEmitter( this.x, this.y, 'PF' );
          break;
        case 7: // PSCH1
          this.addAnimation( 'idle', [60, 61], Globals.ENEMY_FPS );
          this.addAnimation( 'right', [62, 63], Globals.ENEMY_FPS );
          this.addAnimation( 'left', [64, 65], Globals.ENEMY_FPS );
          this.addAnimation( 'beat', [66, 67], Globals.ENEMY_FPS );
          this.addAnimation( 'die', [68, 69], Globals.ENEMY_FPS );
          this.particleEmitter = new BeatEmitter( this.x, this.y, 'PSH' );
          break;
        case 8: // EH1
          this.addAnimation( 'idle', [70, 71], Globals.ENEMY_FPS );
          this.addAnimation( 'right', [72, 73], Globals.ENEMY_FPS );
          this.addAnimation( 'left', [74, 75], Globals.ENEMY_FPS );
          this.addAnimation( 'beat', [76, 77], Globals.ENEMY_FPS );
          this.addAnimation( 'die', [78, 79], Globals.ENEMY_FPS );
          this.particleEmitter = new BeatEmitter( this.x, this.y, 'EH' );
          break;
        case 9: // POP1
          this.addAnimation( 'idle', [80, 81], Globals.ENEMY_FPS );
          this.addAnimation( 'right', [82, 83], Globals.ENEMY_FPS );
          this.addAnimation( 'left', [84, 85], Globals.ENEMY_FPS );
          this.addAnimation( 'beat', [86, 87], Globals.ENEMY_FPS );
          this.addAnimation( 'die', [88, 89], Globals.ENEMY_FPS );
          this.particleEmitter = new BeatEmitter( this.x, this.y, 'POP' );
          break;
        case 10: // DROP1
          this.addAnimation( 'idle', [90, 91], Globals.ENEMY_FPS );
          this.addAnimation( 'right', [92, 93], Globals.ENEMY_FPS );
          this.addAnimation( 'left', [94, 95], Globals.ENEMY_FPS );
          this.addAnimation( 'beat', [96, 97], Globals.ENEMY_FPS );
          this.addAnimation( 'die', [98, 99], Globals.ENEMY_FPS );
          this.particleEmitter = new BeatEmitter( this.x, this.y, 'DROP' );
          break;
        case 11: // POP2
          this.addAnimation( 'idle', [100, 101], Globals.ENEMY_FPS );
          this.addAnimation( 'right', [102, 103], Globals.ENEMY_FPS );
          this.addAnimation( 'left', [104, 105], Globals.ENEMY_FPS );
          this.addAnimation( 'beat', [106, 107], Globals.ENEMY_FPS );
          this.addAnimation( 'die', [108, 109], Globals.ENEMY_FPS );
          this.particleEmitter = new BeatEmitter( this.x, this.y, 'POP' );
          break;
        case 12: // TSCH1
          this.addAnimation( 'idle', [110, 111], Globals.ENEMY_FPS );
          this.addAnimation( 'right', [112, 113], Globals.ENEMY_FPS );
          this.addAnimation( 'left', [114, 115], Globals.ENEMY_FPS );
          this.addAnimation( 'beat', [116, 117], Globals.ENEMY_FPS );
          this.addAnimation( 'die', [118, 119], Globals.ENEMY_FPS );
          this.particleEmitter = new BeatEmitter( this.x, this.y, 'TSH' );
          break;
        case 13: // WUH1
          this.addAnimation( 'idle', [120, 121], Globals.ENEMY_FPS );
          this.addAnimation( 'right', [122, 123], Globals.ENEMY_FPS );
          this.addAnimation( 'left', [124, 125], Globals.ENEMY_FPS );
          this.addAnimation( 'beat', [126, 127], Globals.ENEMY_FPS );
          this.addAnimation( 'die', [128, 129], Globals.ENEMY_FPS );
          this.particleEmitter = new BeatEmitter( this.x, this.y, 'WUH' );
          break;
        case 14: // BM2
          this.addAnimation( 'idle', [130, 131], Globals.ENEMY_FPS );
          this.addAnimation( 'right', [132, 133], Globals.ENEMY_FPS );
          this.addAnimation( 'left', [134, 135], Globals.ENEMY_FPS );
          this.addAnimation( 'beat', [136, 137], Globals.ENEMY_FPS );
          this.addAnimation( 'die', [138, 139], Globals.ENEMY_FPS );
          this.particleEmitter = new BeatEmitter( this.x, this.y, 'BM' );
          break;
        case 15: // CHA1
          this.addAnimation( 'idle', [140, 141], Globals.ENEMY_FPS );
          this.addAnimation( 'right', [142, 143], Globals.ENEMY_FPS );
          this.addAnimation( 'left', [144, 145], Globals.ENEMY_FPS );
          this.addAnimation( 'beat', [146, 147], Globals.ENEMY_FPS );
          this.addAnimation( 'die', [148, 149], Globals.ENEMY_FPS );
          this.particleEmitter = new BeatEmitter( this.x, this.y, 'CHA' );
          break;
        case 16: // TING1
          this.addAnimation( 'idle', [150, 151], Globals.ENEMY_FPS );
          this.addAnimation( 'right', [152, 153], Globals.ENEMY_FPS );
          this.addAnimation( 'left', [154, 155], Globals.ENEMY_FPS );
          this.addAnimation( 'beat', [156, 157], Globals.ENEMY_FPS );
          this.addAnimation( 'die', [158, 159], Globals.ENEMY_FPS );
          this.particleEmitter = new BeatEmitter( this.x, this.y, 'TING' );
          break;
      }

      Globals.GAME_LAYER_PARTICLES.add( this.particleEmitter );
    }

    public function attack( type:int ):void {
      this.attacking = true;
      this.play( 'beat' );
      this.attackingTimer = 0.5;
      this.particleEmitter.updatePosition( this.x, this.y );
    }

  }

}
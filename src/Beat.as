package
{
	/**
   * ...
   * @author Rafael Wenzel
   */
  public class Beat
  {
    private var beats:int;
    private var beat1:Array;
    private var beat4:Array;
    private var beat8:Array;
    private var beat16:Array;

    public function Beat()
    {
      this.beats = 1;
    }

    public function getBeats( ):int {
      return this.beats;
    }

    public function getBeat1( ):Array {
      return this.beat1;
    }
    public function getBeat4( ):Array {
      return this.beat4;
    }
    public function getBeat8( ):Array {
      return this.beat8;
    }
    public function getBeat16( ):Array {
      return this.beat16;
    }

    private function calculateBeats( beat:Array, beatType:int ):void {
      var temp:int = beat.length / beatType;

      if ( temp > this.beats ) this.beats = temp;
    }

    public function applyBeat1( beat:Array ):void {
      this.beat1 = beat;
      this.calculateBeats( beat, 1 );
    }

    public function applyBeat4( beat:Array ):void {
      this.beat4 = beat;
      this.calculateBeats( beat, 4 );
    }

    public function applyBeat8( beat:Array ):void {
      this.beat8 = beat;
      this.calculateBeats( beat, 8 );
    }

    public function applyBeat16( beat:Array ):void {
      this.beat16 = beat;
      this.calculateBeats( beat, 16 );
    }

  }

}
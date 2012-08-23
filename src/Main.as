package
{
	import flash.display.Sprite;
	import flash.events.Event;
  import org.flixel.FlxGame;
	
	/**
	 * ...
	 * @author Rafael Wenzel
	 */
	public class Main extends FlxGame
	{
		
		public function Main():void
		{
			super(Globals.GAME_WIDTH, Globals.GAME_HEIGHT, Game, Globals.GAME_SCALE);
      addEventListener(Event.ADDED_TO_STAGE, init);
		}

    private function init( e:Event ):void {
      stage.addChild(this);
      //MochiServices.connect( "a37cee9a5ae400e2", this.parent );
    }
		
	}
	
}
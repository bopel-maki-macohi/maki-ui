package;

import maki.ui.MUIWindow;
import flixel.FlxState;

class PlayState extends FlxState
{
	var window = new MUIWindow(320, 240);

	override public function create()
	{
		window.screenCenter();
		add(window);

		super.create();
	}
}

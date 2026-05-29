package maki.ui;

import flixel.FlxSprite;
import flixel.group.FlxSpriteContainer.FlxTypedSpriteContainer;

class MakiUIWindow extends FlxTypedSpriteContainer<FlxSprite>
{
	var bg:FlxSprite;

	override public function new(width:Int, height:Int)
	{
		super();

		bg = new FlxSprite();
		add(bg);
	}
}

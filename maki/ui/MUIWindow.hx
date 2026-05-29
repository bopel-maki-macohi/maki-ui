package maki.ui;

import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.group.FlxSpriteContainer.FlxTypedSpriteContainer;

class MUIWindow extends FlxTypedSpriteContainer<FlxSprite>
{
	var _bg:FlxSprite;

	override public function new(width:Int, height:Int, x = 0.0, y = 0.0)
	{
		super(x, y);

		this.width = width;
		this.height = height;

		_bg = new FlxSprite().makeGraphic(width, height, FlxColor.WHITE);
		_bg.color = FlxColor.GRAY;
		add(_bg);
	}

	override function draw()
	{
		_bg.scale.set(_bg.width / width, _bg.height / height);
		super.draw();
	}
}

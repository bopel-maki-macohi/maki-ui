package maki.ui;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class MUITab extends FlxSprite
{
	override public function new(width:Int, height:Int, x = 0.0, y = 0.0)
	{
		super(x, y);

		makeGraphic(1, 1, FlxColor.WHITE);
        resize(width, height);
	}

	public function setColor(color:FlxColor):MUITab
	{
		this.color = color;
		return this;
	}

    public function resize(width:Int, height:Int):MUITab
    {
        scale.set(width, height);
        updateHitbox();
        return this;
    }
}

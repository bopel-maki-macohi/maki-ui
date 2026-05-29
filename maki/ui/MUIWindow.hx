package maki.ui;

import flixel.group.FlxSpriteGroup;
import flixel.FlxCamera;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.group.FlxSpriteContainer.FlxTypedSpriteContainer;

class MUIWindow extends FlxSprite
{
	var _bg:FlxSprite;

	override function get_width():Float
		return _bg.width;

	override function get_height():Float
		return _bg.height;

	override function set_width(Value:Float):Float
		return _bg.scale.x = Value;

	override function set_height(Value:Float):Float
		return _bg.scale.y = Value;

	override public function new(width:Int, height:Int, x = 0.0, y = 0.0)
	{
		_bg = new FlxSprite().makeGraphic(1, 1, FlxColor.WHITE);
		_bg.color = FlxColor.GRAY;

		super(x, y);

		this.width = width;
		this.height = height;

		_tabs = new FlxTypedSpriteContainer<MUITab>();
	}

	override function draw()
	{
		if (_bg != null && _bg.exists && _bg.visible)
			_bg.draw();

		for (tab in _tabs)
			tab.draw();

		#if FLX_DEBUG
		if (flixel.FlxG.debugger.drawDebug)
			drawDebug();
		#end
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		_bg.x = this.x;
		_bg.y = this.y;

		_tabs.x = this.x;
		_tabs.y = this.y;
	}

	var _tabs:FlxTypedSpriteContainer<MUITab>;
	var _tabLabels:Array<String> = [];

	function getTabWidth():Int
	{
		if (_tabs.length < 2)
			return Math.floor(_bg.width);

		return Math.floor(_bg.width / (_tabs.length - 1));
	}

	public var tabHeight(default, set):Int = 32;

	function set_tabHeight(Value:Int):Int
	{
		forEachTab(tab -> tab.resize(getTabWidth(), tabHeight));
		return Value;
	}

	public function addTab(tab:String)
	{
		_tabLabels.push(tab);
		var newTab = new MUITab(getTabWidth(), tabHeight);
		newTab.ID = _tabLabels.length;
		_tabs.add(newTab);

		forEachTab(function(tab)
		{
			tab.resize(getTabWidth(), tabHeight);

			tab.x += getTabWidth() * tab.ID;
			tab.y -= tab.height;
		});
	}

	public function forEachTab(perform:MUITab->Void):Void
	{
		for (tab in _tabs)
			if (tab != null && tab.exists && tab.visible)
				perform(tab);
	}
}

package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;

class OutdatedSubState extends MusicBeatState
{
	public static var leftState:Bool = false;

	public static var needVer:String = "IDFK LOL";
	public static var currChanges:String = "dk";
	
	private var bgColors:Array<String> = [
		'#314d7f',
		'#4e7093',
		'#70526e',
		'#594465'
	];
	private var colorRotation:Int = 1;

	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('week54prototype', 'shared'));
		bg.scale.x *= 1.55;
		bg.scale.y *= 1.55;
		bg.screenCenter();
		bg.antialiasing = FlxG.save.data.antialiasing;
		add(bg);
		
		var kadeLogo:FlxSprite = new FlxSprite(FlxG.width, 0).loadGraphic(Paths.image('KadeEngineLogo'));
		kadeLogo.scale.y = 0.3;
		kadeLogo.scale.x = 0.3;
		kadeLogo.x -= kadeLogo.frameHeight;
		kadeLogo.y -= 180;
		kadeLogo.alpha = 0.8;
		kadeLogo.antialiasing = FlxG.save.data.antialiasing;
		add(kadeLogo);
		
		var txt:FlxText = new FlxText(0, 0, FlxG.width, 
		"Why hello there" 
		+ "\n\nThis was ported by Klav, Zack and Lucky." 
		+ "\nif i see anyone see stealing (im looking at you zarif :eyes:)" 
		+ "\ni'll raid your server(if you have one, once again im looking at you zarif :eyes:)" 
		+ "\n\ntap the screen to ignore this :sugnlas:",
		32);

		if (MainMenuState.nightly != "")
			txt.text = 
			"You are on\n"
			+ MainMenuState.kadeEngineVer
			+ "\nWhich is a PRE-RELEASE BUILD!"
			+ "\n\nReport all bugs to the author of the pre-release.\nSpace/Escape ignores this.";
		
		txt.setFormat("VCR OSD Mono", 32, FlxColor.fromRGB(200, 200, 200), CENTER);
		txt.borderColor = FlxColor.BLACK;
		txt.borderSize = 3;
		txt.borderStyle = FlxTextBorderStyle.OUTLINE;
		txt.screenCenter();
		add(txt);
		
		FlxTween.color(bg, 2, bg.color, FlxColor.fromString(bgColors[colorRotation]));
		FlxTween.angle(kadeLogo, kadeLogo.angle, -10, 2, {ease: FlxEase.quartInOut});
		
		new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			FlxTween.color(bg, 2, bg.color, FlxColor.fromString(bgColors[colorRotation]));
			if(colorRotation < (bgColors.length - 1)) colorRotation++;
			else colorRotation = 0;
		}, 0);
		
		new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			if(kadeLogo.angle == -10) FlxTween.angle(kadeLogo, kadeLogo.angle, 10, 2, {ease: FlxEase.quartInOut});
			else FlxTween.angle(kadeLogo, kadeLogo.angle, -10, 2, {ease: FlxEase.quartInOut});
		}, 0);
		
		new FlxTimer().start(0.8, function(tmr:FlxTimer)
		{
			if(kadeLogo.alpha == 0.8) FlxTween.tween(kadeLogo, {alpha: 1}, 0.8, {ease: FlxEase.quartInOut});
			else FlxTween.tween(kadeLogo, {alpha: 0.8}, 0.8, {ease: FlxEase.quartInOut});
		}, 0);
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT && MainMenuState.nightly == "")
		{
			fancyOpenURL("https://kadedev.github.io/Kade-Engine/changelogs/changelog-" + needVer);
		}
		else if (controls.ACCEPT)
		{
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		var justTapped:Bool = false;
		for (i in FlxG.touches.list)
		{
			justTapped = i.justPressed;
		}
		if (controls.BACK || justTapped)
		{
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}

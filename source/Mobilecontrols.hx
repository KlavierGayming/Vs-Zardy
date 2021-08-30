package;

import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
import FlxVirtualPad;
import Hitbox;

class Mobilecontrols extends FlxSpriteGroup
{
	public var mode:ControlsGroup = HITBOX;

	public var hitbox:Hitbox;
	public var virtualPad:FlxVirtualPad;

	public function new() 
	{
		super();

		// load control mode num from Config.hx
		mode = getModeFromNumber(FlxG.save.data.controlMode);

		switch (mode)
		{
			case VIRTUALPAD_RIGHT:
				initVirtualPad(0);
			case VIRTUALPAD_LEFT:
				initVirtualPad(1);
			case VIRTUALPAD_CUSTOM:
				initVirtualPad(2);
			case HITBOX:
				hitbox = new Hitbox();
				add(hitbox);
			case KEYBOARD:
		}
	}

	function initVirtualPad(vpadMode:Int) 
	{
		switch (vpadMode)
		{
			case 1:
				virtualPad = new FlxVirtualPad(FULL, NONE);
			case 2:
				virtualPad = new FlxVirtualPad(FULL, NONE);
				
				var tempCount:Int = 0;

				for(buttons in virtualPad)
				{
					buttons.x = FlxG.save.data.vpadPositon[tempCount].x;
					buttons.y = FlxG.save.data.vpadPositon[tempCount].y;
					tempCount++;
				}
			default: // 0
				virtualPad = new FlxVirtualPad(RIGHT_FULL, NONE);
		}
		
		virtualPad.alpha = 0.75;
		add(virtualPad);	
	}


	public static function getModeFromNumber(modeNum:Int):ControlsGroup {
		return switch (modeNum)
		{
			case 0: VIRTUALPAD_RIGHT;
			case 1: VIRTUALPAD_LEFT;
			case 2: KEYBOARD;
			case 3: VIRTUALPAD_CUSTOM;
			case 4:	HITBOX;

			default: VIRTUALPAD_RIGHT;

		}
	}
}

enum ControlsGroup {
	VIRTUALPAD_RIGHT;
	VIRTUALPAD_LEFT;
	KEYBOARD;
	VIRTUALPAD_CUSTOM;
	HITBOX;
}
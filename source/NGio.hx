package;

import flixel.FlxG;
import flixel.util.FlxSignal;
import flixel.util.FlxTimer;
import lime.app.Application;
import openfl.display.Stage;

using StringTools;

/**
 * MADE BY GEOKURELI THE LEGENED GOD HERO MVP
 */
class NGio
{
	public static var isLoggedIn:Bool = false;
	public static var scoreboardsLoaded:Bool = false;


	public static var ngDataLoaded(default, null):FlxSignal = new FlxSignal();
	public static var ngScoresLoaded(default, null):FlxSignal = new FlxSignal();

	public static var GAME_VER:String = "";
	public static var GAME_VER_NUMS:String = '';
	public static var gotOnlineVer:Bool = false;

	public static function noLogin(api:String)
	{
	}

	public function new(api:String, encKey:String, ?sessionId:String)
	{
	}

	function onNGLogin():Void
	{
	}

	// --- MEDALS
	function onNGMedalFetch():Void
	{
		/*
			// Reading medal info
			for (id in NG.core.medals.keys())
			{
				var medal = NG.core.medals.get(id);
				trace('loaded medal id:$id, name:${medal.name}, description:${medal.description}');
			}

			// Unlocking medals
			var unlockingMedal = NG.core.medals.get(54352);// medal ids are listed in your NG project viewer
			if (!unlockingMedal.unlocked)
				unlockingMedal.sendUnlock();
		 */
	}

	// --- SCOREBOARDS
	function onNGBoardsFetch():Void
	{
		/*
			// Reading medal info
			for (id in NG.core.scoreBoards.keys())
			{
				var board = NG.core.scoreBoards.get(id);
				trace('loaded scoreboard id:$id, name:${board.name}');
			}
		 */
		// var board = NG.core.scoreBoards.get(8004);// ID found in NG project view

		// Posting a score thats OVER 9000!
		// board.postScore(FlxG.random.int(0, 1000));

		// --- To view the scores you first need to select the range of scores you want to see ---

		// add an update listener so we know when we get the new scores
		// board.onUpdate.add(onNGScoresFetch);
		trace("shoulda got score by NOW!");
		// board.requestScores(20);// get the best 10 scores ever logged
		// more info on scores --- http://www.newgrounds.io/help/components/#scoreboard-getscores
	}

	inline static public function postScore(score:Int = 0, song:String)
	{
	}

	function onNGScoresFetch():Void
	{
	}

	inline static public function logEvent(event:String)
	{
	}

	inline static public function unlockMedal(id:Int)
	{
	}
}

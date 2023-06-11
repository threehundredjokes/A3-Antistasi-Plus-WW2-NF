class CfgSounds
{
	sounds[] = {};
    class fire
    {
        name="fire";
        sound[]={EQPATHTOFOLDER(core,Music\fire.ogg),db+12,1.0};
        titles[]={};
    };

    class StrikeImpact
    {
        name = "StrikeImpact";
        sound[] = {EQPATHTOFOLDER(core,Sounds\Misc\StrikeImpact.ogg), db+45, 1};
        titles[] = {};
    };

    class StrikeSound
    {
        name = "StrikeSound";
        sound[] = {EQPATHTOFOLDER(core,Sounds\Misc\StrikeSound.ogg), db+10, 1};
        titles[] = {};
    };

    class StrikeThunder
    {
        name = "StrikeThunder";
        sound[] = {EQPATHTOFOLDER(core,Sounds\Misc\thunder_01.wss), db+10, 1};
        titles[] = {};
    };

    class EarthquakeHeavy
    {
        name = "EarthquakeHeavy";
        sound[] = {EQPATHTOFOLDER(core,Sounds\Misc\earthquake4.wss), db + 45, 1};
        titles[] = {};
    };

    class EarthquakeMore
    {
        name = "EarthquakeMore";
        sound[] = {EQPATHTOFOLDER(core,Sounds\Misc\earthquake3.wss), db + 45, 1};
        titles[] = {};
    };

    class EarthquakeLess
    {
        name = "EarthquakeLess";
        sound[] = {EQPATHTOFOLDER(core,Sounds\Misc\earthquake2.wss), db + 45, 1};
        titles[] = {};
    };

    class EarthquakeLight
    {
        name = "EarthquakeLight";
        sound[] = {EQPATHTOFOLDER(core,Sounds\Misc\earthquake1.wss), db + 45, 1};
        titles[] = {};
    };

    class LootSuccess
    {
        name = "LootSuccess";
        sound[] = {EQPATHTOFOLDER(core,Sounds\Misc\LootSuccess.ogg), 1, 1, 100};
        titles[] = { 1, "" };
    };

    class BombCountdown
    {
        name = "BombCountdown";
        sound[] = {EQPATHTOFOLDER(core,Sounds\Misc\BombCountdown.ogg), 1, 1, 100};
        titles[] = { 1, "" };
    };

    class RadioIntercept
    {
        name = "RadioIntercept";
        sound[] = {EQPATHTOFOLDER(core,Sounds\Misc\RadioIntercept.ogg), 1, 1, 100};
        titles[] = { 1, "" };
    };


    class Typing
    {
        name = "Typing";
        sound[] = {EQPATHTOFOLDER(core,Sounds\Misc\Typing.ogg), 1, 1, 100};
        titles[] = { 1, "" };
    };

    class A3AP_UiSuccess 
    {
        name = "A3AP_UiSuccess";
        sound[] = {"\a3\3DEN\Data\Sound\CfgSound\notificationDefault",1,1};
        titles[] = {};
    };

    class A3AP_UiFailure 
    {
        name = "A3AP_UiFailure";
        sound[] = {"\a3\3DEN\Data\Sound\CfgSound\notificationWarning",1,1};
        titles[] = {};
    };
};
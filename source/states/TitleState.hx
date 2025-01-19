import flixel.FlxCamera;
import funkin.backend.system.framerate.MemoryCounter;
static var SM_LOGO:FlxSprite;
static var SM_Enter:FlxSprite;
static var SKY:FlxSprite;
static var ruins:FlxSprite;
static var blackScreen:FlxSprite;
static var intoText:FlxText;

function create() {
    CoolUtil.playMusic(Paths.music('freakyMenu'));

    FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);
	FlxG.sound.music.fadeIn(5, 0, 0.7);
	
	SKY = new FlxSprite().loadGraphic(Paths.image("menus/sky"));
    SKY.screenCenter();
    SKY.scale.set(0.4,0.4);
    SKY.alpha = 0;//0.65原
    add(SKY);

    ruins = new FlxSprite().loadGraphic(Paths.image("menus/ruins"));
    ruins.screenCenter();
    ruins.scale.set(0.4,0.4);
    ruins.alpha = 0;//1原
    add(ruins);

    SM_LOGO = new FlxSprite().loadGraphic(Paths.image("menus/SMLogo"));
    SM_LOGO.screenCenter();
    SM_LOGO.scale.set(0.3,0.3);
    SM_LOGO.alpha = 0;//1原
    add(SM_LOGO);
    
    SM_Enter = new FlxSprite().loadGraphic(Paths.image("menus/SMEnter"));
    SM_Enter.screenCenter();
    SM_Enter.scale.set(0.3,0.3);
    SM_Enter.alpha = 0;//1原
    add(SM_Enter);

    
    blackScreen = new FlxSprite().loadGraphic(Paths.image("menus/blackScreen"));
    blackScreen.screenCenter();
    blackScreen.alpha = 0.9;//0.9原
    add(blackScreen);
}

function textJump(txt:String) {
     intoText = new FlxText(0,0,0,"",40);
     intoText.font = 'fonts/vcr.ttf';
     intoText.alpha = 1;
     intoText.screenCenter();
     intoText.text = txt;
     intoText.scale.set(1,1);
     add(intoText);
    FlxTween.tween(intoText.scale, {x:1.5}, 4, {ease: FlxEase.circle});
    FlxTween.tween(intoText.scale, {y:1.5}, 4, {ease: FlxEase.circle});
    FlxTween.tween(intoText, {alpha:0}, 3, {ease: FlxEase.circle});
    FlxG.camera.flash(0xff000000,2);
}



function stepHit(curStep:Int) {
	switch(curStep)
	{
	
	case 1:
	textJump("               Welcome to \n           Sunday misfortune \n Made by the Strings of Fate team");
	intoText.screenCenter();
	FlxTween.tween(SKY, {alpha:0.65}, 2, {ease: FlxEase.circle});
    FlxTween.tween(ruins, {alpha:1}, 2, {ease: FlxEase.circle});	    
	
	case 33:
	textJump("           In the long half a year \n We spent a lot of time making this mod");
	intoText.screenCenter();	
	
	case 65:
	textJump("                 And now \n it's back in a completely new form \n  Show it in front of the audience");
	intoText.screenCenter();	
	
	case 97:
	textJump("A story about a suicidal mouse \n        This will be the case");
	intoText.screenCenter();	

	case 129:
	textJump("   The final outcome \n It will depend on you");
	intoText.screenCenter();		
	
	case 257:	
	FlxG.camera.flash(0xff000000,2);
	SM_LOGO.alpha = 1;
	SM_Enter.alpha = 1;												
	}
}

function beatHit(curBeat:Int) {
if (curBeat % 4 == 0) {
   camera.zoom = 1.05;
	FlxTween.tween(camera, {zoom:1}, 2, {ease: FlxEase.backin});
   }  
   }  
   
function update(FPS) {
if (curStep >= 257 && FlxG.mouse.justPressed) {
FlxTween.tween(camera, {zoom:1.5}, 2, {ease: FlxEase.backin});
 FlxG.sound.play(Paths.sound('menu/confirm')); 
 FlxG.sound.volume = 400;
FlxG.camera.fade(0xff000000, 1,{ease: FlxEase.circle}, function() { FlxG.switchState(new MainMenuState()); });  
} 
}

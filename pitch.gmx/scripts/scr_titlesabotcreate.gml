//DIFFICULTY NAMES
global.difname[0]="";
global.difname[1]="TRAINEE";
global.difname[2]="COMBAT LADY";
global.difname[3]="BATTLE PRINCESS";
global.difname[4]="WAR QUEEN";
global.difname[5]="GODDESS OF EXPLOSIONS";
global.difname[6]="REALLYJOEL'S MOM";

//MULTIPLY MUSIC VOLUME BY THIS
global.lowermusic=0.4;
global.musicinit=0;
scr_createmusic();

//GM COMPILE VERSION
//global.gmversion=5; //5.3A
global.gmversion=8; //7.0
//window_set_sizeable(1);

global.joystickexists=0;

//RESET EVERYTHING WHEN GAME RESTARTS
global.everchanged=0; //removes change hint from level 2
global.difselection=0;
if (global.difselection==0) //first selected difficulty
    global.difselection=2;
global.soundvol=4;
global.voicevol=4;
global.novoice=0;
global.nomenusound=0;
global.music=4;

global.noshake=0;
global.nointro=0;
global.showscore=0;
global.difficulty=2;
global.multiplier=1;
global.goddess=0; //boosts all explosions
global.galactic=0; //has galactic buster
global.startweapon=1; //change to this in next level
global.finalbossdead=0; //the clear screen will jump to the ending
global.summoned=0; //has summoned GoE already
global.cheating=0;
global.fullinvincible=0;
global.infinitepower=0;
global.totalenemies=0;
global.showfps=0;
global.scalewin=2;

//global.latestpoints this is what's compared and sent to highscore field
global.level=1;
global.ammo2=0;
global.ammo3=0;
global.points=0;
global.rollpoints=0;
global.realpickupchance=0.12; //0.12 - CONSTANT
global.pickupchance=global.realpickupchance; //may change
global.extraworth=0; //points for each extra life at endgame
global.nodmgworth=0; //points for each no damage room
global.extralives=0;
global.pitchchar="$";

global.firekey=ord("X");
global.changekey=ord("Z");
global.wupkey=ord("W");
global.wleftkey=ord("A");
global.wdownkey=ord("S");
global.wrightkey=ord("D");

scr_setmaps();
scr_joycreate();
if (joystick_exists(1)){
    global.joystickexists=1;
    global.haspov=joystick_has_pov(1);
}

// *****************
//set init key-map，from joyfire to joyright
global.joyfire=37;
global.joychange=36;
global.joypause=35;
global.joyup=34;
global.joydown=33;
global.joyleft=32;
global.joyright=31;


global.highscore[0]=250000;
global.highscore[1]=200000;
global.highscore[2]=150000;
global.highscore[3]=100000;
global.highscore[4]=50000;
global.highscore[5]=30000;
global.highscore[6]=10000;
global.highscore[7]=5000;
global.highscore[8]=3000;
global.highscore[9]=1000;
global.highscorename[0]=" HEL SARIE";
global.highscorename[1]="BEAR MINER";
global.highscorename[2]="    TETRON";
global.highscorename[3]="       CAT";
global.highscorename[4]="RLYSHOOTER";
global.highscorename[5]="SPACEVIPER";
global.highscorename[6]=" ITTLE DEW";
global.highscorename[7]="WINTER GUY";
global.highscorename[8]="SPACE FACE";
global.highscorename[9]="     TOSCA";

for (i=0;i<5;i+=1){
    global.reached[i]=0;
    global.reached5[i]=0;
    }
global.highestdiff=0;
for (i=0;i<10;i+=1)
    global.bake[i]=0;

global.foundsecret=0;
scr_load();
if (global.highscore[0]>250000)
    global.foundsecret=1;
global.nosound=global.nomenusound;
scr_soundvolume();
scr_voicevolume();
scr_setmaps();
scr_scalewindow();

firstblack=0;

scr_joycreate();
if (joystick_exists(1)){
    global.joystickexists=1;
    global.haspov=joystick_has_pov(1);
    }

//INIT MENU
global.demomode=0;
helppage=0;
helppages=7;
initnew=0;
for (i=0;i<17;i+=1) //GOLD/purple text
    menutext[i]="";
for (i=0;i<17;i+=1)
    menutext2[i]=""; //WHITE/blue text
tier="main";
selected=0;
selections=7;
movesound=snd_enemyhit;
selectsound=snd_rainbowfire1;
backsound=snd_brickfire;
errorsound=snd_nocando;
cutxoff=320;
latestscorepos=-1;
for (i=0;i<3;i+=1)
    introtext[i]="";
pic1time=50;
pic2time=280+40;
pic3time=515+80;
pic4time=745+120;

cursoroffset=2;
menutext[6]="START";
menutext[7]="help and info";
menutext[8]="options";
menutext[9]="highscores";
menutext[10]="protips";
menutext[11]="quit";
global.nosound=global.nomenusound;
for (i=0;i<=9;i+=1)
    entry[i]="_";
    
//mainsabot extra init
democyc = 0;
democyc2 = 0;
joywait = 0;
ignoreall = 0;
startgame = 0;
starting = 0;
cursorimg = 0;
firstblack = 0;

global.demolevel = 0;
global.really = 0;

keyberror=0;


//FIND AND ENTER HIGHSCORE
enterhighscore=-1;
for (i=9;i>-1;i-=1){
    if (global.latestpoints>global.highscore[i]){
        enterhighscore=i;
        if (i==9)
            hswtext="10TH PLACE";
        else if (i==8)
            hswtext="9TH PLACE";
        else if (i==7)
            hswtext="8TH PLACE";
        else if (i==6)
            hswtext="7TH PLACE";
        else if (i==5)
            hswtext="6TH PLACE";
        else if (i==4)
            hswtext="5TH PLACE";
        else if (i==3)
            hswtext="4TH PLACE";
        else if (i==2)
            hswtext="3RD PLACE";
        else if (i==1)
            hswtext="2ND PLACE";
        else if (i==0)
            hswtext="@1ST PLACE}";
        }
    }
if (enterhighscore>-1){
    tier="highscorewait";
    background_visible[5]=1;
    keyboard_unset_map();
    scr_directsong(0);
    }
else
    scr_wantsong(6);

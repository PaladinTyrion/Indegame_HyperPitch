//INIT DATA FOR NEW GAME
if (!initnew){
    initnew=1;
    global.stats[0]=0; //Enemies defeated
    global.stats[1]=0; //Shots fired
    global.stats[2]=0; //Pickups
    global.stats[3]=0; //Bullets deflected
    global.stats[4]=0; //Piledrivers
    global.stats[5]=0; //Throws
    global.stats[6]=0; //Damage taken
    global.stats[7]=0; //Lives lost
    global.stats[8]=0; //No damage rooms
    global.stats[9]=0; //???
    
    global.latestpoints=0;
    global.galactic=0; //has galactic buster
    global.startweapon=1; //change to this in next level
    global.finalbossdead=0; //the clear screen will jump to the ending
    global.summoned=0; //has summoned GoE already
    global.level=1;
    global.ammo2=8;
    global.ammo3=8;
    global.points=0;
    global.rollpoints=0;
    global.pickupchance=global.realpickupchance;
    global.extraworth=2000; //points for each extra life at endgame
    global.nodmgworth=500; //points for each no damage room
    if (global.difficulty==2){
        global.extralives=5;
        global.pitchchar="$";
        global.pitchsprite=spr_pitch;
        }
    else if (global.difficulty==3){
        global.extralives=4;
        global.pitchchar="&";
        global.pitchsprite=spr_pitch2;
        }
    else if (global.difficulty==4){
        global.extralives=3;
        global.pitchchar="@";
        global.pitchsprite=spr_pitch3;
        }
    else if (global.difficulty==6){
        global.extralives=2;
        global.pitchchar="}";
        global.pitchsprite=spr_pitch4;
        }
    else if (global.difficulty==8){
        global.extralives=1;
        global.pitchchar="^";
        global.pitchsprite=spr_pitch5;
        }
    else if (global.difficulty==32){
        global.extralives=0;
        global.pitchchar="~";
        global.pitchsprite=spr_pitch6;
        }
    }

for (i=0;i<17;i+=1) //GOLD/purple text - gold is default
    menutext[i]="";
for (i=0;i<17;i+=1)
    menutext2[i]=""; //WHITE/blue text - white is default
cursoroffset=0; //Rows to offset the cursor

//MAIN
if (tier=="main"){
    cursoroffset=2;
    menutext[6]="START";
    menutext[7]="help and info";
    menutext[8]="options";
    menutext[9]="highscores";
    menutext[10]="protips";
    menutext[11]="credits";
    menutext[12]="quit";
    }
//START
else if (tier=="start"){
    menutext2[2]="SELECT DIFFICULTY";
    menutext[4]=global.difname[1];
    menutext[5]=global.difname[2];
    menutext[6]=global.difname[3];
    menutext[7]=global.difname[4];
    menutext[8]=global.difname[5];
    if (global.really){
        menutext[9]=global.difname[6];
        menutext[10]="back";
        }
    else
        menutext[9]="back";
    //Info
    if (selected==0){
        menutext2[11+global.really]="5 EXTRA LIVES, SCORE *1";
        menutext2[12+global.really]="HALF BOSS HEALTH";
        }
    else if (selected==1)
        menutext2[11+global.really]="4 EXTRA LIVES, SCORE *2";
    else if (selected==2)
        menutext2[11+global.really]="3 EXTRA LIVES, SCORE *4";
    else if (selected==3)
        menutext2[11+global.really]="2 EXTRA LIVES, SCORE *6";
    else if (selected==4){
        menutext2[11+global.really]="1 EXTRA LIFE, SCORE *8";
        menutext2[12+global.really]="BOSSES USE FINAL ATTACKS";
        }
    else if (selected==5 && global.really){
        menutext2[11+global.really]="0 EXTRA LIVES, SCORE *1";
        menutext2[12+global.really]="ULTRA ENEMIES";
        }
    }
//GODDESS
else if (tier=="goddess"){
    cursoroffset=2;
    menutext2[4]="OH YEAH?";
    menutext[6]="yeah";
    menutext[7]="nah";
    }
//REALLY
else if (tier=="really"){
    cursoroffset=2;
    menutext2[4]="OH REALLY?";
    menutext[6]="really";
    menutext[7]="not really";
    }
//HELP
else if (tier=="help"){
    //Nothing
    }
//OPTIONS
else if (tier=="options"){
    cursoroffset=-3;
    menutext[1]="back";
    menutext[2]=" sound     ";
    menutext[3]=" voice     ";
    menutext[4]=" music     ";
    menutext[5]="shake    ";
    menutext[6]="intro    ";
    menutext[7]="score popups    ";
    menutext[8]="fullscreen    ";
    menutext[9]="show fps    ";
    menutext[10]="windowed scale     ";
    menutext[11]="configure keyboard";
    menutext[12]="configure gamepad";
    menutext[13]="game version    ";

    if (global.soundvol==0)
        menutext2[2]="       off ";
    else if (global.soundvol==1)
        menutext2[2]="       25% ";
    else if (global.soundvol==2)
        menutext2[2]="       50% ";
    else if (global.soundvol==3)
        menutext2[2]="       75% ";
    else if (global.soundvol==4)
        menutext2[2]="       100%";
    
    if (global.voicevol==0)
        menutext2[3]="       off ";
    else if (global.voicevol==1)
        menutext2[3]="       25% ";
    else if (global.voicevol==2)
        menutext2[3]="       50% ";
    else if (global.voicevol==3)
        menutext2[3]="       75% ";
    else if (global.voicevol==4)
        menutext2[3]="       100%";
    
    if (global.music==0)
        menutext2[4]="       off ";
    else if (global.music==1)
        menutext2[4]="       25% ";
    else if (global.music==2)
        menutext2[4]="       50% ";
    else if (global.music==3)
        menutext2[4]="       75% ";
    else if (global.music==4)
        menutext2[4]="       100%";
    
    if (global.noshake)
        menutext2[5]="      off";
    else
        menutext2[5]="      on ";
    if (global.nointro)
        menutext2[6]="      off";
    else
        menutext2[6]="      on ";
    if (global.showscore)
        menutext2[7]="             on ";
    else
        menutext2[7]="             off";
    if (!scr_fullscreen(0,0))
        menutext2[8]="           off";
    else
        menutext2[8]="           on ";
    if (!global.showfps)
        menutext2[9]="         off";
    else
        menutext2[9]="         on ";
    menutext2[10]="               "+string(global.scalewin*100)+"%";
    if (global.bake[4]==0)
        menutext2[13]="              1.5 ";
    else
        menutext2[13]="              1.4 ";
    
    if (selected==0)
        menutext2[15]="CHOOSE AN OPTION...";
    else if (selected==1)
        menutext2[15]="ADJUST SOUND VOLUME";
    else if (selected==2)
        menutext2[15]="ADJUST VOICE VOLUME";
    else if (selected==3)
        menutext2[15]="ADJUST MUSIC VOLUME";
    else if (selected==4)
        menutext2[15]="TURN SCREEN SHAKING ON/OFF";
    else if (selected==5)
        menutext2[15]="TURN INTRO CUTSCENE ON/OFF";
    else if (selected==6)
        menutext2[15]="TURN SCORE POPUPS ON/OFF";
    else if (selected==7)
        menutext2[15]="TURN FULLSCREEN ON/OFF (F4)";
    else if (selected==8)
        menutext2[15]="FRAMERATE COUNTER ON/OFF";
    else if (selected==9)
        menutext2[15]="ADJUST WINDOWED SCALE";
    else if (selected==10)
        menutext2[15]="SET UP ALTERNATE KEYS";
    else if (selected==11)
        menutext2[15]="SET UP GAMEPAD BUTTONS";
    else if (selected==12)
        menutext2[15]="CHANGE GAME VERSION";
    }

//KEYBOARD
else if (tier=="keyboard"){
    cursoroffset=0;
    menutext[4]="back";
    menutext[5]="  fire key  ";
    menutext[6]="change key  ";
    menutext[7]="    up key  ";
    menutext[8]="  left key  ";
    menutext[9]="  down key  ";
    menutext[10]=" right key  ";
    menutext2[5]="           "+chr(global.firekey);
    menutext2[6]="           "+chr(global.changekey);
    menutext2[7]="           "+chr(global.wupkey);
    menutext2[8]="           "+chr(global.wleftkey);
    menutext2[9]="           "+chr(global.wdownkey);
    menutext2[10]="           "+chr(global.wrightkey);
    if (selected==0)
        menutext2[12]="CHOOSE AN OPTION...";
    else if (selected==1)
        menutext2[12]="PRESS LETTER KEY FOR FIRE";
    else if (selected==2)
        menutext2[12]="PRESS LETTER KEY FOR CHANGE";
    else if (selected==3)
        menutext2[12]="PRESS LETTER KEY FOR UP";
    else if (selected==4)
        menutext2[12]="PRESS LETTER KEY FOR LEFT";
    else if (selected==5)
        menutext2[12]="PRESS LETTER KEY FOR DOWN";
    else if (selected==6)
        menutext2[12]="PRESS LETTER KEY FOR RIGHT";
    
    if (keyberror>0){
        keyberror-=1;
        menutext2[13]="PLEASE REASSIGN KEYS!";
        }
    else
        menutext2[13]="";
    }

//HIGHSCORES
else if (tier=="highscores"){
    menutext[0]="HIGHSCORES";
    for (i=0;i<10;i+=1){
        if (i!=latestscorepos){
            scorestring=string(global.highscore[i]);
            while (string_length(scorestring)<7)
                scorestring="0"+scorestring;
            menutext2[i+2]=global.highscorename[i]+" "+scorestring;
            }
        }
    if (latestscorepos>-1){
        scorestring=string(global.highscore[latestscorepos]);
        while (string_length(scorestring)<7)
            scorestring="0"+scorestring;
        menutext[latestscorepos+2]=global.highscorename[latestscorepos]+" "+scorestring;
        }
    menutext[13]="TOTAL ENEMIES DEFEATED";
    menutext2[14]=string(global.totalenemies);
    }
//PROTIPS
else if (tier=="protips"){
    scr_drawprotips();
    }
//GAMEPAD
else if (tier=="joystick"){
    cursoroffset=-2;
    if (selected==8){
        menutext2[12]="RESET BUTTON ASSIGNMENTS";
        menutext2[13]="";
        }
    else if (selected>3){
        menutext2[12]="NOTE: THE D-PAD MAY";
        menutext2[13]="AUTOMATICALLY WORK ALREADY";
        }
    else if (selected>0){
        menutext2[12]="PRESS A BUTTON";
        menutext2[13]="ON GAMEPAD 1";
        }
    else{
        menutext2[12]="CHOOSE AN OPTION";
        menutext2[13]="WITH THE KEYBOARD...";
        }
    
    menutext[2]="back";
    menutext[3]="       fire       ";
    menutext[4]="     change       ";
    menutext[5]="      pause       ";
    menutext[6]="   d-pad up       ";
    menutext[7]=" d-pad down       ";
    menutext[8]=" d-pad left       ";
    menutext[9]="d-pad right       ";
    menutext[10]="unbind all";
    
    menutext2[3]="             ";
    if (global.joyfire<10)
        menutext2[3]+=" "+string(global.joyfire)+"     ";
    else
        menutext2[3]+=string(global.joyfire)+"     ";
    menutext2[4]="             ";
    if (global.joychange<10)
        menutext2[4]+=" "+string(global.joychange)+"     ";
    else
        menutext2[4]+=string(global.joychange)+"     ";
    menutext2[5]="             ";
    if (global.joypause<10)
        menutext2[5]+=" "+string(global.joypause)+"     ";
    else
        menutext2[5]+=string(global.joypause)+"     ";
    menutext2[6]="             ";
    if (global.joyup<10)
        menutext2[6]+=" "+string(global.joyup)+"     ";
    else
        menutext2[6]+=string(global.joyup)+"     ";
    menutext2[7]="             ";
    if (global.joydown<10)
        menutext2[7]+=" "+string(global.joydown)+"     ";
    else
        menutext2[7]+=string(global.joydown)+"     ";
    menutext2[8]="             ";
    if (global.joyleft<10)
        menutext2[8]+=" "+string(global.joyleft)+"     ";
    else
        menutext2[8]+=string(global.joyleft)+"     ";
    menutext2[9]="             ";
    if (global.joyright<10)
        menutext2[9]+=" "+string(global.joyright)+"     ";
    else
        menutext2[9]+=string(global.joyright)+"     ";
    }
//BEGIN
else if (tier=="begin"){
    //Nothing
    }
//HIGHSCORE WAIT
else if (tier=="highscorewait"){
    //Nothing
    }
//HIGHSCORE
else if (tier=="enterhighscore"){
    //Nothing
    }
//HIGHSCORE DONE
else if (tier=="highscoredone"){
    //Nothing
    }
//CREDITS
if (tier=="credits"){
      menutext[1]="DESIGN, CODE, GRAPHICS,   ";
      menutext[2]=" SFX EDIT:                ";
     menutext2[3]="              DANIEL REMAR";
      menutext[4]="MUSIC:                    ";
     menutext2[5]="              NIKLAS STR_M";
      menutext[6]="VOICE OF PRINCESS PITCH:  ";
     menutext2[7]="            CAMILA DALENCE";
      menutext[8]="VOICE OF MECHA SANTA:     ";
     menutext2[9]="        FREDRIK ANDREASSON";
     menutext[10]="VOICE OF GODDESS:         ";
    menutext2[11]="     ANASTASIA MATUSZEWSKI";
     menutext[12]="                          ";
     menutext[13]="THANKS TO:                ";
    menutext2[13]="            LUDOSITY, DSU,";
    menutext2[14]="    EO, JBFMOD BY M. RIJKS";
    }

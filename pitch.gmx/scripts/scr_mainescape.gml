//Skip intro
if (starting>=20 && starting<pic4time){
    scr_wantsong(0);
    starting=pic4time;
    introtext[0]="";
    introtext[1]="";
    introtext[2]="";
    sound_stop(snd_pitchintro1);
    sound_stop(snd_pitchintro2);
    sound_stop(snd_pitchintro3);
    }

else if (!ignoreall && tier!="highscorewait" && tier!="enterhighscore" && tier!="highscoredone"){
    if (tier="main")
        scr_quitgame();
    else if (tier="start"){
        if (global.really)
            selected=6;
        else
            selected=5;
        scr_mainselect(0);
        }
    else if (tier="goddess"){
        selected=1;
        scr_mainselect(0);
        }
    else if (tier="really"){
        selected=1;
        scr_mainselect(0);
        }
    else if (tier="help"){
        selected=0;
        scr_mainselect(0);
        }
    else if (tier="options"){
        selected=0;
        scr_mainselect(0);
        }
    else if (tier="highscores"){
        selected=0;
        scr_mainselect(0);
        }
    else if (tier="protips"){
        selected=0;
        scr_mainselect(0);
        }
    else if (tier="joystick"){
        selected=0;
        scr_mainselect(0);
        }
    else if (tier="begin"){
        //Nothing
        }
    }

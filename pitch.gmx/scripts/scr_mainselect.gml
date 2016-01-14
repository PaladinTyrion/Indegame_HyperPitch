//argument0 is 1 = pressed Enter
reallycyc=0;

//Enter highscore
if (tier="enterhighscore"){
    //END
    if (argument0==1 || ((ehsx==4 || ehsx==5) && ehsy==4)){
        ehsx=4;
        ehsy=4;
        if (entry[0]=="_" && entry[1]=="_" && entry[2]=="_" && entry[3]=="_" && entry[4]=="_" && entry[5]=="_" && entry[6]=="_" && entry[7]=="_" && entry[8]=="_" && entry[9]=="_"){
            if (!global.nosound)
                sound_play(errorsound);
            }
        else{
            //UPDATE HIGHSCORE
            //Replace underscores with spaces
            for (i=0;i<10;i+=1){
                if (entry[i]=="_")
                    entry[i]=" ";
                }
            //Insert score at bottom
            global.highscore[9]=global.latestpoints;
            //Move name to the right
            repeat(10){
                if (entry[9]==" "){
                    for (i=9;i>0;i-=1)
                        entry[i]=entry[i-1];
                    entry[0]=" ";
                    }
                }
            //Create name
            global.highscorename[9]=entry[0]+entry[1]+entry[2]+entry[3]+entry[4]+entry[5]+entry[6]+entry[7]+entry[8]+entry[9];
            //Sort scores and move names
            latestscorepos=9;
            for (i=8;i>=0;i-=1){
                if (global.highscore[i]<global.highscore[i+1]){
                    temp=global.highscore[i];
                    global.highscore[i]=global.highscore[i+1];
                    global.highscore[i+1]=temp;
                    tempstr=global.highscorename[i];
                    global.highscorename[i]=global.highscorename[i+1];
                    global.highscorename[i+1]=tempstr;
                    latestscorepos-=1;
                    }
                }
            
            //SAVE
            scr_save();
            
            //CHANGE TIER
            tier="highscoredone";
            if (!global.nosound){
                sound_play(snd_laserstart);
                sound_play(snd_rainbowkill1);
                }
            //HSD PARTICLES
            //Letters
            for (j=0;j<4;j+=1){
                for (i=0;i<6;i+=1)
                    (instance_create(117+i*16,67+j*16,obj_hsdparticle)).image_single=33+i+j*6;
                }
            //Rest
            (instance_create(117,131,obj_hsdparticle)).image_single=57;
            (instance_create(133,131,obj_hsdparticle)).image_single=58;
            (instance_create(149,131,obj_hsdparticle)).image_single=63;
            (instance_create(165,131,obj_hsdparticle)).image_single=62;
            //End
            (instance_create(181,131,obj_hsdparticle)).image_single=37;
            (instance_create(189,131,obj_hsdparticle)).image_single=46;
            (instance_create(197,131,obj_hsdparticle)).image_single=36;
            }
        }
    //Enter letter
    else if (ehsx<3 || ehsy<4){
             if (ehsx==0 && ehsy==0) entry[markerx]="A";
        else if (ehsx==1 && ehsy==0) entry[markerx]="B";
        else if (ehsx==2 && ehsy==0) entry[markerx]="C";
        else if (ehsx==3 && ehsy==0) entry[markerx]="D";
        else if (ehsx==4 && ehsy==0) entry[markerx]="E";
        else if (ehsx==5 && ehsy==0) entry[markerx]="F";
        else if (ehsx==0 && ehsy==1) entry[markerx]="G";
        else if (ehsx==1 && ehsy==1) entry[markerx]="H";
        else if (ehsx==2 && ehsy==1) entry[markerx]="I";
        else if (ehsx==3 && ehsy==1) entry[markerx]="J";
        else if (ehsx==4 && ehsy==1) entry[markerx]="K";
        else if (ehsx==5 && ehsy==1) entry[markerx]="L";
        else if (ehsx==0 && ehsy==2) entry[markerx]="M";
        else if (ehsx==1 && ehsy==2) entry[markerx]="N";
        else if (ehsx==2 && ehsy==2) entry[markerx]="O";
        else if (ehsx==3 && ehsy==2) entry[markerx]="P";
        else if (ehsx==4 && ehsy==2) entry[markerx]="Q";
        else if (ehsx==5 && ehsy==2) entry[markerx]="R";
        else if (ehsx==0 && ehsy==3) entry[markerx]="S";
        else if (ehsx==1 && ehsy==3) entry[markerx]="T";
        else if (ehsx==2 && ehsy==3) entry[markerx]="U";
        else if (ehsx==3 && ehsy==3) entry[markerx]="V";
        else if (ehsx==4 && ehsy==3) entry[markerx]="W";
        else if (ehsx==5 && ehsy==3) entry[markerx]="X";
        else if (ehsx==0 && ehsy==4) entry[markerx]="Y";
        else if (ehsx==1 && ehsy==4) entry[markerx]="Z";
        else if (ehsx==2 && ehsy==4) entry[markerx]="_";
        instance_create(112+ehsx*16,64+ehsy*16,obj_highscorechosen);
        scr_ehsparticles();
        if (markerx<9)
            markerx+=1;
        else{
            ehsx=4;
            ehsy=4;
            }
        if (!global.nosound)
            sound_play(selectsound);
        }
    //Backspace
    else if (ehsx==3 && ehsy==4){
        if (!global.nosound)
            sound_play(backsound);
        if (entry[9]!="_")
            entry[9]="_";
        else if (markerx>0){
            markerx-=1;
            entry[markerx]="_";
            }
        instance_create(112+ehsx*16,64+ehsy*16,obj_highscorechosen);
        scr_ehsparticles();
        }
    }

//Lightskip intro
if (starting>=pic1time+10 && starting<pic2time-1){
    starting=pic2time-1;
    sound_stop(snd_pitchintro1);
    }
if (starting>=pic2time+10 && starting<pic3time-1){
    starting=pic3time-1;
    sound_stop(snd_pitchintro2);
    }
if (starting>=pic3time+10 && starting<pic4time){
    scr_wantsong(0);
    starting=pic4time;
    introtext[0]="";
    introtext[1]="";
    introtext[2]="";
    sound_stop(snd_pitchintro3);
    }





//Other
if (!ignoreall){
    //Remove logo particles
    if (tier!="enterhighscore" && tier!="highscoredone"){
        with (obj_iceparticle)
            instance_destroy();
        }
    //MAIN
    if (tier="main"){
        if (selected==0){
            tier="start";
            selected=global.difselection-1;
            if (selected<0)
                selected=0;
            if (selected>5)
                selected=5;
            if (!global.nosound)
                sound_play(selectsound);
            }
        else if (selected==1){
            tier="help";
            selected=0;
            if (!global.nosound)
                sound_play(selectsound);
            background_visible[5]=1;
            }
        else if (selected==2){
            tier="options";
            selected=0;
            if (!global.nosound)
                sound_play(selectsound);
            }
        else if (selected==3){
            tier="highscores";
            selected=0;
            if (!global.nosound)
                sound_play(selectsound);
            }
        else if (selected==4){
            tier="protips";
            selected=0;
            if (!global.nosound)
                sound_play(selectsound);
            background_visible[5]=1;
            }
        else if (selected==5){
            background_index[0]=bg_main23;
            background_index[1]=bg_main21;
            background_index[2]=bg_main21;
            background_index[3]=bg_main22;
            background_index[4]=bg_main22;
            tier="credits";
            selected=0;
            if (!global.nosound)
                sound_play(selectsound);
            }
        else if (selected==6)
            scr_quitgame();
        }
    //START
    else if (tier="start"){
        if (selected>=0 && selected<=3){
            if (selected==0){
                global.difficulty=2;
                global.multiplier=1;
                global.difselection=1;
                }
            else if (selected==1){
                global.difficulty=3;
                global.multiplier=2;
                global.difselection=2;
                }
            else if (selected==2){
                global.difficulty=4;
                global.multiplier=4;
                global.difselection=3;
                }
            else if (selected==3){
                global.difficulty=6;
                global.multiplier=6;
                global.difselection=4;
                }
            if (!global.nointro)
                scr_explo2();
            ignoreall=1;
            tier="begin";
            selected=0;
            startgame=1;
            scr_newgame();
            background_visible[5]=1;
            scr_wantsong(0);
            global.demolevel=0;
            global.demoroom=0;
            }
        else if (selected==4){
            tier="goddess";
            selected=0;
            if (!global.nosound)
                sound_play(selectsound);
            }
        else if (selected==5 && global.really){
            tier="really";
            selected=0;
            if (!global.nosound)
                sound_play(selectsound);
            }
        else if (selected==5 && !global.really){
            tier="main";
            selected=0;
            if (!global.nosound)
                sound_play(backsound);
            }
        else if (selected==6 && global.really){
            tier="main";
            selected=0;
            if (!global.nosound)
                sound_play(backsound);
            }
        }
    //GODDESS
    else if (tier="goddess"){
        if (selected==0){
            global.difficulty=8;
            global.multiplier=8;
            global.difselection=5;
            ignoreall=1;
            tier="begin";
            selected=0;
            startgame=1;
            scr_newgame();
            scr_explo2();
            background_visible[5]=1;
            scr_wantsong(0);
            global.demolevel=0;
            global.demoroom=0;
            }
        else if (selected==1){
            tier="start";
            selected=4;
            if (!global.nosound)
                sound_play(backsound);
            }
        }
    //REALLY
    else if (tier="really"){
        if (selected==0){
            global.difficulty=32;
            global.multiplier=1;
            global.difselection=6;
            ignoreall=1;
            tier="begin";
            selected=0;
            startgame=1;
            scr_newgame();
            global.summoned=1;
            scr_explo2();
            background_visible[5]=1;
            scr_wantsong(0);
            global.demolevel=0;
            global.demoroom=0;
            }
        else if (selected==1){
            tier="start";
            selected=5;
            if (!global.nosound)
                sound_play(backsound);
            }
        }
    //HELP
    else if (tier="help"){
        if (selected==0){
            tier="main";
            selected=1;
            if (!global.nosound)
                sound_play(selectsound);
            background_visible[5]=0;
            }
        }
    //OPTIONS
    else if (tier="options"){
        if (selected==0){
            tier="main";
            selected=2;
            scr_setmaps();
            if (!global.nosound)
                sound_play(backsound);
            scr_save();
            }
        else if (selected==1){
            global.soundvol-=1;
            if (global.soundvol<0)
                global.soundvol=4;
            scr_soundvolume();
            if (global.soundvol==0)
                global.nomenusound=1;
            else
                global.nomenusound=0;
            if (!global.nomenusound)
                sound_play(selectsound);
            global.nosound=global.nomenusound;
            }
        else if (selected==2){
            global.voicevol-=1;
            if (global.voicevol<0)
                global.voicevol=4;
            scr_voicevolume();
            if (global.voicevol==0)
                global.novoice=1;
            else
                global.novoice=0;
            if (!global.nomenusound)
                sound_play(selectsound);
            }
        else if (selected==3){
            global.music-=1;
            if (global.music<0)
                global.music=4;
            scr_setmusicvol();
            if (global.music==0){
                scr_stopmusic();
                global.fadesong=0;
                }
            else if (global.music==4)
                scr_wantsong(global.currentsong);
            if (!global.nosound)
                sound_play(selectsound);
            }
        else if (selected==4){
            global.noshake=1-global.noshake;
            if (!global.nosound)
                sound_play(selectsound);
            }
        else if (selected==5){
            global.nointro=1-global.nointro;
            if (!global.nosound)
                sound_play(selectsound);
            }
        else if (selected==6){
            global.showscore=1-global.showscore;
            if (!global.nosound)
                sound_play(selectsound);
            }
        else if (selected==7){
            if (scr_fullscreen(0,0))
                scr_fullscreen(1,0);
            else
                scr_fullscreen(1,1);
            if (!global.nosound)
                sound_play(selectsound);
            }
        else if (selected==8){
            global.showfps=1-global.showfps;
            if (!global.nosound)
                sound_play(selectsound);
            }
        else if (selected==9){
            global.scalewin+=1;
            if (global.scalewin>4)
                global.scalewin=1;
            scr_scalewindow();
            if (!global.nosound)
                sound_play(selectsound);
            }
        else if (selected==10){
            tier="keyboard";
            selected=0;
            if (!global.nosound)
                sound_play(selectsound);
            }
        else if (selected==11){
            tier="joystick";
            selected=0;
            if (!global.nosound)
                sound_play(selectsound);
            }
        else if (selected==12){
            global.bake[4]=1-global.bake[4];
            if (!global.nosound)
                sound_play(selectsound);
            }
        }
    //KEYBOARD
    else if (tier="keyboard"){
        if (selected==0){
            if (global.firekey==global.changekey || global.firekey==global.wupkey || global.firekey==global.wdownkey || global.firekey==global.wleftkey || global.firekey==global.wrightkey || global.changekey==global.wupkey || global.changekey==global.wdownkey || global.changekey==global.wleftkey || global.changekey==global.wrightkey || global.wupkey==global.wdownkey || global.wupkey==global.wleftkey || global.wupkey==global.wrightkey || global.wdownkey==global.wleftkey || global.wdownkey==global.wrightkey || global.wleftkey==global.wrightkey){
                keyberror=40;
                if (!global.nosound)
                    sound_play(errorsound);
                }
            else{
                tier="options";
                selected=10;
                scr_setmaps();
                if (!global.nosound)
                    sound_play(backsound);
                keyberror=0;
                }
            }
        }
    //HIGHSCORES
    else if (tier="highscores"){
        if (selected==0){
            tier="main";
            selected=3;
            if (!global.nosound)
                sound_play(selectsound);
            }
        }
    //PROTIPS
    else if (tier="protips"){
        if (selected==0){
            tier="main";
            selected=4;
            if (!global.nosound)
                sound_play(selectsound);
            background_visible[5]=0;
            }
        }
    //JOYSTICK
    else if (tier="joystick"){
        if (selected==0){
            tier="options";
            selected=11;
            if (!global.nosound)
                sound_play(backsound);
            }
        else if (selected==8){
            global.joyfire=99;
            global.joychange=99;
            global.joypause=99;
            global.joyup=99;
            global.joydown=99;
            global.joyleft=99;
            global.joyright=99;
            if (!global.nosound)
                sound_play(selectsound);
            }
        }
    //BEGIN
    else if (tier="begin"){
        //Do nothing
        }
    //CREDITS
    else if (tier="credits"){
        if (selected==0){
            background_index[0]=bg_main3;
            background_index[1]=bg_main1;
            background_index[2]=bg_main1;
            background_index[3]=bg_main2;
            background_index[4]=bg_main2;
            tier="main";
            selected=5;
            if (!global.nosound)
                sound_play(selectsound);
            }
        }
    }
    
//SELECTIONS
if (tier=="main")
    selections=7;
else if (tier=="start"){
    if (global.really)
        selections=7;
    else
        selections=6;
    }
else if (tier=="goddess")
    selections=2;
else if (tier=="really")
    selections=2;
else if (tier=="help")
    selections=1;
else if (tier=="options")
    selections=13;
else if (tier=="keyboard")
    selections=7;
else if (tier=="highscores")
    selections=1;
else if (tier=="protips")
    selections=1;
else if (tier=="joystick")
    selections=9;
else if (tier=="begin")
    selections=1;
else if (tier=="highscorewait")
    selections=1;
else if (tier=="enterhighscore")
    selections=1;
else if (tier=="highscoredone")
    selections=1;
else if (tier=="credits")
    selections=1;

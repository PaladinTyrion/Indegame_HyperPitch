//Skip gameover
if (instance_number(obj_gameover)==1){
    global.latestpoints=global.points;
    scr_restartgame(0,0);
    }

//Skip santa intro
else if (instance_number(obj_santa)==1 && obj_santa.intro<=450){
    with (obj_santa){
        if (intro>=40 && intro<=450){
            intro=459;
            scr_pose(34);
            sound_stop(snd_santa1);
            sound_stop(snd_pitchsanta);
            }
        }
    }
//Skip goddess
else if (instance_number(obj_goddess)==1){
    with (obj_goddess){
        if (start && !playdone && play>100 && play<maximumplay-5){
            play=maximumplay-5;
            sound_stop(snd_goddess1);
            sound_stop(snd_goddess2);
            sound_stop(snd_goddess3);
            sound_stop(snd_pitchgoddess1);
            sound_stop(snd_pitchgoddess2);
            }
        }
    }
    
//PAUSE GAME
else if (!global.demomode && !paused && levelstart==10 && instance_number(obj_stageclear)==0 && instance_number(obj_dummy)==0 && !cannotpause){
    obj_pitch.icefireloop=0;
    obj_pitch.icefire2loop=0;
    paused=1;
    selected=0;
    savehudweapon=obj_pitch.weapon;
    savehudhyperweapon=obj_pitch.hyperweapon;
    savehudhp=obj_pitch.hp;
    savehudpowerup=obj_pitch.powerup;
    if (instance_number(obj_ultrasleigh)==1){
        savehudbosshp=obj_ultrasleigh.hp;
        savehudbossmaxhp=obj_ultrasleigh.maxhp;
        }
    else if (instance_number(obj_atomicelf)==1){
        savehudbosshp=obj_atomicelf.hp;
        savehudbossmaxhp=obj_atomicelf.maxhp;
        }
    else if (instance_number(obj_annihilator)==1){
        savehudbosshp=obj_annihilator.hp;
        savehudbossmaxhp=obj_annihilator.maxhp;
        }
    else if (instance_number(obj_santa)==1){
        savehudbosshp=obj_santa.hp;
        savehudbossmaxhp=obj_santa.maxhp;
        }
    instance_deactivate_all(1);
    //instance_activate_object(obj_snowtext);
    instance_activate_object(obj_gate);
    instance_activate_object(obj_opengate);
    instance_activate_object(obj_doorblink);
    instance_activate_object(obj_treadmarks);
    instance_activate_object(obj_lava);
    instance_activate_object(obj_tile4light);
    instance_activate_object(obj_tile4light2);
    instance_activate_object(obj_crystal);
    instance_deactivate_region(x,y,319,239,0,1);
    if (!global.nosound)
        sound_play(snd_rainbowfire1);
    }
else if (paused){
    paused=0;
    instance_activate_region(x,y,319,239,1);
    instance_activate_object(obj_activateme);
    instance_activate_object(obj_enemy);
    if (!global.nosound)
        sound_play(snd_rainbowfire1);
    }

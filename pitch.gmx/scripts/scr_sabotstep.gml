scr_music();

//DEMO MODE
if (global.demomode){
    global.ignoreall=1;
    democyc+=1;
    if (democyc==318)
        background_visible[2]=1;
    if (democyc==320)
        scr_restartgame(0,1);
    }

//LIMIT STATS
for (i=0;i<10;i+=1){
    if (global.stats[i]>999999)
        global.stats[i]=999999;
    }

//ADVANCE SPAWNERS 1 FRAME TO GIVE CORRECT IMAGE
if (advspawners<4)
    advspawners+=1;
if (advspawners==2){
    instance_deactivate_object(obj_spawner);
    instance_activate_region(x,y,319,239,1);
    }

//USE GAMEPAD
scr_joy(0);
if (joy[33])
    event_perform(ev_keypress,vk_up);
if (joy[34])
    event_perform(ev_keypress,vk_down);
if (joy[global.joyfire])
    event_perform(ev_keypress,vk_control);
if (joy[global.joypause])
    event_perform(ev_keypress,vk_escape);

//STOP DEMO
if (joy[global.joyfire] || joy[global.joychange] || joy[global.joypause] || joy[global.joyup] || joy[global.joyleft] || joy[global.joydown] || joy[global.joyright]){
    if (global.demomode && democyc<317)
        democyc=317;
    }

//STOP ICE SOUND
if ((!keyboard_check(vk_control) && !obj_pitch.joyhold[global.joyfire]) || global.ignoreall || !obj_pitch.firingweapon || (obj_pitch.weapon!=2 && obj_pitch.hyperweapon!=3)){
    sound_stop(snd_icefire);
    sound_stop(snd_icefire2);
    obj_pitch.icefireloop=0;
    obj_pitch.icefire2loop=0;
    }
if ((!keyboard_check(vk_control) && !obj_pitch.joyhold[global.joyfire]) || global.ignoreall || !obj_pitch.firingweapon || obj_pitch.weapon!=3){
    sound_stop(snd_laserfire);
    obj_pitch.laserfireloop=0;
    }

if (!paused){
//PITCH IS DEAD
if (deadcyc>0){
    deadcyc-=1;
    if (deadcyc==0){
        with (obj_deadpitch)
            instance_destroy();
        //Resurrect
        if (global.extralives>0){
            global.extralives-=1;
            (instance_create(obj_pitch.x,obj_pitch.y,obj_spawnpitch)).nopain=0;
            obj_pitch.hp=10;
            scr_pitchtaunt();
            }
        //Game over
        else{
            sound_stop_all();
            global.nosound=1;
            instance_create(x,y,obj_gameover);
            }
        }
    }

//SCROLL SCREEN
scroll=0;
if (!bosstime && !dyingboss){
    //Right
    if (obj_pitch.x>x+320-8){
        scroll=1;
        if (global.level==4 && roomx==3)
            x-=960;
        else
            x+=320;
        obj_pitch.x=x+48;
        obj_pitch.dir=0;
        obj_pitch.lookdir=0;
        }
    //Left
    else if (obj_pitch.x<x+8){
        scroll=1;
        if (global.level==4 && roomx==0)
            x+=960;
        else
            x-=320;
        obj_pitch.x=x+320-48;
        obj_pitch.dir=4;
        obj_pitch.lookdir=4;
        }
    //Down
    else if (obj_pitch.y>y+240-24){
        scroll=1;
        if (global.level==4 && roomy==4)
            y-=720;
        else
            y+=240;
        obj_pitch.y=y+48;
        obj_pitch.dir=6;
        obj_pitch.lookdir=6;
        }
    //Up
    else if (obj_pitch.y<y+8){
        scroll=1;
        if (global.level==4 && roomy==1)
            y+=720;
        else
            y-=240;
        obj_pitch.y=y+240-64;
        obj_pitch.dir=2;
        obj_pitch.lookdir=2;
        }
    //General
    if (scroll){
        ignorescore=0;
        with (obj_destroyme)
            instance_destroy();
        with (obj_barrel)
            instance_destroy();
        with (obj_pitch)
            scr_resetcounter();
        global.shakescreen=0;
        shakeoff=0;
        if (global.gmversion==5){
            view_left[0]=x;
            view_top[0]=y;
            }
        else if (global.gmversion==8){
            view_xview[0]=x;
            view_yview[0]=y;
            }
        deathinroom=0; //alternate death sound
    
        //award nodmgroom
        if (dmgroom==0)
            global.nodmgrooms+=1;
        dmgroom=0;
    
        //Special rooms
        roomx=x/320;
        roomy=y/240;
        scr_specialrooms();
        if (bosstime)
            scr_removepowerup(0);
    
        //Boss music
        if (global.level==1 && roomx=3 && roomy=0)
            scr_wantsong(0);
        else if (global.level==2 && roomx=0 && roomy=1)
            scr_wantsong(8);
        else if (global.level==3 && roomx=4 && roomy=0)
            scr_wantsong(8);
        else if (global.level==4 && roomx=0 && roomy=3)
            scr_wantsong(0);
        else if (global.level==5 && roomx=2 && roomy=1)
            scr_wantsong(0);
    
        //Deactivation
        instance_deactivate_all(1);
        instance_activate_region(x,y,319,239,1);
        instance_activate_object(obj_activateme);
        with (obj_cheerelf)
            visible=1;
        
        //Kick up snow from snowblowers
        if (obj_pitch.dir==0){
            with (obj_snowblower)
                go=1;
            }
    
        //Pitch dummy
        obj_pitch.speed=0;
        obj_pitch.image_single=obj_pitch.dir*8;
        obj_pitch.firing=0;
        obj_pitch.firingweapon=0;
        global.ignoreall=1;
        obj_pitch.alarm[0]=20;
        obj_pitch.visible=false;
        obj_pitch.pain=0;
        tempid=instance_create(obj_pitch.x,obj_pitch.y,obj_dummy);
        tempid.dir=obj_pitch.dir;
        if (tempid.dir==0)
            tempid.x-=40;
        else if (tempid.dir==2)
            tempid.y+=40;
        else if (tempid.dir==4)
            tempid.x+=40;
        else if (tempid.dir==6)
            tempid.y-=40;
    
        //Close gates / waiting gates
        donecyc=0;
        with (obj_gate){
            playclosesfx=0;
            if (closed){
                obj_sabot.playclosesfx=1;
                if (type*2==obj_pitch.dir){
                    image_single=4+bossgate*5;
                    alarm[0]=12;
                    }
                else
                    image_single=0+bossgate*5;
                }
            else
                image_single=0+bossgate*5;
            }
        if (playclosesfx==1){
            playclosesfx=0;
            playclosesfx2=13;
            }
        }
    }
    
//DELAYED GATE CLOSE SFX
if (playclosesfx2>0){
    playclosesfx2-=1;
    if (playclosesfx2==1 && !global.nosound && !hiddenroom && !lasthiddenroom)
        sound_play(snd_doorclose);
    }

//ROOM CLEAR
if (!global.ignoreall && instance_number(obj_enemy)==0 && instance_number(obj_spawnenemy)==0 && instance_number(obj_spawnmicroboss)==0 && !obj_pitch.piledriving){
    global.done=1;
    with (obj_spawner){
        if (!done)
            global.done=0;
        }
    if (global.done){
        //Open gates
        if (donecyc<20){
            donecyc+=1;
            if (donecyc==20){
                /*with (obj_hiddenblock){
                    instance_destroy();
                    tile_layer_show(50);
                    }*/
                with (obj_doorblock)
                    instance_destroy();
                playopensfx=0;
                with (obj_gate){
                    if (!closed){
                        open=1;
                        obj_sabot.playopensfx=1;
                        }
                    }
                if (playopensfx && !global.nosound && !hiddenroom)
                    sound_play(snd_dooropen);
                }
            }
        }
    }

//SHAKE SCREEN
if (instance_number(obj_gameover)==1)
    global.shakescreen=0;
if (global.shakescreen>0){
    global.shakescreen-=1;
    if (global.shakescreen>4)
        factor=4;
    else if (global.shakescreen>2)
        factor=2;
    else
        factor=1;
    shakeoff=(global.shakescreen mod 2)*factor;
    if (global.noshake)
        shakeoff=0;
    if (global.gmversion==5)
        view_top[0]=y+shakeoff;
    else if (global.gmversion==8)
        view_yview[0]=y+shakeoff;
    }
//End of !paused
}

//CHEATING
if (global.cheating){
    global.points=0;
    global.rollpoints=0;
    }

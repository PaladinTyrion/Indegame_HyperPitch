if (string_length(keyboard_string)>0)
    codestring=string_copy(keyboard_string,string_length(keyboard_string)-5,6);

if (instance_number(obj_stageclear)==0 && !paused){

    //INVINCIBLE
    if (string_upper(codestring)="RGIOSA"){
        codestring="";
        keyboard_string="";
        if (obj_pitch.hp>0 && instance_number(obj_deadpitch)==0 && instance_number(obj_spawnpitch)==0 && instance_number(obj_dummy)==0 && instance_number(obj_busterpitch)==0 && global.difficulty!=32){
            global.holdscyc=60;
            global.fullinvincible=1-global.fullinvincible;
            if (global.fullinvincible)
                global.holdsmsg="GODDESS MODE ON";
            else
                global.holdsmsg="GODDESS MODE OFF";
            global.cheating=1;
            visible=1;
            pain=0;
            altpain=0;
            noblinking=0;
            if (!global.nosound){
                sound_stop(snd_scorebonus);
                sound_play(snd_scorebonus);
                }
            }
        else if (!global.nosound){
            sound_stop(snd_nocando);
            sound_play(snd_nocando);
            }
        }
    
    //GIVE AMMO
    if (string_upper(codestring)="RGFILL"){
        codestring="";
        keyboard_string="";
        if (obj_pitch.hp>0 && global.difficulty!=32){
            global.holdscyc=60;
            global.holdsmsg="MAX AMMO";
            global.ammo2=99;
            global.ammo3=99;
            global.cheating=1;
            if (!global.nosound){
                sound_stop(snd_scorebonus);
                sound_play(snd_scorebonus);
                }
            }
        else if (!global.nosound){
            sound_stop(snd_nocando);
            sound_play(snd_nocando);
            }
        }
    
    //GIVE LIVES
    if (string_upper(codestring)="RGCATS"){
        codestring="";
        keyboard_string="";
        if (obj_pitch.hp>0 && global.difficulty!=32){
            global.holdscyc=60;
            global.holdsmsg="MAX LIVES";
            global.extralives=9;
            global.cheating=1;
            if (!global.nosound){
                sound_stop(snd_scorebonus);
                sound_play(snd_scorebonus);
                }
            }
        else if (!global.nosound){
            sound_stop(snd_nocando);
            sound_play(snd_nocando);
            }
        }
    
    //GIVE POWERUP
    if (string_upper(codestring)="RGGIVE"){
        codestring="";
        keyboard_string="";
        if (obj_pitch.hp>0 && instance_number(obj_deadpitch)==0 && instance_number(obj_spawnpitch)==0 && instance_number(obj_dummy)==0 && instance_number(obj_busterpitch)==0 && global.difficulty!=32){
            if (random(1)<0.3 && global.bake[4]==0)
                (instance_create(obj_pitch.x,obj_pitch.y+8,obj_pickup)).image_single=16+floor(random(3));
            else
                (instance_create(obj_pitch.x,obj_pitch.y+8,obj_pickup)).image_single=10+floor(random(5));
            global.holdscyc=60;
            global.holdsmsg="SUDDENLY, A POWERUP";
            global.cheating=1;
            if (!global.nosound){
                sound_stop(snd_scorebonus);
                sound_play(snd_scorebonus);
                }
            }
        else if (!global.nosound){
            sound_stop(snd_nocando);
            sound_play(snd_nocando);
            }
        }
    
    //INFINITE POWERUPS
    if (string_upper(codestring)="RGCELL"){
        codestring="";
        keyboard_string="";
        if (obj_pitch.hp>0 && global.difficulty!=32){
            global.holdscyc=60;
            global.infinitepower=1-global.infinitepower;
            if (global.infinitepower)
                global.holdsmsg="INFINITE POWERUPS ON";
            else
                global.holdsmsg="INFINITE POWERUPS OFF";
            global.cheating=1;
            if (!global.nosound){
                sound_stop(snd_scorebonus);
                sound_play(snd_scorebonus);
                }
            }
        else if (!global.nosound){
            sound_stop(snd_nocando);
            sound_play(snd_nocando);
            }
        }
    
    //LEVEL SKIP
    if (string_upper(codestring)="RGWISH"){
        codestring="";
        keyboard_string="";
        if (obj_pitch.hp>0 && instance_number(obj_deadpitch)==0 && instance_number(obj_spawnpitch)==0 && instance_number(obj_dummy)==0 && instance_number(obj_busterpitch)==0 && global.difficulty!=32){
            global.holdscyc=60;
            global.holdsmsg="LEVEL SKIPPED";
            global.cheating=1;
            if (!global.nosound){
                sound_stop(snd_scorebonus);
                sound_play(snd_scorebonus);
                }
            obj_pitch.speed=0;
            global.ignoreall=1;
            global.level+=1;
            if (room==rom_stage5){
                global.level=4;
                room_goto(rom_stage4);
                }
            else{
                if (global.extralives<9)
                    global.extralives+=1;
                room_goto_next();
                }
            }
        else if (!global.nosound){
            sound_stop(snd_nocando);
            sound_play(snd_nocando);
            }
        }
    
    //SERIOUS EXPLOSIONS
    if (string_upper(codestring)="RGXCES"){
        codestring="";
        keyboard_string="";
        if (obj_pitch.hp>0){
            global.holdscyc=60;
            global.goddess=1-global.goddess;
            if (global.goddess)
                global.holdsmsg="SERIOUS EXPLOSIONS ON";
            else
                global.holdsmsg="SERIOUS EXPLOSIONS OFF";
            //global.cheating=1; //Not cheating
            if (!global.nosound){
                sound_stop(snd_scorebonus);
                sound_play(snd_scorebonus);
                }
            }
        else if (!global.nosound){
            sound_stop(snd_nocando);
            sound_play(snd_nocando);
            }
        }
    
    }

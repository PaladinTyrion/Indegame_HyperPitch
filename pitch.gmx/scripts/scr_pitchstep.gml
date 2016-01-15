//USE GAMEPAD
scr_joy(0);

//GAMEPAD CHANGE, FIRE
if (joy[global.joychange])
    event_perform(ev_keypress,vk_shift);
if (joy[global.joyfire])
    event_perform(ev_keypress,vk_control);

//SNOW GATHERS
if (obj_sabot.snowfall){
    if (x<obj_sabot.x+288 && (y<obj_sabot.y+186 || obj_sabot.roomx==0)){
        if (sgxprev==x && sgyprev==y && visible && pain==0 && counter==0){
            if (sgather<841)
                sgather+=1;
            if (sgather mod 40==0)
                (instance_create(obj_pitch.x-4+floor(random(8)),obj_pitch.y+6,obj_liesnow)).z=(sgather/60);
            }
        else
            sgather=0;
        sgxprev=x;
        sgyprev=y;
        }
    }

//BREAK OUT THE TENTS
campcyc+=1;
if (campcyc==40){
    campcyc=0;
    for (i=5;i>0;i-=1){
        campx[i]=campx[i-1];
        campy[i]=campy[i-1];
        }
    campx[0]=x;
    campy[0]=y;
    for (i=0;i<4;i+=1)
        campdist[i]=point_distance(campx[i],campy[i],campx[i+1],campy[i+1]);
    if (campdist[0]<48 && campdist[1]<48 && campdist[1]<48 && camping<1)
        camping+=0.5;
    else
        camping=0;
    }

//SOUND RESTRICTIONS
if (pickvoice1>0)
    pickvoice1-=1;
if (pickvoice2>0)
    pickvoice2-=1;
if (pickvoice3>0)
    pickvoice3-=1;
if (bricksound>0)
    bricksound-=1;

//FIRST TAUNT
if (global.level==1 && firsttaunt<10){
    firsttaunt+=1;
    if (firsttaunt==10){
        scr_stoppitchvoice();
        if (!global.novoice)
            sound_play(snd_pitchtaunt1);
        }
    }

//WAKE UP PRESENT ELF
firing=0;

//PILEDRIVING
if (piledriving)
    scr_piledriving();

//SKID WHILE HYPER COUNTERING
if (docounter){
    if (speed>0){
        speed-=0.06;
        if (speed<0.1)
            speed=0;
        }
    }

//THROW MEGA COUNTER BALL
if (megacountertick>0){
    megacountertick-=1;
    if (megacountertick==30){
        obj_megacounterball.gravity_direction=0;
        obj_megacounterball.gravity=0.1;
        image_single=76;
        scr_stoppitchvoice();
        if (!global.novoice)
            sound_play(snd_pitchhadoken);
        }
    if (megacountertick==0){
        scr_resetcounter();
        megacounter=0;
        }
    }

//COUNTER, SUMMON
if (firingweapon){
    counter=0;
    misscounter=0;
    }
if (!firingweapon && !global.ignoreall){
    if (!docounter && !piledriving){
        //Keep track of arrows
        pleftprev=pleft;
        prightprev=pright;
        pupprev=pup;
        pdownprev=pdown;
        if (keyboard_check(vk_left) || joyhold[35])
            pleft=1;
        else
            pleft=0;
        if (keyboard_check(vk_right) || joyhold[36])
            pright=1;
        else
            pright=0;
        if (keyboard_check(vk_up) || joyhold[33])
            pup=1;
        else
            pup=0;
        if (keyboard_check(vk_down) || joyhold[34])
            pdown=1;
        else
            pdown=0;
        //COUNTER ------------------------------------------
        //Correct sequence
        if (pup && counter<=3){
            counter=1;
            misscounter=30;
            }
        else if (pdown && !pdownprev && counter==1)
            counter=2;
        else if ((pleft && !pleftprev && counter==2) ^^ (pright && !prightprev && counter==2)){
            counter=3;
            if (pright)
                reversecounter=1;
            else
                reversecounter=0;
            }
        //Do counter
        else if ((pright && !reversecounter && !prightprev && counter==3) ^^ (pleft && reversecounter && !pleftprev && counter==3)){
            misscounter=0;
            counter=4;
            countering=30; //time to wait while countering
            counterwhite=27; //frame to turn normal
            docounter=1; //now countering
            image_single=75;
            firing=0;
            firingweapon=0;
            speed=0;
            if (!global.nosound){
                sound_stop(snd_counterstance);
                sound_play(snd_counterstance);
                }
            }
        //Failed counters
        else if (counter==1 && ((pleft && !pleftprev) || (pright && !prightprev))){
            counter=0;
            misscounter=0;
            }
        else if (counter==2 && ((pup && !pupprev) || (pdown && !pdownprev) || (pright && !prightprev))){
            counter=0;
            misscounter=0;
            }
        else if (counter==3 && ((pup && !pupprev) || (pdown && !pdownprev) || (pleft && !pleftprev))){
            counter=0;
            misscounter=0;
            }
        if (misscounter>0){
            misscounter-=1;
            if (misscounter==0)
                counter=0;
            }
        
        //SUMMON ------------------------------------
        //good code is overrated
        //Correct sequence
        if (pup && summon==0){
            summon=1;
            misssummon=100;
            }
        else if (pup && !pupprev && (summon==1 || summon==2)){
            summon=2;
            misssummon=80;
            }
        else if (pdown && !pdownprev && summon==2)
            summon=3;
        else if (pdown && !pdownprev && summon==3)
            summon=4;
        else if (pleft && !pleftprev && summon==4)
            summon=5;
        else if (pright && !prightprev && summon==5)
            summon=6;
        else if (pleft && !pleftprev && summon==6)
            summon=7;
        //Do summon
        else if (pright && !prightprev && summon==7){
            if (global.summoned || instance_number(obj_goddesstrigger)==1 || obj_sabot.dyingboss==1){
                //Error sound effect
                summon=0;
                misssummon=0;
                if (!global.nosound)
                    sound_play(snd_nocando);
                }
            else{
                global.summoned=1;
                misssummon=0;
                summon=8;
                image_single=lookdir*8;
                firing=0;
                firingweapon=0;
                speed=0;
                visible=0;
                for (i=0;i<4;i+=1){
                    tempid=instance_create(x,y,obj_counterflash);
                    tempid.speed=8;
                    tempid.direction=i*90+45;
                    }
                global.ignoreall=1;
                instance_create(obj_sabot.x+124,obj_sabot.y+36,obj_goddessbuster);
                }
            }
        //Failed summons
        else if (summon==1 && ((pleft && !pleftprev) || (pdown && !pdownprev) || (pright && !prightprev))){
            summon=0;
            misssummon=0;
            }
        else if (summon==2 && ((pleft && !pleftprev) || (pup && !pupprev) || (pright && !prightprev))){
            summon=0;
            misssummon=0;
            }
        else if (summon==3 && ((pleft && !pleftprev) || (pup && !pupprev) || (pright && !prightprev))){
            summon=0;
            misssummon=0;
            }
        else if (summon==4 && ((pup && !pupprev) || (pdown && !pdownprev) || (pright && !prightprev))){
            summon=0;
            misssummon=0;
            }
        else if (summon==5 && ((pleft && !pleftprev) || (pup && !pupprev) || (pdown && !pdownprev))){
            summon=0;
            misssummon=0;
            }
        else if (summon==6 && ((pup && !pupprev) || (pdown && !pdownprev) || (pright && !prightprev))){
            summon=0;
            misssummon=0;
            }
        else if (summon==7 && ((pleft && !pleftprev) || (pup && !pupprev) || (pdown && !pdownprev))){
            summon=0;
            misssummon=0;
            }
        if (misssummon>0){
            misssummon-=1;
            if (misssummon==0)
                summon=0;
            }
        }
    //Return to normal
    if (countering>0){
        countering-=1;
        if (countering==counterwhite)
            image_single=74;
        if (countering==0){
            counter=0;
            docounter=0;
            image_single=lookdir*8;
            }
        }
    }

//POWERUP RUNS OUT
if (poweruptime>0){
    if (global.infinitepower)
        poweruptime=12;
    poweruptime-=1/40;
    if (poweruptime<=0)
        scr_removepowerup(0);
    }

//STUFF
if (powerup==5 && visible)
    instance_create(x-6+random(12),y-8+random(16)-z,obj_iceparticle);

//STUFF LOCKED BY IGNOREALL
if (!global.ignoreall){
    if (altpain>0)
        altpain-=1;
    if (noblinking>0)
        noblinking-=1;
    if (pain>0){
        pain-=1;
        if (pain mod 4==0 && !piledriving && pain>0 && noblinking==0)
            visible=0;
        else
            visible=1;
        }
    else
        visible=1;
    }

//STUFF LOCKED BY IGNOREALL, DOCOUNTER, AND PILEDRIVING
if (!global.ignoreall && !docounter && !piledriving){

    //KICK UP SNOW
    if (obj_sabot.snowfall){
        if (x<obj_sabot.x+288 && (y<obj_sabot.y+186 || obj_sabot.roomx==0) && speed>0){
            snowwalks+=1;
            if (snowwalks==8){
                snowwalks=0;
                if (snowwalks2==0){
                    snowwalks2=1;
                    if (!global.nosound)
                        sound_play(snd_snowstep1);
                    }
                else if (snowwalks2==1){
                    snowwalks2=0;
                    if (!global.nosound)
                        sound_play(snd_snowstep2);
                    }
                }
            snowwalk+=1;
            if (snowwalk==2){
                snowwalk=0;
                tempid=(instance_create(x-1+random(4)+hspeed*2,y-1+random(2)+6+vspeed*2,obj_snowpart));
                if (direction==270)
                    tempid.depth=330-y+obj_sabot.y;
                else
                    tempid.depth=320-y+obj_sabot.y;
                }
            }
        }
    
    //STUFF
    depth=320-y+obj_sabot.y;
    
    //WALK
    r=0; l=0; u=0; d=0;
    move=0;
    speed=0;
    //Get directions
    if (keyboard_check(vk_left) || joyhold[35])
        l=1;
    else if (keyboard_check(vk_right) || joyhold[36])
        r=1;
    if (keyboard_check(vk_up) || joyhold[33])
        u=1;
    else if (keyboard_check(vk_down) || joyhold[34])
        d=1;
    if (r){
        dir=0;
        if (u) dir=1;
        if (d) dir=7;
        }
    else if (l){
        dir=4;
        if (u) dir=3;
        if (d) dir=5;
        }
    else if (u) dir=2;
    else if (d) dir=6;
    if (r || u || l || d)
        move=1;
    //Move and animate
    if (move){
        speed=movespeed*speedboost;
        direction=45*dir;
        if (powerup==4)
            img2+=1;
        else if (img==0)
            img=1;
        else{
            img=0;
            img2+=1;
            }
        if (img2>=8)
            img2=0;
        }
    else{
        img=0;
        img2=0;
        }
    if (!keyboard_check(vk_control) && !joyhold[global.joyfire]){
        if (r || u || l || d)
            lookdir=dir;
        }
    image_single=img2+lookdir*8;
    
    //FIRE
    firingweaponprev=firingweapon;
    if (keyboard_check(vk_control) || joyhold[global.joyfire]){
        scr_fire();
        firingweapon=1;
        }
    else{
        if (weapcyc>0)
            weapcyc-=1*firerate;
        firingweapon=0;
        }
    
    //End of (!global.ignoreall && !docounter)
    }

//SPECIAL DEPTH
if (piledriving)
    depth=-11;

//Z
zspeed+=zgrav;
z+=zspeed;

//MOVE WHILE PILEDRIVING
if (piledriving && !global.ignoreall){
    r=0; l=0; u=0; d=0;
    move=0;
    speed=0;
    //Get directions
    if (keyboard_check(vk_left) || joyhold[35])
        l=1;
    else if (keyboard_check(vk_right) || joyhold[36])
        r=1;
    if (keyboard_check(vk_up) || joyhold[33])
        u=1;
    else if (keyboard_check(vk_down) || joyhold[34])
        d=1;
    if (r){
        dir=0;
        if (u) dir=1;
        if (d) dir=7;
        }
    else if (l){
        dir=4;
        if (u) dir=3;
        if (d) dir=5;
        }
    else if (u) dir=2;
    else if (d) dir=6;
    if (r || u || l || d)
        move=1;
    //Move
    if (move){
        speed=movespeed*speedboost*0.5;
        direction=45*dir;
        lookdir=dir;
        }
    if (x<obj_sabot.x+8)
        x=obj_sabot.x+8;
    if (x>obj_sabot.x+312)
        x=obj_sabot.x+312;
    if (y<obj_sabot.y+8)
        y=obj_sabot.y+8;
    if (y>obj_sabot.y+232)
        y=obj_sabot.y+232;
    }

//LOOPING SOUNDS
if (icefireloop>0)
    icefireloop-=1;
if (icefire2loop>0)
    icefire2loop-=1;
if (laserfireloop>0)
    laserfireloop-=1;

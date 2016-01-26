scr_music();

//DEMO MODE / ATTRACT MODE
if (tier=="main"){
    democyc+=1;
    if (democyc==200 && !global.demomode){
        global.demomode=1;
        global.nosound=1;
        global.novoice=1;
        global.noshake=1;
        ignoreall=1;
        global.demolevel+=1;
        if (global.demolevel==3){
            global.demolevel=0;
            global.demoroom+=1;
            if (global.demoroom==4)
                global.demoroom=0;
            }
        background_visible[6]=1;
        tempdiff=floor(random(5));
        if (tempdiff==0)
            global.difficulty=2;
        else if (tempdiff==1)
            global.difficulty=3;
        else if (tempdiff==2)
            global.difficulty=4;
        else if (tempdiff==3)
            global.difficulty=6;
        else if (tempdiff==4)
            global.difficulty=8;
        }
    if (global.demomode){
        democyc2+=1;
        scr_newgame();
        if (democyc2==2){
            if (global.demolevel==1){
                room_goto(rom_stage1);
                global.level=1;
                }
            else if (global.demolevel==2){
                room_goto(rom_stage2);
                global.level=2;
                }
            else if (global.demolevel==0){
                room_goto(rom_stage3);
                global.level=3;
                }
            }
        }
    }
else
    democyc=0;

//LOGO PARTICLES
if (tier=="main" && random(1)<0.04)
    instance_create(80+floor(random(160)),16+floor(random(37)),obj_iceparticle);

//ASSIGN GAMEPAD
if (joywait==20){
    if (tier=="joystick" && selected>=1 && selected<=7){
        scr_joy(1);
        scr_joyassign();
        }
    else
        scr_joy(0);
    }
else if (joywait<20)
    joywait+=1;

//IGNORE DEMO
if (joyhold[global.joyfire] || joyhold[global.joychange] || joyhold[global.joypause] || joyhold[global.joyup] || joyhold[global.joyleft] || joyhold[global.joydown] || joyhold[global.joyright] || joyhold[33] || joyhold[34] || joyhold[35] || joyhold[36]){
    if (!ignoreall)
        democyc=0;
    }
    
//USE GAMEPAD
if ((!ignoreall && tier!="joystick") || starting>0){
    if (joy[33])
        event_perform(ev_keypress,vk_up);
    if (joy[34])
        event_perform(ev_keypress,vk_down);
    if (joy[35])
        event_perform(ev_keypress,vk_left);
    if (joy[36])
        event_perform(ev_keypress,vk_right);
    if (joy[global.joyfire])
        scr_mainselect(0);
    if (joy[global.joychange]){
        //BACKSPACE
        if (tier=="enterhighscore"){
            ehsx=3;
            ehsy=4;
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
    if (joy[global.joypause]){
        if (starting>0)
            scr_mainescape();
        else
            scr_mainselect(0);
        }
    }


//UNLOCK REALLY
if (!global.really && tier="start"){
    if (keyboard_check(vk_right) || joyhold[36]){
        reallycyc+=1;
        if (reallycyc==400 && !global.really){
            global.really=1;
            if (!global.nosound)
                sound_play(movesound);
            selections=7;
            }
        }
    else
        reallycyc=0;
    }

//START GAME moved to Draw

//SHAKE SCREEN
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

//GET TEXT
scr_maintext();

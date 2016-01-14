if (logocyc<89 && argument0==0){
    logocyc=89;
    }
else if (logodone || argument0==1){
    instance_create(0,0,obj_mainsabot);
    with (obj_redexplox)
        instance_destroy();
    global.shakescreen=0;
    hypershake=0;
    if (global.gmversion==5){
        view_left[0]=0;
        view_top[0]=0;
        }
    else if (global.gmversion==8){
        view_xview[0]=0;
        view_yview[0]=0;
        }
    sound_stop_all();
    instance_destroy();
    if (obj_mainsabot.enterhighscore==-1)
        background_visible[5]=0;
    }

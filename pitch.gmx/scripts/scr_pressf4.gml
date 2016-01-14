//argument0 1 = get main text

if (keyboard_check(vk_alt)){
    scr_quitgame();
    }
else{
    if (!scr_fullscreen(0,0))
        scr_fullscreen(1,1);
    else
        scr_fullscreen(1,0);
    if (argument0==1)
        scr_maintext();
    global.overridefullscreen=1;
    }

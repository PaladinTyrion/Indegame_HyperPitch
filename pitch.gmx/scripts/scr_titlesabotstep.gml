//USE GAMEPAD
scr_joy(0);
if (joy[global.joyfire])
    scr_titleskip(0);
if (joy[global.joypause])
    scr_titleskip(0);

if (logodone){
    //SHAKE SCREEN
    if (global.shakescreen>0){
        global.shakescreen-=1;
        if (global.shakescreen>4)
            factor=8;
        else if (global.shakescreen>2)
            factor=4;
        else
            factor=2;
        shakeoff=(global.shakescreen mod 2)*factor;
        if (global.noshake)
            shakeoff=0;
        if (global.gmversion==5)
            view_top[0]=y+shakeoff;
        else if (global.gmversion==8)
            view_yview[0]=y+shakeoff;
        }
    //HYPERSHAKE
    if (hypershake){
        hyperxoff=-8+floor(random(16));
        hyperyoff=-8+floor(random(16));
        if (global.gmversion==5){
            view_left[0]=hyperxoff;
            view_top[0]=hyperyoff;
            }
        else if (global.gmversion==8){
            view_xview[0]=hyperxoff;
            view_yview[0]=hyperyoff;
            }
        }
    }

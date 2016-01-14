if (global.joystickexists){
//Catch only one button
temp=0;
for (i=1;i<imaxx+1;i+=1){
    if (joystick_check_button(1,i)){
        temp+=1;
        tempbutton=i;
        }
    }
//Assign
if (temp==1){
    if (selected==1){
        if (global.joyfire!=tempbutton){
            global.joyfire=tempbutton;
            if (!global.nosound)
                sound_play(selectsound);
            }
        }
    else if (selected==2){
        if (global.joychange!=tempbutton){
            global.joychange=tempbutton;
            if (!global.nosound)
                sound_play(selectsound);
            }
        }
    else if (selected==3){
        if (global.joypause!=tempbutton){
            global.joypause=tempbutton;
            if (!global.nosound)
                sound_play(selectsound);
            }
        }
    else if (selected==4){
        if (global.joyup!=tempbutton){
            global.joyup=tempbutton;
            if (!global.nosound)
                sound_play(selectsound);
            }
        }
    else if (selected==5){
        if (global.joydown!=tempbutton){
            global.joydown=tempbutton;
            if (!global.nosound)
                sound_play(selectsound);
            }
        }
    else if (selected==6){
        if (global.joyleft!=tempbutton){
            global.joyleft=tempbutton;
            if (!global.nosound)
                sound_play(selectsound);
            }
        }
    else if (selected==7){
        if (global.joyright!=tempbutton){
            global.joyright=tempbutton;
            if (!global.nosound)
                sound_play(selectsound);
            }
        }
    }
}

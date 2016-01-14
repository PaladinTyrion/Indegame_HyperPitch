if (!ignoreall)
    democyc=0;

if (tier=="enterhighscore" && !ignoreall){
    keycheck=keyboard_lastkey;
    //LETTERS
    if (keycheck==ord("A") || keycheck==ord("B")
     || keycheck==ord("C") || keycheck==ord("D")
     || keycheck==ord("E") || keycheck==ord("F")
     || keycheck==ord("G") || keycheck==ord("H")
     || keycheck==ord("I") || keycheck==ord("J")
     || keycheck==ord("K") || keycheck==ord("L")
     || keycheck==ord("M") || keycheck==ord("N")
     || keycheck==ord("O") || keycheck==ord("P")
     || keycheck==ord("Q") || keycheck==ord("R")
     || keycheck==ord("S") || keycheck==ord("T")
     || keycheck==ord("U") || keycheck==ord("V")
     || keycheck==ord("W") || keycheck==ord("X")
     || keycheck==ord("Y") || keycheck==ord("Z")){
             if (keycheck==ord("A")){ ehsx=0; ehsy=0; }
        else if (keycheck==ord("B")){ ehsx=1; ehsy=0; }
        else if (keycheck==ord("C")){ ehsx=2; ehsy=0; }
        else if (keycheck==ord("D")){ ehsx=3; ehsy=0; }
        else if (keycheck==ord("E")){ ehsx=4; ehsy=0; }
        else if (keycheck==ord("F")){ ehsx=5; ehsy=0; }
        else if (keycheck==ord("G")){ ehsx=0; ehsy=1; }
        else if (keycheck==ord("H")){ ehsx=1; ehsy=1; }
        else if (keycheck==ord("I")){ ehsx=2; ehsy=1; }
        else if (keycheck==ord("J")){ ehsx=3; ehsy=1; }
        else if (keycheck==ord("K")){ ehsx=4; ehsy=1; }
        else if (keycheck==ord("L")){ ehsx=5; ehsy=1; }
        else if (keycheck==ord("M")){ ehsx=0; ehsy=2; }
        else if (keycheck==ord("N")){ ehsx=1; ehsy=2; }
        else if (keycheck==ord("O")){ ehsx=2; ehsy=2; }
        else if (keycheck==ord("P")){ ehsx=3; ehsy=2; }
        else if (keycheck==ord("Q")){ ehsx=4; ehsy=2; }
        else if (keycheck==ord("R")){ ehsx=5; ehsy=2; }
        else if (keycheck==ord("S")){ ehsx=0; ehsy=3; }
        else if (keycheck==ord("T")){ ehsx=1; ehsy=3; }
        else if (keycheck==ord("U")){ ehsx=2; ehsy=3; }
        else if (keycheck==ord("V")){ ehsx=3; ehsy=3; }
        else if (keycheck==ord("W")){ ehsx=4; ehsy=3; }
        else if (keycheck==ord("X")){ ehsx=5; ehsy=3; }
        else if (keycheck==ord("Y")){ ehsx=0; ehsy=4; }
        else if (keycheck==ord("Z")){ ehsx=1; ehsy=4; }
        instance_create(112+ehsx*16,64+ehsy*16,obj_highscorechosen);
        scr_ehsparticles();
        entry[markerx]=chr(keycheck);
        if (markerx<9)
            markerx+=1;
        if (!global.nosound)
            sound_play(selectsound);
        }
    //SPACEBAR
    else if (keycheck==vk_space){
        ehsx=2;
        ehsy=4;
        instance_create(112+ehsx*16,64+ehsy*16,obj_highscorechosen);
        scr_ehsparticles();
        entry[markerx]="_";
        if (markerx<9)
            markerx+=1;
        if (!global.nosound)
            sound_play(selectsound);
        }
    //BACKSPACE
    else if (keycheck==vk_backspace){
        if (!global.nosound)
            sound_play(backsound);
        ehsx=3;
        ehsy=4;
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

//SET KEYS
else if (!ignoreall && tier=="keyboard" && selected>0){
    if (keyboard_lastkey!=vk_up && keyboard_lastkey!=vk_down){
        keycheck=keyboard_lastkey;
        if (keycheck==ord("A") || keycheck==ord("B")
         || keycheck==ord("C") || keycheck==ord("D")
         || keycheck==ord("E") || keycheck==ord("F")
         || keycheck==ord("G") || keycheck==ord("H")
         || keycheck==ord("I") || keycheck==ord("J")
         || keycheck==ord("K") || keycheck==ord("L")
         || keycheck==ord("M") || keycheck==ord("N")
         || keycheck==ord("O") || keycheck==ord("P")
         || keycheck==ord("Q") || keycheck==ord("R")
         || keycheck==ord("S") || keycheck==ord("T")
         || keycheck==ord("U") || keycheck==ord("V")
         || keycheck==ord("W") || keycheck==ord("X")
         || keycheck==ord("Y") || keycheck==ord("Z")){
            if (selected==1){
                global.firekey=keycheck;
                if (!global.nosound)
                    sound_play(selectsound);
                }
            else if (selected==2){
                global.changekey=keycheck;
                if (!global.nosound)
                    sound_play(selectsound);
                }
            else if (selected==3){
                global.wupkey=keycheck;
                if (!global.nosound)
                    sound_play(selectsound);
                }
            else if (selected==4){
                global.wleftkey=keycheck;
                if (!global.nosound)
                    sound_play(selectsound);
                }
            else if (selected==5){
                global.wdownkey=keycheck;
                if (!global.nosound)
                    sound_play(selectsound);
                }
            else if (selected==6){
                global.wrightkey=keycheck;
                if (!global.nosound)
                    sound_play(selectsound);
                }
            scr_maintext();
            }
        }
    }

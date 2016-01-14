//INIT
if (!init){
    init=1;
    start=1; //how many frames to wait between logo and title
    cyc=0;
    whiteimg=0;
    extrawait=10;
    if (global.skipsplash)
        scr_titleskip(1);
    else
        global.skipsplash=1;
    }
drawwhite=0;

//LOGO
if (!logodone){
    logocyc+=1;
    if (logocyc>=90){
        logodone=1;
        sound_stop(snd_pitchtaunt3);
        sound_stop(snd_pitchtaunt4);
        sound_stop(snd_pitchgoddess2);
        }
    draw_sprite(spr_rglogo,0,100,109);
    lganimcyc+=1;
    if (lganimcyc==20){
        lganimcyc=18;
        if (lganim==9) //Skip frames
            lganim+=1;
        if (lganim<16)
            lganim+=1;
        if (lganim==1 && !global.novoice){
            temp=floor(random(3));
            if (temp==0)
                sound_play(snd_pitchtaunt3);
            else if (temp==1)
                sound_play(snd_pitchtaunt4);
            else if (temp==2)
                sound_play(snd_pitchgoddess2);
            }
        }
    draw_sprite(spr_logoanim,lganim,82,94);
    }

//TITLE APPEARS
else if (logodone){
    cyc+=1;
    if (cyc==start){
        global.shakescreen=10;
        draw=1;
        if (!global.nosound)
            sound_play(snd_explo4);
        }
    //HYPER APPEARS
    if (cyc==start+40 || cyc==start+50 || cyc==start+60 || cyc==start+70 || cyc==start+80){
        global.shakescreen=4;
        draw=1;
        if (!global.nosound){
            sound_stop(snd_explo3);
            sound_play(snd_explo3);
            }
        }
    //COOL*=1.2;
    if (cyc==start+95){
        if (!global.nosound)
            sound_play(snd_laserstart);
        }
    //PRINCESS PITCH APPEARS
    if (cyc>=start+110 && cyc<=start+136 && cyc!=start+126 && (cyc mod 2 == 0)){
        (instance_create(56+(cyc-(start+110))*8,76,obj_redexplox)).depth=depth-1;
        if (cyc mod 4 == 0)
            scr_explo2();
        }
    
    
    //DRAW
    //Black behind
    for (i=-1;i<11;i+=1){
        for (j=-1;j<9;j+=1)
            draw_background(bg_black,i*32,j*32);
        }
    //Title screen
    if (draw==1){
        draw_sprite(spr_title,0,0,0);
        draw_sprite(spr_title,1,160,0);
        draw_sprite(spr_title,2,0,120);
        draw_sprite(spr_title,3,160,120);
        //"Hyper"
        if (cyc>=start+40)
            draw_sprite(spr_titletext,0,48,10);
        else if (cyc>=start+36)
            draw_sprite(spr_titletext,0,48-16*(start+40-cyc),10-16*(start+40-cyc));
        if (cyc>=start+50)
            draw_sprite(spr_titletext,1,96,10);
        else if (cyc>=start+46)
            draw_sprite(spr_titletext,1,96-8*(start+50-cyc),10-16*(start+50-cyc));
        if (cyc>=start+60)
            draw_sprite(spr_titletext,2,144,10);
        else if (cyc>=start+56)
            draw_sprite(spr_titletext,2,144,10-16*(start+60-cyc));
        if (cyc>=start+70)
            draw_sprite(spr_titletext,3,188,10);
        else if (cyc>=start+66)
            draw_sprite(spr_titletext,3,188+8*(start+70-cyc),10-16*(start+70-cyc));
        if (cyc>=start+80)
            draw_sprite(spr_titletext,4,232,10);
        else if (cyc>=start+76)
            draw_sprite(spr_titletext,4,232+16*(start+80-cyc),10-16*(start+80-cyc));
        //Rainbow
        if (cyc>=start+95){
            laserimg+=1;
            if (laserimg==7)
                laserimg=0;
            if (rainbow<22)
                rainbow+=2;
            for (i=0;i<rainbow;i+=1){
                draw_sprite(spr_megalaser,laserimg,i*16,76);
                tempoff=i*16+6;
                }
            draw_sprite(spr_iceflash,0,tempoff,76);
            }
        //"Princess Pitch"
        if (cyc>=start+110) draw_sprite(spr_titletext2,0,49,68);
        if (cyc>=start+112) draw_sprite(spr_titletext2,1,65,68);
        if (cyc>=start+114) draw_sprite(spr_titletext2,2,81,68);
        if (cyc>=start+116) draw_sprite(spr_titletext2,3,97,68);
        if (cyc>=start+118) draw_sprite(spr_titletext2,4,113,68);
        if (cyc>=start+120) draw_sprite(spr_titletext2,5,129,68);
        if (cyc>=start+122) draw_sprite(spr_titletext2,6,145,68);
        if (cyc>=start+124) draw_sprite(spr_titletext2,7,161,68);
        if (cyc>=start+128) draw_sprite(spr_titletext2,8,193,68);
        if (cyc>=start+130) draw_sprite(spr_titletext2,9,209,68);
        if (cyc>=start+132) draw_sprite(spr_titletext2,10,225,68);
        if (cyc>=start+134) draw_sprite(spr_titletext2,11,241,68);
        if (cyc>=start+136) draw_sprite(spr_titletext2,12,257,68);
        //Next
        if (cyc>=start+180){
            draw=2;
            if (!global.nosound)
                sound_play(snd_pitchcarnage2);
            }
        }
    
    //TITLE 2
    if (draw==2){
        draw_sprite(spr_title2,0,0,0);
        draw_sprite(spr_title2,1,160,0);
        draw_sprite(spr_title2,2,0,120);
        draw_sprite(spr_title2,3,160,120);
        cyc2+=1;
        //Everything is normal
        if (cyc2<39+extrawait){
            draw_sprite(spr_titleputer1,0,0,0);
            draw_sprite(spr_titlejeff1,0,0,0);
            }
        //Oh snap
        if (cyc2==39+extrawait){
            if (!global.nosound)
                sound_play(snd_nuke);
            }
        if (cyc2>=39+extrawait && cyc2<=42+extrawait){
            draw_sprite(spr_titlejeff1,0,0,0);
            draw_sprite(spr_titleputer2,0,0,0);
            draw_sprite(spr_titleputer2,1,160,0);
            hypershake=1;
            }
        else if (cyc2>=43+extrawait && cyc2<=44+extrawait)
            drawwhite=1;
        else if (cyc2>=45+extrawait && cyc2<=48+extrawait){
            draw_sprite(spr_titleputer2,0,0,8);
            draw_sprite(spr_titleputer2,1,160,8);
            draw_sprite(spr_titlejeff2,0,0,0);
            }
        else if (cyc2>=49+extrawait && cyc2<=50+extrawait)
            drawwhite=1;
        else if (cyc2>=51+extrawait && cyc2<=54+extrawait){
            draw_sprite(spr_titleputer2,0,0,0);
            draw_sprite(spr_titleputer2,1,160,0);
            draw_sprite(spr_titlejeff3,0,0,0);
            }
        else if (cyc2>=55+extrawait && cyc2<=56+extrawait)
            drawwhite=1;
        else if (cyc2>=57+extrawait && cyc2<=61+extrawait){
            draw_sprite(spr_titleputer2,0,0,8);
            draw_sprite(spr_titleputer2,1,160,8);
            draw_sprite(spr_titlejeff4,0,0,0);
            }
        else if (cyc2>=62+extrawait)
            drawwhite=1;
        //Fade out
        if (cyc2>=103+extrawait && whiteimg<5){
            hypershake=0;
            hyperxoff=0;
            hyperyoff=0;
            shakescreen=0;
            if (!fadeout)
                fadeout=1;
            else{
                fadeout=0;
                whiteimg+=1;
                }
            }
        //Proceed
        if (cyc2==160+extrawait)
            scr_titleskip();
        //Yeah
        yeahcyc+=1;
        if (yeahcyc<25)
            draw_sprite(spr_titleyeah,0,yeahcyc*2,-yeahcyc*2)
        }
   
    //WHITE SCREEN
    if (drawwhite>0){
        for (i=-2;i<12;i+=1){
            for (j=-2;j<13;j+=1)
                draw_sprite(spr_coverscreen,whiteimg,i*32,j*24);
            }
        }
    }

scr_showfps(0);

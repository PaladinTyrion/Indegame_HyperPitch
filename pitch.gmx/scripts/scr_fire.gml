//---------------------------
//POWER WEAPONS
//---------------------------
if (powerup==2){
//CANNON
if (weapon==1){
    if (bricksound<=0){
        if (!global.nosound)
            sound_play(snd_brickfire);
        bricksound=4;
        }
    if (weapcyc<=0){
        global.stats[1]+=1;
        firing=1;
        redimg+=1;
        redang+=2;
        if (redimg==8)
            redimg=0;
        weapcyc+=2;
             if (lookdir==0) (instance_create(x+4,y+2,obj_redbrick)).direction=0+hbda;
        else if (lookdir==1) (instance_create(x+2,y+1,obj_redbrick)).direction=45+hbda;
        else if (lookdir==2) (instance_create(x,y-1,obj_redbrick)).direction=90+hbda;
        else if (lookdir==3) (instance_create(x-2,y+1,obj_redbrick)).direction=135+hbda;
        else if (lookdir==4) (instance_create(x-2,y+2,obj_redbrick)).direction=180+hbda;
        else if (lookdir==5) (instance_create(x,y+2,obj_redbrick)).direction=225+hbda;
        else if (lookdir==6) (instance_create(x+1,y+2,obj_redbrick)).direction=270+hbda;
        else if (lookdir==7) (instance_create(x+2,y+2,obj_redbrick)).direction=315+hbda;
        if (hbdad==0){
            hbda+=4;
            if (hbda==8)
                hbdad=1;
            }
        else if (hbdad==1){
            hbda-=4;
            if (hbda==-8)
                hbdad=0;
            }
        }
    weapcyc-=1*firerate;
    }
//ICEBLASTER
else if (weapon==2){
    if (icefire2loop==0 && weapcyc<=0){
        scr_explo2();
        sound_stop(snd_icestart);
        sound_stop(snd_icefire);
        if (!global.nosound){
            sound_play(snd_icestart);
            sound_loop(snd_icefire2);
            }
        }
    if (weapcyc<=0){
        icefire2loop=3;
        global.stats[1]+=1;
        firing=1;
        global.ammo2-=0.03125;
        if (global.ammo2<=0){
            global.ammo2=0;
            weapon=1;
            }
        weapcyc+=1.666;
        fac=4;
        xo=-1+(random(2));
        yo=-1+floor(random(2));
             if (lookdir==0) (instance_create(x+4+xo,y+2+yo,obj_iceblast2)).direction=0-fac+random(fac)*2;
        else if (lookdir==1) (instance_create(x+2+xo,y+1+yo,obj_iceblast2)).direction=45-fac+random(fac)*2;
        else if (lookdir==2) (instance_create(x+xo,y-1+yo,obj_iceblast2)).direction=90-fac+random(fac)*2;
        else if (lookdir==3) (instance_create(x-2+xo,y+1+yo,obj_iceblast2)).direction=135-fac+random(fac)*2;
        else if (lookdir==4) (instance_create(x-2+xo,y+2+yo,obj_iceblast2)).direction=180-fac+random(fac)*2;
        else if (lookdir==5) (instance_create(x+xo,y+2+yo,obj_iceblast2)).direction=225-fac+random(fac)*2;
        else if (lookdir==6) (instance_create(x+1+xo,y+2+yo,obj_iceblast2)).direction=270-fac+random(fac)*2;
        else if (lookdir==7) (instance_create(x+2+xo,y+2+yo,obj_iceblast2)).direction=315-fac+random(fac)*2;
        }
    weapcyc-=1*firerate;
    if (global.shakescreen<2)
        global.shakescreen+=2;
    }
//RAINBOW LASER
if (weapon==3){
    if (laserfireloop==0){
        sound_stop(snd_laserstart);
        if (!global.nosound){
            sound_play(snd_laserstart);
            sound_loop(snd_laserfire);
            }
        }
    if (weapcyc<=0){
        laserfireloop=2;
        global.stats[1]+=1;
        firing=1;
        global.ammo3-=0.025;
        if (global.ammo3<=0){
            global.ammo3=0;
            weapon=1;
            }
        laserimg+=1;
        if (laserimg==3 || laserimg==5)
            laserpower=2;
        else if (laserimg==7){
            laserimg=0;
            laserpower=2;
            }
        else
            laserpower=1;
        weapcyc+=1;
        
        if (lookdir==0){
            tempid=instance_create(x+4,y+2,obj_megalaser);
            tempid.direction=0;
            }
        else if (lookdir==1){
            tempid=instance_create(x+2,y+1,obj_megalaser);
            tempid.direction=45;
            }
        else if (lookdir==2){
            tempid=instance_create(x,y-1,obj_megalaser);
            tempid.direction=90;
            }
        else if (lookdir==3){
            tempid=instance_create(x-2,y+1,obj_megalaser);
            tempid.direction=135;
            }
        else if (lookdir==4){
            tempid=instance_create(x-2,y+2,obj_megalaser);
            tempid.direction=180;
            }
        else if (lookdir==5){
            tempid=instance_create(x,y+2,obj_megalaser);
            tempid.direction=225;
            }
        else if (lookdir==6){
            tempid=instance_create(x,y+2,obj_megalaser);
            tempid.direction=270;
            }
        else if (lookdir==7){
            tempid=instance_create(x+2,y+2,obj_megalaser);
            tempid.direction=315;
            }
        tempid.laserpower=laserpower;
        }
    weapcyc-=1*firerate;
    if (global.shakescreen<2)
        global.shakescreen+=2;
    }
}

//---------------------------
//REGULAR WEAPONS
//---------------------------
else{
//CANNON
if (weapon==1){
    weapcyc-=1*firerate;
    if (bricksound<=0){
        if (!global.nosound)
            sound_play(snd_brickfire);
        bricksound=5;
        }
    if (weapcyc<=0){
        global.stats[1]+=1;
        firing=1;
        redimg+=1;
        redang+=2;
        if (redimg==8)
            redimg=0;
        weapcyc+=4;
             if (lookdir==0) (instance_create(x+4,y+2,obj_redbrick)).direction=0;
        else if (lookdir==1) (instance_create(x+2,y+1,obj_redbrick)).direction=45;
        else if (lookdir==2) (instance_create(x,y-1,obj_redbrick)).direction=90;
        else if (lookdir==3) (instance_create(x-2,y+1,obj_redbrick)).direction=135;
        else if (lookdir==4) (instance_create(x-2,y+2,obj_redbrick)).direction=180;
        else if (lookdir==5) (instance_create(x,y+2,obj_redbrick)).direction=225;
        else if (lookdir==6) (instance_create(x,y+2,obj_redbrick)).direction=270;
        else if (lookdir==7) (instance_create(x+2,y+2,obj_redbrick)).direction=315;
        if (powerup==1){
            global.stats[1]+=2;
                 if (lookdir==1) (instance_create(x+4,y+2,obj_redbrick)).direction=0;
            else if (lookdir==2) (instance_create(x+2,y+1,obj_redbrick)).direction=45;
            else if (lookdir==3) (instance_create(x,y-1,obj_redbrick)).direction=90;
            else if (lookdir==4) (instance_create(x-2,y+1,obj_redbrick)).direction=135;
            else if (lookdir==5) (instance_create(x-2,y+2,obj_redbrick)).direction=180;
            else if (lookdir==6) (instance_create(x,y+2,obj_redbrick)).direction=225;
            else if (lookdir==7) (instance_create(x,y+2,obj_redbrick)).direction=270;
            else if (lookdir==0) (instance_create(x+2,y+2,obj_redbrick)).direction=315;
                 if (lookdir==7) (instance_create(x+4,y+2,obj_redbrick)).direction=0;
            else if (lookdir==0) (instance_create(x+2,y+1,obj_redbrick)).direction=45;
            else if (lookdir==1) (instance_create(x,y-1,obj_redbrick)).direction=90;
            else if (lookdir==2) (instance_create(x-2,y+1,obj_redbrick)).direction=135;
            else if (lookdir==3) (instance_create(x-2,y+2,obj_redbrick)).direction=180;
            else if (lookdir==4) (instance_create(x,y+2,obj_redbrick)).direction=225;
            else if (lookdir==5) (instance_create(x,y+2,obj_redbrick)).direction=270;
            else if (lookdir==6) (instance_create(x+2,y+2,obj_redbrick)).direction=315;
            }
        }
    }
//ICEBLASTER
else if (weapon==2){
    if (icefireloop==0 && weapcyc<=0){
        sound_stop(snd_icestart);
        sound_stop(snd_icefire);
        sound_stop(snd_icefire2);
        if (!global.nosound){
            sound_play(snd_icestart);
            sound_loop(snd_icefire);
            }
        }
    if (weapcyc<=0){
        icefireloop=3;
        global.stats[1]+=1;
        firing=1;
        global.ammo2-=0.04165;
        //if (powerup==1)
        //    global.ammo2-=0.04165;
        if (global.ammo2<=0){
            global.ammo2=0;
            weapon=1;
            }
        weapcyc+=1.666;
        fac=8;
        xo=-1+(random(2));
        yo=-1+floor(random(2));
             if (lookdir==0) (instance_create(x+4+xo,y+2+yo,obj_iceblast)).direction=0-fac+random(fac)*2;
        else if (lookdir==1) (instance_create(x+2+xo,y+1+yo,obj_iceblast)).direction=45-fac+random(fac)*2;
        else if (lookdir==2) (instance_create(x+xo,y-1+yo,obj_iceblast)).direction=90-fac+random(fac)*2;
        else if (lookdir==3) (instance_create(x-2+xo,y+1+yo,obj_iceblast)).direction=135-fac+random(fac)*2;
        else if (lookdir==4) (instance_create(x-2+xo,y+2+yo,obj_iceblast)).direction=180-fac+random(fac)*2;
        else if (lookdir==5) (instance_create(x+xo,y+2+yo,obj_iceblast)).direction=225-fac+random(fac)*2;
        else if (lookdir==6) (instance_create(x+xo,y+2+yo,obj_iceblast)).direction=270-fac+random(fac)*2;
        else if (lookdir==7) (instance_create(x+2+xo,y+2+yo,obj_iceblast)).direction=315-fac+random(fac)*2;
        if (powerup==1){
            global.stats[1]+=2;
                 if (lookdir==1) (instance_create(x+4+xo,y+2+yo,obj_iceblast)).direction=0-fac+random(fac)*2;
            else if (lookdir==2) (instance_create(x+2+xo,y+1+yo,obj_iceblast)).direction=45-fac+random(fac)*2;
            else if (lookdir==3) (instance_create(x+xo,y-1+yo,obj_iceblast)).direction=90-fac+random(fac)*2;
            else if (lookdir==4) (instance_create(x-2+xo,y+1+yo,obj_iceblast)).direction=135-fac+random(fac)*2;
            else if (lookdir==5) (instance_create(x-2+xo,y+2+yo,obj_iceblast)).direction=180-fac+random(fac)*2;
            else if (lookdir==6) (instance_create(x+xo,y+2+yo,obj_iceblast)).direction=225-fac+random(fac)*2;
            else if (lookdir==7) (instance_create(x+xo,y+2+yo,obj_iceblast)).direction=270-fac+random(fac)*2;
            else if (lookdir==0) (instance_create(x+2+xo,y+2+yo,obj_iceblast)).direction=315-fac+random(fac)*2;
                 if (lookdir==7) (instance_create(x+4+xo,y+2+yo,obj_iceblast)).direction=0-fac+random(fac)*2;
            else if (lookdir==0) (instance_create(x+2+xo,y+1+yo,obj_iceblast)).direction=45-fac+random(fac)*2;
            else if (lookdir==1) (instance_create(x+xo,y-1+yo,obj_iceblast)).direction=90-fac+random(fac)*2;
            else if (lookdir==2) (instance_create(x-2+xo,y+1+yo,obj_iceblast)).direction=135-fac+random(fac)*2;
            else if (lookdir==3) (instance_create(x-2+xo,y+2+yo,obj_iceblast)).direction=180-fac+random(fac)*2;
            else if (lookdir==4) (instance_create(x+xo,y+2+yo,obj_iceblast)).direction=225-fac+random(fac)*2;
            else if (lookdir==5) (instance_create(x+xo,y+2+yo,obj_iceblast)).direction=270-fac+random(fac)*2;
            else if (lookdir==6) (instance_create(x+2+xo,y+2+yo,obj_iceblast)).direction=315-fac+random(fac)*2;
            }
        }
    weapcyc-=1*firerate;
    }
//RAINBOW LASER
else if (weapon==3){
    weapcyc-=1*firerate;
    if (weapcyc<=0){
        global.stats[1]+=1;
        sound_stop(snd_rainbowfire1);
        sound_stop(snd_rainbowfire2);
        if (!global.nosound){
            if (random(1)<0.5)
                sound_play(snd_rainbowfire1);
            else
                sound_play(snd_rainbowfire2);
            }
        firing=1;
        global.ammo3-=0.25;
        //if (powerup==1)
        //    global.ammo3-=0.25;
        if (global.ammo3<=0){
            global.ammo3=0;
            weapon=1;
            }
        laserimg+=1;
        if (laserimg==7)
            laserimg=0;
        weapcyc+=10;
             if (lookdir==0) (instance_create(x+4,y+2,obj_laser)).direction=0;
        else if (lookdir==1) (instance_create(x+1,y+1,obj_laser)).direction=45;
        else if (lookdir==2) (instance_create(x,y-1,obj_laser)).direction=90;
        else if (lookdir==3) (instance_create(x,y+1,obj_laser)).direction=135;
        else if (lookdir==4) (instance_create(x-2,y+2,obj_laser)).direction=180;
        else if (lookdir==5) (instance_create(x,y+2,obj_laser)).direction=225;
        else if (lookdir==6) (instance_create(x,y+2,obj_laser)).direction=270;
        else if (lookdir==7) (instance_create(x+1,y+2,obj_laser)).direction=315;
        if (powerup==1){
            global.stats[1]+=2;
                 if (lookdir==1) (instance_create(x+4,y+2,obj_laser)).direction=0;
            else if (lookdir==2) (instance_create(x+1,y+1,obj_laser)).direction=45;
            else if (lookdir==3) (instance_create(x,y-1,obj_laser)).direction=90;
            else if (lookdir==4) (instance_create(x,y+1,obj_laser)).direction=135;
            else if (lookdir==5) (instance_create(x-2,y+2,obj_laser)).direction=180;
            else if (lookdir==6) (instance_create(x,y+2,obj_laser)).direction=225;
            else if (lookdir==7) (instance_create(x,y+2,obj_laser)).direction=270;
            else if (lookdir==0) (instance_create(x+1,y+2,obj_laser)).direction=315;
                 if (lookdir==7) (instance_create(x+4,y+2,obj_laser)).direction=0;
            else if (lookdir==0) (instance_create(x+1,y+1,obj_laser)).direction=45;
            else if (lookdir==1) (instance_create(x,y-1,obj_laser)).direction=90;
            else if (lookdir==2) (instance_create(x,y+1,obj_laser)).direction=135;
            else if (lookdir==3) (instance_create(x-2,y+2,obj_laser)).direction=180;
            else if (lookdir==4) (instance_create(x,y+2,obj_laser)).direction=225;
            else if (lookdir==5) (instance_create(x,y+2,obj_laser)).direction=270;
            else if (lookdir==6) (instance_create(x+1,y+2,obj_laser)).direction=315;
            }
        }
    }
//HYPER
if (weapon==4){
    //HYPER
    if (hyperweapon==0){
        weapcyc-=1*firerate;
        if (weapcyc<=0){
            global.stats[1]+=1;
            if (!global.nosound){
                sound_stop(snd_goldbrickfire);
                sound_play(snd_goldbrickfire);
                }
            firing=1;
            redimg+=1;
            redang+=2;
            if (redimg==8)
                redimg=0;
            weapcyc+=10;
                 if (lookdir==0) (instance_create(x+4,y+2,obj_goldbrick)).direction=0;
            else if (lookdir==1) (instance_create(x+2,y+1,obj_goldbrick)).direction=45;
            else if (lookdir==2) (instance_create(x,y-1,obj_goldbrick)).direction=90;
            else if (lookdir==3) (instance_create(x-2,y+1,obj_goldbrick)).direction=135;
            else if (lookdir==4) (instance_create(x-2,y+2,obj_goldbrick)).direction=180;
            else if (lookdir==5) (instance_create(x,y+2,obj_goldbrick)).direction=225;
            else if (lookdir==6) (instance_create(x,y+2,obj_goldbrick)).direction=270;
            else if (lookdir==7) (instance_create(x+2,y+2,obj_goldbrick)).direction=315;
            }
        }
    //HYPER X
    else if (hyperweapon==1){
        weapcyc-=1*firerate;
        if (weapcyc<=0){
            global.stats[1]+=1;
            firing=1;
            weapcyc+=5;
            if (global.shakescreen<4)
                global.shakescreen+=2;
            scr_explo2();
            repeat(6){
                spread=-15+random(30);
                     if (lookdir==0) (instance_create(x+4,y+2,obj_exploprojectile)).direction=0+spread;
                else if (lookdir==1) (instance_create(x+2,y+1,obj_exploprojectile)).direction=45+spread;
                else if (lookdir==2) (instance_create(x,y-1,obj_exploprojectile)).direction=90+spread;
                else if (lookdir==3) (instance_create(x-2,y+1,obj_exploprojectile)).direction=135+spread;
                else if (lookdir==4) (instance_create(x-2,y+2,obj_exploprojectile)).direction=180+spread;
                else if (lookdir==5) (instance_create(x,y+2,obj_exploprojectile)).direction=225+spread;
                else if (lookdir==6) (instance_create(x,y+2,obj_exploprojectile)).direction=270+spread;
                else if (lookdir==7) (instance_create(x+2,y+2,obj_exploprojectile)).direction=315+spread;
                }
            }
        }
    //HYPER Y
    else if (hyperweapon==2){
        weapcyc-=1*firerate;
        if (weapcyc<=0){
            global.stats[1]+=1;
            sound_play(snd_brickfire);
            firing=1;
            weapcyc+=3;
            if (hldad==0){
                hlda+=3;
                if (hlda==6)
                    hldad=1;
                }
            else if (hldad==1){
                hlda-=3;
                if (hlda==-6)
                    hldad=0;
                }
            if (lookdir==0){
                tempid=instance_create(x+4,y+2,obj_laser);
                tempid.direction=0+hlda;
                }
            else if (lookdir==1){
                tempid=instance_create(x+1,y+1,obj_laser);
                tempid.direction=45+hlda;
                }
            else if (lookdir==2){
                tempid=instance_create(x,y-1,obj_laser);
                tempid.direction=90+hlda;
                }
            else if (lookdir==3){
                tempid=instance_create(x,y+1,obj_laser);
                tempid.direction=135+hlda;
                }
            else if (lookdir==4){
                tempid=instance_create(x-2,y+2,obj_laser);
                tempid.direction=180+hlda;
                }
            else if (lookdir==5){
                tempid=instance_create(x,y+2,obj_laser);
                tempid.direction=225+hlda;
                }
            else if (lookdir==6){
                tempid=instance_create(x,y+2,obj_laser);
                tempid.direction=270+hlda;
                }
            else if (lookdir==7){
                tempid=instance_create(x+1,y+2,obj_laser);
                tempid.direction=315+hlda;
                }
            tempid.sprite_index=spr_hyperlaser;
            tempid.hypery=1;
            tempid2=instance_create(tempid.x+cos(degtorad(tempid.direction))*5,tempid.y-sin(degtorad(tempid.direction))*5,obj_laserexplo);
            tempid2.sprite_index=spr_hyperlaserexplo;
            }
        }
    //HYPER Z
    else if (hyperweapon==3){
        redimg+=1;
        redang+=2;
        if (redimg==8)
            redimg=0;
        if (global.shakescreen<2)
            global.shakescreen+=2;
        
        if (weapcyc<=0){
            cyclonedir+=15;
            if (cyclonedir>=360)
                cyclonedir-=360;
            cyclonedir2-=10;
            if (cyclonedir2<=0)
                cyclonedir2+=360;
            global.stats[1]+=6;
            if (!global.nosound)
                sound_play(snd_brickfire);
            firing=1;
            weapcyc+=1.25; //1.666
            for (i=0;i<3;i+=1){
                tempid=instance_create(x+cos(degtorad(cyclonedir+i*120))*4,y-sin(degtorad(cyclonedir+i*120))*4,obj_iceblast2);
                tempid.direction=cyclonedir+i*120;
                }
            for (i=0;i<2;i+=1){
                tempid=instance_create(x+cos(degtorad(cyclonedir2+i*180))*4,y-sin(degtorad(cyclonedir2+i*180))*4,obj_redbrick);
                tempid.direction=cyclonedir2+i*180;
                }
            }
        weapcyc-=1*firerate;
        //if (!sound_isplaying(snd_icefire2)){
        if (icefire2loop==0){
            scr_explo2();
            sound_stop(snd_icestart);
            sound_stop(snd_icefire2);
            if (!global.nosound){
                sound_play(snd_icestart);
                sound_loop(snd_icefire2);
                }
            }
        icefire2loop=3;
        }
    }
}

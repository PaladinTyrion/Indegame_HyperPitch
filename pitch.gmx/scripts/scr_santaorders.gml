//MAY SPEAK
mayspeak=0;
if (!global.ignoreall && obj_pitch.hp>0)
    mayspeak=1;

//NO-ONE WILL SEE THIS ANYWAY
if (global.difficulty==32)
    overcharge=1;

//AFRAID OF GOE
if (instance_number(obj_goddessbuster)==1 && hp>0){
    if (!ohcrap){
        obj_boardtext.text="@UH@OH@@@@@@@@@@@@@@@@UH@OH@";
        sound_stop(snd_enemycharge);
        ohcrap=1;
        scr_pose(35);
        wantimg=3;
        img=3;
        }
    if (scared==20 && obj_goddessbuster.perform<=30){
        scr_stopsantavoice();
        if (obj_sabot.desperation)
            obj_goddessbuster.perform-=20;
        if (!global.novoice){
            if (obj_sabot.desperation)
                sound_play(snd_santascared2);
            else
                sound_play(snd_santascared);
            }
        }
    wantx=x;
    wanty=y;
    if (wantx<obj_sabot.x+48)
        wantx=obj_sabot.x+48;
    if (wantx>obj_sabot.x+272)
        wantx=obj_sabot.x+272;
    if (scared<40){
        scared+=1;
        wanty=obj_sabot.y+64;
        }
    attacking=0;
    cyc=0;
    repeater=0;
    accel=0;
    accel2=0;
    accel3=0;
    accelpoint=0;
    temphit=0;
    temphit2=0;
    angle=0;
    btype=0;
    btypesound=0;
    bulletspeedx=0;
    dirx=0;
    thunderprepare=0;
    thundertype=0;
    lefthanded=0;
    stopthunder=0;
    }

//NORMAL
if (attacking==0){
    if (mayspeak)
        cyc+=1;
    if (cyc==20){
        if (global.difficulty>=4 && hp<=maxhp*0.5 && !lastattack)
            obj_cheersquad.jumpin=1;
        }
    if (cyc==40){
        cyc=0;
        attacking=1;
        pattern+=1;
        //Patterns per difficulty
        // E = 4
        // N = 6
        // H = 8
        //UV = 10
        //NM = 12+3
        //RM = 12+3
        //Patterns to skip
        if (global.difficulty<=4 && pattern==4)//H
            pattern+=1;
        if (global.difficulty<=3 && pattern==5)//N
            pattern+=1;
        if (global.difficulty==2 && pattern==6)//E
            pattern+=1;
        if (global.difficulty<=4 && pattern==8)//H
            pattern+=1;
        if (global.difficulty<=3 && pattern==9)//E
            pattern+=1;
        if (global.difficulty<=3 && pattern==10)//N
            pattern+=1;
        if (global.difficulty<=6 && pattern==11)//UV
            pattern+=1;
        if (global.difficulty<=6 && pattern==12)//UV
            pattern+=1;
        //Loop back to first pattern
        if (pattern>12)
            pattern=1;
        //CURRENTLY REMOVED:
        //NM randomizes all 12 patterns,
        //and doesn't do the same pattern twice in a row
        //doesn't happen on RM to avoid luck manipulation
        /*
        if (global.difficulty==8){
            prevpattern=patternx;
            pattern=floor(random(12))+1;
            patternx=pattern;
            while (prevpattern==patternx){
                pattern=floor(random(12))+1;
                patternx=pattern;
                }
            }
        */
        //Desperation attacks
        if (lastattack){
            if (desperationswitch==0)
                pattern=14;
            else
                pattern=15;
            desperationswitch=1-desperationswitch;
            }
        }
    }

//Patterns
if (attacking){
cyc+=1;
//----------------------------------
//1: Multi hand storm
//----------------------------------
if (pattern==1){
    repeater=40-global.difficulty*3;
    if (repeater<4)
        repeater=4;
    
    if (cyc==1){
        obj_boardtext.text="@@@@@@MULTI@HAND@STORM@@@@@@";
        scr_pose(3);
        wantx=obj_sabot.x+160;
        if (!global.nosound)
            sound_play(snd_movewhoosh);
        if (mayspeak){
            scr_stopsantavoice();
            if (!global.novoice)
                sound_play(snd_santaattack);
            }
        }
    else if (cyc==40){
        scr_pose(4);
        if (mayspeak){
            scr_stopsantavoice();
            if (!global.novoice)
                sound_play(snd_santaattack01);
            }
        }
    else if (cyc>=50 && cyc<250 && (cyc mod repeater==0)){
        obj_cheersquad.cheer=2;
        wantx=obj_sabot.x+80+random(192);
        while (abs(wantx-x)<32)
            wantx=obj_sabot.x+80+random(192);
        sound_stop(snd_enemyfire3);
        if (!global.nosound)
            sound_play(snd_enemyfire3);
        tempid=instance_create(obj_santahandr.x,obj_santahandr.y,obj_enemybullet4);
        tempid.direction=270;
        tempid.onfire=1;
        if (obj_santahandr.x<obj_pitch.x-16)
            tempid.direction+=20;
        else if (obj_santahandr.x>obj_pitch.x+16)
            tempid.direction-=20;
        if (global.difficulty>=4){
            tempid=instance_create(obj_santahandr.x,obj_santahandr.y,obj_enemybullet6);
            tempid.speed=2.2;
            tempid.direction=0;
            tempid.gravity=0.05;
            tempid.gravity_direction=270;
            tempid=instance_create(obj_santahandr.x,obj_santahandr.y,obj_enemybullet6);
            tempid.speed=2.2;
            tempid.direction=180;
            tempid.gravity=0.05;
            tempid.gravity_direction=270;
            }
        }
    else if (cyc==250){
        scr_pose(1);
        cyc=0;
        attacking=0;
        }
    }
//----------------------------------
//2: Cowabunga
//----------------------------------
if (pattern==2){
    if (cyc==1){
        tempfrot=0;
        obj_boardtext.text="@@@@@@@@@COWABUNGA@@@@@@@@@@";
        scr_pose(5);
        if (!global.nosound)
            sound_play(snd_movewhoosh);
        wantx=obj_sabot.x+64;
        repeater=40-global.difficulty*4;
        if (repeater<4)
            repeater=4;
        if (mayspeak){
            scr_stopsantavoice();
            if (!global.novoice)
                sound_play(snd_santaattack02);
            }
        }
    if (cyc==20 && global.difficulty>=3){
        sound_stop(snd_enemyfire3);
        if (!global.nosound)
            sound_play(snd_enemyfire3);
        tempid=instance_create(obj_santahandl.x,obj_santahandl.y+4,obj_enemybullet4);
        tempid.direction=point_direction(obj_santahandl.x,obj_santahandl.y+4,obj_pitch.x,obj_pitch.y);
        tempid.onfire=1;
        tempid.speed=2;
        }
    if (cyc>=20 && !temphit2){
        tempfrot+=0.3;
        if (cyc mod repeater==0){
            if (!global.nosound){
                sound_stop(snd_enemyfire1);
                sound_play(snd_enemyfire1);
                }
            repeat (8*overcharge+1){
                tempid=instance_create(x,y,obj_enemybullet6);
                tempid.speed=bulletspeed;
                tempid.direction=65-tempfrot;
                if (overcharge)
                    tempid.direction=random(360);
                tempid=instance_create(x,y,obj_enemybullet6);
                tempid.speed=bulletspeed;
                tempid.direction=245-tempfrot;
                if (overcharge)
                    tempid.direction=random(360);
                }
            }
        if (!temphit){
            wanty+=1;
            wantx+=accel;
            accel+=0.035;
            if (x>=obj_sabot.x+272){
                wantx=obj_sabot.x+272;
                temphit=1;
                accel=0;
                scr_explo2();
                if (global.shakescreen<10)
                    global.shakescreen=8;
                }
            }
        }
    if (cyc==160){
        scr_pose(6);
        obj_cheersquad.cheer=1;
        }
    if (cyc>=160 && !temphit2){
        wantx-=accel;
        wanty-=accel2;
        accel+=0.041;
        accel2+=0.05;
        if (y<=obj_sabot.y+48){
            temphit2=1;
            wantx=x;
            wanty=obj_sabot.y+48;
            if (global.shakescreen<10)
                global.shakescreen=8;
            scr_explo2();
            scr_pose(35);
            }
        }
    if (cyc==260){
        scr_pose(1);
        wantx=obj_sabot.x+160;
        wanty=obj_sabot.y+64;
        temphit=0;
        temphit2=0;
        accel=0;
        accel2=0;
        attacking=0;
        cyc=0;
        }
    }
//----------------------------------
//3: Double dark blaster
//----------------------------------
if (pattern==3){
    if (cyc==1){
        obj_boardtext.text="@@@@DOUBLE@DARK@BLASTER@@@@@";
        scr_pose(1);
        }
    if (cyc<80 && cyc mod 10==0){
        wantx=obj_sabot.x+80+random(160);
        while (abs(wantx-x)<32)
            wantx=obj_sabot.x+80+random(160);
        if (!global.nosound)
            sound_play(snd_movewhoosh);
        }
    if (cyc==100){
        scr_pose(7);
        if (mayspeak){
            scr_stopsantavoice();
            if (!global.novoice)
                sound_play(snd_santaattack03);
            }
        }
    if (cyc==110){
        if (!global.nosound){
            sound_stop(snd_enemyfire3);
            sound_play(snd_enemyfire3);
            }
        tempid=instance_create(obj_santahandr.x,obj_santahandr.y,obj_enemybullet7);
        tempid.onfire=1;
        tempid.direction=point_direction(tempid.x,tempid.y,obj_pitch.x,obj_pitch.y);
        tempid.speed=bulletspeed+overcharge*8;
        obj_cheersquad.cheer=2;
        if (overcharge){
            repeat(50){
                tempid=instance_create(x,y,obj_enemybullet6);
                tempid.speed=random(9)+1;
                tempid.direction=random(360);
                }
            }
        }
    if (cyc==130){
        if (!global.nosound){
            sound_stop(snd_enemyfire3);
            sound_play(snd_enemyfire3);
            }
        tempid=instance_create(obj_santahandl.x,obj_santahandl.y,obj_enemybullet7);
        tempid.onfire=1;
        tempid.direction=scr_leadshot(tempid.x,tempid.y,bulletspeed,1,45);
        tempid.speed=bulletspeed+overcharge*8;
        obj_cheersquad.cheer=2;
        if (overcharge){
            repeat(50){
                tempid=instance_create(x,y,obj_enemybullet6);
                tempid.speed=random(9)+1;
                tempid.direction=random(360);
                }
            }
        }    
    if (cyc==150){
        if (!global.nosound){
            sound_stop(snd_enemyfire3);
            sound_play(snd_enemyfire3);
            }
        tempid=instance_create(obj_santahandr.x,obj_santahandr.y,obj_enemybullet7);
        tempid.onfire=1;
        tempid.direction=point_direction(tempid.x,tempid.y,obj_pitch.x,obj_pitch.y)+20;
        tempid.speed=bulletspeed+overcharge*8;
        tempid=instance_create(obj_santahandl.x,obj_santahandl.y,obj_enemybullet7);
        tempid.onfire=1;
        tempid.direction=point_direction(tempid.x,tempid.y,obj_pitch.x,obj_pitch.y)-20;
        tempid.speed=bulletspeed+overcharge*8;
        obj_cheersquad.cheer=2;
        if (overcharge){
            repeat(50){
                tempid=instance_create(x,y,obj_enemybullet6);
                tempid.speed=random(9)+1;
                tempid.direction=random(360);
                }
            }
        }
    if (cyc==170 && global.difficulty>3){
        if (!global.nosound){
            sound_stop(snd_enemyfire3);
            sound_play(snd_enemyfire3);
            }
        tempid=instance_create(obj_santahandr.x,obj_santahandr.y,obj_enemybullet7);
        tempid.onfire=1;
        tempid.direction=point_direction(tempid.x,tempid.y,obj_pitch.x,obj_pitch.y);
        tempid.speed=bulletspeed+overcharge*8;
        tempid=instance_create(obj_santahandl.x,obj_santahandl.y,obj_enemybullet7);
        tempid.onfire=1;
        tempid.direction=point_direction(tempid.x,tempid.y,obj_pitch.x,obj_pitch.y);
        tempid.speed=bulletspeed+overcharge*8;
        obj_cheersquad.cheer=2;
        if (overcharge){
            repeat(50){
                tempid=instance_create(x,y,obj_enemybullet6);
                tempid.speed=random(9)+1;
                tempid.direction=random(360);
                }
            }
        }
    if (cyc==170 && global.difficulty<=3){
        scr_pose(1);
        cyc=0;
        attacking=0;
        }
    if (cyc==190 && global.difficulty>3){
        scr_pose(1);
        cyc=0;
        attacking=0;
        }
    }
//----------------------------------
//4: Death poke storm
//----------------------------------
if (pattern==4){
    repeater=18-global.difficulty*2;
    if (repeater<2)
        repeater=2;
    if (overcharge)
        repeater=1;
    if (cyc==1){
        obj_cheersquad.cheer=1;
        obj_boardtext.text="@@@@@@DEATH@POKE@STORM@@@@@@";
        scr_pose(8);
        if (!global.nosound)
            sound_play(snd_movewhoosh);
        wantx=obj_sabot.x+272;
        angle=340;
        if (mayspeak){
            scr_stopsantavoice();
            if (!global.novoice)
                sound_play(snd_santaattack04);
            }
        if (!global.nosound){
            sound_stop(snd_enemychargesmall);
            sound_play(snd_enemychargesmall);
            }
        }
    if (cyc>=1 && cyc<240){
        tempid=instance_create(obj_santahandr.x-12,obj_santahandr.y+12,obj_bullet4part);
        tempid.direction=random(360);
        tempid.speed=1+random(3);
        }
    if (cyc>=40 && cyc<240){
        angle-=3.14159265;
        btypesound-=1;
        if (angle<=180)
            angle+=160;
        if (cyc mod repeater==0){
            if (btypesound<=0){
                btypesound=8;
                if (!global.nosound){
                    sound_stop(snd_enemyfire1);
                    sound_play(snd_enemyfire1);
                    }
                }
            btype+=1;
            if (btype==4)
                btype=0;
            tempid=instance_create(obj_santahandr.x-12,obj_santahandr.y+12,obj_enemybullet6);
            tempid.speed=3.5;
            tempid.direction=angle;
            if (btype==1)
                tempid.curve=1.5;
            else if (btype==3)
                tempid.curve=-1.5;
            }
        if (cyc mod 50==0){
            if (!global.nosound){
                sound_stop(snd_enemyfire3);
                sound_play(snd_enemyfire3);
                }
            tempid=instance_create(obj_santahandr.x-12,obj_santahandr.y+12,obj_enemybullet7);
            tempid.onfire=1;
            tempid.speed=1;
            tempid.direction=point_direction(tempid.x,tempid.y,obj_pitch.x,obj_pitch.y);
            tempid.gravity=0.1;
            tempid.gravity_direction=tempid.direction;
            }
        }
    if (cyc==240)
        scr_pose(36);
    if (cyc==280){
        scr_pose(1);
        attacking=0;
        btype=0;
        cyc=0;
        angle=0;
        btypesound=0;
        }
    }
//----------------------------------
//5: Giga bomb breaker
//----------------------------------
if (pattern==5){
    if (cyc==1){
        obj_boardtext.text="@@@@@GIGA@BOMB@BREAKER@@@@@@";
        wantx=obj_pitch.x;
        if (wantx<obj_sabot.x+64)
            wantx=obj_sabot.x+64;
        if (wantx>obj_sabot.x+256)
            wantx=obj_sabot.x+256;
        scr_pose(9);
        if (!global.nosound){
            sound_play(snd_movewhoosh);
            sound_stop(snd_enemychargesmall);
            sound_play(snd_enemychargesmall);
            }
        if (mayspeak){
            scr_stopsantavoice();
            if (!global.novoice)
                sound_play(snd_santaattack05);
            }
        }
    if (cyc<50){
        repeat(2){
            tempid=instance_create(x-32+random(64),y-16+random(64),obj_annihilatorspark);
            tempid.type=floor(random(7));
            tempid.img=8;
            tempid.image_single=img+type*9;
            tempid.santa=1;
            }
        }
    if (cyc==60){
        if (global.shakescreen<10)
            global.shakescreen=8;
        scr_pose(10);
        tempid=instance_create(x,y+16,obj_gigabomb);
        tempid.gravity=global.difficulty*0.09;
        tempid.gravity_direction=point_direction(tempid.x,tempid.y,obj_pitch.x,obj_pitch.y);
        if (!global.nosound){
            sound_stop(snd_enemyfire2);
            sound_play(snd_enemyfire2);
            sound_stop(snd_enemyfire3);
            sound_play(snd_enemyfire3);
            }
        if (overcharge){
            repeat(100){
                tempid=instance_create(x,y,obj_enemybullet6);
                tempid.speed=random(9)+1;
                tempid.direction=random(360);
                }
            }
        }
    if (cyc==80){
        scr_pose(1);
        attacking=0;
        cyc=0;
        }
    }
//----------------------------------
//6: Legendary charge
//----------------------------------
if (pattern==6){
    if (cyc==1){
        obj_cheersquad.cheer=1;
        obj_boardtext.text="@@@@@@LEGENDARY@CHARGE@@@@@@";
        scr_pose(11);
        wantx=obj_sabot.x+160;
        if (!global.nosound)
            sound_play(snd_enemycharge);
        if (mayspeak){
            scr_stopsantavoice();
            if (!global.novoice)
                sound_play(snd_santaattack06);
            }
        }
    if (cyc<120){
        if (global.shakescreen<4)
            global.shakescreen+=2;
        }
    if (cyc<60){
        repeat(3){
            tempid=instance_create(x-128+random(256),y+16-64+random(128),obj_annihilatorspark);
            tempid.type=floor(random(7));
            tempid.img=8;
            tempid.image_single=img+type*9;
            tempid.santa=1;
            }
        }
    if (cyc==80)
        scr_pose(1);
    if (cyc==120)
        scr_pose(12);
    if (cyc==124){
        if (!global.nosound){
            sound_stop(snd_enemyfire1);
            sound_play(snd_enemyfire1);
            }
        tempid=instance_create(obj_santahandr.x,obj_santahandr.y,obj_enemybullet6);
        tempid.speed=1.5;
        tempid.direction=270;
        }
    if (cyc==140)
        scr_pose(1);
    if (cyc==180){
        scr_explo2();
        scr_pose(13);
        angle=140;
        repeater=20-global.difficulty*2;
        if (repeater<4)
            repeater=4;
        if (overcharge)
            repeater=1;
        if (global.shakescreen<12)
            global.shakescreen+=10;
        }
    if (cyc>=184 && cyc<420){
        obj_cheersquad.cheer=1;
        tempid=instance_create(obj_santahandr.x,obj_santahandr.y,obj_laserexplo);
        tempid.speed=random(5);
        tempid.direction=random(360);
        tempid=instance_create(obj_santahandl.x,obj_santahandl.y,obj_laserexplo);
        tempid.speed=random(5);
        tempid.direction=random(360);
        bulletspeedx=4;
        angle+=3.14159265;
        if (angle>=400)
            angle-=260;
        btypesound-=1;
        if (cyc mod repeater==0){
            if (btypesound<=0){
                btypesound=8;
                if (!global.nosound){
                    sound_stop(snd_enemyfire1);
                    sound_play(snd_enemyfire1);
                    }
                }
            tempid=instance_create(obj_santahandr.x,obj_santahandr.y,obj_enemybullet6);
            tempid.speed=bulletspeedx*0.6;
            tempid.direction=angle;
            tempid.curve=1;
            tempid=instance_create(obj_santahandl.x,obj_santahandl.y,obj_enemybullet6);
            tempid.speed=bulletspeedx*0.6;
            tempid.direction=angle;
            tempid.hspeed*=-1;
            tempid.curve=-1;
            }
        if (cyc mod (repeater*4)==0){
            tempid=instance_create(obj_santahandr.x,obj_santahandr.y,obj_enemybullet6);
            tempid.speed=bulletspeedx*0.4;
            tempid.direction=angle;
            tempid=instance_create(obj_santahandr.x,obj_santahandr.y,obj_enemybullet6);
            tempid.speed=bulletspeedx*0.44;
            tempid.direction=angle;
            tempid=instance_create(obj_santahandr.x,obj_santahandr.y,obj_enemybullet6);
            tempid.speed=bulletspeedx*0.48;
            tempid.direction=angle;
            tempid=instance_create(obj_santahandl.x,obj_santahandl.y,obj_enemybullet6);
            tempid.speed=bulletspeedx*0.4;
            tempid.direction=angle;
            tempid.hspeed*=-1;
            tempid=instance_create(obj_santahandl.x,obj_santahandl.y,obj_enemybullet6);
            tempid.speed=bulletspeedx*0.44;
            tempid.direction=angle;
            tempid.hspeed*=-1;
            tempid=instance_create(obj_santahandl.x,obj_santahandl.y,obj_enemybullet6);
            tempid.speed=bulletspeedx*0.48;
            tempid.direction=angle;
            tempid.hspeed*=-1;
            }
        }
    if (cyc==420){
        scr_pose(1);
        attacking=0;
        cyc=0;
        angle=0;
        btypesound=0;
        }
    }
//----------------------------------
//7: Wax on wax off
//----------------------------------
if (pattern==7){
    if (cyc==1){
        obj_boardtext.text="@@@@@@@WAX@ON@WAX@OFF@@@@@@@";
        if (mayspeak){
            scr_stopsantavoice();
            if (!global.novoice)
                sound_play(snd_santaattack07);
            }
        }
    if (cyc==1 || cyc mod 50==0 && cyc<200){
        if (!global.nosound)
            sound_play(snd_movewhoosh);
        scr_pose(14);
        wantx=obj_sabot.x+80+random(160);
        while (abs(wantx-x)<32)
            wantx=obj_sabot.x+80+random(160);
        }
    if ((cyc+25) mod 50==0 && cyc<200){
        obj_cheersquad.cheer=2;
        scr_pose(15);
        repeater=floor(global.difficulty*1);
        if (!global.nosound){
            sound_stop(snd_enemyfire2);
            sound_play(snd_enemyfire2);
            }
        for (i=0;i<repeater;i+=1){
            if (i>0){
                tempid=instance_create(x,y,obj_enemybullet6);
                tempid.speed=bulletspeed*0.4;
                tempid.direction=270+i*25;
                tempid.speedlimit=5;
                tempid.gravity=global.difficulty/(i*18+24);
                tempid.gravity_direction=point_direction(x,y,obj_pitch.x,obj_pitch.y);
                if (i==0)
                    tempid.gravity=global.difficulty/(30);
                }
            tempid=instance_create(x,y,obj_enemybullet6);
            tempid.speed=bulletspeed*0.4;
            tempid.direction=270-i*25;
            tempid.speedlimit=5;
            tempid.gravity=global.difficulty/(i*18+24);
            tempid.gravity_direction=point_direction(x,y,obj_pitch.x,obj_pitch.y);
            if (i==0)
                tempid.gravity=global.difficulty/(30);
            }
        }
    if (cyc==200)
        scr_pose(1);
    if (cyc==220){
        attacking=0;
        cyc=0;
        }
    }
//----------------------------------
//8: Death metal disaster zone
//----------------------------------
if (pattern==8){
    if (cyc==1){
        obj_cheersquad.cheer=1;
        obj_boardtext.text="@DEATH@METAL@DISASTER@ZONE@@";
        scr_pose(16);
        if (!global.nosound)
            sound_play(snd_movewhoosh);
        wantx=obj_sabot.x+144;
        if (mayspeak){
            scr_stopsantavoice();
            if (!global.novoice)
                sound_play(snd_santaattack08);
            }
        }
    if (cyc==20){
        scr_pose(17);
        if (!global.nosound)
            sound_play(snd_movewhoosh);
        wantx=obj_sabot.x+176;
        }
    if (cyc==60){
        scr_pose(18);
        wantx=obj_sabot.x+160;
        repeater=5-global.difficulty/2;
        if (repeater<1)
            repeater=1;
        }
    if (cyc>=60 && cyc<240){
        if (cyc==60 || cyc==100 || cyc==140 || cyc==180 || cyc==220 || cyc==260)
            obj_cheersquad.cheer=4;
        if (global.shakescreen<4)
            global.shakescreen+=2;
        pos1+=3.14159265*3;
        if (pos1>64)
            pos1-=64;
        pos2+=pos1;
        if (pos2>=320)
            pos2-=320;
        if (cyc mod 4==0){
            if (!global.nosound){
                sound_stop(snd_enemyhit);
                sound_play(snd_enemyhit);
                }
            }
        if (cyc mod repeater==0){
            repeat(6*overcharge+1){
                bcyc=1-bcyc;
                tempid=instance_create(obj_sabot.x+pos2,obj_sabot.y+240,obj_enemybullet6);
                tempid.gravity_direction=90;
                if (overcharge)
                    tempid.gravity_direction+=-2+random(4);
                tempid.gravity=0.03;
                if (bcyc==1)
                    tempid.gravity*=2;
                }
            }
        }
    
    if (cyc==240)
        scr_pose(1);
    if (cyc==300){
        attacking=0;
        cyc=0;
        pos1=0;
        pos2=0;
        bcyc=0;
        }
    }
//----------------------------------
//9: Grand slam
//----------------------------------
if (pattern==9){
    if (cyc==1){
        obj_cheersquad.cheer=1;
        obj_boardtext.text="@@@@@@@@@GRAND@SLAM@@@@@@@@@";
        scr_pose(19);
        wantx=obj_sabot.x+160-64+random(128);
        wanty=obj_sabot.y+80;
        if (!global.nosound)
            sound_play(snd_movewhoosh);
        }
    if (cyc==20){
        scr_pose(20);
        if (!global.nosound)
            sound_play(snd_movewhoosh);
        }
    if (cyc==40){
        if (!global.nosound)
            sound_play(snd_movewhoosh);
        scr_pose(21);
        if (mayspeak){
            scr_stopsantavoice();
            if (!global.novoice)
                sound_play(snd_santaattack09);
            }
        }
    if (cyc==70){
        if (!global.nosound)
            sound_play(snd_movewhoosh);
        scr_pose(22);
        }
    if (cyc==74){
        obj_cheersquad.cheer=2;
        scr_explo2();
        if (!global.nosound){
            sound_stop(snd_enemyfire2);
            sound_play(snd_enemyfire2);
            }
        global.shakescreen=20;
        massive=11;
        repeater=(massive*5)-(global.difficulty*(massive/2));
        if (repeater<massive)
            repeater=massive;
        if (overcharge)
            repeater=2;
        for (i=0;i<360;i+=repeater){
            tempid=instance_create(obj_santahandr.x,obj_santahandr.y,obj_enemybullet6);
            tempid.gravity=0.02;
            tempid.gravity_direction=i;
            if (overcharge)
                tempid.gravity=random(0.1)+0.02;
            tempid=instance_create(obj_santahandl.x,obj_santahandl.y,obj_enemybullet6);
            tempid.gravity=0.02;
            tempid.gravity_direction=i;
            if (overcharge)
                tempid.gravity=random(0.1)+0.02;
            tempid=instance_create(obj_santahandr.x,obj_santahandr.y,obj_enemybullet6);
            tempid.gravity=0.018;
            tempid.gravity_direction=i;
            if (overcharge)
                tempid.gravity=random(0.1)+0.02;
            tempid=instance_create(obj_santahandl.x,obj_santahandl.y,obj_enemybullet6);
            tempid.gravity=0.018;
            tempid.gravity_direction=i;
            if (overcharge)
                tempid.gravity=random(0.1)+0.02;
            }
        }
    if (cyc==160){
        scr_pose(1);
        wanty=obj_sabot.y+64;
        }
    if (cyc==180){
        attacking=0;
        cyc=0;
        }
    }
//----------------------------------
//10: Pew pew salsa
//----------------------------------
if (pattern==10){
    repeater=70-global.difficulty*5;
    if (repeater<30)
        repeater=30;
    if (cyc==1){
        obj_cheersquad.cheer=1;
        obj_boardtext.text="@@@@@@@PEW@PEW@SALSA@@@@@@@@";
        scr_pose(23);
        if (mayspeak){
            scr_stopsantavoice();
            if (!global.novoice)
                sound_play(snd_santaattack10);
            }
        }
    if (cyc mod repeater==0 && cyc<200){
        if (!global.nosound){
            sound_stop(snd_enemyfire3);
            sound_play(snd_enemyfire3);
            }
        scr_pose(23);
        accelpoint=obj_sabot.x+96+random(128);
        tempid=instance_create(obj_santahandr.x-12,obj_santahandr.y+12,obj_enemybullet4);
        tempid.onfire=1;
        if (obj_pitch.x<obj_santahandr.x-12)
            tempid.direction=point_direction(obj_santahandr.x-12,obj_santahandr.y+12,obj_pitch.x,obj_pitch.y);
        else
            tempid.direction=270;
        tempid=instance_create(obj_santahandr.x-12,obj_santahandr.y+12,obj_enemybullet6);
        tempid.speed=1.5+global.difficulty*0.1;
        tempid.direction=225;
        tempid=instance_create(obj_santahandr.x-12,obj_santahandr.y+12,obj_enemybullet6);
        tempid.speed=1.5+global.difficulty*0.1;
        tempid.direction=270;
        if (overcharge){
            repeat(5){
                tempid=instance_create(x,y,obj_enemybullet6);
                tempid.speed=random(9)+1;
                tempid.direction=random(360);
                }
            }
        }
    if ((cyc+floor(repeater/2)) mod repeater==0 && cyc<200){
        if (!global.nosound){
            sound_stop(snd_enemyfire3);
            sound_play(snd_enemyfire3);
            }
        scr_pose(24);
        tempid=instance_create(obj_santahandl.x+12,obj_santahandl.y+12,obj_enemybullet4);
        tempid.onfire=1;
        if (obj_pitch.x>obj_santahandl.x+12)
            tempid.direction=point_direction(obj_santahandl.x-12,obj_santahandl.y+12,obj_pitch.x,obj_pitch.y);
        else
            tempid.direction=270;
        tempid=instance_create(obj_santahandl.x+12,obj_santahandl.y+12,obj_enemybullet6);
        tempid.speed=1.5+global.difficulty*0.1;
        tempid.direction=315;
        tempid=instance_create(obj_santahandl.x+12,obj_santahandl.y+12,obj_enemybullet6);
        tempid.speed=1.5+global.difficulty*0.1;
        tempid.direction=270;
        if (overcharge){
            repeat(10){
                tempid=instance_create(x,y,obj_enemybullet6);
                tempid.speed=random(9)+1;
                tempid.direction=random(360);
                }
            }
        }
    if (cyc<200){
        if (x<accelpoint)
            accel+=0.3;
        else
            accel-=0.3;
        if (accel>5)
            accel=5;
        if (accel<-5)
            accel=-5;
        wantx+=accel;
        if (wantx<obj_sabot.x+96){
            accel=abs(accel);
            wantx=obj_sabot.x+96;
            }
        if (wantx>obj_sabot.x+224){
            accel=-(abs(accel));
            wantx=obj_sabot.x+224;
            }
        }
    if (cyc==200)
        scr_pose(1);
    if (cyc==220){
        attacking=0;
        cyc=0;
        accel=0;
        }
    }
//----------------------------------
//11: Flattening punishment
//----------------------------------
if (pattern==11){
    if (cyc==1){
        lockflat=1;
        obj_cheersquad.cheer=1;
        obj_boardtext.text="@@@FLATTENING@PUNISHMENT@@@@";
        scr_pose(37);
        if (mayspeak){
            scr_stopsantavoice();
            if (!global.novoice)
                sound_play(snd_santaattack11);
            }
        }
    if (cyc mod 30==0 && cyc<250 && cyc>=40)
        scr_pose(25);
    if ((cyc+15) mod 30==0 && cyc<250 && cyc>=40)
        scr_pose(26);
    if ((cyc+11) mod 30==0 && cyc<250 && cyc>40){
        if (global.shakescreen<6)
            global.shakescreen+=4;
        if (!global.nosound){
            sound_stop(snd_explo3);
            sound_play(snd_explo3);
            }
        }
    if ((cyc+26) mod 30==0 && cyc<250 && cyc>40){
        if (global.shakescreen<6)
            global.shakescreen+=4;
        if (!global.nosound){
            sound_stop(snd_explo3);
            sound_play(snd_explo3);
            }
        }
    if (cyc<250 && cyc>40 && ((cyc mod 8==0 && !overcharge) || (cyc mod 2==0 && overcharge))){
        if (!global.nosound){
            sound_stop(snd_enemyfire1);
            sound_play(snd_enemyfire1);
            }
        tempid=instance_create(x,y,obj_enemybullet6);
        tempid.gravity_direction=angle;
        tempid.gravity=0.05;
        if (overcharge){
            tempid.gravity*=2;
            tempid.direction=random(360);
            }
        tempid=instance_create(x,y,obj_enemybullet6);
        tempid.gravity_direction=angle+180;
        tempid.gravity=0.05;
        if (overcharge){
            tempid.gravity*=2;
            tempid.direction=random(360);
            }
        angle+=22.5;
        }
    if (cyc<250 && cyc>40){
        obj_cheersquad.cheer=1;
        if (!lockflat){
            if (x>obj_pitch.x)
                accel-=0.15;
            else
                accel+=0.15;
            if (accel>2)
                accel=2;
            if (accel<-2)
                accel=-2;
            wantx+=accel;
            if (wantx<obj_sabot.x+48){
                wantx=obj_sabot.x+48;
                accel=abs(accel);
                }
            if (wantx>obj_sabot.x+272){
                wantx=obj_sabot.x+272;
                accel=-abs(accel);
                }
            }
        accel2+=0.15;
        wanty+=accel2;
        if (wanty>obj_sabot.y+160){
            wanty=obj_sabot.y+160;
            accel2=-abs(accel2);
            lockflat=0;
            }
        }
    if (cyc==250)
        scr_pose(1);
    if (cyc>=250 && !temphit){
        accel3+=0.2;
        wanty-=accel3;
        if (wanty<=obj_sabot.y+48){
            wanty=obj_sabot.y+48;
            temphit=1;
            scr_explo2();
            if (global.shakescreen<10)
                global.shakescreen=8;
            wanty=obj_sabot.y+64;
            attacking=0;
            cyc=0;
            accel=0;
            accel2=0;
            accel3=0;
            temphit=0;
            angle=0;
            }
        }
    }
//----------------------------------
//12: Dark wave
//----------------------------------
if (pattern==12){
    if (cyc==1){
        obj_cheersquad.cheer=1;
        obj_boardtext.text="@@@@@@@@@DARK@WAVE@@@@@@@@@@";
        scr_pose(27);
        if (!global.nosound)
            sound_play(snd_movewhoosh);
        if (mayspeak){
            scr_stopsantavoice();
            if (!global.novoice)
                sound_play(snd_santaattack12);
            }
        }
    if (cyc>20 && cyc<200){
        if (dirx==0){
            wantx+=5;
            if (wantx>=obj_sabot.x+288)
                dirx=1;
            }
        else if (dirx==1){
            wantx-=5;
            if (wantx<=obj_sabot.x+32)
                dirx=0;
            }
        cyc2+=1;
        if (cyc2>=15)
            cyc2=0;
        if (cyc2 mod 7==0){
            if (!global.nosound){
                sound_stop(snd_enemyfire3);
                sound_play(snd_enemyfire3);
                }
            }
        if (cyc2 mod 3==0 && cyc2<=9){
            tempid=instance_create(obj_santahandl.x,obj_santahandl.y+8,obj_enemybullet7);
            tempid.onfire=1;
            tempid.gravity_direction=270;
            tempid.gravity=0.05;
            tempid.extrapush=1
            if (overcharge){
                tempid.gravity_direction=225+random(90);
                tempid.gravity+=0.1+random(0.5);
                tempid2=instance_create(obj_santahandl.x,obj_santahandl.y+8,obj_enemybullet7);
                tempid2.onfire=1;
                tempid2.gravity_direction=270;
                tempid2.gravity=0.05;
                tempid2.extrapush=1
                tempid2.gravity_direction=225+random(90);
                tempid2.gravity+=0.1+random(0.5);
                }
            }
        }
    if (cyc==200)
        scr_pose(1);
    if (cyc==220){
        attacking=0;
        cyc=0;
        cyc2=0;
        dirx=0;
        }
    }
//----------------------------------
//14: Arctic thunder
//----------------------------------
if (pattern==14){
    if (cyc==1){
        stopthunder=0;
        lastcyc=0;
        firstthunder=10;
        obj_cheersquad.cheer=1;
        obj_boardtext.text="@@@@@@@ARCTIC@THUNDER@@@@@@@";
        scr_stopsantavoice();
        if (!global.novoice)
            sound_play(snd_santaattack14);
        scr_pose(3);
        firstatpose=0;
        }
    lastcyc+=1;
    if (lastcyc==10 && !stopthunder){
        if (firstatpose==1)
            scr_pose(3);
        else
            firstatpose=1;
        if (!global.nosound)
            sound_play(snd_movewhoosh);
        //MOVE TO A DIAGONAL
        targetx=obj_pitch.x;
        targety=obj_pitch.y;
        tempx=targetx;
        tempy=targety;
        giveup=0;
        thunderprepare=1;
        wantx=obj_sabot.x-32;
        //CHOOSE HAND TO FIRE WITH
        if (targetx>obj_sabot.x+192)
            lefthanded=1;
        else if (targetx<obj_sabot.x+128)
            lefthanded=0;
        else
            lefthanded=floor(random(2));
        //THE FIRING DECISION
        while ((wantx<obj_sabot.x+64 || wantx>obj_sabot.x+256) && giveup<100){
            tempx=targetx;
            tempy=targety;
            giveup+=1;
            temprand=floor(random(2));
            //Always attack from left/right
            if (obj_pitch.x>obj_sabot.x+224)
                temprand=0;
            else if (obj_pitch.x<obj_sabot.x+96)
                temprand=1;
            iter=0;
            while (tempy>y && iter<100){
                iter+=1;
                tempy-=4;
                //Backslash
                if (temprand==0){
                    tempx-=4;
                    if (lefthanded)
                        wantx=tempx;
                    else
                        wantx=tempx+64;
                    thundertype=1;
                    }
                //Slash
                else if (temprand==1){
                    tempx+=4;
                    if (lefthanded)
                        wantx=tempx-64;
                    else
                        wantx=tempx;
                    thundertype=2;
                    }
                }
            if (wantx<obj_sabot.x+64 || wantx>obj_sabot.x+256){
                if (lefthanded)
                    wantx=targetx-32;
                else
                    wantx=targetx+32;
                thundertype=0;
                }
            if (wantx>=obj_sabot.x+64 && wantx<=obj_sabot.x+256 && thundertype>=1)
                giveup=100;
            }
        }
    
    //FIRE
    else if (lastcyc==33+firstthunder && !stopthunder){
        if (lefthanded)
            scr_pose(38);
        else
            scr_pose(4);
        }
    else if (lastcyc==35+firstthunder && !stopthunder){
        firstthunder=0;
        obj_cheersquad.cheer=2;
        thunderprepare=0;
        lastcyc=0;
        scr_explo2();
        instance_create(targetx,targety,obj_hurtexplo);
        instance_create(targetx-4,targety-4,obj_hurtexplo);
        instance_create(targetx-4,targety+4,obj_hurtexplo);
        instance_create(targetx+4,targety-4,obj_hurtexplo);
        instance_create(targetx+4,targety+4,obj_hurtexplo);
        if (global.shakescreen<15)
            global.shakescreen+=10;
        
        if (lefthanded){
            handx=obj_santahandl.x;
            handy=obj_santahandl.y;
            }
        else{
            handx=obj_santahandr.x;
            handy=obj_santahandr.y;
            }
        instance_create(handx,handy,obj_thunderbolt);
        instance_create(handx,handy+8,obj_laserexplo);
        for (i=0;i<4;i+=1){
            tempid=instance_create(handx,handy+8,obj_laserexplo);
            tempid.speed=3;
            tempid.direction=45+i*90;
            }
        repeat(10){
            tempid=instance_create(handx-1,handy-5,obj_bullet4part);
            tempid.direction=random(360);
            tempid.speed=2+random(10);
            }
        
        for (i=0;i<360;i+=20){
            tempid=instance_create(targetx,targety,obj_smoke);
            tempid.direction=i;
            tempid.speed=6;
            tempid.vspeed*=0.6;
            }
        if (!global.nosound){
            sound_stop(snd_explo3);
            sound_play(snd_explo3);
            sound_stop(snd_enemyfire6);
            sound_play(snd_enemyfire6);
            }
        }
    //BULLETS
    repeater+=1;
    if (repeater==30+firstthunder){
        repeater=0;
        if (!global.nosound){
            sound_stop(snd_enemyfire1);
            sound_play(snd_enemyfire1);
            }
        if (overcharge){
            for (i=-4;i<=4;i+=0.25){
                tempid=instance_create(x,y,obj_enemybullet6);
                tempid.vspeed=-1;
                tempid.gravity=0.15;
                tempid.gravity_direction=270;
                tempid.hspeed=i;
                tempid.speedlimit=5;
                }
            }
        for (i=-3;i<=3;i+=1){
            tempid=instance_create(x,y,obj_enemybullet6);
            tempid.vspeed=-1;
            tempid.gravity=0.1;
            tempid.gravity_direction=270;
            tempid.hspeed=i;
            tempid.speedlimit=3;
            }
        }
    //STOP
    if (cyc==360){
        scr_pose(1);
        stopthunder=1;
        lastcyc=0;
        }
    if (cyc==380){
        attacking=0;
        cyc=0;
        lastcyc=0;
        thunderprepare=0;
        thundertype=0;
        lefthanded=0;
        stopthunder=0;
        repeater=0;
        }
    }
//----------------------------------
//15: Deep freeze
//----------------------------------
if (pattern==15){
    if (cyc==1){
        obj_cheersquad.cheer=1;
        obj_boardtext.text="@@@@@@@@DEEP@FREEZE@@@@@@@@@";
        obj_cheersquad.cheer=1;
        scr_pose(9);
        if (!global.nosound)
            sound_play(snd_movewhoosh);
        if (wantx<obj_sabot.x+128)
            wantx=obj_sabot.x+128;
        else if (wantx>obj_sabot.x+192)
            wantx=obj_sabot.x+192;
        sharddist=0;
        shardrot=0;
        sharddepth=-10;
        }
    //CHARGE
    else if (cyc==5){
        if (!global.nosound){
            sound_play(snd_enemychargesmall);
            sound_play(snd_shards);
            }
        }
    if (cyc>=5 && cyc<40){
        sharddepth+=1;
        sharddist+=0.5;
        if (global.shakescreen<3)
            global.shakescreen+=2;
        repeat(2){
            shardrot=random(360);
            tempid=instance_create(x+cos(degtorad(shardrot))*sharddist,y+24-(sin(degtorad(shardrot))*sharddist*0.75),obj_enemybullet8);
            tempid.image_single=floor(random(16));
            tempid.still=1;
            tempid.depth=sharddepth;
            tempid=instance_create(x+cos(degtorad(shardrot))*sharddist,y+24-(sin(degtorad(shardrot))*sharddist*0.75),obj_iceparticle);
            tempid.direction=shardrot;
            tempid.speed=1+random(10);
            }
        }
    if (cyc==40){
        scr_pose(14);
        if (!global.nosound)
            sound_play(snd_movewhoosh);
        scr_stopsantavoice();
        if (!global.novoice)
            sound_play(snd_santaattack15);
        }
    else if (cyc==68){
        scr_pose(15);
        if (!global.nosound)
            sound_play(snd_movewhoosh);
        }
    //FIRE
    else if (cyc==70){
        with (obj_enemybullet8){
            if (still)
                instance_destroy();
            }
        obj_cheersquad.cheer=2;
        global.shakescreen=20;
        instance_create(obj_sabot.x,obj_sabot.y,obj_whiteflash);
        scr_megaicefx(24);
        if (!global.nosound){
            sound_play(snd_hitmoon);
            sound_play(snd_explo3);
            sound_play(snd_icekillbig2);
            }
        shardrot=0;
        shardrot2=0;
        shardsp=0.05;
        shardgrav=0.005;
        repeat(220+overcharge*230){
            shardrot2+=6.73;
            shardrot+=118.85+shardrot2;
            shardsp+=0.05;
            if (shardsp>=1.2)
                shardsp=0.05;
            shardgrav+=0.0002;
            if (shardgrav>0.006){
                tempid=instance_create(x,y+24,obj_enemybullet8);
                tempid.direction=shardrot;
                tempid.speed=shardsp;
                tempid.gravity=shardgrav;
                tempid.vspeed-=1;
                tempid.hspeed*=3;
                }
            }
        repeat(30){
            tempid=instance_create(x,y+24,obj_icegib);
            tempid.direction=random(360);
            tempid.speed=5+random(25);
            }
        }
    else if (cyc==100){
        scr_pose(2);
        if (!global.nosound)
            sound_play(snd_movewhoosh);
        }
    else if (cyc==380){
        scr_pose(1);
        if (!global.nosound)
            sound_play(snd_movewhoosh);
        attacking=0;
        cyc=0;
        }
    }
}

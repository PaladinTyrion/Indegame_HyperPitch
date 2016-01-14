//Tied with scr_firekey in Iji for ugliest piece of code ever written

//STATES
// state 0 = Picture 4: Iji parody
// state 1 = Picture 5: Liftoff
// state 2 = Picture 6: Going home
// state 3 = Picture 7: Buster / Galactic buster
// state 4 = Picture 8: Base explosion
// state 5 = Picture 9: Earth
// state 6 = Picture 10: Into the sun
// state 7 = Picture 11: It keeps happening, high five
// state 8 = Cleanup, Results screen
// state 9 = Protips screen
//state 10 = Wait for main menu

//BLACK BACKGROUND
if (state==0 || state==1 || state==2 || state==4){
    for (i=-1;i<16;i+=1){
        draw_sprite(spr_hudbottom,0,x-16,y+i*16);
        draw_sprite(spr_hudbottom,0,x+64,y+i*16);
        draw_sprite(spr_hudbottom,0,x+144,y+i*16);
        draw_sprite(spr_hudbottom,0,x+224,y+i*16);
        draw_sprite(spr_hudbottom,0,x+304,y+i*16);
        }
    }
if (cyc<10000)
    cyc+=1;
//PICTURE 4: IJI PARODY
if (state==0){
    //Init
    if (cyc==1){
        scr_wantsong(10);
        cutxoff=256;
        handy=64;
        handspeed=0;
        handgrav=0;
        eyeimg=0;
        dropmax=36;
        handappear=10;
        }
    if (cutxoff>0)
        cutxoff-=32;
    draw_sprite(spr_cutending,0,x+48+cutxoff,y+64);
    
    //Hand
    if (cyc==80+handappear)
        handgrav=-0.3;
    handy+=handspeed;
    handspeed+=handgrav;
    if (handy+handspeed+handgrav<=0 && handbounce==0){
        handy=0;
        handbounce=1;
        handspeed=2;
        }
    else if (handy+handspeed+handgrav<=0 && handbounce==1){
        handy=0;
        handbounce=2;
        handspeed=0;
        handgrav=0;
        }
    draw_sprite(spr_4hand,0,x+102,y+64-handy);
    
    //Borders and black
    for (i=0;i<4;i+=1){
        draw_sprite(spr_hudbottom,0,x-16,y+i*16);
        draw_sprite(spr_hudbottom,0,x-16,y+i*16);
        draw_sprite(spr_hudbottom,0,x+64,y+i*16);
        draw_sprite(spr_hudbottom,0,x+144,y+i*16);
        draw_sprite(spr_hudbottom,0,x+224,y+i*16);
        draw_sprite(spr_hudbottom,0,x+304,y+i*16);
        }
    for (i=0;i<8;i+=1){
        draw_sprite(spr_cutfilm,1,x+48+i*28+cutxoff,y+48);
        draw_sprite(spr_cutfilm,0,x+48+i*28+cutxoff,y+176);
        }
    
    //Pitch eyes
    if (cyc>=100+handappear && cyc<180+handappear)
        draw_sprite(spr_4eyes,eyeimg,x+68,y+118);
    if (cyc>=180+handappear){
        dropcyc-=1;
        if (dropcyc<=0){
            dropcyc=dropmax;
            if (dropmax>4)
            dropmax-=8;
            }
        if (dropcyc<=2)
            eyeimg=2;
        else
            eyeimg=1;
        draw_sprite(spr_4eyes,eyeimg,x+68,y+118);
        }
    
    //Pitch hat
    if (global.pitchsprite==spr_pitch2)
        draw_sprite(spr_4hats,0,x+53+cutxoff,y+98);
    else if (global.pitchsprite==spr_pitch3)
        draw_sprite(spr_4hats,1,x+53+cutxoff,y+98);
    else if (global.pitchsprite==spr_pitch4)
        draw_sprite(spr_4hats,2,x+53+cutxoff,y+98);
    else if (global.pitchsprite==spr_pitch5)
        draw_sprite(spr_4hats,3,x+53+cutxoff,y+98);
    else if (global.pitchsprite==spr_pitch6)
        draw_sprite(spr_4hats,4,x+53+cutxoff,y+98);
        
    //Next
    if (cyc==360){
        state=1;
        cyc=0;
        }
    }



//PICTURE 5: LIFTOFF
else if (state==1){
    if (cyc==1){
        p5x=158;
        p5y=140;
        p5xspeed=0;
        p5yspeed=0;
        }
    draw_sprite(spr_cutending,1,x+48,y+64);
    
    //Pitch
    if (cyc mod 2==0)
        p5img=1-p5img;
    draw_sprite(spr_5pitch,p5img,x+p5x,y+p5y);
    draw_sprite(spr_5cover,0,x+158,y+107);
    if (cyc==40)
        p5yspeed=-1;
    if (cyc>=80 && p5yspeed<0)
        p5yspeed+=0.05;
    if (cyc>=110 && cyc<=150)
        p5xspeed-=0.12;
    p5x+=p5xspeed;
    p5y+=p5yspeed;
   
    //Borders and black
    for (i=0;i<8;i+=1){
        draw_sprite(spr_cutfilm,1,x+48+i*28+cutxoff,y+48);
        draw_sprite(spr_cutfilm,0,x+48+i*28+cutxoff,y+176);
        }
    for (i=4;i<6;i+=1)
        draw_sprite(spr_hudbottom,0,x-32+cutxoff,y+i*16);
    
    //Next
    if (cyc==200){
        state=2;
        cyc=0;
        }
    }



//PICTURE 6: GOING HOME
else if (state==2){
    for (i=0;i<14;i+=1)
        draw_sprite(spr_cut6,0,x+48+i*16,y+64);
    //Clouds
    if (cyc==1){
        for (i=0;i<3;i+=1){
            cloudx[i]=-128+random(320);
            cloudy[i]=64+random(112);
            cloudimg[i]=floor(random(4));
            expdelay=68;
            bobspeed=6;
            }
        }
    for (i=0;i<3;i+=1){
        if (cyc<120+expdelay)
            cloudx[i]+=8;
        if (cloudx[i]>=320){
            cloudx[i]=-128+random(64);
            cloudy[i]=64+random(112);
            cloudimg[i]=floor(random(4));
            }
        draw_sprite(spr_6cloud,cloudimg[i],x+cloudx[i],y+cloudy[i]);
        }
    
    //Pitch
    p6bcyc+=1;
    if (p6bcyc==2*bobspeed)
        p6b=1;
    if (p6bcyc==3*bobspeed)
        p6b=2;
    if (p6bcyc==5*bobspeed)
        p6b=1;
    if (p6bcyc==6*bobspeed){
        p6b=0;
        p6bcyc=0;
        }
    if (cyc<120+expdelay){
        draw_sprite(spr_6pitch1,0,x+128,y+96+p6b);
        flameimgcyc+=1;
        if (flameimgcyc==2){
            flameimgcyc=0;
            flameimg+=1;
            if (flameimg==3)
                flameimg=0;
            }
        //Pitch hat
        if (global.pitchsprite==spr_pitch2)
            draw_sprite(spr_6hats,0,x+155+cutxoff,y+87+p6b);
        else if (global.pitchsprite==spr_pitch3)
            draw_sprite(spr_6hats,1,x+155+cutxoff,y+87+p6b);
        else if (global.pitchsprite==spr_pitch4)
            draw_sprite(spr_6hats,2,x+155+cutxoff,y+87+p6b);
        else if (global.pitchsprite==spr_pitch5)
            draw_sprite(spr_6hats,3,x+155+cutxoff,y+87+p6b);
        else if (global.pitchsprite==spr_pitch6)
            draw_sprite(spr_6hats,4,x+155+cutxoff,y+87+p6b);
        //Flame
        draw_sprite(spr_6flame,flameimg,x+196,y+123+p6b);
        }
    
    //Explode
    if (cyc==116+expdelay){
        shakescreen=20;
        scr_explo2();
        scr_directsong(0);
        }
    if (cyc>=116+expdelay && cyc<=124+expdelay){
        repeat(3)
            instance_create(x+138-8+floor(random(32)),y+120-16+floor(random(40)),obj_redexplox);
        }
    if (cyc==161+expdelay && !global.nosound)
        sound_play(snd_turrettell);
    if (cyc==230+expdelay && !global.nosound)
        sound_play(snd_bigwhoosh);

    //Further Pitches
    if (cyc>=120+expdelay && cyc<=229+expdelay)
        draw_sprite(spr_6pitch2,0,x+124,y+86);
    else if (cyc==230+expdelay || cyc==231+expdelay)
        draw_sprite(spr_6pitch3,0,x+147,y+98);
    else if (cyc==232+expdelay || cyc==233+expdelay)
        draw_sprite(spr_6pitch4,0,x+145,y+97);
    else if (cyc==234+expdelay || cyc==235+expdelay)
        draw_sprite(spr_6pitch5,0,x+144,y+92);
    else if (cyc==236+expdelay || cyc==237+expdelay)
        draw_sprite(spr_6pitch6,0,x+145,y+90);
    
    //Pitch eyes
    if (cyc==160+expdelay || cyc==161+expdelay || cyc==164+expdelay || cyc==165+expdelay || cyc==206+expdelay || cyc==207+expdelay)
        draw_sprite(spr_6eyes,0,x+157,y+107);
    else if (cyc==208+expdelay)
        draw_sprite(spr_6eyes,1,x+157,y+107);
    else if (cyc>=209+expdelay && cyc<=229+expdelay)
        draw_sprite(spr_6eyes,2,x+157,y+107);
    
    //Cat eyes
    if (cyc>=208+expdelay && cyc<210+expdelay)
        draw_sprite(spr_6ceyes,0,x+129,y+135);
    else if (cyc>=210+expdelay && cyc<230+expdelay)
        draw_sprite(spr_6ceyes,1,x+129,y+135);
    
    //Borders and black
    for (i=0;i<8;i+=1){
        draw_sprite(spr_cutfilm,1,x+48+i*28+cutxoff,y+48);
        draw_sprite(spr_cutfilm,0,x+48+i*28+cutxoff,y+176);
        }
    for (i=3;i<12;i+=1){
        draw_sprite(spr_hudbottom,0,x-32+cutxoff,y+i*16);
        draw_sprite(spr_hudbottom,0,x+272+cutxoff,y+i*16);
        }
        
    //Next
    if (cyc==260+expdelay){
        cyc=0;
        state=3;
        }
    }










//-------------------------------------------------------------------------------------------
//PICTURE 7: BUSTER
else if (state==3){
    if (cyc==1){
        sacyc=0;
        catch=0;
        }
    //GATHERING FORCE
    if (gathering>0){
        gatherr+=5;
        gathering*=0.75;
        for (i=0;i<20;i+=1){
            draw_sprite(spr_iceparticle,4,pitchx+cos(degtorad(gatherr+i*18))*gathering*2,pitchy+2+sin(degtorad(gatherr+i*18))*gathering);
            draw_sprite(spr_iceparticle,0,pitchx+cos(degtorad(gatherr+i*18+9))*gathering*4,pitchy+2+sin(degtorad(gatherr+i*18+9))*gathering*2);
            }
        }
    
    //SMOKE RING
    if (stuck==2 && stuckcyc>=20 && stuckcyc<40){
        smokering+=20;
        for (i=0;i<100;i+=1)
            draw_sprite(spr_vertsmoke,0,pitchx+cos(degtorad(i*3.6))*smokering*2,pitchy+2+sin(degtorad(i*3.6))*smokering);
        }

    //PITCH
    if (cyc==80){
        tempid=instance_create(x+160,y+170,obj_spawnpitch);
        tempid.ending=1;
        pitchx=x+160;
        pitchy=y+170;
        pimg=16;
        }
    if (pitchlanded && !catch){
        pimg2+=1;
        if (pimg2==2){
            pimg2=0;
            pimg+=1;
            if (pimg>=24)
                pimg=16;
            }
        pitchy-=2;
        draw_sprite(global.pitchsprite,pimg,pitchx,pitchy);
        }
    //SANTA
    if (!catch){
        if (scooldown>0)
            scooldown-=1;
        sacyc-=16;
        draw_sprite(spr_santa,2,x+160+cos(degtorad(sacyc-90)),y+100+4);
        draw_sprite(spr_santaelbow,0,x+128+cos(degtorad(sacyc))*2,y+96+4+sin(degtorad(sacyc))*2);
        draw_sprite(spr_santaelbow,0,x+178+cos(degtorad(sacyc))*2,y+100+4+sin(degtorad(sacyc))*2);
        draw_sprite(spr_sweephands,0,x+160+cos(degtorad(sacyc))*4,y+110+4+sin(degtorad(sacyc))*1);
        if ((-sacyc) mod 360 <= 30 && scooldown<=0){
            scooldown=20;
            if (!global.nosound)
                sound_play(snd_snowstep2);
            }
        if ((-sacyc) mod 360 >= 320 || (-sacyc) mod 360 <= 32){
            tempid=(instance_create(x+193,y+130+random(16),obj_smoke));
            tempid.speed=0.5+random(0.8);
            tempid.direction=0;
            tempid.gravity_direction=90;
            tempid.gravity=0.075;
            }
        }
    //PITCH CATCHES SANTA
    if (pitchlanded && pitchy<=y+124 && !catch){
        if (!global.nosound)
            sound_play(snd_movewhoosh);
        catch=1;
        pitchy=y+124;
        spartsx[0]=x+128+cos(degtorad(sacyc))*2;
        spartsy[0]=y+96+sin(degtorad(sacyc))*2;
        spartsx[1]=x+178+cos(degtorad(sacyc))*2;
        spartsy[1]=y+100+sin(degtorad(sacyc))*2;
        spartsx[2]=x+160+cos(degtorad(sacyc))*4-16;
        spartsy[2]=y+110+sin(degtorad(sacyc))*1-13;
        spartsx[3]=x+160+cos(degtorad(sacyc))*4+10;
        spartsy[3]=y+110+sin(degtorad(sacyc))*1+5;
        swantx[0]=pitchx-30;
        swanty[0]=pitchy-20;
        swantx[1]=pitchx+30;
        swanty[1]=pitchy-17;
        swantx[2]=pitchx-40;
        swanty[2]=pitchy-38;
        swantx[3]=pitchx+40;
        swanty[3]=pitchy-34;
        brushx=x+160+cos(degtorad(sacyc))*4+8;
        brushy=y+110+sin(degtorad(sacyc))*1-8;
        brushxspeed=11;
        brushyspeed=-11;
        brushygrav=1.2;
        }
    
    
    
    //PITCH BUSTS SANTA NORMALLY---------------------------------------------------------
    else if (catch && !global.galactic){
        for (i=0;i<4;i+=1){
            spartsx[i]+=ceil((swantx[i]-spartsx[i])/2);
            spartsy[i]+=ceil((swanty[i]-spartsy[i])/2);
            }
        draw_sprite(global.pitchsprite,74,pitchx,pitchy+z);
        if (!finalexploded){
            draw_sprite(spr_santa,3,pitchx,pitchy-24+z);
            draw_sprite(spr_santaelbow,0,spartsx[0],spartsy[0]+z);
            draw_sprite(spr_santaelbow,0,spartsx[1],spartsy[1]+z);
            draw_sprite(spr_santahandright,2,spartsx[2],spartsy[2]+z);
            draw_sprite(spr_santahandleft,2,spartsx[3],spartsy[3]+z);
            }
        if (cyc<172){
            draw_sprite(spr_sweephands,1,brushx,brushy);
            brushx+=brushxspeed;
            brushy+=brushyspeed;
            brushyspeed+=brushygrav;
            }
        
        ccyc+=1;
        if (ccyc==20){
            zspeed=-24;
            if (!global.novoice)
                sound_play(snd_pitchbuster1);
            else if (!global.nosound)
                sound_play(snd_bigwhoosh);
            }
        if (ccyc==44)
            zspeed=24;
        if (ccyc==68){
            scr_stoppitchvoice();
            if (!global.novoice)
                sound_play(snd_pitchbuster2);
            zspeed=0;
            z=0;
            if (!global.nosound)
                sound_play(snd_explo3);
            (instance_create(pitchx,pitchy+6,obj_crackedfloor)).image_single=1;
            shakescreen=40;
            }
        z+=zspeed;
        
        //Final explosion
        if (ccyc==88){
            instance_create(x,y,obj_endingflash);
            finalyoff=-32;
            room_speed=20;
            shakescreen=40;
            //Debris
            repeat(100){
                tempid=instance_create(pitchx-16+random(32),pitchy-12+random(24)+finalyoff,obj_elfgib);
                tempid.type=7;
                tempid.direction=random(360);
                tempid.speed=2+random(6);
                tempid.vspeed*=0.85;
                tempid.zspeed=random(6)+3;
                }
            if (!global.nosound)
                sound_play(snd_nuke);
            scr_mushroom(pitchx,pitchy+finalyoff,0);
            finalexploded=1;
            //instance_create(x,y,obj_stageclear);
            }
        
        //"Awesome"
        if (ccyc==138 && !global.novoice)
            sound_play(snd_pitchcarnage1);
        
        //DONE
        if (ccyc==178)
            okimdone=1;
        }
    
    
    
    //PITCH BUSTS SANTA GALACTICALLY-----------------------------------------------------------
    else if (catch && global.galactic){
        for (i=0;i<4;i+=1){
            spartsx[i]+=ceil((swantx[i]-spartsx[i])/2);
            spartsy[i]+=ceil((swanty[i]-spartsy[i])/2);
            }
        draw_sprite(global.pitchsprite,74,pitchx,floor(pitchy+z));
        //Santa before hitmoon
        if (!finalexploded && stuck==0){
            draw_sprite(spr_santa,3,pitchx,pitchy-24+z);
            draw_sprite(spr_santaelbow,0,spartsx[0],spartsy[0]+z);
            draw_sprite(spr_santaelbow,0,spartsx[1],spartsy[1]+z);
            draw_sprite(spr_santahandright,2,spartsx[2],spartsy[2]+z);
            draw_sprite(spr_santahandleft,2,spartsx[3],spartsy[3]+z);
            }
        //Santa after hitmoon - rigid
        else if (!finalexploded && stuck>=1 && !nosanta){
            draw_sprite(spr_santa,3,pitchx,floor(pitchy-24+z));
            draw_sprite(spr_santaelbow,0,pitchx-30,floor(pitchy-20+z));
            draw_sprite(spr_santaelbow,0,pitchx+30,floor(pitchy-17+z));
            draw_sprite(spr_santahandright,2,pitchx-40,floor(pitchy-38+z));
            draw_sprite(spr_santahandleft,2,pitchx+40,floor(pitchy-34+z));
            }
        if (cyc<172){
            draw_sprite(spr_sweephands,1,brushx,brushy);
            brushx+=brushxspeed;
            brushy+=brushyspeed;
            brushyspeed+=brushygrav;
            }
        
        //JUMP
        ccyc+=1;
        if (ccyc==20){
            moony=-22;
            zspeed=-40;
            if (!global.novoice)
                sound_play(snd_pitchbuster3);
            else if (!global.nosound)
                sound_play(snd_bigwhoosh);
            repeat(30)
                (instance_create(pitchx-16+floor(random(32)),pitchy+z+floor(random(24)),obj_vertsmoke)).vspeed=+(zspeed*0.35)+floor(random(zspeed*0.75));
            }
        
        //FLY UP
        if (ccyc>=20 && stuck==0){
            movecam+=zspeed;
            pupcyc+=1;
            if (pupcyc==2){
                pupcyc=0;
                pitchy-=1;
                for (i=0;i<4;i+=1)
                    swanty[i]-=1;
                }
            }
        
        //HIT MOON
        if (z+zspeed<=-1920 && stuck==0){
            if (!global.nosound)
                sound_play(snd_hitmoon);
            repeat(30)
                instance_create(160-24+floor(random(48)),58,obj_moonpart);
            shakescreen=20;
            stuck=1;
            zspeed=0;
            z=-1920;
            movecam=-1920;
            with (obj_longstar)
                change=1;
            }
        
        //DRAW MOON
        if (!slicemoon){
            draw_sprite(spr_moon,0,60,floor(moony));
            draw_sprite(spr_moon,1,160,floor(moony));
            }
        else if (!mooninvis){
            draw_sprite(spr_moon,0,60-moonx,floor(moony));
            draw_sprite(spr_moon,1,160+moonx,floor(moony));
            }
        
        //MOVE IN Z
        z+=zspeed;
        
        //FALL
        if (stuck==1){
            stuckcyc+=1;
            if (stuckcyc==40){
                scr_stoppitchvoice();
                if (!global.novoice)
                    sound_play(snd_pitchbuster4);
                zspeed=4;
                }
            if (stuckcyc>=40){
                pupcyc+=1;
                if (pupcyc==4){
                    pupcyc=0;
                    pitchy+=1;
                    for (i=0;i<4;i+=1)
                        swanty[i]+=1;
                    }
                zcyc+=1;
                if (zcyc==3){
                    zcyc=0;
                    zspeed+=1;
                    }
                if (stuckcyc==73 && !global.nosound)
                    sound_play(snd_crashingdown);
                }
            moony=pitchy+z-124;
            movecam=z;
            
            //Hit ground
            if (z>=0){
                with (obj_7laser)
                    vspeed=-32;
                movecam=0;
                stuck=2;
                zspeed=0;
                z=0;
                shakescreen=4;
                scr_stoppitchvoice();
                if (!global.novoice)
                    sound_play(snd_pitchbuster5);
                if (!global.nosound)
                    sound_play(snd_explo1a);
                moony=pitchy+z-124;
                stuckcyc=0;
                gathering=240;
                }
            }
        
        //FINAL EXPLOSIONS
        else if (stuck==2){
            stuckcyc+=1;
            if (stuckcyc==18)
                whiteout=2;
            if (stuckcyc==20){
                for (i=0;i<8;i+=1){
                    tempid=instance_create(pitchx-8+floor(random(16)),pitchy-130+i*10,obj_redexplox);
                    tempid.depth=-1000;
                    tempid.nc=1;
                    }
                slicemoon=1;
                gathering=0;
                shakescreen=1000;
                if (!global.nosound)
                    sound_play(snd_explo4);
                with (obj_bustercrash)
                    visible=1;
                with (obj_busterrocks1){
                    visible=1;
                    vspeed=-(random(0.4));
                    }
                //Kick up smoke                    
                for (i=0;i<23;i+=1){
                    repeat(2){
                        tempid=instance_create(pitchx-8+random(16)+i*1.5+10,pitchy-2+random(4)-i*2,obj_vertsmoke);
                        tempid.gravity=0.03+i*0.01;
                        tempid.vspeed=-(i/5+0.5);
                        tempid.hspeed=-(tempid.vspeed/5);
                        tempid=instance_create(pitchx-8+random(16)-i*1.5-10,pitchy-2+random(4)-i*2,obj_vertsmoke);
                        tempid.gravity=0.03+i*0.01;
                        tempid.vspeed=-(i/5+0.5);
                        tempid.hspeed=tempid.vspeed/5;
                        }
                    }
                }
            if (stuckcyc>=20 && stuckcyc<60){
                moonx+=1;
                if (stuckcyc>40 && stuckcyc mod 2 == 0)
                    mooninvis=1;
                else
                    mooninvis=0;
                }
            else if (stuckcyc==60)
                mooninvis=1;
            //Final explosion
            if (stuckcyc==140){
                with (obj_7laser)
                    instance_destroy();
                if (!global.nosound)
                    sound_play(snd_nuke);
                nosanta=1;
                scr_mushroom(pitchx,pitchy-30,0);
                room_speed=20;
                (instance_create(x,y,obj_endingflash)).prolong=12;
                //Debris
                repeat(100){
                    tempid=instance_create(pitchx-16+random(32),pitchy-12+random(24)+finalyoff,obj_elfgib);
                    tempid.type=7;
                    tempid.direction=random(360);
                    tempid.speed=2+random(6);
                    tempid.vspeed*=0.85;
                    tempid.zspeed=random(6)+3;
                    }
                }
            if (stuckcyc>=140){
                with (obj_busterrocks1)
                    speed*=1.3;
                with (obj_redexplox)
                    vspeed-=4;
                with (obj_block){
                    if (sprite_index==spr_elfgib)
                        vspeed-=4;
                    }
                }
            //Done
            if (stuckcyc==190)
                okimdone=2;
            }
        }
    
    //WHITEOUT
    if (whiteout>0){
        whiteout-=1;
        for (i=0;i<10;i+=1){
            for (j=0;j<11;j+=1)
                draw_sprite(spr_coverscreen,0,x+i*32,y+j*24);
            }
        }
    
    //HANDLE STANDARD DONE
    if (okimdone==1){
        state=8;
        }
    
    //HANDLE GALACTIC DONE
    else if (okimdone==2){
        cyc=0;
        y=0;
        instance_create(x,y,obj_endingoverlay);
        room_speed=40;
        shakescreen=0;
        state=4;
        stuck=3;
        stuckcyc=0;
        with (obj_redexplox)
            instance_destroy();
        with (obj_busterrocks1)
            instance_destroy();
        with (obj_block)
            instance_destroy();
        with (obj_longstar)
            instance_destroy();
        with (obj_elfgib)
            instance_destroy();
        //Black fix
        for (i=-1;i<16;i+=1){
            draw_sprite(spr_hudbottom,0,x-16,y+i*16);
            draw_sprite(spr_hudbottom,0,x+64,y+i*16);
            draw_sprite(spr_hudbottom,0,x+144,y+i*16);
            draw_sprite(spr_hudbottom,0,x+224,y+i*16);
            draw_sprite(spr_hudbottom,0,x+304,y+i*16);
            }
        }
    }
//---------------------------------------------------------------------------------------





//PICTURE 8: BASE EXPLOSION (no else here)
if (state==4){
    if (cyc==2){
        with (obj_endingflash)
            instance_destroy();
        }
    if (cyc<20)
        draw_sprite(spr_cutending,1,x+48,y+64);
    else
        draw_sprite(spr_cutending,2,x+48,y+64);
    //Baeaeaem!!!
    if (cyc==20){
        if (!global.nosound)
            sound_play(snd_explo4);
        shakescreen=12;
        whiteout=4;
        }
    //Beam
    if (cyc>=20){
        bimgcyc+=1;
        if (bimgcyc==2){
            bimgcyc=0;
            bimg+=1;
            if (bimg==6)
                bimg=0;
            }
        draw_sprite(spr_8beam,bimg,x+140,y+64);
        }
    //More shake
    if (cyc>=80)
        shakescreen+=2;
    
    //Whiteout
    if (whiteout>0){
        whiteout-=1;
        for (i=0;i<7;i+=1){
            for (j=0;j<4;j+=1)
                draw_sprite(spr_coverscreen,0,x+48+i*32,y+64+j*24);
            draw_sprite(spr_coverscreen,0,x+48+i*32,y+152);
            }
        }
    
    //Next
    if (cyc==120){
        state=5;
        cyc=0;
        shakescreen=0;
        }
    }


//PICTURE 9: EARTH
else if (state==5){
    if (cyc==1){
        with (obj_block)
            instance_destroy();
        with (obj_8line)
            instance_destroy();
        }
    if (cyc>=50){
        earths+=0.1;
        earths*=1.1;
        }
    earthycyc+=earths;
    while (earthycyc>=1){
        earthycyc-=1;
        earthy+=1;
        }
    draw_sprite(spr_9earth,0,160-1+floor(random(2)),120+earthy-1+floor(random(2)));
    //Next
    if (cyc==100){
        state=6;
        cyc=0;
        with (obj_longstar){
            x=48+floor(random(224));
            y=64+floor(random(112));
            }
        }
    }

//PICTURE 10: INTO THE SUN
else if (state==6){
    if (!nosun)
        draw_sprite(spr_10sun,0,160,120);
    if (cyc==10){
        if (!global.nosound)
            sound_play(snd_catstrike);
        }
    
    if (cyc==10)
        draw_sprite(spr_10earth1,0,x,y);
    else if (cyc==11)
        draw_sprite(spr_10earth2,0,x+8,y-8);
    else if (cyc==12)
        draw_sprite(spr_10earth2,0,x+3,y-3);
    else if (cyc==13)
        draw_sprite(spr_10earth2,0,x,y);
    else if (cyc==14)
        draw_sprite(spr_10earth3,0,x+5,y-5);
    else if (cyc==15)
        draw_sprite(spr_10earth3,0,x+2,y-2);
    else if (cyc==16)
        draw_sprite(spr_10earth3,0,x,y);
    else if (cyc==17)
        draw_sprite(spr_10earth4,0,x+3,y-3);
    else if (cyc==18)
        draw_sprite(spr_10earth4,0,x+1,y-1);
    else if (cyc==19)
        draw_sprite(spr_10earth4,0,x,y);
    else if (cyc==20)
        draw_sprite(spr_10earth5,0,x+2,y-2);
    else if (cyc==21)
        draw_sprite(spr_10earth5,0,x+1,y-1);
    else if (cyc==22)
        draw_sprite(spr_10earth5,0,x,y);
    else if (cyc==23)
        draw_sprite(spr_10earth6,0,x+3,y-3);
    else if (cyc==24)
        draw_sprite(spr_10earth6,0,x+2,y-2);
    else if (cyc==25)
        draw_sprite(spr_10earth6,0,x+1,y-1);
    else if (cyc==26)
        draw_sprite(spr_10earth6,0,x,y);
    else if (cyc==27 || cyc==28)
        draw_sprite(spr_10earth7,0,x+1,y-1);
    else if (cyc==29 || cyc==30)
        draw_sprite(spr_10earth7,0,x,y);
    else if (cyc==31 || cyc==32 || cyc==33)
        draw_sprite(spr_10earth8,0,x+1,y-1);
    else if (cyc==34 || cyc==35 || cyc==36)
        draw_sprite(spr_10earth8,0,x,y);
    else if (cyc>=37 && cyc<=50)
        draw_sprite(spr_10earth9,0,x+1,y-1);
    else if (cyc>=51 && cyc<=75)
        draw_sprite(spr_10earth9,0,x,y);
    
    //Explosion
    if (cyc==108 && !global.nosound){
        sound_play(snd_nuke);
        shakescreen=10;
        }
    if (cyc==162 && !global.nosound)
        sound_play(snd_crashingdown);
    if (cyc==110){
        with (obj_longstar){
            speed=random(1)+0.1;
            direction=point_direction(160,120,x,y);
            }
        nosun=1;
        }
    if (cyc==110 || cyc==111 || cyc==114 || cyc==116)
        whiteout=1;
    if (cyc>=111 && cyc<220){
        if (cyc==111){
            circspeed=2.5;
            circacc=-0.6;
            cimg=0;
            }
        else if (cyc==115)
            circacc=-0.024;
        else if (cyc==120)
            circacc=-0.0015;
        else if (cyc==140)
            circacc=0.001;
        else if (cyc==175)
            circacc=0;
        else if (cyc==190)
            circacc=0.1;
        else if (cyc==200){
            circacc=0;
            circspeed=0;
            }
        if (cyc>=190 && cyc<=215){
            if (shakescreen<6)
                shakescreen+=2;
            with (obj_longstar)
                speed*=1.2;
            }
        if (cyc>=190 && cyc mod 3==0)
            cimg-=1;
        circspeed+=circacc;
        circ+=circspeed;
        extrapush+=0.12;
        for (i=8;i>4;i-=1){
            realimg=i+cimg;
            if (realimg<1)
                realimg=1;
            if (realimg>9)
                realimg=9;
            if (realimg<10){
                scr_circle(circ*4*i+i*extrapush,circ*i+i*extrapush,realimg-1,6);
                scr_circle(circ*2*i+i*extrapush,circ*2*i+i*extrapush,realimg-1,6);
                }
            }
        for (i=4;i>0;i-=1){
            realimg=i+cimg;
            if (realimg<1)
                realimg=1;
            if (realimg>9)
                realimg=9;
            if (realimg<10){
                scr_circle(circ*4*i+i*extrapush,circ*i+i*extrapush,realimg-1,12);
                scr_circle(circ*2*i+i*extrapush,circ*2*i+i*extrapush,realimg-1,12);
                }
            }
        draw_sprite(spr_10explode,realimg-1,160,120);
        }
        
    //Whiteout
    if (whiteout>0){
        whiteout-=1;
        for (i=0;i<7;i+=1){
            for (j=0;j<4;j+=1)
                draw_sprite(spr_coverscreen,0,x+48+i*32,y+64+j*24);
            draw_sprite(spr_coverscreen,0,x+48+i*32,y+152);
            }
        }
    
    //Next
    if (cyc==220){
        state=7;
        cyc=0;
        with (obj_longstar)
            instance_destroy();
        }
    }



//PICTURE 11: IT KEEPS HAPPENING
else if (state==7){
    //First explo
    if (cyc==1){
        shakescreen=20;
        if (!global.nosound)
            sound_play(snd_explo4)
        }
    if (!nogalaxy)
        draw_sprite(spr_11galaxy,0,160,120);
    if (cyc<=10 && cyc mod 2 == 0)
        obj_endingflash2.whiteout=1;
    //Final explo
    if (cyc==120){
        nogalaxy=1;
        if (!global.nosound)
            sound_play(snd_nuke);
        ultrashake=1;
        shakescreen=40;
        scaling=5.55; //Vertical size of the explo curve
        expansion=2; //Horizontal explo expansion
        }
    if (cyc>=120 && cyc<500){
        scaling-=0.02;
        expansion+=0.065;
        }
    
    //Final explo lines
    offercyc+=1;
    if (cyc>=320 && offer<6 && offercyc>=4){
        offercyc=0;
        offer+=1; //Offset the color
        }
    if (cyc>120 && offer<6){
        for (limg=7-offer;limg>0;limg-=1){
            for (i=0;i<32;i+=1){
                temp=(i-16)/16;
                draw_sprite(spr_11line2,limg+offer,round(48+(i*8+temp*expansion*limg)-16),round(120+((cos(degtorad(i/32*360))-1)/2)*limg*scaling));
                draw_sprite(spr_11line2,limg+offer,round(48+(i*8+temp*expansion*limg)-16),round(120-((cos(degtorad(i/32*360))-1)/2)*limg*scaling));
                }
            }
        if (offer<6){
            for (i=0;i<16;i+=1)
                draw_sprite(spr_11line,offer,48+i*16,120);
            }
        }
    
    //Shoo, stars
    if (cyc==340){
        with (obj_11star)
            depth+=20;
        }
    //High five
    if (cyc>=350){
        cyc11+=1;
        if (cyc11<57)
            cyc11x+=2;
        else if (cyc11<60)
            cyc11x-=1;
        else if (cyc11<64 && cyc11 mod 2 == 0)
            cyc11x-=1;
        else if (cyc11<80 && cyc11 mod 4 == 0)
            cyc11x-=1;
        draw_sprite(spr_11pitch,0,floor(-13+cyc11x),94);
        draw_sprite(spr_11pitch,1,floor(272-cyc11x),95);
        if (global.pitchsprite==spr_pitch2)
            draw_sprite(spr_11hats,0,floor(4+cyc11x),82);
        else if (global.pitchsprite==spr_pitch3)
            draw_sprite(spr_11hats,1,floor(4+cyc11x),82);
        else if (global.pitchsprite==spr_pitch4)
            draw_sprite(spr_11hats,2,floor(4+cyc11x),82);
        else if (global.pitchsprite==spr_pitch5)
            draw_sprite(spr_11hats,3,floor(4+cyc11x),82);
        else if (global.pitchsprite==spr_pitch6)
            draw_sprite(spr_11hats,4,floor(4+cyc11x),82);
        if (cyc11==57 && !global.nosound)
            sound_play(snd_hifive);
        if (cyc11==57 || cyc11==58)
            draw_sprite(spr_11clap,0,154,104);
        else if (cyc11==59 || cyc11==60)
            draw_sprite(spr_11clap,0,154,103);
        else if (cyc11==61 || cyc11==62)
            draw_sprite(spr_11clap,0,154,102);
        else if (cyc11==63 || cyc11==64)
            draw_sprite(spr_11clap,0,154,101);
        
        //"Awesome"
        else if (cyc11==104 && !global.novoice)
            sound_play(snd_pitchcarnage1);
        if (global.pitchsprite!=spr_pitch6){
            if (cyc11==100 || cyc11==101)
                draw_sprite(spr_11pitcheyes,0,123,105);
            else if (cyc11==102 || cyc11==103)
                draw_sprite(spr_11pitcheyes,1,123,105);
            else if (cyc11==104 || cyc11==105)
                draw_sprite(spr_11pitcheyes,2,123,105);
            else if (cyc11>=106)
                draw_sprite(spr_11pitcheyes,3,123,105);
            }
        }
    
    //Next
    if (cyc==580)
        state=8;

    //Whiteout
    if (cyc>=120 && cyc<=130 && cyc mod 4 == 0)
        obj_endingflash2.whiteout=3;
    }



//CLEANUP, RESULTS SCREEN ----------------------------------------------------------------
else if (state==8){
    if (cyc8<4){
        for (i=0;i<10;i+=1){
            for (j=-1;j<12;j+=1)
                draw_sprite(spr_coverscreen,5,x+i*32,y+j*24);
            }
        }
    //with (obj_resultpart)
    //    draw_sprite(sprite_index,image_single,x,y);
    if (cyc8<40){
        cyc8+=1;
        if (cyc8==1)
            scr_directsong(0);
        if (cyc8==2)
            scr_wantsong(12);
        //Clean up everything
        if (cyc8<4){
            movecam=0;
            room_speed=40;
            instance_deactivate_all(1);
            sound_stop_all();
            shakescreen=0;
            y=0;
            if (global.gmversion==5)
                view_top[0]=0;
            else if (global.gmversion==8)
                view_yview[0]=0;
            }
        //Begin results screen
        if (cyc8==5){
            showresults=1;
            //Create particles
            repeat(30){
                instance_create(floor(random(56)),floor(random(240)),obj_resultpart);
                instance_create(floor(320-random(56)),floor(random(240)),obj_resultpart);
                }
            //Difficulties
            menutext[3]="";
            menutext2[3]="";
            if (global.difficulty==2)
                menutext[3]=global.difname[1];
            else if (global.difficulty==3)
                menutext[3]=global.difname[2];
            else if (global.difficulty==4)
                menutext[3]=global.difname[3];
            else if (global.difficulty==6)
                menutext[3]=global.difname[4];
            else if (global.difficulty==8)
                menutext[3]=global.difname[5];
            else if (global.difficulty==32)
                menutext[3]=global.difname[6];
            //GOLD/purple  ---------0---------0---------0----x
              menutext[0]="";
              menutext[1]="";
              menutext[2]="";
              if (global.cheating)
                  menutext[4]="                 CHEATER           ";
              else
                  menutext[4]="                 "+scr_spaceout(global.points,7)+"           ";
              menutext[5]="";
              menutext[6]="                        "+scr_spaceout(global.stats[0],6)+"     ";
              menutext[7]="                        "+scr_spaceout(global.stats[1],6)+"     ";
              menutext[8]="                        "+scr_spaceout(global.stats[2],6)+"     ";
              menutext[9]="                        "+scr_spaceout(global.stats[3],6)+"     ";
             menutext[10]="                        "+scr_spaceout(global.stats[4],6)+"     ";
             menutext[11]="                        "+scr_spaceout(global.stats[5],6)+"     ";
             menutext[12]="                        "+scr_spaceout(global.stats[6],6)+"     ";
             menutext[13]="                        "+scr_spaceout(global.stats[7],6)+"     ";
             menutext[14]="                     "+scr_spaceout(global.stats[8],6)+"/"+string(32+global.galactic*8)+"     ";
             menutext[15]="";
            //WHITE/blue   ---------0---------0---------0----x
             menutext2[0]="";
             menutext2[1]="";
             menutext2[2]="";
             menutext2[4]="           SCORE:                  ";
             menutext2[5]="";
             menutext2[6]="      ENEMIES DEFEATED:            ";
             menutext2[7]="           SHOTS FIRED:            ";
             menutext2[8]="               PICKUPS:            ";
             menutext2[9]="     BULLETS DEFLECTED:            ";
            menutext2[10]="           PILEDRIVERS:            ";
            menutext2[11]="                THROWS:            ";
            menutext2[12]="          DAMAGE TAKEN:            ";
            menutext2[13]="            LIVES LOST:            ";
            menutext2[14]="       NO DAMAGE ROOMS:            ";
            menutext2[15]="";
            }
        }
    
    //Show results
    if (showresults){
        for (i=0;i<16;i+=1){
            scr_drawtext(160-string_length(menutext[i])*4,i*16,menutext[i],16,40,spr_text2,32);
            scr_drawtext(160-string_length(menutext2[i])*4,i*16,menutext2[i],16,40,spr_text,32);
            }
        //Text
        for (i=6;i>0;i-=1)
            chain[i]=chain[i-1];
        chaincyc+=1;
        if (chaincyc==1) chain[0]=-2;
        else if (chaincyc==2) chain[0]=-2;
        else if (chaincyc==3) chain[0]=-2;
        else if (chaincyc==4) chain[0]=-1;
        else if (chaincyc==5) chain[0]=-1;
        else if (chaincyc==6) chain[0]=0;
        else if (chaincyc==7) chain[0]=1;
        else if (chaincyc==8) chain[0]=1;
        else if (chaincyc==9) chain[0]=2;
        else if (chaincyc==10) chain[0]=2;
        else if (chaincyc==11) chain[0]=2;
        else if (chaincyc==12) chain[0]=1;
        else if (chaincyc==13) chain[0]=1;
        else if (chaincyc==14) chain[0]=0;
        else if (chaincyc==15) chain[0]=-1;
        else if (chaincyc==16){ chain[0]=-1; chaincyc=0;}
        for (i=0;i<6;i+=1)
            draw_sprite(spr_results,i,76+i*24,8+chain[i]);
        draw_sprite(spr_results,2,76+6*24,8+chain[6]);
        }
    
    //Screen cover
    if (screencover<10 && showresults){
        screencover+=1;
        for (i=0;i<10;i+=1){
            for (j=0;j<11;j+=1){
                dscreencover=screencover-1;
                if (dscreencover<0)
                    dscreencover=0;
                if (j mod 2 == 0)
                    draw_sprite(spr_coverscreen,5,x+i*32-dscreencover*40,y+j*24);
                else
                    draw_sprite(spr_coverscreen,5,x+i*32+dscreencover*40,y+j*24);
                }
            }
        }
    }

//PROTIPS --------------------------------------------------------------------------
else if (state==9){
    if (cyc9<4){
        for (i=0;i<10;i+=1){
            for (j=-1;j<12;j+=1)
                draw_sprite(spr_coverscreen,5,x+i*32,y+j*24);
            }
        }
    if (cyc9<2)
        cyc9+=1;
    if (cyc9==1){
        screencover=10;
        //Highest difficulty cleared/protip unlocked - caps at 4
        prevdif=global.highestdiff;
        if (global.difficulty==2)
            global.highestdiff=1;
        else if (global.difficulty==3)
            global.highestdiff=2;
        else if (global.difficulty==4)
            global.highestdiff=3;
        else if (global.difficulty==6)
            global.highestdiff=4;
        else if (global.difficulty==8)
            global.highestdiff=4;
        else if (global.difficulty==32)
            global.highestdiff=4;
        if (global.highestdiff<=prevdif)
            global.highestdiff=prevdif;
        scr_drawprotips();
        if (global.highestdiff>prevdif){
            menutext[0]="!!! NEW PROTIPS UNLOCKED !!!";
            blinkprotip=1;
            }
        scr_save();
        }
    if (blinkprotip){
        blinkcyc+=1;
        if (blinkcyc==16)
            blinkcyc=0;
        if (blinkcyc<=4)
            menutext[0]="";
        else
            menutext[0]="!!! NEW PROTIPS UNLOCKED !!!";
        }
    for (i=0;i<19;i+=1){
        scr_drawtext(160-string_length(menutext[i])*4,i*12+6,menutext[i],16,40,spr_text2,32);
        scr_drawtext(160-string_length(menutext2[i])*4,i*12+6,menutext2[i],16,40,spr_text,32);
        }
    //Done
    if (screencover>=0 && doneprotips){
        if (screencover>0)
            screencover-=1;
        for (i=0;i<10;i+=1){
            for (j=0;j<11;j+=1){
                dscreencover=screencover-1;
                if (dscreencover<0)
                    dscreencover=0;
                if (j mod 2 == 0)
                    draw_sprite(spr_coverscreen,5,x+i*32-dscreencover*40,y+j*24);
                else
                    draw_sprite(spr_coverscreen,5,x+i*32+dscreencover*40,y+j*24);
                }
            }
        }
    if (screencover==0 && doneprotips){
        protipcyc+=1;
        if (protipcyc==1)
            scr_wantsong(0);
        if (protipcyc==42){
            global.latestpoints=global.points;
            scr_restartgame();
            }
        }
    }

scr_showfps(0);

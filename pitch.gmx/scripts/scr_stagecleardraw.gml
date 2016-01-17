//On main menu
if (main && !maininit){
    maininit=1;
    drawend=5;
    global.level=1;
    cyc=1000;
    go=1;
    img=5;
    nextcyc=16;
    }

//Flash
cyc+=1;
if (drawend==0){
    if (cyc<20 && (cyc mod 4==0))
        go=1;
    if (cyc<20 && (cyc mod 4==1))
        go=0;
    if (cyc>=20 && cyc<40){
        go=1;
        obj_sabot.stopcounting=1;
        obj_pitch.speed=0;
        global.ignoreall=1;
        obj_pitch.visible=1;
        if (obj_pitch.image_single!=74 && obj_pitch.image_single!=75)
            obj_pitch.image_single=obj_pitch.lookdir*8;
        sound_stop(snd_icefire);
        sound_stop(snd_icefire2);
        sound_stop(snd_laserfire);
        }

    //Fade
    if (cyc>=40 && cyc<=45)
        img=cyc-40;

    //Fix
    if (cyc==50){
        obj_santa.stopminiexploding=1;
        global.shakescreen=0;
        }
    
    //"Awesome"
    if (cyc==50 && global.level!=4){
        with (obj_laser)
            instance_destroy();
        scr_stoppitchvoice();
        sound_stop(snd_icefire);
        sound_stop(snd_icefire2);
        sound_stop(snd_laserfire);
        if (!global.novoice){
            //if (random(1)<0.5 || global.level==5)
                soonawesome=5;
            //else
            //    sound_play(snd_pitchcarnage3);
            }
        }
    }

//"Awesome"
if (soonawesome>0){
    soonawesome-=1;
    if (soonawesome==0)
        sound_play(snd_pitchcarnage1);
    }

//Start drawing the endlevel stuff
if (cyc==80){
    room_speed=40;
    drawend=1;
    global.shakescreen=20;
    if (!global.nosound)
        sound_play(snd_explo4);
    }
if (cyc==120){
    drawend=2;
    //"Yeah!"
    if (global.level!=4){
        scr_stoppitchvoice();
        if (!global.novoice){
            if (global.level==5 || global.bake[4]==1)
                sound_play(snd_pitchcarnage2);
            else
                sound_play(snd_pitchpickups07);
            }
        else if (!global.nosound)
            sound_play(snd_scorebonus);
        }
    }
if (cyc==160)
    drawend=3;
if (cyc==200)
    drawend=4;

//Draw
yoff=-24;
if (go){
    for (i=0;i<10;i+=1){
        for (j=0;j<11;j+=1)
            draw_sprite(sprite_index,img,x+i*32,y+j*24);
        }
    //STAGE CLEAR!
    if (drawend>=1 && drawend<=4){
        text="!!! STAGE CLEAR !!!";
        scr_drawtext(x+160-string_length(text)*4,y+48+shakeoff+yoff,text,-1,320,spr_text2,32);
        draw_background(bg_stageclear,x,y+80+shakeoff+yoff);
        if (global.pitchsprite!=spr_pitch){
            if (global.pitchsprite==spr_pitch2)
                hatimg=0;
            else if (global.pitchsprite==spr_pitch3)
                hatimg=1;
            else if (global.pitchsprite==spr_pitch4)
                hatimg=2;
            else if (global.pitchsprite==spr_pitch5)
                hatimg=3;
            else if (global.pitchsprite==spr_pitch6)
                hatimg=4;
            draw_sprite(spr_clearhats,hatimg,x,y+80+shakeoff+yoff);
            }
        }
    if (drawend>=2 && drawend<=4){
        //LIVES REMAINING BONUS
        if (global.level==4){
            if (!lifeawarded){
                if (!global.nosound)
                    sound_play(snd_scorebonus);
                lifeawarded=1;
                extrapoints=global.extralives*global.extraworth*global.multiplier;
                global.points+=extrapoints;
                }
            text="LIVES REMAINING * "+string(global.extralives)+" = "+string(extrapoints)+" PTS";
            scr_drawtext(x+160-string_length(text)*4,y+160+shakeoff+yoff,text,-1,320,spr_text2,32);
            }
        //UNLOCK BUSTER
        else if (global.level==5){
            subgalactic+=1;
            if (subgalactic==3){
                subgalactic=0;
                galactic+=1;
                }
            if (galactic==0){
                text="GALACTIC PRINCESS BUSTER LEARNED";
                scr_drawtext(x+160-string_length(text)*4,y+160+shakeoff+yoff,text,-1,320,spr_text,32);
                }
            else if (galactic==1){
                text="galactic princess buster learned";
                scr_drawtext(x+160-string_length(text)*4,y+160+shakeoff+yoff,text,-1,320,spr_text,32);
                }
            else if (galactic==2){
                text="GALACTIC PRINCESS BUSTER LEARNED";
                scr_drawtext(x+160-string_length(text)*4,y+160+shakeoff+yoff,text,-1,320,spr_text2,32);
                }
            else if (galactic==3){
                galactic=0;
                text="galactic princess buster learned";
                scr_drawtext(x+160-string_length(text)*4,y+160+shakeoff+yoff,text,-1,320,spr_text2,32);
                }
            }
        //AWARD EXTRA LIFE
        else{
            if (!lifeawarded && global.extralives<9){
                lifeawarded=1;
                global.extralives+=1;
                }
            text="EXTRA LIFE "+global.pitchchar;
            scr_drawtext(x+160-string_length(text)*4,y+160+shakeoff+yoff,text,-1,320,spr_text,32);
            }
        }
    //NO DAMAGE ROOMS
    if (drawend>=3 && drawend<=4){
        nodmgpoints=global.nodmgrooms*global.nodmgworth*global.multiplier;
        text="NO DAMAGE ROOMS * "+string(global.nodmgrooms)+" = "+string(nodmgpoints)+" PTS";
        scr_drawtext(x+160-string_length(text)*4,y+192+shakeoff+yoff,text,-1,320,spr_text2,32);
        if (!nodmgawarded){
            global.stats[8]+=global.nodmgrooms;
            if (!global.nosound)
                sound_play(snd_scorebonus);
            nodmgawarded=1;
            global.points+=nodmgpoints;
            if (global.points>9999999)
                global.points=9999999;
            }
        }
    //PRESS FIRE TO CONTINUE
    if (drawend==4){
        textcyc+=1;
        if (textcyc==20)
            textcyc=0;
        if (textcyc<15){
            text="press fire to continue";
            scr_drawtext(x+160-string_length(text)*4,y+224+shakeoff+yoff,text,-1,320,spr_text2,32);
            }
        }
    //CONTINUE
    if (drawend==5){
        nextcyc+=1;
        //GO TO ENDING
        if (nextcyc==20 && global.finalbossdead){
            room_goto(rom_ending);
            }
        //NEXT LEVEL
        else if (nextcyc>=20 && !global.finalbossdead){
            if (global.level==5 && obj_sabot.secretlevel)
                text="STAGE X";
            else if (global.galactic)
                text="STAGE 4";
            else
                text="STAGE "+string(global.level);
            if (obj_sabot.secretlevel) text2="SECRET SANTA";
            else if (global.level==1) text2="FRIENDLY FACTORY";
            else if (global.level==2) text2="SPRUCE IT UP";
            else if (global.level==3) text2="NICE LIST CHAOS";
            else if (global.level==4 || global.level==5) text2="HO HO SHOWDOWN";
            shove=25-nextcyc;
            if (shove<0)
                shove=0;
            scr_drawtext(x+160-string_length(text)*4,y+88-shove*32+shakeoff,text,-1,320,spr_text2,32);
            scr_drawtext(x+160-string_length(text2)*4,y+104+shove*32+shakeoff,text2,-1,320,spr_text2,32);
            //WORLD'S SIMPLEST WORLD MAP
            //Connections
            draw_sprite(spr_worldmap,2,x+108,y+138+shove*32+shakeoff);
            draw_sprite(spr_worldmap,2,x+116,y+138+shove*32+shakeoff);
            draw_sprite(spr_worldmap,2,x+124,y+138+shove*32+shakeoff);
            draw_sprite(spr_worldmap,2,x+148,y+138+shove*32+shakeoff);
            draw_sprite(spr_worldmap,2,x+156,y+138+shove*32+shakeoff);
            draw_sprite(spr_worldmap,2,x+164,y+138+shove*32+shakeoff);
            //Dots
            if (global.level>=2)
                draw_sprite(spr_worldmap,0,x+96,y+136+shove*32+shakeoff);
            else
                draw_sprite(spr_worldmap,1,x+96,y+136+shove*32+shakeoff);
            if (global.level>=3)
                draw_sprite(spr_worldmap,0,x+136,y+136+shove*32+shakeoff);
            else
                draw_sprite(spr_worldmap,1,x+136,y+136+shove*32+shakeoff);
            if (global.level>=4)
                draw_sprite(spr_worldmap,0,x+176,y+136+shove*32+shakeoff);
            else
                draw_sprite(spr_worldmap,1,x+176,y+136+shove*32+shakeoff);
            draw_sprite(spr_worldmap,1,x+216,y+136+shove*32+shakeoff);
            //Level 5 connections and dots
            if (global.galactic || obj_sabot.secretlevel){
                if (global.galactic)
                    draw_sprite(spr_worldmap,0,x+196,y+152+shove*32+shakeoff);
                else
                    draw_sprite(spr_worldmap,1,x+196,y+152+shove*32+shakeoff);
                draw_sprite(spr_worldmap,2,x+178,y+154+shove*32+shakeoff);
                draw_sprite(spr_worldmap,2,x+184,y+154+shove*32+shakeoff);
                draw_sprite(spr_worldmap,2,x+208,y+154+shove*32+shakeoff);
                draw_sprite(spr_worldmap,2,x+214,y+154+shove*32+shakeoff);
                draw_sprite(spr_worldmap,3,x+178,y+148+shove*32+shakeoff);
                draw_sprite(spr_worldmap,3,x+219,y+148+shove*32+shakeoff);
                }
            //Standard route
            else{
                draw_sprite(spr_worldmap,2,x+188,y+138+shove*32+shakeoff);
                draw_sprite(spr_worldmap,2,x+196,y+138+shove*32+shakeoff);
                draw_sprite(spr_worldmap,2,x+204,y+138+shove*32+shakeoff);
                }
            
            //Pitch marker
            pxoff=4;
            pyoff=4;
            if (pmarkimg2==0)
                pmarkimg2=1;
            else{
                pmarkimg2=0;
                pmarkimg+=1;
                }
            if (pmarkimg>=8)
                pmarkimg=0;
            if (global.level==1)
                draw_sprite(global.pitchsprite,pmarkimg,x+96+pxoff,y+128+pyoff+shove*32+shakeoff);
            else if (global.level==2)
                draw_sprite(global.pitchsprite,pmarkimg,x+136+pxoff,y+128+pyoff+shove*32+shakeoff);
            else if (global.level==3)
                draw_sprite(global.pitchsprite,pmarkimg,x+176+pxoff,y+128+pyoff+shove*32+shakeoff);
            else if (global.level==4)
                draw_sprite(global.pitchsprite,pmarkimg,x+216+pxoff,y+128+pyoff+shove*32+shakeoff);
            else if (global.level==5)
                draw_sprite(global.pitchsprite,pmarkimg,x+196+pxoff,y+144+pyoff+shove*32+shakeoff);
            }
        
        if (nextcyc==25){
            global.shakescreen=8;
            if (!global.nosound)
                sound_play(snd_explo3);
            }
        if (nextcyc==45){
            if (global.level>1){
                scr_pitchtaunt();
                global.startweapon=obj_pitch.weapon;
                }
            }
        }
    if (nextcyc==105){
        if (obj_sabot.secretlevel)
            room_goto(rom_stage5);
        else if (room==rom_stage3 || room==rom_stage5)
            room_goto(rom_stage4);
        else if (room==rom_stage2)
            room_goto(rom_stage3);
        else if (room==rom_stage1)
            room_goto(rom_stage2);
        else
            room_goto(rom_stage1);
        }
    }

scr_showfps(1);

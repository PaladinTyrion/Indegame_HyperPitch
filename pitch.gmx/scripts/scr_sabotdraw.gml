//Pitch damage
//Damage
if ((obj_pitch.pain mod 4==0 || obj_pitch.pain mod 4==1) && !obj_pitch.piledriving && obj_pitch.pain>0 && obj_pitch.altpain==0 && instance_number(obj_goddessbuster)==0)
    draw_sprite(spr_damage,0,obj_pitch.x,obj_pitch.y);

//Draw Paused
if (paused){
    //BLACK
    for (i=0;i<320;i+=80){
        for (j=64;j<128;j+=16)
            draw_sprite(spr_hudbottom,0,x+i,y+j-3);
        }
    
    //TEXT
    pausetext="GAME PAUSED";
    scr_drawtext(x+160-string_length(pausetext)*4,y+16*4,pausetext,12,320,spr_text2,32);
    pausetext="RESUME";
    scr_drawtext(x+160-string_length(pausetext)*4,y+16*6,pausetext,12,320,spr_text,32);
    pausetext="QUIT";
    scr_drawtext(x+160-string_length(pausetext)*4,y+16*7,pausetext,12,320,spr_text,32);
    
    //CURSOR SPRITE
    cursorimg+=0.5;
    if (cursorimg>=8)
        cursorimg=0;
    cursorsprite=global.pitchsprite;
    draw_sprite(cursorsprite,floor(cursorimg),x+160-34,y+2+16*6+selected*16);
    draw_sprite(cursorsprite,floor(cursorimg),x+160+30,y+2+16*6+selected*16);
    }

if (!paused){
//SNOWFALL
if (snowfall){
    snowxoff-=1;
    snowyoff+=1;
    if (snowxoff<=-64)
        snowxoff+=64;
    if (snowyoff>=0)
        snowyoff-=64;
    snowxoff2-=2;
    snowyoff2+=1;
    if (snowxoff2<=-64)
        snowxoff2+=64;
    if (snowyoff2>=0)
        snowyoff2-=64;
    for (i=0;i<6;i+=1){
        for (j=0;j<5;j+=1){
            draw_sprite(spr_snowfall,0,x+i*64+snowxoff,y-32+j*64+snowyoff);
            draw_sprite(spr_snowfall,0,x+i*64+snowxoff2,y+j*64+snowyoff2);
            }
        }
    }

//HUD
hudimg=0;
if (global.flash>0){
    global.flash-=0.5;
    hudimg=1;
    }
if (global.hurtflash>0){
    global.hurtflash-=0.25;
    hudimg=2;
    }
//End of !paused
}

//HOLDSTRING MESSAGE
if (global.holdscyc>0){
    global.holdscyc-=1;
    if (global.holdscyc>=59) hsmoff=16;
    else if (global.holdscyc==58) hsmoff=12;
    else if (global.holdscyc==57) hsmoff=8;
    else if (global.holdscyc==56) hsmoff=4;
    else if (global.holdscyc<=55 && global.holdscyc>=5) hsmoff=0;
    else if (global.holdscyc==4) hsmoff=4;
    else if (global.holdscyc==3) hsmoff=8;
    else if (global.holdscyc==2) hsmoff=12;
    else if (global.holdscyc<=1) hsmoff=16;
    draw_sprite(spr_hudbottom,hudimg,x+0,208+y+shakeoff+hudoff+hsmoff);
    draw_sprite(spr_hudbottom,hudimg,x+80,208+y+shakeoff+hudoff+hsmoff);
    draw_sprite(spr_hudbottom,hudimg,x+160,208+y+shakeoff+hudoff+hsmoff);
    draw_sprite(spr_hudbottom,hudimg,x+240,208+y+shakeoff+hudoff+hsmoff);
    scr_drawtext(x+160-string_length(global.holdsmsg)*4,211+y+shakeoff+hudoff+hsmoff,global.holdsmsg,-1,320,spr_text2,32,1);
    }

//HUD BACKGROUND
draw_sprite(spr_hudbottom,hudimg,x+0,224+y+shakeoff+hudoff);
draw_sprite(spr_hudbottom,hudimg,x+80,224+y+shakeoff+hudoff);
draw_sprite(spr_hudbottom,hudimg,x+160,224+y+shakeoff+hudoff);
draw_sprite(spr_hudbottom,hudimg,x+240,224+y+shakeoff+hudoff);
if (global.pcornerflash>0){
    global.pcornerflash-=0.5;
    draw_sprite(spr_hudbottom,1,x+240,224+y+shakeoff+hudoff);
    }

//DEMO MODE TEXT
if (global.demomode==1){
    if (!demotextadv){
        demotextadv=1;
        global.demotextcyc+=1;
        if (global.demotextcyc==1)
            demotext="HYPER PRINCESS PITCH - REMAR GAMES 2011";
        else if (global.demotextcyc==2)
            demotext="MUSIC BY NIKLAS STR[M";
        else if (global.demotextcyc==3)
            demotext="4 LEVELS - 68 ROOMS OF ACTION";
        else if (global.demotextcyc==4){
            global.demotextcyc=0;
            demotext="1 SECRET LEVEL - 3 SECRET PICKUPS";
            }
        }
    scr_drawtext(x+160-string_length(demotext)*4,227+y+shakeoff+hudoff,demotext,-1,320,spr_text2,32,1);
    }

//REGULAR HUD
else{
    if (global.cheating)
        scr_drawtext(x+258,2+y+shakeoff-hudoff,"CHEATER",-1,320,spr_text2,32);
    else if (!ignorescore){
        if (!paused){
            //POINTS / SCORE
            if (global.points>9999999)
                global.points=9999999;
            if (!stopcounting){
                repeat(8){
                    if (global.rollpoints<global.points)
                        global.rollpoints+=global.multiplier;
                    }
                }
            if (global.rollpoints>9999999)
                global.rollpoints=9999999;
            pointstring="";
            for (i=6;i>0;i-=1){
                if (global.rollpoints<power(10,i))
                    pointstring+="0";
                }
            pointstring+=string(global.rollpoints);
            //End of !paused
            }
        if (!hiddenroom)
            scr_drawtext(x+258,2+y+shakeoff-hudoff,pointstring,-1,320,spr_text2,32);
        if (!bosspresent){
            if (global.points>global.highscore[0])
                rankstring=" 1ST";
            else if (global.points>global.highscore[1])
                rankstring=" 2ND";
            else if (global.points>global.highscore[2])
                rankstring=" 3RD";
            else if (global.points>global.highscore[3])
                rankstring=" 4TH";
            else if (global.points>global.highscore[4])
                rankstring=" 5TH";
            else if (global.points>global.highscore[5])
                rankstring=" 6TH";
            else if (global.points>global.highscore[6])
                rankstring=" 7TH";
            else if (global.points>global.highscore[7])
                rankstring=" 8TH";
            else if (global.points>global.highscore[8])
                rankstring=" 9TH";
            else if (global.points>global.highscore[9])
                rankstring="10TH";
            else
                rankstring="";
            if (global.points>global.highscore[0] && !hiddenroom)
                scr_drawtext(x+282,16+y+shakeoff-hudoff,rankstring,-1,320,spr_text2,32);
            else if (!hiddenroom)
                scr_drawtext(x+282,16+y+shakeoff-hudoff,rankstring,-1,320,spr_text,32);
            }
        }
    
    //WEAPON
    //Brick
    if (obj_pitch.weapon==1 || (paused && savehudweapon==1)){
        scr_drawtext(x+8,227+y+shakeoff+hudoff,"{| BRICK",-1,320,spr_text,32);
        }
    //Ice
    else if (obj_pitch.weapon==2 || (paused && savehudweapon==2)){
        if (ceil(global.ammo2)<10)
            xoff=8;
        else
            xoff=0;
        scr_drawtext(x+8+xoff,227+y+shakeoff+hudoff,string(ceil(global.ammo2)),-1,320,spr_text2,32);
        scr_drawtext(x+32,227+y+shakeoff+hudoff,"ice",-1,320,spr_text,32,1);
        }
    //Rainbow
    else if (obj_pitch.weapon==3 || (paused && savehudweapon==3)){
        if (ceil(global.ammo3)<10)
            xoff=8;
        else
            xoff=0;
        scr_drawtext(x+8+xoff,227+y+shakeoff+hudoff,string(ceil(global.ammo3)),-1,320,spr_text2,32);
        scr_drawtext(x+32,227+y+shakeoff+hudoff,"rainbow",-1,320,spr_text2,32,1);
        }
    //Gold cannon
    else if ((obj_pitch.weapon==4 && obj_pitch.hyperweapon==0) || (paused && savehudweapon==4 && savehudhyperweapon==0)){
        scr_drawtext(x+8,227+y+shakeoff+hudoff,"{| GOLDBRICK",-1,320,spr_text2,32);
        }
    //Hyper X
    else if ((obj_pitch.weapon==4 && obj_pitch.hyperweapon==1) || (paused && savehudweapon==4 && savehudhyperweapon==1)){
        scr_drawtext(x+8,227+y+shakeoff+hudoff,"{| TEMPEST",-1,320,spr_text2,32);
        }
    //Hyper Y
    else if ((obj_pitch.weapon==4 && obj_pitch.hyperweapon==2) || (paused && savehudweapon==4 && savehudhyperweapon==2)){
        scr_drawtext(x+8,227+y+shakeoff+hudoff,"{| DELUGE",-1,320,spr_text2,32);
        }
    //Hyper Z
    else if ((obj_pitch.weapon==4 && obj_pitch.hyperweapon==3) || (paused && savehudweapon==4 && savehudhyperweapon==3)){
        scr_drawtext(x+8,227+y+shakeoff+hudoff,"{| CYCLONE",-1,320,spr_text2,32);
        }
    
    
    //LIVES AND HEALTH
    scr_drawtext(x+110,227+y+shakeoff+hudoff,string(global.extralives)+global.pitchchar,-1,320,spr_text,32);
    tim+=1;
    if (tim>=8)
        tim=0;
    for (i=0;i<10;i+=1){
        if (i==0){
            draw_sprite(spr_healthbar,24,x+128,227+y+shakeoff+hudoff);
            if (obj_pitch.hp>0 || (paused && savehudhp>0))
                draw_sprite(spr_healthbar,tim,x+128,227+y+shakeoff+hudoff);
            }
        else if (i==9){
            draw_sprite(spr_healthbar,26,x+200,227+y+shakeoff+hudoff);
            if (obj_pitch.hp==10 || (paused && savehudhp==10))
                draw_sprite(spr_healthbar,tim+16,x+200,227+y+shakeoff+hudoff);
            }
        else if (i>0 && i<9){
            draw_sprite(spr_healthbar,25,x+128+i*8,227+y+shakeoff+hudoff);
            if (obj_pitch.hp>i || (paused && savehudhp>i))
                draw_sprite(spr_healthbar,tim+8,x+128+i*8,227+y+shakeoff+hudoff);
            }
        }
    
    //POWERUPS
    if (!paused){
        if (obj_pitch.poweruptime<=3)
            powcyc+=1;
        else
            drawpower=1;
        if (powcyc==8){
            powcyc=0;
            drawpower=1-drawpower;
            if (!drawpower && obj_pitch.powerup>0 && !global.nosound)
                sound_play(snd_powerupfade);
            }
        //End of !paused
        }
    if (drawpower){
        if (obj_pitch.powerup==1 || (paused && savehudpowerup==1))
            scr_drawtext(x+242,227+y+shakeoff+hudoff," TRIPLE  ",-1,320,spr_text2,32);
        else if (obj_pitch.powerup=2 || (paused && savehudpowerup==2))
            scr_drawtext(x+242,227+y+shakeoff+hudoff,"  POWER  ",-1,320,spr_text2,32);
        else if (obj_pitch.powerup=3 || (paused && savehudpowerup==3))
            scr_drawtext(x+242,227+y+shakeoff+hudoff,"CATELLITE",-1,320,spr_text2,32);
        else if (obj_pitch.powerup=4 || (paused && savehudpowerup==4))
            scr_drawtext(x+242,227+y+shakeoff+hudoff,"  SPEED  ",-1,320,spr_text2,32);
        else if ((obj_pitch.powerup=5 && obj_pitch.hyperweapon==0) || (paused && savehudpowerup==5 && savehudhyperweapon==0))
            scr_drawtext(x+242,227+y+shakeoff+hudoff,"  HYPER  ",-1,320,spr_text2,32);
        else if ((obj_pitch.powerup=5 && obj_pitch.hyperweapon==1) || (paused && savehudpowerup==5 && savehudhyperweapon==1))
            scr_drawtext(x+242,227+y+shakeoff+hudoff," HYPER X ",-1,320,spr_text2,32);
        else if ((obj_pitch.powerup=5 && obj_pitch.hyperweapon==2) || (paused && savehudpowerup==5 && savehudhyperweapon==2))
            scr_drawtext(x+242,227+y+shakeoff+hudoff," HYPER Y ",-1,320,spr_text2,32);
        else if ((obj_pitch.powerup=5 && obj_pitch.hyperweapon==3) || (paused && savehudpowerup==5 && savehudhyperweapon==3))
            scr_drawtext(x+242,227+y+shakeoff+hudoff," HYPER Z ",-1,320,spr_text2,32);
        }
    
    //MOVE AWAY HUD DURING DUBS
    if (dub1!=" "){
        if (hudoff<32)
            hudoff+=4;
        }
    else if (hudoff>0 && room!=rom_stage5)
        hudoff-=4;
    
    //DUB TEXT
    if (dub1!=" "){
        duboff=-112;
        draw_sprite(spr_hudbottom,0,x+0,224+y+shakeoff+duboff+duboff2);
        draw_sprite(spr_hudbottom,0,x+80,224+y+shakeoff+duboff+duboff2);
        draw_sprite(spr_hudbottom,0,x+160,224+y+shakeoff+duboff+duboff2);
        draw_sprite(spr_hudbottom,0,x+240,224+y+shakeoff+duboff+duboff2);
        if (dubvoice==0)
            scr_drawtext(x+160-string_length(dub1)*4,227+y+shakeoff+duboff+duboff2,dub1,-1,320,spr_text,32);
        else if (dubvoice==1)
            scr_drawtext(x+160-string_length(dub1)*4,227+y+shakeoff+duboff+duboff2,dub1,-1,320,spr_text2,32);
        }
    if (dub2!=" "){
        duboff=-96;
        draw_sprite(spr_hudbottom,0,x+0,224+y+shakeoff+duboff+duboff2);
        draw_sprite(spr_hudbottom,0,x+80,224+y+shakeoff+duboff+duboff2);
        draw_sprite(spr_hudbottom,0,x+160,224+y+shakeoff+duboff+duboff2);
        draw_sprite(spr_hudbottom,0,x+240,224+y+shakeoff+duboff+duboff2);
        if (dubvoice==0)
            scr_drawtext(x+160-string_length(dub2)*4,227+y+shakeoff+duboff+duboff2,dub2,-1,320,spr_text,32);
        else if (dubvoice==1)
            scr_drawtext(x+160-string_length(dub2)*4,227+y+shakeoff+duboff+duboff2,dub2,-1,320,spr_text2,32);
        }
    
    //BOSS HEALTH BAR
    if (bosspresent && bossbaroff<18)
        bossbaroff+=2;
    if (!bosspresent && bossbaroff>0)
        bossbaroff-=2;
    if (bosstime){
        if (paused){
            bosshpamount=savehudbosshp;
            bossmaxhpamount=savehudbossmaxhp;
            }
        else{
            //bosshpamount=obj_boss.hp;
            //bossmaxhpamount=obj_boss.maxhp;
            bosshpamount=instance_create(0,0,obj_boss).hp;
            bossmaxhpamount=instance_create(0,0,obj_boss).maxhp;
        }
        draw_sprite(spr_hudbottom,hudimg,x+0,-18+y+shakeoff+bossbaroff);
        draw_sprite(spr_hudbottom,hudimg,x+80,-18+y+shakeoff+bossbaroff);
        draw_sprite(spr_hudbottom,hudimg,x+160,-18+y+shakeoff+bossbaroff);
        draw_sprite(spr_hudbottom,hudimg,x+240,-18+y+shakeoff+bossbaroff);
        if ((instance_number(obj_boss)==1 || paused) && bossmaxhpamount>0)
            bosshp=ceil((bosshpamount/bossmaxhpamount)*36);
        else
            bosshp=0;
        //Desperation
        if (desperation){
            for (i=0;i<36;i+=1){
                if (i==0){
                    draw_sprite(spr_healthbar3,24,x+16,-16+y+shakeoff+bossbaroff);
                    if (bosshp>0)
                        draw_sprite(spr_healthbar3,tim,x+16,-16+y+shakeoff+bossbaroff);
                    }
                else if (i==35){
                    draw_sprite(spr_healthbar3,26,x+296,-16+y+shakeoff+bossbaroff);
                    if (bosshp==36)
                        draw_sprite(spr_healthbar3,tim+16,x+296,-16+y+shakeoff+bossbaroff);
                    }
                else if (i>0 && i<35){
                    draw_sprite(spr_healthbar3,25,x+16+i*8,-16+y+shakeoff+bossbaroff);
                    if (bosshp>i)
                        draw_sprite(spr_healthbar3,tim+8,x+16+i*8,-16+y+shakeoff+bossbaroff);
                    }
                }
            }
        //Normal
        else{
            for (i=0;i<36;i+=1){
                if (i==0){
                    draw_sprite(spr_healthbar2,24,x+16,-16+y+shakeoff+bossbaroff);
                    if (bosshp>0)
                        draw_sprite(spr_healthbar2,tim,x+16,-16+y+shakeoff+bossbaroff);
                    }
                else if (i==35){
                    draw_sprite(spr_healthbar2,26,x+296,-16+y+shakeoff+bossbaroff);
                    if (bosshp==36)
                        draw_sprite(spr_healthbar2,tim+16,x+296,-16+y+shakeoff+bossbaroff);
                    }
                else if (i>0 && i<35){
                    draw_sprite(spr_healthbar2,25,x+16+i*8,-16+y+shakeoff+bossbaroff);
                    if (bosshp>i)
                        draw_sprite(spr_healthbar2,tim+8,x+16+i*8,-16+y+shakeoff+bossbaroff);
                    }
                }
            }
        }
    }

//START OF LEVEL
if (levelstart<10){
    levelstart+=1;
    for (i=0;i<10;i+=1){
        for (j=0;j<11;j+=1){
            dlevelstart=levelstart-1;
            if (dlevelstart<0)
                dlevelstart=0;
            if (j mod 2 == 0)
                draw_sprite(spr_coverscreen,5,x+i*32-dlevelstart*40,y+j*24);
            else
                draw_sprite(spr_coverscreen,5,x+i*32+dlevelstart*40,y+j*24);
            }
        }
    }

scr_showfps(1);

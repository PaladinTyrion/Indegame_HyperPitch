//START GAME
if (startgame){
    starting+=1;
    //Skip intro
    if (starting==2 && global.nointro){
        starting=pic4time;
        introtext[0]="";
        introtext[1]="";
        introtext[2]="";
        sound_stop(snd_pitchintro1);
        sound_stop(snd_pitchintro2);
        sound_stop(snd_pitchintro3);
        }
    if (starting==50)
        scr_wantsong(7);
    //Draw the cut sprites
    if (starting<pic4time){
        for (i=0;i<8;i+=1){
            draw_sprite(spr_cutfilm,0,48+i*28+cutxoff,16);
            draw_sprite(spr_cutfilm,0,48+i*28+cutxoff,144);
            draw_sprite(spr_cutfilm,0,368+i*28+cutxoff,16);
            draw_sprite(spr_cutfilm,0,368+i*28+cutxoff,144);
            draw_sprite(spr_cutfilm,0,688+i*28+cutxoff,16);
            draw_sprite(spr_cutfilm,0,688+i*28+cutxoff,144);
            }
        draw_sprite(spr_cutintro,0,48+cutxoff,32);
        draw_sprite(spr_cutintro,1,368+cutxoff,32);
        draw_sprite(spr_cutintro,2,688+cutxoff,32);
        if (global.pitchsprite==spr_pitch2)
            draw_sprite(spr_cuthats,0,688+cutxoff,32);
        else if (global.pitchsprite==spr_pitch3)
            draw_sprite(spr_cuthats,1,688+cutxoff,32);
        else if (global.pitchsprite==spr_pitch4)
            draw_sprite(spr_cuthats,2,688+cutxoff,32);
        else if (global.pitchsprite==spr_pitch5)
            draw_sprite(spr_cuthats,3,688+cutxoff,32);
        else if (global.pitchsprite==spr_pitch6)
            draw_sprite(spr_cuthats,4,688+cutxoff,32);
        }
    
    //Pic 1
    if (starting>=pic1time && starting<pic1time+10)
        cutxoff-=32;
    if (starting==pic1time+10){
        if (!global.novoice)
            sound_play(snd_pitchintro1);
        introtext[0]="THE GOOD MECHA SANTA AND HIS ROBOT";
        introtext[1]="ELVES ARE PLANNING TO SPREAD JOY";
        introtext[2]="AND PRESENTS ALL OVER THE WORLD.";
        }
    //Pic 2
    if (starting==pic2time){
        introtext[0]="";
        introtext[1]="";
        introtext[2]="";
        }
    if (starting>=pic2time && starting<pic2time+10)
        cutxoff-=32;
    if (starting==pic2time+10){
        if (!global.novoice)
            sound_play(snd_pitchintro2);
        introtext[0]="BUT HE SURE DIDN'T GIVE ME ANY";
        introtext[1]="PRESENTS WHEN I WAS A KID! IF I";
        introtext[2]="DON'T GET PRESENTS, NO-ONE SHOULD.";
        }
    //Pic 3
    if (starting==pic3time){
        introtext[0]="";
        introtext[1]="";
        introtext[2]="";
        }
    if (starting>=pic3time && starting<pic3time+10)
        cutxoff-=32;
    if (starting==pic3time+10){
        if (!global.novoice)
            sound_play(snd_pitchintro3);
        introtext[0]="COME ON CATSTRIKE, LET'S TAKE";
        introtext[1]="HIM DOWN BEFORE THE WORLD";
        introtext[2]="BECOMES A HAPPIER PLACE!";
        }
    if (starting==pic4time){
        scr_wantsong(0);
        introtext[0]="";
        introtext[1]="";
        introtext[2]="";
        }
    
    //Text
    for (i=0;i<3;i+=1)
        scr_drawtext(160-string_length(introtext[i])*4,i*16+176,introtext[i],12,40,spr_text,32);
    //Goto first level
    if (starting==pic4time+10)
        (instance_create(0,0,obj_stageclear)).main=1;
    }

//BACKGROUND WALL
if (!startgame && tier!="highscorewait" && tier!="enterhighscore"){
    for (i=0;i<15;i+=1){
        draw_sprite(spr_hudbottom,0,48,i*16);
        draw_sprite(spr_hudbottom,0,108,i*16);
        draw_sprite(spr_hudbottom,0,184,i*16);
        draw_sprite(spr_hudbottom,0,192,i*16);
        }
    }

//HELP SCREENS
if (!startgame && tier="help"){
    
    //SCREEN
    if (helppage==0){
        hcyc+=1;
        if (hcyc==4){
            hcyc=0;
            hcyc2=1-hcyc2;
            }
        draw_sprite(spr_helpscreen,0+hcyc2,0,0);
        draw_sprite(spr_helpscreen,2+hcyc2,160,0);
        }
    
    //PICKUPS
    else if (helppage==1){
        menutext[0]="PICKUPS                    ";
        menutext2[2]="     bonus: 25, 50, 100 OR 200 PTS ";
        menutext2[3]="  life: +2 HEALTH                  ";
        menutext2[4]="  ice: +5 ICE AMMO                 ";
        menutext2[5]="  rainbow: +5 RAINBOW AMMO         ";
        menutext2[6]="  catstrike: CALLS CATSTRIKE       ";
        menutext2[7]="  bowbomb: RAINBOW EXPLOSION       ";
        menutext[9]="TEMPORARY POWERUPS         ";
        menutext2[11]="  triple: TRIPLES SHOTS            ";
        menutext2[12]="  power: POWERS UP YOUR WEAPONS    ";
        menutext2[13]="  catellite: FIRES AND PROTECTS YOU";
        menutext2[14]="  speed: FASTER WALK AND FIRE SPEED";
        menutext2[15]="  hyper: FIRE GOLD BRICKS AND ...? ";
        for (i=0;i<17;i+=1){
            scr_drawtext(160-string_length(menutext[i])*4,i*12+8,menutext[i],12,40,spr_text2,32);
            scr_drawtext(160-string_length(menutext2[i])*4,i*12+8,menutext2[i],12,40,spr_text,32);
            }
        draw_sprite(spr_pickup,0,24,36);
        draw_sprite(spr_pickup,1,32,36);
        draw_sprite(spr_pickup,2,40,36);
        draw_sprite(spr_pickup,3,48,36);
        draw_sprite(spr_pickup,4,24,35+12*1);
        draw_sprite(spr_pickup,5,24,36+12*2);
        draw_sprite(spr_pickup,6,24,37+12*3);
        draw_sprite(spr_pickup,7,24,36+12*4);
        draw_sprite(spr_pickup,8,24,36+12*5);
        draw_sprite(spr_pickup,10,24,37+12*9);
        draw_sprite(spr_pickup,11,24,37+12*10);
        draw_sprite(spr_pickup,12,24,37+12*11);
        draw_sprite(spr_pickup,13,24,37+12*12);
        draw_sprite(spr_pickup,14,24,37+12*13);
        }
    
    //ENEMIES
    else if (helppage==2){
        ecyc+=1;
        if (ecyc==2){
            ecyc=0;
                //Standard animations
            for (i=0;i<15;i+=1)
                ecyc2[i]+=1;
            if (ecyc2[0]==8) ecyc2[0]=0; //Elf
            if (ecyc2[1]==3) ecyc2[1]=0; //Top
            if (ecyc2[2]==4) ecyc2[2]=0; //Snake
            //3 Bulb
            //4 Train (no anim)
            if (ecyc2[5]==8) ecyc2[5]=0; //Terminatorelf
            if (ecyc2[6]==4) ecyc2[6]=0; //Crawler
            if (ecyc2[7]==4) ecyc2[7]=0; //Sleigh
            //8 Wallcannon
            if (ecyc2[9]==4) ecyc2[9]=0; //Elitesleigh
            if (ecyc2[10]==8) ecyc2[10]=0; //Megaturret
            //11 Walker
            //12 Heavy train (no anim)
            //13 Merry doom
            //14 Presentelf
            
                //Special animations
            //Bulb
            if (ecyc2[3]==1){ ecyc3=1;}
            if (ecyc2[3]==2){ ecyc3=2;}
            if (ecyc2[3]==3){ ecyc3=1;}
            if (ecyc2[3]==4){ ecyc3=0; ecyc2[3]=0;}
            //Wallcannon
            if (ecyc2[8]==10){ ecyc4=1;}
            if (ecyc2[8]==12){ ecyc4=0; ecyc2[8]=0;}
            //Walker
            if (ecyc2[11]==9){ ecyc5=2;}
            if (ecyc2[11]>=10){ ecyc5+=1;}
            if (ecyc2[11]==16){ ecyc5=0; ecyc2[11]=0;}
            //Merrydoom
            if (ecyc2[13]>=20){ ecyc6+=1;}
            if (ecyc2[13]==24){ ecyc6=0; ecyc2[13]=0;}
            }
        
        //Draw text
        menutext[0]="ENEMIES";
        menutext2[2]="      12 PTS            250 PTS    ";
        menutext2[3]="      15 PTS                       ";
        menutext2[4]="      25 PTS            320 PTS    ";
        menutext2[5]="      33 PTS                       ";
        menutext2[6]="      20 PTS            350 PTS    ";
        menutext2[7]="      99 PTS                       ";
        menutext2[8]="      150 PTS           400 PTS    ";
        menutext2[9]="      180 PTS           777 PTS    ";
        menutext2[10]="      200 PTS           1000 PTS   ";
        menutext2[11]="miniboss 2000 PTS   boss 5000 PTS  ";
        for (i=0;i<17;i+=1){
            scr_drawtext(160-string_length(menutext[i])*4,i*16+8,menutext[i],12,40,spr_text2,32);
            scr_drawtext(160-string_length(menutext2[i])*4,i*16+8,menutext2[i],12,40,spr_text,32);
            }
        
        //Draw enemies
        draw_sprite(spr_elf,ecyc2[0],55,27+16*1);
        draw_sprite(spr_top,ecyc2[1]*7,55,28+16*2);
        draw_sprite(spr_snake,ecyc2[2],56,30+16*3);
        draw_sprite(spr_bulb,ecyc3*7,55,29+16*4);
        draw_sprite(spr_train,2,56,26+16*5);
        draw_sprite(spr_terminatorelf,ecyc2[5],55,27+16*6);
        draw_sprite(spr_crawler,3-ecyc2[6],55,29+16*7);
            draw_sprite(spr_sleighgun,0,55,25+16*7);
        draw_sprite(spr_sleigh,ecyc2[7]+4,47,28+16*8);
            draw_sprite(spr_sleighgun,0,41,28+16*8);
        draw_sprite(spr_wallcannon,ecyc4,46,20+16*9);
        
        draw_sprite(spr_elitesleigh,ecyc2[9]+4,192,28+16*1);
            draw_sprite(spr_sleighgun,0,186,28+16*1);
        draw_sprite(spr_megaturret,ecyc2[10],198,28+16*3);
        draw_sprite(spr_walker,ecyc5,188,23+16*5);
        draw_sprite(spr_walkertag,0,188,23+16*5);
        draw_sprite(spr_heavytrain,0,174,23+16*7);
            draw_sprite(spr_sleighgun,0,164,18+16*7);
            draw_sprite(spr_sleighgun,0,174,18+16*7);
            draw_sprite(spr_sleighgun,0,184,18+16*7);
        draw_sprite(spr_merrydoom,ecyc6+5,200,28+16*8);
        draw_sprite(spr_presentelf,8,200,30+16*9);
        }
    
    //BIO: PITCH
    else if (helppage>=3 && helppage<=6){
        if (helppage==3){
             menutext[1]="PRINCESS PITCH";
             menutext2[3]="<YEAH? WELL -MY- DAD MINES BEARS.<  ";
             menutext2[5]="          SINCE IGNORING HER DUTIES ";
             menutext2[6]="          AS PRINCESS, PITCH HAS    ";
             menutext2[7]="          BEEN HANGING WITH HER     ";
             menutext2[8]="          FRIENDS IN A LITERAL HOUSE";
             menutext2[9]="ON WHEELS. SHE'S THE SOLE REASON    ";
            menutext2[10]="NO-ONE ENTERED THROUGH THE FRONT    ";
            menutext2[11]="DOOR DURING THE BATTLE OF <GARDEN   ";
            menutext2[12]="GNOME CARNAGE<.                     ";
            }
        else if (helppage==4){
             menutext[1]="CATSTRIKE";
             menutext2[3]="<...<                               ";
             menutext2[5]="          AS PITCH'S TRUSTED ALLY,  ";
             menutext2[6]="          HE CARRIES HER INTO BATTLE";
             menutext2[7]="          AND PERFORMS PRECISION    ";
             menutext2[8]="          STRIKES FROM ABOVE. HE AND";
             menutext2[9]="HIS COUSIN, CAT, NEVER GOT ANY      ";
            menutext2[10]="PRESENTS FROM MECHA SANTA AS KITTENS";
            menutext2[11]="AND KITTENSTRIKES. HE NOW CRAVES    ";
            menutext2[12]="REVENGE.                            ";
            }
        else if (helppage==5){
             menutext[1]="MECHA SANTA";
             menutext2[3]="<PEACE AND LOVE!<                   ";
             menutext2[5]="          MECHA SANTA WANTS TO MAKE ";
             menutext2[6]="          THE WORLD A BETTER PLACE. ";
             menutext2[7]="          THE WALKING TANKS AND     ";
             menutext2[8]="          CANNONS ARE JUST THE ANTI-";
             menutext2[9]="PITCH DEFENSE SYSTEMS. HE'S MASTERED";
            menutext2[10]="FIFTEEN SELF-DEFENSE TECHNIQUES, BUT";
            menutext2[11]="WILL HOLD BACK ON THEM DEPENDING ON ";
            menutext2[12]="PITCH'S SKILL LEVEL.                ";
            }
        else if (helppage==6){
             menutext[1]="GODDESS OF EXPLOSIONS";
             menutext2[3]="<THIS -IS- MY INDOOR VOICE!<        ";
             menutext2[5]="          PITCH'S MOTHER. AS AN     ";
             menutext2[6]="          IMMORTAL, SHE FINDS THE   ";
             menutext2[7]="          WORLD BORING. FORTUNATELY ";
             menutext2[8]="          ONE OF HER SPECIAL POWERS ";
             menutext2[9]="IS MAKING BOXES AND BARRELS         ";
            menutext2[10]="EXPLOSIVE. CURRENTLY RELAXING IN A  ";
            menutext2[11]="SECRET MAGICAL SPRING, SHE CAN GRANT";
            menutext2[12]="PITCH HER MOST POWERFUL MOVE.       ";
            }
        draw_sprite(spr_helpportrait,helppage-3,16,68);
        for (i=0;i<17;i+=1){
            scr_drawtext(160-string_length(menutext[i])*4,i*16-8,menutext[i],16,40,spr_text2,32);
            scr_drawtext(160-string_length(menutext2[i])*4,i*16-8,menutext2[i],16,40,spr_text,32);
            }
        }
    
    //HELPPAGES
    draw_sprite(spr_helppages,0,37,214);
    draw_sprite(spr_helppages,1,160,214);
    picyc+=1;
    if (picyc==2)
        picyc2=1;
    else if (picyc==4)
        picyc2=2;
    else if (picyc==6)
        picyc2=1;
    else if (picyc==8){
        picyc=0;
        picyc2=0;
        }
    draw_sprite(spr_helppage,picyc2,49+helppage*32,213);
    }

//REGULAR MENU
else if (!startgame){
    //text
    if (tier="options"){
        for (i=0;i<17;i+=1){
            scr_drawtext(160-string_length(menutext[i])*4,i*16-12,menutext[i],16,40,spr_text2,32);
            scr_drawtext(160-string_length(menutext2[i])*4,i*16-12,menutext2[i],16,40,spr_text,32);
            }
        }
    else if (tier=="protips"){
        for (i=0;i<19;i+=1){
            scr_drawtext(160-string_length(menutext[i])*4,i*12+6,menutext[i],12,40,spr_text2,32);
            scr_drawtext(160-string_length(menutext2[i])*4,i*12+6,menutext2[i],12,40,spr_text,32);
            }
        }
    else if (tier="highscores"){
        for (i=0;i<17;i+=1){
            scr_drawtext(160-string_length(menutext[i])*4,i*15+8,menutext[i],16,40,spr_text2,32);
            scr_drawtext(160-string_length(menutext2[i])*4,i*15+8,menutext2[i],16,40,spr_text,32);
            }
        }
    else if (tier="credits"){
        for (i=0;i<17;i+=1){
            scr_drawtext(160-string_length(menutext[i])*4,i*16-8,menutext[i],16,40,spr_text2,32);
            scr_drawtext(160-string_length(menutext2[i])*4,i*16-8,menutext2[i],16,40,spr_text,32);
            }
        }
    else{
        for (i=0;i<17;i+=1){
            scr_drawtext(160-string_length(menutext[i])*4,i*16,menutext[i],16,40,spr_text2,32);
            scr_drawtext(160-string_length(menutext2[i])*4,i*16,menutext2[i],16,40,spr_text,32);
            }
        }
    
    //CURSOR SPRITE
    cursorimg+=0.5;
    if (cursorimg>=8)
        cursorimg=0;
    cursorsprite=spr_pitch;
    if (tier=="start" && selected==0)
        cursorsprite=spr_pitch;
    else if (tier=="start" && selected==1)
        cursorsprite=spr_pitch2;
    else if (tier=="start" && selected==2)
        cursorsprite=spr_pitch3;
    else if (tier=="start" && selected==3)
        cursorsprite=spr_pitch4;
    else if (tier=="start" && selected==4)
        cursorsprite=spr_pitch5;
    else if (tier=="start" && selected==5 && global.really)
        cursorsprite=spr_pitch6;
    else if (tier=="goddess")
        cursorsprite=spr_pitch5;
    else if (tier=="really")
        cursorsprite=spr_pitch6;
    if (tier=="options"){
        draw_sprite(cursorsprite,floor(cursorimg),160-10-string_length(menutext[selected+4+cursoroffset])*4,66+selected*16+cursoroffset*16-12);
        draw_sprite(cursorsprite,floor(cursorimg),160+6+string_length(menutext[selected+4+cursoroffset])*4,66+selected*16+cursoroffset*16-12);
        }
    else if (tier!="help" && tier!="highscores" && tier!="protips" && tier!="begin" && tier!="highscorewait" && tier!="enterhighscore" && tier!="highscoredone" && tier!="credits"){
        draw_sprite(cursorsprite,floor(cursorimg),160-10-string_length(menutext[selected+4+cursoroffset])*4,66+selected*16+cursoroffset*16);
        draw_sprite(cursorsprite,floor(cursorimg),160+6+string_length(menutext[selected+4+cursoroffset])*4,66+selected*16+cursoroffset*16);
        }
    
    //LOGO
    if (tier=="main")
        draw_sprite(spr_logo,0,80,16);
    
    }

//HIGHSCOREWAIT
if (tier=="highscorewait"){
    if (hswcyc<60){
        hswcyc+=1;
        if (hswcyc==1 && !global.novoice)
            sound_play(snd_pitchcarnage1);
        if (hswcyc==60){
            scr_wantsong(6);
            tier="enterhighscore";
            ehsx=0;
            ehsy=0;
            }
        }
    if (hswcyc mod 8 == 0)
        hswvis=1-hswvis;
    if (!hswvis){
        scr_drawtext(160-string_length("HIGHSCORE")*4,96,"HIGHSCORE",16,40,spr_text2,32);
        scr_drawtext(160-string_length(hswtext)*4,112,hswtext,16,40,spr_text2,32);
        }
    }

//ENTER HIGHSCORE
if (tier=="enterhighscore"){
    //ENTRY FIELD
    fieldtext=entry[0]+entry[1]+entry[2]+entry[3]+entry[4]+entry[5]+entry[6]+entry[7]+entry[8]+entry[9];
    scr_drawtext(123,35,fieldtext,16,40,spr_text2,32);
    
    //REMINDER
    hsetext1="TYPE WITH THE keyboard AND";
    hsetext2="FINISH BY PRESSING enter,";
    hsetext3="OR PRESS fire TO ENTER LETTERS";
    scr_drawtext(160-string_length(hsetext1)*4,160,hsetext1,16,40,spr_text,32);
    scr_drawtext(160-string_length(hsetext2)*4,176,hsetext2,16,40,spr_text,32);
    scr_drawtext(160-string_length(hsetext3)*4,192,hsetext3,16,40,spr_text,32);
    
    //LETTERS
    for (j=0;j<4;j+=1){
        for (i=0;i<6;i+=1)
            draw_sprite(spr_text2,33+i+j*6,117+i*16,67+j*16);
        }
    //REST
    draw_sprite(spr_text2,57,117,131);
    draw_sprite(spr_text2,58,133,131);
    draw_sprite(spr_text2,63,149,131);
    draw_sprite(spr_text2,62,165,131);
    //END
    draw_sprite(spr_text2,37,181,131);
    draw_sprite(spr_text2,46,189,131);
    draw_sprite(spr_text2,36,197,131);
    //MARKER ARROW
    if (hsm<3)
        draw_sprite(spr_highscoremarker2,hsm,121+markerx*8,19-hsm);
    else
        draw_sprite(spr_highscoremarker2,hsm,121+markerx*8,19-2);
    //MARKER BOX
    if ((ehsx==4 || ehsx==5) && ehsy==4){
        draw_sprite(spr_highscoremarker,hsm*2,176,128);
        draw_sprite(spr_highscoremarker,hsm*2+1,200,128);
        }
    else{
        draw_sprite(spr_highscoremarker,hsm*2,112+ehsx*16,64+ehsy*16);
        draw_sprite(spr_highscoremarker,hsm*2+1,120+ehsx*16,64+ehsy*16);
        }
    hsmcyc+=1;
    if (hsmcyc==2)
        hsm=1;
    else if (hsmcyc==4)
        hsm=2;
    else if (hsmcyc==6)
        hsm=3;
    else if (hsmcyc==8)
        hsm=2;
    else if (hsmcyc==10)
        hsm=1;
    else if (hsmcyc==12){
        hsm=0;
        hsmcyc=0;
        }
    }

//HIGHSCORE DONE
if (tier=="highscoredone"){
    hsdcyc+=1;
    if (hsdcyc<5){
        for (i=0;i<10;i+=1){
            draw_sprite(spr_coverscreen,hsdcyc,x+i*32,y+35);
            draw_sprite(spr_coverscreen,5,x+i*32,y+45);
            draw_sprite(spr_coverscreen,hsdcyc,x+i*32,y+131);
            draw_sprite(spr_coverscreen,5,x+i*32,y+141);
            }
        }
    if (hsdcyc==50){
        tier="highscores";
        background_visible[5]=0;
        ignoreall=0;
        scr_setmaps();
        selected=0;
        }
    }

//FIRST BLACK
if (!firstblack){
    firstblack=1;
    for (i=-1;i<11;i+=1){
        for (j=-1;j<9;j+=1)
            draw_background(bg_black,i*32,j*32);
        }
    }

scr_showfps(0);

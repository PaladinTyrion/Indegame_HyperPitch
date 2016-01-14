//HITFLASH
if (hitflash>0)
    hitflash-=1;

//ORDERS
if (introdone && !dead && (global.extralives>0 || obj_pitch.hp>0)){
    if (!playmusic){
        playmusic=1;
        scr_wantsong(9);
        }
    if (desperation && !lastattack)
        scr_santadesperation();
    else
        scr_santaorders();
    }
//VICTORY
else if (obj_pitch.hp<=0 && global.extralives==0 && hp>0){
    victory+=1;
    if (victory==1){
        scr_pose(1);
        delaygameover=1;
        }
    if (victory==100){
        with (obj_elf){
            instance_destroy();
            tempid=instance_create(x,y,obj_joinelf);
            tempid.vspeed=10;
            tempid.nospawn=1;
            tempid.image_single=31;
            tempid.zspeed=6;
            }
        obj_cheersquad.alarm[0]=1;
        //obj_boardtext.text="@@@@@@MERRY@GAME@OVER@@@@@@@";
        obj_boardtext.text="@@@@AND@A@HAPPY@NEW@YEAR@@@@";
        sound_stop(snd_enemycharge);
        wantx=obj_sabot.x+160;
        wanty=obj_sabot.y+120;
        scr_pose(2);
        scr_stopsantavoice();
        if (!global.novoice){
            if (obj_sabot.desperation)
                sound_play(snd_santalaugh2);
            else
                sound_play(snd_santalaugh);
            }
        }
    }

//DEPTH
depth=300-y+obj_sabot.y;
with (obj_santaparts)
    depth=260-y+obj_sabot.y;
with (obj_santaparts2)
    depth=280-y+obj_sabot.y;

//DEATH
if (hp<=0 && !dead && !nohitsound){
    //DESPERATION
    if (global.difficulty>=8 && !desperation){
        desperation=1;
        obj_sabot.desperation=1;
        scr_stopsantavoice();
        wantx=obj_sabot.x+160;
        wanty=obj_sabot.y+80;
        //obj_boardtext.text="@@@@@@@@NOT@SO@FAST@@@@@@@@@";
        obj_boardtext.text="@@@@@@@@AURORA@FORCE@@@@@@@@";
        if (!global.novoice)
            sound_play(snd_santalaugh);
        fakedead=1;
        obj_cheersquad.cheer=1;
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
    //DEATH
    else{
        if (obj_sabot.desperation){
            if (global.shakescreen<16)
                global.shakescreen=10;
            if (!global.nosound)
                sound_play(snd_laserstart);
            for (i=0;i<360;i+=45){
                for (j=1;j<3;j+=0.1){
                    tempid=instance_create(x,y,obj_santamegapart);
                    tempid.depth=depth+32;
                    tempid.minspeed=j;
                    tempid.speed=j*j*j;
                    tempid.direction=i;
                    }
                }
            }
        global.stats[0]+=1;
        megacharged=0;
        obj_cheersquad.cheer=3;
        obj_boardtext.text="@OH@WELL@@@@@@@@@@@@OH@WELL@";
        obj_sabot.dyingboss=1;
        scr_stopsantavoice();
        if (!global.novoice){
            if (obj_sabot.desperation)
                sound_play(snd_santadeath2);
            else
                sound_play(snd_santadeath);
            }
        dead=1;
        global.points+=points*global.multiplier;
        if (global.showscore){
            tempid=instance_create(x,y-16,obj_scorenumber);
            tempid.points=points*global.multiplier;
            tempid.zgrav/=4;
            tempid.slow=4;
            }
        obj_sabot.bosspresent=0;
        wantx=x;
        wanty=y-16;
        }
    //COMBINED
    with (obj_joinelf){
        vspeed=10;
        nospawn=1;
        image_single=31;
        zspeed=6;
        }
    nohitsound=1;
    sound_stop(snd_enemycharge);
    scr_pose(35);
    with (obj_enemybullet){
        instance_destroy();
        instance_create(x,y,obj_elfexplo);
        }
    with (obj_gigabomb){
        scr_explo2();
        instance_destroy();
        instance_create(x,y,obj_bigexplo);
        }
    with (obj_annihilatorspark)
        instance_destroy();
    hurtpitch=0;
    with (obj_santaparts)
        hurtpitch=0;
    }

//REMOVE ELVES
if (desperation){
    with (obj_elf){
        hp=0;
        killtype=4;
        killdir=90;
        }
    }
//DYING
if (dead){
    with (obj_elf){
        hp=0;
        killtype=4;
        killdir=90;
        }
    if (deadcyc<100)
        deadcyc+=1;
    if (miniexploding && !stopminiexploding)
        instance_create(x-32+random(64),y-32+random(64),obj_redexplox);
    if (deadcyc>=100 && !global.ignoreall && obj_pitch.hp>0 && obj_pitch.pain==0 && !exploded){
        obj_sabot.alarm[3]=20;
        exploded=1;
        miniexploding=1;
        global.finalbossdead=1;
        room_speed=20;
        global.shakescreen=40;
        instance_create(obj_sabot.x,obj_sabot.y,obj_stageclear);
        //Explode
        finalyoff=-32;
        if (!global.nosound)
            sound_play(snd_nuke);
        scr_mushroom(x,y+finalyoff,0);
        }
    }

//INTRO
if (!introdone){
    intro+=1;
    if (intro==40){
        obj_sabot.dubvoice=0;
        obj_sabot.dub1="mecha santa";
        obj_sabot.dub2="I ENVISION A WORLD";
        scr_pose(28);
        if (!global.novoice)
            sound_play(snd_santa1);
        }
    else if (intro==90)
        scr_pose(29);
    else if (intro==130){
        obj_sabot.dub2="OF JOY AND LAUGHTER";
        scr_pose(30);
        }
    else if (intro==180)
        scr_pose(31);
    else if (intro==230){
        obj_sabot.dub2="AND PRESENTS FOR ALL";
        scr_pose(32);
        }
    else if (intro==285)
        scr_pose(33);
    else if (intro==370){
        scr_pose(34);
        obj_sabot.dubvoice=1;
        obj_sabot.dub1="pitch";
        obj_sabot.dub2="I'VE GOT A PRESENT FOR YOU ALRIGHT!";
        if (!global.novoice)
            sound_play(snd_pitchsanta);
        }
    
    else if (intro==460){
        obj_sabot.dub1=" ";
        obj_sabot.dub2=" ";
        introdone=1;
        global.ignoreall=0;
        obj_sabot.bosspresent=1;
        obj_spotlight.visible=0;
        }
    }

//OWN MOVE
if (dead){
    x+=(wantx-x)/40;
    y+=(wanty-y)/40;
    }
else{
    x+=(wantx-x)/4;
    y+=(wanty-y)/4;
    }

//OWN BOB
if (!dead && !fakedead){
    boboff+=0.025;
    if (boboff>=1)
        boboff=0;
    xadj=1*cos(degtorad(boboff*360));
    yadj=1*sin(degtorad(boboff*360));
    }

//MOVE PARTS TOGETHER WITH SELF
with (obj_santaparts){
    wantx+=obj_santa.x-obj_santa.xprev;
    wanty+=obj_santa.y-obj_santa.yprev;
    }
with (obj_santaparts2){
    wantx+=obj_santa.x-obj_santa.xprev;
    wanty+=obj_santa.y-obj_santa.yprev;
    }
xprev=x;
yprev=y;

//CHANGE IMG ON SELF DURING POSING
if (posecyc>0){
    posecyc-=1;
    if (posecyc==3)
        posey=3;
    else if (posecyc==2){
        posey=5;
        img=wantimg;
        }
    else if (posecyc==1)
        posey=3;
    else if (posecyc==0)
        posey=0;
    }

//MOVE PARTS
with (obj_santaparts){
    x+=ceil((wantx-x)/2);
    y+=ceil((wanty-y)/2);
    boboff+=0.025;
    if (boboff>=1)
        boboff=0;
    xadj=1*cos(degtorad(boboff*360));
    yadj=1*sin(degtorad(boboff*360));
    }
with (obj_santaparts2){
    x+=ceil((wantx-x)/2);
    y+=ceil((wanty-y)/2);
    boboff+=0.025;
    if (boboff>=1)
        boboff=0;
    xadj=1*cos(degtorad(boboff*360));
    yadj=1*sin(degtorad(boboff*360));
    }

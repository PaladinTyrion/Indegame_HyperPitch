//ONLY PERFORMED DURING DESPERATION
if (despcycx<15)
    despcycx+=1;
else if (despcyc<1000)
    despcyc+=1;

if (despcyc==32){
    fakedead=0;
    scr_pose(1);
    if (!global.nosound)
        sound_play(snd_movewhoosh);
    global.shakescreen=6;
    scr_explo2();
    }
else if (despcyc==58){
    scr_pose(11);
    if (!global.nosound)
        sound_play(snd_movewhoosh);
    }

else if (despcyc==60){
    if (!global.nosound){
        sound_play(snd_explo3);
        sound_play(snd_enemycharge);
        }
    global.shakescreen=50;
    despanim=1;
    with (obj_santaparts)
        visible=0;
    with (obj_santaparts2)
        visible=0;
    megacharged=1;
    scr_stopsantavoice();
    if (!global.novoice)
        sound_play(snd_santaattack13);
    }
if (despcyc>=60 && despcyc<=110){
    repeat(5){
        tempx=obj_sabot.x+random(320);
        tempy=obj_sabot.y+random(240);
        if (point_distance(tempx,tempy,obj_santa.x,obj_santa.y)>96){
            tempid=instance_create(tempx,tempy,obj_smoke);
            tempid.speed=8;
            tempid.direction=point_direction(tempid.x,tempid.y,obj_santa.x,obj_santa.y);
            }
        }
    }
if (despcyc==120){
    despanim=0;
    global.shakescreen=10;
    scr_pose(1);
    if (!global.nosound)
        sound_play(snd_movewhoosh);
    scr_explo2();
    with (obj_santaparts)
        visible=1;
    with (obj_santaparts2)
        visible=1;
    hurtpitch=2;
    nohitsound=0;
    hp=maxhp/2;
    }
if (despcyc==150){
    scr_pose(7);
    if (!global.nosound)
        sound_play(snd_movewhoosh);
    }
//INCREASE HP
if (despcyc>=62 && despcyc<120)
    hp+=(maxhp/2)/60


//AURORA FORCE
else if (despcyc==166){
    if (!global.nosound)
        sound_play(snd_nuke);
    }
else if (despcyc==170){
    wanty=obj_sabot.y+64;
    obj_cheersquad.cheer=2;
    (instance_create(obj_sabot.x,obj_sabot.y,obj_whiteflash)).alarm[0]=3;
    global.shakescreen=20;
    repeat(30){
        tempid=instance_create(x-60+random(120),y+8+random(96),obj_hurtexplo);
        tempid.vspeed=0.5+random(8);
        tempid.evspeed=tempid.vspeed;
        tempid=instance_create(x-60+random(120),y+8+random(128),obj_smoke);
        if (tempid.x<x)
            tempid.hspeed=-random(16);
        else
            tempid.hspeed=random(16);
        }
    }
if (despcyc>=174 && despcyc<190){
    flattenbeam+=3;
    instance_create(x-60+flattenbeam+random(120-(flattenbeam*2)),y+48+random(80),obj_fire);
    repeat(5){
        tempid=instance_create(x-60+flattenbeam+random(120-(flattenbeam*2)),y+8+random(96),obj_hurtexplo);
        tempid.vspeed=0.5+random(8);
        tempid.evspeed=tempid.vspeed;
        tempid=instance_create(x-60+flattenbeam+random(120-(flattenbeam*2)),y+8+random(96),obj_icegib);
        tempid.direction=270;
        tempid.speed*=2;
        temprand=floor(random(2))
        if (temprand==1)
            tempid.sprite_index=spr_bullet4part;
        tempid=instance_create(x-60+random(120),y+8+random(128),obj_smoke);
        if (tempid.x<x)
            tempid.hspeed=-random(16);
        else
            tempid.hspeed=random(16);
        }
    }
else if (despcyc==195){
    scr_pose(1);
    lastattack=1;
    }

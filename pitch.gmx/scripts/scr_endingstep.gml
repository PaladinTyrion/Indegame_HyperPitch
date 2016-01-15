scr_music();
scr_joy(0);

//GAMEPAD
if (joy[global.joypause])
    event_perform(ev_keypress,vk_escape);
if (joy[global.joyfire])
    event_perform(ev_keypress,vk_control);

//Picture 7 trailbow
if (stuck==1 && cyc>=280 && cyc<=350 && state==3){
    laserforce+=0.25;
    raincyc+=10;
    laserimgc+=1;
    if (laserimgc==3){
        laserimgc=0;
        laserimg+=1;
        if (laserimg==7)
            laserimg=0;
        }
    tempid=instance_create(160+cos(degtorad(raincyc))*8,120+laserforce,obj_7laser);
    tempid.vspeed=-8;
    tempid.hspeed=cos(degtorad(raincyc))*laserforce;
    tempid.img=laserimg;
    tempid.image_single=tempid.img*9;
    
    tempid=instance_create(160+cos(degtorad(raincyc+180))*8,120+laserforce,obj_7laser);
    tempid.vspeed=-8;
    tempid.hspeed=cos(degtorad(raincyc+180))*laserforce;
    tempid.img=laserimg;
    tempid.image_single=tempid.img*9;
    tempid.depth=2;
    }

//Picture 7 cracked floor
if (stuck==1 && z+zspeed+zspeed+1>=0 && state==3){
    tempid=instance_create(pitchx,pitchy+6,obj_crackedfloor);
    tempid.image_single=1;
    tempid.visible=0;
    tempid.alarm[0]=1;
    }

//Picture 7 buster smoke
if (ccyc==68 && !global.galactic && state==3){
    for (i=0;i<30;i+=1){
        tempid=instance_create(pitchx,pitchy+6,obj_smoke);
        tempid.direction=i*12;
        tempid.speed=6+(i mod 2)*2;
        tempid.vspeed*=0.7;
        tempid.depth=depth+10;
        }
    }

//Picture 7 more explos
if (stuck==2 && stuckcyc>=22 && stuckcyc<140 && state==3){
    repeat(2){
        dist=12+random(24);
        dir=random(360);
        tempid=instance_create(pitchx+cos(degtorad(dir))*dist*2,pitchy+sin(degtorad(dir))*dist,obj_redexplox);
        tempid.direction=point_direction(tempid.x,tempid.y,pitchx,pitchy)+180;
        tempid.speed=8;
        }
    with (obj_redexplox){
        if (!nc)
            depth=2048-y;
        }
    if (stuckcyc mod 5 == 0)
        scr_explo1();
    if (stuckcyc mod 6 == 0)
        scr_explo2();
    }

//Picture 7 final explos
if (stuck==2 && stuckcyc>=140 && state==3){
    repeat(10)
        instance_create(floor(random(320)),y+256+random(64),obj_redexplox);
    repeat(2){
        tempid=instance_create(floor(random(320)),y+272+random(32),obj_block);
        tempid.gravity_direction=90;
        tempid.gravity=1+floor(random(3));
        tempid.visible=1;
        tempid.fly=1;
        tempid.depth-=8000;
        rand=floor(random(16));
        if (rand==0){
            tempid.sprite_index=spr_train;
            tempid.image_single=2+floor(random(4))*6;
            }
        else if (rand==1){
            tempid.sprite_index=spr_merrydoom;
            tempid.image_single=10+floor(random(5));
            }
        else if (rand==2){
            tempid.sprite_index=spr_p_walker;
            tempid.image_single=1;
            }
        else if (rand==3){
            tempid.sprite_index=spr_p_sleigh;
            tempid.image_single=floor(random(2));
            }
        else if (rand==4){
            tempid.sprite_index=spr_p_bulb;
            tempid.image_single=floor(random(7));
            }
        else{
            tempid.sprite_index=spr_elf;
            tempid.image_single=66+floor(random(5));
            }
        }
    }

//Picture 8 debris and stuff
if (state==4 && cyc==20){
    repeat(30){
        tempid=instance_create(x+136+random(50),y+132+random(16),obj_block);
        tempid.depth=-10;
        tempid.sprite_index=spr_8debris;
        if (tempid.x<160)
            tempid.image_single=floor(random(4));
        else
            tempid.image_single=floor(random(4)+4);
        tempid.hspeed=(tempid.x-160)*(1+random(0.3));
        if (tempid.hspeed<0)
            tempid.vspeed=random(-(tempid.hspeed)-26);
        else
            tempid.vspeed=-random(26-tempid.hspeed);
        tempid.hspeed*=0.8;
        }
    repeat(200){
        tempid=instance_create(x+136+random(50),y+132+random(16),obj_block);
        tempid.depth=-9;
        tempid.sprite_index=spr_8sparks;
        if (tempid.x<150 && random(1)<0.2)
            tempid.image_single=0;
        else if (tempid.x>=170 && random(1)<0.2)
            tempid.image_single=1;
        else
            tempid.image_single=floor(random(3)+2);
        tempid.hspeed=(tempid.x-160)*(1+random(0.3));
        tempid.vspeed=8-random(60);
        tempid.hspeed*=1.8;
        tempid.down=1;
        }
    }
else if (state==4 && cyc==21){
    with (obj_block){
        gravity=random(0.005)+0.002;
        speed*=0.01;
        visible=1;
        hspeed*=0.8;
        if (down)
            gravity*=1.3;
        }
    }
if (state==4 && cyc>=20)
    instance_create(x+146+floor(random(28)),y+64+floor(random(76)),obj_8line)

//Picture 9 stars
if (state==4 && cyc==100){
    repeat(50){
        tempid=instance_create(x+48+floor(random(224)),y+64+floor(random(112)),obj_longstar);
        tempid.type=4;
        tempid.change=1;
        }
    }

//Picture 9 explosions
if (state==5){
    repeat(2){
        tempid=instance_create(160-4+random(8),120-16+earthy+earths,obj_redexplo);
        tempid.direction=90;
        tempid.speed=2+random(2);
        }
    if (cyc mod 6 == 0)
        scr_explo2();
    }

//Picture 10 stars
if (state==6 && cyc==110){
    repeat(150){
        tempid=instance_create(160-96+floor(random(192)),120-48+floor(random(96)),obj_longstar);
        tempid.type=4;
        tempid.change=1;
        tempid.speed=random(1)+0.05;
        tempid.direction=point_direction(160,120,tempid.x,tempid.y);
        tempid.depth=-2;
        tempid.image_single=12;
        tempid.stopit=1;
        }
    }

//Picture 11 stars and explosion
if (state==7 && cyc==1){
    (instance_create(134,126,obj_redexplox)).depth=-5;
    repeat(75){
        flip=1-flip;
        tempid=instance_create(126+random(10),122+random(9),obj_11star);
        if (flip){
            tempid.speed=random(1.5);
            tempid.direction=point_direction(152,158,tempid.x,tempid.y);
            }
        else{
            tempid.speed=random(0.3);
            tempid.direction=32+random(160);
            }
        (instance_create(48+floor(random(224)),64+floor(random(112)),obj_11star)).depth=5;
        }
    }

//Picture 11 final explosion
if (state==7 && cyc==120){
    repeat(200)
        instance_create(x,y,obj_11star);
    with (obj_11star){
        x=160;
        y=120;
        speed=4+random(64);
        direction=random(360);
        vspeed*=0.5;
        }
    }
if (state==7 && cyc==121){
    with (obj_11star){
        hspeed*=0.03;
        vspeed*=0.03;
        }
    }

//I've learnt I like to shake
//Only applies before results screen
if (shakescreen>0 && state<8){
    shakescreen-=1;
    if (ultrashake && shakescreen>20)
        factor=8;
    else if (ultrashake && shakescreen>10)
        factor=6;
    else if (ultrashake && shakescreen>5)
        factor=4;
    else if (shakescreen>2)
        factor=2;
    else
        factor=1;
    shakeoff=(shakescreen mod 2)*factor;
    if (global.noshake)
        shakeoff=0;
    if (global.gmversion==5)
        view_top[0]=y+shakeoff+movecam;
    else if (global.gmversion==8)
        view_yview[0]=y+shakeoff+movecam;
    }
else{
    if (global.gmversion==5)
        view_top[0]=y+movecam;
    else if (global.gmversion==8)
        view_yview[0]=y+movecam;
    }

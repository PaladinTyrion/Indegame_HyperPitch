//Argument0 is y adjust
if (global.shakescreen<4)
    global.shakescreen+=2;
repeat(8)
    (instance_create(x,y+argument0,obj_icegib)).direction=random(360);
for (i=45;i<360;i+=90){
    tempid=instance_create(x,y+argument0,obj_iceflash);
    tempid.speed=5;
    tempid.direction=i;
    tempid.vspeed*=0.85;
    tempid.image_speed=0.5;
    tempid.alarm[0]=6;
    }
for (i=0;i<360;i+=10){
    tempid=instance_create(x,y+argument0,obj_iceparticle);
    tempid.speed=6;
    tempid.direction=i;
    tempid.vspeed*=0.85;
    tempid.image_speed=0.25;
    tempid.alarm[0]=12;
    }

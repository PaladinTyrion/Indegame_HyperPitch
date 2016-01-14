//argument0 is vertical killsprite
//argument1 is horizontal killsprite
//argument2 is killsprite pixel size

//set killdir
if (killdir>=22.5 && killdir<67.5)
    killdir=45;
else if (killdir>=67.5 && killdir<112.5)
    killdir=90;
else if (killdir>=112.5 && killdir<157.5)
    killdir=135;
else if (killdir>=157.5 && killdir<202.5)
    killdir=180;
else if (killdir>=202.5 && killdir<247.5)
    killdir=225;
else if (killdir>=247.5 && killdir<292.5)
    killdir=270;
else if (killdir>=292.5 && killdir<337.5)
    killdir=315;
else
    killdir=0;
if (killdir==0 || killdir==180)
    lxdir=0;
else if (killdir==90 || killdir==270)
    lxdir=1;
else
    lxdir=floor(random(2));

//vertical
if (lxdir==0){
    for (i=0;i<argument2;i+=1){
        tempid=instance_create(x,y-(argument2/2)+i,obj_lx);
        tempid.sprite_index=argument0;
        tempid.image_single=i;
        tempid.vspeed=(-(argument2/2)+i)*2;
        if (killdir==45 || killdir==225){
            tempid.hspeed=(-(argument2/2)+i)*2;
            tempid.hspeed*=0.7;
            tempid.vspeed*=0.7;
            }
        else if (killdir==135 || killdir==315){
            tempid.hspeed=-((-(argument2/2)+i)*2);
            tempid.hspeed*=0.7;
            tempid.vspeed*=0.7;
            }
        }
    }
//horizontal
else{
    for (i=0;i<argument2;i+=1){
        tempid=instance_create(x-(argument2/2)+i,y,obj_lx);
        tempid.sprite_index=argument1;
        tempid.image_single=i;
        tempid.hspeed=(-(argument2/2)+i)*2;
        if (killdir==45 || killdir==225){
            tempid.vspeed=(-(argument2/2)+i)*2;
            tempid.hspeed*=0.7;
            tempid.vspeed*=0.7;
            }
        else if (killdir==135 || killdir==315){
            tempid.vspeed=-((-(argument2/2)+i)*2);
            tempid.hspeed*=0.7;
            tempid.vspeed*=0.7;
            }
        }
    }
//old laser explo
for (i=0;i<4;i+=1){
    tempid=instance_create(x,y,obj_laserexplo);
    tempid.img4=global.lxrotation;
    tempid.image_single=tempid.img4*9;
    tempid.speed=4;
    tempid.direction=i*90+45;
    if (hyperlaser){
        tempid.sprite_index=spr_hyperlaserexplo;
        tempid.image_single=0;
        }
    }
global.lxrotation+=1;
if (global.lxrotation==7)
    global.lxrotation=0;

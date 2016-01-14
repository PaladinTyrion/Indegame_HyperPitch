//argument0 is powerup
// 1 Triple
// 2 Power
// 3 Catellite
// 4 Speed
// 5 Hyper

//Defaults
obj_pitch.poweruptime=12;
if (argument0!=2){
    sound_stop(snd_icefire2);
    sound_stop(snd_laserfire);
    obj_pitch.icefireloop=0;
    obj_pitch.icefire2loop=0;
    obj_pitch.laserfireloop=0;
    }
if (argument0==2){
    sound_stop(snd_icefire);
    obj_pitch.icefireloop=0;
    obj_pitch.icefire2loop=0;
    obj_pitch.laserfireloop=0;
    }
//global.flash=1;
global.pcornerflash=1;
obj_pitch.speedboost=1;
obj_pitch.firerate=1;
if (argument0!=5 && obj_pitch.powerup==5)
    obj_pitch.weapon=obj_pitch.prevweapon;
if (argument0!=3){
    with (obj_catellite)
        instance_destroy();
    }

//Triple
if (argument0==1){
    obj_pitch.weapcyc=0;
    obj_pitch.powerup=1;
    }
//Power
if (argument0==2){
    obj_pitch.weapcyc=0;
    obj_pitch.powerup=2;
    }
//Catellite
if (argument0==3){
    obj_pitch.powerup=3;
    if (instance_number(obj_catellite)==0){
        instance_create(obj_pitch.x,obj_pitch.y,obj_catellite);
        tempid=instance_create(obj_pitch.x,obj_pitch.y,obj_catellite);
        tempid.dir=180;
        tempid.image_index=4;
        tempid.diroff=15;
        }
    }
//Speed
if (argument0==4){
    obj_pitch.powerup=4;
    obj_pitch.firerate=1.2;
    obj_pitch.speedboost=1.5;
    }
//Hyper
if (argument0==5){
    if (obj_pitch.weapon!=4)
        obj_pitch.prevweapon=obj_pitch.weapon;
    obj_pitch.weapcyc=0;
    obj_pitch.powerup=5;
    obj_pitch.weapon=4;
    }

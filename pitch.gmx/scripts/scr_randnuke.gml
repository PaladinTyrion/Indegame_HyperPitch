//argument0 1 = always nuke
if (((killtype==1 || killtype==3) && random(1)<0.1) || argument0==1){
    killtype=4;
    instance_create(x,y-2,obj_bigexplo);
    if (global.shakescreen<6)
        global.shakescreen+=4;
    scr_spawnfire();
    scr_explo2();
    }

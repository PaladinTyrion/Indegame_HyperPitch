//Argument0 is x
//Argument1 is y
//Argument2 is depth adjust

if (global.goddess){
    savegoddess=1;
    global.goddess=0;
    }
//Explos
for (i=0;i<20;i+=1){
    //Circle
    tempid=instance_create(argument0,argument1+32,obj_bigexplo);
    tempid.speed=8;
    tempid.direction=i*18;
    tempid.vspeed*=0.7;
    tempid.depth-=30+argument2;
    tempid=instance_create(argument0,argument1+32,obj_redexplo);
    tempid.speed=16;
    tempid.direction=i*18;
    tempid.vspeed*=0.7;
    tempid.depth-=10+argument2;
    //Stem
    tempid=instance_create(argument0-8+random(16),argument1-48+random(80),obj_bigexplo);
    tempid.depth-=200+argument2;
    //Cloud
    tempid=instance_create(argument0-48+random(96),argument1-80+random(32),obj_hurtexplo);
    tempid.hurt=1;
    tempid.spawndepth=-400+argument2;
    tempid=instance_create(argument0-48+random(96),argument1-80+random(32),obj_bigexplo);
    tempid.hurt=1;
    tempid.depth-=400+argument2;
    }
if (savegoddess)
    global.goddess=1;

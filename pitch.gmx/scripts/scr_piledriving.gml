//IN PITCH STEP - PILEDRIVING
//1 = elf
//2 = top
//3 = snake
//4 = bulb
//5 = train
//6 = terminator elf
//7 = crawler
//8 = sleigh
//9 = wall cannon
//10 = elite sleigh
//11 = mega turret
//12 = walker
//13 = heavy train
//14 = merry doom
//16 = spacenerd
//80 = microsleigh
//81 = microsleigh2
//82 = microelf
//83 = microtop
//84 = microcrawler
//85 = microcar
//87 = microeliminator
//88 = microgoo
//89 = microwalker
//90 = micropitch

//Spin
/*if (pilespin<=12){
    pilespin+=1;
    if (pilespin mod 3==0){
        pexoff=1-pexoff;
        image_single=77-pexoff;
        }
    }*/
//Move in z
if (zgrav==-0.3 && zspeed<0 && !throwenemy)
    zgrav=-1.2;

//LANDS AFTER THROWING ENEMY
if (zspeed<0 && z+zspeed+zgrav<=0 && throwenemy){
    throwenemy=0;
    counter=0;
    countering=0;
    misscounter=0;
    piledriving=0;
    pain=3;
    altpain=3;
    noblinking=3;
    zspeed=0;
    z=0;
    zgrav=0;
    image_single=lookdir*8;
    }
//HIT GROUND WITH ENEMY
if (zspeed<0 && z+zspeed+zgrav<=0 && !throwenemy)
    smashtype=1;
//THROWN ENEMY HITS GROUND
if (throwenemyz<=10 && throwenemy && !throwenemydead){
    smashtype=2;
    throwenemydead=1;
    }
//YOU WITH ENEMY, OR THROWN ENEMY, HITS GROUND
if (smashtype>0){
    if (smashtype==1){
        global.stats[4]+=1;
        counter=0;
        countering=0;
        misscounter=0;
        piledriving=0;
        pain=3;
        altpain=3;
        noblinking=3;
        zspeed=0;
        z=0;
        zgrav=0;
        smashx=x;
        smashy=y;
        }
    else if (smashtype==2){
        global.stats[5]+=1;
        smashx=throwenemyx;
        smashy=throwenemyy;
        }
    with (obj_pickup){
        if (hidden && point_distance(x,y,obj_pitch.smashx,obj_pitch.smashy+9)<32){
            hidden=0;
            zgrav=-0.35;
            zspeed=7;
            z=5;
            depth=326-y+obj_sabot.y;
            }
        }
    scr_explo2();
    if (global.shakescreen<10)
        global.shakescreen+=8;
    if (smashtype==1)
        image_single=lookdir*8;
    //instance_create(smashx,smashy,obj_crackedfloor);

    if (penemytype==1){
        tempid=instance_create(smashx-5+pexoff*10,smashy,obj_elf);
        tempid.hp=0;
        tempid.killtype=4;
        tempid.killdir=0;
        tempid.nopoints=penemynopoints;
        explodex=tempid.x;
        explodey=tempid.y;
        }
    else if (penemytype==2){
        tempid=instance_create(smashx-5+pexoff*10,smashy,obj_top);
        tempid.hp=0;
        tempid.killtype=4;
        tempid.killdir=0;
        tempid.type=penemyimg;
        tempid.nopoints=penemynopoints;
        explodex=tempid.x;
        explodey=tempid.y;
        }
    else if (penemytype==3){
        tempid=instance_create(smashx-7+pexoff*15,smashy,obj_snake);
        tempid.hp=0;
        tempid.killtype=4;
        tempid.killdir=0;
        tempid.nopoints=penemynopoints;
        explodex=tempid.x;
        explodey=tempid.y;
        }
    else if (penemytype==4){
        tempid=instance_create(smashx-5+pexoff*10,smashy,obj_bulb);
        tempid.hp=0;
        tempid.killtype=4;
        tempid.killdir=0;
        tempid.type=penemyimg;
        tempid.nopoints=penemynopoints;
        explodex=tempid.x;
        explodey=tempid.y;
        }
    else if (penemytype==5){
        tempid=instance_create(smashx-5+pexoff*10,smashy,obj_train);
        tempid.hp=0;
        tempid.killtype=4;
        tempid.killdir=0;
        tempid.type=floor(penemyimg/4);
        tempid.nopoints=penemynopoints;
        explodex=tempid.x;
        explodey=tempid.y;
        }
    else if (penemytype==6){
        tempid=instance_create(smashx-5+pexoff*10,smashy,obj_terminatorelf);
        tempid.hp=0;
        tempid.killtype=4;
        tempid.killdir=0;
        tempid.nopoints=penemynopoints;
        explodex=tempid.x;
        explodey=tempid.y;
        }
    else if (penemytype==7){
        tempid=instance_create(smashx-6+pexoff*12,smashy,obj_crawler);
        tempid.hp=0;
        tempid.killtype=4;
        tempid.killdir=0;
        tempid.nopoints=penemynopoints;
        explodex=tempid.x;
        explodey=tempid.y;
        }
    else if (penemytype==8){
        tempid=instance_create(smashx-10+pexoff*21,smashy,obj_sleigh);
        tempid.hp=0;
        tempid.killtype=4;
        tempid.killdir=0;
        tempid.nopoints=penemynopoints;
        explodex=tempid.x;
        explodey=tempid.y;
        }
    else if (penemytype==9){
        tempid=instance_create(smashx-6+pexoff*12,smashy,obj_wallcannon);
        tempid.hp=0;
        tempid.killtype=4;
        tempid.killdir=0;
        tempid.noremains=1;
        tempid.nopoints=penemynopoints;
        explodex=tempid.x;
        explodey=tempid.y;
        }
    else if (penemytype==10){
        tempid=instance_create(smashx-10+pexoff*21,smashy,obj_elitesleigh);
        tempid.hp=0;
        tempid.killtype=4;
        tempid.killdir=0;
        tempid.nopoints=penemynopoints;
        explodex=tempid.x;
        explodey=tempid.y;
        }
    else if (penemytype==11){
        tempid=instance_create(smashx-10+pexoff*24,smashy,obj_megaturret);
        tempid.hp=0;
        tempid.killtype=4;
        tempid.killdir=0;
        tempid.nopoints=penemynopoints;
        explodex=tempid.x;
        explodey=tempid.y;
        }
    else if (penemytype==12){
        tempid=instance_create(smashx-16+pexoff*34,smashy,obj_walker);
        tempid.halfpoint=1;
        tempid.hp=0;
        tempid.killtype=4;
        tempid.killdir=0;
        tempid.doublescore=penemyhalfpoint;
        tempid.nopoints=penemynopoints;
        explodex=tempid.x;
        explodey=tempid.y;
        }
    else if (penemytype==13){
        tempid=instance_create(smashx-6+pexoff*12,smashy,obj_heavytrain);
        tempid.halfpoint=1;
        tempid.hp=0;
        tempid.killtype=4;
        tempid.killdir=0;
        tempid.type=penemyimg mod 3;
        tempid.doublescore=penemyhalfpoint;
        tempid.nopoints=penemynopoints;
        explodex=tempid.x;
        explodey=tempid.y;
        }
    else if (penemytype==14){
        tempid=instance_create(smashx-4+pexoff*8,smashy,obj_merrydoom);
        tempid.hp=0;
        tempid.killtype=4;
        tempid.killdir=0;
        tempid.nopoints=penemynopoints;
        explodex=tempid.x;
        explodey=tempid.y;
        }
    else if (penemytype==16){
        tempid=instance_create(smashx-5+pexoff*10,smashy,obj_nerd);
        tempid.hp=0;
        tempid.killtype=4;
        tempid.killdir=0;
        tempid.nopoints=penemynopoints;
        explodex=tempid.x;
        explodey=tempid.y;
        }
    else if (penemytype==80){
        tempid=instance_create(smashx-10+pexoff*21,smashy,obj_microsleigh);
        tempid.hp=0;
        tempid.killtype=4;
        tempid.killdir=0;
        tempid.nopoints=penemynopoints;
        explodex=tempid.x;
        explodey=tempid.y;
        }
    else if (penemytype==81){
        tempid=instance_create(smashx-5+pexoff*10,smashy,obj_microsleigh2);
        tempid.hp=0;
        explodex=tempid.x;
        explodey=tempid.y;
        }
    else if (penemytype==82){
        tempid=instance_create(smashx-4+pexoff*11,smashy,obj_microelf);
        tempid.hp=0;
        tempid.killtype=4;
        tempid.killdir=0;
        tempid.nopoints=penemynopoints;
        explodex=tempid.x;
        explodey=tempid.y;
        }
    else if (penemytype==83){
        tempid=instance_create(smashx-8+pexoff*16,smashy,obj_microtop);
        tempid.hp=0;
        tempid.killtype=4;
        tempid.killdir=0;
        tempid.nopoints=penemynopoints;
        explodex=tempid.x;
        explodey=tempid.y;
        }
    else if (penemytype==84){
        tempid=instance_create(smashx-6+pexoff*12,smashy,obj_microcrawler);
        tempid.hp=0;
        tempid.killtype=4;
        tempid.killdir=0;
        tempid.nopoints=penemynopoints;
        explodex=tempid.x;
        explodey=tempid.y;
        }
    else if (penemytype==85){
        tempid=instance_create(smashx-8+pexoff*16,smashy,obj_microcar);
        tempid.hp=0;
        tempid.killtype=4;
        tempid.killdir=0;
        tempid.nopoints=penemynopoints;
        explodex=tempid.x;
        explodey=tempid.y;
        tempid.points=penemypoints;
        }
    else if (penemytype==87){
        tempid=instance_create(smashx-5+pexoff*11,smashy,obj_microeliminator);
        tempid.hp=0;
        tempid.killtype=4;
        tempid.killdir=0;
        tempid.nopoints=penemynopoints;
        explodex=tempid.x;
        explodey=tempid.y;
        }
    else if (penemytype==88){
        tempid=instance_create(smashx-6+pexoff*12,smashy,obj_microgoo);
        tempid.invincible=0;
        tempid.hp=0;
        tempid.killtype=4;
        tempid.killdir=0;
        tempid.nopoints=penemynopoints;
        explodex=tempid.x;
        explodey=tempid.y;
        }
    else if (penemytype==89){
        tempid=instance_create(smashx-16+pexoff*34,smashy,obj_microwalker);
        tempid.halfpoint=1;
        tempid.hp=0;
        tempid.killtype=4;
        tempid.killdir=0;
        tempid.doublescore=penemyhalfpoint;
        tempid.nopoints=penemynopoints;
        explodex=tempid.x;
        explodey=tempid.y;
        }
    else if (penemytype==90){
        tempid=instance_create(smashx-6+pexoff*13,smashy,obj_micropitch);
        tempid.hp=0;
        tempid.killtype=4;
        tempid.killdir=0;
        tempid.nopoints=penemynopoints;
        tempid.speak2=1;
        explodex=tempid.x;
        explodey=tempid.y;
        }


    repeat(2)
        instance_create(explodex,explodey,obj_nukeexplo);
    for (i=0;i<360;i+=20){
        tempid=instance_create(explodex,explodey,obj_smoke);
        tempid.direction=i;
        tempid.speed=6;
        tempid.vspeed*=0.8;
        }
    
    smashtype=0;
    }

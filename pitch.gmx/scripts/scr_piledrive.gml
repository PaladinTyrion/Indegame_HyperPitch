//Argument0 = enemy id
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

tempid=argument0;
throwenemydead=0;
throwenemy=0;
smashtype=0;
penemynopoints=tempid.nopoints;
penemytype=tempid.enemytype; //piledriven enemy type
penemyimg=0; //piledriven enemy subimage
penemyimg2=0; //special data depending on enemy
penemypoints=tempid.points; //used in some special cases
if (penemytype==1){
    if (tempid.sprite_index==spr_eliteelf)
        peliteelf=1;
    else
        peliteelf=0;
    }
else if (penemytype==2)
    penemyimg=tempid.type;
else if (penemytype==3){
    if (x<tempid.x)
        penemyimg=1;
    }
else if (penemytype==4)
    penemyimg=tempid.type;
else if (penemytype==5){
    penemyimg=tempid.type*4+tempid.engine*2;
    if (x<tempid.x)
        penemyimg+=1;
    if (tempid.mayfire && !tempid.engine)
        penemyimg2=1;
    }
else if (penemytype==7){
    if (x<tempid.x)
        penemyimg=1;
    }
else if (penemytype==8){
    if (x<tempid.x)
        penemyimg=1;
    }
else if (penemytype==9){
    tempidx=instance_create(tempid.x,tempid.y,obj_destroyedcannon);
    tempidx.image_single=tempid.dir*3+2;
    tempidx.depth=tempid.depth;
    }
else if (penemytype==10){
    if (x<tempid.x)
        penemyimg=1;
    }
else if (penemytype==12){
    penemyimg=tempid.halfpoint;
    if (!tempid.halfpoint)
        penemyhalfpoint=1;
    }
else if (penemytype==13){
    penemyimg=tempid.type+tempid.halfpoint*3;
    if (!tempid.halfpoint)
        penemyhalfpoint=1;
    }
else if (penemytype==14){
    if (x<tempid.x)
        penemyimg=1;
    }
else if (penemytype==80){
    if (x<tempid.x)
        penemyimg=1;
    }
else if (penemytype==84){
    if (x<tempid.x)
        penemyimg=1;
    }
else if (penemytype==85){
    if (x<tempid.x)
        penemyimg=1;
    }
else if (penemytype==89){
    penemyimg=tempid.halfpoint;
    if (!tempid.halfpoint)
        penemyhalfpoint=1;
    }
else if (penemytype==90){
    if (!global.nosound){
        sound_stop(snd_mechapitch1);
        sound_stop(snd_mechapitch2);
        sound_play(snd_mechapitch3);
        }
    }

countering=1000;
piledriving=1;
pain=1000;
docounter=0;
zspeed=6;
zgrav=-0.3;
misscounter=0;
pilespin=0; //spinning piledriver
if (x<tempid.x){
    img=76;
    pexoff=1;
    }
else{
    img=77;
    pexoff=0;
    }
image_single=img;
with (tempid)
    instance_destroy();
if (pickvoice1==0 && pickvoice2==0 && penemytype!=90){
    scr_stoppitchvoice();
    rand=floor(random(2));
    rand2=random(1);
    if (!global.novoice){
        if (rand2<0.1)
            sound_play(snd_pitchmegacatch);
        //else if (rand==0)
        //    sound_play(snd_pitchpiledriver2);
        else
            sound_play(snd_pitchpiledriver1);
        }
    else if (!global.nosound){
        sound_stop(snd_jump);
        sound_play(snd_jump);
        }
    }

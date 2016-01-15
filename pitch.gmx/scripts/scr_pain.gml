///PITCH TAKES DAMAGE
//argument0 is dmg amount

if (global.fullinvincible)
    xpainam=0;
else
    xpainam=argument0;

nopain=0;
if (xpainam==0)
    nopain=1;
hp-=xpainam;
if (xpainam>0)
    global.stats[6]+=xpainam;
global.hurtflash=1;
//DEATH
if (hp<=0){
    with (obj_microfrilly)
        killedpitch=1;
    global.stats[7]+=1;
    with (obj_redbrick){
        instance_destroy();
        instance_create(x,y,obj_elfexplo);
        }
    with (obj_goldbrick){
        instance_destroy();
        instance_create(x,y,obj_elfexplo);
        }
    with (obj_iceblast)
        instance_destroy();
    with (obj_iceblast2)
        instance_destroy();
    with (obj_laser){
        instance_destroy();
        instance_create(x,y,obj_elfexplo);
        }
    with (obj_megalaser)
        instance_destroy();
    hp=0;
    global.ignoreall=1;
    visible=0;
    speed=0;
    x=xprevious;
    y=yprevious;
    gravity=0;
    scr_explo2();
    scr_removepowerup(0);
    obj_sabot.deadcyc=100;
    visible=false;
    instance_create(obj_pitch.x,obj_pitch.y,obj_deadpitch);
    instance_create(x,y,obj_nukeexplo);
    instance_create(x-8,y-8,obj_nukeexplo);
    instance_create(x-8,y+8,obj_nukeexplo);
    instance_create(x+8,y-8,obj_nukeexplo);
    instance_create(x+8,y+8,obj_nukeexplo);
    obj_sabot.dmgroom=1;
    scr_stoppitchvoice();
    if (!global.novoice)
        sound_play(snd_pitchdeath);
    obj_cheersquad.cheer=1;
    }
//PAIN
else if (!nopain){
    pain=16;
    obj_sabot.dmgroom=1;
    scr_stoppitchvoice();
    if (!global.novoice){
        rand=floor(random(3));
        if (rand==0)
            sound_play(snd_pitchpain1);
        else if (rand==1)
            sound_play(snd_pitchpain2);
        else if (rand==2)
            sound_play(snd_pitchpain3);
        }
    obj_cheersquad.cheer=2;
    //Stops small pickup voices
    pickvoice1=20;
    pickvoice2=20;
    }

//Uninterruptable for below and instant: Triple, Power, Catellite, Speed, Hyper, Extra life
//Uninterruptable for below and instant: Catstrike, Bowbomb
//Delayed but always play: Bonus, Life, Ice, Rainbow

vdelay=20; //Delay between voices

if (!global.ignoreall && other.zgrav==0 && !other.hidden && obj_pitch.zgrav==0){
global.stats[2]+=1;
if (global.novoice && !global.nosound)
    sound_play(snd_pickup);
if (other.image_single==0){//Bonus apple
    global.points+=25*global.multiplier;
    if (global.showscore)
        (instance_create(other.x,other.y-4,obj_scorenumber)).points=25*global.multiplier;
    if (obj_pitch.pickvoice1==0 && obj_pitch.pickvoice2==0){
        if (!global.novoice){
            scr_stoppitchvoice();
            sound_play(snd_pitchpickups01);
            }
        }
    }
else if (other.image_single==1){//Bonus orange
    global.points+=50*global.multiplier;
    if (global.showscore)
        (instance_create(other.x,other.y-4,obj_scorenumber)).points=50*global.multiplier;
    if (obj_pitch.pickvoice1==0 && obj_pitch.pickvoice2==0){
        if (!global.novoice){
            scr_stoppitchvoice();
            sound_play(snd_pitchpickups01);
            }
        }
    }
else if (other.image_single==2){//Bonus grapes
    global.points+=100*global.multiplier;
    if (global.showscore)
        (instance_create(other.x,other.y-4,obj_scorenumber)).points=100*global.multiplier;
    if (obj_pitch.pickvoice1==0 && obj_pitch.pickvoice2==0){
        if (!global.novoice){
            scr_stoppitchvoice();
            sound_play(snd_pitchpickups01);
            }
        }
    }
else if (other.image_single==3){//Bonus strawberry
    global.points+=200*global.multiplier;
    if (global.showscore)
        (instance_create(other.x,other.y-4,obj_scorenumber)).points=200*global.multiplier;
    if (obj_pitch.pickvoice1==0 && obj_pitch.pickvoice2==0){
        if (!global.novoice){
            scr_stoppitchvoice();
            sound_play(snd_pitchpickups01);
            }
        }
    }
else if (other.image_single==4){//Life
    obj_pitch.hp+=2;
    if (obj_pitch.hp>10)
        obj_pitch.hp=10;
    global.points+=20*global.multiplier;
    if (global.showscore)
        (instance_create(other.x,other.y-4,obj_scorenumber)).points=20*global.multiplier;
    if (obj_pitch.pickvoice1==0 && obj_pitch.pickvoice2==0){
        if (!global.novoice){
            scr_stoppitchvoice();
            sound_play(snd_pitchpickups02);
            }
        }
    }
else if (other.image_single==5){//Ice ammo
    global.ammo2+=5;
    if (global.ammo2>=99)
        global.ammo2=99;
    global.points+=20*global.multiplier;
    if (global.showscore)
        (instance_create(other.x,other.y-4,obj_scorenumber)).points=20*global.multiplier;
    if (obj_pitch.pickvoice1==0 && obj_pitch.pickvoice2==0){
        if (!global.novoice){
            scr_stoppitchvoice();
            sound_play(snd_pitchpickups03);
            }
        }
    }
else if (other.image_single==6){//Rainbow ammo
    global.ammo3+=5;
    if (global.ammo3>=99)
        global.ammo3=99;
    global.points+=20*global.multiplier;
    if (global.showscore)
        (instance_create(other.x,other.y-4,obj_scorenumber)).points=20*global.multiplier;
    if (obj_pitch.pickvoice1==0 && obj_pitch.pickvoice2==0){
        if (!global.novoice){
            scr_stoppitchvoice();
            sound_play(snd_pitchpickups04);
            }
        }
    }
else if (other.image_single==7){//Catstrike
    instance_create(obj_sabot.x+352,other.y-32,obj_catstrike);
    if (!global.nosound){
        sound_stop(snd_catstrike);
        sound_play(snd_catstrike);
        }
    global.points+=100*global.multiplier;
    if (global.showscore)
        (instance_create(other.x,other.y-4,obj_scorenumber)).points=100*global.multiplier;
    if (obj_pitch.pickvoice1==0){
        if (!global.novoice){
            scr_stoppitchvoice();
            sound_play(snd_pitchpickups05);
            obj_pitch.pickvoice2=vdelay;
            }
        }
    }
else if (other.image_single==8){//Bowbomb
    global.flash=1;
    instance_create(other.x,other.y,obj_bowbomb);
    global.points+=100*global.multiplier;
    if (global.showscore)
        (instance_create(other.x,other.y-4,obj_scorenumber)).points=100*global.multiplier;
    if (obj_pitch.pickvoice1==0){
        if (!global.novoice){
            scr_stoppitchvoice();
            sound_play(snd_pitchpickups06);
            obj_pitch.pickvoice2=vdelay;
            }
        }
    if (!global.nosound){
        sound_stop(snd_enemyfire3);
        sound_play(snd_enemyfire3);
        }
    }
else if (other.image_single==9){//Extra life
    if (global.extralives<9)
        global.extralives+=1;
    global.points+=500*global.multiplier;
    if (global.showscore)
        (instance_create(other.x,other.y-4,obj_scorenumber)).points=500*global.multiplier;
    if (!global.novoice){
        scr_stoppitchvoice();
        sound_play(snd_pitchpickups07);
        obj_pitch.pickvoice1=vdelay;
        obj_pitch.pickvoice2=vdelay;
        }
    }
else if (other.image_single==10){//Triple
    scr_powerup(1);
    global.points+=100*global.multiplier;
    if (global.showscore)
        (instance_create(other.x,other.y-4,obj_scorenumber)).points=100*global.multiplier;
    if (!global.novoice){
        scr_stoppitchvoice();
        sound_play(snd_pitchpickups08);
        obj_pitch.pickvoice1=vdelay;
        obj_pitch.pickvoice2=vdelay;
        }
    }
else if (other.image_single==11){//Power
    with (obj_pitch)
        scr_powerup(2);
    global.points+=100*global.multiplier;
    if (global.showscore)
        (instance_create(other.x,other.y-4,obj_scorenumber)).points=100*global.multiplier;
    if (!global.novoice){
        scr_stoppitchvoice();
        sound_play(snd_pitchpickups09);
        obj_pitch.pickvoice1=vdelay;
        obj_pitch.pickvoice2=vdelay;
        }
    }
else if (other.image_single==12){//Catellite
    with (obj_pitch)
        scr_powerup(3);
    global.points+=100*global.multiplier;
    if (global.showscore)
        (instance_create(other.x,other.y-4,obj_scorenumber)).points=100*global.multiplier;
    if (!global.novoice){
        scr_stoppitchvoice();
        sound_play(snd_pitchpickups10);
        obj_pitch.pickvoice1=vdelay;
        obj_pitch.pickvoice2=vdelay;
        }
    }
else if (other.image_single==13){//Speed
    with (obj_pitch)
        scr_powerup(4);
    global.points+=100*global.multiplier;
    if (global.showscore)
        (instance_create(other.x,other.y-4,obj_scorenumber)).points=100*global.multiplier;
    if (!global.novoice){
        scr_stoppitchvoice();
        sound_play(snd_pitchpickups11);
        obj_pitch.pickvoice1=vdelay;
        obj_pitch.pickvoice2=vdelay;
        }
    }
else if (other.image_single==14 || other.image_single==16 || other.image_single==17 || other.image_single==18){//Hyper
    with (obj_pitch)
        scr_powerup(5);
    global.points+=100*global.multiplier;
    if (global.showscore)
        (instance_create(other.x,other.y-4,obj_scorenumber)).points=100*global.multiplier;
    if (!global.novoice){
        scr_stoppitchvoice();
        sound_play(snd_pitchpickups12);
        obj_pitch.pickvoice1=vdelay;
        obj_pitch.pickvoice2=vdelay;
        }
    //Hyper type
    if (other.image_single==14)
        obj_pitch.hyperweapon=0;
    else if (other.image_single==16)
        obj_pitch.hyperweapon=1;
    else if (other.image_single==17)
        obj_pitch.hyperweapon=2;
    else if (other.image_single==18)
        obj_pitch.hyperweapon=3;
    }
with (other)
    instance_destroy();
    }

//Removes Pitch's powerup
//argument0 1 is absolute
if (argument0==1 || !global.infinitepower){
    with (obj_pitch){
        if (powerup==5)
            weapon=prevweapon;
        powerup=0;
        poweruptime=0;
        speedboost=1;
        firerate=1;
        sound_stop(snd_icestart);
        sound_stop(snd_icefire);
        sound_stop(snd_laserstart);
        sound_stop(snd_laserfire);
        sound_stop(snd_icestart);
        sound_stop(snd_icefire2);
        obj_pitch.icefireloop=0;
        obj_pitch.icefire2loop=0;
        obj_pitch.laserfireloop=0;
        hyperweapon=0;
        }
    with (obj_catellite)
        instance_destroy();
    }

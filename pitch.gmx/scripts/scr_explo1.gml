if (!global.nosound){
rand=floor(random(3));
if (rand==0){
    sound_stop(snd_explo1a)
        sound_play(snd_explo1a);
    }
else if (rand==1){
    sound_stop(snd_explo1b)
        sound_play(snd_explo1b);
    }
else if (rand==2){
    sound_stop(snd_explo1c)
        sound_play(snd_explo1c);
    }
}

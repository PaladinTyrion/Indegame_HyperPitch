if (!global.nosound){
rand=floor(random(12));
if (rand==0){
    sound_stop(snd_debris1)
    sound_play(snd_debris1);
    }
else if (rand==1){
    sound_stop(snd_debris2)
    sound_play(snd_debris2);
    }
else if (rand==2){
    sound_stop(snd_debris3)
    sound_play(snd_debris3);
    }
}

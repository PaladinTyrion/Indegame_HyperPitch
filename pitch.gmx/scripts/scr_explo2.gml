if (!global.nosound){
rand=floor(random(2));
sound_stop(snd_explo2a)
sound_stop(snd_explo2b)
if (rand==0)
    sound_play(snd_explo2a);
else if (rand==1)
    sound_play(snd_explo2b);
}

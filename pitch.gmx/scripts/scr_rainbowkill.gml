if (!global.nosound){
rand=floor(random(2));
sound_stop(snd_rainbowkill1)
sound_stop(snd_rainbowkill2)
if (rand==0)
    sound_play(snd_rainbowkill1);
else if (rand==1)
    sound_play(snd_rainbowkill2);
}

if (!global.nosound){
rand=floor(random(3));
if (rand==0){
    sound_stop(snd_icekill1)
        sound_play(snd_icekill1);
    }
else if (rand==1){
    sound_stop(snd_icekill2)
        sound_play(snd_icekill2);
    }
else if (rand==2){
    sound_stop(snd_icekill3)
        sound_play(snd_icekill3);
    }
}

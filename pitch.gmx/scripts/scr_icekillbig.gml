if (!global.nosound){
rand=floor(random(2));
if (rand==0){
    sound_stop(snd_icekillbig1)
        sound_play(snd_icekillbig1);
    }
else if (rand==1){
    sound_stop(snd_icekillbig2)
        sound_play(snd_icekillbig2);
    }
}

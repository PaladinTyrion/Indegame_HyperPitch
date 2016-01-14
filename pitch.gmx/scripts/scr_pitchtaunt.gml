if (!global.novoice){
    scr_stoppitchvoice();
    rand=floor(random(3));
    rand2=random(1);
    if (rand2<0.05)
        sound_play(snd_pitchtaunt4);
    else if (rand==0)
        sound_play(snd_pitchtaunt1);
    else if (rand==1)
        sound_play(snd_pitchtaunt2);
    else if (rand==2)
        sound_play(snd_pitchtaunt3);
    }

//Directsong is bugged; will always play with max volume
//argument0 = change immediately to this song
if (global.music>0){
    jbfmod_stop_song();
    scr_setmusicvol();
    jbfmod_play_song(argument0);
    global.currentsong=argument0;
    global.wantsong=argument0;
    global.fadesong=0;
    }

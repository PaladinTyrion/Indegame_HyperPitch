//argument0 1 = reset title song
//argument1 1 = do not save
global.shakescreen=0;
global.totalenemies+=global.stats[0];
global.stats[0]=0;
if (argument1==0)
    scr_save();
sound_stop_all();
if (argument0==1){
    scr_directsong(0);
    scr_wantsong(6);
    }
room_goto(rom_main);

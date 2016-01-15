//STRING
savestr="";
for (i=0;i<10;i+=1){
    if (global.highscore[i]<1000000)
        savestr+="0";
    if (global.highscore[i]<100000)
        savestr+="0";
    if (global.highscore[i]<10000)
        savestr+="0";
    if (global.highscore[i]<1000)
        savestr+="0";
    if (global.highscore[i]<100)
        savestr+="0";
    if (global.highscore[i]<10)
        savestr+="0";
    savestr+=string(global.highscore[i]);
    }

for (i=0;i<10;i+=1)
    savestr+=global.highscorename[i];
for (i=0;i<5;i+=1)
    savestr+=string(global.reached[i]);
for (i=0;i<5;i+=1)
    savestr+=string(global.reached5[i]);

savestr+=string(global.highestdiff);
savestr+=string(global.soundvol);
savestr+=string(global.music);
savestr+=string(global.voicevol);
savestr+=string(global.noshake);
savestr+=string(global.nointro);
savestr+=chr(global.firekey);
savestr+=chr(global.changekey);

if (global.joyfire<10)
    savestr+="0";
savestr+=string(global.joyfire);
if (global.joychange<10)
    savestr+="0";
savestr+=string(global.joychange);
if (global.joypause<10)
    savestr+="0";
savestr+=string(global.joypause);
if (global.joyup<10)
    savestr+="0";
savestr+=string(global.joyup);
if (global.joydown<10)
    savestr+="0";
savestr+=string(global.joydown);
if (global.joyleft<10)
    savestr+="0";
savestr+=string(global.joyleft);
if (global.joyright<10)
    savestr+="0";
savestr+=string(global.joyright);

global.bake[0]=global.showscore;
global.bake[2]=global.showfps;
global.bake[3]=global.scalewin;
if (scr_fullscreen(0,0))
    global.bake[1]=1;
else
    global.bake[1]=0;
for (i=0;i<10;i+=1)
    savestr+=string(global.bake[i]);

if (global.totalenemies<10000000)
    savestr+="0";
if (global.totalenemies<1000000)
    savestr+="0";
if (global.totalenemies<100000)
    savestr+="0";
if (global.totalenemies<10000)
    savestr+="0";
if (global.totalenemies<1000)
    savestr+="0";
if (global.totalenemies<100)
    savestr+="0";
if (global.totalenemies<10)
    savestr+="0";
savestr+=string(global.totalenemies);

//EXTRA
savestr+=chr(global.wupkey);
savestr+=chr(global.wleftkey);
savestr+=chr(global.wdownkey);
savestr+=chr(global.wrightkey);

scr_calcsum(savestr);

//WRITE
fileid=file_text_open_write("pitchsave.sav");
file_text_write_string(fileid,savestr);
file_text_writeln(fileid);
file_text_writeln(fileid);
haikutext[0]=scr_haiku(checksum,0);
haikutext[1]=scr_haiku(checksum,1);
haikutext[2]=scr_haiku(checksum,2);
file_text_write_string(fileid,haikutext[0]);
file_text_writeln(fileid);
file_text_write_string(fileid,haikutext[1]);
file_text_writeln(fileid);
file_text_write_string(fileid,haikutext[2]);
file_text_writeln(fileid);
file_text_write_string(fileid,"-The Pitch Savefile 1.0");
file_text_writeln(fileid);
file_text_close(fileid);

if (file_exists("pitchsave.sav")){
    fileid=file_text_open_read("pitchsave.sav");
    loadstr=file_text_read_string(fileid);
    file_text_readln(fileid);
    file_text_readln(fileid);
    loadhaiku[0]=file_text_read_string(fileid);
    file_text_readln(fileid);
    loadhaiku[1]=file_text_read_string(fileid);
    file_text_readln(fileid);
    loadhaiku[2]=file_text_read_string(fileid);
    file_text_close(fileid);
    
    //COMPARE SUM
    scr_calcsum(loadstr);
    haikutext[0]=scr_haiku(checksum,0);
    haikutext[1]=scr_haiku(checksum,1);
    haikutext[2]=scr_haiku(checksum,2);
    if (haikutext[0]==loadhaiku[0] && haikutext[1]==loadhaiku[1] && haikutext[2]==loadhaiku[2]){
        //LOAD
        for (i=0;i<10;i+=1)
            global.highscore[i]=real(string_copy(loadstr,1+i*7,7));
        for (i=0;i<10;i+=1)
            global.highscorename[i]=string_copy(loadstr,71+i*10,10);
        for (i=0;i<5;i+=1)
            global.reached[i]=real(string_char_at(loadstr,171+i));
        for (i=0;i<5;i+=1)
            global.reached5[i]=real(string_char_at(loadstr,176+i));
        global.highestdiff=real(string_char_at(loadstr,181));
        global.soundvol=real(string_char_at(loadstr,182));
        if (global.soundvol==0)
            global.nomenusound=1;
        global.music=real(string_char_at(loadstr,183));
        global.voicevol=real(string_char_at(loadstr,184));
        if (global.voicevol==0)
            global.novoice=1;
        global.noshake=real(string_char_at(loadstr,185));
        global.nointro=real(string_char_at(loadstr,186));
        global.firekey=ord(string_char_at(loadstr,187));
        global.changekey=ord(string_char_at(loadstr,188));
        global.joyfire=real(string_copy(loadstr,189,2));
        global.joychange=real(string_copy(loadstr,191,2));
        global.joypause=real(string_copy(loadstr,193,2));
        global.joyup=real(string_copy(loadstr,195,2));
        global.joydown=real(string_copy(loadstr,197,2));
        global.joyleft=real(string_copy(loadstr,199,2));
        global.joyright=real(string_copy(loadstr,201,2));
        for (i=0;i<10;i+=1)
            global.bake[i]=real(string_char_at(loadstr,203+i));
        global.totalenemies=real(string_copy(loadstr,213,8));

        //EXTRA
        if (string_length(loadstr)>=221){
            global.wupkey=ord(string_copy(loadstr,221,1));
            global.wleftkey=ord(string_copy(loadstr,222,1));
            global.wdownkey=ord(string_copy(loadstr,223,1));
            global.wrightkey=ord(string_copy(loadstr,224,1));
            }
        
        //BAKES
        global.showscore=global.bake[0];
        global.showfps=global.bake[2];
        global.scalewin=global.bake[3];
        if (global.scalewin<1 || global.scalewin>4)
            global.scalewin=2;
        
        if (global.overridefullscreen==0)
            scr_fullscreen(1,global.bake[1]);
        }
    //FAILED TO LOAD
    else{
        fileid2=file_text_open_write("lasterror.txt");
        temptext=date_datetime_string(date_current_datetime());
        file_text_write_string(fileid2,"At "+temptext+", the checksum was incorrect. The save file was reset. The Princess apologizes for the inconvenience.")
        file_text_close(fileid2);
        scr_save();
        }
    }

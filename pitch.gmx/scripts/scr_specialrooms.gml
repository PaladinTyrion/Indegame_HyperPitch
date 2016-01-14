//SNOWY
if (global.level==1 && (roomx==0 && roomy==4))
    snowfall=1;
else if (global.level==1 && (roomx==1 && roomy==2))
    snowfall=1;
else
    snowfall=0;

//BOSS
if (global.level==1 && (roomx==3 && roomy==0))
    bosstime=1;
else if (global.level==2 && (roomx==0 && roomy==1))
    bosstime=1;
else if (global.level==3 && (roomx==4 && roomy==0))
    bosstime=1;
else if (global.level==4 && (roomx==0 && roomy==3))
    bosstime=1;
else
    bosstime=0;

//HIDDEN
lasthiddenroom=hiddenroom;
if (hiddenroom){
    hiddenroom=0;
    global.nodmgrooms-=1;
    }
else if (global.level==1 && roomx==4 && roomy==2){
    hiddenroom=1;
    global.nodmgrooms-=1;
    }

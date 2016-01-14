startx=120+ehsx*16;
starty=72+ehsy*16;
wantx=126+markerx*8;
wanty=40;
curx=startx;
cury=starty;

stepx=(wantx-startx)/20;
stepy=(wanty-starty)/20;

repeat(20){
    curx+=stepx;
    cury+=stepy;
    tempid=instance_create(curx-3+random(6),cury-3+random(6),obj_iceparticle);
    tempid.depth=-1;
    tempid.sprite_index=spr_highscoreparticle;
    }
repeat(8){
    tempid=instance_create(wantx,wanty,obj_iceparticle);
    tempid.depth=-1;
    //tempid.sprite_index=spr_highscoreparticle;
    tempid.direction=random(360);
    tempid.speed=random(2.4);
    }

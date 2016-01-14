with (obj_pitch){
    if (z>0){
        zd=4-z/30;
        if (zd<1)
            zd=1;
        draw_sprite(spr_shadow,zd,x+1,y+6);
        }
    }
with (obj_ultrasleigh){
    if (despcyc>=40 && despcyc<80 && (despcyc mod 4 < 2)){
        for (i=obj_sabot.x+40;i<obj_sabot.x+168;i+=20){
            for (j=y-16;j<=y+32;j+=16)
                draw_sprite(spr_shadow,9,i,j);
            }
        }
    }
with (obj_atomicelf){
    if (warning && !desperation){
        for (i=0;i<6;i+=1)
            draw_sprite(spr_shadow,9,x+cos(degtorad(i*60))*20,y+14+sin(degtorad(i*60))*10);
        }
    if (despcyc>=40 && despcyc<80 && (despcyc mod 4 < 2)){
        for (i=obj_sabot.x+40;i<obj_sabot.x+290;i+=20)
            draw_sprite(spr_shadow,9,i,y+12);
        }
    }
with (obj_annihilator){
    if (warning3){
        for (i=0;i<floor((x-64-obj_sabot.x)/20);i+=1){
            for (j=0;j<4;j+=1)
                draw_sprite(spr_shadow,9,obj_sabot.x+40+i*20,obj_sabot.y+86+j*16);
            }
        }
    else if (despcyc>=40 && despcyc<80 && (despcyc mod 4 < 2)){
        for (i=0;i<floor((x-64-obj_sabot.x)/20);i+=1){
            for (j=-4;j<8;j+=1)
                draw_sprite(spr_shadow,9,obj_sabot.x+40+i*20,obj_sabot.y+86+j*16);
            }
        }
    }
with (obj_atomicpunch){
    if (z!=0 && zspeed<0){
        zd=4-z/40;
        if (zd<0)
            zd=0;
        draw_sprite(spr_shadow,zd,x,y+2);
        if (image_single==3 && right)
            draw_sprite(spr_shadow,9,x-4,y+2);
        }
    }
with (obj_atomicturret){
    if (z!=0){
        zd=5-z/50;
        if (zd<0)
            zd=0;
        draw_sprite(spr_shadow,zd,x,y-2);
        }
    }
with (obj_santa){
    if (!dead){
        if (despcyc>=60 && despcyc<120 && (despcyc mod 4 < 2)){
            for (i=x-60;i<=x+60;i+=20){
                for (j=obj_sabot.y+120;j<=obj_sabot.y+184;j+=16)
                    draw_sprite(spr_shadow,9,i,j);
                }
            }
        if (thunderprepare){
            thunderwarning+=1;
            if (thunderwarning==4)
                thunderwarning=0;
            if (thunderwarning<2){
                if (thundertype==0){
                    for (j=targety;j>=obj_sabot.y+110;j-=16)
                        draw_sprite(spr_shadow,9,targetx,j);
                    }
                else if (thundertype==1){
                    tempttoff=0;
                    for (j=targety;j>=obj_sabot.y+110;j-=16){
                        draw_sprite(spr_shadow,9,targetx+tempttoff,j);
                        tempttoff-=16;
                        }
                    }
                else if (thundertype==2){
                    tempttoff=0;
                    for (j=targety;j>=obj_sabot.y+110;j-=16){
                        draw_sprite(spr_shadow,9,targetx+tempttoff,j);
                        tempttoff+=16;
                        }
                    }
                }
            }
        }
    }
with (obj_busterpitch){
    if (z!=0){
        zd=4+z/30;
        if (zd<1)
            zd=1;
        draw_sprite(spr_shadow,zd,x+1,y+6);
        }
    }
with (obj_spawnpitch){
    draw_sprite(spr_shadow,2,catx,y+6);
    if (jumped){
        zd=4+z/30;
        if (zd<1)
            zd=1;
        draw_sprite(spr_shadow,zd,x+1,y+6);
        }
    }
with (obj_snowpart)
    draw_sprite(spr_snowpart,image_single+8,x,y+2);
with (obj_joinelf)
    draw_sprite(spr_shadow,2,x,y+2);
with (obj_elfgib){
    zd=1-z/60;
    if (zd<0)
        zd=0;
    draw_sprite(spr_shadow,zd,x,y);
    }
with (obj_pickup){
    if (visible && !hidden)
        draw_sprite(spr_shadow,6,x+1,y);
    }
with (obj_elf){
    if (z>0)
        draw_sprite(spr_shadow,6,x,y+4);
    }
with (obj_microelf){
    if (z>0)
        draw_sprite(spr_shadow,6,x,y+6);
    }
with (obj_bulb)
    draw_sprite(spr_shadow,6,x+1,y+4);
with (obj_spawnbulb)
    draw_sprite(spr_shadow,6,x,y+4);
with (obj_sleigh)
    draw_sprite(spr_shadow,8,x,y+10);
with (obj_microsleigh)
    draw_sprite(spr_shadow,8,x,y+10);
with (obj_microsleigh2)
    draw_sprite(spr_shadow,6,x,y+10);
with (obj_merrydoom)
    draw_sprite(spr_shadow,6,x+1,y+8);
with (obj_presentelf){
    if (state==1)
        draw_sprite(spr_shadow,4,x+1,y+2);
    }
with (obj_presentelf2){
    zd=4+z/60;
    if (zd<0)
        zd=0;
    draw_sprite(spr_shadow,zd,x+1,y+2);
    }
with (obj_nerd){
    if (z>0)
        draw_sprite(spr_shadow,6,x,y+4);
    }
with (obj_microtop)
    draw_sprite(spr_shadow,7,x+1,y+9);
with (obj_microeliminator)
    draw_sprite(spr_shadow,6,x+1,y+12);
with (obj_microgoo){
    if (wait>38)
        draw_sprite(spr_shadow,0,x+1,y+6);
    else if (wait>36)
        draw_sprite(spr_shadow,1,x+1,y+6);
    else if (wait>34)
        draw_sprite(spr_shadow,2,x+1,y+6);
    else
        draw_sprite(spr_shadow,4,x+1,y+6);
    }
with (obj_micropitch){
    if (z>0)
        draw_sprite(spr_shadow,7,x+1,y+7);
    }
with (obj_microfrilly)
    draw_sprite(spr_shadow,6,x,y+10);

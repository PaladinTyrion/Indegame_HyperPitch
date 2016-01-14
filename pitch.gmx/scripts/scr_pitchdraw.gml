//PILEDRIVEN ENEMY
//1 = elf
//2 = top
//3 = snake
//4 = bulb
//5 = train
//6 = terminator elf
//7 = crawler
//8 = sleigh
//9 = wall cannon
//10 = elite sleigh
//11 = mega turret
//12 = walker
//13 = heavy train
//14 = merry doom
//16 = spacenerd
//80 = microsleigh
//81 = microsleigh2
//82 = microelf
//83 = microtop
//84 = microcrawler
//85 = microcar
//87 = microeliminator
//88 = microgoo
//89 = microwalker
//90 = micropitch

if (piledriving && !throwenemydead){
    if (throwenemy){
        if (smashdir==1)
            throwenemyx+=6;
        else
            throwenemyx-=6;
        throwxoff=throwenemyx;
        throwyoff=throwenemyy;
        throwenemyz-=10;
        throwzoff=throwenemyz;
        }
    else{
        throwxoff=x;
        throwyoff=y;
        throwzoff=z;
        }
    if (penemytype==1){
        if (peliteelf)
            draw_sprite(spr_p_eliteelf,penemyimg,throwxoff-5+pexoff*10,throwyoff-throwzoff);
        else
            draw_sprite(spr_p_elf,penemyimg,throwxoff-5+pexoff*10,throwyoff-throwzoff);
        }
    else if (penemytype==2)
        draw_sprite(spr_p_top,penemyimg,throwxoff-5+pexoff*10,throwyoff-throwzoff);
    else if (penemytype==3)
        draw_sprite(spr_p_snake,penemyimg,throwxoff-7+pexoff*15,throwyoff-throwzoff);
    else if (penemytype==4)
        draw_sprite(spr_p_bulb,penemyimg,throwxoff-5+pexoff*10,throwyoff-throwzoff);
    else if (penemytype==5){
        draw_sprite(spr_p_train,penemyimg,throwxoff-5+pexoff*10,throwyoff-throwzoff);
        if (penemyimg2==1 && penemyimg>3)
            draw_sprite(spr_sleighgun,12,throwxoff-9+pexoff*20,throwyoff-throwzoff-2);
        }
    else if (penemytype==6)
        draw_sprite(spr_p_terminatorelf,penemyimg,throwxoff-5+pexoff*10,throwyoff-throwzoff);
    else if (penemytype==7){
        draw_sprite(spr_p_crawler,penemyimg,throwxoff-6+pexoff*12,throwyoff-throwzoff);
        draw_sprite(spr_sleighgun,12,throwxoff-11+pexoff*22,throwyoff-throwzoff-2);
        }
    else if (penemytype==8){
        draw_sprite(spr_p_sleigh,penemyimg,throwxoff-10+pexoff*21,throwyoff-throwzoff);
        draw_sprite(spr_sleighgun,12,throwxoff-9+pexoff*19,throwyoff-throwzoff-14);
        }
    else if (penemytype==9)
        draw_sprite(spr_p_wallcannon,penemyimg,throwxoff-6+pexoff*12,throwyoff-throwzoff);
    else if (penemytype==10){
        draw_sprite(spr_p_elitesleigh,penemyimg,throwxoff-10+pexoff*21,throwyoff-throwzoff);
        draw_sprite(spr_sleighgun,12,throwxoff-9+pexoff*19,throwyoff-throwzoff-14);
        }
    else if (penemytype==11)
        draw_sprite(spr_megaturret,penemyimg,throwxoff-10+pexoff*24,throwyoff-throwzoff);
    else if (penemytype==12)
        draw_sprite(spr_p_walker,penemyimg,throwxoff-16+pexoff*34,throwyoff-throwzoff);
    else if (penemytype==13){
        draw_sprite(spr_p_heavytrain,penemyimg,throwxoff-6+pexoff*12,throwyoff-throwzoff);
        if (penemyimg<3){
            draw_sprite(spr_sleighgun,12,throwxoff-12+pexoff*10,throwyoff-throwzoff-32);
            draw_sprite(spr_sleighgun,12,throwxoff-12+pexoff*10,throwyoff-throwzoff-22);
            draw_sprite(spr_sleighgun,12,throwxoff-12+pexoff*10,throwyoff-throwzoff-12);
            }
        }
    else if (penemytype==14)
        draw_sprite(spr_p_merrydoom,penemyimg,throwxoff-6+pexoff*14,throwyoff-throwzoff);
    else if (penemytype==16)
        draw_sprite(spr_p_nerd,penemyimg,throwxoff-5+pexoff*11,throwyoff-throwzoff);
    else if (penemytype==80){
        draw_sprite(spr_p_sleigh,penemyimg,throwxoff-10+pexoff*21,throwyoff-throwzoff);
        draw_sprite(spr_sleighgun,12,throwxoff-9+pexoff*19,throwyoff-throwzoff-14);
        }
    else if (penemytype==81)
        draw_sprite(spr_atomicbulb,0,throwxoff-5+pexoff*10,throwyoff-throwzoff);
    else if (penemytype==82)
        draw_sprite(spr_microelf,8,throwxoff-4+pexoff*11,throwyoff-throwzoff);
    else if (penemytype==83)
        draw_sprite(spr_microtop,0,throwxoff-8+pexoff*16,throwyoff-throwzoff-4);
    else if (penemytype==84){
        draw_sprite(spr_p_microcrawler,penemyimg,throwxoff-6+pexoff*12,throwyoff-throwzoff);
        draw_sprite(spr_sleighgun,12,throwxoff-11+pexoff*22,throwyoff-throwzoff-2);
        }
    else if (penemytype==85)
        draw_sprite(spr_p_microcar,penemyimg,throwxoff-8+pexoff*16,throwyoff-throwzoff-2);
    else if (penemytype==87)
        draw_sprite(spr_p_microeliminator,0,throwxoff-5+pexoff*11,throwyoff-throwzoff);
    else if (penemytype==88)
        draw_sprite(spr_microgoo,3,throwxoff-6+pexoff*12,throwyoff-throwzoff);
    else if (penemytype==89)
        draw_sprite(spr_p_walker,penemyimg,throwxoff-16+pexoff*34,throwyoff-throwzoff);
    else if (penemytype==90)
        draw_sprite(spr_p_micropitch,0,throwxoff-6+pexoff*13,throwyoff-throwzoff);
    }

//Normal and Blink
draw_sprite(sprite_index,image_single,round(x),round(y-z));
idle-=1;
if (idle<=0){
    idle=10+random(130);
    }
if (idle<2 && speed==0 && !docounter && !piledriving && (global.ignoreall || (!pleft && !pright && !pup && !pdown)))
    draw_sprite(sprite_index,64+lookdir,round(x),round(y));

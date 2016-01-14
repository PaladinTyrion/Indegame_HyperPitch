//HOLDSTRING
codestring="";
keyboard_string="";

//JOYPAD
scr_joycreate();

//INIT LEVEL DATA
instance_create(0,0,obj_shadow);
instance_create(0,0,obj_pickupper);
if (global.demomode || global.foundsecret)
    tile_layer_hide(50);
if (global.gmversion==5){
    view_left[0]=x;
    view_top[0]=y;
    }
else if (global.gmversion==8){
    view_xview[0]=x;
    view_yview[0]=y;
    }
instance_deactivate_all(1);
instance_activate_region(x,y,319,239,1);
instance_activate_object(obj_activateme);
instance_activate_object(obj_spawner);
instance_deactivate_object(obj_s_crawler);
instance_deactivate_object(obj_s_sleigh);
instance_deactivate_object(obj_s_wallcannon);
instance_deactivate_object(obj_s_megaturret);
instance_deactivate_object(obj_s_walker);
instance_deactivate_object(obj_s_heavytrain);
instance_deactivate_object(obj_s_merrydoom);
instance_deactivate_object(obj_s_presentelf);
instance_deactivate_object(obj_s_barrel);
instance_deactivate_object(obj_s_barrel2);
instance_deactivate_object(obj_spawnmicroboss);
alarm[1]=2;
background_visible[1]=0;
roomx=x/320;
roomy=y/240;
scr_specialrooms();
global.nodmgrooms=0;
//Pitch starts outside room, that doesn't count for nodmgrooms
if (obj_pitch.x<x+32 || obj_pitch.x>x+288 || obj_pitch.y<y+32 || obj_pitch.y>y+208)
    global.nodmgrooms=-1;
dmgroom=0;
dub1=" ";
dub2=" ";
selected=0;
secretlevel=0; //turned on by obj_annihilator
obj_pitch.weapon=global.startweapon;

//PITCH ARRIVES ON CATSTRIKE
if (global.level==1){
    ignorescore=1;
    global.ignoreall=1;
    obj_pitch.visible=false;
    (instance_create(obj_pitch.x,obj_pitch.y,obj_spawnpitch)).nopain=1;
    }

//PITCH SPAWN IN LEVEL 4 AND 5
if (global.level==4 || global.level==5){
    obj_pitch.alarm[1]=40;
    obj_pitch.alarm[2]=10;
    obj_pitch.visible=0;
    global.ignoreall=1;
    instance_create(obj_pitch.x,obj_pitch.y,obj_portalappear);
    }

//DEMO MODE
if (global.demomode){
    global.ignoreall=1;
    obj_pitch.visible=true;
    with (obj_spawnpitch)
        instance_destroy();
    background_visible[2]=1;
    alarm[2]=1;
    obj_pitch.alarm[5]=10 //pain
    //Choose room
    if (room==rom_stage1){
        if (global.demoroom==0){
            x=640;
            y=480;
            obj_pitch.x=960;
            obj_pitch.y=624;
            }
        else if (global.demoroom==1){
            x=640;
            y=960;
            obj_pitch.x=800;
            obj_pitch.y=960;
            }
        else if (global.demoroom==2){
            x=640;
            y=240;
            obj_pitch.x=752;
            obj_pitch.y=240;
            }
        else if (global.demoroom==3){
            x=960;
            y=960;
            obj_pitch.x=1040;
            obj_pitch.y=960;
            }
        }
    else if (room==rom_stage2){
        if (global.demoroom==0){
            x=960;
            y=240;
            obj_pitch.x=960;
            obj_pitch.y=384;
            }
        else if (global.demoroom==1){
            x=1280;
            y=240;
            obj_pitch.x=1280;
            obj_pitch.y=352;
            }
        else if (global.demoroom==2){
            x=960;
            y=480;
            obj_pitch.x=1120;
            obj_pitch.y=720;
            }
        else if (global.demoroom==3){
            x=320;
            y=720;
            obj_pitch.x=320;
            obj_pitch.y=912;
            }
        }
    else if (room==rom_stage3){
        if (global.demoroom==0){
            x=0;
            y=720;
            obj_pitch.x=224;
            obj_pitch.y=720;
            }
        else if (global.demoroom==1){
            x=320;
            y=720;
            obj_pitch.x=640;
            obj_pitch.y=832;
            }
        else if (global.demoroom==2){
            x=320;
            y=240;
            obj_pitch.x=640;
            obj_pitch.y=400;
            }
        else if (global.demoroom==3){
            x=640;
            y=240;
            obj_pitch.x=880;
            obj_pitch.y=240;
            }
        }
    }
//LEVEL MUSIC
else{
    if (global.level==1)
        scr_wantsong(0);
    else if (global.level==2)
        scr_wantsong(2);
    else if (global.level==3)
        scr_wantsong(3);
    else if (global.level==4)
        scr_wantsong(4);
    else if (global.level==5)
        scr_wantsong(5);
    }

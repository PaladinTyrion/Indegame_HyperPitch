if (global.showfps){
    if (argument0==0)
        sfpsyoff=236; //Not ingame
    else
        sfpsyoff=220; //Ingame
    if (global.gmversion==5){
        draw_sprite(spr_scorenumber,floor(fps/10),299+view_left[0],sfpsyoff+view_top[0]);
        draw_sprite(spr_scorenumber,fps mod 10,303+view_left[0],sfpsyoff+view_top[0]);
        draw_sprite(spr_scorenumber2,0,308+view_left[0],sfpsyoff+view_top[0]);
        }
    else if (global.gmversion==8){
        draw_sprite(spr_scorenumber,floor(fps/10),299+view_xview[0],sfpsyoff+view_yview[0]);
        draw_sprite(spr_scorenumber,fps mod 10,303+view_xview[0],sfpsyoff+view_yview[0]);
        draw_sprite(spr_scorenumber2,0,308+view_xview[0],sfpsyoff+view_yview[0]);
        }
    }

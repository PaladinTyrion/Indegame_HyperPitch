//scr_drawtext(x,y,string,sep,w,sprite,firstchar)
//original by Captain Goodnight, optimized for HPP by DCR

drstr=argument2;
if (drstr="")
    return 0;
count=0;
check="";
lines=0;
for (drti=0; drti<string_length(drstr); drti+=1){
    check=string_char_at(drstr,drti+1)
    if (check="#"){
        count=0;
        lines+=1;
        }
    else{
        draw_sprite(argument5,ord(check)-argument6,argument0+(8*count),argument1+(lines*argument3));
        count+=1;
        }
    }

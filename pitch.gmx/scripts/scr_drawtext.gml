//scr_drawtext(x,y,string,sep,w,sprite,firstchar)
//original by Captain Goodnight, optimized for HPP by DCR

if (argument_count > 7) {
    trush=argument[7];
}

drstr=argument[2];

width=argument[4];

if (drstr=="")
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
        draw_sprite(argument[5],ord(check)-argument[6],argument[0]+(8*count),argument[1]+(lines*argument[3]));
        count+=1;
        }
    }

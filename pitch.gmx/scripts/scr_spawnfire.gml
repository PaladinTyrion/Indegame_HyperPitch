if (instance_number(obj_fire)<200){
    if (!place_meeting(x,y,obj_pitchblock) && !place_meeting(x,y,obj_block)){
        tempf=floor(random(2))+2;
        repeat(3)
            instance_create(bbox_left+random(bbox_right-bbox_left)-3+random(6),bbox_top+random(bbox_bottom-bbox_top)+4-2+random(4),obj_fire);
        }
    }

//Leads a shot at Pitch. If Pitch keeps her current speed and direction
//when the shot is fired, she will get hit unless she's faster
//than the bullet.
//argument0 = x
//argument1 = y
//argument2 = bulletspeed
//argument3 = factor of difference
//argument4 = max degree difference
// returns direction
tempdir=point_direction(argument0,argument1,obj_pitch.x,obj_pitch.y);
tempdir2=(obj_pitch.speed/argument2)*sin((degtorad(obj_pitch.direction-tempdir)));
if (abs(tempdir2)>=1)
    return -1;
else{
    tempdir3=radtodeg(arcsin(tempdir2))*argument3;
    if (tempdir3<-argument4)
        tempdir3=-argument4;
    if (tempdir3>argument4)
        tempdir3=argument4;
    tempdir+=tempdir3;
    return tempdir;
    }

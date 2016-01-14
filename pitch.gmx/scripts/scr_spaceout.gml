//Adds spaces for results screen numbers
temptext="";
if (argument0<1000000 && argument1==7) //Points only
    temptext+=" ";
if (argument0<100000)
    temptext+=" ";
if (argument0<10000)
    temptext+=" ";
if (argument0<1000)
    temptext+=" ";
if (argument0<100)
    temptext+=" ";
if (argument0<10)
    temptext+=" ";
temptext+=string(argument0);
return temptext;

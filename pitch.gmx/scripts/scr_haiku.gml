//argument0 = checksum
//argument1 = row (0-2)
//returns string

checkstring=string(argument0);
temptext="";

//ROW 0
if (argument1==0){
    tmp=string_char_at(checkstring,1);
         if (tmp=="0") temptext+="Big "; //Impossible
    else if (tmp=="1") temptext+="Small ";
    else if (tmp=="2") temptext+="Brave ";
    else if (tmp=="3") temptext+="Stout ";
    else if (tmp=="4") temptext+="Nice ";
    else if (tmp=="5") temptext+="Dull ";
    else if (tmp=="6") temptext+="Bold ";
    else if (tmp=="7") temptext+="Pink ";
    else if (tmp=="8") temptext+="Odd ";
    else if (tmp=="9") temptext+="Weird ";
    
    tmp=string_char_at(checkstring,2);
         if (tmp=="0") temptext+="guarding ";
    else if (tmp=="1") temptext+="barring ";
    else if (tmp=="2") temptext+="locking ";
    else if (tmp=="3") temptext+="saving ";
    else if (tmp=="4") temptext+="zealous ";
    else if (tmp=="5") temptext+="caring ";
    else if (tmp=="6") temptext+="sealing ";
    else if (tmp=="7") temptext+="steeling ";
    else if (tmp=="8") temptext+="rambling ";
    else if (tmp=="9") temptext+="winding ";
    
    tmp=string_char_at(checkstring,3);
         if (tmp=="0") temptext+="checksum";
    else if (tmp=="1") temptext+="savefile";
    else if (tmp=="2") temptext+="cipher";
    else if (tmp=="3") temptext+="secret";
    else if (tmp=="4") temptext+="encode";
    else if (tmp=="5") temptext+="hash sum";
    else if (tmp=="6") temptext+="lyric";
    else if (tmp=="7") temptext+="haiku";
    else if (tmp=="8") temptext+="ditty";
    else if (tmp=="9") temptext+="poem";
    }

//ROW 1
if (argument1==1){
    tmp=string_char_at(checkstring,4);
         if (tmp=="0") temptext+="The ";
    else if (tmp=="1") temptext+="Her ";
    else if (tmp=="2") temptext+="His ";
    else if (tmp=="3") temptext+="Their ";
    else if (tmp=="4") temptext+="This ";
    else if (tmp=="5") temptext+="Yon ";
    else if (tmp=="6") temptext+="One ";
    else if (tmp=="7") temptext+="Some ";
    else if (tmp=="8") temptext+="That ";
    else if (tmp=="9") temptext+="My ";
    
    tmp=string_char_at(checkstring,5);
         if (tmp=="0") temptext+="health bar ";
    else if (tmp=="1") temptext+="elf hat ";
    else if (tmp=="2") temptext+="bowbomb ";
    else if (tmp=="3") temptext+="rainbow ";
    else if (tmp=="4") temptext+="power ";
    else if (tmp=="5") temptext+="word list ";
    else if (tmp=="6") temptext+="train track ";
    else if (tmp=="7") temptext+="catstrike ";
    else if (tmp=="8") temptext+="space nerd ";
    else if (tmp=="9") temptext+="present ";
    
    tmp=string_char_at(checkstring,6);
         if (tmp=="0") temptext+="cleans up ";
    else if (tmp=="1") temptext+="falls down ";
    else if (tmp=="2") temptext+="grows up ";
    else if (tmp=="3") temptext+="implodes ";
    else if (tmp=="4") temptext+="kabooms ";
    else if (tmp=="5") temptext+="explodes ";
    else if (tmp=="6") temptext+="blows up ";
    else if (tmp=="7") temptext+="mutates ";
    else if (tmp=="8") temptext+="derails ";
    else if (tmp=="9") temptext+="flies off ";
    
    tmp=string_char_at(checkstring,7);
         if (tmp=="0") temptext+="with grace";
    else if (tmp=="1") temptext+="flatly";
    else if (tmp=="2") temptext+="firmly";
    else if (tmp=="3") temptext+="oddly";
    else if (tmp=="4") temptext+="finely";
    else if (tmp=="5") temptext+="nicely";
    else if (tmp=="6") temptext+="wildly";
    else if (tmp=="7") temptext+="soundly";
    else if (tmp=="8") temptext+="with joy";
    else if (tmp=="9") temptext+="with style";
    }

//ROW 2
if (argument1==2){
    tmp=string_char_at(checkstring,8);
         if (tmp=="0") temptext+="A cat ";
    else if (tmp=="1") temptext+="Bunny ";
    else if (tmp=="2") temptext+="Moustache ";
    else if (tmp=="3") temptext+="Nothing ";
    else if (tmp=="4") temptext+="Doctor ";
    else if (tmp=="5") temptext+="Quartet ";
    else if (tmp=="6") temptext+="Boat ride ";
    else if (tmp=="7") temptext+="Science ";
    else if (tmp=="8") temptext+="Princess ";
    else if (tmp=="9") temptext+="Mayor ";
    
    tmp=string_char_at(checkstring,9);
         if (tmp=="0") temptext+="of ";
    else if (tmp=="1") temptext+="in ";
    else if (tmp=="2") temptext+="on ";
    else if (tmp=="3") temptext+="from ";
    else if (tmp=="4") temptext+="at ";
    else if (tmp=="5") temptext+="with ";
    else if (tmp=="6") temptext+="for ";
    else if (tmp=="7") temptext+="is ";
    else if (tmp=="8") temptext+="was ";
    else if (tmp=="9") temptext+="means ";
    
    tmp=string_char_at(checkstring,10);
         if (tmp=="0") temptext+="a hat";
    else if (tmp=="1") temptext+="some style";
    else if (tmp=="2") temptext+="stitches";
    else if (tmp=="3") temptext+="crazy";
    else if (tmp=="4") temptext+="pitchin'";
    else if (tmp=="5") temptext+="smack talk";
    else if (tmp=="6") temptext+="tickets";
    else if (tmp=="7") temptext+="meaning";
    else if (tmp=="8") temptext+="value";
    else if (tmp=="9") temptext+="Sweden";
    }

return (temptext);

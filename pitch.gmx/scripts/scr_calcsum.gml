//argument0 is string to work with
//sets var checksum

//1
checksum=0;
check=0;
for (i=1;i<221;i+=1){
    check+=ord(string_char_at(argument0,i))*i;
    }

//2
if (string_char_at(string(check),3)=="0")
    check+=313;
else if (string_char_at(string(check),3)=="1")
    check+=211;
else if (string_char_at(string(check),3)=="2")
    check+=417;
else if (string_char_at(string(check),3)=="3")
    check+=672;
else if (string_char_at(string(check),3)=="4")
    check+=984;
else if (string_char_at(string(check),3)=="5")
    check+=219;
else if (string_char_at(string(check),3)=="6")
    check+=755;
else if (string_char_at(string(check),3)=="7")
    check+=106;
else if (string_char_at(string(check),3)=="8")
    check+=887;
else if (string_char_at(string(check),3)=="9")
    check+=299;

//3
repeat(10){
    if (string_length(string(check))<10){
        if (string_char_at(string(check),3)=="0")
            mult=8;
        else if (string_char_at(string(check),3)=="1")
            mult=9;
        else if (string_char_at(string(check),3)=="2")
            mult=2;
        else if (string_char_at(string(check),3)=="3")
            mult=3;
        else if (string_char_at(string(check),3)=="4")
            mult=4;
        else if (string_char_at(string(check),3)=="5")
            mult=5;
        else if (string_char_at(string(check),3)=="6")
            mult=6;
        else if (string_char_at(string(check),3)=="7")
            mult=7;
        else if (string_char_at(string(check),3)=="8")
            mult=8;
        else if (string_char_at(string(check),3)=="9")
            mult=9;
        check*=mult;
        }
    }

//4
if (string_char_at(string(check),2)=="0")
    check+=27;
else if (string_char_at(string(check),2)=="1")
    check+=92;
else if (string_char_at(string(check),2)=="2")
    check+=13;
else if (string_char_at(string(check),2)=="3")
    check+=36;
else if (string_char_at(string(check),2)=="4")
    check+=11;
else if (string_char_at(string(check),2)=="5")
    check+=50;
else if (string_char_at(string(check),2)=="6")
    check+=45;
else if (string_char_at(string(check),2)=="7")
    check+=74;
else if (string_char_at(string(check),2)=="8")
    check+=68;
else if (string_char_at(string(check),2)=="9")
    check+=89;

//5
check+=real(string_char_at(string(check),real(string_char_at(string(check),4))));


checksum=check;

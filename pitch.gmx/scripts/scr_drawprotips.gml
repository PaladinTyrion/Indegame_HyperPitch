//Fetch text for protips
for (i=0;i<19;i+=1){
    menutext[i]="";
    menutext2[i]="";
    }

menutext[0]="PROTIPS";
menutext[2]="COUNTER/PILEDRIVER:";
menutext[3]="press $&^] or $&]^ when not firing";
menutext[4]="land on an x to get hidden powerups";

if (global.highestdiff>=1){
    menutext[6]="SECRET LEVEL/TRUE ENDING:";
    menutext[7]="counter the giant rainbow laser";
    }
else
    menutext2[6]="CLEAR "+global.difname[1]+" FOR MORE";

if (global.highestdiff>=2){
    menutext[9]="SUMMON GODDESS (ONCE PER GAME):";
    menutext[10]="press $$&&^]^] when not firing";
    }
else
    menutext2[9]="CLEAR "+global.difname[2]+" FOR MORE";

if (global.highestdiff>=3){
    menutext[12]="CHEAT CODES (ENTER DURING PLAY):";
    menutext[13]="rgiosa rgcats rgfill rggive";
    menutext[14]="rgcell rgwish rgxces";
    }
else
    menutext2[12]="CLEAR "+global.difname[3]+" FOR MORE";

if (global.highestdiff>=4){
    menutext[16]="REALLYJOEL'S MOM DIFFICULTY:";
    menutext[17]="hold ] on the difficulty selection";
    menutext[18]="screen for ten seconds";
    }
else{
    if (global.highestdiff<3)
        menutext2[15]="CLEAR "+global.difname[4]+" FOR MORE";
    else
        menutext2[16]="CLEAR "+global.difname[4]+" FOR MORE";
    }

pages=38;
text2="";
winimgcyc+=1;
if (winimgcyc==4){
    winimgcyc=0;
    winimg=1-winimg;
    }

if (page==0) draw_sprite(spr_awinnerisyou,winimg,x-10,y-16);
else if (page==1){ draw_sprite(spr_elf,0,x-10,y); draw_sprite(spr_eliteelf,0,x+10,y);}
else if (page==2) draw_sprite(spr_top,0,x,y);
else if (page==3) draw_sprite(spr_snake,1,x,y+1);
else if (page==4) draw_sprite(spr_bulb,14,x,y);
else if (page==5){ draw_sprite(spr_train,0,x-14,y-2); draw_sprite(spr_train,0,x,y-2); draw_sprite(spr_train,2,x+14,y-2);}
else if (page==6) draw_sprite(spr_terminatorelf,0,x,y);
else if (page==7){ draw_sprite(spr_crawler,0,x,y+1); draw_sprite(spr_sleighgun,0,x,y-3);}
else if (page==8){ draw_sprite(spr_sleigh,4,x,y); draw_sprite(spr_sleighgun,0,x-6,y);}
else if (page==9) draw_sprite(spr_wallcannon,0,x-8,y-8);
else if (page==10){ draw_sprite(spr_elitesleigh,4,x,y); draw_sprite(spr_sleighgun,0,x-6,y);}
else if (page==11) draw_sprite(spr_megaturret,0,x,y+1);
else if (page==12){ draw_sprite(spr_walker,0,x,y-2); draw_sprite(spr_walkertag,0,x,y-2);}
else if (page==13){ draw_sprite(spr_heavytrain,0,x,y-1); draw_sprite(spr_sleighgun,0,x-10,y-6); draw_sprite(spr_sleighgun,0,x,y-6); draw_sprite(spr_sleighgun,0,x+10,y-6);}
else if (page==14) draw_sprite(spr_merrydoom,5,x,y);
else if (page==15) draw_sprite(spr_presentelf,0,x,y+4);
else if (page==16) draw_sprite(spr_nerd,0,x,y);
else if (page==17){ draw_sprite(spr_sleigh,4,x,y); draw_sprite(spr_sleighgun,0,x-6,y); draw_sprite(spr_atomicbulb,0,x-11,y-20); draw_sprite(spr_atomicbulb,0,x+11,y+20); draw_sprite(spr_atomicbulb,0,x-28,y+8); draw_sprite(spr_atomicbulb,0,x+28,y-8);}
else if (page==18) draw_sprite(spr_microelf,0,x,y+1);
else if (page==19){ draw_sprite(spr_bulb,17,x,y); draw_sprite(spr_bulb,18,x-6,y-10); draw_sprite(spr_bulb,18,x+6,y+10); draw_sprite(spr_bulb,18,x+10,y-6); draw_sprite(spr_bulb,18,x-10,y+6); draw_sprite(spr_bulb,19,x+22,y); draw_sprite(spr_bulb,19,x-22,y);}
else if (page==20) draw_sprite(spr_microtop,0,x,y+3);
else if (page==21){ draw_sprite(spr_microcrawler,0,x,y+1); draw_sprite(spr_sleighgun,0,x,y-3);}
else if (page==22) draw_sprite(spr_microcar,0,x,y+4);
else if (page==23) draw_sprite(spr_microsaucer,0,x,y);
else if (page==24) draw_sprite(spr_microeliminator,4,x,y);
else if (page==25) draw_sprite(spr_microgoo,3,x,y);
else if (page==26){ draw_sprite(spr_walker,0,x,y-2); draw_sprite(spr_megaturret,11,x+1,y-4);}
else if (page==27) draw_sprite(spr_micropitch,6,x,y+3);
else if (page==28) draw_sprite(spr_microfrilly,8,x,y-1);
else if (page==29){ draw_sprite(spr_crewelf,1,x+9,y-7); draw_sprite(spr_ultrasleigh,0,x,y+17); draw_sprite(spr_ultrasleighgun,0,x+16,y-21);}
else if (page==30) draw_sprite(spr_atomicelf,0,x,y+6);
else if (page==31) draw_sprite(spr_annihilator,0,x,y+6);
else if (page==32){ draw_sprite(spr_santa,0,x,y+16); draw_sprite(spr_santaelbow,0,x-28,y+16); draw_sprite(spr_santaelbow,0,x+28,y+16); draw_sprite(spr_santahandright,3,x-48,y+8); draw_sprite(spr_santahandleft,3,x+48,y+8);}
else if (page==33){ draw_sprite(spr_p_bulb,3,x+19,y-4); draw_sprite(global.pitchsprite,76,x+13,y-4);  draw_sprite(global.pitchsprite,74,x-15,y+2); }
else if (page==34){ draw_sprite(global.pitchsprite,78,x-6,y-6); draw_sprite(spr_p_merrydoom,0,x+5,y+5); }
else if (page==35) draw_sprite(global.pitchsprite,0,x,y);
else if (page==36){ draw_sprite(spr_pickup,16,x-16,y); draw_sprite(spr_pickup,17,x,y); draw_sprite(spr_pickup,18,x+16,y);}
else if (page==37){ draw_sprite(spr_redbrick,0,x-16,y); draw_sprite(spr_iceblast,3,x,y); draw_sprite(spr_laser,6,x+16,y);}


//COVER
draw_sprite(spr_hudbottom,3,x-88,y-48);
draw_sprite(spr_hudbottom,3,x-8,y-48);
draw_sprite(spr_hudbottom,3,x+8,y-48);
draw_sprite(spr_hudbottom,0,x-88,y-32);
draw_sprite(spr_hudbottom,0,x-8,y-32);
draw_sprite(spr_hudbottom,0,x+8,y-32);
for (i=1;i<5;i+=1){
    draw_sprite(spr_hudbottom,0,x-88,y+i*16);
    draw_sprite(spr_hudbottom,0,x-8,y+i*16);
    draw_sprite(spr_hudbottom,0,x+8,y+i*16);
    }

//TEXT
pagetext="   PAGE ";
if (page<9)
    pagetext+=" ";
pagetext+=string(page+1)+"/"+string(pages);
scr_drawtext(x-63,y-29,pagetext,12,17,spr_text2,32);
 if (page==0) text="MY NAME IS edward#morgan. I'M IN THIS#SECRET ROOM FOR#HAVING THE HIGHEST#DONATION TO THE#PREVENT CANCER#FOUNDATION DURING THE#IJI RUN OF THE 2012#SPEED DEMOS ARCHIVE#MARATHON. RESPECT.";
 if (page==1) text="mecha elf#HP: 2#POINTS: 12##MECHA SANTA'S MAIN#WORKFORCE. SOME ARE#TOUGHER THAN THE#REST, AND HAVE A#1/1200 CHANCE OF#APPEARING.";
 if (page==2) text="top#HP: 1#POINTS: 15##SPINNING TOPS FITTED#WITH SPIKES TO COMBAT#PITCH.";
 if (page==3) text="hatsnake#HP: 4#POINTS: 25##WHY EXACTLY THESE#WERE BUILT, OR WHAT#THEY ARE SUPPOSED TO#RESEMBLE, REMAINS A#MYSTERY.";
 if (page==4) text="bulb#HP: 4#POINTS: 33##WEAPONIZED HOLIDAY#DECORATIONS WITH A#TASTE FOR ROYAL#DEMIGODDESSES.";
 if (page==5) text="toy train#HP: 4/6/8/10#POINTS: 20##COMES IN FOUR COLORS:#GREEN, RED, BLUE AND#YELLOW. EACH COLOR OF#TRAIN CARRIES A#DIFFERENT WEAPON.";
 if (page==6) text="elfinator#HP: 10#POINTS: 99##MECHA SANTA'S#ANTI-PITCH SHOCK#TROOPS.";
 if (page==7) text="crawling cannon#HP: 16#POINTS: 150##STARTS MOVING AFTER A#WHILE, HUGGING THE#WALLS AND FIRING A#SCATTERSHOT CANNON.";
 if (page==8) text="sleigh#HP: 12#POINTS: 180##A STAPLE OF HOLIDAY#DESTRUCTION. WHOPEE!";
 if (page==9) text="wall cannon#HP: 12#POINTS: 200##NOT THE BIGGEST OF#THREATS, EXCEPT THE#RARE ONES ARMED WITH#HOMING BULLETS.";
if (page==10) text="elite sleigh#HP: 16#POINTS: 250##THESE SLEIGHS ARE#FRUSTRATINGLY GOOD AT#PREDICTING PITCH'S#MOVEMENTS.";
if (page==11) text="mega turret#HP: 24#POINTS: 320##ITS MASSIVE, HOMING#SHOTS CANNOT BE#DESTROYED BY THE#ICETHROWER.";
if (page==12) text="walker#HP: 48#POINTS: 350##BIG, TOUGH, HARD TO#PILEDRIVE. THE COLOR#OF ITS STRIPES#REVEALS WHAT WEAPON#IT COMES EQUIPPED#WITH.";
if (page==13) text="heavy train#HP: 32#POINTS: 400##BLUE ONES CAN FIRE#THROUGH WALLS, WHILE#THE YELLOW ONES USE#HOMING BULLETS.";
if (page==14) text="merry doom#HP: 48#POINTS: 777##'TAKES CARE' OF THE#NAUGHTY LIST EACH#YEAR. 'NUFF SAID.";
if (page==15) text="present elf#HP: 1#POINTS: 1000##THESE FLEE AS SOON AS#PITCH FIRES HER#WEAPON - SHE NEEDS TO#SNEAK UP ON THEM#INSTEAD.";
if (page==16) text="space nerd#HP: 1#POINTS: 10##A LITTLE-KNOWN#CHARACTER, NOW IN#WIND-UP TOY FORM.#THEY'RE SO WEAK,#ATTACKS RIP RIGHT#THROUGH THEM.";
if (page==17) text="sleigher#HP: 24#POINTS: 2000##PROTECTED BY#SPIKEBALLS, BUT#OTHERWISE WIMPY.";
if (page==18) text="macho elf#HP: 32#POINTS: 2000##AN INEXPLICABLE#FEELING OF#SATISFACTION ENGULFS#ANYONE WHO MANAGES#TO PILEDRIVE THIS#GUY.";
if (page==19) text="vortex#HP: 8*9#POINTS: 222*9##WHEN MECHA SANTA RAN#OUT OF IDEAS, HE#SIMPLY GLUED A BUNCH#OF SMALLER ROBOTS#TOGETHER FOR THE#ANTI-PITCH DEFENSE#SYSTEM.";
if (page==20) text="giant top#HP: 48#POINTS: 2000##WHEN MECHA SANTA WAS#REALLY SCRAPING THE#BOTTOM OF THE IDEA#BARREL, HE SIMPLY#MADE ONE OF HIS#DEFENSE ROBOTS#BIGGER.";
if (page==21) text="heavy armored crawler#HP: 32#POINTS: 2000##FITTING A CRAWLING#CANNON WITH ARMOR AND#JET BOOSTERS SEEMED#LIKE A GOOD IDEA AT#THE TIME, MECHA SANTA#THOUGHT.";
if (page==22) text="elf car#HP: 96#POINTS: 2000##EVERY ELF JUMPING OUT#OF THIS CAR LOWERS#ITS SCORE VALUE BY#12, SO THE TOTAL#POINT REWARD REMAINS#THE SAME.";
if (page==23) text="elf saucer#HP: 64#POINTS: 2000##MECHA ELVES ARE#CREATIVE AND HARD#WORKING. SOMETIMES#THEIR INVENTIONS EVEN#MANAGE TO NOT EXPLODE#INSTANTLY.";
if (page==24) text="elimitator#HP: 64#POINTS: 2000##SUPPRESSED MEMORIES#RESURFACE AT THE MERE#SIGHT OF HIM#- MEMORIES OF A#BLACK AND WHITE#NEMESIS AND ANGERED#SHOUTS OF 'YOU!'.";
if (page==25) text="gray goo#HP: 4*50#POINTS: 40*50##A NANOTECHNOLOGY#EXPERIMENT GONE#WRONG, ISOLATED TO A#ROOM IN STAGE 3.";
if (page==26) text="devastator#HP: 80#POINTS: 2000##DESIGNED AND BUILT BY#FRILLY HAT ELF, IT'S#SIMPLY A WALKER WITH#A REPAINTED HEAVY#TURRET ON TOP.";
if (page==27) text="mecha pitch#HP: 80#POINTS: 2000##CREATED BY FRILLY HAT#ELF. UNLIKE PITCH, IT#DOES NOT CONSIST OF#50% EXPLOSIONS AND#50% PILEDRIVERS,#PUTTING IT AT A#SEVERE DISADVANTAGE.";
if (page==28) text="frilly hat elf#HP: 80#POINTS: 2000##A MECHA ELF WHO#DONNED A FRILLY HAT#AND THUS GAINED#SUPERPOWERS. NO-ONE#DARED CALL HER#'FRALLAN' AGAIN,#WHATEVER THAT MEANS.";
if (page==29) text="ultra sleigh#HP: 400#POINTS: 5000##SOMETIMES YOU JUST#NEED A LITTLE MORE#SLEIGH. THE CANNONEER#LEAVES HIMSELF OPEN#TO ATTACK AT THE VERY#START OF THE FIGHT...";
if (page==30) text="atomic elf#HP: 300#POINTS: 5000##THIS ROCKET-PUNCHING#BRUTE HAS ENDED MANY#AN INTRUSION. HIS#MEGA TURRETS DO NOT#AWARD POINTS WHEN#DESTROYED.";
if (page==31) text="steam annihilator#HP: 500#POINTS: 5000##WHEN MECHA SANTA#AWOKE ONE MORNING,#SOMEONE HAD PUT TANK#TREADS ON A GIANT#MECHA ELF HEAD.#WHATEVER KEEPS THE#BIRDS OFF THE ROOF.";
if (page==32) text="mecha santa#HP: 700#POINTS: 5000##GRAND MASTER OF#CHEER. SEEKER OF#WORLD PEACE.#PRACTITIONER OF#FIFTEEN SECRET#SELF-DEFENSE#TECHNIQUES.";
if (page==33) text="super protip 1##WHILE IN COUNTER#STANCE ($&^] OR $&]^#WHEN NOT FIRING),#PITCH WILL BLOCK ANY#ATTACK AND CAN#PILEDRIVE ANY ENEMY#OR MINIBOSS IN THE#GAME - BUT NOT THE#FOUR MAIN BOSSES.";
if (page==34) text="super protip 2##PITCH CAN MOVE AROUND#WHILE PILEDRIVING AN#ENEMY. PRESS THE FIRE#KEY TO THROW THE#ENEMY LEFT OR RIGHT.";
if (page==35) text="super protip 3##ON THE 'GODDESS OF#EXPLOSIONS'#DIFFICULTY, NO MATTER#WHICH PATH PITCH#TAKES THROUGH EACH#LEVEL, SHE MAY EARN#ROUGHLY THE SAME#AMOUNT OF POINTS.";
if (page==36) text="super protip 4##WHENEVER A RANDOM#PICKUP APPEARS, IT#HAS A 1/400 CHANCE OF#BECOMING ONE OF THE#THREE SECRET PICKUPS:#HYPER X (TEMPEST),#HYPER Y (DELUGE) AND#HYPER Z (CYCLONE).";
if (page==37) text="damage per second#BRICK: 20#ICETHROWER: 24#RAINBOW LASER: 24#POWER BRICK: 40#POWER ICE: 48#POWER RAINBOW: 57.1#GOLDBRICK: 32#TEMPEST: 134.4#DELUGE: 84#CYCLONE: 320";
scr_drawtext(x-83,y+21,text,13,21,spr_text2,32);

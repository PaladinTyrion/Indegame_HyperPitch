![Hyper Pitch](http://www.remar.se/daniel/siteimg/hppguide.gif)

## Hyper Pitch ##

Hyper Princess Pitch is a Daniel's Indegame.

The project proposes to contribute some new elements to Daniel's prototype.

According to Gamemaker, The IDE is a little rough so we cannot separate the scripts from the project. Therefore we upload all assets.

Development Notice:
- 
- Latest GameMaker Studio. It has been free for use, but only supported to publish on Windows.
- Reference： [Daniel's HOME](http://www.remar.se/daniel/pitch.php)

----------

#### Notice: ####

There are too many init problems. It comes because gm5/gm7 counld auto_init, but tragedy happens when we migrate the game from 5/7 to gms.
Recently we are devoted to fix init problems.

#### TODO ####

1. var other.barrel is not to be fixed. barrel means a barrel. other means the obj by collision.
2. passby maintitle, animation cannot be back to maintitle. 
3. if pitch hurts, cheer die.(src_pain:line 76 && line 60)
4. obj_ultrasleigh_StepEndEvent(line 2) - obj_elf;
5. src_sabotdraw(line 312) - obj_boss, but children of obj_boss should be here.
6. there is no victim instance, when src_stagecleardeaw is called Error occurs.
 
====================
Development notes:

2016.1.19 now entering game/ movements /shooting for 2weapons is okay.

2016.1.24 spawner is fixed. Pitch can win the first scense.

2016.1.25 stage1 can be finished approximately.
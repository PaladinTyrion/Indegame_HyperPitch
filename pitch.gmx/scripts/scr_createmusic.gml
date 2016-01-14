//Master music init
if (!global.musicinit){
    jbfmod_init(3,12);
    global.musicinit=1;
    
    if (file_exists("music\level1.xm"))
        jbfmod_load_song(1,"music\level1.xm");
    else
        jbfmod_load_song(1,"level1.xm");
    if (file_exists("music\level2.xm"))
        jbfmod_load_song(2,"music\level2.xm");
    else
        jbfmod_load_song(2,"level2.xm");
    if (file_exists("music\level3.xm"))
        jbfmod_load_song(3,"music\level3.xm");
    else
        jbfmod_load_song(3,"level3.xm");
    if (file_exists("music\level4.xm"))
        jbfmod_load_song(4,"music\level4.xm");
    else
        jbfmod_load_song(4,"level4.xm");
    if (file_exists("music\level5.xm"))
        jbfmod_load_song(5,"music\level5.xm");
    else
        jbfmod_load_song(5,"level5.xm");
    if (file_exists("music\title.xm"))
        jbfmod_load_song(6,"music\title.xm");
    else
        jbfmod_load_song(6,"title.xm");
    if (file_exists("music\intro.xm"))
        jbfmod_load_song(7,"music\intro.xm");
    else
        jbfmod_load_song(7,"intro.xm");
    if (file_exists("music\boss.xm"))
        jbfmod_load_song(8,"music\boss.xm");
    else
        jbfmod_load_song(8,"boss.xm");
    if (file_exists("music\finalboss.xm"))
        jbfmod_load_song(9,"music\finalboss.xm");
    else
        jbfmod_load_song(9,"finalboss.xm");
    if (file_exists("music\ending.xm"))
        jbfmod_load_song(10,"music\ending.xm");
    else
        jbfmod_load_song(10,"ending.xm");
    if (file_exists("music\gameover.xm"))
        jbfmod_load_song(11,"music\gameover.xm");
    else
        jbfmod_load_song(11,"gameover.xm");
    if (file_exists("music\results.xm"))
        jbfmod_load_song(12,"music\results.xm");
    else
        jbfmod_load_song(12,"results.xm");
    if (file_exists("music\goddess.xm"))
        jbfmod_load_song(13,"music\goddess.xm");
    else
        jbfmod_load_song(13,"goddess.xm");
    }

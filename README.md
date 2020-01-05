# SekiroSavesBackupAndRestore
Scripts of Windows CMD batch and bash to backup and restore save files of the game *Sekiro: Shadoes Die Twice*. These scripts deals with the save file you load with "Continue" in the main menu. They are not for profiles saves (`S0001.sl2`, `S0002.sl2`...)

## Mechanism
This is how Sekiro save files work, till Jan of 2020:
 - When you choose "Continue" in the main menu, you load `S0000.sl2` file in `C:\Users\<your-username-here>\AppData\Roaming\Sekiro\76561198090276100` folder. The first part of this path equals to system variable "APPDATA". This save file will take to *exactly* the location and state where you exited the game last time. A good use of this save, is exiting the game just before any boss fight.
 - In current version("App v1.04"), you will also see `S0000.sl2.bak` file, which is used to validate `S0000.sl2`. I guess it is done when you "Press any key" after the title screen, before the main menu. If the content of two files does not match, it prompts that "You may not have exited the game correctly last time" and restore the last save with this `.bak` file. It often happens when you only replace the first file, but not the `.bak` file with your backup save file. So, replace those two, just as what I do in these scripts.
 - When you choose "Load" in the main menu, you can choose from the profiles saves, which are represented by `S0001.sl2`, `S0002.sl2`... files along side `S0000.sl2`, if you have started the game more than once. If you have only one progress, these files are not present. These saves only takes you to the last "buddha status" you have used. One thing to note is that the restore script does not help you to switch profile; if you are using profile A and restore a save file of profile B, you have to manually change profile using "Load game". 

## How to use
First, change the path to store the save file in the scripts, accordingly
### How to backup
1. Play game till some point you want to backup, and exit game
2. "Press any key" to enter main menu. At the right top corner of screen you will see "Verifying save file..." or something similar
3. You now reach the main menu. <kbd>Alt+tab</kbd> to switch to desktop
4. Run `backup_sekiro_saves.sh` or `backup_sekiro_saves.bat` by double clicking them. (If this does not work, you may need to open `gitbash` terminal first and use `./backup_sekiro_saves.sh`)
5. Type the name as identifier for this save, like "beginning" or "before red demon"
6. The save file will be copied to the path you set.
7. You can safely enter game and continue playing.

### How to restore
1. Exit game
2. Press any key to enter main menu. At the right top corner of screen you will see "Verifying save file..." or something similar
3. You now reach the main menu. <kbd>Alt+tab</kbd> to switch to desktop
4. Run `restore_sekiro_saves.sh` or `restore_sekiro_saves.bat` by double clicking them. (If this does not work, you may need to open `gitbash` terminal first and use `./restore_sekiro_saves.sh`)
5. Choose the save file to restore and press Enter
6. After all is done, go back to game and "Continue"

## Files and explanation
This repo contains 4 files, two `bat` scripts only to use in Windows, and two `.sh` scripts to use under Linux or Windows when you have bash environment installed. (Till now Sekiro is not natively supported in GNU/Linux, but who knows, maybe one day... )

In the bash scripts I use map/table which is only available in bash v4.0 above, so make sure you have that. `Git for windows` normally gives you `GNU bash v4.4` so there is no problem. You can check with `bash -version`. 

Change the path of backup/restore accordingly in two scripts.

Some notes:
- The cmd batch can be run in `cmd.exe`
- The bash scripts should be run in `gitbash`, or WSL applications "Ubuntu for Windows". 
- When you back up save file with a name, Unicode characters(CJK ones, for example) are supported as long as your OS supports it. But to correctly show them in cmd screen, remember that you still need proper CJK font installed for cmd. For Chinese I use "Yahei Mono" or "Simsun".

# SekiroSavesBackupAndRestore
Scripts of Windows CMD batch and bash to backup and restore save files of the game *Sekiro: Shadoes Die Twice*. These scripts deals with the save file you load with "Continue" in the main menu. They are not for profiles saves (`S0001.sl2`, `S0002.sl2`...)

## Mechanism
This is how Sekiro save files work, till June of 2019:
 - When you choose "Continue" in the main menu, you load `S0000.sl2` file in `C:\Users\<your-username-here>\AppData\Roaming\Sekiro\76561198090276100` folder. The first part of this path equals to system variable "APPDATA". This save file will take to *exactly* the location and state where you exited the game last time. A good use of this save, is exiting the game just before any boss fight.
 - In current version("App v1.04"), you will also see `S0000.sl2.bak` file, which is used to validate `S0000.sl2`. I guess it is done when you "Press any key" after the logo CG and before being able to use main menu. If the content of two files does not match, it prompts that "You may not have exited the game correctly last time" and restore the last save with this `.bak` file. It often happens when you only replace the first file, but not the `.bak` file with your backup save file. So, replace those two, just as what I do in these scripts.
 - When you choose "Load" in the main menu, you can choose from the profiles saves, which are represented by `S0001.sl2`, `S0002.sl2`... files along side `S0000.sl2`, if you have started the game more than once. If you have only one progress, these files are not present. These saves only takes you to the last "buddha status" you have used. I consider them not so important so I don't include this part in the scripts.

## How to use
First, change the path to store the save file in the scripts, accordingly
### How to backup
1. Play game till some point you want to backup, and exit game
2. "Press any key" to enter main menu. At the right top corner of screen you will see "Verifying save file..." or something similar
3. You now reach the main menu. Alt+tab to switch to desktop
4. Run `backup_sekiro_saves.sh` or `backup_sekiro_saves.bat` by double clicking them. (If this does not work, you may need to open `gitbash` terminal first and use `./backup_sekiro_saves.sh`)
5. Type the name as identifier for this save, like "beginning" or "red demon"
6. The save file will be copied to the path you set.

### How to restore
1. exit game
2. "Press any key" to enter main menu. At the right top corner of screen you will see "Verifying save file..." or something similar
3. You now reach the main menu. `Alt+tab` to switch to desktop
4. Run `restore_sekiro_saves.sh` by double clicking them. (If this does not work, you may need to open `gitbash` terminal first and use `./restore_sekiro_saves.sh`)
5. Choose the save file to restore and press enter
6. After all is done, go back to game and "Continue"

## Files and explanation
This repo contains three files:
 - cmd script to backup save file
 - bash script to backup save file, and
 - bash script to restore save file
Change the path of backup/restore accordingly in two scripts.

I don't see how to restore the save files with purely `cmd` syntax due to the lack of table/map in native `cmd`. The only way I know, is to iterate the files while counting at the same time, and iterating them again when you restore, which is very superfluous to me and it fails me at last. Meanwhile, table/map is available in bash v4.0 so I used that.

Some notes:
- The cmd batch can be run in `cmd.exe`
- The bash scripts should be run in `gitbash`, or WSL applications like "Ubuntu for Windows", like "./xxx.sh".
- When you back up save file with a name, Unicode characters(CJK ones, for example) are support. At least in Windows 10. 
- Some alternative terminal in Windows, such as `Cmder`, can also run `.bat` as well as `.sh` files, but for the latter ones, you need to have `gitbash` or other bash installed to be able to use `bash`, and then you invoke bash like `bash -C xxx.sh`. 

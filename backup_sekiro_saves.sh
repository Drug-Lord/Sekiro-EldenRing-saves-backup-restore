#!/bin/sh
# Author: github.com/WesleyBlancoYuan

# Recommended to run with gitbash, or "Ubuntu for Windows", or any
# equivalent Linux bash in Windows
# all windows path are annotated with "/", not Windows classical "\"

# adapt as your needs
BACKUP_PATH=/e/games/sekiro_saves
# $APPDATA points to "/c/Users/your-user-name-here/AppData/Roaming"
SAVE_PATH=$APPDATA/Sekiro/76561198090276100

# read new name to identify. Unicode characters are allowed, for example CJK
read -p "Backup save file to $BACKUP_PATH with this name: " FILENAME
# it is not allowed to "copy and rename" when dest is not same dir(stupid), so we have
# to copy and rename(mv). Use "cp -f" to overwrite
cp -v "$SAVE_PATH/S0000.sl2" $BACKUP_PATH
cd $BACKUP_PATH
mv S0000.sl2 $FILENAME.sl2
echo Latest save copied to "$BACKUP_PATH/$FILENAME.sl2"

#!/bin/sh

# Recommended to run with gitbash, or "Ubuntu for Windows", or any
# equivalent Linux bash in Windows
# all windows path are annotated with "/", not Windows classical "\"
# to be compatible with (future possible) Linux path

echo 
echo '=================================================='
echo '=================================================='
echo '=====     Sekiro: Shadow die twice(tm)       ====='
echo '=====         Backup your save file          ====='
echo '=====                                        ====='
echo '=====                  by                    ====='
echo '=====                                        ====='
echo '=====      github.com/WesleyBlancoYuan       ====='
echo '=================================================='
echo '=================================================='
echo 

# adapt as your needs
DEST=/e/games/sekiro_saves
# $APPDATA points to "/c/Users/<your-username>/AppData/Roaming"
# always the same
SOURCE=$APPDATA/Sekiro/76561198090276100

# read new name to identify. Unicode characters are allowed, for example CJK
read -p "Backup save file to $DEST with this name: " FILENAME
# it is not allowed to "copy and rename" when DEST is not same dir(stupid), so we have
# to copy and rename(mv). Use "cp -f" to overwrite
cp -v "$SOURCE/S0000.sl2" $DEST
cd $DEST
mv S0000.sl2 $FILENAME.sl2
echo Latest save copied to "$DEST/$FILENAME.sl2"
sleep 5 # wait 5 sec and close
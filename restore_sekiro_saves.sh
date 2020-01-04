#!/bin/sh
# Author: github.com/WesleyBlancoYuan

# Recommended to run with gitbash, or "Ubuntu for Windows", or any
# equivalent Linux bash in Windows
# all windows path are annotated with "/", not Windows classic "\"

# adapt as your needs
SOURCE=/e/games/sekiro_saves
DEST=$APPDATA/Sekiro/76561198090276100
# declare a table, for bash v4.0 above
declare -A saves
i=0
for file in $SOURCE/*.sl2 
do
    let i++
    saves[$i]=$file
    echo "[$i] $file"
done

read -p "Choose which save file to restore? " INDEX
TORESTORE=${saves[$INDEX]}
echo File to restore: $TORESTORE
# pattern to get filename
FILENAME="$(echo ${TORESTORE##*/})"

# it is not allowed to "copy and rename" when dest is not same dir(stupid), so we have
# to copy and rename(mv). Use "cp -f" to overwrite
cp -v $TORESTORE $DEST
cd $DEST
mv -v $FILENAME S0000.sl2 # mv overwrites without prompt
# now source file is renamed, we must copy to get a bak; note now cp can work to rename! stupid
cp -f -v S0000.sl2 S0000.sl2.bak
echo Latest save file restored with $TORESTORE

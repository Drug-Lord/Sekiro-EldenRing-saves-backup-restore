@echo off
echo:
echo ==================================================
echo ==================================================
echo =====     Sekiro: Shadow die twice(tm)       =====
echo =====         Backup your save file          =====
echo =====                                        =====
echo =====                  by                    =====
echo =====                                        =====
echo =====      github.com/WesleyBlancoYuan       =====
echo ==================================================
echo ==================================================
echo:

REM adapt as your needs
set DEST=e:\games\sekiro_saves
REM SOURCE is always the same
set SOURCE=%APPDATA%\Sekiro\76561198090276100

set /p NAME="Backup save file to %DEST% with this name: "
copy /-Y "%SOURCE%\S0000.sl2" "%DEST%\%NAME%.sl2"
echo Latest save copied to "%DEST%\%NAME%.sl2"
TIMEOUT /T 5 
exit

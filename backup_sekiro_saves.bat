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
set dest=e:\games\sekiro_saves
REM source is always the same
set source=%APPDATA%\Sekiro\76561198090276100

set /p name="Backup save file to %dest% with this name: "
copy "%source%\S0000.sl2" "%dest%\%name%.sl2"
echo Latest save copied to "%dest%\%name%.sl2"
TIMEOUT /T 5 
exit
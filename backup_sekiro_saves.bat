@echo off
chcp 936
set backup-path=e:\games\sekiro_saves
set /p name="Backup save file to %backup-path% with this name: "
copy "%APPDATA%\Sekiro\76561198090276100\S0000.sl2" "%backup-path%\%name%.sl2"
echo Latest save copied to "%backup-path%\%name%.sl2"
pause.
@echo OFF
echo:
echo ==================================================
echo ==================================================
echo =====     Sekiro: Shadow die twice(tm)       =====
echo =====         Restore your save file         =====
echo =====                                        =====
echo =====                  by                    =====
echo =====                                        =====
echo =====      github.com/WesleyBlancoYuan       =====
echo ==================================================
echo ==================================================
echo:

REM for counter expansion in the loop
setlocal enabledelayedexpansion

REM check choice for letters of YES and NO
for /f "tokens=1,2 delims=[,]" %%a in ('"choice <nul 2>nul"') do set "yes=%%a" & set "no=%%b"

:begin
REM adapt as your needs
set SOURCE=e:\games\sekiro_saves
REM destination is always the same
set DEST=%APPDATA%\Sekiro\76561198090276100

set /A counter=1
REM loop in the save files we have backed up to show options
for /r %SOURCE% %%G in (*.sl2) do (
    REM delayed expansion(!var!) in each loop, not always 0
    echo [!counter!] %%~nG%%~xG             
    set /A counter=counter+1
)

REM because in cmd Map/table is not supported, we have to loop again to choose the file.
REM we hope that during the time of execution of last loop to here, there is no change 
REM of number/order of files in the source dir.
set /A counter2=1
set /p index="Which save file to restore? "
REM echo Chosen index: %index%
set TORESTORE=
for /r %SOURCE% %%H in (*.sl2) do (
    if !counter2! EQU %index% (
        REM fullpath: drive + path + filename + extension
        set TORESTORE=%%~dH%%~pH%%~nH%%~xH
        REM hide options at the end; show Y/N/A letters; timeout 10s; default choice N
        REM ERRORLEVEL should be delayed to expand, too. 1 for Y, 2 for N, and 3 for A. 
        choice /n /c %yes%%no%a /t 10 /d %no% /m "Save file to restore: !TORESTORE!. Press [%yes%] to confirm, [%no%] to choose again, or [A] to abort: "
        if !ERRORLEVEL! EQU 2 (
            goto :begin
        ) else if !ERRORLEVEL! EQU 1 (
            goto :process
        ) else (
            echo Aborted, nothing is copied.
            TIMEOUT /T 5 
            exit
        )
        
    )
    set /A counter2=counter2+1
)
REM if selected index is out of range
echo No matching save file with index %index% is found!
echo:
goto :begin

:process
copy %TORESTORE% %DEST%\S0000.sl2
copy %TORESTORE% %DEST%\S0000.sl2.bak
echo Latest save file restored with %TORESTORE%
TIMEOUT /T 5 
exit
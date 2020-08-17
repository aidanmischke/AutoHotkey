For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-3 delims=/:/ " %%a in ('time /t') do (set mytime=%%a;%%b %%c)

copy "C:\Users\%username%\Documents\My Games\Company of Heroes Relaunch\playback\temp.rec" "C:\Users\%username%\Documents\My Games\Company of Heroes Relaunch\playback\coh replay %mydate% @ %mytime%.rec"

REM echo "%mydate% %mytime%"
REM @echo off
REM echo Press any key to exit
REM pause > nul
REM cls
REM exit
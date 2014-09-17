@echo off
cd /d %~dp0
java -jar SystemTraySample2.jar %* >> %~dpn0.log 2>&1
echo %DATE% %TIME% %ERRORLEVEL% >> %~dpn0.log

@echo off
setlocal enabledelayedexpansion
:: ֱ�� goto gotAdmin
goto gotAdmin
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (goto UACPrompt) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:: �����ע�͵���
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"
@start "" "mstsc.exe" >nul 2>nul
ECHO.
ECHO   ������ɣ��˳�...
ECHO.
TIMEOUT /T 3 /nobreak >NUL & EXIT

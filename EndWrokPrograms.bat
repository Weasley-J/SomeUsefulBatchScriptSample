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
TITLE �رհ칫����        %date%  %time%
ECHO.
ECHO   �رճ���...
ECHO.
taskkill /f /im "notepad++.exe" >nul 2>nul
taskkill /f /im "UCBrowser.exe" >nul 2>nul
taskkill /f /im "360chrome.exe" >nul 2>nul
taskkill /f /im "firefox.exe" >nul 2>nul
taskkill /f /im "eclipse.exe" >nul 2>nul
taskkill /f /im "idea64.exe" >nul 2>nul
taskkill /f /im "Foxmail.exe" >nul 2>nul
taskkill /f /im "Studio 3T.exe" >nul 2>nul
taskkill /f /im "p4v.exe" >nul 2>nul
taskkill /f /im "mongod.exe" >nul 2>nul
taskkill /f /im "explorer.exe" >nul 2>nul
@start "" "explorer.exe" >nul 2>nul
ECHO.
ECHO   ��ɣ��˳�...
ECHO.
TIMEOUT /T 3 /nobreak >NUL & taskkill /f /im "cmd.exe" >nul 2>nul

:: This batch script makes the Caché application deployment much faster by building, importing and
:: exporting the XML the project. Replace the path below to your Caché installation and
:: build & import application to Caché using only one command.

:: Latest NodeJS & Caché 2016.2+ IS REQUIRED TO PROCEED
@echo off

:: CHANGE THIS PATH TO YOUR CACHÉ INSTALLATION PATH ON WINDOWS (folder that contains bin, CSP, mgr and other folders)
set CACHE_DIR=C:\Program Files\InterSystems\Ensemble
:: NAMESPACE TO IMPORT PACKAGE TO
set NAMESPACE=USER
:: Other variables
set BUILD_DIR=build\cls
:: Export
set XML_EXPORT_DIR=build

:: Build and import application to Caché
echo Building the project...
npm run gulp && ^
echo s st = $system.Status.GetErrorText($system.OBJ.ImportDir("%~dp0%BUILD_DIR%",,"ck")) w "IMPORT STATUS: "_$case(st="",1:"OK",:st) halt | "%CACHE_DIR%\bin\cache.exe" -s "%CACHE_DIR%\mgr" -U %NAMESPACE%
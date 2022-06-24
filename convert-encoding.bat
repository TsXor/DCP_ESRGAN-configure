@echo off
chcp 65001 && cls
cd %~dp0
move helper_script\DCP_run.vbs helper_script\DCP_run.vbs.bak
PowerShell -Command "& {get-content helper_script\DCP_run.vbs.bak -encoding utf8 | set-content helper_script\DCP_run.vbs -encoding default}"
del /q helper_script\DCP_run.vbs.bak
move env\env_create.bat env\env_create.bat.bak
PowerShell -Command "& {get-content env\env_create.bat.bak -encoding utf8 | set-content env\env_create.bat -encoding default}"
del /q env\env_create.bat.bak

@echo off
chcp 65001 && cls
cd %~dp0

move helper_script\DCP_run.vbs helper_script\DCP_run.vbs.bak
PowerShell -Command "& {get-content helper_script\DCP_run.vbs.bak -encoding utf8 | set-content helper_script\DCP_run.vbs -encoding default}"
del /q helper_script\DCP_run.vbs.bak

move env\env_create.bat env\env_create.bat.bak
type env\env_create.bat.bak | find /v "" > env\env_create.bat
del /q env\env_create.bat.bak

move env\env_create.bat env\env_create.bat.bak
PowerShell -Command "& {get-content env\env_create.bat.bak -encoding utf8 | set-content env\env_create.bat -encoding default}"
del /q env\env_create.bat.bak

move env\E&D-setup.bat env\E&D-setup.bat.bak
type env\E&D-setup.bat.bak | find /v "" > env\E&D-setup.bat
del /q env\E&D-setup.bat.bak

move env\E&D-setup.bat env\E&D-setup.bat.bak
PowerShell -Command "& {get-content env\E&D-setup.bat.bak -encoding utf8 | set-content env\E&D-setup.bat -encoding default}"
del /q env\E&D-setup.bat.bak

move helper_script\run.bat helper_script\run.bat.bak
type helper_script\run.bat.bak | find /v "" > helper_script\run.bat
del /q helper_script\run.bat

move helper_script\ESRGAN_run.bat helper_script\ESRGAN_run.bat.bak
type helper_script\ESRGAN_run.bat.bak | find /v "" > helper_script\ESRGAN_run.bat
del /q helper_script\ESRGAN_run.bat

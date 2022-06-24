@echo off
call conda activate ESRGAN
python %~dp0ESRGAN/ESRGAN_run.py

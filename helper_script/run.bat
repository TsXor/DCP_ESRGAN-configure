chcp 65001 && cls
@echo off
cd %~dp0DeepCreamPy-main
echo 激活环境
call conda activate DCP 1>NUL 2>NUL
echo 运行DCP
python main.py

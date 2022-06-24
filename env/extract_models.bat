@echo off
cd %~dp0
if not exist selected_path_for_ED (
        echo 未找到您先前选择的路径，请检查是否执行第6步。
        goto END
)
set /p selected_path=<selected_path_for_ED
7za x models_ESRGAN.7z -r -o%selected_path%\ESRGAN
7za x models_DCP.7z -r -o%selected_path%\DeepCreamPy\DeepCreamPy-main
:END
pause&exit /b

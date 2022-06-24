@echo off
cd %~dp0
echo 请选择ESRGAN与DeepCreamPy的安装位置，将占用空间不到10MB，您想放哪都行
for /f "delims=" %%a in ('mshta "%~f0"') do set selected_path=%%a
echo 您选择了路径：%selected_path%
echo 正在下载ESRGAN和DeepCreamPy
aria2c --max-concurrent-downloads=16 --split=16 --max-connection-per-server=16 --dir=%selected_path% --disable-ipv6 https://download.fastgit.org/SatyamSSJ10/DeepCreamPy/archive/refs/heads/main.zip
aria2c --max-concurrent-downloads=16 --split=16 --max-connection-per-server=16 --dir=%selected_path% --disable-ipv6 https://download.fastgit.org/joeyballentine/ESRGAN/archive/refs/heads/master.zip
echo 正在安装ESRGAN和DeepCreamPy
powershell -command "Expand-Archive %selected_path%\ESRGAN-master.zip %selected_path%\ESRGAN"
powershell -command "Expand-Archive %selected_path%\DeepCreamPy-main.zip %selected_path%\DeepCreamPy"
xcopy ..\helper_script %selected_path%
move %selected_path%\ESRGAN_run.py %selected_path%\ESRGAN
move %selected_path%\run.config %selected_path%\ESRGAN
move %selected_path%\run.bat %selected_path%\DeepCreamPy
mkdir %selected_path%\ESRGAN\models
mkdir %selected_path%\io

SETLOCAL ENABLEDELAYEDEXPANSION
SET LinkName=ESRGAN
SET Esc_LinkDest=%%HOMEDRIVE%%%%HOMEPATH%%\Desktop\!LinkName!.lnk
SET Esc_LinkTarget=!selected_path!\ESRGAN_run.bat
SET cSctVBS=%TMP%\CreateShortcut.vbs
((
  echo Set oWS = WScript.CreateObject^("WScript.Shell"^) 
  echo sLinkFile = oWS.ExpandEnvironmentStrings^("!Esc_LinkDest!"^)
  echo Set oLink = oWS.CreateShortcut^(sLinkFile^) 
  echo oLink.TargetPath = oWS.ExpandEnvironmentStrings^("!Esc_LinkTarget!"^)
  echo oLink.Save
)1>!cSctVBS!
cscript //nologo .\!cSctVBS!

SET LinkName=DeepCreamPy
SET Esc_LinkDest=%%HOMEDRIVE%%%%HOMEPATH%%\Desktop\!LinkName!.lnk
SET Esc_LinkTarget=!selected_path!\DCP_run.vbs
SET cSctVBS=%TMP%\CreateShortcut.vbs
((
  echo Set oWS = WScript.CreateObject^("WScript.Shell"^) 
  echo sLinkFile = oWS.ExpandEnvironmentStrings^("!Esc_LinkDest!"^)
  echo Set oLink = oWS.CreateShortcut^(sLinkFile^) 
  echo oLink.TargetPath = oWS.ExpandEnvironmentStrings^("!Esc_LinkTarget!"^)
  echo oLink.Save
)1>!cSctVBS!
cscript //nologo .\!cSctVBS!

SETLOCAL ENABLEDELAYEDEXPANSION
SET LinkName=ESRGAN_输入
SET Esc_LinkDest=!selected_path!\io\!LinkName!.lnk
SET Esc_LinkTarget=!selected_path!\ESRGAN\input
SET cSctVBS=%TMP%\CreateShortcut.vbs
((
  echo Set oWS = WScript.CreateObject^("WScript.Shell"^) 
  echo sLinkFile = oWS.ExpandEnvironmentStrings^("!Esc_LinkDest!"^)
  echo Set oLink = oWS.CreateShortcut^(sLinkFile^) 
  echo oLink.TargetPath = oWS.ExpandEnvironmentStrings^("!Esc_LinkTarget!"^)
  echo oLink.Save
)1>!cSctVBS!
cscript //nologo .\!cSctVBS!

SET LinkName=ESRGAN_输出
SET Esc_LinkDest=!selected_path!\io\!LinkName!.lnk
SET Esc_LinkTarget=!selected_path!\ESRGAN\output
SET cSctVBS=%TMP%\CreateShortcut.vbs
((
  echo Set oWS = WScript.CreateObject^("WScript.Shell"^) 
  echo sLinkFile = oWS.ExpandEnvironmentStrings^("!Esc_LinkDest!"^)
  echo Set oLink = oWS.CreateShortcut^(sLinkFile^) 
  echo oLink.TargetPath = oWS.ExpandEnvironmentStrings^("!Esc_LinkTarget!"^)
  echo oLink.Save
)1>!cSctVBS!
cscript //nologo .\!cSctVBS!

SET LinkName=DeepCreamPy_输入
SET Esc_LinkDest=!selected_path!\io\!LinkName!.lnk
SET Esc_LinkTarget=!selected_path!\DeepCreamPy\DeepCreamPy-main\decensor_input
SET cSctVBS=%TMP%\CreateShortcut.vbs
((
  echo Set oWS = WScript.CreateObject^("WScript.Shell"^) 
  echo sLinkFile = oWS.ExpandEnvironmentStrings^("!Esc_LinkDest!"^)
  echo Set oLink = oWS.CreateShortcut^(sLinkFile^) 
  echo oLink.TargetPath = oWS.ExpandEnvironmentStrings^("!Esc_LinkTarget!"^)
  echo oLink.Save
)1>!cSctVBS!
cscript //nologo .\!cSctVBS!

SET LinkName=DeepCreamPy_输出
SET Esc_LinkDest=!selected_path!\io\!LinkName!.lnk
SET Esc_LinkTarget=!selected_path!\DeepCreamPy\DeepCreamPy-main\decensor_output
SET cSctVBS=%TMP%\CreateShortcut.vbs
((
  echo Set oWS = WScript.CreateObject^("WScript.Shell"^) 
  echo sLinkFile = oWS.ExpandEnvironmentStrings^("!Esc_LinkDest!"^)
  echo Set oLink = oWS.CreateShortcut^(sLinkFile^) 
  echo oLink.TargetPath = oWS.ExpandEnvironmentStrings^("!Esc_LinkTarget!"^)
  echo oLink.Save
)1>!cSctVBS!
cscript //nologo .\!cSctVBS!

SET LinkName=ED_输入输出
SET Esc_LinkDest=%%HOMEDRIVE%%%%HOMEPATH%%\Desktop\!LinkName!.lnk
SET Esc_LinkTarget=!selected_path!\io\
SET cSctVBS=%TMP%\CreateShortcut.vbs
((
  echo Set oWS = WScript.CreateObject^("WScript.Shell"^) 
  echo sLinkFile = oWS.ExpandEnvironmentStrings^("!Esc_LinkDest!"^)
  echo Set oLink = oWS.CreateShortcut^(sLinkFile^) 
  echo oLink.TargetPath = oWS.ExpandEnvironmentStrings^("!Esc_LinkTarget!"^)
  echo oLink.Save
)1>!cSctVBS!
cscript //nologo .\!cSctVBS!

DEL !cSctVBS! /f /q
)1>>NUL 2>>&1
pause&exit /b

<script>
var Shell = new ActiveXObject("Shell.Application");
var Folder = Shell.BrowseForFolder(0, "请选择文件夹", 0); //起始目录为：桌面
if (Folder != null) {
    Folder = Folder.items();
    Folder = Folder.item();
    Folder = Folder.Path;
    new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1).Write(Folder);
}
close();
</script>

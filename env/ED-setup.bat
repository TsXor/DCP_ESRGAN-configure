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
mkdir %selected_path%\ESRGAN\input
mkdir %selected_path%\ESRGAN\output
mkdir %selected_path%\io

nircmdc shortcut %selected_path%\ESRGAN_run.bat ~$folder.desktop$ ESRGAN
nircmdc shortcut %selected_path%\DCP_run.vbs ~$folder.desktop$ DeepCreamPy
nircmdc shortcut %selected_path%\ESRGAN\input %selected_path%\io ESRGAN_输入
nircmdc shortcut %selected_path%\ESRGAN\output %selected_path%\io ESRGAN_输出
nircmdc shortcut %selected_path%\DeepCreamPy\DeepCreamPy-main\decensor_input %selected_path%\io DeepCreamPy_输入
nircmdc shortcut %selected_path%\DeepCreamPy\DeepCreamPy-main\decensor_output %selected_path%\io DeepCreamPy_输出
nircmdc shortcut %selected_path%\io ~$folder.desktop$ ED_输入输出

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

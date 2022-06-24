@echo off
cd %~dp0
echo 正在换源，condarc将被覆盖
move condarc %USERPROFILE%\.condarc
echo 请选择环境安装位置，将占用空间约10GB，建议不要装在C盘
for /f "delims=" %%a in ('mshta "%~f0"') do set selected_path=%%a
echo 您选择了路径：%selected_path%
type ESRGAN.yaml.base > ESRGAN.yaml
echo prefix: %selected_path% >> ESRGAN.yaml
type DCP.yaml.base > ESRGAN.yaml
echo prefix: %selected_path% >> DCP.yaml
echo 调用anaconda创建环境
conda env create -f ESRGAN.yaml
conda env create -f DCP.yaml
echo 下载pytorch-cu111
echo 下载需要10~20分钟，请耐心等待
aria2c --max-concurrent-downloads=16 --split=16 --max-connection-per-server=16 --dir=%selected_path% --disable-ipv6 https://download.pytorch.org/whl/cu111/torch-1.9.0%2Bcu111-cp39-cp39-win_amd64.whl
aria2c --max-concurrent-downloads=16 --split=16 --max-connection-per-server=16 --dir=%selected_path% --disable-ipv6 https://download.pytorch.org/whl/cu111/torchvision-0.10.0%2Bcu111-cp39-cp39-win_amd64.whl
echo 为ESRGAN环境安装pytorch
call conda activate ESRGAN
pip install %selected_path%\torch-1.9.0+cu111-cp39-cp39-win_amd64.whl
pip install %selected_path%\torchvision-0.10.0+cu111-cp39-cp39-win_amd64.whl
pip install torchaudio
call conda deactivate
echo 完成
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

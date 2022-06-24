# DCP_ESRGAN-configure
此仓库的目的是尽可能的简化配置ESRGAN与DeepCreamPy（GPU运行）的步骤  
## 硬件要求
7系-20系的N卡，不包括gt1030和gt730（这种没门级您在想啥呢？？？）  
30系的N卡安装完后会跑不起来DeepCreamPy，原因是CUDA10.0并不支持30系，需要换用支持cuda11.x的专用版本的tensorflow v1：https://github.com/nvidia/tensorflow  
你可以尝试从这里下载whl并安装：https://github.com/fo40225/tensorflow-windows-wheel/tree/master/1.15.4+nv20.12/  
本项目并不会提供30系卡的支持，因为我没有
## 存储空间要求
约10G（没啥存不下的，存不下请花100买块ssd）

## 安装步骤：
### 1. 安装anaconda  
访问https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/?C=M&O=D ，找到格式类似：Anaconda3-xxxx-Windows-x86_64.exe且日期最新的文件，下载并安装。
### 2. 下载本仓库  
以zip形式下载本仓库，你应该知道该怎么做。
### 3. （重要）解压  
你可能觉得这不太重要，但你必须把zip文件完全解压才能进行下面的操作！
### 4. （非常重要）运行`windows_adapter.bat`  
双击运行即可。这个脚本十分重要，不运行会导致各种奇怪的报错！！！
### 5. 运行`env`目录中的`env_create.bat`
双击运行即可。紧盯cmd的黑窗口，里面会告诉你现在在干嘛
### 6. 运行`env`目录中的`ED-setup.bat`
同5
### 7. 装填模型
现在桌面上会出现“ESRGAN”、“DeepCreamPy”、“ED_输入输出”三个快捷方式。  
下载这2个文件：  
models_ESRGAN.7z：https://www.123pan.com/s/3J4rVv-blMnh 提取码:cRi1  
models_DCP.7z：https://www.123pan.com/s/3J4rVv-ZlMnh 提取码:isDE  
将这2个文件放入`env`文件夹中，双击运行`env`目录中的`extract_models.bat`。
### 8. Enjoy!
运行“DeepCreamPy”会过几秒才弹出窗口，这是正常的，因为激活环境需要时间。  
打开“ED_输入输出”，你会看到6个文件夹。其中4个是ESRGAN和DeepCreamPy的输入和输出文件夹。他俩都需要你把文件放到一个预先规定好的输入文件夹中，然后等到处理完，你就可以从输出文件夹中取出结果。另外2个是模型文件夹，你可以向其中添加自己喜欢的模型。  

## TODO
图形化ESRGAN参数调整

## 参考
https://github.com/lvl1scans/ESRGAN-colab

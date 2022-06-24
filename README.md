# DCP_ESRGAN-configure
## *施工中*
此仓库的目的是尽可能的简化配置ESRGAN与DeepCreamPy（GPU运行）的步骤  
硬件要求：7系-20系的N卡，不包括gt1030和gt730（这种没门级您在想啥呢？？？）  
30系的N卡安装完后会跑不起来DeepCreamPy，原因是CUDA10.0并不支持30系，需要换用支持cuda11.x的专用版本的tensorflow v1：https://github.com/nvidia/tensorflow  
存储空间要求：约10G

安装步骤：
1. 安装anaconda  
访问https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/?C=M&O=D ，找到格式类似：Anaconda3-xxxx-Windows-x86_64.exe且日期最新的文件，下载并安装。
2. 下载本仓库  
以zip形式下载本仓库，你应该知道该怎么做。
3. （重要）解压  
你可能觉得这不太重要，但你必须把zip文件完全解压才能进行下面的操作！

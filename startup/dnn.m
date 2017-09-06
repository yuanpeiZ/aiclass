
这个例子使用卷积神经网络来对webcam拍摄的物件进行辨识，该卷积神经网络已经预先使用百万张物体的图片训练好。

MATLAB上用十一行代码实现深度学习辨识物体


只需要下载并安装，安装完成后就可以在matlab中使用，对matlab的版本有所限制

工具：MATLAB 2016
设备：windows10电脑，网络摄像头

MATLAB2016b下载地址：
链接：http://pan.baidu.com/s/1pKEGfYr 密码：x05i

使用前需要先注册matworks的账号，然后才能安装webcam驱动，以及下载alexnet

ALEXNET下载地址：

Official:

https://www.mathworks.com/matlabcentral/fileexchange/59133-neural-network-toolbox-tm--model-for-alexnet-network?requestedDomain=www.mathworks.com&s_eid=PEP_12669

BaiduYun：

http://pan.baidu.com/s/1i5oexQt


-----------------------------------------------------------------------------------------------------------------
安装方式，拖入到matlab命令提示符行中
MATLAB上用十一行代码实现深度学习辨识物体

如果有USB WEBCAM支持未安装，那么运行时候会提示按步骤安装，需要登录帐号
 
 
 

 



先放上所有的.m代码：

clear;
camera=webcam; %connect to camera
nnet=alexnet;%load neural network,alexnet is a CNN,artist train it as millison of picture
%make a circle to reload frame from camera
while true 
    picture=camera.snapshot;
    picture=imresize(picture,[227,227]);%resize picture
    label=classify(nnet,picture);%
    image(picture);
    title(char(label));
    drawnow;
end

------------------------------------------------------------------------------------------------------------------


代码说明：

camera=webcam;     连接网络摄像头，如果有多个（比如笔记本电脑）的话需自行设定一下

nnet=alexnet;   实例化alexnet

接下来就是循环将摄像头每一个frame取出，利用刚才实例化的alexnet进行判别

while true 
    picture=camera.snapshot;    摄像头截图
    picture=imresize(picture,[227,227]);   重新设置图片大小减少计算量    
    label=classify(nnet,picture);%   利用实例化的神经网络对图片进行分类，分类得到结果保存为label
    image(picture);    显示图片
    title(char(label));    将label显示在标题部分（顶部）
    drawnow;   
end


DroidCam.Client.5.0.1
http://www.pudn.com/Download/item/id/2718254.html


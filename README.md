# citylife
基于flask的同城本地信息平台，毕业设计。示例搭建在阿里云上，带宽就1m有点慢：http://city.chincc.top

本项目支持布局自适应移动设备，但自适应是在bootstrap3的时候适配的，后期项目改用bootstrap4部分页面或功能未做自适应适配。

注册采用邮箱验证方式，杜绝机器人。


食用方法：

1.建citylife数据库，导入sql文件

2.安装各模块

3.将flask_bootstrap.zip解压，复制解压后里面static文件夹，打开Python模块安装目录(site-packages內)找到其中的flask_bootstrap文件夹，将static文件夹替换为刚才复制的。

4.打开config.py修改数据库配置

5.打开apps/tools/other_tool.py修改其中的send_email函数from_addr与qqCode变量，前者为邮箱后者为密码口令

6.运行app.py不出意外应该是能正常运行了

*有问题请联系chin.cc@outlook.in


首页，支持触底刷新更多
![Image text](https://github.com/chincccc/citylife/blob/main/pic/1.png)

和风天气，百度地图api及爬取的新闻热点
![Image text](https://github.com/chincccc/citylife/blob/main/pic/2.png)

发帖界面，支持富文本发布，支持上传帖子头图与在正文中插入图片
![Image text](https://github.com/chincccc/citylife/blob/main/pic/3.png)

个人消息界面
![Image text](https://github.com/chincccc/citylife/blob/main/pic/4.png)

实时私聊功能
![Image text](https://github.com/chincccc/citylife/blob/main/pic/5.png)

帖子详情界面
![Image text](https://github.com/chincccc/citylife/blob/main/pic/6.png)

### Kindle 越狱插件 File Browser 使用说明：  
------------
开始以下步骤前需确保你的 Kindle 已经成功 **越狱** ，越狱可参考 <https://bookfere.com/skills/jailbreak> ,并安装了 KUAL 插件。

**下载**: <https://github.com/Mingtu2019/Kindle-Filebrowser/releases/download/1.1.0/filebrowser_v1.1.0.7z>

**安装**: 下载插件压缩包，解压得到 filebrowser 文件夹，将其拷贝到 Kindle 根目录下的 extensions 目录中。

**介绍**:   

插件安装完成后，进入 Kindle 界面，打开 KUAL，可以在菜单中找到「File Browser」，可进行如下操作：  

   * 「 Start 」自动打开 WiFi,开启免登录的 Web 服务  

   * 「 Start (Auth) 」自动打开 WiFi,开启带登录验证的 Web 服务（默认用户名密码均为：admin）  

   * 「 Reset 」删除包含配置信息的数据文件 filebrowser.db  

   * 「 Keep WiFi 」停止 filebrowser，保持 WiFi运行，关闭屏幕常亮

   * 「 Stop 」停止 WEB 服务，关闭 WiFi 开启飞行模式，关闭 filebrowser，恢复屏幕自动关闭功能  

注: 
   1. 如果服务开启时设备 WiFi 处于关闭状态，WiFi 会被自动打开；在服务关闭后则自动关闭 WiFi。

   2. 开启 Web 服务后，可以在 Kindle 界面的顶部看到 IP 地址，在同一局域网下即可通过浏览器访问此地址。

   3. 服务开启后会阻止屏幕自动关闭，关闭 WiFi 或者开启飞行模式时会自动恢复。

   4. 服务开启后，将无法通过按键熄屏，只能在点按「 Stop 」后，才能正常熄屏。（算个bug，暂时不懂怎么改。）

-----------

详细说明及问题反馈：<https://bookfere.com/post/823.html>  

基于 <https://github.com/guo-yong-zhi/kindle-filebrowser> 更改

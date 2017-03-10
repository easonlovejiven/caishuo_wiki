常见问题详解：
1,bundle install的时候遇到：
    /Users/eason/.rvm/rubies/ruby-2.2.0/bin/ruby -r ./siteconf20150702-57281-hen5bz.rb extconf.rb
checking for gcc... yes
checking for Magick-config... no
checking for pkg-config... yes
checking for outdated ImageMagick version (<= 6.4.9)... *** extconf.rb failed ***
Could not create Makefile due to some reason, probably lack of necessary
libraries and/or headers.  Check the mkmf.log file for more details.  You may
need configuration options.

gem install rmagick -v '2.15.2’执行这个不行，因为宝rmagick依赖太多，要对依赖一个一个安装
解决方案如下
(1),brew install ImageMagick 已解决

2,服务器导出sql文件
(1),登陆服务器：ssh caishuo@192.168.1.10 -p 2002 登陆才说服务器端数据库 密码：caishuo
(2),导出需要的数据库：  (导出不在mysql命令下执行)
服务器上安装：
yum install ImageMagick

(3),在服务器上cp这个sql文件到本地：scp -P 2002 caishuo@testing.caishuo.com:/home/caishuo/caishuo.sql .
ssh owhat@10.171.34.43 -p 65535
scp -P 65535 owhat@10.171.34.43:/home/owhat/owhat3.sql .
scp -P 2002 caishuo@testing.caishuo.com:/home/caishuo/caishuo.sql .
(4)把本地文件cap到服务器上(在本地执行并且与所要拷贝文件处在同一级文件夹下)
scp fx_template.zip ubuntu@101.201.114.181:/var/www/fuxiong
ubuntu@101.201.114.181:/var/www/fuxiong 拷到这台服务器的/var/www/fuxiong 文件夹下

3,解决软链接
原文件夹地址 /home/ddfivfou/www/abc
新建一个软链接 /home/ddfivfou/public_html/abc
让/home/ddfivfou/public_html/abc 链接到 /home/ddfivfou/www/abc
ln -s /home/ddfivfou/www/abc /home/ddfivfou/public_html/abc
4,Uncaught TypeError: $(...).SiteSearch is not a function(待解决)
类似404的问题，跳转的页面写错了！！！
5,NoMethodError - undefined method `shipan_image_path’ （待解决）
6,ActiveRecord::StatementInvalid: Mysql2::Error: Incorrect string value:
mysql编码问题:
ALTER TABLE your_database_name.your_table CONVERT TO CHARACTER SET utf8
手动设置服务器端字符集
ArgumentError - First argument in form cannot contain nil or be empty
cancancan已经四年没更新了
Access denied for user ''@'localhost' to database ‘shop_development’
ALTER TABLE my_table CONVERT TO CHARACTER SET utf8 当遇到一张表不能插入中文字符时，可以尝试这个

select * from channel_codes where code like '%*_%' escape ‘*’ 当搜索英文下划线时候的问题
exception in initAndListen: 29 Data directory /data/db not found., terminating 启动mongo报错 mkdir -p /data/db

Unknown validator: 'DockDateValidator'

/Users/owhat/.rvm/bin/rvm: line 66: shell_session_update: command not found 解决办法：https://github.com/rvm/rvm/issues/3708

执行 sudo brew时遇到的问题
sudo chown -R $USER /usr/local
sudo chown -R $USER /Library/

mysql 安装之后启动

We've installed your MySQL database without a root password. To secure it run:
    mysql_secure_installation

To connect run:
    mysql -uroot

To have launchd start mysql at login:
  ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
Then to load mysql now:
  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
Or, if you don't want/need launchctl, you can just run:
  mysql.server start
==> Summary
🍺  /usr/local/Cellar/mysql/5.7.11: 12,812 files, 434.6M


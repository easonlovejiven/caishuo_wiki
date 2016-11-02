ow
----------------> mobile1
ssh owhat@10.171.34.43 -p 65535
用户名：owhat
密码：60b7bf43d68300505

登录mobile1 导出: mysqlowdump  -h 10.26.25.123 -u owhatm1 -p owhat3_staging1 > owhat3_staging1.sql
          导出密码: v7JomWme7zv 
          （导出数据是没有mysql的log记录的）

在本地capmobile1 导出的sql 文件  scp -P 65535 owhat@10.171.34.43:/home/owhat/owhat3_staging1.sql .

测试服务器启动es
cd /etc/init.d/elasticsearch start/restart

----------------> redmine 
ssh root@10.51.116.156 -p 65535
密码：60b7bf43d68300505

----------------> mobile2 环境
ssh owhat@10.171.76.16 -p 65535
mobile2的库用的是owhat3_staging2
查看log: tail -f log/staging.log

----------------> mobile3 环境
ssh owhat@10.172.165.169 -p 65535
同上

----------------> 线上环境
# pptd ip: 182.92.177.179  用户名:yuanjianhe 密码:de21a8a77e9e1229e633f0cbe894b41
ssh owhat@10.171.52.236 -p 65535

ip:10.171.52.236  端口:65535 用户名：owhat

线上项目地址 /mnt/webserver/www/owhat3/current/

线上sidekiq 配置ipsow
10.26.164.61
10.26.164.101
10.26.164.89
10.26.164.70
10.26.164.91
10.26.164.95

sidekiq监控界面
sidekiq: http://10.170.170.16/sidekiq
用户名/密码: sidekiqadmin/1c3cr34m


后台
web1	 10.171.52.236
web2	 10.171.50.18
web3	 10.172.239.37
web4	 10.171.8.136

android1 10.172.233.83
android2 10.172.239.132
android3 10.163.15.221
ios1     10.171.123.71
ios2     10.170.179.36
ios3	   10.170.170.16

登录线上mysql mysql -hlsbmysql.owhatinternal.cn -uowhat3 -p
登录mobile1 mysql -h10.26.25.123 -uowhatm1 -pv7JomWme7zv
mysql -h10.26.25.123 -u owhatm2 -p reS0ygecvq9c

aaaaaa_5G 无线密码:09812345
  
sidekiq.yml 里边儿最后那个参数配的是不同worker的权重

redmine 登录名和密码
yuanjianhe/y159357l

清除缓存
Rails.cache.delete(:key)
重置密码
account.update(password: '123456')
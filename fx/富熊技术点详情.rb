一 缓存相关
1, redis
基于内存，k-v存储，存取快，支持类型丰富
(1) 下载安装
(2) 配置redis缓存 # config/application.rb
(3) 命名空间 # config/initializers/redis.rb 
# 缓存系统
gem 'redis-objects'
gem 'redis-namespace'
gem 'redis-rails'
gem 'redis-activesupport'

2, rails
Rails.cache.fetch(key, expires_in: 1.hour) do; end # 自定义key, 自定义过期时间
Rails.cache.delete(key) / Rails.clear # 清除指定和所有缓存

# 根据业务需求哪些数据放到缓存

二 全站搜索
1, elasticsearch
gem 'searchkick'  # https://github.com/ankane/searchkick

三 后台任务
1, sidekiq # 基于redis 自定义worker scheduld定时器 自带的监控程序,安装sidekiq的时候会同时安装sinatra 一个视图程序 相应的配置文件和初始化文件
gem 'sidekiq'
gem 'sinatra'

四 文档性型数据库
orm 基于 mongoid
gem 'mongoid'

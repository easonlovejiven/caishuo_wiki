环境: ruby_2+rails_4
服务器: nginx+passenger
发布工具: cap/mina
版本控制工具: git
关系型数据库: mysql
nosql: mongodb
# 登陆注册: devise
# 权限相关: cancancan/pundit
缓存相关: redis/ActiveRecord 結合
全栈搜索: es/solr 再议
后台异步任务: sidekiq
图片上传: carrierwave+qiniu
短信第三方: Yunpian/Leancloud 结合 阿里大于
邮件第三方: send_cloud+action_mailer
消息推送: 极光
后台搜索插件: ransack

细节:

1,自定义log 方便检索错误
2, 每个model增加一个软删除字段 active

整体方向：
fx 整合 fuxiong -> 逻辑 -> api

表结构 -> model -> api
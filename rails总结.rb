frails  巧用总结
一次查询多个数据in用法:Model.where(id: array)/Model.where(“id in (?)”,array)
一次返回指定属性的数组:Model.pluck(“id,name”)/Model.all.map(&:id)
http://www.tuicool.com/articles/rayuim turbolinks（实现局部刷新的功能）
修改config里边儿的各种配置文件或者添加新的gem都要重新启动项目
config/initializers/eason.rb 在config/initializers文件夹里边儿的文件定义的各种类或者方法都可以随意使用(对文件名没有限制)比如对整个项目时间的处理
当第一次修改css全局样式的时候需要执行 ：bundle exec rake assets:precompile（让它加载相关的js/css文件）
scope:
(1) scope :big_roles, -> {where("roles.id > 2")} #找出id大于2的角色(不带参数)
(2) scope :get_roles, ->(role_id) { where(role_id: role_id) } #找出staffer里边儿不同角色的个数(带参数)
@model.valid? 等于 false的时候就证明 不是合法的对象@model.errors 就有相关的错误信息
rails 引用文件
<%= stylesheet_link_tag "jquery-ui" %>
<%= javascript_include_tag "jquery-ui.min" %>
<%= image_tag “”%>

私有方法可以在model的内部提供给各个方法调用，但是它不能用于实例方法调用

带条件修饰符的变量赋值语句， Ruby都会为其先赋值为nil，然后进行条件判断，若条件满足，再进行第二次赋值操作

一个对象的真正的类应该是它的eigenclass，而class只有在eigenclass不存在的时候才会作为该对象的类

有关ruby微信开发的
文档：https://github.com/lanrion/weixin_rails_middleware/wiki/Getting-Start
demo: https://github.com/lanrion/weixin_rails_middleware_examp

ruby 里边儿没有方法重写的概念当一个class中出现两个以上的同名方法时，只会执行最后一个

当定义已经存在的class时，ruby不会重新定义，它会“打开”这个class

scope 有参数和没有参数总结

scope :area, -> {where("id > 2")} #scope 没有参数的
scope :get_staffer_name, -> (role_id){Admin::Staffer.where("role_id = ?",role_id)}

find . -name ".git" | xargs rm -Rf 删除项目git版本(到项目根目录下执行)

ruby ||= 的意思是如果不存在的话，就执行后边儿的操作

:member 是对单个实体进行操作，创建路由格式是： /:controller/:id/:your_method 
:collection 是对实体集合进行操作，创建路由格式是： /:controller/:your_method 
:new 是新建一个实体，创建路由格式是： /:controller/:your_method/new

link_to 添加模版, new_admin_market_templete_path, class: action 

ruby sort方法:
sort方法可以加一个或者两个参数的block，这个block可以返回1 0 -1来表示这两个参数大于 等于 小于
Hash的sort方法是把一个Hash对象转换成以［key，value］为单个元素的一个数组，然后再用数组的sort方法进行排序

ruby include和extend的区别

1.在类定义中引入模块，使模块中的方法成为类的实例方法

这种情况是最常见的

直接 include 即可

2.在类定义中引入模块，使模块中的方法成为类的类方法

这种情况也是比较常见的

直接 extend 即可

3.在类定义中引入模块，既希望引入实例方法，也希望引入类方法

这个时候需要使用 included,

但是在模块中对类方法的定义有不同，定义出现在self.included块中

def self.included(c) ... end 中

git config --global alias.st status git 简写配置(例如)


4.class_eval和instance_eval的区别：

解决英文下划线问题(ransack存在的问题)
ChannelCode.where("code like '%\\_%'").count 需要两个转义字符

5.解决两层N+1的问题:https://r
uby-china.org/topics/30115
比如：order.user.company
解决单层：Order.includes(:user)
解决两层：Order.includes(user: :campany)

6.拟态方法/类宏
(1),拟态方法的作用是定义一个方法有不同的调用方式 比如：puts '' / puts('')
(2),类宏
使用场景:在一个类定义中调用一个类方法，进而达到扩展这个类的目的
总结起来说:
拟态方法其实是在描述一个方法调用的外在形式（加括号和不加括号)
类宏就是在描述一个方法调用的目的（用来扩展类）和使用场景（必须在类定义中使用）。所以这两者是不矛盾的。

钩子方法:在程序运行时扩展程序的行为

crontab -e 编辑 -l查看 shift x 退出
20 17 * * * cd /home/deployer/backend/current && /home/deployer/.rbenv/shims/bundle exec rake RAILS_ENV=production sms:timing_send

rails 正则匹配 匹配后边儿：/#{date}.*/i 两边儿都匹配：/*.#{date}.*/i
EngineerStatic.where(info_date: /.*#{date}.*/i, user_id: user.id).desc(:info_date)

gemset 和 bundler 根本要解决的就不是同一个问题，也不知道有什么好对比的。一个关注的是本地环境，一个关注的是项目自身的依赖，使用它们的时候思维模型根本都是不同的。
和 Bundler 打交道的时候，思维模型是：不管什么样的环境，反正对于这个项目，我要求 gems 怎样怎样／或者针对特定条件的环境（比如某种特定版本的解释器），我要求 gems 怎样怎样
和 gemset 打交道的时候，思维模型是：不管什么样的项目，只要切换到我（gemset）这里，我就可以提供 xxx 版本的 xxx gems 供你使用。你当然可以更新我（gemset）管理的 gems，但是记住：你创造我的目的就是为了给本地开发环境设定一个可控的 gems 环境。如果你不 care 这件事情，请你直接使用 global gemset，然后从此忘了我吧——懂得人自然懂。

http://blog.csdn.net/besfanfei/article/details/7966987 rails string/symbol的区别

从（怎么使用）工具出发来设计性能，有这种思路的话一上来就错了
性能设计的正途是充分研究业务的数据流，充分利用（exploit）数据的特性来削减运算、避免瓶颈。至于那些工具只是给你参考的，就算要用最好也是拆了、消化了、自己改造了再用

跨站请求伪造（CSRF）是一种攻击方式，A 网站的用户伪装成 B 网站的用户发送请求，在 B 站中添加、修改或删除数据，而 B 站的用户绝然不知

To have launchd start redis now and restart at login:
  brew services start redis
Or, if you dont want/need a background service you can just run:
  redis-server /usr/local/etc/redis.conf

将str = 'abcd'转换成 a=1&b=2
array = [] 
1, str.length.times{|i| array << str[i]}
2, array.map{|i| i + '=' + (array.index(i) + 1).to_s}.join('&')

或者 

date = Time.local(2016, 9 , 21 , 23, 5, 30)

has_one 和 belongs_to 后面的 foreign_id 含义是不一样的，一个是「去对面的表里找这个字段」，另一个是「使用这个字段做」

JSON.parse(ids).to_a.reject(&:blank?).map(&:to_i) 
reject(&:blank?)的意思是去除数组当中的nil/"" 也可以这样用reject(&:present?)

1 rails 4种 update总结
update 走回调和验证
update_all 都不会
update_attribute(:send_status, 3) 走回调也不走验证 一般用来更新一个字段的值，boolean 
update_attributes({:name => “xyz”, :age => 20}) 走回调和验证 可以更新多个字段 升级版
源码：
def update_attribute(name, value)
  send(name.to_s + '=', value)
  save(false)
end
def update_attributes(attributes)
  self.attributes = attributes
  save
end


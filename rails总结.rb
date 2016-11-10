rails  巧用总结
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
# <%= stylesheet_link_tag "jquery-ui" %>
# <%= javascript_include_tag "jquery-ui.min" %>
# <%= image_tag ""%>

私有方法可以在model的内部提供给各个方法调用，但是它不能用于实例方法调用

带条件修饰符的变量赋值语句， Ruby都会为其先赋值为nil，然后进行条件判断，若条件满足，再进行第二次赋值操作

一个对象的真正的类应该是它的eigenclass，而class只有在eigenclass不存在的时候才会作为该对象的类

ruby 里边儿没有方法重写的概念当一个class中出现两个以上的同名方法时，只会执行最后一个

当定义已经存在的class时，ruby不会重新定义，它会“打开”这个class

scope 有参数和没有参数总结

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
update_all(status: 2) 直接生成sql，从而跳过rails层的验证和回调
update_attribute(:send_status, 3) 走回调也不走验证 一般用来更新一个字段的值，boolean 
update_attributes({:name => “xyz”, :age => 20}) 走回调和验证 可以更新多个字段 升级版
update_column(:send_status, 3)会直接生成sql语句去操作数据库，从而跳过rails层的验证和回调
源码：
def update_attribute(name, value)
  send(name.to_s + '=', value)
  save(false)
end
def update_attributes(attributes)
  self.attributes = attributes
  save
end

时间默认设置

(1)
my_datetime_formats = { :default => "%Y-%m-%d %H:%M:%S" } 
my_date_formats = { :default => '%Y-%m-%d' }
Time::DATE_FORMATS.merge!(my_datetime_formats)
Date::DATE_FORMATS.merge!(my_date_formats)

(2)
# 把这行放到init文件里 新建一个文件比如:global.rb
Time::DATE_FORMATS[:db2] = '%Y-%m-%d %H:%M:%S'
# 也可以覆盖默认的
Time::DATE_FORMATS[:default] = '%Y-%m-%d %H:%M:%S'
# 然后
created_at.to_s(:db2)
#或者
created_at.to_s

rails 预加载总结
includes preload eager_load

includes 和 preload 可以生成两条相同的sql语句
eager_load 会生成一条left join的sql语句
includes则是rails用来动态选择两种方式的一个方法，取决于查询条件

(3)过滤器总结
先执行application_controller里边的再执行xxx_controller
before_action :aaa
before_action :bbb
先执行aaa,后执行bbb
和aaa,bbb方法的先后顺序无关和哪个before_action在上边有关

元编程相关

Active Record 就用到了元编程，你可以看下源码。我不反对用元编程，但是有几个原则：

理解什么是元编程
不要在业务代码里面使用元编程，因为代码不仅仅是给自己看的
写框架的话可以适量用元编程，因为可以用少的代码实现更复杂的功能，大多数人使用框架的时候几乎不会去看源代码，比如 rails

(4)Rack总结
Rack是一个中间件，介于Web应用程序和Web服务器之间，为所有的Web服务器都提供了统一的接口，
使用Rack构建的Web应用程序能简单换到其他的Web服务器上，因为Rails在底层用到了Rack，
所以我们可以在开发的时候使用Webrick，然后通过fastcgi或者ruby_mod发布到nginx或者Apache。

总的来说，Rails首先加载了config/application.rb中定义了AppName::Application，
然后调用其initialize!()方法执行一些初始化工作，最后使用Rack的run AppName::Application运行整个应用程序。
Rails也通过Rack可以很方便的部署于Apache、nginx、lighttpd等各种服务器，包括Ruby自带的Webrick，以及mongrel等。
要更深入的了解Rack需要进一步阅读参考中的链接

(5)attr_accessible 和 attr_accessor 的区别

attr_accessible 是一个rails方法，它可以放实例变量进一个mass assignmen 
在attr_accessible之后的属性，进入了白名单，有默认的get,set方法，但是这些属性，必须在schema里面存在它们的名字，
就是说要migrate添加到数据库的表里面，可以通过CRUD来操作这些属性在数据库的值 
我犯的错误就是没有migrate进数据库就想在console使用和test，所以就卡住了 

attr_accessor是一个ruby方法 
attr_accessor被修饰的属性，被称为虚拟属性，它跟数据库没有关系，它只存在memory的scope，
他也是有get，set方法，但是你要注意一点就是在console里面new出对象时返回的对象数据列表中是看不到这些属性的，
因为console只显示的是你schema的字段，虚拟属性没有在其里面，所以看不到，
你可以用respon_to?方法去判断属性是否可以new出来 



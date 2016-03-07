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

<%= link_to "添加模版", new_admin_market_templete_path, class: "action" %>
ruby include和extend的区别
1.在类定义中引入模块，使模块中的方法成为类的实例方法

这种情况是最常见的

直接 include 即可

2.在类定义中引入模块，使模块中的方法成为类的类方法

这种情况也是比较常见的

直接 extend 即可

3.在类定义中引入模块，既希望引入实例方法，也希望引入类方法

这个时候需要使用 include,

但是在模块中对类方法的定义有不同，定义出现在self.included块中

def self.included(c) ... end 中

git config --global alias.st status git 简写配置(例如)

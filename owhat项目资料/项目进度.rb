1，订单相关
未付款，已付款，已完成，已删除，已取消
应援订单：Shop::FundingOrder
商品订单：Shop::OrderItem
订单：Shop::Order
1，account登陆相关
2，user主要保存个人信息
管理员权限必须是认证用户 Manage::Editor不能为空（user.identity=1 && user.verified=true）
3，connection 存的是第三方的绑定信息，一个account可以有多个绑定信息

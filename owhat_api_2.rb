闪屏广告

.  闪屏广告：(ad)
   请求方式：get
   参数 ：
        input: (:from_client)  
        output: (data: {id: ad.id,title: ad.title,pic: ad.picture_url,link: ad.link,duration: ad.duration,version: '3.26',ios_url: "http://itunes.apple.com/us/app/id910606347"})
   返回格式 ：json

客户端接口请求

.  客户端接口请求：(get_web_address)
   请求方式：get
   参数 ：
        input: (rand)  
        output: ({data: {address: "#{Rails.application.routes.default_url_options[:host]}"}})
   返回格式 ：json

帝联通知接口

.  帝联通知接口：(report_transcode)
   请求方式：post
   参数 ：
        input: (signature)  
        output: (ret, message)
   返回格式 ：json
31版本

  . 31版第三方登录：（conection_callback)
    请求方式：post
    参数 ：
        input: （site, identifier,old_identifier, token, name, pic, expired_at,data)  
        output:(data: { code: "联合登陆", connection_id: connection.id })
    返回格式 ：json


  . Banner接口：（banners)
    请求方式：get
    参数 ：
        input: （position)  
        output:({ data: { banners: banners.map{|banner| {id: banner.id,title: banner.title,pic: banner.pic2_url,link: banner.link,template: banner.template,template_id: banner.template_id} }.as_json } })
    返回格式 ：json


  . 一键注册(快速注册）：（register)
    请求方式：post
    参数 ：
        input: （email, phone, captcha, password, client, connection_id)  
        output:(data: {v3_count: @account.v3_count.value,user: {uid: @account.id,token: @account.salt || @account.make_token,pic: @user.picture_url,name: @user.name,birthday: @user.birthday,role: @user.identity}})
    返回格式 ：json


  . 关联账号：（connection_account)
    请求方式：post
    参数 ：
        input: （connection_id,password,login)  
        output:(data: {v3_count: account.tries(:v3_count, :value),user: {uid: account.id,token: account.salt || account.make_token,name: user.name,pic: user.app_picture_url,birthday: user.birthday,connection_id: connect.id,role: user.identity}})
    返回格式 ：json


  . 图片福利接口（发布媒体任务）：（publish_letter)
    请求方式：post
    参数 ：
        input: （title,star_list,pic,images_attributes,pic)  
        output:({data: true})
    返回格式 ：json

      . 查看书信：（show_letter)
        请求方式：get
        参数 ：
             input: （letter_id)  
             output:({data: res})
        返回格式 ：json


  . 多账号关联（确认关联owhat账号）：（bang_connections)
    请求方式：post
    参数 ：
        input: （account_id, connection_id)  
        output:success(data: {v3_count: account.v3_count.value,user: { uid: account.id,token: account.salt || account.make_token,pic: user.picture_url,name: user.name,birthday: user.birthday,role: user.identity}})
    返回格式 ：json

  . 首页接口（我的关注）：（feeds)
    请求方式：get
    参数 ：
        input: （mark)  
        output:(data: { feeds: ret, obi: @current_user.obi, version: '3.23', ios_url: "http://itunes.apple.com/us/app/id910606347" })
    返回格式 ：json

      . 任务换一换：（tasks)
        请求方式：get
        参数 ：
            input: （mark)  
            output:(data: {feeds: tasks.map{|a| a.as_json.merge!(pic: a.list_pic).update(title: a.title.gsub(/\r|\n/, ""))}.as_json,})
        返回格式 ：json

      . 福利换一换：（welfares)
        请求方式：get
        参数 ：
            input: （mark)  
            output:(data: {feeds: welfares.map{|a| a.as_json.merge!(pic: a.list_pic).update(title: a.title.gsub(/\r|\n/, ""))}.as_json,})
        返回格式 ：json

      . 我关注的福利任务：（all_feeds)
        请求方式：get
        参数 ：
            input: （page, per_page)  
            output:(data: { feeds: ret, count: feeds.total_entries})
        返回格式 ：json

.  安卓更新接口（更新）：(version_update)
   请求方式：get
   参数 ：
        input: (app_version)  
        output: ({data: {home_show, is_force, is_update, new_version: "3.1.2", url: "http://qimage.owhat.cn/929c0236cd6bbe05e234dcec1a8ec018.apk"}})
   返回格式 ：json

.  banner API(banner接口)：(banners)
   请求方式：get
   参数 ：
        input: (position)  
        output: (res)(res = { data: { banners: banners.as_json } })
   返回格式 ：json

   .  发现 banner图 API（信息检索）：(finding_images)
      请求方式：get
      参数 ：
         input: (:from_client)  
         output: ( data: { findings: findings.as_json } })
      返回格式 ：json

   . 任务分类图 API（任务推荐图）：（suggestion_task_images)
     请求方式：get
     参数 ：
        input: （page,per_page)  
        output:(data: { images: images.as_json })
     返回格式 ：json   

. 七牛token接口（七牛上传获取token接口）：（qiniu_uptoken)
   请求方式：post
   参数 ：
        input: (uid,key,formats)  
        output: ({data: ret})     
   返回格式 ：json

. 七牛回调接口：（qiniu_notify)
   请求方式：get
   参数 ：
        input: ()  
        output: ()     
   返回格式 ：json

. 上传语音接口：（upload_voice )
   请求方式：post
   参数 ：
        input: （uid, voice_key, pic_key, ，duration, ，title, star_list)  
        output:({data: true})
   返回格式 ：json

任务API 

 专题api

  . 查看专题（查看直播）：（shop_subjects)
    请求方式：get
    参数 ：
        input: （uid, page,per_page)  
        output:(ret)(ret = {data: { subjects: subjects, count: Shop::Subject.active.count }})
    返回格式 ：json

  . 查看专题（查看直播详情）：（shop_subjects_show)
    请求方式：get
    参数 ：
        input: （uid, task_id)  
        output:(ret)( ret = { data: subject })
    返回格式 ：json

  . 专题评论列表（直播评论列表）：（get_shop_subject_comment)
    请求方式：get
    参数 ：
        input: （uid, subject_id, page, per_page)  
        output:({data: {comments: comments, count: count}})
    返回格式 ：json
  
  . 创建专题评论（创建直播评论）：（create_shop_subject_comment)
    请求方式：post
    参数 ：
        input: （content, uid, subject_id)  
        output:({data: {subject_id: params[:subject_id]}})
    返回格式 ：json
 
 书信福利

 . 发布媒体任务：（publish_letter)
    请求方式：post
    参数 ：
        input: （title, paper_id,receiver, content, signature, images_attributes, pic)  
        output:({data: true})
    返回格式 ：json

 . 查看书信：（show_letter)
    请求方式：get
    参数 ：
        input: （letter_id)  
        output:({data: res})
    返回格式 ：json

 . 信纸列表：（letter_papers)
    请求方式：get
    参数 ：
        input: （page,per_page)  
        output:({data: { papers: papers.as_json } })
    返回格式 ：json


 . 专题评论列表（直播评论列表）：（get_shop_subject_comment)
   请求方式：get
   参数 ：
        input: （uid, subject_id, page, per_page)  
        output:({data: {comments: comments, count: count}})
   返回格式 ：json

 . 免费活动商品展示页面：（welfare_product_show )
   请求方式：get
   参数 ：
        input: （uid, type, welfare_id)  
        output:(ret)(ret = { data: product })
   返回格式 ：json

 . 免费商品支持(商品活动创建订单)：（welfare_product_create )
   请求方式：post
   参数 ：
        input: （uid, type,welfare_id,ticket_type_id,infos, quantity,address_id)  
        output:({data: true})
   返回格式 ：json

媒体任务

. 发布媒体任务：（publish_mediua)
   请求方式：post
   参数 ：
        input: （title, start_at,end_at, star_list, url, pic, is_share)  
        output: ({data: true})
   返回格式 ：json

. 查看媒体任务：（show_medium)
   请求方式：get
   参数 ：
        input: （uid, medium_id)  
        output: ({data: { medium: res } })
   返回格式 ：json

应援

. 关联明星应援列表：（shop_fundings_by_star )
   请求方式：get
   参数 ：
        input: (uid, page, per_page)  
        output: (ret)（ret = {data: fundings}）
   返回格式 ：json

. 应援列表：（shop_funding_show)
   请求方式：get
   参数 ：
        input: (uid,funding_id)  
        output: (ret)（ret = {data: fundings}）
   返回格式 ：json

. 应援结果展示：（shop_funding_result_show)
   请求方式：get
   参数 ：
        input: (uid,funding_id)  
        output: ({data: {funding_result: funding}})
   返回格式 ：json

. 任务排行榜：（shop_funding_rank_list)
   请求方式：get
   参数 ：
        input: (uid,funding_id,page, per_page)  
        output: (ret)(ret = { data: {ranking_list: ranking_list} })
   返回格式 ：json

. 应援支持，购买订单：（shop_funding_orders_create)
   请求方式：post
   参数 ：
        input: (uid, sum_fee, fundings, address_id)  
        output: (ret)(ret = { data: {order_no: order_no} })
   返回格式 ：json

. 明星应援榜：（funding_stars_ranking)
   请求方式：get
   参数 ：
        input: (page,per_page)  
        output: ({data: { stars: stars.as_json, count: count } })     
   返回格式 ：json

. 粉丝会应援榜：（funding_experts_ranking)
   请求方式：get
   参数 ：
        input: (page,per_page)  
        output: ({data: { users: users.as_json, count: count } })     
   返回格式 ：json

. 应援购买成功回调接口：（shop_funding_alipay_back)
   请求方式：post
   参数 ：
        input: (order_no,paid_at,pay_type)  
        output: (success)     
   返回格式 ：txt

. 应援微信回调接口：（shop_funding_wx_back)
    请求方式：post
    参数 ：
        input: （)  
        output:({return_code: "SUCCESS"}.to_xml(root: 'xml', dasherize: false))
    返回格式 ：xml

活动、商品

. 分期乐支付：（fenqile_pay)
   请求方式：post
   参数 ：
        input: （order_no,category)  
        output: (data: { url: resp[:url] }))
   返回格式 ：json

. 商品、活动列表：（shop_products)
   请求方式：get
   参数 ：
        input: （uid, page,per_page)  
        output: (ret)(ret = {data: {task: products, count: Shop::Product.active.count+Shop::Event.active.count}})
   返回格式 ：json

. 商品、活动展示：（shop_task_show)
   请求方式：get
   参数 ：
        input: （uid, type, id)  
        output:(ret) ( ret = { data: event })
   返回格式 ：json

. 确认购买时判断购买是否超额：（get_can_purchase_limit)
   请求方式：get
   参数 ：
        input: （ticket_type_id,uid, shop_type)  
        output:({data: {quantity: quantity}})
   返回格式 ：json

. 确认购买时判断购买是否超额：（get_can_purchase_limit)
   请求方式：get
   参数 ：
        input: （ticket_type_id,uid, shop_type)  
        output:({data: {quantity: quantity}})
   返回格式 ：json

. 商品活动结算运费获取：（get_freight_fee )
   请求方式：get
   参数 ：
        input: （ticket_types_attributes,user_id,address_id)  
        output:({data: sum_freight_fee})
   返回格式 ：json

. 加入购物车：（add_cart)
   请求方式：post
   参数 ：
        input: （uid, ticket_type_id, quantity, shop_category,shop_task_id;;split_memo)  
        output:(ret)(ret = {data: h})
   返回格式 ：json

. ios编辑购物车详情页面：（edit_cart_details)
   请求方式：post
   参数 ：
        input: （uid, ticket_type_id,pre_ticket_type_id, quantity,shop_category,shop_task_id)  
        output:(ret)(ret = {data: h})
   返回格式 ：json

. 我的购物车：（get_my_carts)
   请求方式：get
   参数 ：
        input: （uid)  
        output:(ret)(ret = {data: c_hash})
   返回格式 ：json

.  删除购物车：（delete_cart )
   请求方式：delete
   参数 ：
        input: （uid)  
        output:(ret)(ret = {data: {ticket_type_id: params[:ticket_type_id]} })
   返回格式 ：json

. 编辑购物车：（edit_cart)
   请求方式：post
   参数 ：
        input: （ticket_types_attributes, uid)  
        output:(ret)(ret = {data: true})
   返回格式 ：json

. 商品支持，购买订单, 立即购买, 购物车结算：（shop_product_orders_create)
   请求方式：post
   参数 ：
        input: （uid,address_id,shop_order,sum_fee, freight_fee)  
        output:({data: {order_no: order_no}})
   返回格式 ：json

. 商品微信回调接口：（shop_product_wx_back)
    请求方式：post
    参数 ：
        input: （）
        output:({return_code: "SUCCESS"}.to_xml(root: 'xml', dasherize: false))
    返回格式 ：xml

. 支付宝商品活动购买成功回调接口：（shop_product_alipay_back)
   请求方式：post
   参数 ：
        input: (out_trade_no)  
        output: (success)     
   返回格式 ：txt

. 支付宝android参数获取：（get_alipay_order_info)
    请求方式：get
    参数 ：
        input: （type,order_no, payment)  
        output:(ret)(ret = { data: {pay_info: data} })
    返回格式 ：json

. 查询商品购买订单是否存在：（search_shop_order)
   请求方式：get
   参数 ：
        input: （order_category, order_no)  
        output:({data: {status: false}})
   返回格式 ：json

. 认证用户发布商品/活动任务：（publish_task)
   请求方式：post
   参数 ：
        input: （shop_task_type,title, description, descripe_key, descripe2, key1, key2, key3, start_at,end_at, sale_start_at, sale_end_at, address, mobile, uid, is_share, is_need_express, freight_template_id, star_list ;;ext_infos_attributes; ; title, task_id, task_type,require,ticket_types_attributes, category_id, original_fee,fee,,ticket_limit, ,is_limit,is_each_limit, each_limit )  
        output:({data: true})
   返回格式 ：json

.  用户个人价格分类查询：(get_user_price_category)
   请求方式：get
   参数 ：
        input: (uid)  
        output: (@categories)
   返回格式 ：json

.  运费模板：(get_user_freight_templates)
   请求方式：get
   参数 ：
        input: (uid)  
        output: (@templates)
   返回格式 ：json

.  app请求二维码：(app_publish_task)
   请求方式：get
   参数 ：
        input: (uid,category)  
        output: ({data: true})
   返回格式 ：json

.  web持续请求二维码是否跳转接口：(turn_to_publish)
   请求方式：get
   参数 ：
        input: (rand)  
        output: ({data: {uid: j_code[1], category: j_code[2]} })
   返回格式 ：json

订单展示

. 历史订单：（owhat2_orders)
   请求方式：get
   参数 ：
        input: （uid, page, per_page)  
        output:({data: {orders: orders, count: count }})
   返回格式 ：json

. 我的订单列表：（get_orders)
   请求方式：get
   参数 ：
        input: （uid, shop_category, status, select_all, page, per_page)  
        output:({data: {orders: ret, count: @orders.total_entries }})
   返回格式 ：json


. 取消订单：（cancel_order)
   请求方式：post
   参数 ：
        input: （uid, order_no,shop_category)  
        output:({data: {order_no: @order.order_no}})
   返回格式 ：json

. 分享回调送积分：（share_callback)
   请求方式：get
   参数 ：
        input: （share_id, type)  
        output:({data: { count: count+1 }})
   返回格式 ：json

. 微信支付给android返回参数：（make_wx_pay_params)
   请求方式：post
   参数 ：
        input: （uid, order_no,shop_category, spbill_create_ip)  
        output: ({data: {wx_params: ret}})
   返回格式 ：json

. 微信订单查询接口：（find_wx_order_status)
   请求方式：get
   参数 ：
        input: （order_no,from, shop_category)  
        output: ({data: result})
   返回格式 ：json


话题、新鲜事

. 话题/新鲜事详情页：（shop_topic)
   请求方式：get
   参数 ：
        input: （id, uid)  
        output:(ret)(ret = {data: topic})
   返回格式 ：json

 . 发布话题/新鲜事：（create_shop_topic)
   请求方式：post
   参数 ：
        input: （title, description,key, is_share,uid, star_list)  
        output:(ret)(ret = {data: true})
   返回格式 ：json
   
. 发布动态：（create_shop_dynamic)
   请求方式：post
   参数 ：
        input: （content, uid, shop_topic_id ;; pictures_attributes, pictureable_id,pictureable_type, key, user_id,videos_attributes, video_id, video_type, key, user_id)  
        output:({data: size})
   返回格式 ：json

. 赞动态：（like_shop_dynamic_comment)
   请求方式：post
   参数 ：
        input: （uid, dynamic_id)  
        output:({data: dynamic.id})
   返回格式 ：json

. 转发动态：（forward_shop_dynamic_comment)
   请求方式：post
   参数 ：
        input: （uid, dynamic_id)  
        output:({data: dynamic.id})
   返回格式 ：json

. 创建动态评论：（create_shop_dynamic_comment)
   请求方式：post
   参数 ：
        input: （content,uid,parent_id, dynamic_id)  
        output:({data: {user_name: @current_user.name, time: Time.now.to_s(:db)}})
   返回格式 ：json

. 话题列表：（shop_topics)
   请求方式：get
   参数 ：
        input: （uid, order, page, per_page)  
        output:(ret)(ret = {data: {task: topics, count: Shop::Topic.active.count}})
   返回格式 ：json

. 动态列表：（shop_topic_dynamics)
   请求方式：get
   参数 ：
        input: （uid, topic_id,order, ;; page, per_page,)  
        output:(ret)(ret = { data: {task: topic_dynamics, count: count } })
   返回格式 ：json

. 动态评论列表：（shop_dynamic_comments)
   请求方式：get
   参数 ：
        input: （uid, dynamic_id, page, per_page)  
        output:(ret)(ret = {data: {task: all_comments, count: comments.total_entries}})
   返回格式 ：json

推荐

. 推荐机构：（suggestions)
   请求方式：get
   参数 ：
        input: （identity ;; keyword, action, order, page,per_page)  
        output:(ret)(ret = { data: {users: users.as_json, count: count, has_next: has_next }})
   返回格式 ：json

. 任务推荐：（suggestion_tasks)
   请求方式：get
   参数 ：
        input: （;;category,order, page,per_page;;)  
        output:(data: {count: tasks.total_entries,has_next: tasks.next_page.to_i > 0,feeds: tasks.map{|a| a.as_json.merge!(pic: a.list_pic).update(title: a.try(:title) && a.try(:title).gsub(/\r|\n/, ""))}.as_json,})
   返回格式 ：json

. 推荐福利：（suggestion_welfares)
   请求方式：get
   参数 ：
        input: （;;page, per_page, order;;)  
        output:(data: {count: welfares.total_entries,has_next: welfares.next_page.to_i > 0,obi: @current_user.obi.to_i,feeds: hash.as_json})
   返回格式 ：json

. 任务推荐图：（suggestion_task_images)
   请求方式：get
   参数 ：
        input: （page,per_page)  
        output:(data: { images: images.as_json })
   返回格式 ：json


收货地址


. 默认地址返回：（get_address)
   请求方式：get
   参数 ：
        input: (uid)  
        output: ({data: res}） （ret = {data: addresses} ）
   返回格式 ：json

. 新增地址：（create_address)
   请求方式：get
   参数 ：
        input: (user_id, mobile, addressee,is_default, address, city_id, province_id, district_id, zip_code)  
        output: ({data: true})
   返回格式 ：json

. 地址省列表：（get_provinces)
   请求方式：get
   参数 ：
        input: (page, per_page)  
        output: (ret)（ret = {data: areas}）
   返回格式 ：json

. 城市列表：（get_cities)
   请求方式：get
   参数 ：
        input: (province_id, page, per_page)  
        output: (ret)（ret = {data: areas}）
   返回格式 ：json

. 区列表：（get_districts)
   请求方式：get
   参数 ：
        input: (province_id, city_id, page, per_page)  
        output: (ret)（ret = {data: areas}）
   返回格式 ：json

. 删除地址：（delete_address)
   请求方式：delete
   参数 ：
        input: (user_id,address_id)  
        output: ({data: true})
   返回格式 ：json

. 修改地址：（modificate_address)
   请求方式：post
   参数 ：
        input: (user_id, address_id,address,province_id, city_id, district_id, addressee, mobile, zip_code)  
        output: ({data: true})
   返回格式 ：json

. 设为默认地址：（default_address )
   请求方式：post
   参数 ：
        input: (user_id,address_id)  
        output: ({data: true})
   返回格式 ：json

. 设为默认地址：（default_address )
   请求方式：post
   参数 ：
        input: (user_id,address_id)  
        output: ({data: true})
   返回格式 ：json

搜索

. 搜索记录列表：（search_recordings)
   请求方式：get
   参数 ：
        input: (uid, genre, page,per_page)  
        output: (ret) （ret = { data: { recordings: recordings.as_json } }）   
   返回格式 ：json

. 热搜词：（hot_record)
   请求方式：get
   参数 ：
        input: (uid, genre, page,per_page)  
        output: (data: { hot_records: records.as_json }）   
   返回格式 ：json


. 删除搜索记录：（destory_recordings)
   请求方式：delete
   参数 ：
        input: (uid, genre)  
        output: ({data: true}）   
   返回格式 ：json

. 搜索：（search)
   请求方式：get
   参数 ：
        input: (keyword,optional)  
        output: ({data: res}）   
   返回格式 ：json

. 搜索列表：（search_list)
   请求方式：get
   参数 ：
        input: (eyword, category, page,per_page)  
        output: ({data: res}）   
   返回格式 ：json

明星

. 推荐明星：（stars_index)
   请求方式：get
   参数 ：
        input: （uid ;; keyword, action, order, page , per_page)  
        output:(ret)(ret = {data: { stars: stars.as_json, count: count } })
   返回格式 ：json

. 明星主页：（star_home)
   请求方式：get
   参数 ：
        input: （uid, star_id)  
        output:(data: {tar: {id: star.id,name: star.name,sign: star.sign,pic: star.picture_url,description: star.description,friendship: (@current_user.following?(star) ? 1 : 0),company: star.company,is_punch: @current_user.punches.where(star_id: star.id).is_punch(Time.zone.now.beginning_of_day).present?,works: star.works,acting: star.acting,related_ids: JSON.parse(star.related_ids.to_s).to_a.reject(&:blank?).join(','),auth: star.published,follower_count: star.fans_total,h5_url: "#{Rails.application.routes.default_url_options[:host]}/home/stars/#{star.id}",}})
   返回格式 ：jso
. 创建明星：（star_create)
   请求方式：post
   参数 ：
        input: （keyword)  
        output:(data: {star: {id: star.id,name: star.name,nickname: star.nickname,pic: star.picture_url,cover: star.cover.try(:url),description: star.description,company: star.company,works: star.works,acting: star.acting,related_ids: JSON.parse(star.related_ids.to_s).to_a.reject(&:blank?).join(','),auth: star.published}})
   返回格式 ：json

. 明星关联记录：（relation_stars)
   请求方式：get
   参数 ：
        input: （uuid)  
        output:(ret)(ret = {data: { stars: stars } })
   返回格式 ：json

. 取消关注明星：（star_unfollow)
   请求方式：put
   参数 ：
        input: （star_id)  
        output:(data: { star: { id: star.id, friendship: (@current_user.following?(star) ? 1 : 0) } })
   返回格式 ：json

. 关注明星列表：（star_followings)
   请求方式：get
   参数 ：
        input: （user_id, page, per_page)  
        output:(res)(res = { data: { stars: stars, count: count, has_next: has_next} })
   返回格式 ：json

. 明星关联机构和粉丝会：（star_orgs_and_fans)
   请求方式：get
   参数 ：
        input: （star_id)  
        output:({data: { users: users.as_json } }))
   返回格式 ：json

. 明星关联机构：（star_org)
   请求方式：get
   参数 ：
        input: （star_id)  
        output:({data: data})
   返回格式 ：json

. 明星关联任务福利：（star_tasks)
   请求方式：get
   参数 ：
        input: （;;star_id,category, page,per_page;;)  
        output:({ data: data })
   返回格式 ：json

. 明星关联机构和粉丝会：（star_orgs_and_fans)
   请求方式：get
   参数 ：
        input: （star_id)  
        output:({data: { users: users.as_json } }))
   返回格式 ：json




用户

. 用户登录：（login)
   请求方式：post
   参数 ：
        input: （password ,login, email, phone,)  
        output:(data: {v3_count: @account.v3_count.value,user: {uid: @account.id,token: @account.salt || @account.make_token,name: @account.user.name,pic: @account.user.picture_url,birthday: @account.user.birthday,role: @account.user.identity}})
   返回格式 ：json

. 用户注册：（register)
   请求方式：post
   参数 ：
        input: （email,phone, captcha,password, client)  
        output:(data: {v3_count: @account.v3_count.value,user: {uid: @account.id,oken: @account.salt || @account.make_token,pic: @user.picture_url,name: @user.name,birthday: @user.birthday,role: @user.role}})
   返回格式 ：json

. 发送短信验证码：（registration_code)
   请求方式：post
   参数 ：
        input: （phone, type)  
        output:(data: true)
   返回格式 ：json

. 验证账号是否注册：（validate_account)
   请求方式：get
   参数 ：
        input: （phone,genre)  
        output:(data: true)
   返回格式 ：json

. 忘记密码：（update_password)
   请求方式：put
   参数 ：
        input: （uid,phone, password)  
        output:(data: true)
   返回格式 ：json

. 更新生日：（user_birthday)
   请求方式：put
   参数 ：
        input: （birthday)  
        output:(data: true)
   返回格式 ：json


. 更新用户昵称：（user_name)
   请求方式：put
   参数 ：
        input: （name)  
        output:(data: true)
   返回格式 ：json

. 更新性别：（user_sex)
   请求方式：put
   参数 ：
        input: （sex)  
        output:(data: true)
   返回格式 ：json

. 更新签名：（user_signature)
   请求方式：put
   参数 ：
        input: （signature)  
        output:(data: true)
   返回格式 ：json

. 更新头像：（user_avatar)
   请求方式：put
   参数 ：
        input: （pic)  
        output:(data: { user: {id: @current_user.id, pic: @current_user.picture_url }})
   返回格式 ：json

. 认证用户背景图：（user_images)
   请求方式：put
   参数 ：
        input: （page,per_page)  
        output:(data: { count: images.total_entries, images: images.as_json } )
   返回格式 ：json

. 设置背景图：（user_cover)
   请求方式：put
   参数 ：
        input: （image_id)  
        output:(data: true)
   返回格式 ：json

. 设置里程碑是否隐藏：（user_privacy)
   请求方式：put
   参数 ：
        input: （privacy)  
        output:(data: true)
   返回格式 ：json

. 验证短信验证码：（verify_code)
   请求方式：get
   参数 ：
        input: （phone, captcha,uid)  
        output:({data: true})
   返回格式 ：json

. 回调：（callback)
   请求方式：post
   参数 ：
        input: （site)  
        output:( @connection.try(:id))
   返回格式 ：json

. 关注用户：（user_follow)
   请求方式：put
   参数 ：
        input: （follow_id)  
        output:( data: { id: follow.id, friendship: @current_user.friendship[follow.follow_key].to_i })
   返回格式 ：json

. 取消关注：（user_unfollow)
   请求方式：put
   参数 ：
        input: （follow_id)  
        output:(data: { id: follow.id, friendship: @current_user.friendship[follow.follow_key].to_i })
   返回格式 ：json

. 用户被关注列表：（user_followers)
   请求方式：get
   参数 ：
        input: （user_id，identity, page, per_page)  
        output:（res）( res = { data: { follows: followers, count: count } })
   返回格式 ：json

. 用户关注列表：（user_followings)
   请求方式：get
   参数 ：
        input: （user_id，identity, page, per_page)  
        output:（res）( res = { data: { follows: followers, count: count } })
   返回格式 ：json

. 用户信息：（user_info)
   请求方式：get
   参数 ：
        input: （)  
        output:(data: { user: info } )
   返回格式 ：json

. 上传语音接口：（upload_voice )
   请求方式：post
   参数 ：
        input: （uid, voice_key, pic_key, ，duration, ，title, star_list)  
        output:({data: true})
   返回格式 ：json

. 查看语音接口：（get_welfare_voice)
   请求方式：get
   参数 ：
        input: （uid, welfare_voice_id)  
        output:({data: voice})
   返回格式 ：json

. 用户里程碑：（user_timeline)
   请求方式：get
   参数 ：
        input: （uid,page, per_page)  
        output:(data: {feeds: feeds,count: count,share_url: "#{Rails.application.routes.default_url_options[:host]}/home/users/#{params[:uid]}?category=milestone",has_next: feeds.size == per_page ,user: {id: user.id,name: user.name,level: user.level,pic: user.picture_url,image: user.image.try(:picture_url) || Core::Image.published.first.tries(:picture_url),identity: user.identity,verified: user.verified,balance_account: user.balance_account, welfare_count: user.task_count('welfare'), shop_count: user.task_count('task'), participator: user.shop_tasks.map{|task| task.participator}.sum,},sign: Redis.current.get("User:Milestone:#{user.id}") ? eval(Redis.current.get("User:Milestone:#{user.id}")) : nil})
   返回格式 ：json

.  个人主页：（get_personal_homepage)
    请求方式：get
    参数 ：
        input: （uid, user_id, page, per_page)  
        output:(data: {feeds: feeds,has_next: feeds.size == per_page ,count: count,share_url: "#{Rails.application.routes.default_url_options[:host]}/home/users/#{params[:user_id]}",user: {id: other_user.id,name: other_user.name,level: other_user.level,pic: other_user.picture_url,image: other_user.image.try(:picture_url) || Core::Image.published.first.tries(:picture_url),signature: other_user.signature,is_followed: user.friendship[other_user.follow_key].to_i,identity: other_user.identity,verified: other_user.verified,balance_account: other_user.balance_account, #账户余额welfare_count: other_user.task_count('welfare'), #发布福利总数shop_count: other_user.verified? ? other_user.task_count('task') : welf_count < 0 ? 0 : welf_count, #发布任务总数participator: other_user.shop_tasks.map{|task| task.participator}.sum,},sign: other_user.privacy ? (Redis.current.get("User:Milestone:#{other_user.id}") ? eval(Redis.current.get("User:Milestone:#{other_user.id}")) : nil) : nil})   
    返回格式 ：json

. 个人中心：（user_personal_center)
    请求方式：get
    参数 ：
        input: （)  
        output:(data: { user: user })
    返回格式 ：json

. 我的福利：（my_welfares)
   请求方式：get
   参数 ：
        input: （category, is_completed, page,per_page)  
        output:(data: { welfares: welfares.as_json, count: count, has_next: has_next})
   返回格式 ：json

. 获取融云token：（get_rongyun_token)
   请求方式：get
   参数 ：
        input: （user_id)  
        output:({data: Rongcloud::AccessToken.get_token(options)})
   返回格式 ：json

. 用户钱包：（get_my_wallets)
   请求方式：get
   参数 ：
        input: （uid)  
        output:({data: {verified: user.verified, balance_account: balance_account, obi_account: obi_account, empirical_account: empirical_account}})
   返回格式 ：json

. 钱包明细：（wallet_index)
    请求方式：get
    参数 ：
        input: （uid,type,page,per_page)  
        output:({data: { rmb_detail: @rmb_detail, obi_detail: @obi_detail }})
    返回格式 ：json

. 用户列表：（users_list)
    请求方式：get
    参数 ：
        input: （user_ids)  
        output:({ data: { users: users.as_json } })
    返回格式 ：json

. 用户认证信息：（user_verified_info)
    请求方式：get
    参数 ：
        input: （user_id)  
        output:({ data: { user: hash } })
    返回格式 ：json

. 福利是否购买：（user_welfare_complete)
    请求方式：get
    参数 ：
        input: （uid,welfare_id,type)  
        output:({ data: { complete: complete, obi: @current_user.obi, welfare_id: params[:welfare_id], welfare_type: params[:type] } })
    返回格式 ：json

. 玩转owhat：（play_owhat)
    请求方式：get
    参数 ：
        input: （uid)  
        output:(data: {user: {id: user.id,title: user.current_level_name,next_level_need: user.next_level_need,name: user.name,level: user.level,pic: user.picture_url,image: user.image.try(:picture_url),identity: user.identity,verified: user.verified,obi_account: user.obi, empirical_value: user.empirical_value,is_pic_changed: user.pic ? true : false,is_name_changed: user.name ? true : false,is_sign_changed: user.signature ? true : false,is_mobile_changed: @current_account.phone ? true : false,is_social_changed: @current_account.connections.size > 0 ? true : false,is_birth_changed: user.birthday ? true : false,is_address_changed: user.addresses.size > 0 ? true : false,is_descri_changed: user.signature ? true : false}})
    返回格式 ：json

. 关联明星：（punches)
   请求方式：get
   参数 ：
        input: (star_id,page,per_page)  
        output: (data: { punches: punches.as_json, count: punches.total_entries })     
   返回格式 ：json

. 创建关联：（create_punch)
   请求方式：post
   参数 ：
        input: (star_id)  
        output: (true)     
   返回格式 ：json

. 创建问答：（create_question)
   请求方式：post
   参数 ：
        input: (title,pic, star_list, is_share, questions_attributes ;; title, pic, answers_attributes, contentright)  
        output: ({data: true})     
   返回格式 ：json

. 查看问答：（show_question)
   请求方式：get
   参数 ：
        input: (poster_id)  
        output: ({data: res})     
   返回格式 ：json

. 做问答任务：（qa_answer)
   请求方式：put
   参数 ：
        input: (id，question_id，answer_id)  
        output: ({data: true})     
   返回格式 ：json

. 完成问答任务：（qa_complete)
   请求方式：put
   参数 ：
        input: (task_id, count)  
        output: ({data: true})     
   返回格式 ：json

. 商品活动应援参与用户：（get_shop_users)
   请求方式：get
   参数 ：
        input: （uid, shop_id, shop_category)  
        output:({data: {ret: ret, count: count }})
   返回格式 ：json

.  信息检索：(finding_images)
   请求方式：get
   参数 ：
        input: (:from_client)  
        output: ( data: { findings: findings.as_json } })
   返回格式 ：json

.  绑定账号：(conection_callback)
   请求方式：post
   参数 ：
        input: (uid，site, identifier, token,name, pic, expired_at,data)  
        output: ( data: {v3_count,user,pic,birthday,connection_id,role}})
   返回格式 ：json

.  解绑账号：(conection_unbinding)
   请求方式：delete
   参数 ：
        input: (conection_id)  
        output: ( true)
   返回格式 ：json

. 意见反馈：（feedback)
   请求方式：post
   参数 ：
        input: (content)  
        output: (true)
   返回格式 ：json

. 服务索引：（feeds_index)
   请求方式：get
   参数 ：
        input: (category)  
        output: ({ data: data })
   返回格式 ：json

. 首页：（feeds)
   请求方式：get
   参数 ：
        input: ()
        output: ({data: { feeds, obi, task_count: Shop::Task.published.today_update(Time.zone.now.beginning_of_day).count, version: '3.26', ios_url: "http://itunes.apple.com/us/app/id910606347" })
   返回格式 ：json




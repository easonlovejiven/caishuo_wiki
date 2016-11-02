cdowhat API整理

注意： 非必填参数有*

--------> 用户相关

1, 用户登录(login)
请求方式 post
参数   input: (email/phone, password)  output: (v3_count:, user: {uid:, token:, name:, pic:, birthday:, role:})
返回格式 json

2, 用户注册(register)
请求方式 post
参数   input: (email, phone, captcha(验证码), password, client(ios/android)) output: (v3_count:, user: {uid:, token:, name:, pic:, birthday:, role:})
返回格式 json

3, 发送短信验证码(registration_code)
请求方式 post
参数   input: (phone, type(短信/语音))  output: (true)
返回格式 json

4, 验证账号是否注册(validate_account)
请求方式 get
参数   input: (phone, genre(是否重置))  output: true
返回格式 json

5, 更新密码(update_password)
请求方式 put
参数   input: (uid, phone, password)  output: true
返回格式 json

6, 修改生日(user_birthday)
请求方式 put
参数   input: (uid, birthday)  output: true
返回格式 json

7, 更新用户昵称(user_name)
请求方式 put
参数   input: (uid, name)  output: true
返回格式 json

8, 更新用户性别(user_sex)
请求方式 put
参数   input: (uid, sex)  output: true
返回格式 json

9, 更新用户签名(user_signature)
请求方式 put
参数   input: (uid, signature)  output: true
返回格式 json

10, 更新头像(user_avatar)
请求方式 put
参数   input: (uid, pic)  output: (data: { user: {id: @current_user.id, pic: @current_user.picture_url }})
返回格式 json

11, 认证用户背景图(user_images)
请求方式 get
参数   input: (page, per_page)  output: (data: { count: images.total_entries, images: images.as_json } )
返回格式 json

12, 更新用户image_id(user_cover)
请求方式 get
参数   input: (image_id)  output: true
返回格式 json

13, 设置里程碑是否隐藏(user_privacy)
请求方式 get
参数   input: (image_id)  output: true
返回格式 json

14, 验证短信验证码(verify_code)
请求方式 get
参数   input: (phone, captcha, uid)  output: true
返回格式 json

15, 回调(callback)
请求方式 get
参数   input: (site)  output: true
返回格式 json

16, 关注用户(user_follow)
请求方式 put
参数   input: (follow_id, uid)  output: (data: { id: follow.id, friendship: @current_user.friendship[follow.follow_key].to_i })
返回格式 json

17, 取消关注(user_unfollow)
请求方式 put
参数   input: (follow_id, uid)  output: data: { id: follow.id, friendship: @current_user.friendship[follow.follow_key].to_i }
返回格式 json

18, 用户被关注列表(user_followers)
请求方式 get
参数   input: (identity, uid, page, per_page)  output: (count, id, name, role, pic, friendship, follow_count, followers_count)
返回格式 json

19, 我的档案(user_info)
请求方式 get
参数   input: (@current)  output: (user: {id, name, pic, cover_id, city, address, address_id, sex, birthday, signature})
返回格式 json

20, 上传语音接口(upload_voice)
请求方式 post
参数 input: (uid, voice_key, pic_key, duration, title, star_list) output: true
返回格式 json

21, 查看语音接口(get_welfare_voice)
请求方式 get
参数 input: (uid, welfare_voice_id) output: voice.as_json.merge(key_url: .., pic_url: ..)
返回格式 json

22, 用户里程碑(user_timeline)
请求方式 post
参数 input: (uid, page, per_page) output: (date: {feeds, count, share_url, has_next, user:})
返回格式 json

23, 个人主页(get_personal_homepage)
请求方式 get
参数 input: (uid, user_id(访问人的id), page, per_page) output: (date: {feeds, count, share_url, has_next, user:})
返回格式 json

24, 个人中心(user_personal_center)
请求方式 get
参数 input: (@current) output: (user)
返回格式 json

25, 我的福利(my_welfares)
请求方式 get
参数 input: (category, is_completed, page, per_page) output: ({ welfares: welfares.as_json, count: count, has_next: has_next})
返回格式 json

26, 获取融云token(get_rongyun_token)
请求方式 get
参数 input: (user_id) output: ({data: Rongcloud::AccessToken.get_token(options)})
返回格式 json

27, 用户钱包(get_my_wallets)
请求方式 get
参数 input: (uid) output: ({data: {verified: user.verified, balance_account: balance_account, obi_account: obi_account, empirical_account: empirical_account}})
返回格式 json

28, 钱包明细(wallet_index)
请求方式 get
参数 input: (uid, type, page, per_page) output: ({data: { rmb_detail: @rmb_detail, obi_detail: @obi_detail }})
返回格式 json

29, 用户列表(users_list)
请求方式 get
参数 input: (user_ids) output: ({ data: { users: users.as_json } }) 注意： users = {id, name, identity, pic}
返回格式 json

30, 用户认证信息(user_verified_info)
请求方式 get
参数 input: (user_ids) output: ({ data: { user: hash } }) 注意: hash = {id, name, identity, pic, image, friendship, follow_count, followers_count, signature}
返回格式 json

31, 福利是否购买(user_welfare_complete)
请求方式 get
参数 input: (user_id, welfare_id, type) output: ({ data: { complete: complete, obi: @current_user.obi, welfare_id: params[:welfare_id], welfare_type: params[:type] } }}
返回格式 json

32, 玩转owhat(play_owhat)
请求方式 get
参数 input: (user_id) output: ({ data: user}
返回格式 json

---------->  任务相关

33, 问答/创建任务(create_question)
请求方式 post
参数 input: (title, pic, star_list, is_share, questions_attributes{*title, *pic, answers_attributes{*content, *right}})  output: true
返回格式 json

34, 问答/创建任务(create_question)
请求方式 post
参数 input: (title, pic, star_list, is_share, questions_attributes{*title, *pic, answers_attributes{*content, *right}})  output: true
返回格式 json

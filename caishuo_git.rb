 财说GIT提交测试流程：7个步骤
任务流程:
－－－－－－》本地测试OK以后发布到staging上
(1)切换到自己的分支T1721
(2)git add test.rb
(3)git commit test.rb
(4)切换到staging分支:git checkout staging
您的数据已加密，密码仅用于券商公司验证身份，财说不会保存。
(5)git pull
(6)git merge T1721
(7)git push
(8)bundle exec cap staging deploy （push以后要发布）密码：password(casino!@#)
－－－－－－－》发布完成以后登录到10上更新数据(没有数据要更新就不用这样做)
ssh caishuo@192.168.1.10 -p 2002
cd /caishuo/web/current
bundle exec rake permissions:init_permission RAILS_ENV=staging 指向哪个分支
－－－－－－－》自己先测试OK以后指向常宝让常宝测试

以上测试没有问题后将代码发布到production分支(puth 到远程)
(1)到production分支重新 checkout 一个票（git checkout -b Y000）
(2)git add
(3)git commit -m “”
(4)git push origin Y000
(5)merge request（通知长明测试没有问题）
发布完一定要提交相应的数据：
mysqldump -uroot -p caishuo shipan_images>shipan_images.sql;
 注：发布之后有问题的话执行下面命令：
bundle exec cap staging puma:start

git ci -m "后台权限管理”(这块儿的意思是设置了commit的简写形式)"

http://www.office.caishuo.com/ 提交部署成功以后访问前端查看自己上线的功能
http://www.office.caishuo.com/admin/staffers 测试后端
git branch -m old_name new_name

如果和production有冲突的话，解决完冲突之后
 要把新的文件push到production上
merge request完之后 阿超发的时候有冲突的话先合并production解决完冲突之后
git merge T280 production
再 add >>>>> commit >>>>> push到production上
进入前端／后端后 vim .git/config (前提是域名改过之后)

git fetch 将远程新建的最新的分支更新下来
git pull origin 远程分支名 取回远程主机某个分支的更新，再与本地的指定分支合并
git branch --set-upstream-to=origin/T464 T464 从远程clone指定的分支
前端更新项目的时候，要重新切换到staging分支pull最新的前端代码
基于别人的分支开发，push前必须先pull 一下 (git pull origin S21)

如果在之前已经上线的分支上又改code的话，先切入到production分支上pull最新的code，再切入操作分支，执行git merge production（将最新的code合进当前分支）git pull origin 当前分支

find . -name ".git" | xargs rm -Rf 删除一个git init
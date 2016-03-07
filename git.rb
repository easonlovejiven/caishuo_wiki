git 总结
一,基本命令总结
git init 把工作区变为一个git可以管理的仓库
(1)git add 跟踪要修改的文件（把文件add到了缓存区）
(2)git commit 提交文件到版本库（把缓存区的文件提交到了当前分支）
(3)git status 查看修改过的文件的状态(已跟踪，未跟踪，已提交，未提交)
(4)git log 查看提交的log(最上边儿是最近一次提交的)
显示了:commit_id，auther，commit_date，修改的内容 
(5)git reset —head HEAD^ 撤回上一个版本
(6)cat 查看当前文件内容
(7)git reset --hard 3628164 后悔撤回了的那个版本的话执行这个回退到那个版本 3628164是那个版本的版本号(commit_id)
(8)git reflog 查看命令历史
(9)暂存区和工作区的区别
工作区:我们正常工作的目录项目根目录下(.git目录就在工作区,它不是工作区而是git的版本库)
暂存区:存在版本库.git里,通常称为stage,在git init时会为我们创建第一个分支master，以及指向master的指针HEAE
⚠:如果修改的文件没有被add倒暂存区，commit的时候将不会被提交到当前分支(因为git跟踪并管理的是修改而不是文件本身)
(10)git checkout — file （撤回没有add到暂存区的已经修改的文件）
(11)git reset HEAD file （撤回已经add到暂存区但是还没有commit的文件,撤回到了工作区,如果还想还原的话执行checkout命令）

(12)删除文件的时候一定要注意 ：(删除的是已经commit 到分支的文件)
⚠:切记不要执行rm file命令，如果实在执行了，可以通过checkout 撤回工作区的修改应为删除工作区的文件也是对工作区文件的修改所以可以通过checkout撤回修改
⚠:删除的时候执行git rm file这时候暂存区文件也给删除了，执行commit提交就行了
⚠:如果是删除没有commit到分支的文件看情况执行rm file或者git rm file

(13)远程仓库
git remote add origin https://github.com/easonlovejiven/learngit.git 关联一个远程仓库
关联之后推送最新的code
git push origin 本地工作分支 （把当前分支推送到远程）
⚠:第一推送时远程是空的所以要加-u参数(git push -u origin 本地工作分支)

(14)分支管理
创建合并分支:
git checkout -b dev 创建并切换到dev分支，相当于:git branch dev ,git checkout dev
git branch 列出本地所有分支
git checkout 分支名 切换分支
git merge 分支名  合并分支
git branch -d 分支名 合并之后就可以删除新建的开发分支了
⚠：新建的分支默认和本地master分支一样的内容
解决分支冲突：
both modified :文件的这个状态证明有冲突了
当merge出现冲突时git无法自动合并,必须手动的修改冲突的文件（merge后修改）修改成要merge的那个分支，修改完后删除要merge的那个分支，然后add，commit提交
git log —graph 查看分支合并图

(15)分支管理策略
(16)bug分支
如果要修复bug时，需要建立专门的bug分支来修复,然后合并,最后删除
git stash：存储当前（dev）分支的工作现场(去处理其它分支的事情)
git stash pop：其它分支处理完了，切换到dev分支，恢复之前未完成的工作内容

⚠:合并分支的时候要想避免冲突尽量在合并的分支是在要合并分支上checkout的分支

(17)远程仓库
远程仓库的默认名称是origin
git remote ：查看远程分支的名称
git branch origin 本地分支
git pull ：更新远程分支最新的修改到本地

(18)标签管理

撤回上次提交
git reset HEAD^
如果删除了一个已经push的本地的分支想要恢复的话，运行git br -a看下远程分支纪录然后运行git co remotes/origin/T183-2 恢复分支

cat ~/.gitconfig 可以自己去配置git命令的简写形式
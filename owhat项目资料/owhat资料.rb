1, git
任务分支就是测试分支
当要提交分支的时候
git add .
git commit -m '任务描述'

git co master
git pull
git co 原分支
git rebase master
有冲突解决冲突没有冲突的话继续rebase
git rebase continue
在任何时候可以用(git rebase --abort来终止rebase的行动重新回到任务分支的commit之后的状态)
最后再git push


git reset --soft b84e82b07e8747e52d3a0b8c448fe606683f0139  (合并分支的多个提交 这个版本号是上一个分支提交的最后一个版本号)
git commit -m "推送优化"
git pull --rebase origin master
git push origin push_optimize -f

1,加载rufus-scheduler
require 'rufus-scheduler'
s = Rufus::Scheduler.new
(1),5秒后执行
s.in '5s' do
 p '开始执行了！'
end
(2),在特定时间间隔内执行
s.every '3s' do
	p '每隔3s开始执行'
end
(3),在特定时间单位执行
s.cron '0 22 * * 1-5' do
	p '一周的每一天在22:00(10点)'
end
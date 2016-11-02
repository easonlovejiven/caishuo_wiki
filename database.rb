create database db_name # 新建数据库
drop database db_name # 删除数据库
create table tb_name(
	id int(11) not null auto_increment primary key,
	name varchar(255));
); # 创建表
insert into tb_name (name) values ('name_1'); # 插入数据
drop table tb_name / delete from tb_name # 删除数据和表的物理结构/只删除数据
alter table tb_name add column column_name type # 给表添加列
 
 where > group by > having # 执行顺序

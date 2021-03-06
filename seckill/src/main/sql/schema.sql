-- 数据库初始化脚本

-- 创建数据库
CREATE DATABASE seckill;
-- 使用数据库
use seckill;
CREATE TABLE seckill(
  `seckill_id` BIGINT NOT NUll AUTO_INCREMENT COMMENT '商品库存ID',
  `name` VARCHAR(120) NOT NULL COMMENT '商品名称',
  `number` int NOT NULL COMMENT '库存数量',
  `start_time` TIMESTAMP  NOT NULL COMMENT '秒杀开始时间',
  `end_time`   TIMESTAMP   NOT NULL COMMENT '秒杀结束时间',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (seckill_id),
  key idx_start_time(start_time),
  key idx_end_time(end_time),
  key idx_create_time(create_time)
)ENGINE=INNODB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='秒杀库存表';

-- 初始化数据

INSERT into seckill(name,number,start_time,end_time)
VALUES('十元秒杀iPhonex',100,'2018-04-17 00:00:00','2018-04-18 00:00:00'),
('十元秒杀ipad',200,'2018-04-17 00:00:00','2018-04-18 00:00:00'),
('十元秒杀mix2',300,'2018-04-17 00:00:00','2018-04-18 00:00:00'),
('十元秒杀oppor11',400,'2018-04-17 00:00:00','2018-04-18 00:00:00');

-- 秒杀成功明细表
-- 用户登录认证相关信息(简化为手机号)
CREATE TABLE success_killed(
  `seckill_id` BIGINT NOT NULL COMMENT '秒杀商品ID',
  `user_phone` BIGINT NOT NULL COMMENT '用户手机号',
  `state` TINYINT NOT NULL DEFAULT -1 COMMENT '状态标识： 无效：-1 成功：0 已付款:1',
  `create_time` TIMESTAMP NOT NULL COMMENT '创建时间',
  PRIMARY KEY(seckill_id,user_phone),/*联合主键*/
  KEY idx_create_time(create_time)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='秒杀成功明细表';

-- SHOW CREATE TABLE seckill;#显示表的创建信息

-- 创建数据库
CREATE DATABASE IF NOT EXISTS `login` DEFAULT CHARACTER SET utf8mb4;

USE `login`;

-- 创建用户表
CREATE TABLE IF NOT EXISTS `user` (
    `id` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    `username` VARCHAR(50) NOT NULL UNIQUE COMMENT '用户名',
    `password` VARCHAR(100) NOT NULL COMMENT '密码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 插入测试数据（可选）
INSERT INTO `user` (`username`, `password`) VALUES ('admin', '123456');


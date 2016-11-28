/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50155
Source Host           : localhost:3306
Source Database       : rent-house

Target Server Type    : MYSQL
Target Server Version : 50155
File Encoding         : 65001

Date: 2016-11-28 17:55:43
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `rh_depart`
-- ----------------------------
DROP TABLE IF EXISTS `rh_depart`;
CREATE TABLE `rh_depart` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `depart_name` varchar(100) NOT NULL COMMENT '部门名称',
  `description` longtext COMMENT '部门描述',
  `parent_depart_id` varchar(32) DEFAULT NULL COMMENT '父ID',
  `org_code` varchar(64) DEFAULT NULL COMMENT '部门编码',
  `org_type` varchar(20) DEFAULT NULL COMMENT '部门类型',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机号码',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人id',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `fk_parent_depart_id` (`parent_depart_id`),
  CONSTRAINT `fk_parent_depart_id` FOREIGN KEY (`parent_depart_id`) REFERENCES `rh_depart` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rh_depart
-- ----------------------------
INSERT INTO rh_depart VALUES ('A01', '北京北京', '', null, '', '', '', '', null, null, null, null, null, null);
INSERT INTO rh_depart VALUES ('A01A01', '昌平', '昌平', 'A01', '', '', '', '', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `rh_function`
-- ----------------------------
DROP TABLE IF EXISTS `rh_function`;
CREATE TABLE `rh_function` (
  `id` varchar(32) NOT NULL,
  `functionlevel` smallint(6) DEFAULT NULL COMMENT '菜单级别',
  `functionname` varchar(50) NOT NULL COMMENT '菜单名称',
  `functionorder` varchar(10) DEFAULT NULL COMMENT '菜单顺序',
  `functionurl` varchar(100) DEFAULT NULL COMMENT '菜单地址',
  `parent_function_id` varchar(32) DEFAULT NULL COMMENT '父ID',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标的css样式',
  `function_type` smallint(6) DEFAULT NULL COMMENT '菜单类型',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人id',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `permission` varchar(100) DEFAULT '' COMMENT '访问权限',
  PRIMARY KEY (`id`),
  KEY `fk_parent_function_id` (`parent_function_id`),
  CONSTRAINT `fk_parent_function_id` FOREIGN KEY (`parent_function_id`) REFERENCES `rh_function` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rh_function
-- ----------------------------
INSERT INTO rh_function VALUES ('A01', '1', '系统管理', '1', '', null, '', null, '', '', '', null, null, '', 'system');
INSERT INTO rh_function VALUES ('A01A01', '2', '用户管理', '1', 'user/list.do', 'A01', '', null, '', '', '', null, null, '', 'system.user.list');
INSERT INTO rh_function VALUES ('A01A02', '2', '菜单管理', '2', 'function/list.do', 'A01', '', null, '', '', '', null, null, '', 'system.functioin.list');
INSERT INTO rh_function VALUES ('A01A03', '2', '部门管理', '3', 'depart/list.do', 'A01', '', null, '', '', '', null, null, '', 'system.depart.list');
INSERT INTO rh_function VALUES ('A02', '2', '权限管理', '4', 'role/list.do', 'A01', '', null, '', '', '', null, null, '', 'system.role.list');

-- ----------------------------
-- Table structure for `rh_role`
-- ----------------------------
DROP TABLE IF EXISTS `rh_role`;
CREATE TABLE `rh_role` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `role_code` varchar(20) DEFAULT NULL COMMENT '角色编码',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人id',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rh_role
-- ----------------------------
INSERT INTO rh_role VALUES ('ec40dba24fa14ff6a589739904029cf0', 'admin', '管理员', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `rh_role_function`
-- ----------------------------
DROP TABLE IF EXISTS `rh_role_function`;
CREATE TABLE `rh_role_function` (
  `id` varchar(32) NOT NULL,
  `function_id` varchar(32) DEFAULT NULL,
  `role_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_function_role_id` (`function_id`),
  KEY `fk_role_function_id` (`role_id`),
  CONSTRAINT `fk_function_role_id` FOREIGN KEY (`function_id`) REFERENCES `rh_function` (`id`),
  CONSTRAINT `fk_role_function_id` FOREIGN KEY (`role_id`) REFERENCES `rh_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rh_role_function
-- ----------------------------

-- ----------------------------
-- Table structure for `rh_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `rh_role_user`;
CREATE TABLE `rh_role_user` (
  `id` varchar(32) NOT NULL,
  `role_id` varchar(32) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role_id` (`user_id`),
  KEY `fk_role_user_id` (`role_id`),
  CONSTRAINT `fk_role_user_id` FOREIGN KEY (`role_id`) REFERENCES `rh_role` (`id`),
  CONSTRAINT `fk_user_role_id` FOREIGN KEY (`user_id`) REFERENCES `rh_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rh_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for `rh_user`
-- ----------------------------
DROP TABLE IF EXISTS `rh_user`;
CREATE TABLE `rh_user` (
  `id` varchar(32) NOT NULL COMMENT '主键,UUID自动生成',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `salt` varchar(100) DEFAULT NULL COMMENT '盐值',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `real_name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `status` smallint(6) DEFAULT NULL COMMENT '用户状态',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `mobile_phone` varchar(30) DEFAULT NULL COMMENT '手机号码',
  `office_phone` varchar(20) DEFAULT NULL COMMENT '办公室电话',
  `region` varchar(50) DEFAULT NULL COMMENT '所属区域',
  `last_login_time` varchar(20) DEFAULT NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(20) DEFAULT NULL COMMENT '上次登录IP',
  `role_id` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `depart_id` varchar(32) DEFAULT NULL COMMENT '部门ID',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人id',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rh_user
-- ----------------------------
INSERT INTO rh_user VALUES ('4AC1A1D75ED04981A4D1371293DC237C', 'admin', '', '21232f297a57a5a743894a0e4a801fc3', 'admin', null, 'xmmxjy@163.com', '2016-11-24 10:54:14', '1', '18800112233', '', '', '', '', '', '', '', null, '', '', '2016-09-20 10:50:24', '');
INSERT INTO rh_user VALUES ('8dd2193c764946989ae63db8f9502683', 'test', null, '4061863caf7f28c0b0346719e764d561', 'test', null, '', null, '', '', '', '', '', '', '', '', '', null, '', '', null, '');

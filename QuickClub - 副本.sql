/*
 Navicat Premium Data Transfer

 Source Server         : Sunyiyou
 Source Server Type    : MySQL
 Source Server Version : 50547
 Source Host           : localhost
 Source Database       : QuickClub

 Target Server Type    : MySQL
 Target Server Version : 50547
 File Encoding         : utf-8

 Date: 04/09/2016 09:08:07 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `club`
-- ----------------------------
DROP TABLE IF EXISTS `club`;
CREATE TABLE `club` (
  `club_id` int(11) NOT NULL AUTO_INCREMENT,
  `clubname` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `setuptime` datetime DEFAULT NULL,
  `validationState` int(4) DEFAULT NULL,
  `user_id_leader` int(11) DEFAULT NULL,
  PRIMARY KEY (`club_id`),
  KEY `user_id_leader` (`user_id_leader`),
  CONSTRAINT `fk_club_leader` FOREIGN KEY (`user_id_leader`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `club`
-- ----------------------------
BEGIN;
INSERT INTO `club` VALUES ('1', '哈工大szdfgadfga', 'do cool thing tha', null, '2016-03-13 18:38:34', '1', '1'), ('2', null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `club_membership`
-- ----------------------------
DROP TABLE IF EXISTS `club_membership`;
CREATE TABLE `club_membership` (
  `user_id` int(11) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `club_id` (`club_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `fk_club` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`),
  CONSTRAINT `fk_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `club_membership`
-- ----------------------------
BEGIN;
INSERT INTO `club_membership` VALUES ('2', '1', '2'), ('3', '1', '6'), ('1', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `club_request`
-- ----------------------------
DROP TABLE IF EXISTS `club_request`;
CREATE TABLE `club_request` (
  `club_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `requestType` tinyint(4) DEFAULT NULL,
  KEY `club_id` (`club_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `fk_request_club` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`),
  CONSTRAINT `fk_request_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `club_request`
-- ----------------------------
BEGIN;
INSERT INTO `club_request` VALUES ('1', '2', '0');
COMMIT;

-- ----------------------------
--  Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menuname` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `isfather` int(11) DEFAULT NULL,
  `menu_id_parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `menu_id` (`menu_id`),
  KEY `menu_id_parent` (`menu_id_parent`),
  CONSTRAINT `fk_parent` FOREIGN KEY (`menu_id_parent`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `menu`
-- ----------------------------
BEGIN;
INSERT INTO `menu` VALUES ('1', '社团管理', null, '1', null), ('2', '社团成员调整', null, '0', '1'), ('3', '社团信息变更', null, '0', '1'), ('4', '社团职位调整', null, '1', '1'), ('5', '社团角色分配', null, '0', '4'), ('6', '社团角色管理', null, '0', '4'), ('7', '社团活动', null, '1', null), ('8', '查看日程', null, '0', '7'), ('9', '分配活动', null, '0', '7'), ('10', '编辑活动状态', null, '0', '7'), ('11', '评价活动', null, '0', '7'), ('12', '社团信息', null, '0', null), ('13', '社团成员', null, '0', null), ('14', '社团日志', null, '0', null), ('15', '社团论坛', null, '0', null);
COMMIT;

-- ----------------------------
--  Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  KEY `club_id` (`club_id`),
  CONSTRAINT `fk_role_club` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `role`
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES ('1', '主席', '大', '1'), ('2', '副主席', 'xiao', '1'), ('3', '成员', '辣鸡', '1'), ('5', '部长', '好腻害', '2'), ('6', '美工', '怕怕', '1'), ('7', '扫地的', '辣鸡', '1'), ('13', 'Kong', '哈哈哈', '1');
COMMIT;

-- ----------------------------
--  Table structure for `role_privilege`
-- ----------------------------
DROP TABLE IF EXISTS `role_privilege`;
CREATE TABLE `role_privilege` (
  `role_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  KEY `role_id` (`role_id`),
  KEY `menu_id` (`menu_id`),
  KEY `role_id_2` (`role_id`),
  KEY `menu_id_2` (`menu_id`),
  KEY `role_id_3` (`role_id`),
  KEY `menu_id_3` (`menu_id`),
  KEY `role_id_4` (`role_id`),
  KEY `menu_id_4` (`menu_id`),
  KEY `role_id_5` (`role_id`),
  KEY `menu_id_5` (`menu_id`),
  CONSTRAINT `fk_menu_privelege` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`),
  CONSTRAINT `fk_role_previlege` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `role_privilege`
-- ----------------------------
BEGIN;
INSERT INTO `role_privilege` VALUES ('5', '1'), ('5', '2'), ('5', '3'), ('7', '1'), ('7', '4'), ('7', '5'), ('7', '11'), ('6', '12'), ('13', '12'), ('2', '5'), ('2', '9'), ('2', '10'), ('2', '11'), ('1', '1'), ('1', '2'), ('1', '3'), ('1', '4'), ('1', '5'), ('1', '6'), ('1', '7'), ('1', '8'), ('1', '9'), ('1', '10'), ('1', '11'), ('1', '12'), ('1', '13'), ('1', '14'), ('1', '15');
COMMIT;

-- ----------------------------
--  Table structure for `school`
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `sch_id` int(11) NOT NULL AUTO_INCREMENT,
  `schoolname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `school`
-- ----------------------------
BEGIN;
INSERT INTO `school` VALUES ('1', '哈尔滨工业大学'), ('2', '北京大学');
COMMIT;

-- ----------------------------
--  Table structure for `task`
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `taskname` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `totalscore` int(11) DEFAULT NULL,
  `state` int(4) DEFAULT NULL,
  `time_id_begin` datetime DEFAULT NULL,
  `time_id_end` datetime DEFAULT NULL,
  `user_id_leader` int(11) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `time_id_begin` (`time_id_begin`),
  KEY `time_id_end` (`time_id_end`),
  KEY `user_id_leader` (`user_id_leader`),
  KEY `club_id` (`club_id`),
  KEY `time_id_begin_2` (`time_id_begin`),
  KEY `time_id_end_2` (`time_id_end`),
  KEY `user_id_leader_2` (`user_id_leader`),
  KEY `club_id_2` (`club_id`),
  CONSTRAINT `fk_club_task` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`),
  CONSTRAINT `fk_user_leader` FOREIGN KEY (`user_id_leader`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `task`
-- ----------------------------
BEGIN;
INSERT INTO `task` VALUES ('1', '发水果', 'hahahahahahh', '8', '0', '2016-04-22 15:39:54', '2016-04-29 13:40:58', '3', '1'), ('2', ' 敲代码', '敲代码papap', '10', '0', '2016-04-06 15:49:33', '2016-04-20 17:51:35', '3', '1'), ('3', 'papapapa', 'hahahahhaah', '6', '0', '2016-04-06 15:18:31', '2016-04-06 15:24:36', '2', '1'), ('4', 'xuxuxuux', 'xuxuxuuxuxuxuxu', '4', '0', '2016-04-06 15:23:09', '2016-04-07 15:33:14', '3', '1'), ('5', 'Add Event Title', 'Add Event Summary', null, '0', '2016-04-10 00:00:00', '2016-04-10 00:00:00', '3', '1');
COMMIT;

-- ----------------------------
--  Table structure for `task_participators`
-- ----------------------------
DROP TABLE IF EXISTS `task_participators`;
CREATE TABLE `task_participators` (
  `user_id_participator` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `contributeScore` int(11) DEFAULT NULL,
  KEY `user_id_participator` (`user_id_participator`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `fk_task_id` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`),
  CONSTRAINT `fk_user_participator` FOREIGN KEY (`user_id_participator`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `task_participators`
-- ----------------------------
BEGIN;
INSERT INTO `task_participators` VALUES ('2', '1', '0'), ('3', '1', '0'), ('2', '1', '0'), ('3', '2', '0'), ('3', '5', '0');
COMMIT;

-- ----------------------------
--  Table structure for `time`
-- ----------------------------
DROP TABLE IF EXISTS `time`;
CREATE TABLE `time` (
  `time_id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `week` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `class` int(11) DEFAULT NULL,
  `hour` int(11) DEFAULT NULL,
  `minute` int(11) DEFAULT NULL,
  PRIMARY KEY (`time_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `time`
-- ----------------------------
BEGIN;
INSERT INTO `time` VALUES ('1', '2016', '2', '4', '3', '4', '2', '5'), ('2', '2016', '2', '4', '4', '3', '3', '10');
COMMIT;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '1',
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL COMMENT '6',
  `image` varchar(255) DEFAULT NULL,
  `validationState` int(4) DEFAULT NULL COMMENT '验证状态，',
  `province` varchar(255) DEFAULT NULL COMMENT '8',
  `sch_id` int(11) DEFAULT NULL COMMENT '2',
  `major` varchar(255) DEFAULT NULL COMMENT '4',
  `institute` varchar(255) DEFAULT NULL COMMENT '学院3',
  `sex` varchar(255) DEFAULT NULL COMMENT '7',
  `time` varchar(255) DEFAULT NULL COMMENT '5入学时间',
  `schoolname` varchar(255) DEFAULT NULL COMMENT '学校名称',
  `scholar` varchar(255) DEFAULT NULL COMMENT '学历',
  PRIMARY KEY (`user_id`),
  KEY `sch_id` (`sch_id`),
  CONSTRAINT `fk_user_sch` FOREIGN KEY (`sch_id`) REFERENCES `school` (`sch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`username`,`password`,`email`,`phone`,`image`,`validationState`,`province`,`sch_id`,`major`,`institute`,`sex`,`time`,`schoolname`,`scholar`) values (1,'sunyiyou','123456','342065733@qq.com','15636835602',NULL,1,'黑龙江',1,NULL,NULL,NULL,NULL,NULL,NULL),(2,'sunpeng222','234567','233333333@qq.com','12345678902','/fileupload/6f2560fb37b14db89c6740de7e101a5b.jpeg',1,'黑龙江',1,'软件工程','傻逼学院','男','20140902','哈尔滨工业大学',NULL),(17,'孙鹏','1,1','123@qq.com','11111111111',NULL,NULL,'北京',1,'傻逼专业',NULL,'女','20140609',NULL,NULL),(18,NULL,'1,1','qqq@qqq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'孙鹏','1,1','123@qq.com','11111111111',NULL,NULL,'北京',1,'傻逼专业',NULL,'女','20140609',NULL,NULL),(20,'孙鹏','1,1','123@qq.com','11111111111',NULL,NULL,'北京',1,'傻逼专业',NULL,'女','20140609',NULL,NULL),(21,'孙鹏','1,1','123@qq.com','11111111111',NULL,NULL,'北京',1,'傻逼专业',NULL,'女','20140609',NULL,NULL),(22,NULL,'1,1','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'孙鹏','1,1','123@qq.com','11111111111',NULL,NULL,'北京',1,'傻逼专业',NULL,'女','20140609',NULL,NULL),(24,'孙鹏','1,1','123@qq.com','11111111111',NULL,NULL,'北京',1,'傻逼专业',NULL,'女','20140609',NULL,NULL),(25,'夏敏','1,1','sss@qq.com','11111111111',NULL,1,'四川',1,'软件工程','软件学院','女','20140609',NULL,NULL),(26,NULL,'111,111','test@qq.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


SET FOREIGN_KEY_CHECKS = 1;

/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50629
Source Host           : localhost:3306
Source Database       : xzgis

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2017-12-09 17:04:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gis_main
-- ----------------------------
DROP TABLE IF EXISTS `gis_main`;
CREATE TABLE `gis_main` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '编号',
  `bind_district` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所属区县',
  `bind_street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所属街镇',
  `responsible_department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '负责单位',
  `gis_kind` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '种类',
  `facility_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设施类型',
  `facility_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设施代码',
  `facility_starttime` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facility_agelimit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设施年限',
  `facility_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设施状态是否正常，1为true，0为flase',
  `facility_status_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态类型,损坏,老旧,使用功能下降,影响美观',
  `lng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '经度',
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '纬度',
  `datacollection_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据采集录入时间',
  `dataupdate_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据更新时间',
  `datainput_user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据录入人',
  `datacheck_user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据检查人',
  `customer_level` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户等级',
  `facility_volume` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设施体积',
  `facility_length` double DEFAULT NULL COMMENT '设施长',
  `facility_width` double DEFAULT NULL COMMENT '设施宽',
  `facility_height` double DEFAULT NULL COMMENT '设施高',
  `photo_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '照片编号',
  `photo_taketime` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '照片时间',
  `photo_spot` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '照片靶点',
  `photo_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片存储路径',
  `detailed_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT ' 详细地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of gis_main
-- ----------------------------

-- ----------------------------
-- Table structure for operate_history
-- ----------------------------
DROP TABLE IF EXISTS `operate_history`;
CREATE TABLE `operate_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `operate_user_id` varchar(32) DEFAULT NULL,
  `operete_type_id` int(32) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `operate_user_ip` varchar(32) DEFAULT NULL,
  `operate_user_mac` varchar(32) DEFAULT NULL,
  `local_server` varchar(32) DEFAULT NULL,
  `operate_user_city` varchar(32) DEFAULT NULL,
  `operate_summary` text,
  `is_success` int(32) DEFAULT NULL,
  UNIQUE KEY `IDX_RS_operate_history_ID` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='is_success : 0 false(失败)，1 true (成功)';

-- ----------------------------
-- Records of operate_history
-- ----------------------------
INSERT INTO `operate_history` VALUES ('1', '2bb49d9d514c48c5bebbf78beab3e179', '11', '2017-12-01 09:06:28', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('2', '2bb49d9d514c48c5bebbf78beab3e179', '11', '2017-12-01 09:06:40', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('3', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-08 13:38:06', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', 'PreparedStatementCallback; bad SQL grammar [delete from sweepmgr_auth where role_id =?]; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'xzgis.sweepmgr_auth\' doesn\'t exist', '0');
INSERT INTO `operate_history` VALUES ('4', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-08 13:42:44', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('5', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-08 13:42:52', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('6', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-08 16:43:41', '172.16.22.33', '', '127.0.0.1', '', '参数有误', '0');
INSERT INTO `operate_history` VALUES ('7', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-08 16:47:10', '172.16.22.33', '', '127.0.0.1', '', '参数有误', '0');
INSERT INTO `operate_history` VALUES ('8', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-09 14:23:54', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', '参数有误', '0');
INSERT INTO `operate_history` VALUES ('9', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-09 14:26:33', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', '参数有误', '0');
INSERT INTO `operate_history` VALUES ('10', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-09 14:27:51', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', '参数有误', '0');
INSERT INTO `operate_history` VALUES ('11', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-09 16:36:06', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', 'PreparedStatementCallback; bad SQL grammar [insert into web_user_auth (addWebRoleAuth,attribute_condition_id) values(?,?)]; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'addWebRoleAuth\' in \'field list\'', '0');
INSERT INTO `operate_history` VALUES ('12', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-09 16:37:04', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', 'PreparedStatementCallback; bad SQL grammar [insert into web_user_auth (addWebRoleAuth,attribute_condition_id) values(?,?)]; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'addWebRoleAuth\' in \'field list\'', '0');
INSERT INTO `operate_history` VALUES ('13', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-09 16:54:28', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', 'PreparedStatementCallback; bad SQL grammar [insert into web_user_auth (addWebRoleAuth,attribute_condition_id) values(?,?)]; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'addWebRoleAuth\' in \'field list\'', '0');
INSERT INTO `operate_history` VALUES ('14', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-09 16:55:55', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', 'PreparedStatementCallback; bad SQL grammar [insert into web_user_auth (addWebRoleAuth,attribute_condition_id) values(?,?)]; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'addWebRoleAuth\' in \'field list\'', '0');
INSERT INTO `operate_history` VALUES ('15', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-09 16:57:28', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', 'PreparedStatementCallback; bad SQL grammar [insert into web_user_auth (addWebRoleAuth,attribute_condition_id) values(?,?)]; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'addWebRoleAuth\' in \'field list\'', '0');
INSERT INTO `operate_history` VALUES ('16', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-09 16:58:03', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', 'PreparedStatementCallback; bad SQL grammar [insert into web_user_auth (addWebRoleAuth,attribute_condition_id) values(?,?)]; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'addWebRoleAuth\' in \'field list\'', '0');

-- ----------------------------
-- Table structure for operate_type
-- ----------------------------
DROP TABLE IF EXISTS `operate_type`;
CREATE TABLE `operate_type` (
  `id` int(10) NOT NULL,
  `operate_name` varchar(32) DEFAULT NULL,
  UNIQUE KEY `IDX_RS_operate_type_ID` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operate_type
-- ----------------------------
INSERT INTO `operate_type` VALUES ('1', '推送升级');
INSERT INTO `operate_type` VALUES ('2', '刷新设备状态');
INSERT INTO `operate_type` VALUES ('3', '设置自动更新');
INSERT INTO `operate_type` VALUES ('4', '导入EXCEL添加设备二维码');
INSERT INTO `operate_type` VALUES ('5', '导入项目数据');
INSERT INTO `operate_type` VALUES ('6', '编辑固件版本');
INSERT INTO `operate_type` VALUES ('7', '删除固件版本');
INSERT INTO `operate_type` VALUES ('8', '解绑设备');
INSERT INTO `operate_type` VALUES ('9', '重置密码');
INSERT INTO `operate_type` VALUES ('10', '添加用户');
INSERT INTO `operate_type` VALUES ('11', '编辑用户');
INSERT INTO `operate_type` VALUES ('12', '删除用户');
INSERT INTO `operate_type` VALUES ('13', '编辑角色');
INSERT INTO `operate_type` VALUES ('14', '添加角色');
INSERT INTO `operate_type` VALUES ('15', '删除角色');
INSERT INTO `operate_type` VALUES ('16', '权限设置');
INSERT INTO `operate_type` VALUES ('17', '前台用户登陆');

-- ----------------------------
-- Table structure for project_attribute
-- ----------------------------
DROP TABLE IF EXISTS `project_attribute`;
CREATE TABLE `project_attribute` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '属性名',
  `attribute_type` int(2) DEFAULT NULL COMMENT '属性类型：1，经度；2，维度；3，详细地址；4，图片编号',
  `attribute_index` int(3) DEFAULT NULL COMMENT '属性列数，当前属性位于detail的第几列',
  `attribute_active` int(1) DEFAULT '0' COMMENT '设置为筛选条件，激活时：1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of project_attribute
-- ----------------------------
INSERT INTO `project_attribute` VALUES ('00151280833338500001', '00151280833337500000', '序号', null, '1', '0');
INSERT INTO `project_attribute` VALUES ('00151280833338600002', '00151280833337500000', '调研编号', null, '2', '0');
INSERT INTO `project_attribute` VALUES ('00151280833338700003', '00151280833337500000', '区域', null, '3', '0');
INSERT INTO `project_attribute` VALUES ('00151280833338700004', '00151280833337500000', '街镇', null, '4', '0');
INSERT INTO `project_attribute` VALUES ('00151280833338800005', '00151280833337500000', '名称', null, '5', '0');
INSERT INTO `project_attribute` VALUES ('00151280833338800006', '00151280833337500000', '地址', null, '6', '0');
INSERT INTO `project_attribute` VALUES ('00151280833338900007', '00151280833337500000', '问题分类', null, '7', '0');
INSERT INTO `project_attribute` VALUES ('00151280833338900008', '00151280833337500000', '问题地址', null, '8', '0');
INSERT INTO `project_attribute` VALUES ('00151280833339000009', '00151280833337500000', '照片编号', null, '9', '0');
INSERT INTO `project_attribute` VALUES ('00151280833339000010', '00151280833337500000', '完成时间', null, '10', '1');
INSERT INTO `project_attribute` VALUES ('00151280833339000011', '00151280833337500000', '检查人员', null, '11', '1');
INSERT INTO `project_attribute` VALUES ('00151280833339100012', '00151280833337500000', '经度', null, '12', '0');
INSERT INTO `project_attribute` VALUES ('00151280833339100013', '00151280833337500000', '纬度', null, '13', '0');

-- ----------------------------
-- Table structure for project_attribute_condition
-- ----------------------------
DROP TABLE IF EXISTS `project_attribute_condition`;
CREATE TABLE `project_attribute_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_condition` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leaf` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of project_attribute_condition
-- ----------------------------
INSERT INTO `project_attribute_condition` VALUES ('32', '赵苏鸣', '00151280833339000011', '1');
INSERT INTO `project_attribute_condition` VALUES ('33', '田腾腾', '00151280833339000011', '1');
INSERT INTO `project_attribute_condition` VALUES ('35', '2017-11-18 00:00:00', '00151280833339000010', '1');
INSERT INTO `project_attribute_condition` VALUES ('36', '2017-11-19 00:00:00', '00151280833339000010', '1');
INSERT INTO `project_attribute_condition` VALUES ('37', '2017-11-20 00:00:00', '00151280833339000010', '1');
INSERT INTO `project_attribute_condition` VALUES ('38', '2017-11-27 00:00:00', '00151280833339000010', '1');
INSERT INTO `project_attribute_condition` VALUES ('39', '2017-10-15 00:00:00', '00151280833339000010', '1');
INSERT INTO `project_attribute_condition` VALUES ('40', '2017-11-21 00:00:00', '00151280833339000010', '1');
INSERT INTO `project_attribute_condition` VALUES ('41', '2017-10-10 00:00:00', '00151280833339000010', '1');

-- ----------------------------
-- Table structure for project_attribute_type
-- ----------------------------
DROP TABLE IF EXISTS `project_attribute_type`;
CREATE TABLE `project_attribute_type` (
  `id` int(2) NOT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_attribute_type
-- ----------------------------
INSERT INTO `project_attribute_type` VALUES ('0', '无');
INSERT INTO `project_attribute_type` VALUES ('1', '经度');
INSERT INTO `project_attribute_type` VALUES ('2', '维度');
INSERT INTO `project_attribute_type` VALUES ('3', '详细地址');
INSERT INTO `project_attribute_type` VALUES ('4', '图片编号');

-- ----------------------------
-- Table structure for project_condition_auth
-- ----------------------------
DROP TABLE IF EXISTS `project_condition_auth`;
CREATE TABLE `project_condition_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condition_id` int(11) DEFAULT NULL,
  `web_user_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of project_condition_auth
-- ----------------------------

-- ----------------------------
-- Table structure for project_detail
-- ----------------------------
DROP TABLE IF EXISTS `project_detail`;
CREATE TABLE `project_detail` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext3` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext4` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext5` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext6` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext7` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext8` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext9` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext10` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext11` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext12` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext13` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext14` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext15` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext16` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext17` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext18` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext19` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext20` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext21` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext22` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext23` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext24` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext25` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext26` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext27` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext28` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext29` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext30` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext31` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext32` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext33` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext34` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext35` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext36` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext37` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext38` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext39` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext40` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext41` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext42` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext43` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext44` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext45` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext46` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext47` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext48` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext49` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext50` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext51` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext52` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext53` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext54` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext55` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext56` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext57` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext58` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext59` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext60` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext61` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext62` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext63` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext64` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext65` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext66` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext67` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext68` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext69` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext70` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext71` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext72` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext73` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext74` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext75` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext76` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext77` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext78` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext79` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext80` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext81` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext82` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext83` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext84` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext85` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext86` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext87` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext88` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext89` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext90` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext91` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext92` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext93` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext94` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext95` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext96` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext97` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext98` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext99` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext100` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of project_detail
-- ----------------------------
INSERT INTO `project_detail` VALUES ('00151280833339200014', '00151280833337500000', '1', '0701181pp', '金山区', '漕泾镇', '绿地漕泾新苑二期', '富漕路461弄', '2', '16号', '1510972792968', '2017-11-18 00:00:00', '赵苏鸣', '121.411', '30.803', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833339300015', '00151280833337500000', '2', '0701181pp', '金山区', '漕泾镇', '绿地漕泾新苑二期', '富漕路461弄', '2', '42号', '1510973023481', '2017-11-18 00:00:00', '赵苏鸣', '121.411', '30.803', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833339400016', '00151280833337500000', '3', '0701181pp', '金山区', '漕泾镇', '绿地漕泾新苑二期', '富漕路461弄', '2', '34号', '1510973521484', '2017-11-18 00:00:00', '赵苏鸣', '121.409', '30.804', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833339500017', '00151280833337500000', '4', '0701181pp', '金山区', '漕泾镇', '绿地漕泾新苑二期', '富漕路461弄', '4', '42号', '1510973322265', '2017-11-18 00:00:00', '赵苏鸣', '121.41', '30.805', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833339500018', '00151280833337500000', '5', '0701163pp', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '2', '77号', '1510982355887', '2017-11-18 00:00:00', '赵苏鸣', '121.239', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833339600019', '00151280833337500000', '6', '0701163pp', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '2', '56号', '1510982650271', '2017-11-18 00:00:00', '赵苏鸣', '121.24', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833339800020', '00151280833337500000', '7', '0701163pp', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '2', '61号', '1510982771441', '2017-11-18 00:00:00', '赵苏鸣', '121.24', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833339900021', '00151280833337500000', '8', '0701163pp', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '2', '74号', '1510982873493', '2017-11-18 00:00:00', '赵苏鸣', '121.239', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833340000022', '00151280833337500000', '9', '0701163pp', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '4', '77号3层', '1510982415410', '2017-11-18 00:00:00', '赵苏鸣', '121.24', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833340100023', '00151280833337500000', '10', '0701163pp', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '4', '67号3层', '1510982554580', '2017-11-18 00:00:00', '赵苏鸣', '121.24', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833340200024', '00151280833337500000', '11', '0701167pp', '松江区', '广富林街道', '上尚缘', '广富林街道文翔路3588弄', '2', '30号', '1510986473646', '2017-11-18 00:00:00', '赵苏鸣', '121.188', '31.048', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833340300025', '00151280833337500000', '12', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '2', '310号', '1511059647684', '2017-11-19 00:00:00', '赵苏鸣', '121.431', '31.358', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833340400026', '00151280833337500000', '13', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '2', '311号', '1511060006132', '2017-11-19 00:00:00', '赵苏鸣', '121.43', '31.357', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833340400027', '00151280833337500000', '14', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '2', '338号', '1511060039032', '2017-11-19 00:00:00', '赵苏鸣', '121.431', '31.357', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833340500028', '00151280833337500000', '15', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '2', '353号', '1511060498038', '2017-11-19 00:00:00', '赵苏鸣', '121.432', '31.358', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833340600029', '00151280833337500000', '16', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '4', '342号', '1511059847852', '2017-11-19 00:00:00', '赵苏鸣', '121.431', '31.358', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833340700030', '00151280833337500000', '17', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '4', '331号', '1511059920491', '2017-11-19 00:00:00', '赵苏鸣', '121.43', '31.357', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833340800031', '00151280833337500000', '18', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '4', '338号1层', '1511060570114', '2017-11-19 00:00:00', '赵苏鸣', '121.431', '31.357', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833340900032', '00151280833337500000', '19', '0701144pp', '嘉定区', '真新街道', '金沙丽晶苑', '丰庄路99弄', '4', '边门', '1511065907603', '2017-11-19 00:00:00', '赵苏鸣', '121.365', '31.25', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833341000033', '00151280833337500000', '20', '0701144pp', '嘉定区', '真新街道', '金沙丽晶苑', '丰庄路99弄', '4', '9号14层', '1511066209247', '2017-11-19 00:00:00', '赵苏鸣', '121.365', '31.251', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833341100034', '00151280833337500000', '21', '0701144pp', '嘉定区', '真新街道', '金沙丽晶苑', '丰庄路99弄', '4', '5号7层', '1511066546401', '2017-11-19 00:00:00', '赵苏鸣', '121.366', '31.251', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833341200035', '00151280833337500000', '22', '0701060pp', '长宁区', '北新泾街道中队', '馥邦小区', '北渔路28弄', '4', '19号5层', '1511068641844', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833341200036', '00151280833337500000', '23', '0701060pp', '长宁区', '北新泾街道中队', '馥邦小区', '北渔路28弄', '4', '10号7层', '1511069104089', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833341300037', '00151280833337500000', '24', '0701060pp', '长宁区', '北新泾街道中队', '馥邦小区', '北渔路28弄', '2', '25号', '1511068778554', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.223', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833341400038', '00151280833337500000', '25', '0701060pp', '长宁区', '北新泾街道中队', '馥邦小区', '北渔路28弄', '2', '22号', '1511068810510', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833341600039', '00151280833337500000', '26', '0701059pp', '长宁区', '程家桥街道中队', '程桥一村', '哈密路', '4', '36号3层', '1511070824358', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833341700040', '00151280833337500000', '27', '0701059pp', '长宁区', '程家桥街道中队', '程桥一村', '哈密路', '4', '36号3层', '1511070844631', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833341800041', '00151280833337500000', '28', '0701059pp', '长宁区', '程家桥街道中队', '程桥一村', '哈密路', '3', '25号1层', '1511071030987', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833342000042', '00151280833337500000', '29', '0701059pp', '长宁区', '程家桥街道中队', '程桥一村', '哈密路', '1', '边门', '1511071147788', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833342100043', '00151280833337500000', '30', '0701103pp', '浦东新区', '高桥', '仁恒家园', '季景路555弄', '4', '9号4层', '1511145689750', '2017-11-20 00:00:00', '赵苏鸣', '121.601', '31.341', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833342200044', '00151280833337500000', '31', '0701103pp', '浦东新区', '高桥', '仁恒家园', '季景路555弄', '4', '17号3层', '1511145979556', '2017-11-20 00:00:00', '赵苏鸣', '121.6', '31.34', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833342400045', '00151280833337500000', '32', '0701105pp', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '4', '1号9层', '1511150130031', '2017-11-20 00:00:00', '赵苏鸣', '121.602', '31.261', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833342500046', '00151280833337500000', '33', '0701105pp', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '4', '1号7层', '1511150167846', '2017-11-20 00:00:00', '赵苏鸣', '121.603', '31.26', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833342600047', '00151280833337500000', '34', '0701105pp', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '4', '4号', '1511150296344', '2017-11-20 00:00:00', '赵苏鸣', '121.601', '31.261', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833342700048', '00151280833337500000', '35', '0701105pp', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '2', '1号', '1511150240569', '2017-11-20 00:00:00', '赵苏鸣', '121.604', '31.26', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833342800049', '00151280833337500000', '36', '0701105pp', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '2', '17号', '1511150807963', '2017-11-20 00:00:00', '赵苏鸣', '121.601', '31.261', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833343000050', '00151280833337500000', '37', '0701084pp', '浦东新区', '花木', '仁恒河滨', '丁香路1599弄', '4', '8号14层', '1511154249011', '2017-11-27 00:00:00', '赵苏鸣', '121.573', '31.236', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833343100051', '00151280833337500000', '38', '0701084pp', '浦东新区', '花木', '仁恒河滨', '丁香路1599弄', '4', '26号4层', '1511154847762', '2017-11-27 00:00:00', '赵苏鸣', '121.573', '31.236', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833343300052', '00151280833337500000', '39', '0701086pp', '浦东新区', '洋泾', '国际华城', '张杨路1515弄', '4', '17号', '1511158764003', '2017-11-20 00:00:00', '赵苏鸣', '121.543', '31.242', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833343400053', '00151280833337500000', '40', '0701112pp', '浦东新区', '书院', '新舒苑北苑', '丽正路1059弄', '2', '球场', '1508044307448', '2017-10-15 00:00:00', '赵苏鸣', '121.871', '30.984', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833343500054', '00151280833337500000', '41', '0701054pp', '长宁区', '华阳路街道中队', '悦达花苑', '武夷路555号', '4', '6号7层', '1511235681495', '2017-11-21 00:00:00', '赵苏鸣', '121.425', '31.22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833343600055', '00151280833337500000', '42', '0701054pp', '长宁区', '华阳路街道中队', '悦达花苑', '武夷路555号', '4', '18号8层', '1511236034782', '2017-11-21 00:00:00', '赵苏鸣', '121.425', '31.22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833343700056', '00151280833337500000', '43', '0701054pp', '长宁区', '华阳路街道中队', '悦达花苑', '武夷路555号', '4', '22号6层', '1511236223111', '2017-11-21 00:00:00', '赵苏鸣', '121.425', '31.22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833343800057', '00151280833337500000', '44', '0701053pp', '长宁区', '江苏路街道中队', '畅园', '愚园路888号', '4', '41号', '1511241302285', '2017-11-27 00:00:00', '赵苏鸣', '121.424', '31.22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833343900058', '00151280833337500000', '45', '0701040pp', '杨浦区', '定海路街道', '建设新苑', '爱国路301弄', '4', '12号楼3楼楼梯口', '1507612185514', '2017-10-10 00:00:00', '田腾腾', '121.557', '31.285', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833344000059', '00151280833337500000', '46', '0701041pp', '杨浦区', '大桥街道', '申通公寓', '长阳路1315弄', '2', '小区大门左转3米处', '1507017375069', '2017-10-10 00:00:00', '田腾腾', '121.535', '31.273', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833344100060', '00151280833337500000', '47', '0701041pp', '杨浦区', '大桥街道', '申通公寓', '长阳路1315弄', '2', '一号楼门口对面', '1507017399645', '2017-10-10 00:00:00', '田腾腾', '121.535', '31.273', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151280833344100061', '00151280833337500000', '48', '0701041pp', '杨浦区', '大桥街道', '申通公寓', '长阳路1315弄', '2', '2号楼门口左边', '1507018174053', '2017-10-10 00:00:00', '田腾腾', '121.534', '31.274', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for project_main
-- ----------------------------
DROP TABLE IF EXISTS `project_main`;
CREATE TABLE `project_main` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '保存路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of project_main
-- ----------------------------
INSERT INTO `project_main` VALUES ('00151280833337500000', '2017年10月上海城管小区问题清单', '2017-12-09 16:32:13', null, null, 'F:\\tempfilepath\\1512808332247管小区汇总2 - 测试.xlsx');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '1', '1', '1', '1', null);
INSERT INTO `t_user` VALUES ('2', 'zhao', null, null, null, null);
INSERT INTO `t_user` VALUES ('3', 'test', null, null, null, null);

-- ----------------------------
-- Table structure for user_auth
-- ----------------------------
DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE `user_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_auth
-- ----------------------------
INSERT INTO `user_auth` VALUES ('89', '3', '1');
INSERT INTO `user_auth` VALUES ('90', '132', '1');
INSERT INTO `user_auth` VALUES ('91', '131', '1');
INSERT INTO `user_auth` VALUES ('92', '2', '1');
INSERT INTO `user_auth` VALUES ('93', '123', '1');
INSERT INTO `user_auth` VALUES ('94', '122', '1');
INSERT INTO `user_auth` VALUES ('95', '121', '1');
INSERT INTO `user_auth` VALUES ('96', '1', '1');
INSERT INTO `user_auth` VALUES ('97', '115', '1');
INSERT INTO `user_auth` VALUES ('98', '114', '1');
INSERT INTO `user_auth` VALUES ('99', '113', '1');
INSERT INTO `user_auth` VALUES ('100', '112', '1');
INSERT INTO `user_auth` VALUES ('101', '111', '1');

-- ----------------------------
-- Table structure for user_login
-- ----------------------------
DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login` (
  `id` varchar(32) NOT NULL,
  `user_name` varchar(32) DEFAULT NULL,
  `user_password` varchar(32) DEFAULT NULL,
  `user_role` int(32) DEFAULT NULL,
  `is_delete` int(32) DEFAULT '0',
  `parent_id` varchar(255) DEFAULT NULL COMMENT '从属关系，父级id',
  `type` varchar(255) DEFAULT NULL,
  `create_date` varchar(255) DEFAULT NULL,
  `update_date` varchar(255) DEFAULT NULL,
  `is_allow_weblogin` int(10) DEFAULT '1' COMMENT '0:允许，1：不允许',
  `real_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `USER_LOGIN_ID` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_login
-- ----------------------------
INSERT INTO `user_login` VALUES ('2bb49d9d514c48c5bebbf78beab3e179', 'admin', 'admin', '1', '0', null, null, null, null, '0', null);
INSERT INTO `user_login` VALUES ('60672052e98a45ec800173a9b1829f5b', 'user', 'user', '7', '0', null, null, null, null, '1', null);

-- ----------------------------
-- Table structure for user_login_copy1
-- ----------------------------
DROP TABLE IF EXISTS `user_login_copy1`;
CREATE TABLE `user_login_copy1` (
  `id` varchar(32) NOT NULL,
  `user_name` varchar(32) DEFAULT NULL,
  `user_password` varchar(32) DEFAULT NULL,
  `user_role` int(32) DEFAULT NULL,
  `is_delete` int(32) DEFAULT '0',
  `parent_id` varchar(255) DEFAULT NULL COMMENT '从属关系，父级id',
  `type` varchar(255) DEFAULT NULL,
  `create_date` varchar(255) DEFAULT NULL,
  `update_date` varchar(255) DEFAULT NULL,
  `is_allow_weblogin` int(10) DEFAULT '1' COMMENT '0:允许，1：不允许',
  `real_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `USER_LOGIN_ID` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_login_copy1
-- ----------------------------
INSERT INTO `user_login_copy1` VALUES ('2bb49d9d514c48c5bebbf78beab3e179', 'admin', 'admin', '1', '0', null, null, null, null, '0', null);
INSERT INTO `user_login_copy1` VALUES ('60672052e98a45ec800173a9b1829f5b', 'user', 'user', '7', '0', null, null, null, null, '1', null);

-- ----------------------------
-- Table structure for user_menu
-- ----------------------------
DROP TABLE IF EXISTS `user_menu`;
CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `menu_url` varchar(255) DEFAULT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  `leaf` varchar(255) DEFAULT NULL,
  `button` int(10) DEFAULT NULL,
  `auth_leaf` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_menu
-- ----------------------------
INSERT INTO `user_menu` VALUES ('1', null, null, '系统管理', '0', '0', '0');
INSERT INTO `user_menu` VALUES ('2', null, null, '前端管理', '0', '0', '0');
INSERT INTO `user_menu` VALUES ('3', null, null, '项目管理', '0', '0', '0');
INSERT INTO `user_menu` VALUES ('111', '1', 'welcome.jsp', '登陆记录', '1', '0', '1');
INSERT INTO `user_menu` VALUES ('112', '1', 'welcome.jsp', '操作记录', '1', '0', '1');
INSERT INTO `user_menu` VALUES ('113', '1', 'PasswordMgr.jsp', '密码管理', '1', '0', '1');
INSERT INTO `user_menu` VALUES ('114', '1', 'userMgr.jsp', '用户管理', '1', '0', '1');
INSERT INTO `user_menu` VALUES ('115', '1', 'userAuth.jsp', '权限管理', '1', '0', '1');
INSERT INTO `user_menu` VALUES ('121', '2', 'webUserMgr.jsp', '前端用户管理', '1', '0', '1');
INSERT INTO `user_menu` VALUES ('123', '2', 'webUserAuth.jsp', '前端筛选权限设置', '1', '0', '1');
INSERT INTO `user_menu` VALUES ('131', '3', 'projectMgr.jsp', '项目数据管理', '1', '0', '1');
INSERT INTO `user_menu` VALUES ('132', '3', 'welcome.jsp', '项目管理2', '1', '0', '1');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) DEFAULT NULL,
  `is_delete` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='is_delete : 0   未删除 1：已删除';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '管理员', '0');
INSERT INTO `user_role` VALUES ('2', '普通用户', '1');
INSERT INTO `user_role` VALUES ('4', '超级管理员', '1');
INSERT INTO `user_role` VALUES ('5', 'user', '1');
INSERT INTO `user_role` VALUES ('6', '普通用户', '1');
INSERT INTO `user_role` VALUES ('7', 'user', '0');
INSERT INTO `user_role` VALUES ('8', '123213', '1');
INSERT INTO `user_role` VALUES ('9', '123213', '0');

-- ----------------------------
-- Table structure for web_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `web_user_auth`;
CREATE TABLE `web_user_auth` (
  `id` varchar(50) NOT NULL,
  `attribute_condition_id` varchar(50) DEFAULT NULL,
  `web_user_role_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_user_auth
-- ----------------------------

-- ----------------------------
-- Table structure for web_user_login
-- ----------------------------
DROP TABLE IF EXISTS `web_user_login`;
CREATE TABLE `web_user_login` (
  `id` varchar(32) NOT NULL,
  `user_name` varchar(32) DEFAULT NULL,
  `user_password` varchar(32) DEFAULT NULL,
  `user_role` int(32) DEFAULT NULL,
  `is_delete` int(32) DEFAULT '0',
  `parent_id` varchar(255) DEFAULT NULL COMMENT '从属关系，父级id',
  `type` varchar(255) DEFAULT NULL,
  `create_date` varchar(255) DEFAULT NULL,
  `update_date` varchar(255) DEFAULT NULL,
  `is_allow_weblogin` int(10) DEFAULT '1' COMMENT '0:允许，1：不允许',
  `real_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `USER_LOGIN_ID` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_user_login
-- ----------------------------
INSERT INTO `web_user_login` VALUES ('2bb49d9d514c48c5bebbf78beab3e179', 'admin', 'admin', '1', '0', null, null, null, null, '0', null);
INSERT INTO `web_user_login` VALUES ('60672052e98a45ec800173a9b1829f5b', 'zhou', 'user', '7', '0', null, null, null, null, '1', null);

-- ----------------------------
-- Table structure for web_user_role
-- ----------------------------
DROP TABLE IF EXISTS `web_user_role`;
CREATE TABLE `web_user_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) DEFAULT NULL,
  `is_delete` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='is_delete : 0   未删除 1：已删除';

-- ----------------------------
-- Records of web_user_role
-- ----------------------------
INSERT INTO `web_user_role` VALUES ('1', '管理员', '0');
INSERT INTO `web_user_role` VALUES ('2', '静安区管理', '0');
INSERT INTO `web_user_role` VALUES ('7', '宝山区绿化', '0');
INSERT INTO `web_user_role` VALUES ('9', '上海市绿化', '0');

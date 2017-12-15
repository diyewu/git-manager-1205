/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50629
Source Host           : localhost:3306
Source Database       : xzgis

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2017-12-15 16:26:14
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='is_success : 0 false(失败)，1 true (成功)';

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
INSERT INTO `operate_history` VALUES ('17', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-09 21:04:50', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('18', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-09 21:04:57', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('19', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-09 21:23:14', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('20', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-09 21:24:11', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('21', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-09 21:44:45', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('22', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-09 21:45:17', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('23', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-09 22:07:06', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('24', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-09 22:08:27', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('25', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-10 11:00:27', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('26', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-10 11:01:49', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('27', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-10 11:15:36', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', 'PreparedStatementCallback; SQL [insert into project_condition_auth (web_user_role_id,condition_id) values(?,?)]; Data truncation: Out of range value for column \'condition_id\' at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Out of range value for column \'condition_id\' at row 1', '0');
INSERT INTO `operate_history` VALUES ('28', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-10 11:17:03', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('29', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-10 11:24:30', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('30', '2bb49d9d514c48c5bebbf78beab3e179', '14', '2017-12-10 17:13:30', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('31', '2bb49d9d514c48c5bebbf78beab3e179', '15', '2017-12-10 17:18:33', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('32', '2bb49d9d514c48c5bebbf78beab3e179', '10', '2017-12-10 17:22:57', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('33', '2bb49d9d514c48c5bebbf78beab3e179', '11', '2017-12-10 17:31:51', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('34', '2bb49d9d514c48c5bebbf78beab3e179', '11', '2017-12-10 17:37:17', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('35', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-10 19:56:41', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('36', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-10 19:57:41', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('37', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-10 20:17:25', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('38', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-10 20:17:32', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('39', '2bb49d9d514c48c5bebbf78beab3e179', '15', '2017-12-10 20:55:53', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('40', '2bb49d9d514c48c5bebbf78beab3e179', '14', '2017-12-10 20:57:27', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('41', '2bb49d9d514c48c5bebbf78beab3e179', '13', '2017-12-10 21:06:06', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('42', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-12 16:53:59', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('43', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-12 17:01:05', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('44', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-12 17:17:59', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('45', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-14 16:41:50', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('46', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-14 17:01:36', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('47', '2bb49d9d514c48c5bebbf78beab3e179', '19', '2017-12-15 09:55:49', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('48', '2bb49d9d514c48c5bebbf78beab3e179', '11', '2017-12-15 10:14:13', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', 'PreparedStatementCallback; bad SQL grammar [  select is_allow_weblogin,user_name from web_user_login where id = ? ]; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'is_allow_weblogin\' in \'field list\'', '0');
INSERT INTO `operate_history` VALUES ('49', '2bb49d9d514c48c5bebbf78beab3e179', '11', '2017-12-15 10:16:43', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('50', '2bb49d9d514c48c5bebbf78beab3e179', '11', '2017-12-15 10:16:53', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('51', '2bb49d9d514c48c5bebbf78beab3e179', '11', '2017-12-15 10:19:13', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('52', '2bb49d9d514c48c5bebbf78beab3e179', '11', '2017-12-15 10:22:09', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('53', '2bb49d9d514c48c5bebbf78beab3e179', '11', '2017-12-15 10:22:57', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('54', '2bb49d9d514c48c5bebbf78beab3e179', '11', '2017-12-15 10:24:41', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('55', '2bb49d9d514c48c5bebbf78beab3e179', '15', '2017-12-15 10:59:24', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', '当前角色不能删除!', '0');
INSERT INTO `operate_history` VALUES ('56', '2bb49d9d514c48c5bebbf78beab3e179', '15', '2017-12-15 11:00:42', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('57', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-15 15:23:54', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('58', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-15 15:29:31', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('59', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-15 16:06:12', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');

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
INSERT INTO `operate_type` VALUES ('18', '导入项目图片数据');
INSERT INTO `operate_type` VALUES ('19', '删除手机标识码');

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
INSERT INTO `project_attribute` VALUES ('00151323566661700001005056c00001', '00151323566661600000005056c00001', '序号', null, '1', '1');
INSERT INTO `project_attribute` VALUES ('00151323566662000002005056c00001', '00151323566661600000005056c00001', '调研编号', null, '2', '0');
INSERT INTO `project_attribute` VALUES ('00151323566662000003005056c00001', '00151323566661600000005056c00001', '区域', null, '3', '0');
INSERT INTO `project_attribute` VALUES ('00151323566662100004005056c00001', '00151323566661600000005056c00001', '街镇', null, '4', '1');
INSERT INTO `project_attribute` VALUES ('00151323566662200005005056c00001', '00151323566661600000005056c00001', '名称', null, '5', '0');
INSERT INTO `project_attribute` VALUES ('00151323566662300006005056c00001', '00151323566661600000005056c00001', '地址', '3', '6', '0');
INSERT INTO `project_attribute` VALUES ('00151323566662300007005056c00001', '00151323566661600000005056c00001', '问题分类', null, '7', '0');
INSERT INTO `project_attribute` VALUES ('00151323566662400008005056c00001', '00151323566661600000005056c00001', '问题地址', null, '8', '1');
INSERT INTO `project_attribute` VALUES ('00151323566662400009005056c00001', '00151323566661600000005056c00001', '照片编号', '4', '9', '0');
INSERT INTO `project_attribute` VALUES ('00151323566662500010005056c00001', '00151323566661600000005056c00001', '完成时间', null, '10', '0');
INSERT INTO `project_attribute` VALUES ('00151323566662500011005056c00001', '00151323566661600000005056c00001', '检查人员', null, '11', '0');
INSERT INTO `project_attribute` VALUES ('00151323566662600012005056c00001', '00151323566661600000005056c00001', '经度', '1', '12', '0');
INSERT INTO `project_attribute` VALUES ('00151323566662600013005056c00001', '00151323566661600000005056c00001', '纬度', '2', '13', '0');
INSERT INTO `project_attribute` VALUES ('00151324042912200001005056c00001', '00151324042911900000005056c00001', '序号', null, '1', '0');
INSERT INTO `project_attribute` VALUES ('00151324042912300002005056c00001', '00151324042911900000005056c00001', '调研编号', null, '2', '0');
INSERT INTO `project_attribute` VALUES ('00151324042912400003005056c00001', '00151324042911900000005056c00001', '区域', null, '3', '1');
INSERT INTO `project_attribute` VALUES ('00151324042912400004005056c00001', '00151324042911900000005056c00001', '街镇', null, '4', '0');
INSERT INTO `project_attribute` VALUES ('00151324042912500005005056c00001', '00151324042911900000005056c00001', '名称', null, '5', '0');
INSERT INTO `project_attribute` VALUES ('00151324042912600006005056c00001', '00151324042911900000005056c00001', '地址', '3', '6', '0');
INSERT INTO `project_attribute` VALUES ('00151324042912600007005056c00001', '00151324042911900000005056c00001', '问题分类', null, '7', '0');
INSERT INTO `project_attribute` VALUES ('00151324042912700008005056c00001', '00151324042911900000005056c00001', '问题地址', null, '8', '0');
INSERT INTO `project_attribute` VALUES ('00151324042912800009005056c00001', '00151324042911900000005056c00001', '照片编号', '4', '9', '0');
INSERT INTO `project_attribute` VALUES ('00151324042912900010005056c00001', '00151324042911900000005056c00001', '完成时间', null, '10', '0');
INSERT INTO `project_attribute` VALUES ('00151324042912900011005056c00001', '00151324042911900000005056c00001', '检查人员', null, '11', '1');
INSERT INTO `project_attribute` VALUES ('00151324042913000012005056c00001', '00151324042911900000005056c00001', '经度', '1', '12', '0');
INSERT INTO `project_attribute` VALUES ('00151324042913000013005056c00001', '00151324042911900000005056c00001', '纬度', '2', '13', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=1959 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of project_attribute_condition
-- ----------------------------
INSERT INTO `project_attribute_condition` VALUES ('1775', '1', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1776', '2', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1777', '3', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1778', '4', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1779', '5', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1780', '6', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1781', '7', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1782', '8', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1783', '9', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1784', '10', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1785', '11', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1786', '12', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1787', '13', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1788', '14', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1789', '15', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1790', '16', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1791', '17', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1792', '18', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1793', '19', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1794', '20', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1795', '21', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1796', '22', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1797', '23', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1798', '24', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1799', '25', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1800', '26', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1801', '27', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1802', '28', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1803', '29', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1804', '30', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1805', '31', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1806', '32', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1807', '33', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1808', '34', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1809', '35', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1810', '36', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1811', '37', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1812', '38', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1813', '39', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1814', '40', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1815', '41', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1816', '42', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1817', '43', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1818', '44', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1819', '45', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1820', '46', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1821', '47', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1822', '48', '00151323566661700001005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1838', '漕泾镇', '00151323566662100004005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1839', '岳阳街道', '00151323566662100004005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1840', '广富林街道', '00151323566662100004005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1841', '顾村镇', '00151323566662100004005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1842', '真新街道', '00151323566662100004005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1843', '北新泾街道中队', '00151323566662100004005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1844', '程家桥街道中队', '00151323566662100004005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1845', '高桥', '00151323566662100004005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1846', '浦兴', '00151323566662100004005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1847', '花木', '00151323566662100004005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1848', '洋泾', '00151323566662100004005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1849', '书院', '00151323566662100004005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1850', '华阳路街道中队', '00151323566662100004005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1851', '江苏路街道中队', '00151323566662100004005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1852', '定海路街道', '00151323566662100004005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1853', '大桥街道', '00151323566662100004005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1869', '16号', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1870', '42号', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1871', '34号', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1872', '77号', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1873', '56号', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1874', '61号', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1875', '74号', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1876', '77号3层', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1877', '67号3层', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1878', '30号', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1879', '310号', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1880', '311号', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1881', '338号', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1882', '353号', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1883', '342号', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1884', '331号', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1885', '338号1层', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1886', '边门', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1887', '9号14层', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1888', '5号7层', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1889', '19号5层', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1890', '10号7层', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1891', '25号', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1892', '22号', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1893', '36号3层', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1894', '25号1层', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1895', '9号4层', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1896', '17号3层', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1897', '1号9层', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1898', '1号7层', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1899', '4号', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1900', '1号', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1901', '17号', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1902', '8号14层', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1903', '26号4层', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1904', '球场', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1905', '6号7层', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1906', '18号8层', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1907', '22号6层', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1908', '41号', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1909', '12号楼3楼楼梯口', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1910', '小区大门左转3米处', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1911', '一号楼门口对面', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1912', '2号楼门口左边', '00151323566662400008005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1949', '金山区', '00151324042912400003005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1950', '松江区', '00151324042912400003005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1951', '宝山区', '00151324042912400003005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1952', '嘉定区', '00151324042912400003005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1953', '长宁区', '00151324042912400003005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1954', '浦东新区', '00151324042912400003005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1955', '杨浦区', '00151324042912400003005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1956', '赵苏鸣', '00151324042912900011005056c00001', '1');
INSERT INTO `project_attribute_condition` VALUES ('1957', '田腾腾', '00151324042912900011005056c00001', '1');

-- ----------------------------
-- Table structure for project_attribute_type
-- ----------------------------
DROP TABLE IF EXISTS `project_attribute_type`;
CREATE TABLE `project_attribute_type` (
  `id` int(2) NOT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  `alias_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_attribute_type
-- ----------------------------
INSERT INTO `project_attribute_type` VALUES ('0', '无', null);
INSERT INTO `project_attribute_type` VALUES ('1', '经度', 'latitude');
INSERT INTO `project_attribute_type` VALUES ('2', '纬度', 'longitude');
INSERT INTO `project_attribute_type` VALUES ('3', '详细地址', 'detail_address');
INSERT INTO `project_attribute_type` VALUES ('4', '图片编号', 'img_url');
INSERT INTO `project_attribute_type` VALUES ('5', '地图显示信息', 'coordinate_info');

-- ----------------------------
-- Table structure for project_condition_auth
-- ----------------------------
DROP TABLE IF EXISTS `project_condition_auth`;
CREATE TABLE `project_condition_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condition_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web_user_role_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=937 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of project_condition_auth
-- ----------------------------
INSERT INTO `project_condition_auth` VALUES ('54', '00151280833337500000', '7');
INSERT INTO `project_condition_auth` VALUES ('56', '448', '7');
INSERT INTO `project_condition_auth` VALUES ('689', '00151324042911900000005056c00001', '1');
INSERT INTO `project_condition_auth` VALUES ('690', '00151324042912900011005056c00001', '1');
INSERT INTO `project_condition_auth` VALUES ('691', '1957', '1');
INSERT INTO `project_condition_auth` VALUES ('692', '1956', '1');
INSERT INTO `project_condition_auth` VALUES ('693', '00151324042912400003005056c00001', '1');
INSERT INTO `project_condition_auth` VALUES ('694', '1955', '1');
INSERT INTO `project_condition_auth` VALUES ('695', '1954', '1');
INSERT INTO `project_condition_auth` VALUES ('696', '1953', '1');
INSERT INTO `project_condition_auth` VALUES ('697', '1952', '1');
INSERT INTO `project_condition_auth` VALUES ('698', '1951', '1');
INSERT INTO `project_condition_auth` VALUES ('699', '1950', '1');
INSERT INTO `project_condition_auth` VALUES ('700', '1949', '1');
INSERT INTO `project_condition_auth` VALUES ('701', '00151323566661600000005056c00001', '1');
INSERT INTO `project_condition_auth` VALUES ('702', '00151323566662400008005056c00001', '1');
INSERT INTO `project_condition_auth` VALUES ('703', '1912', '1');
INSERT INTO `project_condition_auth` VALUES ('704', '1911', '1');
INSERT INTO `project_condition_auth` VALUES ('705', '1910', '1');
INSERT INTO `project_condition_auth` VALUES ('706', '1909', '1');
INSERT INTO `project_condition_auth` VALUES ('707', '1908', '1');
INSERT INTO `project_condition_auth` VALUES ('708', '1907', '1');
INSERT INTO `project_condition_auth` VALUES ('709', '1906', '1');
INSERT INTO `project_condition_auth` VALUES ('710', '1905', '1');
INSERT INTO `project_condition_auth` VALUES ('711', '1904', '1');
INSERT INTO `project_condition_auth` VALUES ('712', '1903', '1');
INSERT INTO `project_condition_auth` VALUES ('713', '1902', '1');
INSERT INTO `project_condition_auth` VALUES ('714', '1901', '1');
INSERT INTO `project_condition_auth` VALUES ('715', '1900', '1');
INSERT INTO `project_condition_auth` VALUES ('716', '1899', '1');
INSERT INTO `project_condition_auth` VALUES ('717', '1898', '1');
INSERT INTO `project_condition_auth` VALUES ('718', '1897', '1');
INSERT INTO `project_condition_auth` VALUES ('719', '1896', '1');
INSERT INTO `project_condition_auth` VALUES ('720', '1895', '1');
INSERT INTO `project_condition_auth` VALUES ('721', '1894', '1');
INSERT INTO `project_condition_auth` VALUES ('722', '1893', '1');
INSERT INTO `project_condition_auth` VALUES ('723', '1892', '1');
INSERT INTO `project_condition_auth` VALUES ('724', '1891', '1');
INSERT INTO `project_condition_auth` VALUES ('725', '1890', '1');
INSERT INTO `project_condition_auth` VALUES ('726', '1889', '1');
INSERT INTO `project_condition_auth` VALUES ('727', '1888', '1');
INSERT INTO `project_condition_auth` VALUES ('728', '1887', '1');
INSERT INTO `project_condition_auth` VALUES ('729', '1886', '1');
INSERT INTO `project_condition_auth` VALUES ('730', '1885', '1');
INSERT INTO `project_condition_auth` VALUES ('731', '1884', '1');
INSERT INTO `project_condition_auth` VALUES ('732', '1883', '1');
INSERT INTO `project_condition_auth` VALUES ('733', '1882', '1');
INSERT INTO `project_condition_auth` VALUES ('734', '1881', '1');
INSERT INTO `project_condition_auth` VALUES ('735', '1880', '1');
INSERT INTO `project_condition_auth` VALUES ('736', '1879', '1');
INSERT INTO `project_condition_auth` VALUES ('737', '1878', '1');
INSERT INTO `project_condition_auth` VALUES ('738', '1877', '1');
INSERT INTO `project_condition_auth` VALUES ('739', '1876', '1');
INSERT INTO `project_condition_auth` VALUES ('740', '1875', '1');
INSERT INTO `project_condition_auth` VALUES ('741', '1874', '1');
INSERT INTO `project_condition_auth` VALUES ('742', '1873', '1');
INSERT INTO `project_condition_auth` VALUES ('743', '1872', '1');
INSERT INTO `project_condition_auth` VALUES ('744', '1871', '1');
INSERT INTO `project_condition_auth` VALUES ('745', '1870', '1');
INSERT INTO `project_condition_auth` VALUES ('746', '1869', '1');
INSERT INTO `project_condition_auth` VALUES ('747', '00151323566662100004005056c00001', '1');
INSERT INTO `project_condition_auth` VALUES ('748', '1853', '1');
INSERT INTO `project_condition_auth` VALUES ('749', '1852', '1');
INSERT INTO `project_condition_auth` VALUES ('750', '1851', '1');
INSERT INTO `project_condition_auth` VALUES ('751', '1850', '1');
INSERT INTO `project_condition_auth` VALUES ('752', '1849', '1');
INSERT INTO `project_condition_auth` VALUES ('753', '1848', '1');
INSERT INTO `project_condition_auth` VALUES ('754', '1847', '1');
INSERT INTO `project_condition_auth` VALUES ('755', '1846', '1');
INSERT INTO `project_condition_auth` VALUES ('756', '1845', '1');
INSERT INTO `project_condition_auth` VALUES ('757', '1844', '1');
INSERT INTO `project_condition_auth` VALUES ('758', '1843', '1');
INSERT INTO `project_condition_auth` VALUES ('759', '1842', '1');
INSERT INTO `project_condition_auth` VALUES ('760', '1841', '1');
INSERT INTO `project_condition_auth` VALUES ('761', '1840', '1');
INSERT INTO `project_condition_auth` VALUES ('762', '1839', '1');
INSERT INTO `project_condition_auth` VALUES ('763', '1838', '1');
INSERT INTO `project_condition_auth` VALUES ('764', '00151323566661700001005056c00001', '1');
INSERT INTO `project_condition_auth` VALUES ('765', '1822', '1');
INSERT INTO `project_condition_auth` VALUES ('766', '1821', '1');
INSERT INTO `project_condition_auth` VALUES ('767', '1820', '1');
INSERT INTO `project_condition_auth` VALUES ('768', '1819', '1');
INSERT INTO `project_condition_auth` VALUES ('769', '1818', '1');
INSERT INTO `project_condition_auth` VALUES ('770', '1817', '1');
INSERT INTO `project_condition_auth` VALUES ('771', '1816', '1');
INSERT INTO `project_condition_auth` VALUES ('772', '1815', '1');
INSERT INTO `project_condition_auth` VALUES ('773', '1814', '1');
INSERT INTO `project_condition_auth` VALUES ('774', '1813', '1');
INSERT INTO `project_condition_auth` VALUES ('775', '1812', '1');
INSERT INTO `project_condition_auth` VALUES ('776', '1811', '1');
INSERT INTO `project_condition_auth` VALUES ('777', '1810', '1');
INSERT INTO `project_condition_auth` VALUES ('778', '1809', '1');
INSERT INTO `project_condition_auth` VALUES ('779', '1808', '1');
INSERT INTO `project_condition_auth` VALUES ('780', '1807', '1');
INSERT INTO `project_condition_auth` VALUES ('781', '1806', '1');
INSERT INTO `project_condition_auth` VALUES ('782', '1805', '1');
INSERT INTO `project_condition_auth` VALUES ('783', '1804', '1');
INSERT INTO `project_condition_auth` VALUES ('784', '1803', '1');
INSERT INTO `project_condition_auth` VALUES ('785', '1802', '1');
INSERT INTO `project_condition_auth` VALUES ('786', '1801', '1');
INSERT INTO `project_condition_auth` VALUES ('787', '1800', '1');
INSERT INTO `project_condition_auth` VALUES ('788', '1799', '1');
INSERT INTO `project_condition_auth` VALUES ('789', '1798', '1');
INSERT INTO `project_condition_auth` VALUES ('790', '1797', '1');
INSERT INTO `project_condition_auth` VALUES ('791', '1796', '1');
INSERT INTO `project_condition_auth` VALUES ('792', '1795', '1');
INSERT INTO `project_condition_auth` VALUES ('793', '1794', '1');
INSERT INTO `project_condition_auth` VALUES ('794', '1793', '1');
INSERT INTO `project_condition_auth` VALUES ('795', '1792', '1');
INSERT INTO `project_condition_auth` VALUES ('796', '1791', '1');
INSERT INTO `project_condition_auth` VALUES ('797', '1790', '1');
INSERT INTO `project_condition_auth` VALUES ('798', '1789', '1');
INSERT INTO `project_condition_auth` VALUES ('799', '1788', '1');
INSERT INTO `project_condition_auth` VALUES ('800', '1787', '1');
INSERT INTO `project_condition_auth` VALUES ('801', '1786', '1');
INSERT INTO `project_condition_auth` VALUES ('802', '1785', '1');
INSERT INTO `project_condition_auth` VALUES ('803', '1784', '1');
INSERT INTO `project_condition_auth` VALUES ('804', '1783', '1');
INSERT INTO `project_condition_auth` VALUES ('805', '1782', '1');
INSERT INTO `project_condition_auth` VALUES ('806', '1781', '1');
INSERT INTO `project_condition_auth` VALUES ('807', '1780', '1');
INSERT INTO `project_condition_auth` VALUES ('808', '1779', '1');
INSERT INTO `project_condition_auth` VALUES ('809', '1778', '1');
INSERT INTO `project_condition_auth` VALUES ('810', '1777', '1');
INSERT INTO `project_condition_auth` VALUES ('811', '1776', '1');
INSERT INTO `project_condition_auth` VALUES ('812', '1775', '1');
INSERT INTO `project_condition_auth` VALUES ('813', '00151324042911900000005056c00001', '2');
INSERT INTO `project_condition_auth` VALUES ('814', '00151324042912900011005056c00001', '2');
INSERT INTO `project_condition_auth` VALUES ('815', '1957', '2');
INSERT INTO `project_condition_auth` VALUES ('816', '1956', '2');
INSERT INTO `project_condition_auth` VALUES ('817', '00151324042912400003005056c00001', '2');
INSERT INTO `project_condition_auth` VALUES ('818', '1955', '2');
INSERT INTO `project_condition_auth` VALUES ('819', '1954', '2');
INSERT INTO `project_condition_auth` VALUES ('820', '1953', '2');
INSERT INTO `project_condition_auth` VALUES ('821', '1952', '2');
INSERT INTO `project_condition_auth` VALUES ('822', '1951', '2');
INSERT INTO `project_condition_auth` VALUES ('823', '1950', '2');
INSERT INTO `project_condition_auth` VALUES ('824', '1949', '2');
INSERT INTO `project_condition_auth` VALUES ('825', '00151323566661600000005056c00001', '2');
INSERT INTO `project_condition_auth` VALUES ('826', '00151323566662400008005056c00001', '2');
INSERT INTO `project_condition_auth` VALUES ('827', '1912', '2');
INSERT INTO `project_condition_auth` VALUES ('828', '1911', '2');
INSERT INTO `project_condition_auth` VALUES ('829', '1910', '2');
INSERT INTO `project_condition_auth` VALUES ('830', '1909', '2');
INSERT INTO `project_condition_auth` VALUES ('831', '1908', '2');
INSERT INTO `project_condition_auth` VALUES ('832', '1907', '2');
INSERT INTO `project_condition_auth` VALUES ('833', '1906', '2');
INSERT INTO `project_condition_auth` VALUES ('834', '1905', '2');
INSERT INTO `project_condition_auth` VALUES ('835', '1904', '2');
INSERT INTO `project_condition_auth` VALUES ('836', '1903', '2');
INSERT INTO `project_condition_auth` VALUES ('837', '1902', '2');
INSERT INTO `project_condition_auth` VALUES ('838', '1901', '2');
INSERT INTO `project_condition_auth` VALUES ('839', '1900', '2');
INSERT INTO `project_condition_auth` VALUES ('840', '1899', '2');
INSERT INTO `project_condition_auth` VALUES ('841', '1898', '2');
INSERT INTO `project_condition_auth` VALUES ('842', '1897', '2');
INSERT INTO `project_condition_auth` VALUES ('843', '1896', '2');
INSERT INTO `project_condition_auth` VALUES ('844', '1895', '2');
INSERT INTO `project_condition_auth` VALUES ('845', '1894', '2');
INSERT INTO `project_condition_auth` VALUES ('846', '1893', '2');
INSERT INTO `project_condition_auth` VALUES ('847', '1892', '2');
INSERT INTO `project_condition_auth` VALUES ('848', '1891', '2');
INSERT INTO `project_condition_auth` VALUES ('849', '1890', '2');
INSERT INTO `project_condition_auth` VALUES ('850', '1889', '2');
INSERT INTO `project_condition_auth` VALUES ('851', '1888', '2');
INSERT INTO `project_condition_auth` VALUES ('852', '1887', '2');
INSERT INTO `project_condition_auth` VALUES ('853', '1886', '2');
INSERT INTO `project_condition_auth` VALUES ('854', '1885', '2');
INSERT INTO `project_condition_auth` VALUES ('855', '1884', '2');
INSERT INTO `project_condition_auth` VALUES ('856', '1883', '2');
INSERT INTO `project_condition_auth` VALUES ('857', '1882', '2');
INSERT INTO `project_condition_auth` VALUES ('858', '1881', '2');
INSERT INTO `project_condition_auth` VALUES ('859', '1880', '2');
INSERT INTO `project_condition_auth` VALUES ('860', '1879', '2');
INSERT INTO `project_condition_auth` VALUES ('861', '1878', '2');
INSERT INTO `project_condition_auth` VALUES ('862', '1877', '2');
INSERT INTO `project_condition_auth` VALUES ('863', '1876', '2');
INSERT INTO `project_condition_auth` VALUES ('864', '1875', '2');
INSERT INTO `project_condition_auth` VALUES ('865', '1874', '2');
INSERT INTO `project_condition_auth` VALUES ('866', '1873', '2');
INSERT INTO `project_condition_auth` VALUES ('867', '1872', '2');
INSERT INTO `project_condition_auth` VALUES ('868', '1871', '2');
INSERT INTO `project_condition_auth` VALUES ('869', '1870', '2');
INSERT INTO `project_condition_auth` VALUES ('870', '1869', '2');
INSERT INTO `project_condition_auth` VALUES ('871', '00151323566662100004005056c00001', '2');
INSERT INTO `project_condition_auth` VALUES ('872', '1853', '2');
INSERT INTO `project_condition_auth` VALUES ('873', '1852', '2');
INSERT INTO `project_condition_auth` VALUES ('874', '1851', '2');
INSERT INTO `project_condition_auth` VALUES ('875', '1850', '2');
INSERT INTO `project_condition_auth` VALUES ('876', '1849', '2');
INSERT INTO `project_condition_auth` VALUES ('877', '1848', '2');
INSERT INTO `project_condition_auth` VALUES ('878', '1847', '2');
INSERT INTO `project_condition_auth` VALUES ('879', '1846', '2');
INSERT INTO `project_condition_auth` VALUES ('880', '1845', '2');
INSERT INTO `project_condition_auth` VALUES ('881', '1844', '2');
INSERT INTO `project_condition_auth` VALUES ('882', '1843', '2');
INSERT INTO `project_condition_auth` VALUES ('883', '1842', '2');
INSERT INTO `project_condition_auth` VALUES ('884', '1841', '2');
INSERT INTO `project_condition_auth` VALUES ('885', '1840', '2');
INSERT INTO `project_condition_auth` VALUES ('886', '1839', '2');
INSERT INTO `project_condition_auth` VALUES ('887', '1838', '2');
INSERT INTO `project_condition_auth` VALUES ('888', '00151323566661700001005056c00001', '2');
INSERT INTO `project_condition_auth` VALUES ('889', '1822', '2');
INSERT INTO `project_condition_auth` VALUES ('890', '1821', '2');
INSERT INTO `project_condition_auth` VALUES ('891', '1820', '2');
INSERT INTO `project_condition_auth` VALUES ('892', '1819', '2');
INSERT INTO `project_condition_auth` VALUES ('893', '1818', '2');
INSERT INTO `project_condition_auth` VALUES ('894', '1817', '2');
INSERT INTO `project_condition_auth` VALUES ('895', '1816', '2');
INSERT INTO `project_condition_auth` VALUES ('896', '1815', '2');
INSERT INTO `project_condition_auth` VALUES ('897', '1814', '2');
INSERT INTO `project_condition_auth` VALUES ('898', '1813', '2');
INSERT INTO `project_condition_auth` VALUES ('899', '1812', '2');
INSERT INTO `project_condition_auth` VALUES ('900', '1811', '2');
INSERT INTO `project_condition_auth` VALUES ('901', '1810', '2');
INSERT INTO `project_condition_auth` VALUES ('902', '1809', '2');
INSERT INTO `project_condition_auth` VALUES ('903', '1808', '2');
INSERT INTO `project_condition_auth` VALUES ('904', '1807', '2');
INSERT INTO `project_condition_auth` VALUES ('905', '1806', '2');
INSERT INTO `project_condition_auth` VALUES ('906', '1805', '2');
INSERT INTO `project_condition_auth` VALUES ('907', '1804', '2');
INSERT INTO `project_condition_auth` VALUES ('908', '1803', '2');
INSERT INTO `project_condition_auth` VALUES ('909', '1802', '2');
INSERT INTO `project_condition_auth` VALUES ('910', '1801', '2');
INSERT INTO `project_condition_auth` VALUES ('911', '1800', '2');
INSERT INTO `project_condition_auth` VALUES ('912', '1799', '2');
INSERT INTO `project_condition_auth` VALUES ('913', '1798', '2');
INSERT INTO `project_condition_auth` VALUES ('914', '1797', '2');
INSERT INTO `project_condition_auth` VALUES ('915', '1796', '2');
INSERT INTO `project_condition_auth` VALUES ('916', '1795', '2');
INSERT INTO `project_condition_auth` VALUES ('917', '1794', '2');
INSERT INTO `project_condition_auth` VALUES ('918', '1793', '2');
INSERT INTO `project_condition_auth` VALUES ('919', '1792', '2');
INSERT INTO `project_condition_auth` VALUES ('920', '1791', '2');
INSERT INTO `project_condition_auth` VALUES ('921', '1790', '2');
INSERT INTO `project_condition_auth` VALUES ('922', '1789', '2');
INSERT INTO `project_condition_auth` VALUES ('923', '1788', '2');
INSERT INTO `project_condition_auth` VALUES ('924', '1787', '2');
INSERT INTO `project_condition_auth` VALUES ('925', '1786', '2');
INSERT INTO `project_condition_auth` VALUES ('926', '1785', '2');
INSERT INTO `project_condition_auth` VALUES ('927', '1784', '2');
INSERT INTO `project_condition_auth` VALUES ('928', '1783', '2');
INSERT INTO `project_condition_auth` VALUES ('929', '1782', '2');
INSERT INTO `project_condition_auth` VALUES ('930', '1781', '2');
INSERT INTO `project_condition_auth` VALUES ('931', '1780', '2');
INSERT INTO `project_condition_auth` VALUES ('932', '1779', '2');
INSERT INTO `project_condition_auth` VALUES ('933', '1778', '2');
INSERT INTO `project_condition_auth` VALUES ('934', '1777', '2');
INSERT INTO `project_condition_auth` VALUES ('935', '1776', '2');
INSERT INTO `project_condition_auth` VALUES ('936', '1775', '2');

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
  `img_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '经度',
  `latitude` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of project_detail
-- ----------------------------
INSERT INTO `project_detail` VALUES ('00151323566662800014005056c00001', '00151323566661600000005056c00001', '1', '0701181pp', '金山区', '漕泾镇', '绿地漕泾新苑二期', '富漕路461弄', '2', '16号', '1', '2017-11-18 00:00:00', '赵苏鸣', '121.411', '30.803', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'F:\\tempfilepath\\20171214\\1513237448272201611\\201611\\1.jpg', null, null);
INSERT INTO `project_detail` VALUES ('00151323566662900015005056c00001', '00151323566661600000005056c00001', '2', '0701181pp', '金山区', '漕泾镇', '绿地漕泾新苑二期', '富漕路461弄', '2', '42号', '2', '2017-11-18 00:00:00', '赵苏鸣', '121.411', '30.803', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'F:\\tempfilepath\\20171214\\1513237448272201611\\201611\\2.jpg', null, null);
INSERT INTO `project_detail` VALUES ('00151323566663000016005056c00001', '00151323566661600000005056c00001', '3', '0701181pp', '金山区', '漕泾镇', '绿地漕泾新苑二期', '富漕路461弄', '2', '34号', '3', '2017-11-18 00:00:00', '赵苏鸣', '121.409', '30.804', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'F:\\tempfilepath\\20171214\\1513237448272201611\\201611\\3.jpg', null, null);
INSERT INTO `project_detail` VALUES ('00151323566663100017005056c00001', '00151323566661600000005056c00001', '4', '0701181pp', '金山区', '漕泾镇', '绿地漕泾新苑二期', '富漕路461弄', '4', '42号', '4', '2017-11-18 00:00:00', '赵苏鸣', '121.41', '30.805', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'F:\\tempfilepath\\20171214\\1513237448272201611\\201611\\4.jpg', null, null);
INSERT INTO `project_detail` VALUES ('00151323566663100018005056c00001', '00151323566661600000005056c00001', '5', '0701163pp', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '2', '77号', '5', '2017-11-18 00:00:00', '赵苏鸣', '121.239', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'F:\\tempfilepath\\20171214\\1513237448272201611\\201611\\5.jpg', null, null);
INSERT INTO `project_detail` VALUES ('00151323566663200019005056c00001', '00151323566661600000005056c00001', '6', '0701163pp', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '2', '56号', '6', '2017-11-18 00:00:00', '赵苏鸣', '121.24', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'F:\\tempfilepath\\20171214\\1513237448272201611\\201611\\6.jpg', null, null);
INSERT INTO `project_detail` VALUES ('00151323566663300020005056c00001', '00151323566661600000005056c00001', '7', '0701163pp', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '2', '61号', '7', '2017-11-18 00:00:00', '赵苏鸣', '121.24', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'F:\\tempfilepath\\20171214\\1513237448272201611\\201611\\7.jpg', null, null);
INSERT INTO `project_detail` VALUES ('00151323566663400021005056c00001', '00151323566661600000005056c00001', '8', '0701163pp', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '2', '74号', '8', '2017-11-18 00:00:00', '赵苏鸣', '121.239', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'F:\\tempfilepath\\20171214\\1513237448272201611\\201611\\8.jpg', null, null);
INSERT INTO `project_detail` VALUES ('00151323566663500022005056c00001', '00151323566661600000005056c00001', '9', '0701163pp', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '4', '77号3层', '9', '2017-11-18 00:00:00', '赵苏鸣', '121.24', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566663600023005056c00001', '00151323566661600000005056c00001', '10', '0701163pp', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '4', '67号3层', '10', '2017-11-18 00:00:00', '赵苏鸣', '121.24', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566663800024005056c00001', '00151323566661600000005056c00001', '11', '0701167pp', '松江区', '广富林街道', '上尚缘', '广富林街道文翔路3588弄', '2', '30号', '11', '2017-11-18 00:00:00', '赵苏鸣', '121.188', '31.048', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566663900025005056c00001', '00151323566661600000005056c00001', '12', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '2', '310号', '12', '2017-11-19 00:00:00', '赵苏鸣', '121.431', '31.358', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566664200026005056c00001', '00151323566661600000005056c00001', '13', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '2', '311号', '13', '2017-11-19 00:00:00', '赵苏鸣', '121.43', '31.357', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566664300027005056c00001', '00151323566661600000005056c00001', '14', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '2', '338号', '14', '2017-11-19 00:00:00', '赵苏鸣', '121.431', '31.357', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566664400028005056c00001', '00151323566661600000005056c00001', '15', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '2', '353号', '15', '2017-11-19 00:00:00', '赵苏鸣', '121.432', '31.358', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566664400029005056c00001', '00151323566661600000005056c00001', '16', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '4', '342号', '16', '2017-11-19 00:00:00', '赵苏鸣', '121.431', '31.358', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566664500030005056c00001', '00151323566661600000005056c00001', '17', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '4', '331号', '17', '2017-11-19 00:00:00', '赵苏鸣', '121.43', '31.357', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566664600031005056c00001', '00151323566661600000005056c00001', '18', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '4', '338号1层', '18', '2017-11-19 00:00:00', '赵苏鸣', '121.431', '31.357', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566664600032005056c00001', '00151323566661600000005056c00001', '19', '0701144pp', '嘉定区', '真新街道', '金沙丽晶苑', '丰庄路99弄', '4', '边门', '19', '2017-11-19 00:00:00', '赵苏鸣', '121.365', '31.25', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566664700033005056c00001', '00151323566661600000005056c00001', '20', '0701144pp', '嘉定区', '真新街道', '金沙丽晶苑', '丰庄路99弄', '4', '9号14层', '20', '2017-11-19 00:00:00', '赵苏鸣', '121.365', '31.251', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566664900034005056c00001', '00151323566661600000005056c00001', '21', '0701144pp', '嘉定区', '真新街道', '金沙丽晶苑', '丰庄路99弄', '4', '5号7层', '21', '2017-11-19 00:00:00', '赵苏鸣', '121.366', '31.251', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566665000035005056c00001', '00151323566661600000005056c00001', '22', '0701060pp', '长宁区', '北新泾街道中队', '馥邦小区', '北渔路28弄', '4', '19号5层', '22', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566665100036005056c00001', '00151323566661600000005056c00001', '23', '0701060pp', '长宁区', '北新泾街道中队', '馥邦小区', '北渔路28弄', '4', '10号7层', '23', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566665300037005056c00001', '00151323566661600000005056c00001', '24', '0701060pp', '长宁区', '北新泾街道中队', '馥邦小区', '北渔路28弄', '2', '25号', '24', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.223', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566665600038005056c00001', '00151323566661600000005056c00001', '25', '0701060pp', '长宁区', '北新泾街道中队', '馥邦小区', '北渔路28弄', '2', '22号', '25', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566665700039005056c00001', '00151323566661600000005056c00001', '26', '0701059pp', '长宁区', '程家桥街道中队', '程桥一村', '哈密路', '4', '36号3层', '26', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566665800040005056c00001', '00151323566661600000005056c00001', '27', '0701059pp', '长宁区', '程家桥街道中队', '程桥一村', '哈密路', '4', '36号3层', '27', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566665900041005056c00001', '00151323566661600000005056c00001', '28', '0701059pp', '长宁区', '程家桥街道中队', '程桥一村', '哈密路', '3', '25号1层', '28', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566666000042005056c00001', '00151323566661600000005056c00001', '29', '0701059pp', '长宁区', '程家桥街道中队', '程桥一村', '哈密路', '1', '边门', '29', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566666100043005056c00001', '00151323566661600000005056c00001', '30', '0701103pp', '浦东新区', '高桥', '仁恒家园', '季景路555弄', '4', '9号4层', '30', '2017-11-20 00:00:00', '赵苏鸣', '121.601', '31.341', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566666200044005056c00001', '00151323566661600000005056c00001', '31', '0701103pp', '浦东新区', '高桥', '仁恒家园', '季景路555弄', '4', '17号3层', '31', '2017-11-20 00:00:00', '赵苏鸣', '121.6', '31.34', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566666300045005056c00001', '00151323566661600000005056c00001', '32', '0701105pp', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '4', '1号9层', '32', '2017-11-20 00:00:00', '赵苏鸣', '121.602', '31.261', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566666400046005056c00001', '00151323566661600000005056c00001', '33', '0701105pp', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '4', '1号7层', '33', '2017-11-20 00:00:00', '赵苏鸣', '121.603', '31.26', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566666400047005056c00001', '00151323566661600000005056c00001', '34', '0701105pp', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '4', '4号', '34', '2017-11-20 00:00:00', '赵苏鸣', '121.601', '31.261', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566666500048005056c00001', '00151323566661600000005056c00001', '35', '0701105pp', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '2', '1号', '35', '2017-11-20 00:00:00', '赵苏鸣', '121.604', '31.26', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566666600049005056c00001', '00151323566661600000005056c00001', '36', '0701105pp', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '2', '17号', '36', '2017-11-20 00:00:00', '赵苏鸣', '121.601', '31.261', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566666700050005056c00001', '00151323566661600000005056c00001', '37', '0701084pp', '浦东新区', '花木', '仁恒河滨', '丁香路1599弄', '4', '8号14层', '37', '2017-11-27 00:00:00', '赵苏鸣', '121.573', '31.236', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566666900051005056c00001', '00151323566661600000005056c00001', '38', '0701084pp', '浦东新区', '花木', '仁恒河滨', '丁香路1599弄', '4', '26号4层', '38', '2017-11-27 00:00:00', '赵苏鸣', '121.573', '31.236', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566667000052005056c00001', '00151323566661600000005056c00001', '39', '0701086pp', '浦东新区', '洋泾', '国际华城', '张杨路1515弄', '4', '17号', '39', '2017-11-20 00:00:00', '赵苏鸣', '121.543', '31.242', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566667100053005056c00001', '00151323566661600000005056c00001', '40', '0701112pp', '浦东新区', '书院', '新舒苑北苑', '丽正路1059弄', '2', '球场', '40', '2017-10-15 00:00:00', '赵苏鸣', '121.871', '30.984', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566667200054005056c00001', '00151323566661600000005056c00001', '41', '0701054pp', '长宁区', '华阳路街道中队', '悦达花苑', '武夷路555号', '4', '6号7层', '41', '2017-11-21 00:00:00', '赵苏鸣', '121.425', '31.22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566667300055005056c00001', '00151323566661600000005056c00001', '42', '0701054pp', '长宁区', '华阳路街道中队', '悦达花苑', '武夷路555号', '4', '18号8层', '42', '2017-11-21 00:00:00', '赵苏鸣', '121.425', '31.22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566667400056005056c00001', '00151323566661600000005056c00001', '43', '0701054pp', '长宁区', '华阳路街道中队', '悦达花苑', '武夷路555号', '4', '22号6层', '43', '2017-11-21 00:00:00', '赵苏鸣', '121.425', '31.22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566667500057005056c00001', '00151323566661600000005056c00001', '44', '0701053pp', '长宁区', '江苏路街道中队', '畅园', '愚园路888号', '4', '41号', '44', '2017-11-27 00:00:00', '赵苏鸣', '121.424', '31.22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566667600058005056c00001', '00151323566661600000005056c00001', '45', '0701040pp', '杨浦区', '定海路街道', '建设新苑', '爱国路301弄', '4', '12号楼3楼楼梯口', '45', '2017-10-10 00:00:00', '田腾腾', '121.557', '31.285', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566667600059005056c00001', '00151323566661600000005056c00001', '46', '0701041pp', '杨浦区', '大桥街道', '申通公寓', '长阳路1315弄', '2', '小区大门左转3米处', '46', '2017-10-10 00:00:00', '田腾腾', '121.535', '31.273', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566667700060005056c00001', '00151323566661600000005056c00001', '47', '0701041pp', '杨浦区', '大桥街道', '申通公寓', '长阳路1315弄', '2', '一号楼门口对面', '47', '2017-10-10 00:00:00', '田腾腾', '121.535', '31.273', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151323566667800061005056c00001', '00151323566661600000005056c00001', '48', '0701041pp', '杨浦区', '大桥街道', '申通公寓', '长阳路1315弄', '2', '2号楼门口左边', '48', '2017-10-10 00:00:00', '田腾腾', '121.534', '31.274', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042913100014005056c00001', '00151324042911900000005056c00001', '1', '0701181pp', '金山区', '漕泾镇', '绿地漕泾新苑二期', '富漕路461弄', '2', '16号', '1', '2017-11-18 00:00:00', '赵苏鸣', '121.411', '30.803', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042913200015005056c00001', '00151324042911900000005056c00001', '2', '0701181pp', '金山区', '漕泾镇', '绿地漕泾新苑二期', '富漕路461弄', '2', '42号', '2', '2017-11-18 00:00:00', '赵苏鸣', '121.411', '30.803', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042913600016005056c00001', '00151324042911900000005056c00001', '3', '0701181pp', '金山区', '漕泾镇', '绿地漕泾新苑二期', '富漕路461弄', '2', '34号', '3', '2017-11-18 00:00:00', '赵苏鸣', '121.409', '30.804', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042913700017005056c00001', '00151324042911900000005056c00001', '4', '0701181pp', '金山区', '漕泾镇', '绿地漕泾新苑二期', '富漕路461弄', '4', '42号', '4', '2017-11-18 00:00:00', '赵苏鸣', '121.41', '30.805', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042913900018005056c00001', '00151324042911900000005056c00001', '5', '0701163pp', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '2', '77号', '5', '2017-11-18 00:00:00', '赵苏鸣', '121.239', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042914000019005056c00001', '00151324042911900000005056c00001', '6', '0701163pp', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '2', '56号', '6', '2017-11-18 00:00:00', '赵苏鸣', '121.24', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042914100020005056c00001', '00151324042911900000005056c00001', '7', '0701163pp', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '2', '61号', '7', '2017-11-18 00:00:00', '赵苏鸣', '121.24', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042914100021005056c00001', '00151324042911900000005056c00001', '8', '0701163pp', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '2', '74号', '8', '2017-11-18 00:00:00', '赵苏鸣', '121.239', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042914200022005056c00001', '00151324042911900000005056c00001', '9', '0701163pp', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '4', '77号3层', '9', '2017-11-18 00:00:00', '赵苏鸣', '121.24', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042914300023005056c00001', '00151324042911900000005056c00001', '10', '0701163pp', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '4', '67号3层', '10', '2017-11-18 00:00:00', '赵苏鸣', '121.24', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042914400024005056c00001', '00151324042911900000005056c00001', '11', '0701167pp', '松江区', '广富林街道', '上尚缘', '广富林街道文翔路3588弄', '2', '30号', '11', '2017-11-18 00:00:00', '赵苏鸣', '121.188', '31.048', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042914500025005056c00001', '00151324042911900000005056c00001', '12', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '2', '310号', '12', '2017-11-19 00:00:00', '赵苏鸣', '121.431', '31.358', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042914500026005056c00001', '00151324042911900000005056c00001', '13', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '2', '311号', '13', '2017-11-19 00:00:00', '赵苏鸣', '121.43', '31.357', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042914600027005056c00001', '00151324042911900000005056c00001', '14', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '2', '338号', '14', '2017-11-19 00:00:00', '赵苏鸣', '121.431', '31.357', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042914700028005056c00001', '00151324042911900000005056c00001', '15', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '2', '353号', '15', '2017-11-19 00:00:00', '赵苏鸣', '121.432', '31.358', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042914700029005056c00001', '00151324042911900000005056c00001', '16', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '4', '342号', '16', '2017-11-19 00:00:00', '赵苏鸣', '121.431', '31.358', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042914800030005056c00001', '00151324042911900000005056c00001', '17', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '4', '331号', '17', '2017-11-19 00:00:00', '赵苏鸣', '121.43', '31.357', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042914800031005056c00001', '00151324042911900000005056c00001', '18', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '4', '338号1层', '18', '2017-11-19 00:00:00', '赵苏鸣', '121.431', '31.357', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042915000032005056c00001', '00151324042911900000005056c00001', '19', '0701144pp', '嘉定区', '真新街道', '金沙丽晶苑', '丰庄路99弄', '4', '边门', '19', '2017-11-19 00:00:00', '赵苏鸣', '121.365', '31.25', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042915100033005056c00001', '00151324042911900000005056c00001', '20', '0701144pp', '嘉定区', '真新街道', '金沙丽晶苑', '丰庄路99弄', '4', '9号14层', '20', '2017-11-19 00:00:00', '赵苏鸣', '121.365', '31.251', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042915200034005056c00001', '00151324042911900000005056c00001', '21', '0701144pp', '嘉定区', '真新街道', '金沙丽晶苑', '丰庄路99弄', '4', '5号7层', '21', '2017-11-19 00:00:00', '赵苏鸣', '121.366', '31.251', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042915400035005056c00001', '00151324042911900000005056c00001', '22', '0701060pp', '长宁区', '北新泾街道中队', '馥邦小区', '北渔路28弄', '4', '19号5层', '22', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042915500036005056c00001', '00151324042911900000005056c00001', '23', '0701060pp', '长宁区', '北新泾街道中队', '馥邦小区', '北渔路28弄', '4', '10号7层', '23', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042915600037005056c00001', '00151324042911900000005056c00001', '24', '0701060pp', '长宁区', '北新泾街道中队', '馥邦小区', '北渔路28弄', '2', '25号', '24', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.223', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042915800038005056c00001', '00151324042911900000005056c00001', '25', '0701060pp', '长宁区', '北新泾街道中队', '馥邦小区', '北渔路28弄', '2', '22号', '25', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042915900039005056c00001', '00151324042911900000005056c00001', '26', '0701059pp', '长宁区', '程家桥街道中队', '程桥一村', '哈密路', '4', '36号3层', '26', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042915900040005056c00001', '00151324042911900000005056c00001', '27', '0701059pp', '长宁区', '程家桥街道中队', '程桥一村', '哈密路', '4', '36号3层', '27', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042916000041005056c00001', '00151324042911900000005056c00001', '28', '0701059pp', '长宁区', '程家桥街道中队', '程桥一村', '哈密路', '3', '25号1层', '28', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042916100042005056c00001', '00151324042911900000005056c00001', '29', '0701059pp', '长宁区', '程家桥街道中队', '程桥一村', '哈密路', '1', '边门', '29', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042916100043005056c00001', '00151324042911900000005056c00001', '30', '0701103pp', '浦东新区', '高桥', '仁恒家园', '季景路555弄', '4', '9号4层', '30', '2017-11-20 00:00:00', '赵苏鸣', '121.601', '31.341', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042916200044005056c00001', '00151324042911900000005056c00001', '31', '0701103pp', '浦东新区', '高桥', '仁恒家园', '季景路555弄', '4', '17号3层', '31', '2017-11-20 00:00:00', '赵苏鸣', '121.6', '31.34', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042916300045005056c00001', '00151324042911900000005056c00001', '32', '0701105pp', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '4', '1号9层', '32', '2017-11-20 00:00:00', '赵苏鸣', '121.602', '31.261', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042916300046005056c00001', '00151324042911900000005056c00001', '33', '0701105pp', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '4', '1号7层', '33', '2017-11-20 00:00:00', '赵苏鸣', '121.603', '31.26', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042916400047005056c00001', '00151324042911900000005056c00001', '34', '0701105pp', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '4', '4号', '34', '2017-11-20 00:00:00', '赵苏鸣', '121.601', '31.261', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042916500048005056c00001', '00151324042911900000005056c00001', '35', '0701105pp', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '2', '1号', '35', '2017-11-20 00:00:00', '赵苏鸣', '121.604', '31.26', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042916600049005056c00001', '00151324042911900000005056c00001', '36', '0701105pp', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '2', '17号', '36', '2017-11-20 00:00:00', '赵苏鸣', '121.601', '31.261', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042916800050005056c00001', '00151324042911900000005056c00001', '37', '0701084pp', '浦东新区', '花木', '仁恒河滨', '丁香路1599弄', '4', '8号14层', '37', '2017-11-27 00:00:00', '赵苏鸣', '121.573', '31.236', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042916900051005056c00001', '00151324042911900000005056c00001', '38', '0701084pp', '浦东新区', '花木', '仁恒河滨', '丁香路1599弄', '4', '26号4层', '38', '2017-11-27 00:00:00', '赵苏鸣', '121.573', '31.236', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042917000052005056c00001', '00151324042911900000005056c00001', '39', '0701086pp', '浦东新区', '洋泾', '国际华城', '张杨路1515弄', '4', '17号', '39', '2017-11-20 00:00:00', '赵苏鸣', '121.543', '31.242', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042917000053005056c00001', '00151324042911900000005056c00001', '40', '0701112pp', '浦东新区', '书院', '新舒苑北苑', '丽正路1059弄', '2', '球场', '40', '2017-10-15 00:00:00', '赵苏鸣', '121.871', '30.984', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042917100054005056c00001', '00151324042911900000005056c00001', '41', '0701054pp', '长宁区', '华阳路街道中队', '悦达花苑', '武夷路555号', '4', '6号7层', '41', '2017-11-21 00:00:00', '赵苏鸣', '121.425', '31.22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042917200055005056c00001', '00151324042911900000005056c00001', '42', '0701054pp', '长宁区', '华阳路街道中队', '悦达花苑', '武夷路555号', '4', '18号8层', '42', '2017-11-21 00:00:00', '赵苏鸣', '121.425', '31.22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042917300056005056c00001', '00151324042911900000005056c00001', '43', '0701054pp', '长宁区', '华阳路街道中队', '悦达花苑', '武夷路555号', '4', '22号6层', '43', '2017-11-21 00:00:00', '赵苏鸣', '121.425', '31.22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042917400057005056c00001', '00151324042911900000005056c00001', '44', '0701053pp', '长宁区', '江苏路街道中队', '畅园', '愚园路888号', '4', '41号', '44', '2017-11-27 00:00:00', '赵苏鸣', '121.424', '31.22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042917500058005056c00001', '00151324042911900000005056c00001', '45', '0701040pp', '杨浦区', '定海路街道', '建设新苑', '爱国路301弄', '4', '12号楼3楼楼梯口', '45', '2017-10-10 00:00:00', '田腾腾', '121.557', '31.285', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042917500059005056c00001', '00151324042911900000005056c00001', '46', '0701041pp', '杨浦区', '大桥街道', '申通公寓', '长阳路1315弄', '2', '小区大门左转3米处', '46', '2017-10-10 00:00:00', '田腾腾', '121.535', '31.273', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042917600060005056c00001', '00151324042911900000005056c00001', '47', '0701041pp', '杨浦区', '大桥街道', '申通公寓', '长阳路1315弄', '2', '一号楼门口对面', '47', '2017-10-10 00:00:00', '田腾腾', '121.535', '31.273', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151324042917700061005056c00001', '00151324042911900000005056c00001', '48', '0701041pp', '杨浦区', '大桥街道', '申通公寓', '长阳路1315弄', '2', '2号楼门口左边', '48', '2017-10-10 00:00:00', '田腾腾', '121.534', '31.274', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

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
INSERT INTO `project_main` VALUES ('00151323566661600000005056c00001', '2017年10月上海城管小区问题清单', '2017-12-14 15:14:26', null, '2bb49d9d514c48c5bebbf78beab3e179', 'F:\\tempfilepath\\20171214\\1513235664758管小区汇总2 - 测试.xlsx');
INSERT INTO `project_main` VALUES ('00151324042911900000005056c00001', '2017年10月上海城管小区问题清单', '2017-12-14 16:33:49', null, '2bb49d9d514c48c5bebbf78beab3e179', 'F:\\tempfilepath\\20171214\\1513240427471管小区汇总2 - 测试.xlsx');

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
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_auth
-- ----------------------------
INSERT INTO `user_auth` VALUES ('102', '3', '1');
INSERT INTO `user_auth` VALUES ('103', '132', '1');
INSERT INTO `user_auth` VALUES ('104', '131', '1');
INSERT INTO `user_auth` VALUES ('105', '2', '1');
INSERT INTO `user_auth` VALUES ('106', '123', '1');
INSERT INTO `user_auth` VALUES ('107', '121', '1');
INSERT INTO `user_auth` VALUES ('108', '120', '1');
INSERT INTO `user_auth` VALUES ('109', '1', '1');
INSERT INTO `user_auth` VALUES ('110', '115', '1');
INSERT INTO `user_auth` VALUES ('111', '114', '1');
INSERT INTO `user_auth` VALUES ('112', '113', '1');
INSERT INTO `user_auth` VALUES ('113', '112', '1');

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
INSERT INTO `user_menu` VALUES ('112', '1', 'welcome1.jsp', '操作记录', '1', '0', '1');
INSERT INTO `user_menu` VALUES ('113', '1', 'PasswordMgr.jsp', '密码管理', '1', '0', '1');
INSERT INTO `user_menu` VALUES ('114', '1', 'userMgr.jsp', '用户管理', '1', '0', '1');
INSERT INTO `user_menu` VALUES ('115', '1', 'userAuth.jsp', '权限管理', '1', '0', '1');
INSERT INTO `user_menu` VALUES ('120', '2', 'webUserPhoneMgr.jsp', '前端用户APP登陆管理', '1', '0', '1');
INSERT INTO `user_menu` VALUES ('121', '2', 'webUserMgr.jsp', '前端用户管理', '1', '0', '1');
INSERT INTO `user_menu` VALUES ('123', '2', 'webUserAuth.jsp', '前端筛选权限设置', '1', '0', '1');
INSERT INTO `user_menu` VALUES ('131', '3', 'projectMgr.jsp', '项目数据管理', '1', '0', '1');
INSERT INTO `user_menu` VALUES ('132', '3', 'welcome1.jsp', '预留菜单', '1', '0', '1');

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
  `allow_phone_size` int(10) DEFAULT '1' COMMENT '允许登陆的设备数量',
  `real_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `USER_LOGIN_ID` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_user_login
-- ----------------------------
INSERT INTO `web_user_login` VALUES ('2bb49d9d514c48c5bebbf78beab3e179', 'admin', 'admin', '1', '0', null, null, null, null, '2', '管理员');
INSERT INTO `web_user_login` VALUES ('60672052e98a45ec800173a9b1829f5b', 'zhou', 'user', '7', '1', null, null, null, null, '1', '周期');
INSERT INTO `web_user_login` VALUES ('e2058de4d2704de08c952c768578bd20', '546a', 'asd', '9', '1', null, null, null, null, '1', '阿斯顿');

-- ----------------------------
-- Table structure for web_user_login_phone
-- ----------------------------
DROP TABLE IF EXISTS `web_user_login_phone`;
CREATE TABLE `web_user_login_phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `web_user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of web_user_login_phone
-- ----------------------------
INSERT INTO `web_user_login_phone` VALUES ('1', '2bb49d9d514c48c5bebbf78beab3e179', 'asd1232', '2017-12-15 14:51:13');
INSERT INTO `web_user_login_phone` VALUES ('2', '2bb49d9d514c48c5bebbf78beab3e179', 'asd1232', '2017-12-15 16:05:38');

-- ----------------------------
-- Table structure for web_user_role
-- ----------------------------
DROP TABLE IF EXISTS `web_user_role`;
CREATE TABLE `web_user_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) DEFAULT NULL,
  `is_delete` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='is_delete : 0   未删除 1：已删除';

-- ----------------------------
-- Records of web_user_role
-- ----------------------------
INSERT INTO `web_user_role` VALUES ('1', '上海市绿化管理员', '0');
INSERT INTO `web_user_role` VALUES ('2', '静安区管理', '0');
INSERT INTO `web_user_role` VALUES ('7', '宝山区绿化', '1');
INSERT INTO `web_user_role` VALUES ('9', '上海市绿化', '1');
INSERT INTO `web_user_role` VALUES ('10', 'asdsad', '1');
INSERT INTO `web_user_role` VALUES ('11', '宝山区总管', '0');

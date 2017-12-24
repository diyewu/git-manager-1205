/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50629
Source Host           : localhost:3306
Source Database       : xzgis

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2017-12-24 20:41:52
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='is_success : 0 false(失败)，1 true (成功)';

-- ----------------------------
-- Records of operate_history
-- ----------------------------
INSERT INTO `operate_history` VALUES ('1', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-23 17:54:51', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('2', '2bb49d9d514c48c5bebbf78beab3e179', '18', '2017-12-23 17:55:02', 'null', '', 'null', '', '请确认zip压缩包有正确数据！', '0');
INSERT INTO `operate_history` VALUES ('3', '2bb49d9d514c48c5bebbf78beab3e179', '18', '2017-12-23 17:56:09', 'null', '', 'null', '', '以下图片名称没有匹配到图片：9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,', '0');
INSERT INTO `operate_history` VALUES ('4', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-23 19:14:07', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('5', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-23 19:14:28', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('6', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-23 19:15:09', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('7', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-23 19:29:36', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('8', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-23 19:31:04', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('9', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-23 19:31:39', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('10', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-23 19:32:00', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('11', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-23 19:33:24', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');
INSERT INTO `operate_history` VALUES ('12', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2017-12-23 19:41:43', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1');

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
INSERT INTO `project_attribute` VALUES ('00151402283458500063', '00151402283458400062', '序号', null, '1', '0');
INSERT INTO `project_attribute` VALUES ('00151402283458600064', '00151402283458400062', '调研编号', '5', '2', '0');
INSERT INTO `project_attribute` VALUES ('00151402283458700065', '00151402283458400062', '区域', null, '3', '1');
INSERT INTO `project_attribute` VALUES ('00151402283458700066', '00151402283458400062', '街镇', null, '4', '0');
INSERT INTO `project_attribute` VALUES ('00151402283458700067', '00151402283458400062', '名称', null, '5', '0');
INSERT INTO `project_attribute` VALUES ('00151402283458800068', '00151402283458400062', '地址', '3', '6', '0');
INSERT INTO `project_attribute` VALUES ('00151402283458800069', '00151402283458400062', '问题分类', '9', '7', '0');
INSERT INTO `project_attribute` VALUES ('00151402283458900070', '00151402283458400062', '问题地址', null, '8', '0');
INSERT INTO `project_attribute` VALUES ('00151402283458900071', '00151402283458400062', '照片编号', '4', '9', '0');
INSERT INTO `project_attribute` VALUES ('00151402283459000072', '00151402283458400062', '完成时间', '7', '10', '0');
INSERT INTO `project_attribute` VALUES ('00151402283459000073', '00151402283458400062', '检查人员', null, '11', '1');
INSERT INTO `project_attribute` VALUES ('00151402283459000074', '00151402283458400062', '经度', '1', '12', '0');
INSERT INTO `project_attribute` VALUES ('00151402283459100075', '00151402283458400062', '纬度', '2', '13', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=1979 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of project_attribute_condition
-- ----------------------------
INSERT INTO `project_attribute_condition` VALUES ('1969', '金山区', '00151402283458700065', '1');
INSERT INTO `project_attribute_condition` VALUES ('1970', '松江区', '00151402283458700065', '1');
INSERT INTO `project_attribute_condition` VALUES ('1971', '宝山区', '00151402283458700065', '1');
INSERT INTO `project_attribute_condition` VALUES ('1972', '嘉定区', '00151402283458700065', '1');
INSERT INTO `project_attribute_condition` VALUES ('1973', '长宁区', '00151402283458700065', '1');
INSERT INTO `project_attribute_condition` VALUES ('1974', '浦东新区', '00151402283458700065', '1');
INSERT INTO `project_attribute_condition` VALUES ('1975', '杨浦区', '00151402283458700065', '1');
INSERT INTO `project_attribute_condition` VALUES ('1976', '赵苏鸣', '00151402283459000073', '1');
INSERT INTO `project_attribute_condition` VALUES ('1977', '田腾腾', '00151402283459000073', '1');

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
INSERT INTO `project_attribute_type` VALUES ('1', '经度', 'longitude');
INSERT INTO `project_attribute_type` VALUES ('2', '纬度', 'latitude');
INSERT INTO `project_attribute_type` VALUES ('3', '详细地址', 'detail_address');
INSERT INTO `project_attribute_type` VALUES ('4', '图片编号', 'img_url');
INSERT INTO `project_attribute_type` VALUES ('5', '调研编号', 'research_number');
INSERT INTO `project_attribute_type` VALUES ('6', '调研名称', 'research_name');
INSERT INTO `project_attribute_type` VALUES ('7', '检查时间', 'check_time');
INSERT INTO `project_attribute_type` VALUES ('8', '问题编号', 'question_number');
INSERT INTO `project_attribute_type` VALUES ('9', '问题类型', 'question_type');

-- ----------------------------
-- Table structure for project_condition_auth
-- ----------------------------
DROP TABLE IF EXISTS `project_condition_auth`;
CREATE TABLE `project_condition_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condition_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web_user_role_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1043 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of project_condition_auth
-- ----------------------------
INSERT INTO `project_condition_auth` VALUES ('1031', '00151402283458400062', '1');
INSERT INTO `project_condition_auth` VALUES ('1032', '00151402283459000073', '1');
INSERT INTO `project_condition_auth` VALUES ('1033', '1977', '1');
INSERT INTO `project_condition_auth` VALUES ('1034', '1976', '1');
INSERT INTO `project_condition_auth` VALUES ('1035', '00151402283458700065', '1');
INSERT INTO `project_condition_auth` VALUES ('1036', '1975', '1');
INSERT INTO `project_condition_auth` VALUES ('1037', '1974', '1');
INSERT INTO `project_condition_auth` VALUES ('1038', '1973', '1');
INSERT INTO `project_condition_auth` VALUES ('1039', '1972', '1');
INSERT INTO `project_condition_auth` VALUES ('1040', '1971', '1');
INSERT INTO `project_condition_auth` VALUES ('1041', '1970', '1');
INSERT INTO `project_condition_auth` VALUES ('1042', '1969', '1');

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
INSERT INTO `project_detail` VALUES ('00151402283459100076', '00151402283458400062', '1', '0701181pp', '金山区', '漕泾镇', '绿地漕泾新苑二期', '富漕路461弄', '2', '16号', '1', '2017-11-18 00:00:00', '赵苏鸣', '121.411', '30.803', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'F:\\tempfilepath\\20171223\\151402296892421312\\21312\\1.jpg', null, null);
INSERT INTO `project_detail` VALUES ('00151402283459200077', '00151402283458400062', '2', '0701181pp', '金山区', '漕泾镇', '绿地漕泾新苑二期', '富漕路461弄', '2', '42号', '2', '2017-11-18 00:00:00', '赵苏鸣', '121.411', '30.803', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'F:\\tempfilepath\\20171223\\151402296892421312\\21312\\2.jpg', null, null);
INSERT INTO `project_detail` VALUES ('00151402283459300078', '00151402283458400062', '3', '0701181pp', '金山区', '漕泾镇', '绿地漕泾新苑二期', '富漕路461弄', '2', '34号', '3', '2017-11-18 00:00:00', '赵苏鸣', '121.409', '30.804', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'F:\\tempfilepath\\20171223\\151402296892421312\\21312\\3.jpg', null, null);
INSERT INTO `project_detail` VALUES ('00151402283459400079', '00151402283458400062', '4', '0701181pp', '金山区', '漕泾镇', '绿地漕泾新苑二期', '富漕路461弄', '4', '42号', '4', '2017-11-18 00:00:00', '赵苏鸣', '121.41', '30.805', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'F:\\tempfilepath\\20171223\\151402296892421312\\21312\\4.jpg', null, null);
INSERT INTO `project_detail` VALUES ('00151402283459400080', '00151402283458400062', '5', '0701163pp', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '2', '77号', '5', '2017-11-18 00:00:00', '赵苏鸣', '121.239', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'F:\\tempfilepath\\20171223\\151402296892421312\\21312\\5.jpg', null, null);
INSERT INTO `project_detail` VALUES ('00151402283459500081', '00151402283458400062', '6', '0701163pp', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '2', '56号', '6', '2017-11-18 00:00:00', '赵苏鸣', '121.24', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'F:\\tempfilepath\\20171223\\151402296892421312\\21312\\6.jpg', null, null);
INSERT INTO `project_detail` VALUES ('00151402283459600082', '00151402283458400062', '7', '0701163pp', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '2', '61号', '7', '2017-11-18 00:00:00', '赵苏鸣', '121.24', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'F:\\tempfilepath\\20171223\\151402296892421312\\21312\\7.jpg', null, null);
INSERT INTO `project_detail` VALUES ('00151402283459600083', '00151402283458400062', '8', '0701163pp', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '2', '74号', '8', '2017-11-18 00:00:00', '赵苏鸣', '121.239', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'F:\\tempfilepath\\20171223\\151402296892421312\\21312\\8.jpg', null, null);
INSERT INTO `project_detail` VALUES ('00151402283459700084', '00151402283458400062', '9', '0701163pp', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '4', '77号3层', '9', '2017-11-18 00:00:00', '赵苏鸣', '121.24', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283459700085', '00151402283458400062', '10', '0701163pp', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '4', '67号3层', '10', '2017-11-18 00:00:00', '赵苏鸣', '121.24', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283459800086', '00151402283458400062', '11', '0701167pp', '松江区', '广富林街道', '上尚缘', '广富林街道文翔路3588弄', '2', '30号', '11', '2017-11-18 00:00:00', '赵苏鸣', '121.188', '31.048', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283459800087', '00151402283458400062', '12', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '2', '310号', '12', '2017-11-19 00:00:00', '赵苏鸣', '121.431', '31.358', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283459900088', '00151402283458400062', '13', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '2', '311号', '13', '2017-11-19 00:00:00', '赵苏鸣', '121.43', '31.357', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283459900089', '00151402283458400062', '14', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '2', '338号', '14', '2017-11-19 00:00:00', '赵苏鸣', '121.431', '31.357', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283460000090', '00151402283458400062', '15', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '2', '353号', '15', '2017-11-19 00:00:00', '赵苏鸣', '121.432', '31.358', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283460000091', '00151402283458400062', '16', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '4', '342号', '16', '2017-11-19 00:00:00', '赵苏鸣', '121.431', '31.358', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283460100092', '00151402283458400062', '17', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '4', '331号', '17', '2017-11-19 00:00:00', '赵苏鸣', '121.43', '31.357', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283460100093', '00151402283458400062', '18', '0701130pp', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '4', '338号1层', '18', '2017-11-19 00:00:00', '赵苏鸣', '121.431', '31.357', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283460200094', '00151402283458400062', '19', '0701144pp', '嘉定区', '真新街道', '金沙丽晶苑', '丰庄路99弄', '4', '边门', '19', '2017-11-19 00:00:00', '赵苏鸣', '121.365', '31.25', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283460300095', '00151402283458400062', '20', '0701144pp', '嘉定区', '真新街道', '金沙丽晶苑', '丰庄路99弄', '4', '9号14层', '20', '2017-11-19 00:00:00', '赵苏鸣', '121.365', '31.251', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283460300096', '00151402283458400062', '21', '0701144pp', '嘉定区', '真新街道', '金沙丽晶苑', '丰庄路99弄', '4', '5号7层', '21', '2017-11-19 00:00:00', '赵苏鸣', '121.366', '31.251', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283460400097', '00151402283458400062', '22', '0701060pp', '长宁区', '北新泾街道中队', '馥邦小区', '北渔路28弄', '4', '19号5层', '22', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283460400098', '00151402283458400062', '23', '0701060pp', '长宁区', '北新泾街道中队', '馥邦小区', '北渔路28弄', '4', '10号7层', '23', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283460500099', '00151402283458400062', '24', '0701060pp', '长宁区', '北新泾街道中队', '馥邦小区', '北渔路28弄', '2', '25号', '24', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.223', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283460600100', '00151402283458400062', '25', '0701060pp', '长宁区', '北新泾街道中队', '馥邦小区', '北渔路28弄', '2', '22号', '25', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283460700101', '00151402283458400062', '26', '0701059pp', '长宁区', '程家桥街道中队', '程桥一村', '哈密路', '4', '36号3层', '26', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283460700102', '00151402283458400062', '27', '0701059pp', '长宁区', '程家桥街道中队', '程桥一村', '哈密路', '4', '36号3层', '27', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283460800103', '00151402283458400062', '28', '0701059pp', '长宁区', '程家桥街道中队', '程桥一村', '哈密路', '3', '25号1层', '28', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283460800104', '00151402283458400062', '29', '0701059pp', '长宁区', '程家桥街道中队', '程桥一村', '哈密路', '1', '边门', '29', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283460900105', '00151402283458400062', '30', '0701103pp', '浦东新区', '高桥', '仁恒家园', '季景路555弄', '4', '9号4层', '30', '2017-11-20 00:00:00', '赵苏鸣', '121.601', '31.341', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283460900106', '00151402283458400062', '31', '0701103pp', '浦东新区', '高桥', '仁恒家园', '季景路555弄', '4', '17号3层', '31', '2017-11-20 00:00:00', '赵苏鸣', '121.6', '31.34', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283461000107', '00151402283458400062', '32', '0701105pp', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '4', '1号9层', '32', '2017-11-20 00:00:00', '赵苏鸣', '121.602', '31.261', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283461000108', '00151402283458400062', '33', '0701105pp', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '4', '1号7层', '33', '2017-11-20 00:00:00', '赵苏鸣', '121.603', '31.26', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283461100109', '00151402283458400062', '34', '0701105pp', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '4', '4号', '34', '2017-11-20 00:00:00', '赵苏鸣', '121.601', '31.261', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283461200110', '00151402283458400062', '35', '0701105pp', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '2', '1号', '35', '2017-11-20 00:00:00', '赵苏鸣', '121.604', '31.26', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283461200111', '00151402283458400062', '36', '0701105pp', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '2', '17号', '36', '2017-11-20 00:00:00', '赵苏鸣', '121.601', '31.261', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283461300112', '00151402283458400062', '37', '0701084pp', '浦东新区', '花木', '仁恒河滨', '丁香路1599弄', '4', '8号14层', '37', '2017-11-27 00:00:00', '赵苏鸣', '121.573', '31.236', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283461300113', '00151402283458400062', '38', '0701084pp', '浦东新区', '花木', '仁恒河滨', '丁香路1599弄', '4', '26号4层', '38', '2017-11-27 00:00:00', '赵苏鸣', '121.573', '31.236', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283461400114', '00151402283458400062', '39', '0701086pp', '浦东新区', '洋泾', '国际华城', '张杨路1515弄', '4', '17号', '39', '2017-11-20 00:00:00', '赵苏鸣', '121.543', '31.242', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283461400115', '00151402283458400062', '40', '0701112pp', '浦东新区', '书院', '新舒苑北苑', '丽正路1059弄', '2', '球场', '40', '2017-10-15 00:00:00', '赵苏鸣', '121.871', '30.984', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283461500116', '00151402283458400062', '41', '0701054pp', '长宁区', '华阳路街道中队', '悦达花苑', '武夷路555号', '4', '6号7层', '41', '2017-11-21 00:00:00', '赵苏鸣', '121.425', '31.22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283461600117', '00151402283458400062', '42', '0701054pp', '长宁区', '华阳路街道中队', '悦达花苑', '武夷路555号', '4', '18号8层', '42', '2017-11-21 00:00:00', '赵苏鸣', '121.425', '31.22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283461600118', '00151402283458400062', '43', '0701054pp', '长宁区', '华阳路街道中队', '悦达花苑', '武夷路555号', '4', '22号6层', '43', '2017-11-21 00:00:00', '赵苏鸣', '121.425', '31.22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283461700119', '00151402283458400062', '44', '0701053pp', '长宁区', '江苏路街道中队', '畅园', '愚园路888号', '4', '41号', '44', '2017-11-27 00:00:00', '赵苏鸣', '121.424', '31.22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283464200120', '00151402283458400062', '45', '0701040pp', '杨浦区', '定海路街道', '建设新苑', '爱国路301弄', '4', '12号楼3楼楼梯口', '45', '2017-10-10 00:00:00', '田腾腾', '121.557', '31.285', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283464300121', '00151402283458400062', '46', '0701041pp', '杨浦区', '大桥街道', '申通公寓', '长阳路1315弄', '2', '小区大门左转3米处', '46', '2017-10-10 00:00:00', '田腾腾', '121.535', '31.273', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283464900122', '00151402283458400062', '47', '0701041pp', '杨浦区', '大桥街道', '申通公寓', '长阳路1315弄', '2', '一号楼门口对面', '47', '2017-10-10 00:00:00', '田腾腾', '121.535', '31.273', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151402283465000123', '00151402283458400062', '48', '0701041pp', '杨浦区', '大桥街道', '申通公寓', '长阳路1315弄', '2', '2号楼门口左边', '48', '2017-10-10 00:00:00', '田腾腾', '121.534', '31.274', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

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
INSERT INTO `project_main` VALUES ('00151402283458400062', '2017年10月上海城管小区问题清单', '2017-12-23 17:53:54', null, '2bb49d9d514c48c5bebbf78beab3e179', 'F:\\tempfilepath\\20171223\\1514022834419管小区汇总2.xlsx');

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
INSERT INTO `user_menu` VALUES ('112', '1', 'operateHistory.jsp', '操作记录', '1', '0', '1');
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

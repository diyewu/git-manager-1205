/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50629
Source Host           : localhost:3306
Source Database       : xzgis

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2018-01-08 18:00:09
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
  `downfile_path` varchar(255) DEFAULT NULL,
  `downfile_type` varchar(100) DEFAULT NULL,
  UNIQUE KEY `IDX_RS_operate_history_ID` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='is_success : 0 false(失败)，1 true (成功)';

-- ----------------------------
-- Records of operate_history
-- ----------------------------
INSERT INTO `operate_history` VALUES ('1', '2bb49d9d514c48c5bebbf78beab3e179', '5', '2018-01-04 17:04:56', 'null', '', 'null', '', null, '1', null, null);
INSERT INTO `operate_history` VALUES ('2', '2bb49d9d514c48c5bebbf78beab3e179', '18', '2018-01-05 15:45:56', 'null', '', 'null', '', '以下图片名称没有匹配到图片：照片 (1025),照片 (1026),照片 (1027),照片 (1028),照片 (1029),照片 (1030),照片 (1031),照片 (1032),照片 (1033),照片 (1034),照片 (1035),照片 (1036),照片 (1037),照片 (1038),照片 (1039),照片 (1040),照片 (1041),照片 (1042),照片 (1043),照片 (1044),照片 (1045),照片 (1046),照片 (1047),照片 (1048),照片 (1049),照片 (1050),照片 (1051),照片 (1052),照片 (1053),照片 (1054),照片 (1055),照片 (1056),照片 (1057),照片 (1058),照片 (1059),照片 (1060),照片 (1061),照片 (1062),照片 (1063),照片 (1064),照片 (1065),照片 (1066),照片 (1067),照片 (1068),照片 (1069),照片 (1070),照片 (1071),照片 (1072),照片 (1073),照片 (1074),照片 (1075),照片 (1076),照片 (1077),照片 (1078),照片 (1079),照片 (1080),照片 (1081),照片 (1082),照片 (1083),照片 (1084),照片 (1085),照片 (1086),照片 (1087),照片 (1088),照片 (1089),照片 (1090),照片 (1091),照片 (1092),照片 (1093),照片 (1094),照片 (1095),照片 (1096),照片 (1097),照片 (1098),照片 (1099),照片 (1100),照片 (1101),照片 (1102),照片 (1103),照片 (1104),照片 (1105),照片 (1106),照片 (1107),照片 (1108),照片 (1109),照片 (1110),照片 (1111),照片 (1112),照片 (1113),照片 (1114),照片 (1115),照片 (1116),照片 (1117),照片 (1118),照片 (1119),照片 (1120),照片 (1121),照片 (1122),照片 (1123),照片 (1124),照片 (1125),照片 (1126),照片 (1127),照片 (1128),照片 (1129),照片 (1130),照片 (1131),照片 (1132),照片 (1133),照片 (1134),照片 (1135),照片 (1136),照片 (1137),照片 (1138),照片 (1139),照片 (1140),照片 (1141),照片 (1142),照片 (1143),照片 (1144),照片 (1145),照片 (1146),照片 (1147),照片 (1148),照片 (1149),照片 (1150),照片 (1151),照片 (1152),照片 (1153),照片 (1154),照片 (1155),照片 (1156),照片 (1157),照片 (1158),照片 (1159),照片 (1160),照片 (1161),照片 (1162),照片 (1163),照片 (1164),照片 (1165),照片 (1166),照片 (1167),照片 (1168),照片 (1169),照片 (1170),照片 (1171),照片 (1172),照片 (1173),照片 (1174),照片 (1175),照片 (1176),照片 (1177),照片 (1178),照片 (1179),照片 (1180),照片 (1181),照片 (1182),照片 (1183),照片 (1184),照片 (1185),照片 (1186),照片 (1187),照片 (1188),照片 (1189),照片 (1190),照片 (1191),照片 (1192),照片 (1193),照片 (1194),照片 (1195),照片 (1196),照片 (1197),照片 (1198),照片 (1199),照片 (1200),照片 (1201),照片 (1202),照片 (1203),照片 (1204),照片 (1205),照片 (1206),照片 (1207),照片 (1208),照片 (1209),照片 (1210),照片 (1211),照片 (1212),照片 (1213),照片 (1214),照片 (1215),照片 (1216),照片 (1217),照片 (1218),照片 (1219),照片 (1220),照片 (1221),照片 (1222),照片 (1223),照片 (1224),照片 (1225),照片 (1226),照片 (1227),照片 (1228),照片 (1229),照片 (1230),照片 (1231),照片 (1232),照片 (1233),照片 (1234),照片 (1235),照片 (1236),照片 (1237),', '0', 'F:\\OnMyWay\\定做网站\\GIS\\测试文件\\管小区汇总2 - 测试.xlsx', null);
INSERT INTO `operate_history` VALUES ('3', '2bb49d9d514c48c5bebbf78beab3e179', '18', '2018-01-05 16:44:17', 'null', '', 'null', '', '以下图片名称没有匹配到图片：1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,', '0', 'F:\\tempfilepath/\\20180105\\1515141856114201612\\1515141856169.xslx', null);
INSERT INTO `operate_history` VALUES ('4', '2bb49d9d514c48c5bebbf78beab3e179', '18', '2018-01-05 16:45:14', 'null', '', 'null', '', '以下图片名称没有匹配到图片：1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,', '0', 'F:\\tempfilepath/\\20180105\\1515141914550201612\\1515141914597.xlsx', null);
INSERT INTO `operate_history` VALUES ('5', '2bb49d9d514c48c5bebbf78beab3e179', '18', '2018-01-05 17:02:35', 'null', '', 'null', '', '以下图片名称没有匹配到图片：1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,', '0', 'F:\\tempfilepath/\\20180105\\1515142955141201612\\1515142955201.xlsx', null);
INSERT INTO `operate_history` VALUES ('6', '2bb49d9d514c48c5bebbf78beab3e179', '18', '2018-01-05 17:03:31', 'null', '', 'null', '', '以下图片名称没有匹配到图片：1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,', '0', 'F:\\tempfilepath/\\20180105\\1515143011706201612\\1515143011754.xlsx', null);
INSERT INTO `operate_history` VALUES ('7', '2bb49d9d514c48c5bebbf78beab3e179', '18', '2018-01-05 17:06:16', 'null', '', 'null', '', '以下图片名称没有匹配到图片：1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,', '0', 'F:\\tempfilepath/\\20180105\\1515143175312201612\\1515143175390.xlsx', null);
INSERT INTO `operate_history` VALUES ('8', '2bb49d9d514c48c5bebbf78beab3e179', '5', '2018-01-06 10:39:23', 'null', '', 'null', '', null, '1', null, null);
INSERT INTO `operate_history` VALUES ('9', '2bb49d9d514c48c5bebbf78beab3e179', '16', '2018-01-06 10:42:52', '0:0:0:0:0:0:0:1', '', '0:0:0:0:0:0:0:1', '', null, '1', null, null);

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
  `attribute_info_type` int(2) DEFAULT NULL COMMENT '详细信息展示设置',
  `attribute_index` int(3) DEFAULT NULL COMMENT '属性列数，当前属性位于detail的第几列',
  `attribute_active` int(1) DEFAULT '0' COMMENT '设置为筛选条件，激活时：1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of project_attribute
-- ----------------------------
INSERT INTO `project_attribute` VALUES ('00151520636358700001005056c00001', '00151520636358600000005056c00001', '序号', null, null, '1', '0');
INSERT INTO `project_attribute` VALUES ('00151520636358800002005056c00001', '00151520636358600000005056c00001', '调研编号', '5', '9', '2', '0');
INSERT INTO `project_attribute` VALUES ('00151520636358800003005056c00001', '00151520636358600000005056c00001', '城市', null, null, '3', '0');
INSERT INTO `project_attribute` VALUES ('00151520636359000004005056c00001', '00151520636358600000005056c00001', '区域', null, null, '4', '1');
INSERT INTO `project_attribute` VALUES ('00151520636359000005005056c00001', '00151520636358600000005056c00001', '街镇', null, null, '5', '0');
INSERT INTO `project_attribute` VALUES ('00151520636359100006005056c00001', '00151520636358600000005056c00001', '名称', null, null, '6', '0');
INSERT INTO `project_attribute` VALUES ('00151520636359200007005056c00001', '00151520636358600000005056c00001', '地址', null, '12', '7', '0');
INSERT INTO `project_attribute` VALUES ('00151520636359300008005056c00001', '00151520636358600000005056c00001', '问题分类', '6', null, '8', '0');
INSERT INTO `project_attribute` VALUES ('00151520636359300009005056c00001', '00151520636358600000005056c00001', '问题地址', null, '11', '9', '0');
INSERT INTO `project_attribute` VALUES ('00151520636359400010005056c00001', '00151520636358600000005056c00001', '照片编号', '4', null, '10', '0');
INSERT INTO `project_attribute` VALUES ('00151520636359400011005056c00001', '00151520636358600000005056c00001', '完成时间', null, null, '11', '0');
INSERT INTO `project_attribute` VALUES ('00151520636359500012005056c00001', '00151520636358600000005056c00001', '检查人员', null, '10', '12', '1');
INSERT INTO `project_attribute` VALUES ('00151520636359500013005056c00001', '00151520636358600000005056c00001', '经度', '1', null, '13', '0');
INSERT INTO `project_attribute` VALUES ('00151520636359600014005056c00001', '00151520636358600000005056c00001', '纬度', '2', null, '14', '0');

-- ----------------------------
-- Table structure for project_attribute_condition
-- ----------------------------
DROP TABLE IF EXISTS `project_attribute_condition`;
CREATE TABLE `project_attribute_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_condition` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leaf` int(11) DEFAULT '1',
  `type` int(11) DEFAULT NULL COMMENT '0:detail,1:属性或者项目标题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1657 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of project_attribute_condition
-- ----------------------------
INSERT INTO `project_attribute_condition` VALUES ('1647', '赵苏鸣', '00151520636359500012005056c00001', '1', null);
INSERT INTO `project_attribute_condition` VALUES ('1648', '田腾腾', '00151520636359500012005056c00001', '1', null);
INSERT INTO `project_attribute_condition` VALUES ('1650', '金山区', '00151520636359000004005056c00001', '1', null);
INSERT INTO `project_attribute_condition` VALUES ('1651', '松江区', '00151520636359000004005056c00001', '1', null);
INSERT INTO `project_attribute_condition` VALUES ('1652', '宝山区', '00151520636359000004005056c00001', '1', null);
INSERT INTO `project_attribute_condition` VALUES ('1653', '嘉定区', '00151520636359000004005056c00001', '1', null);
INSERT INTO `project_attribute_condition` VALUES ('1654', '长宁区', '00151520636359000004005056c00001', '1', null);
INSERT INTO `project_attribute_condition` VALUES ('1655', '浦东新区', '00151520636359000004005056c00001', '1', null);
INSERT INTO `project_attribute_condition` VALUES ('1656', '杨浦区', '00151520636359000004005056c00001', '1', null);

-- ----------------------------
-- Table structure for project_attribute_type
-- ----------------------------
DROP TABLE IF EXISTS `project_attribute_type`;
CREATE TABLE `project_attribute_type` (
  `id` int(2) NOT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  `alias_name` varchar(100) DEFAULT NULL,
  `type` int(2) DEFAULT '0' COMMENT '0:必要信息，1：显示信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_attribute_type
-- ----------------------------
INSERT INTO `project_attribute_type` VALUES ('0', '无', null, '0');
INSERT INTO `project_attribute_type` VALUES ('1', '经度', 'longitude', '0');
INSERT INTO `project_attribute_type` VALUES ('2', '纬度', 'latitude', '0');
INSERT INTO `project_attribute_type` VALUES ('3', '详细地址', 'detail_address', '0');
INSERT INTO `project_attribute_type` VALUES ('4', '图片编号', 'img_url', '0');
INSERT INTO `project_attribute_type` VALUES ('5', '调研编号', 'research_no', '0');
INSERT INTO `project_attribute_type` VALUES ('6', '问题分类', 'question_type', '0');
INSERT INTO `project_attribute_type` VALUES ('9', '详细信息1', 'detail_1', '1');
INSERT INTO `project_attribute_type` VALUES ('10', '详细信息2', 'detail_2', '1');
INSERT INTO `project_attribute_type` VALUES ('11', '详细信息3', 'detail_3', '1');
INSERT INTO `project_attribute_type` VALUES ('12', '详细信息4', 'detail_4', '1');
INSERT INTO `project_attribute_type` VALUES ('13', '详细信息5', 'detail_5', '1');
INSERT INTO `project_attribute_type` VALUES ('14', '详细信息6', 'detail_6', '1');
INSERT INTO `project_attribute_type` VALUES ('15', '详细信息7', 'detail_7', '1');
INSERT INTO `project_attribute_type` VALUES ('16', '详细信息8', 'detail_8', '1');

-- ----------------------------
-- Table structure for project_condition_auth
-- ----------------------------
DROP TABLE IF EXISTS `project_condition_auth`;
CREATE TABLE `project_condition_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condition_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web_user_role_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of project_condition_auth
-- ----------------------------
INSERT INTO `project_condition_auth` VALUES ('1157', '00151520636358600000005056c00001', '1');
INSERT INTO `project_condition_auth` VALUES ('1158', '00151520636359500012005056c00001', '1');
INSERT INTO `project_condition_auth` VALUES ('1159', '1648', '1');
INSERT INTO `project_condition_auth` VALUES ('1160', '1647', '1');
INSERT INTO `project_condition_auth` VALUES ('1161', '00151520636359000004005056c00001', '1');
INSERT INTO `project_condition_auth` VALUES ('1162', '1656', '1');
INSERT INTO `project_condition_auth` VALUES ('1163', '1655', '1');
INSERT INTO `project_condition_auth` VALUES ('1164', '1654', '1');
INSERT INTO `project_condition_auth` VALUES ('1165', '1653', '1');
INSERT INTO `project_condition_auth` VALUES ('1166', '1652', '1');
INSERT INTO `project_condition_auth` VALUES ('1167', '1651', '1');
INSERT INTO `project_condition_auth` VALUES ('1168', '1650', '1');

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
INSERT INTO `project_detail` VALUES ('00151520636359700015005056c00001', '00151520636358600000005056c00001', '1', '070501461181PP', '上海', '金山区', '漕泾镇', '绿地漕泾新苑二期', '富漕路461弄', '2', '16号', '照片 (1)', '2017-11-18 00:00:00', '赵苏鸣', '121.411', '30.803', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636359900016005056c00001', '00151520636358600000005056c00001', '2', '070501461181PP', '上海', '金山区', '漕泾镇', '绿地漕泾新苑二期', '富漕路461弄', '2', '42号', '照片 (2)', '2017-11-18 00:00:00', '赵苏鸣', '121.411', '30.803', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636360000017005056c00001', '00151520636358600000005056c00001', '3', '070501461181PP', '上海', '金山区', '漕泾镇', '绿地漕泾新苑二期', '富漕路461弄', '2', '34号', '照片 (3)', '2017-11-18 00:00:00', '赵苏鸣', '121.409', '30.804', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636360100018005056c00001', '00151520636358600000005056c00001', '4', '070501461181PP', '上海', '金山区', '漕泾镇', '绿地漕泾新苑二期', '富漕路461弄', '4', '42号', '照片 (4)', '2017-11-18 00:00:00', '赵苏鸣', '121.41', '30.805', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636360100019005056c00001', '00151520636358600000005056c00001', '5', '070401001001PP', '上海', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '2', '77号', '照片 (5)', '2017-11-18 00:00:00', '赵苏鸣', '121.239', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636360200020005056c00001', '00151520636358600000005056c00001', '6', '070401001001PP', '上海', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '2', '56号', '照片 (6)', '2017-11-18 00:00:00', '赵苏鸣', '121.24', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636360300021005056c00001', '00151520636358600000005056c00001', '7', '070401001001PP', '上海', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '2', '61号', '照片 (7)', '2017-11-18 00:00:00', '赵苏鸣', '121.24', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636360400022005056c00001', '00151520636358600000005056c00001', '8', '070401001001PP', '上海', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '2', '74号', '照片 (8)', '2017-11-18 00:00:00', '赵苏鸣', '121.239', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636360500023005056c00001', '00151520636358600000005056c00001', '9', '070401001001PP', '上海', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '4', '77号3层', '照片 (9)', '2017-11-18 00:00:00', '赵苏鸣', '121.24', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636360700024005056c00001', '00151520636358600000005056c00001', '10', '070401001001PP', '上海', '松江区', '岳阳街道', '南龙谭苑小区', '岳阳街道中山二路125弄', '4', '67号3层', '照片 (10)', '2017-11-18 00:00:00', '赵苏鸣', '121.24', '31.015', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636360700025005056c00001', '00151520636358600000005056c00001', '11', '070402001001PP', '上海', '松江区', '广富林街道', '上尚缘', '广富林街道文翔路3588弄', '2', '30号', '照片 (11)', '2017-11-18 00:00:00', '赵苏鸣', '121.188', '31.048', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636360800026005056c00001', '00151520636358600000005056c00001', '12', '070301518310PP', '上海', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '2', '310号', '照片 (12)', '2017-11-19 00:00:00', '赵苏鸣', '121.431', '31.358', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636360900027005056c00001', '00151520636358600000005056c00001', '13', '070301518310PP', '上海', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '2', '311号', '照片 (13)', '2017-11-19 00:00:00', '赵苏鸣', '121.43', '31.357', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636361000028005056c00001', '00151520636358600000005056c00001', '14', '070301518310PP', '上海', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '2', '338号', '照片 (14)', '2017-11-19 00:00:00', '赵苏鸣', '121.431', '31.357', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636361200029005056c00001', '00151520636358600000005056c00001', '15', '070301518310PP', '上海', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '2', '353号', '照片 (15)', '2017-11-19 00:00:00', '赵苏鸣', '121.432', '31.358', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636361300030005056c00001', '00151520636358600000005056c00001', '16', '070301518310PP', '上海', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '4', '342号', '照片 (16)', '2017-11-19 00:00:00', '赵苏鸣', '121.431', '31.358', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636361400031005056c00001', '00151520636358600000005056c00001', '17', '070301518310PP', '上海', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '4', '331号', '照片 (17)', '2017-11-19 00:00:00', '赵苏鸣', '121.43', '31.357', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636361500032005056c00001', '00151520636358600000005056c00001', '18', '070301518310PP', '上海', '宝山区', '顾村镇', '富华苑', '联泰路518弄', '4', '338号1层', '照片 (18)', '2017-11-19 00:00:00', '赵苏鸣', '121.431', '31.357', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636361500033005056c00001', '00151520636358600000005056c00001', '19', '071301999001PP', '上海', '嘉定区', '真新街道', '金沙丽晶苑', '丰庄路99弄', '4', '边门', '照片 (19)', '2017-11-19 00:00:00', '赵苏鸣', '121.365', '31.25', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636361600034005056c00001', '00151520636358600000005056c00001', '20', '071301999001PP', '上海', '嘉定区', '真新街道', '金沙丽晶苑', '丰庄路99弄', '4', '9号14层', '照片 (20)', '2017-11-19 00:00:00', '赵苏鸣', '121.365', '31.251', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636361700035005056c00001', '00151520636358600000005056c00001', '21', '071301999001PP', '上海', '嘉定区', '真新街道', '金沙丽晶苑', '丰庄路99弄', '4', '5号7层', '照片 (21)', '2017-11-19 00:00:00', '赵苏鸣', '121.366', '31.251', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636361700036005056c00001', '00151520636358600000005056c00001', '22', '070101195195PP', '上海', '长宁区', '北新泾街道中队', '馥邦小区', '北渔路28弄', '4', '19号5层', '照片 (22)', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636361800037005056c00001', '00151520636358600000005056c00001', '23', '070101195195PP', '上海', '长宁区', '北新泾街道中队', '馥邦小区', '北渔路28弄', '4', '10号7层', '照片 (23)', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636361900038005056c00001', '00151520636358600000005056c00001', '24', '070101195195PP', '上海', '长宁区', '北新泾街道中队', '馥邦小区', '北渔路28弄', '2', '25号', '照片 (24)', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.223', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636361900039005056c00001', '00151520636358600000005056c00001', '25', '070101195195PP', '上海', '长宁区', '北新泾街道中队', '馥邦小区', '北渔路28弄', '2', '22号', '照片 (25)', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636362000040005056c00001', '00151520636358600000005056c00001', '26', '070102195195PP', '上海', '长宁区', '程家桥街道中队', '程桥一村', '哈密路', '4', '36号3层', '照片 (26)', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636362000041005056c00001', '00151520636358600000005056c00001', '27', '070102195195PP', '上海', '长宁区', '程家桥街道中队', '程桥一村', '哈密路', '4', '36号3层', '照片 (27)', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636362100042005056c00001', '00151520636358600000005056c00001', '28', '070102195195PP', '上海', '长宁区', '程家桥街道中队', '程桥一村', '哈密路', '3', '25号1层', '照片 (28)', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636362200043005056c00001', '00151520636358600000005056c00001', '29', '070102195195PP', '上海', '长宁区', '程家桥街道中队', '程桥一村', '哈密路', '1', '边门', '照片 (29)', '2017-11-19 00:00:00', '赵苏鸣', '121.38', '31.224', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636362400044005056c00001', '00151520636358600000005056c00001', '30', '070901555173PP', '上海', '浦东新区', '高桥', '仁恒家园', '季景路555弄', '4', '9号4层', '照片 (30)', '2017-11-20 00:00:00', '赵苏鸣', '121.601', '31.341', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636362500045005056c00001', '00151520636358600000005056c00001', '31', '070901555173PP', '上海', '浦东新区', '高桥', '仁恒家园', '季景路555弄', '4', '17号3层', '照片 (31)', '2017-11-20 00:00:00', '赵苏鸣', '121.6', '31.34', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636362600046005056c00001', '00151520636358600000005056c00001', '32', '070902666109PP', '上海', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '4', '1号9层', '照片 (32)', '2017-11-20 00:00:00', '赵苏鸣', '121.602', '31.261', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636362700047005056c00001', '00151520636358600000005056c00001', '33', '070902666109PP', '上海', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '4', '1号7层', '照片 (33)', '2017-11-20 00:00:00', '赵苏鸣', '121.603', '31.26', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636362700048005056c00001', '00151520636358600000005056c00001', '34', '070902666109PP', '上海', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '4', '4号', '照片 (34)', '2017-11-20 00:00:00', '赵苏鸣', '121.601', '31.261', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636362800049005056c00001', '00151520636358600000005056c00001', '35', '070902666109PP', '上海', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '2', '1号', '照片 (35)', '2017-11-20 00:00:00', '赵苏鸣', '121.604', '31.26', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636362900050005056c00001', '00151520636358600000005056c00001', '36', '070902666109PP', '上海', '浦东新区', '浦兴', '金桥名都', '台儿庄路666弄', '2', '17号', '照片 (36)', '2017-11-20 00:00:00', '赵苏鸣', '121.601', '31.261', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636363100051005056c00001', '00151520636358600000005056c00001', '37', '070903159814PP', '上海', '浦东新区', '花木', '仁恒河滨', '丁香路1599弄', '4', '8号14层', '照片 (37)', '2017-11-27 00:00:00', '赵苏鸣', '121.573', '31.236', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636363200052005056c00001', '00151520636358600000005056c00001', '38', '070903159814PP', '上海', '浦东新区', '花木', '仁恒河滨', '丁香路1599弄', '4', '26号4层', '照片 (38)', '2017-11-27 00:00:00', '赵苏鸣', '121.573', '31.236', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636363200053005056c00001', '00151520636358600000005056c00001', '39', '070904151017PP', '上海', '浦东新区', '洋泾', '国际华城', '张杨路1515弄', '4', '17号', '照片 (39)', '2017-11-20 00:00:00', '赵苏鸣', '121.543', '31.242', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636363300054005056c00001', '00151520636358600000005056c00001', '40', '070905105001PP', '上海', '浦东新区', '书院', '新舒苑北苑', '丽正路1059弄', '2', '球场', '照片 (40)', '2017-10-15 00:00:00', '赵苏鸣', '121.871', '30.984', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636363300055005056c00001', '00151520636358600000005056c00001', '41', '070103555067PP', '上海', '长宁区', '华阳路街道中队', '悦达花苑', '武夷路555号', '4', '6号7层', '照片 (41)', '2017-11-21 00:00:00', '赵苏鸣', '121.425', '31.22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636363400056005056c00001', '00151520636358600000005056c00001', '42', '070103555067PP', '上海', '长宁区', '华阳路街道中队', '悦达花苑', '武夷路555号', '4', '18号8层', '照片 (42)', '2017-11-21 00:00:00', '赵苏鸣', '121.425', '31.22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636363400057005056c00001', '00151520636358600000005056c00001', '43', '070103555067PP', '上海', '长宁区', '华阳路街道中队', '悦达花苑', '武夷路555号', '4', '22号6层', '照片 (43)', '2017-11-21 00:00:00', '赵苏鸣', '121.425', '31.22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636363500058005056c00001', '00151520636358600000005056c00001', '44', '070104888041PP', '上海', '长宁区', '江苏路街道中队', '畅园', '愚园路888号', '4', '41号', '照片 (44)', '2017-11-27 00:00:00', '赵苏鸣', '121.424', '31.22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636363500059005056c00001', '00151520636358600000005056c00001', '45', '071501301103PP', '上海', '杨浦区', '定海路街道', '建设新苑', '爱国路301弄', '4', '12号楼3楼楼梯口', '照片 (45)', '2017-10-10 00:00:00', '田腾腾', '121.557', '31.285', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636363600060005056c00001', '00151520636358600000005056c00001', '46', '071502131003PP', '上海', '杨浦区', '大桥街道', '申通公寓', '长阳路1315弄', '2', '小区大门左转3米处', '照片 (46)', '2017-10-10 00:00:00', '田腾腾', '121.535', '31.273', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636363700061005056c00001', '00151520636358600000005056c00001', '47', '071502131003PP', '上海', '杨浦区', '大桥街道', '申通公寓', '长阳路1315弄', '2', '一号楼门口对面', '照片 (47)', '2017-10-10 00:00:00', '田腾腾', '121.535', '31.273', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `project_detail` VALUES ('00151520636363800062005056c00001', '00151520636358600000005056c00001', '48', '071502131003PP', '上海', '杨浦区', '大桥街道', '申通公寓', '长阳路1315弄', '2', '2号楼门口左边', '照片 (48)', '2017-10-10 00:00:00', '田腾腾', '121.534', '31.274', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

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
  `type` int(11) DEFAULT '0' COMMENT '0:未设置筛选属性，1设置筛选属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of project_main
-- ----------------------------
INSERT INTO `project_main` VALUES ('00151520636358600000005056c00001', '2017年10月上海城管小区问题清单', '2018-01-06 10:39:23', null, '2bb49d9d514c48c5bebbf78beab3e179', 'F:\\tempfilepath\\20180106\\1515206361751管小区汇总2 - 测试.xlsx', '1');

-- ----------------------------
-- Table structure for project_searchno_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `project_searchno_dictionary`;
CREATE TABLE `project_searchno_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `search_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `search_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of project_searchno_dictionary
-- ----------------------------
INSERT INTO `project_searchno_dictionary` VALUES ('1', '07', '上海', null, null);
INSERT INTO `project_searchno_dictionary` VALUES ('2', '0705', '金山', null, null);

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
INSERT INTO `user_menu` VALUES ('131', '3', 'searchnoMgr.jsp', '调研编号字典管理', '1', '0', '1');
INSERT INTO `user_menu` VALUES ('132', '3', 'projectMgr.jsp', '项目数据管理', '1', '0', '1');

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
  `enable_time` varchar(50) DEFAULT NULL COMMENT '启用时间',
  `disable_time` varchar(50) DEFAULT NULL COMMENT '禁用时间',
  PRIMARY KEY (`id`),
  KEY `USER_LOGIN_ID` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_user_login
-- ----------------------------
INSERT INTO `web_user_login` VALUES ('2bb49d9d514c48c5bebbf78beab3e179', 'admin', 'admin', '1', '0', null, null, null, null, '123', '12123啊实打实', '2018-01-03', '2023-01-05');
INSERT INTO `web_user_login` VALUES ('60672052e98a45ec800173a9b1829f5b', 'zhou', 'user', '7', '1', null, null, null, null, '1', '周期', null, null);
INSERT INTO `web_user_login` VALUES ('8e81294de42949f6b18d4262cdd6bebe', '123', '123', '2', '0', null, null, null, null, '1', '123', null, null);
INSERT INTO `web_user_login` VALUES ('e2058de4d2704de08c952c768578bd20', '546a', 'asd', '9', '1', null, null, null, null, '1', '阿斯顿', null, null);
INSERT INTO `web_user_login` VALUES ('f36df2a40fe248589b99ce0a3f4a05b8', 'wuqiuming', 'wuqiuming', '12', '0', null, null, null, null, '3', '吴秋明', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of web_user_login_phone
-- ----------------------------
INSERT INTO `web_user_login_phone` VALUES ('1', '2bb49d9d514c48c5bebbf78beab3e179', 'asd1232', '2017-12-15 14:51:13');
INSERT INTO `web_user_login_phone` VALUES ('2', '2bb49d9d514c48c5bebbf78beab3e179', 'asd1232', '2017-12-15 16:05:38');
INSERT INTO `web_user_login_phone` VALUES ('3', '2bb49d9d514c48c5bebbf78beab3e179', 'a4sd655555', '2017-12-25 10:38:09');
INSERT INTO `web_user_login_phone` VALUES ('4', '2bb49d9d514c48c5bebbf78beab3e179', '7a49ddf0dc913e6b9b80a6d26ec9619e', '2017-12-27 17:15:02');
INSERT INTO `web_user_login_phone` VALUES ('5', '2bb49d9d514c48c5bebbf78beab3e179', '7a49ddf0dc913e6b9b80a6d26ec9619e', '2017-12-27 17:18:04');
INSERT INTO `web_user_login_phone` VALUES ('6', '2bb49d9d514c48c5bebbf78beab3e179', '7a49ddf0dc913e6b9b80a6d26ec9619e', '2017-12-27 17:57:47');
INSERT INTO `web_user_login_phone` VALUES ('7', '2bb49d9d514c48c5bebbf78beab3e179', '7a49ddf0dc913e6b9b80a6d26ec9619e', '2017-12-27 18:17:23');
INSERT INTO `web_user_login_phone` VALUES ('8', '2bb49d9d514c48c5bebbf78beab3e179', '7a49ddf0dc913e6b9b80a6d26ec9619e', '2017-12-27 18:20:16');
INSERT INTO `web_user_login_phone` VALUES ('9', '2bb49d9d514c48c5bebbf78beab3e179', '7a49ddf0dc913e6b9b80a6d26ec9619e', '2017-12-29 16:11:38');
INSERT INTO `web_user_login_phone` VALUES ('10', '2bb49d9d514c48c5bebbf78beab3e179', '7a49ddf0dc913e6b9b80a6d26ec9619e', '2017-12-29 16:12:01');
INSERT INTO `web_user_login_phone` VALUES ('11', '2bb49d9d514c48c5bebbf78beab3e179', '4695ee0f36f6ae9b305f82f883f5fcac', '2017-12-29 16:13:03');
INSERT INTO `web_user_login_phone` VALUES ('12', '2bb49d9d514c48c5bebbf78beab3e179', '4695ee0f36f6ae9b305f82f883f5fcac', '2017-12-29 16:14:50');
INSERT INTO `web_user_login_phone` VALUES ('13', '2bb49d9d514c48c5bebbf78beab3e179', '4695ee0f36f6ae9b305f82f883f5fcac', '2017-12-29 16:26:41');
INSERT INTO `web_user_login_phone` VALUES ('14', '2bb49d9d514c48c5bebbf78beab3e179', '4695ee0f36f6ae9b305f82f883f5fcac', '2017-12-29 16:56:13');
INSERT INTO `web_user_login_phone` VALUES ('15', '2bb49d9d514c48c5bebbf78beab3e179', '4695ee0f36f6ae9b305f82f883f5fcac', '2017-12-29 16:59:06');
INSERT INTO `web_user_login_phone` VALUES ('16', '2bb49d9d514c48c5bebbf78beab3e179', '4695ee0f36f6ae9b305f82f883f5fcac', '2017-12-29 17:04:01');
INSERT INTO `web_user_login_phone` VALUES ('17', '2bb49d9d514c48c5bebbf78beab3e179', '4695ee0f36f6ae9b305f82f883f5fcac', '2017-12-30 08:55:36');
INSERT INTO `web_user_login_phone` VALUES ('18', '2bb49d9d514c48c5bebbf78beab3e179', '4695ee0f36f6ae9b305f82f883f5fcac', '2017-12-31 11:08:08');

-- ----------------------------
-- Table structure for web_user_role
-- ----------------------------
DROP TABLE IF EXISTS `web_user_role`;
CREATE TABLE `web_user_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) DEFAULT NULL,
  `is_delete` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='is_delete : 0   未删除 1：已删除';

-- ----------------------------
-- Records of web_user_role
-- ----------------------------
INSERT INTO `web_user_role` VALUES ('1', '上海市绿化管理员', '0');
INSERT INTO `web_user_role` VALUES ('2', '静安区管理', '0');
INSERT INTO `web_user_role` VALUES ('7', '宝山区绿化', '1');
INSERT INTO `web_user_role` VALUES ('9', '上海市绿化', '1');
INSERT INTO `web_user_role` VALUES ('10', 'asdsad', '1');
INSERT INTO `web_user_role` VALUES ('11', '宝山区总管', '0');
INSERT INTO `web_user_role` VALUES ('12', 'wuqiuming', '0');

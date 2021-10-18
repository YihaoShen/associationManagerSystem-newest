/*
 Navicat MySQL Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : srp

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 18/10/2021 10:50:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity`  (
  `aId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '活动id',
  `aTitle` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `aContent` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `aAnnouncedTime` datetime NOT NULL COMMENT '活动发布时间',
  `cId` int(11) NOT NULL,
  `uStuNumber` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `aIntroduction` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `aPhoto` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activity_type` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`aId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES (23, '篮球比赛', '<p>阿是daD打发顺丰</p>', '2021-03-07 00:00:00', 1, '20181008084', '这是修改后的简介', '../upload/af6c8a6980b840e_file_u=1836872294,3247132713&fm=26&gp=0.jpg', '1');
INSERT INTO `activity` VALUES (24, '足球比赛', '<p>时间：</p><p>规则：</p><p>发布人：</p>', '2021-02-14 00:00:00', 1, '20181000001', '这是一场足球比赛，欢迎来参加！！！', '../upload/b8a31e02596f443_file_u=2340175123,3483783040&fm=26&gp=0.jpg', '2');
INSERT INTO `activity` VALUES (25, 'ACM比赛', '<p>时间：</p><p>规则：</p><p>地点：</p>', '2021-02-14 00:00:00', 2, '1', '这是一场ACM比赛，欢迎来参加！！！', '../upload/436bfba39f2a44f_file_u=2750291630,1324096567&fm=26&gp=0.jpg', '2');
INSERT INTO `activity` VALUES (26, '计算机设计大赛', '<p>时间：</p><p>地点：</p><p>主办方：</p>', '2021-02-14 00:00:00', 2, '1', '这是计算机设计大赛，欢迎参加！！！', '../upload/b8f2f5f45dc740a_file_u=3062317441,17553037&fm=26&gp=0.jpg', '1');
INSERT INTO `activity` VALUES (27, '普通话测试', '<p>时间：</p><p>地点：</p><p>主办方：</p>', '2021-02-14 00:00:00', 86, '1', '这是普通话测试。欢迎参加！！！', '../upload/07700d39010347d_file_u=1555620250,991762746&fm=26&gp=0.jpg', '1');
INSERT INTO `activity` VALUES (30, 'i助志愿活动', '<p>时间：</p><p>地点：</p><p>负责人：</p>', '2021-02-20 00:00:00', 86, '1', '这是一次志愿活动！！！', '../upload/d44c69cec77f4ae_file_u=1836872294,3247132713&fm=26&gp=0.jpg', '2');
INSERT INTO `activity` VALUES (31, '数学建模竞赛', '<p>时间：</p><p>地点：</p><p>负责人：</p>', '2021-02-20 00:00:00', 87, '1', '这是一场数学竞赛', '../upload/ce1b9992fc1a4fe_file_u=274208267,3105288489&fm=26&gp=0.jpg', '1');
INSERT INTO `activity` VALUES (32, '运动会', '<p>时间：</p><p>地点：</p><p>负责人：</p>', '2021-02-20 00:00:00', 87, '1', '这是一场运动会', '../upload/dd1adf0a1b6b4d4_file_u=2188224759,3540904431&fm=26&gp=0.jpg', '2');
INSERT INTO `activity` VALUES (33, '民族团结知识竞赛', '<p>时间：</p><p>地点：</p><p>负责人：</p>', '2021-02-20 00:00:00', 88, '1', '这是一场民族团结知识竞赛！！！', '../upload/ed283076a34d4da_file_u=2403849449,3899975588&fm=26&gp=0.jpg', '1');
INSERT INTO `activity` VALUES (34, '诗朗诵', '<p>时间：</p><p>地点：</p><p>负责人;</p>', '2021-02-20 00:00:00', 89, '1', '这是一场诗朗诵比赛！！！', '../upload/ae8eeb0664644ca_file_u=3628405714,3890894656&fm=26&gp=0.jpg', '1');

-- ----------------------------
-- Table structure for club
-- ----------------------------
DROP TABLE IF EXISTS `club`;
CREATE TABLE `club`  (
  `cId` int(11) NOT NULL AUTO_INCREMENT COMMENT '社团编号',
  `cName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '社团名称',
  `cDescription` varchar(455) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '社团描述',
  `cCreateTime` datetime NOT NULL COMMENT '社团成立时间',
  `uStuNumber` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sPhoto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cphoto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tPhoto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`cId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 92 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of club
-- ----------------------------
INSERT INTO `club` VALUES (1, '大自然定向越野社团', '爱看书的我马上加入了看书的队伍中，一排排书柜像一条条形态各异的长龙伏在地上，上面摆放着各种各样的书籍。我巡游在书海里，看这一本本颜色鲜艳的书皮，欣赏着一个个稀奇古怪的书名。我一排一排地翻阅着，像是一位军官，在从容不迫的检阅自己的部队。我浏览者书目把一本本我感兴趣的书从书架上抽走，架在手上。那些书可真沉，我都费了九牛二虎之力都端不动了。但是，我刚走出这个书柜时，竟绊了一下，一瞧，地上横七竖八的脚竟然组成了一个“十八铜脚阵”。一看，竟有不少人“寸步难行”。但是，那些组成“铜脚阵”的人却不以为然，根本不顾旁人的感受，就这么把脚“拦”在人家前面，造成了大家的不便。可是，我便没有放在心上，便放下书，也坐在书柜上，在那里精挑细选，经过一次次的选拔，经过一层层的选拔，被我挑中的书却只有寥寥几本。我便来到楼上，再次精挑细选。', '2005-01-01 19:41:47', '', '../upload/eb99a87ddd08435_file_u=3326040175,883755054&fm=26&gp=0.jpg', '../upload/eb99a87ddd08435_file_u=3326040175,883755054&fm=26&gp=0.jpg', '../upload/1490000a816d421_file_u=3521543535,2733379669&fm=26&gp=0.jpg', 1);
INSERT INTO `club` VALUES (2, '冠翔羽毛球社', '爱看书的我马上加入了看书的队伍中，一排排书柜像一条条形态各异的长龙伏在地上，上面摆放着各种各样的书籍。我巡游在书海里，看这一本本颜色鲜艳的书皮，欣赏着一个个稀奇古怪的书名。我一排一排地翻阅着，像是一位军官，在从容不迫的检阅自己的部队。我浏览者书目把一本本我感兴趣的书从书架上抽走，架在手上。那些书可真沉，我都费了九牛二虎之力都端不动了。但是，我刚走出这个书柜时，竟绊了一下，一瞧，地上横七竖八的脚竟然组成了一个“十八铜脚阵”。一看，竟有不少人“寸步难行”。但是，那些组成“铜脚阵”的人却不以为然，根本不顾旁人的感受，就这么把脚“拦”在人家前面，造成了大家的不便。可是，我便没有放在心上，便放下书，也坐在书柜上，在那里精挑细选，经过一次次的选拔，经过一层层的选拔，被我挑中的书却只有寥寥几本。我便来到楼上，再次精挑细选。', '2000-01-01 19:43:13', '', '../upload/eb99a87ddd08435_file_u=3326040175,883755054&fm=26&gp=0.jpg', '../upload/eb99a87ddd08435_file_u=3326040175,883755054&fm=26&gp=0.jpg', '../upload/887014878e4c4a9_file_u=2750291630,1324096567&fm=26&gp=0.jpg', 1);
INSERT INTO `club` VALUES (86, '篮球社', '爱看书的我马上加入了看书的队伍中，一排排书柜像一条条形态各异的长龙伏在地上，上面摆放着各种各样的书籍。我巡游在书海里，看这一本本颜色鲜艳的书皮，欣赏着一个个稀奇古怪的书名。我一排一排地翻阅着，像是一位军官，在从容不迫的检阅自己的部队。我浏览者书目把一本本我感兴趣的书从书架上抽走，架在手上。那些书可真沉，我都费了九牛二虎之力都端不动了。但是，我刚走出这个书柜时，竟绊了一下，一瞧，地上横七竖八的脚竟然组成了一个“十八铜脚阵”。一看，竟有不少人“寸步难行”。但是，那些组成“铜脚阵”的人却不以为然，根本不顾旁人的感受，就这么把脚“拦”在人家前面，造成了大家的不便。可是，我便没有放在心上，便放下书，也坐在书柜上，在那里精挑细选，经过一次次的选拔，经过一层层的选拔，被我挑中的书却只有寥寥几本。我便来到楼上，再次精挑细选。', '2021-02-02 00:00:00', '084', '../upload/eb99a87ddd08435_file_u=3326040175,883755054&fm=26&gp=0.jpg', '../upload/d6a2cb9fa6714d3_file_u=1157253559,2914199013&fm=26&gp=0.jpg', '../upload/7027d82436f741b_file_u=2340175123,3483783040&fm=26&gp=0.jpg', 1);
INSERT INTO `club` VALUES (87, '足球社', '爱看书的我马上加入了看书的队伍中，一排排书柜像一条条形态各异的长龙伏在地上，上面摆放着各种各样的书籍。我巡游在书海里，看这一本本颜色鲜艳的书皮，欣赏着一个个稀奇古怪的书名。我一排一排地翻阅着，像是一位军官，在从容不迫的检阅自己的部队。我浏览者书目把一本本我感兴趣的书从书架上抽走，架在手上。那些书可真沉，我都费了九牛二虎之力都端不动了。但是，我刚走出这个书柜时，竟绊了一下，一瞧，地上横七竖八的脚竟然组成了一个“十八铜脚阵”。一看，竟有不少人“寸步难行”。但是，那些组成“铜脚阵”的人却不以为然，根本不顾旁人的感受，就这么把脚“拦”在人家前面，造成了大家的不便。可是，我便没有放在心上，便放下书，也坐在书柜上，在那里精挑细选，经过一次次的选拔，经过一层层的选拔，被我挑中的书却只有寥寥几本。我便来到楼上，再次精挑细选。', '2021-02-02 00:00:00', '084', '../upload/eb99a87ddd08435_file_u=3326040175,883755054&fm=26&gp=0.jpg', '../upload/5682aa5064034a0_file_u=3176613827,1143165702&fm=26&gp=0.jpg', '../upload/d731e17125fa4ef_file_u=1555620250,991762746&fm=26&gp=0.jpg', 1);
INSERT INTO `club` VALUES (88, '排球社', '爱看书的我马上加入了看书的队伍中，一排排书柜像一条条形态各异的长龙伏在地上，上面摆放着各种各样的书籍。我巡游在书海里，看这一本本颜色鲜艳的书皮，欣赏着一个个稀奇古怪的书名。我一排一排地翻阅着，像是一位军官，在从容不迫的检阅自己的部队。我浏览者书目把一本本我感兴趣的书从书架上抽走，架在手上。那些书可真沉，我都费了九牛二虎之力都端不动了。但是，我刚走出这个书柜时，竟绊了一下，一瞧，地上横七竖八的脚竟然组成了一个“十八铜脚阵”。一看，竟有不少人“寸步难行”。但是，那些组成“铜脚阵”的人却不以为然，根本不顾旁人的感受，就这么把脚“拦”在人家前面，造成了大家的不便。可是，我便没有放在心上，便放下书，也坐在书柜上，在那里精挑细选，经过一次次的选拔，经过一层层的选拔，被我挑中的书却只有寥寥几本。我便来到楼上，再次精挑细选。', '2021-02-10 00:00:00', '084', '../upload/22a1e98e572e4de_file_u=1555620250,991762746&fm=26&gp=0.jpg', '../upload/7b529bf5fec94a1_file_u=1157253559,2914199013&fm=26&gp=0.jpg', '../upload/b85493ba842b45b_file_u=1157253559,2914199013&fm=26&gp=0.jpg', 1);
INSERT INTO `club` VALUES (89, '乒乓球社', '爱看书的我马上加入了看书的队伍中，一排排书柜像一条条形态各异的长龙伏在地上，上面摆放着各种各样的书籍。我巡游在书海里，看这一本本颜色鲜艳的书皮，欣赏着一个个稀奇古怪的书名。我一排一排地翻阅着，像是一位军官，在从容不迫的检阅自己的部队。我浏览者书目把一本本我感兴趣的书从书架上抽走，架在手上。那些书可真沉，我都费了九牛二虎之力都端不动了。但是，我刚走出这个书柜时，竟绊了一下，一瞧，地上横七竖八的脚竟然组成了一个“十八铜脚阵”。一看，竟有不少人“寸步难行”。但是，那些组成“铜脚阵”的人却不以为然，根本不顾旁人的感受，就这么把脚“拦”在人家前面，造成了大家的不便。可是，我便没有放在心上，便放下书，也坐在书柜上，在那里精挑细选，经过一次次的选拔，经过一层层的选拔，被我挑中的书却只有寥寥几本。我便来到楼上，再次精挑细选。', '2021-02-09 00:00:00', '084', '../upload/d5157521f4f1484_file_u=2750291630,1324096567&fm=26&gp=0.jpg', '../upload/157559ea5ffc459_file_u=287570609,1427958647&fm=26&gp=0.jpg', '../upload/6392de178ecb4f7_file_u=287570609,1427958647&fm=26&gp=0.jpg', 0);
INSERT INTO `club` VALUES (90, '羽毛球社', '爱看书的我马上加入了看书的队伍中，一排排书柜像一条条形态各异的长龙伏在地上，上面摆放着各种各样的书籍。我巡游在书海里，看这一本本颜色鲜艳的书皮，欣赏着一个个稀奇古怪的书名。我一排一排地翻阅着，像是一位军官，在从容不迫的检阅自己的部队。我浏览者书目把一本本我感兴趣的书从书架上抽走，架在手上。那些书可真沉，我都费了九牛二虎之力都端不动了。但是，我刚走出这个书柜时，竟绊了一下，一瞧，地上横七竖八的脚竟然组成了一个“十八铜脚阵”。一看，竟有不少人“寸步难行”。但是，那些组成“铜脚阵”的人却不以为然，根本不顾旁人的感受，就这么把脚“拦”在人家前面，造成了大家的不便。可是，我便没有放在心上，便放下书，也坐在书柜上，在那里精挑细选，经过一次次的选拔，经过一层层的选拔，被我挑中的书却只有寥寥几本。我便来到楼上，再次精挑细选。', '2021-02-08 00:00:00', '084', '../upload/babdb2f593c34a0_file_u=3062317441,17553037&fm=26&gp=0.jpg', '../upload/187572d4a77c467_file_u=2750291630,1324096567&fm=26&gp=0.jpg', '../upload/137038ceb70d430_file_u=3062317441,17553037&fm=26&gp=0.jpg', 0);
INSERT INTO `club` VALUES (91, '轮滑社', '爱看书的我马上加入了看书的队伍中，一排排书柜像一条条形态各异的长龙伏在地上，上面摆放着各种各样的书籍。我巡游在书海里，看这一本本颜色鲜艳的书皮，欣赏着一个个稀奇古怪的书名。我一排一排地翻阅着，像是一位军官，在从容不迫的检阅自己的部队。我浏览者书目把一本本我感兴趣的书从书架上抽走，架在手上。那些书可真沉，我都费了九牛二虎之力都端不动了。但是，我刚走出这个书柜时，竟绊了一下，一瞧，地上横七竖八的脚竟然组成了一个“十八铜脚阵”。一看，竟有不少人“寸步难行”。但是，那些组成“铜脚阵”的人却不以为然，根本不顾旁人的感受，就这么把脚“拦”在人家前面，造成了大家的不便。可是，我便没有放在心上，便放下书，也坐在书柜上，在那里精挑细选，经过一次次的选拔，经过一层层的选拔，被我挑中的书却只有寥寥几本。我便来到楼上，再次精挑细选。', '2021-02-17 00:00:00', '084', '../upload/d6a2cb9fa6714d3_file_u=1157253559,2914199013&fm=26&gp=0.jpg', '../upload/aabe4fefbd6a4ef_file_u=2750291630,1324096567&fm=26&gp=0.jpg', '../upload/ae8eeb0664644ca_file_u=3628405714,3890894656&fm=26&gp=0.jpg', 0);

-- ----------------------------
-- Table structure for club_member
-- ----------------------------
DROP TABLE IF EXISTS `club_member`;
CREATE TABLE `club_member`  (
  `cId` int(11) NOT NULL COMMENT '社团id',
  `uId` int(11) NOT NULL COMMENT '社团id,用户id',
  `role` int(11) NOT NULL COMMENT '权限:0超级管理员,1普通管理员,2:普通社员',
  `status` int(11) NOT NULL,
  PRIMARY KEY (`cId`, `uId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of club_member
-- ----------------------------
INSERT INTO `club_member` VALUES (0, 6, 0, 1);
INSERT INTO `club_member` VALUES (1, 1, 1, 1);
INSERT INTO `club_member` VALUES (1, 2, 3, 1);
INSERT INTO `club_member` VALUES (1, 3, 3, 1);
INSERT INTO `club_member` VALUES (1, 5, 3, 1);
INSERT INTO `club_member` VALUES (2, 1, 1, 1);
INSERT INTO `club_member` VALUES (2, 2, 2, 1);
INSERT INTO `club_member` VALUES (2, 3, 0, 1);
INSERT INTO `club_member` VALUES (2, 4, 1, 1);
INSERT INTO `club_member` VALUES (86, 1, 1, 1);
INSERT INTO `club_member` VALUES (86, 2, 3, 1);
INSERT INTO `club_member` VALUES (87, 1, 1, 1);
INSERT INTO `club_member` VALUES (87, 2, 3, 1);
INSERT INTO `club_member` VALUES (88, 1, 1, 1);
INSERT INTO `club_member` VALUES (88, 2, 3, 1);
INSERT INTO `club_member` VALUES (89, 1, 1, 1);
INSERT INTO `club_member` VALUES (89, 2, 3, 1);
INSERT INTO `club_member` VALUES (90, 1, 1, 1);
INSERT INTO `club_member` VALUES (91, 1, 1, 1);

-- ----------------------------
-- Table structure for role_name
-- ----------------------------
DROP TABLE IF EXISTS `role_name`;
CREATE TABLE `role_name`  (
  `role` int(11) NOT NULL,
  `roleName` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`role`, `roleName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_name
-- ----------------------------
INSERT INTO `role_name` VALUES (0, '超级管理员');
INSERT INTO `role_name` VALUES (1, '社长');
INSERT INTO `role_name` VALUES (2, '管理员');
INSERT INTO `role_name` VALUES (3, '普通成员');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `uName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `uStuNumber` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `uSex` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'm:男,f:女',
  `uCollege` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学院',
  `uCurrentMajor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业',
  `uEnrolTime` datetime NOT NULL COMMENT '入学时间',
  `phone` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qq号',
  `uPassword` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `uPhoto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '黑夜', '20181008093', '男', '信科院', '计科', '2018-09-01 00:00:00', '19915238312', '2240483658', '123456', '../upload/137038ceb70d430_file_u=3062317441,17553037&fm=26&gp=0.jpg');
INSERT INTO `user` VALUES (2, '迷途', '20181000001', '女', '信科院', '电子工程', '2018-09-01 00:00:00', '19915238311', '2240483657', '123456', '../upload/137038ceb70d430_file_u=3062317441,17553037&fm=26&gp=0.jpg');
INSERT INTO `user` VALUES (3, '秋风', '20181008092', '女', '机电院', '电气工程', '2020-12-31 00:00:00', '19911111111', '2240483659', '123456', '../upload/137038ceb70d430_file_u=3062317441,17553037&fm=26&gp=0.jpg');
INSERT INTO `user` VALUES (4, '晓霞', '20181000003', '女', '医学院', '临床医学', '2018-09-01 00:00:00', '11111111111', '2222222222', '123456', '../upload/6392de178ecb4f7_file_u=287570609,1427958647&fm=26&gp=0.jpg');
INSERT INTO `user` VALUES (5, '兴鲁', '20181008084', '男', '信科院', '计科系', '2021-03-02 00:00:00', '18853823692', '1095826205', '123456', '../upload/ae8eeb0664644ca_file_u=3628405714,3890894656&fm=26&gp=0.jpg');
INSERT INTO `user` VALUES (6, 'supper', 'supper', '男', 'supper', 'supper', '2000-01-01 00:00:00', '18853823692', '1095826205', '123456', '../upload/ae8eeb0664644ca_file_u=3628405714,3890894656&fm=26&gp=0.jpg');

SET FOREIGN_KEY_CHECKS = 1;

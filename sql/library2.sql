/*
 Navicat Premium Data Transfer

 Source Server         : 11
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : library2

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 12/11/2023 16:47:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` bigint(20) NOT NULL,
  `password` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- Records of admin
-- ----------------------------
INSERT INTO `admin` (`admin_id`,`password`,`username`) VALUES (1, '1', 'admin')
ON DUPLICATE KEY UPDATE `password`=VALUES(`password`), `username`=VALUES(`username`);

-- ----------------------------
-- Table structure for book_info
-- ----------------------------
DROP TABLE IF EXISTS `book_info`;
CREATE TABLE `book_info`  (
  `book_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publish` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ISBN` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `language` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `pub_date` date NOT NULL,
  `class_id` int(11) NULL DEFAULT NULL,
  `number` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_info
-- ----------------------------
INSERT INTO `book_info` VALUES (1, 'Access数据库', '张三', '电子工业出版社', 'DBM005', 'Java高级应用', '中文', 22.00, '2021-04-14', 5, 2);
INSERT INTO `book_info` VALUES (2, '计算机文化基础', '张三', '交通大学出版社', 'JSJ009', '计算机文化基础', '中文', 35.00, '1996-06-12', 5, 15);
INSERT INTO `book_info` VALUES (3, '办公自动化', '张三', '复旦大学出版社', 'BGZ023', '办公自动化', '中文', 38.00, '2023-11-08', 5, 10);
INSERT INTO `book_info` VALUES (4, '网络通讯', '张三', '复旦大学出版社', 'WLT09', '水电费', '中文', 36.00, '2023-11-07', 5, 3);
INSERT INTO `book_info` VALUES (5, '计算机应用基础', '张三', '复旦大学出版社', 'JSJ021', '鼎折覆餗', '中文', 19.00, '2023-11-08', 4, 20);
INSERT INTO `book_info` VALUES (6, 'OFFICE新貌', '张三', '交通大学出版社', 'OAN031', '对算法', '中文', 23.00, '2023-11-08', 4, 3);
INSERT INTO `book_info` VALUES (7, '机顶盒使用手册', '张三', '交通大学出版社', 'SNT090', '水电费', '中文', 25.00, '2023-11-02', 5, 3);

-- ----------------------------
-- Table structure for class_info
-- ----------------------------
DROP TABLE IF EXISTS `class_info`;
CREATE TABLE `class_info`  (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`class_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class_info
-- ----------------------------
INSERT INTO `class_info` VALUES (1, '马克思主义');
INSERT INTO `class_info` VALUES (2, '哲学');
INSERT INTO `class_info` VALUES (3, '社会科学总论');
INSERT INTO `class_info` VALUES (4, '政治法律');
INSERT INTO `class_info` VALUES (5, '军事');
INSERT INTO `class_info` VALUES (6, '经济');
INSERT INTO `class_info` VALUES (7, '文化');
INSERT INTO `class_info` VALUES (8, '语言');
INSERT INTO `class_info` VALUES (9, '文学');
INSERT INTO `class_info` VALUES (10, '艺术');
INSERT INTO `class_info` VALUES (11, '历史地理');
INSERT INTO `class_info` VALUES (12, '自然科学总论');
INSERT INTO `class_info` VALUES (13, ' 数理科学和化学');
INSERT INTO `class_info` VALUES (14, '天文学、地球科学');
INSERT INTO `class_info` VALUES (15, '生物科学');
INSERT INTO `class_info` VALUES (16, '医药、卫生');
INSERT INTO `class_info` VALUES (17, '农业科学');
INSERT INTO `class_info` VALUES (18, '工业技术');
INSERT INTO `class_info` VALUES (19, '交通运输');
INSERT INTO `class_info` VALUES (20, '航空、航天');
INSERT INTO `class_info` VALUES (21, '环境科学');
INSERT INTO `class_info` VALUES (22, '综合');

-- ----------------------------
-- Table structure for lend_list
-- ----------------------------
DROP TABLE IF EXISTS `lend_list`;
CREATE TABLE `lend_list`  (
  `ser_num` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_id` bigint(20) NOT NULL,
  `reader_id` bigint(20) NOT NULL,
  `lend_date` date NULL DEFAULT NULL,
  `back_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`ser_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lend_list
-- ----------------------------
INSERT INTO `lend_list` VALUES (1, 1, 10000, '2020-03-03', '2021-04-05');
INSERT INTO `lend_list` VALUES (2, 2, 10001, '2020-03-18', '2020-03-18');
INSERT INTO `lend_list` VALUES (3, 3, 10003, '2020-03-18', '2020-03-18');
INSERT INTO `lend_list` VALUES (4, 4, 10000, '2020-03-18', '2020-03-18');
INSERT INTO `lend_list` VALUES (5, 5, 10002, '2020-03-18', '2020-03-18');
INSERT INTO `lend_list` VALUES (6, 6, 10000, '2020-03-18', '2020-03-18');
INSERT INTO `lend_list` VALUES (7, 1, 10001, '2020-03-18', '2020-03-18');
INSERT INTO `lend_list` VALUES (8, 3, 10000, '2020-03-18', '2020-03-18');
INSERT INTO `lend_list` VALUES (9, 6, 10000, '2020-03-17', '2020-05-14');
INSERT INTO `lend_list` VALUES (10, 5, 10001, '2020-05-03', '2020-05-03');
INSERT INTO `lend_list` VALUES (11, 18, 10001, '2020-05-03', '2020-05-03');
INSERT INTO `lend_list` VALUES (12, 10, 10000, '2020-05-14', '2020-05-03');
INSERT INTO `lend_list` VALUES (13, 7, 10000, '2020-05-14', '2020-05-03');
INSERT INTO `lend_list` VALUES (14, 3, 10000, '2021-01-21', '2021-01-21');
INSERT INTO `lend_list` VALUES (15, 3, 10000, '2021-04-07', '2021-04-07');
INSERT INTO `lend_list` VALUES (16, 1, 10007, '2023-11-12', '2023-11-12');

-- ----------------------------
-- Table structure for reader_card
-- ----------------------------
DROP TABLE IF EXISTS `reader_card`;
CREATE TABLE `reader_card`  (
  `reader_id` bigint(20) NOT NULL,
  `username` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`reader_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reader_card
-- ----------------------------
INSERT INTO `reader_card` VALUES (10000, '张三', '123456');
INSERT INTO `reader_card` VALUES (10001, '李四', '123456');
INSERT INTO `reader_card` VALUES (10002, '王五', '123456');
INSERT INTO `reader_card` VALUES (10003, '赵六', '123456');
INSERT INTO `reader_card` VALUES (10004, '哈哈', '123456');
INSERT INTO `reader_card` VALUES (10005, '呵呵', '123456');
INSERT INTO `reader_card` VALUES (10006, '大黄', '123');
INSERT INTO `reader_card` VALUES (10007, '123', '12345678');

-- ----------------------------
-- Table structure for reader_info
-- ----------------------------
DROP TABLE IF EXISTS `reader_info`;
CREATE TABLE `reader_info`  (
  `reader_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birth` date NOT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`reader_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10007 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reader_info
-- ----------------------------
INSERT INTO `reader_info` VALUES (10000, '张三', '女', '1999-09-09', '北京', '12345678900');
INSERT INTO `reader_info` VALUES (10001, '李四', '男', '1996-02-01', '北京市', '12345678909');
INSERT INTO `reader_info` VALUES (10002, '王五', '女', '1995-04-15', '浙江省杭州市', '12345678908');
INSERT INTO `reader_info` VALUES (10003, '赵六', '男', '1996-08-29', '陕西省西安市', '12345678907');
INSERT INTO `reader_info` VALUES (10004, '哈哈', '男', '1996-01-01', '陕西省西安市', '15123659875');
INSERT INTO `reader_info` VALUES (10005, '呵呵', '男', '1996-05-03', '山东省青岛市', '15369874123');
INSERT INTO `reader_info` VALUES (10006, '大黄', '男', '2020-05-01', '山东济南', '8888');
INSERT INTO `reader_info` VALUES (10007, '123', '女', '2023-11-05', '大法师的', '11122223333');

SET FOREIGN_KEY_CHECKS = 1;

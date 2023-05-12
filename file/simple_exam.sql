/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : simple_exam

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 12/05/2023 18:55:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `question_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `question_id` int(11) NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `choice` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `score` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `grade` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answer
-- ----------------------------

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '课程名称',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '课程编码',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '学科表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 'Java程序设计', 'JAVA', '1', '2023-05-03 17:17:37', '2023-05-03 17:21:24', 0);
INSERT INTO `course` VALUES (2, '计算机组成原理', 'JSJZCYL', '1', '2023-05-03 17:21:22', '2023-05-03 17:21:22', 0);
INSERT INTO `course` VALUES (3, '计算机网络', 'JSJWL', '1', '2023-05-03 17:21:34', '2023-05-03 17:21:34', 0);
INSERT INTO `course` VALUES (4, '操作系统', 'CZXT', '1', '2023-05-03 17:21:46', '2023-05-03 17:21:46', 0);
INSERT INTO `course` VALUES (5, '网络安全', 'WLAQ', '1', '2023-05-03 17:31:24', '2023-05-03 17:31:24', 0);
INSERT INTO `course` VALUES (6, 'C程序设计', 'C', '1', '2023-05-05 12:47:34', '2023-05-05 12:47:34', 0);
INSERT INTO `course` VALUES (7, '数据结构', 'SJJG', '1', '2023-05-05 12:47:53', '2023-05-05 12:47:53', 0);
INSERT INTO `course` VALUES (8, '高等数学', 'GDSX', '1', '2023-05-05 12:48:08', '2023-05-05 12:48:08', 0);

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '试卷名称',
  `course_id` int(11) NOT NULL COMMENT '课程id',
  `paper_id` int(11) NOT NULL COMMENT '试卷id',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `status` tinyint(3) NULL DEFAULT 1 COMMENT '状态（1：正常 0：停用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '考试表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES (1, '期中考试', 1, 1, '2023-05-06 14:00:00', '2023-05-06 16:00:00', NULL, 1, '2023-05-04 20:05:42', '2023-05-08 14:41:49', 0);
INSERT INTO `exam` VALUES (2, '期中考试', 2, 2, '2023-05-06 10:00:00', '2023-05-06 11:30:00', NULL, 1, '2023-05-06 11:14:15', '2023-05-09 12:02:48', 1);
INSERT INTO `exam` VALUES (3, '期中考试', 3, 3, '2023-05-07 09:00:00', '2023-05-07 11:00:00', NULL, 1, '2023-05-06 11:14:57', '2023-05-08 14:47:28', 0);
INSERT INTO `exam` VALUES (4, '期中考试', 4, 4, '2023-05-07 14:00:00', '2023-05-07 15:40:00', NULL, 1, '2023-05-06 11:15:43', '2023-05-08 14:47:28', 0);
INSERT INTO `exam` VALUES (5, '期中考试', 5, 5, '2023-05-07 16:00:00', '2023-05-07 17:40:00', NULL, 1, '2023-05-06 11:16:17', '2023-05-08 14:47:28', 0);
INSERT INTO `exam` VALUES (6, '期末考试', 1, 6, '2023-06-30 16:00:00', '2023-06-30 17:40:00', NULL, 1, '2023-05-08 14:42:31', '2023-05-08 14:42:34', 0);
INSERT INTO `exam` VALUES (7, '期末考试', 2, 1, '2023-06-30 09:00:00', '2023-06-30 11:00:00', NULL, 1, '2023-05-09 11:58:27', '2023-05-12 15:56:27', 1);
INSERT INTO `exam` VALUES (8, '期中考试', 2, 2, '2023-05-06 10:01:00', '2023-05-06 11:30:00', NULL, 1, '2023-05-09 12:02:48', '2023-05-12 15:56:31', 1);
INSERT INTO `exam` VALUES (9, 'test', 2, 1, '2023-05-08 12:00:00', '2023-05-25 12:00:00', NULL, 1, '2023-05-09 12:26:01', '2023-05-09 12:26:05', 1);
INSERT INTO `exam` VALUES (10, '期末考试', 2, 4, '2023-06-30 09:00:00', '2023-06-30 11:00:00', NULL, 1, '2023-05-12 15:56:27', '2023-05-12 15:56:27', 0);
INSERT INTO `exam` VALUES (11, '期中考试', 2, 5, '2023-05-06 10:01:00', '2023-05-06 11:30:00', NULL, 1, '2023-05-12 15:56:31', '2023-05-12 15:56:31', 0);
INSERT INTO `exam` VALUES (12, '小测试', 2, 7, '2023-05-13 10:00:00', '2023-05-13 12:00:00', NULL, 1, '2023-05-12 15:56:54', '2023-05-12 15:56:54', 0);

-- ----------------------------
-- Table structure for experience
-- ----------------------------
DROP TABLE IF EXISTS `experience`;
CREATE TABLE `experience`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `question_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `question_id` int(11) NULL DEFAULT NULL,
  `choice` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `course_id` int(11) NULL DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '错题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of experience
-- ----------------------------
INSERT INTO `experience` VALUES (8, 1, 'xzt', 4, NULL, 'a', 1, '2023-05-12 11:12:49', '2023-05-12 11:12:49', 0);
INSERT INTO `experience` VALUES (2, 1, 'xzt', 41, 'c', 'a', 5, '2023-05-07 17:57:09', '2023-05-07 17:57:09', 0);
INSERT INTO `experience` VALUES (7, 1, 'xzt', 1, NULL, 'a', 1, '2023-05-11 18:11:14', '2023-05-11 18:11:14', 0);
INSERT INTO `experience` VALUES (6, 1, 'xzt', 10, NULL, 'a', 1, '2023-05-11 13:26:58', '2023-05-11 13:26:58', 0);
INSERT INTO `experience` VALUES (5, 1, 'tkt', 15, NULL, '15', 2, '2023-05-08 00:29:44', '2023-05-08 00:29:44', 0);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '所属上级',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '类型(0:目录,1:菜单,2:按钮)',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由地址',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `role` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'student' COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'el-icon-s-tools' COMMENT '图标',
  `sort_value` int(11) NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态(0:禁止,1:正常)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 0, '课程', 0, 'course', 'Layout', 'student', 'el-icon-s-tools', 1, 1, '2023-05-04 12:28:32', '2023-05-05 11:04:38', 0);
INSERT INTO `menu` VALUES (2, 1, '课程信息', 1, 'info', 'system/student/course/info/list', 'student', 'el-icon-s-tools', 1, 1, '2023-05-04 12:29:52', '2023-05-05 11:04:46', 0);
INSERT INTO `menu` VALUES (3, 0, '学习', 0, 'study', 'Layout', 'student', 'el-icon-s-tools', 2, 1, '2023-05-04 13:59:23', '2023-05-04 13:59:23', 0);
INSERT INTO `menu` VALUES (4, 3, '刷题', 1, 'practise', 'system/student/study/practise/list', 'student', 'el-icon-s-tools', 2, 1, '2023-05-04 14:00:15', '2023-05-04 14:00:15', 0);
INSERT INTO `menu` VALUES (5, 3, '错题', 1, 'experience', 'system/student/study/experience/list', 'student', 'el-icon-s-tools', 2, 1, '2023-05-04 14:00:35', '2023-05-04 14:00:35', 0);
INSERT INTO `menu` VALUES (6, 0, '考试', 0, 'exam', 'Layout', 'student', 'el-icon-s-tools', 3, 1, '2023-05-04 14:01:00', '2023-05-04 14:01:00', 0);
INSERT INTO `menu` VALUES (7, 6, '考试信息', 1, 'info', 'system/student/exam/info/list', 'student', 'el-icon-s-tools', 3, 1, '2023-05-04 14:01:31', '2023-05-04 14:01:31', 0);
INSERT INTO `menu` VALUES (9, 0, '考试', 0, 'exam', 'Layout', 'teacher', 'el-icon-s-tools', 1, 1, '2023-05-08 10:40:33', '2023-05-08 10:43:53', 0);
INSERT INTO `menu` VALUES (10, 9, '考试信息', 1, 'post', 'system/teacher/exam/post/list', 'teacher', 'el-icon-s-tools', 1, 1, '2023-05-08 10:41:18', '2023-05-08 11:19:19', 0);
INSERT INTO `menu` VALUES (11, 9, '题库', 1, 'questions', 'system/teacher/exam/questions/list', 'teacher', 'el-icon-s-tools', 1, 1, '2023-05-08 10:41:41', '2023-05-08 10:43:46', 0);
INSERT INTO `menu` VALUES (12, 9, '试卷', 1, 'papers', 'system/teacher/exam/papers/list', 'teacher', 'el-icon-s-tools', 1, 1, '2023-05-08 10:42:08', '2023-05-08 10:43:46', 0);
INSERT INTO `menu` VALUES (13, 0, '学生', 0, 'stu', 'Layout', 'teacher', 'el-icon-s-tools', 2, 1, '2023-05-08 10:42:40', '2023-05-08 11:23:45', 0);
INSERT INTO `menu` VALUES (14, 13, '学生信息', 1, 'info', 'system/teacher/stu/info/list', 'teacher', 'el-icon-s-tools', 2, 1, '2023-05-08 10:43:12', '2023-05-08 11:23:49', 0);
INSERT INTO `menu` VALUES (15, 9, '改卷', 1, 'check', 'system/teacher/exam/check/list', 'teacher', 'el-icon-s-tools', 1, 1, '2023-05-09 19:35:11', '2023-05-09 19:37:00', 0);

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NULL DEFAULT NULL,
  `xzt_id_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '选择题',
  `xzt_id_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '选择题',
  `xzt_id_3` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '选择题',
  `xzt_id_4` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '选择题',
  `xzt_id_5` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '选择题',
  `tkt_id_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '填空题',
  `tkt_id_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '填空题',
  `tkt_id_3` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '填空题',
  `tkt_id_4` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '填空题',
  `tkt_id_5` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '填空题',
  `pdt_id_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '判断题',
  `pdt_id_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '判断题',
  `pdt_id_3` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '判断题',
  `pdt_id_4` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '判断题',
  `pdt_id_5` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '判断题',
  `zgt_id_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '主观题',
  `zgt_id_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '主观题',
  `status` tinyint(3) NULL DEFAULT 1 COMMENT '状态（1：正常 0：停用）',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '试卷表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES (1, 1, '1', '2', '3', '4', '5', '1', '2', '3', '4', '5', '1', '2', '3', '4', '5', '1', '2', 1, NULL, '2023-05-06 13:04:05', '2023-05-09 17:52:40', 0);
INSERT INTO `paper` VALUES (2, 2, '2', '3', '4', '5', '6', '3', '4', '5', '6', '7', '4', '5', '6', '7', '8', '3', '4', 1, NULL, '2023-05-06 13:04:05', '2023-05-12 10:22:14', 1);
INSERT INTO `paper` VALUES (3, 2, '1', '2', '3', '4', '5', '1', '2', '3', '4', '5', '1', '2', '3', '4', '5', '1', '2', 1, NULL, '2023-05-09 16:29:39', '2023-05-12 10:22:42', 1);
INSERT INTO `paper` VALUES (4, 2, '9', '3', '4', '5', '6', '3', '4', '5', '6', '7', '4', '5', '6', '7', '8', '3', '4', 1, NULL, '2023-05-09 16:51:05', '2023-05-11 13:33:07', 0);
INSERT INTO `paper` VALUES (5, 2, '8', '2', '3', '4', '5', '1', '2', '3', '4', '5', '1', '2', '3', '4', '5', '1', '2', 1, NULL, '2023-05-09 16:51:58', '2023-05-09 16:51:58', 0);
INSERT INTO `paper` VALUES (6, 2, '10', '3', '4', '5', '6', '3', '4', '5', '6', '7', '4', '5', '6', '7', '8', '3', '4', 1, NULL, '2023-05-12 10:22:14', '2023-05-12 10:22:14', 0);
INSERT INTO `paper` VALUES (7, 2, '6', '2', '3', '4', '5', '1', '2', '3', '4', '5', '1', '2', '3', '4', '5', '1', '2', 1, NULL, '2023-05-12 10:22:42', '2023-05-12 10:22:42', 0);
INSERT INTO `paper` VALUES (8, NULL, '1', '2', '3', '4', '5', '1', '2', '3', '4', '5', '1', '2', '3', '4', '5', '2', '2', 1, NULL, '2023-05-12 15:57:21', '2023-05-12 15:57:21', 0);
INSERT INTO `paper` VALUES (9, 2, '1', '2', '3', '4', '5', '1', '2', '3', '4', '5', '1', '2', '3', '4', '5', '2', '2', 1, NULL, '2023-05-12 15:59:38', '2023-05-12 16:00:09', 1);

-- ----------------------------
-- Table structure for pdt
-- ----------------------------
DROP TABLE IF EXISTS `pdt`;
CREATE TABLE `pdt`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `a` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `b` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `score` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '3',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '判断题' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pdt
-- ----------------------------
INSERT INTO `pdt` VALUES (1, 1, 'p1', '1', '1', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (2, 1, 'p2', '2', '2', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (3, 1, 'p3', '3', '3', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (4, 1, 'p4', '4', '4', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (5, 1, 'p5', '5', '5', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (6, 1, 'p6', '6', '6', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (7, 1, 'p7', '7', '7', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (8, 1, 'p8', '8', '8', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (9, 1, 'p9', '9', '9', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (10, 1, 'p10', '10', '10', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (11, 2, 'p11', '11', '11', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (12, 2, 'p12', '12', '12', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (13, 2, 'p13', '13', '13', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (14, 2, 'p14', '14', '14', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (15, 2, 'p15', '15', '15', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (16, 2, 'p16', '16', '16', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (17, 2, 'p17', '17', '17', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (18, 2, 'p18', '18', '18', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (19, 2, 'p19', '19', '19', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (20, 2, 'p20', '20', '20', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (21, 3, 'p21', '21', '21', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (22, 3, 'p22', '22', '22', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (23, 3, 'p23', '23', '23', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (24, 3, 'p24', '24', '24', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (25, 3, 'p25', '25', '25', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (26, 3, 'p26', '26', '26', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (27, 3, 'p27', '27', '27', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (28, 3, 'p28', '28', '28', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (29, 3, 'p29', '29', '29', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (30, 3, 'p30', '30', '30', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (31, 4, 'p31', '31', '31', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (32, 4, 'p32', '32', '32', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (33, 4, 'p33', '33', '33', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (34, 4, 'p34', '34', '34', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (35, 4, 'p35', '35', '35', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (36, 4, 'p36', '36', '36', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (37, 4, 'p37', '37', '37', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (38, 4, 'p38', '38', '38', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (39, 4, 'p39', '39', '39', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (40, 4, 'p40', '40', '40', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (41, 5, 'p41', '41', '41', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (42, 5, 'p42', '42', '42', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (43, 5, 'p43', '43', '43', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (44, 5, 'p44', '44', '44', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (45, 5, 'p45', '45', '45', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (46, 5, 'p46', '46', '46', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (47, 5, 'p47', '47', '47', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (48, 5, 'p48', '48', '48', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (49, 5, 'p49', '49', '49', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (50, 5, 'p50', '50', '50', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (51, 6, 'p51', '51', '51', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (52, 6, 'p52', '52', '52', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (53, 6, 'p53', '53', '53', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (54, 6, 'p54', '54', '54', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (55, 6, 'p55', '55', '55', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (56, 6, 'p56', '56', '56', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (57, 6, 'p57', '57', '57', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (58, 6, 'p58', '58', '58', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (59, 6, 'p59', '59', '59', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (60, 6, 'p60', '60', '60', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (61, 7, 'p61', '61', '61', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (62, 7, 'p62', '62', '62', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (63, 7, 'p63', '63', '63', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (64, 7, 'p64', '64', '64', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (65, 7, 'p65', '65', '65', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (66, 7, 'p66', '66', '66', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (67, 7, 'p67', '67', '67', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (68, 7, 'p68', '68', '68', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (69, 7, 'p69', '69', '69', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (70, 7, 'p70', '70', '70', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (71, 8, 'p71', '71', '71', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (72, 8, 'p72', '72', '72', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (73, 8, 'p73', '73', '73', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (74, 8, 'p74', '74', '74', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (75, 8, 'p75', '75', '75', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (76, 8, 'p76', '76', '76', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (77, 8, 'p77', '77', '77', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (78, 8, 'p78', '78', '78', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (79, 8, 'p79', '79', '79', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);
INSERT INTO `pdt` VALUES (80, 8, 'p80', '80', '80', 'a', '3', '2023-05-07 17:16:46', '2023-05-07 17:16:46', 0);

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` int(11) NOT NULL,
  `question_id` int(11) NULL DEFAULT NULL,
  `question_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `course_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '学生id',
  `stu_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '学号',
  `class_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '学生班级id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '学生表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 1, 'B20190305130', '物联一班', '2023-05-03 17:18:24', '2023-05-10 02:46:34', 0);
INSERT INTO `student` VALUES (2, 2, 'B20190305210', '物联二班', '2023-05-03 17:30:25', '2023-05-10 03:57:16', 0);

-- ----------------------------
-- Table structure for student_course
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `course_id` int(11) NULL DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of student_course
-- ----------------------------
INSERT INTO `student_course` VALUES (1, 1, 1, '2023-05-04 17:05:14', '2023-05-05 17:31:39', 0);
INSERT INTO `student_course` VALUES (2, 1, 2, '2023-05-04 17:05:37', '2023-05-06 13:11:42', 0);
INSERT INTO `student_course` VALUES (3, 1, 3, '2023-05-06 13:11:41', '2023-05-06 13:11:43', 0);
INSERT INTO `student_course` VALUES (4, 1, 5, '2023-05-06 13:11:47', '2023-05-06 13:11:47', 0);
INSERT INTO `student_course` VALUES (5, 2, 3, '2023-05-06 13:11:51', '2023-05-06 13:11:51', 0);
INSERT INTO `student_course` VALUES (6, 2, 2, '2023-05-06 13:11:53', '2023-05-09 22:49:46', 0);
INSERT INTO `student_course` VALUES (7, 2, 5, '2023-05-06 13:11:56', '2023-05-06 13:11:56', 0);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL COMMENT '教师的课程',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '老师表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, 1, 1, '2023-05-03 17:17:04', '2023-05-03 17:17:04', 0);
INSERT INTO `teacher` VALUES (2, 4, 2, '2023-05-03 17:31:31', '2023-05-10 03:11:46', 0);
INSERT INTO `teacher` VALUES (3, 5, 3, '2023-05-04 21:03:35', '2023-05-04 21:03:35', 0);
INSERT INTO `teacher` VALUES (4, 6, 4, '2023-05-04 21:03:37', '2023-05-04 21:03:37', 0);
INSERT INTO `teacher` VALUES (5, 7, 5, '2023-05-04 21:03:41', '2023-05-04 21:03:41', 0);

-- ----------------------------
-- Table structure for tkt
-- ----------------------------
DROP TABLE IF EXISTS `tkt`;
CREATE TABLE `tkt`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `score` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '3',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '填空题' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tkt
-- ----------------------------
INSERT INTO `tkt` VALUES (1, 1, 't1', '1', '3', '2023-05-07 17:16:08', '2023-05-08 14:20:03', 0);
INSERT INTO `tkt` VALUES (2, 1, 't2', '2', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (3, 1, 't3', '3', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (4, 1, 't4', '4', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (5, 1, 't5', '5', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (6, 1, 't6', '6', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (7, 1, 't7', '7', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (8, 1, 't8', '8', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (9, 1, 't9', '9', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (10, 1, 't10', '10', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (11, 2, 't11', '11', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (12, 2, 't12', '12', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (13, 2, 't13', '13', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (14, 2, 't14', '14', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (15, 2, 't15', '15', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (16, 2, 't16', '16', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (17, 2, 't17', '17', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (18, 2, 't18', '18', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (19, 2, 't19', '19', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (20, 2, 't20', '20', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (21, 3, 't21', '21', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (22, 3, 't22', '22', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (23, 3, 't23', '23', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (24, 3, 't24', '24', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (25, 3, 't25', '25', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (26, 3, 't26', '26', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (27, 3, 't27', '27', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (28, 3, 't28', '28', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (29, 3, 't29', '29', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (30, 3, 't30', '30', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (31, 4, 't31', '31', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (32, 4, 't32', '32', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (33, 4, 't33', '33', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (34, 4, 't34', '34', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (35, 4, 't35', '35', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (36, 4, 't36', '36', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (37, 4, 't37', '37', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (38, 4, 't38', '38', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (39, 4, 't39', '39', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (40, 4, 't40', '40', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (41, 5, 't41', '41', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (42, 5, 't42', '42', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (43, 5, 't43', '43', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (44, 5, 't44', '44', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (45, 5, 't45', '45', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (46, 5, 't46', '46', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (47, 5, 't47', '47', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (48, 5, 't48', '48', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (49, 5, 't49', '49', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (50, 5, 't50', '50', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (51, 6, 't51', '51', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (52, 6, 't52', '52', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (53, 6, 't53', '53', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (54, 6, 't54', '54', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (55, 6, 't55', '55', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (56, 6, 't56', '56', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (57, 6, 't57', '57', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (58, 6, 't58', '58', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (59, 6, 't59', '59', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (60, 6, 't60', '60', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (61, 7, 't61', '61', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (62, 7, 't62', '62', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (63, 7, 't63', '63', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (64, 7, 't64', '64', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (65, 7, 't65', '65', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (66, 7, 't66', '66', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (67, 7, 't67', '67', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (68, 7, 't68', '68', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (69, 7, 't69', '69', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (70, 7, 't70', '70', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (71, 8, 't71', '71', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (72, 8, 't72', '72', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (73, 8, 't73', '73', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (74, 8, 't74', '74', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (75, 8, 't75', '75', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (76, 8, 't76', '76', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (77, 8, 't77', '77', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (78, 8, 't78', '78', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (79, 8, 't79', '79', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);
INSERT INTO `tkt` VALUES (80, 8, 't80', '80', '3', '2023-05-07 17:16:08', '2023-05-07 17:16:08', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '名字',
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `head_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '头像路径',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(3) NOT NULL DEFAULT 1 COMMENT '状态（1：正常 0：停用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '96e79218965eb72c92a549dd5a330112', 'admin', 'student', NULL, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', NULL, NULL, 1, '2023-05-03 14:42:15', '2023-05-04 14:58:40', 0);
INSERT INTO `user` VALUES (2, 'nayst', 'be3e832b612c32895a58321e91b70eb1', 'nayst', 'student', NULL, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', NULL, NULL, 1, '2023-05-03 17:20:16', '2023-05-03 17:20:22', 0);
INSERT INTO `user` VALUES (3, 'test', '098f6bcd4621d373cade4e832627b4f6', 'test', 'student', NULL, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', NULL, NULL, 1, '2023-05-03 17:22:15', '2023-05-03 17:22:21', 0);
INSERT INTO `user` VALUES (4, 'ekko', '2c06f4a1949f8ba4e77042a47674fd9e', 'Ekko', 'teacher', NULL, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', NULL, NULL, 1, '2023-05-03 17:30:58', '2023-05-08 10:44:27', 0);
INSERT INTO `user` VALUES (5, 'tt5', '96e79218965eb72c92a549dd5a330112', 'tt5', 'teacher', NULL, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', NULL, NULL, 1, '2023-05-04 21:01:28', '2023-05-04 21:02:08', 0);
INSERT INTO `user` VALUES (6, 'tt6', '96e79218965eb72c92a549dd5a330112', 'tt6', 'teacher', NULL, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', NULL, NULL, 1, '2023-05-04 21:01:44', '2023-05-04 21:02:08', 0);
INSERT INTO `user` VALUES (7, 'tt7', '96e79218965eb72c92a549dd5a330112', 'tt7', 'teacher', NULL, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', NULL, NULL, 1, '2023-05-04 21:01:59', '2023-05-04 21:02:08', 0);

-- ----------------------------
-- Table structure for xzt
-- ----------------------------
DROP TABLE IF EXISTS `xzt`;
CREATE TABLE `xzt`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '题目',
  `a` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `b` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `c` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `d` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '正确答案',
  `score` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '3' COMMENT '分值',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 86 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '选择题' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xzt
-- ----------------------------
INSERT INTO `xzt` VALUES (1, 1, 'x1', '1', '1', '1', '1', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (2, 1, 'x2', '2', '2', '2', '2', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (3, 1, 'x3', '3', '3', '3', '3', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (4, 1, 'x4', '4', '4', '4', '4', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (5, 1, 'x5', '5', '5', '5', '5', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (6, 1, 'x6', '6', '6', '6', '6', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (7, 1, 'x7', '7', '7', '7', '7', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (8, 1, 'x8', '8', '8', '8', '8', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (9, 1, 'x9', '9', '9', '9', '9', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (10, 1, 'x10', '10', '10', '10', '10', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (11, 2, 'x11', '11', '11', '11', '11', 'a', '3', '2023-05-07 17:11:40', '2023-05-09 01:08:18', 1);
INSERT INTO `xzt` VALUES (12, 2, 'x12', '12', '12', '12', '12', 'a', '3', '2023-05-07 17:11:40', '2023-05-11 13:34:44', 1);
INSERT INTO `xzt` VALUES (13, 2, 'x13', '13', '13', '13', '13', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (14, 2, 'x14', '14', '14', '14', '14', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (15, 2, 'x15', '15', '15', '15', '15', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (16, 2, 'x16', '16', '16', '16', '16', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (17, 2, 'x17', '17', '17', '17', '17', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (18, 2, 'x18', '18', '18', '18', '18', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (19, 2, 'x19', '19', '19', '19', '19', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (20, 2, 'x20', '20', '20', '20', '20', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (21, 3, 'x21', '21', '21', '21', '21', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (22, 3, 'x22', '22', '22', '22', '22', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (23, 3, 'x23', '23', '23', '23', '23', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (24, 3, 'x24', '24', '24', '24', '24', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (25, 3, 'x25', '25', '25', '25', '25', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (26, 3, 'x26', '26', '26', '26', '26', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (27, 3, 'x27', '27', '27', '27', '27', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (28, 3, 'x28', '28', '28', '28', '28', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (29, 3, 'x29', '29', '29', '29', '29', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (30, 3, 'x30', '30', '30', '30', '30', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (31, 4, 'x31', '31', '31', '31', '31', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (32, 4, 'x32', '32', '32', '32', '32', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (33, 4, 'x33', '33', '33', '33', '33', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (34, 4, 'x34', '34', '34', '34', '34', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (35, 4, 'x35', '35', '35', '35', '35', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (36, 4, 'x36', '36', '36', '36', '36', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (37, 4, 'x37', '37', '37', '37', '37', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (38, 4, 'x38', '38', '38', '38', '38', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (39, 4, 'x39', '39', '39', '39', '39', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (40, 4, 'x40', '40', '40', '40', '40', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (41, 5, 'x41', '41', '41', '41', '41', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (42, 5, 'x42', '42', '42', '42', '42', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (43, 5, 'x43', '43', '43', '43', '43', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (44, 5, 'x44', '44', '44', '44', '44', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (45, 5, 'x45', '45', '45', '45', '45', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (46, 5, 'x46', '46', '46', '46', '46', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (47, 5, 'x47', '47', '47', '47', '47', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (48, 5, 'x48', '48', '48', '48', '48', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (49, 5, 'x49', '49', '49', '49', '49', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (50, 5, 'x50', '50', '50', '50', '50', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (51, 6, 'x51', '51', '51', '51', '51', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (52, 6, 'x52', '52', '52', '52', '52', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (53, 6, 'x53', '53', '53', '53', '53', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (54, 6, 'x54', '54', '54', '54', '54', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (55, 6, 'x55', '55', '55', '55', '55', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (56, 6, 'x56', '56', '56', '56', '56', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (57, 6, 'x57', '57', '57', '57', '57', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (58, 6, 'x58', '58', '58', '58', '58', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (59, 6, 'x59', '59', '59', '59', '59', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (60, 6, 'x60', '60', '60', '60', '60', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (61, 7, 'x61', '61', '61', '61', '61', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (62, 7, 'x62', '62', '62', '62', '62', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (63, 7, 'x63', '63', '63', '63', '63', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (64, 7, 'x64', '64', '64', '64', '64', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (65, 7, 'x65', '65', '65', '65', '65', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (66, 7, 'x66', '66', '66', '66', '66', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (67, 7, 'x67', '67', '67', '67', '67', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (68, 7, 'x68', '68', '68', '68', '68', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (69, 7, 'x69', '69', '69', '69', '69', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (70, 7, 'x70', '70', '70', '70', '70', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (71, 8, 'x71', '71', '71', '71', '71', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (72, 8, 'x72', '72', '72', '72', '72', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (73, 8, 'x73', '73', '73', '73', '73', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (74, 8, 'x74', '74', '74', '74', '74', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (75, 8, 'x75', '75', '75', '75', '75', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (76, 8, 'x76', '76', '76', '76', '76', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (77, 8, 'x77', '77', '77', '77', '77', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (78, 8, 'x78', '78', '78', '78', '78', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (79, 8, 'x79', '79', '79', '79', '79', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (80, 8, 'x80', '80', '80', '80', '80', 'a', '3', '2023-05-07 17:11:40', '2023-05-07 17:11:40', 0);
INSERT INTO `xzt` VALUES (81, 2, 'x11', '12', '11', '11', '11', 'a', '3', '2023-05-09 01:08:18', '2023-05-09 01:13:16', 1);
INSERT INTO `xzt` VALUES (82, 2, 'x12', '13', '12', '12', '12', 'a', '3', '2023-05-11 13:34:44', '2023-05-11 13:34:44', 0);
INSERT INTO `xzt` VALUES (83, 2, 'xxx', '1', '2', '3', '4', 'a', '3', '2023-05-11 13:42:59', '2023-05-12 01:35:28', 1);
INSERT INTO `xzt` VALUES (84, 2, 'test', 'test', 'test', 'test', 'test', 'a', '3', '2023-05-12 01:24:56', '2023-05-12 01:28:23', 1);
INSERT INTO `xzt` VALUES (85, 2, 'test123', 'test', 'test', 'test', 'test', 'a', '3', '2023-05-12 01:28:23', '2023-05-12 01:32:41', 1);

-- ----------------------------
-- Table structure for zgt
-- ----------------------------
DROP TABLE IF EXISTS `zgt`;
CREATE TABLE `zgt`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `score` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '10',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '主观题' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zgt
-- ----------------------------
INSERT INTO `zgt` VALUES (1, 1, 'z1', '1', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (2, 1, 'z2', '2', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (3, 1, 'z3', '3', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (4, 1, 'z4', '4', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (5, 1, 'z5', '5', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (6, 2, 'z6', '6', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (7, 2, 'z7', '7', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (8, 2, 'z8', '8', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (9, 2, 'z9', '9', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (10, 2, 'z10', '10', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (11, 3, 'z11', '11', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (12, 3, 'z12', '12', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (13, 3, 'z13', '13', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (14, 3, 'z14', '14', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (15, 3, 'z15', '15', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (16, 4, 'z16', '16', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (17, 4, 'z17', '17', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (18, 4, 'z18', '18', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (19, 4, 'z19', '19', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (20, 4, 'z20', '20', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (21, 5, 'z21', '21', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (22, 5, 'z22', '22', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (23, 5, 'z23', '23', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (24, 5, 'z24', '24', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (25, 5, 'z25', '25', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (26, 6, 'z26', '26', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (27, 6, 'z27', '27', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (28, 6, 'z28', '28', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (29, 6, 'z29', '29', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (30, 6, 'z30', '30', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (31, 7, 'z31', '31', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (32, 7, 'z32', '32', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (33, 7, 'z33', '33', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (34, 7, 'z34', '34', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (35, 7, 'z35', '35', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (36, 8, 'z36', '36', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (37, 8, 'z37', '37', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (38, 8, 'z38', '38', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (39, 8, 'z39', '39', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);
INSERT INTO `zgt` VALUES (40, 8, 'z40', '40', '10', '2023-05-07 17:18:01', '2023-05-07 17:18:01', 0);

SET FOREIGN_KEY_CHECKS = 1;

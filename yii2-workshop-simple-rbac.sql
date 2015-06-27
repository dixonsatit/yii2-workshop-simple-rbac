/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50622
 Source Host           : localhost
 Source Database       : yii2-workshop-simple-rbac

 Target Server Type    : MySQL
 Target Server Version : 50622
 File Encoding         : utf-8

 Date: 06/27/2015 14:52:52 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `blog`
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) DEFAULT NULL COMMENT 'ชื่อเรื่อง',
  `detail` varchar(255) DEFAULT NULL COMMENT 'รายละเอียด',
  `tag` varchar(15) DEFAULT NULL COMMENT 'แท็ก',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `blog`
-- ----------------------------
BEGIN;
INSERT INTO `blog` VALUES ('1', 'การใช้งาน RBAC', 'การใช้งาน RBAC', '2', '1', '1', '1435371457', '1435391074'), ('2', 'การสร้าง Rbac อย่างง่าย', 'การสร้าง Rbac อย่างง่าย,เพิ่มเติม', '', '2', '3', '1435382069', '1435382177'), ('3', 'สร้างโดย Mod', 'สร้างโดย Mod แก้ไขโดย Admin', '', '3', '1', '1435382408', '1435382462');
COMMIT;

-- ----------------------------
--  Table structure for `migration`
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `migration`
-- ----------------------------
BEGIN;
INSERT INTO `migration` VALUES ('m000000_000000_base', '1435334892'), ('m130524_201442_init', '1435334894');
COMMIT;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', 'admin', '_tOhzx9KID06QY_CHTavFwq3Dj0cBCUZ', '$2y$13$sym55NrOcb1vk3WWMz8K/.Hxu0IXEZKjTFBqhl8TcrJECa.6Ddg6W', null, 'dixonsatit@gmail.com', '10', '1435370802', '1435370802', '30'), ('2', 'user', 'EbAkikYHPJvmuT405BiTqTJn7fLK0ETf', '$2y$13$hOk521v.XjL1xhsdECF3vOvIX9np9VG9Z8vX05U8AfjYfotPDPaAW', null, 'user@dimple.me', '10', '1435378014', '1435378014', '10'), ('3', 'mod', 'uLQ4jFuudzWo25R6kHCCAAF0gCfAvHRy', '$2y$13$X5zH4yq2SwXOlgeUsCF6ZeHjKvKgFwGnvicnVvVu1O0a/jWUfigha', null, 'mod@dimpled.me', '10', '1435380979', '1435380979', '20');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

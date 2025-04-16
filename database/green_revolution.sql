/*
 Navicat Premium Dump SQL

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80041 (8.0.41)
 Source Host           : localhost:3306
 Source Schema         : green_revolution

 Target Server Type    : MySQL
 Target Server Version : 80041 (8.0.41)
 File Encoding         : 65001

 Date: 16/04/2025 23:33:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `address_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_address_id` int UNSIGNED NULL DEFAULT NULL,
  `customer_id` int UNSIGNED NULL DEFAULT NULL COMMENT 'null if guest checkout',
  `cart_id` int UNSIGNED NULL DEFAULT NULL COMMENT 'only for cart_addresses',
  `order_id` int UNSIGNED NULL DEFAULT NULL COMMENT 'only for order_addresses',
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `postcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `vat_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'only for customer_addresses',
  `use_for_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `additional` json NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `addresses_customer_id_foreign`(`customer_id` ASC) USING BTREE,
  INDEX `addresses_cart_id_foreign`(`cart_id` ASC) USING BTREE,
  INDEX `addresses_order_id_foreign`(`order_id` ASC) USING BTREE,
  INDEX `addresses_parent_address_id_foreign`(`parent_address_id` ASC) USING BTREE,
  CONSTRAINT `addresses_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `addresses_parent_address_id_foreign` FOREIGN KEY (`parent_address_id`) REFERENCES `addresses` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of addresses
-- ----------------------------

-- ----------------------------
-- Table structure for admin_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `admin_password_resets`;
CREATE TABLE `admin_password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `admin_password_resets_email_index`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `api_token` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `role_id` int UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admins_email_unique`(`email` ASC) USING BTREE,
  UNIQUE INDEX `admins_api_token_unique`(`api_token` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES (1, 'admin', 'admin@example.com', '$2y$12$RNXqB/tW6cZznDN1MTMBwuwq9p.HX35g0akHx7xE3c60vX7D5vIQW', 'b9XyXjN3AzlHPoxnKzGq0MjtHJWLb2BlSSYk7c9aoINZNRYnc7bExBmN7hrIJH6XbfwXoa9yLpNCwOHw', 1, 1, NULL, NULL, '2025-04-13 19:52:27', '2025-04-13 19:53:19');

-- ----------------------------
-- Table structure for attribute_families
-- ----------------------------
DROP TABLE IF EXISTS `attribute_families`;
CREATE TABLE `attribute_families`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attribute_families
-- ----------------------------
INSERT INTO `attribute_families` VALUES (1, 'default', 'Default', 0, 1);

-- ----------------------------
-- Table structure for attribute_group_mappings
-- ----------------------------
DROP TABLE IF EXISTS `attribute_group_mappings`;
CREATE TABLE `attribute_group_mappings`  (
  `attribute_id` int UNSIGNED NOT NULL,
  `attribute_group_id` int UNSIGNED NOT NULL,
  `position` int NULL DEFAULT NULL,
  PRIMARY KEY (`attribute_id`, `attribute_group_id`) USING BTREE,
  INDEX `attribute_group_mappings_attribute_group_id_foreign`(`attribute_group_id` ASC) USING BTREE,
  CONSTRAINT `attribute_group_mappings_attribute_group_id_foreign` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_groups` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `attribute_group_mappings_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attribute_group_mappings
-- ----------------------------
INSERT INTO `attribute_group_mappings` VALUES (1, 1, 1);
INSERT INTO `attribute_group_mappings` VALUES (2, 1, 3);
INSERT INTO `attribute_group_mappings` VALUES (3, 1, 4);
INSERT INTO `attribute_group_mappings` VALUES (4, 1, 5);
INSERT INTO `attribute_group_mappings` VALUES (5, 6, 1);
INSERT INTO `attribute_group_mappings` VALUES (6, 6, 2);
INSERT INTO `attribute_group_mappings` VALUES (7, 6, 3);
INSERT INTO `attribute_group_mappings` VALUES (8, 6, 4);
INSERT INTO `attribute_group_mappings` VALUES (9, 2, 1);
INSERT INTO `attribute_group_mappings` VALUES (10, 2, 2);
INSERT INTO `attribute_group_mappings` VALUES (11, 4, 1);
INSERT INTO `attribute_group_mappings` VALUES (12, 4, 2);
INSERT INTO `attribute_group_mappings` VALUES (13, 4, 3);
INSERT INTO `attribute_group_mappings` VALUES (14, 4, 4);
INSERT INTO `attribute_group_mappings` VALUES (15, 4, 5);
INSERT INTO `attribute_group_mappings` VALUES (16, 3, 1);
INSERT INTO `attribute_group_mappings` VALUES (17, 3, 2);
INSERT INTO `attribute_group_mappings` VALUES (18, 3, 3);
INSERT INTO `attribute_group_mappings` VALUES (19, 5, 1);
INSERT INTO `attribute_group_mappings` VALUES (20, 5, 2);
INSERT INTO `attribute_group_mappings` VALUES (21, 5, 3);
INSERT INTO `attribute_group_mappings` VALUES (22, 5, 4);
INSERT INTO `attribute_group_mappings` VALUES (23, 1, 6);
INSERT INTO `attribute_group_mappings` VALUES (24, 1, 7);
INSERT INTO `attribute_group_mappings` VALUES (25, 1, 8);
INSERT INTO `attribute_group_mappings` VALUES (26, 6, 5);
INSERT INTO `attribute_group_mappings` VALUES (27, 1, 2);
INSERT INTO `attribute_group_mappings` VALUES (28, 7, 1);

-- ----------------------------
-- Table structure for attribute_groups
-- ----------------------------
DROP TABLE IF EXISTS `attribute_groups`;
CREATE TABLE `attribute_groups`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attribute_family_id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `column` int NOT NULL DEFAULT 1,
  `position` int NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `attribute_groups_attribute_family_id_name_unique`(`attribute_family_id` ASC, `name` ASC) USING BTREE,
  CONSTRAINT `attribute_groups_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attribute_groups
-- ----------------------------
INSERT INTO `attribute_groups` VALUES (1, 'general', 1, 'General', 1, 1, 0);
INSERT INTO `attribute_groups` VALUES (2, 'description', 1, 'Description', 1, 2, 0);
INSERT INTO `attribute_groups` VALUES (3, 'meta_description', 1, 'Meta Description', 1, 3, 0);
INSERT INTO `attribute_groups` VALUES (4, 'price', 1, 'Price', 2, 1, 0);
INSERT INTO `attribute_groups` VALUES (5, 'shipping', 1, 'Shipping', 2, 2, 0);
INSERT INTO `attribute_groups` VALUES (6, 'settings', 1, 'Settings', 2, 3, 0);
INSERT INTO `attribute_groups` VALUES (7, 'inventories', 1, 'Inventories', 2, 4, 0);

-- ----------------------------
-- Table structure for attribute_option_translations
-- ----------------------------
DROP TABLE IF EXISTS `attribute_option_translations`;
CREATE TABLE `attribute_option_translations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_option_id` int UNSIGNED NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `attribute_option_locale_unique`(`attribute_option_id` ASC, `locale` ASC) USING BTREE,
  CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attribute_option_translations
-- ----------------------------
INSERT INTO `attribute_option_translations` VALUES (1, 1, 'en', 'Red');
INSERT INTO `attribute_option_translations` VALUES (2, 2, 'en', 'Green');
INSERT INTO `attribute_option_translations` VALUES (3, 3, 'en', 'Yellow');
INSERT INTO `attribute_option_translations` VALUES (4, 4, 'en', 'Black');
INSERT INTO `attribute_option_translations` VALUES (5, 5, 'en', 'White');
INSERT INTO `attribute_option_translations` VALUES (6, 6, 'en', 'S');
INSERT INTO `attribute_option_translations` VALUES (7, 7, 'en', 'M');
INSERT INTO `attribute_option_translations` VALUES (8, 8, 'en', 'L');
INSERT INTO `attribute_option_translations` VALUES (9, 9, 'en', 'XL');

-- ----------------------------
-- Table structure for attribute_options
-- ----------------------------
DROP TABLE IF EXISTS `attribute_options`;
CREATE TABLE `attribute_options`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_id` int UNSIGNED NOT NULL,
  `admin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sort_order` int NULL DEFAULT NULL,
  `swatch_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `attribute_options_attribute_id_foreign`(`attribute_id` ASC) USING BTREE,
  CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attribute_options
-- ----------------------------
INSERT INTO `attribute_options` VALUES (1, 23, 'Red', 1, NULL);
INSERT INTO `attribute_options` VALUES (2, 23, 'Green', 2, NULL);
INSERT INTO `attribute_options` VALUES (3, 23, 'Yellow', 3, NULL);
INSERT INTO `attribute_options` VALUES (4, 23, 'Black', 4, NULL);
INSERT INTO `attribute_options` VALUES (5, 23, 'White', 5, NULL);
INSERT INTO `attribute_options` VALUES (6, 24, 'S', 1, NULL);
INSERT INTO `attribute_options` VALUES (7, 24, 'M', 2, NULL);
INSERT INTO `attribute_options` VALUES (8, 24, 'L', 3, NULL);
INSERT INTO `attribute_options` VALUES (9, 24, 'XL', 4, NULL);

-- ----------------------------
-- Table structure for attribute_translations
-- ----------------------------
DROP TABLE IF EXISTS `attribute_translations`;
CREATE TABLE `attribute_translations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_id` int UNSIGNED NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `attribute_translations_attribute_id_locale_unique`(`attribute_id` ASC, `locale` ASC) USING BTREE,
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attribute_translations
-- ----------------------------
INSERT INTO `attribute_translations` VALUES (1, 1, 'en', 'SKU');
INSERT INTO `attribute_translations` VALUES (2, 2, 'en', 'Name');
INSERT INTO `attribute_translations` VALUES (3, 3, 'en', 'URL Key');
INSERT INTO `attribute_translations` VALUES (4, 4, 'en', 'Tax Category');
INSERT INTO `attribute_translations` VALUES (5, 5, 'en', 'New');
INSERT INTO `attribute_translations` VALUES (6, 6, 'en', 'Featured');
INSERT INTO `attribute_translations` VALUES (7, 7, 'en', 'Visible Individually');
INSERT INTO `attribute_translations` VALUES (8, 8, 'en', 'Status');
INSERT INTO `attribute_translations` VALUES (9, 9, 'en', 'Short Description');
INSERT INTO `attribute_translations` VALUES (10, 10, 'en', 'Description');
INSERT INTO `attribute_translations` VALUES (11, 11, 'en', 'Price');
INSERT INTO `attribute_translations` VALUES (12, 12, 'en', 'Cost');
INSERT INTO `attribute_translations` VALUES (13, 13, 'en', 'Special Price');
INSERT INTO `attribute_translations` VALUES (14, 14, 'en', 'Special Price From');
INSERT INTO `attribute_translations` VALUES (15, 15, 'en', 'Special Price To');
INSERT INTO `attribute_translations` VALUES (16, 16, 'en', 'Meta Title');
INSERT INTO `attribute_translations` VALUES (17, 17, 'en', 'Meta Keywords');
INSERT INTO `attribute_translations` VALUES (18, 18, 'en', 'Meta Description');
INSERT INTO `attribute_translations` VALUES (19, 19, 'en', 'Length');
INSERT INTO `attribute_translations` VALUES (20, 20, 'en', 'Width');
INSERT INTO `attribute_translations` VALUES (21, 21, 'en', 'Height');
INSERT INTO `attribute_translations` VALUES (22, 22, 'en', 'Weight');
INSERT INTO `attribute_translations` VALUES (23, 23, 'en', 'Color');
INSERT INTO `attribute_translations` VALUES (24, 24, 'en', 'Size');
INSERT INTO `attribute_translations` VALUES (25, 25, 'en', 'Brand');
INSERT INTO `attribute_translations` VALUES (26, 26, 'en', 'Guest Checkout');
INSERT INTO `attribute_translations` VALUES (27, 27, 'en', 'Product Number');
INSERT INTO `attribute_translations` VALUES (28, 28, 'en', 'Manage Stock');

-- ----------------------------
-- Table structure for attributes
-- ----------------------------
DROP TABLE IF EXISTS `attributes`;
CREATE TABLE `attributes`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `swatch_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `validation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `regex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `position` int NULL DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `is_unique` tinyint(1) NOT NULL DEFAULT 0,
  `is_filterable` tinyint(1) NOT NULL DEFAULT 0,
  `is_comparable` tinyint(1) NOT NULL DEFAULT 0,
  `is_configurable` tinyint(1) NOT NULL DEFAULT 0,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  `is_visible_on_front` tinyint(1) NOT NULL DEFAULT 0,
  `value_per_locale` tinyint(1) NOT NULL DEFAULT 0,
  `value_per_channel` tinyint(1) NOT NULL DEFAULT 0,
  `default_value` int NULL DEFAULT NULL,
  `enable_wysiwyg` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `attributes_code_unique`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attributes
-- ----------------------------
INSERT INTO `attributes` VALUES (1, 'sku', 'SKU', 'text', NULL, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (2, 'name', 'Name', 'text', NULL, NULL, NULL, 3, 1, 0, 0, 1, 0, 0, 0, 1, 0, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (3, 'url_key', 'URL Key', 'text', NULL, NULL, NULL, 4, 1, 1, 0, 0, 0, 0, 0, 1, 0, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (4, 'tax_category_id', 'Tax Category', 'select', NULL, NULL, NULL, 5, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (5, 'new', 'New', 'boolean', NULL, NULL, NULL, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (6, 'featured', 'Featured', 'boolean', NULL, NULL, NULL, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (7, 'visible_individually', 'Visible Individually', 'boolean', NULL, NULL, NULL, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (8, 'status', 'Status', 'boolean', NULL, NULL, NULL, 10, 1, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (9, 'short_description', 'Short Description', 'textarea', NULL, NULL, NULL, 11, 1, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 1, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (10, 'description', 'Description', 'textarea', NULL, NULL, NULL, 12, 1, 0, 0, 1, 0, 0, 0, 1, 0, NULL, 1, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (11, 'price', 'Price', 'price', NULL, 'decimal', NULL, 13, 1, 0, 1, 1, 0, 0, 0, 0, 0, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (12, 'cost', 'Cost', 'price', NULL, 'decimal', NULL, 14, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (13, 'special_price', 'Special Price', 'price', NULL, 'decimal', NULL, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (14, 'special_price_from', 'Special Price From', 'date', NULL, NULL, NULL, 16, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (15, 'special_price_to', 'Special Price To', 'date', NULL, NULL, NULL, 17, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (16, 'meta_title', 'Meta Title', 'textarea', NULL, NULL, NULL, 18, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (17, 'meta_keywords', 'Meta Keywords', 'textarea', NULL, NULL, NULL, 20, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (18, 'meta_description', 'Meta Description', 'textarea', NULL, NULL, NULL, 21, 0, 0, 0, 0, 0, 1, 0, 1, 0, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (19, 'length', 'Length', 'text', NULL, 'decimal', NULL, 22, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (20, 'width', 'Width', 'text', NULL, 'decimal', NULL, 23, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (21, 'height', 'Height', 'text', NULL, 'decimal', NULL, 24, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (22, 'weight', 'Weight', 'text', NULL, 'decimal', NULL, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (23, 'color', 'Color', 'select', NULL, NULL, NULL, 26, 0, 0, 1, 0, 1, 1, 0, 0, 0, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (24, 'size', 'Size', 'select', NULL, NULL, NULL, 27, 0, 0, 1, 0, 1, 1, 0, 0, 0, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (25, 'brand', 'Brand', 'select', NULL, NULL, NULL, 28, 0, 0, 1, 0, 0, 1, 1, 0, 0, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (26, 'guest_checkout', 'Guest Checkout', 'boolean', NULL, NULL, NULL, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (27, 'product_number', 'Product Number', 'text', NULL, NULL, NULL, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');
INSERT INTO `attributes` VALUES (28, 'manage_stock', 'Manage Stock', 'boolean', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2025-04-13 19:52:26', '2025-04-13 19:52:26');

-- ----------------------------
-- Table structure for booking_product_appointment_slots
-- ----------------------------
DROP TABLE IF EXISTS `booking_product_appointment_slots`;
CREATE TABLE `booking_product_appointment_slots`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `booking_product_id` int UNSIGNED NOT NULL,
  `duration` int NULL DEFAULT NULL,
  `break_time` int NULL DEFAULT NULL,
  `same_slot_all_days` tinyint(1) NULL DEFAULT NULL,
  `slots` json NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `booking_product_appointment_slots_booking_product_id_foreign`(`booking_product_id` ASC) USING BTREE,
  CONSTRAINT `booking_product_appointment_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of booking_product_appointment_slots
-- ----------------------------

-- ----------------------------
-- Table structure for booking_product_default_slots
-- ----------------------------
DROP TABLE IF EXISTS `booking_product_default_slots`;
CREATE TABLE `booking_product_default_slots`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `booking_product_id` int UNSIGNED NOT NULL,
  `booking_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int NULL DEFAULT NULL,
  `break_time` int NULL DEFAULT NULL,
  `slots` json NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `booking_product_default_slots_booking_product_id_foreign`(`booking_product_id` ASC) USING BTREE,
  CONSTRAINT `booking_product_default_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of booking_product_default_slots
-- ----------------------------

-- ----------------------------
-- Table structure for booking_product_event_ticket_translations
-- ----------------------------
DROP TABLE IF EXISTS `booking_product_event_ticket_translations`;
CREATE TABLE `booking_product_event_ticket_translations`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `booking_product_event_ticket_id` bigint UNSIGNED NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `bpet_locale_unique`(`booking_product_event_ticket_id` ASC, `locale` ASC) USING BTREE,
  CONSTRAINT `bpet_translations_fk` FOREIGN KEY (`booking_product_event_ticket_id`) REFERENCES `booking_product_event_tickets` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of booking_product_event_ticket_translations
-- ----------------------------

-- ----------------------------
-- Table structure for booking_product_event_tickets
-- ----------------------------
DROP TABLE IF EXISTS `booking_product_event_tickets`;
CREATE TABLE `booking_product_event_tickets`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `booking_product_id` int UNSIGNED NOT NULL,
  `price` decimal(12, 4) NULL DEFAULT 0.0000,
  `qty` int NULL DEFAULT 0,
  `special_price` decimal(12, 4) NULL DEFAULT NULL,
  `special_price_from` datetime NULL DEFAULT NULL,
  `special_price_to` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `booking_product_event_tickets_booking_product_id_foreign`(`booking_product_id` ASC) USING BTREE,
  CONSTRAINT `booking_product_event_tickets_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of booking_product_event_tickets
-- ----------------------------

-- ----------------------------
-- Table structure for booking_product_rental_slots
-- ----------------------------
DROP TABLE IF EXISTS `booking_product_rental_slots`;
CREATE TABLE `booking_product_rental_slots`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `booking_product_id` int UNSIGNED NOT NULL,
  `renting_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `daily_price` decimal(12, 4) NULL DEFAULT 0.0000,
  `hourly_price` decimal(12, 4) NULL DEFAULT 0.0000,
  `same_slot_all_days` tinyint(1) NULL DEFAULT NULL,
  `slots` json NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `booking_product_rental_slots_booking_product_id_foreign`(`booking_product_id` ASC) USING BTREE,
  CONSTRAINT `booking_product_rental_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of booking_product_rental_slots
-- ----------------------------

-- ----------------------------
-- Table structure for booking_product_table_slots
-- ----------------------------
DROP TABLE IF EXISTS `booking_product_table_slots`;
CREATE TABLE `booking_product_table_slots`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `booking_product_id` int UNSIGNED NOT NULL,
  `price_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guest_limit` int NOT NULL DEFAULT 0,
  `duration` int NOT NULL,
  `break_time` int NOT NULL,
  `prevent_scheduling_before` int NOT NULL,
  `same_slot_all_days` tinyint(1) NULL DEFAULT NULL,
  `slots` json NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `booking_product_table_slots_booking_product_id_foreign`(`booking_product_id` ASC) USING BTREE,
  CONSTRAINT `booking_product_table_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of booking_product_table_slots
-- ----------------------------

-- ----------------------------
-- Table structure for booking_products
-- ----------------------------
DROP TABLE IF EXISTS `booking_products`;
CREATE TABLE `booking_products`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int NULL DEFAULT 0,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `show_location` tinyint(1) NOT NULL DEFAULT 0,
  `available_every_week` tinyint(1) NULL DEFAULT NULL,
  `available_from` datetime NULL DEFAULT NULL,
  `available_to` datetime NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `booking_products_product_id_foreign`(`product_id` ASC) USING BTREE,
  CONSTRAINT `booking_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of booking_products
-- ----------------------------

-- ----------------------------
-- Table structure for bookings
-- ----------------------------
DROP TABLE IF EXISTS `bookings`;
CREATE TABLE `bookings`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int UNSIGNED NULL DEFAULT NULL,
  `order_item_id` int UNSIGNED NULL DEFAULT NULL,
  `order_id` int UNSIGNED NULL DEFAULT NULL,
  `qty` int NULL DEFAULT 0,
  `from` int NULL DEFAULT NULL,
  `to` int NULL DEFAULT NULL,
  `booking_product_event_ticket_id` bigint UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bookings_order_item_id_foreign`(`order_item_id` ASC) USING BTREE,
  INDEX `bookings_booking_product_event_ticket_id_foreign`(`booking_product_event_ticket_id` ASC) USING BTREE,
  INDEX `bookings_order_id_foreign`(`order_id` ASC) USING BTREE,
  INDEX `bookings_product_id_foreign`(`product_id` ASC) USING BTREE,
  CONSTRAINT `bookings_booking_product_event_ticket_id_foreign` FOREIGN KEY (`booking_product_event_ticket_id`) REFERENCES `booking_product_event_tickets` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `bookings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `bookings_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `bookings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookings
-- ----------------------------

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `customer_first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `customer_last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `shipping_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `coupon_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT 0,
  `items_count` int NULL DEFAULT NULL,
  `items_qty` decimal(12, 4) NULL DEFAULT NULL,
  `exchange_rate` decimal(12, 4) NULL DEFAULT NULL,
  `global_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `base_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `channel_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cart_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `grand_total` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_grand_total` decimal(12, 4) NULL DEFAULT 0.0000,
  `sub_total` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_sub_total` decimal(12, 4) NULL DEFAULT 0.0000,
  `tax_total` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_tax_total` decimal(12, 4) NULL DEFAULT 0.0000,
  `discount_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_discount_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `shipping_amount` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `shipping_amount_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `sub_total_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_sub_total_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `checkout_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_guest` tinyint(1) NULL DEFAULT NULL,
  `is_active` tinyint(1) NULL DEFAULT 1,
  `applied_cart_rule_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `customer_id` int UNSIGNED NULL DEFAULT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cart_customer_id_foreign`(`customer_id` ASC) USING BTREE,
  INDEX `cart_channel_id_foreign`(`channel_id` ASC) USING BTREE,
  CONSTRAINT `cart_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for cart_item_inventories
-- ----------------------------
DROP TABLE IF EXISTS `cart_item_inventories`;
CREATE TABLE `cart_item_inventories`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `qty` int UNSIGNED NOT NULL DEFAULT 0,
  `inventory_source_id` int UNSIGNED NULL DEFAULT NULL,
  `cart_item_id` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_item_inventories
-- ----------------------------

-- ----------------------------
-- Table structure for cart_items
-- ----------------------------
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantity` int UNSIGNED NOT NULL DEFAULT 0,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `coupon_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `weight` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `total_weight` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_total_weight` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `price` decimal(12, 4) NOT NULL DEFAULT 1.0000,
  `base_price` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `custom_price` decimal(12, 4) NULL DEFAULT NULL,
  `total` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `tax_percent` decimal(12, 4) NULL DEFAULT 0.0000,
  `tax_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_tax_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `discount_percent` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `discount_amount` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_discount_amount` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `price_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `total_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_total_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `applied_tax_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parent_id` int UNSIGNED NULL DEFAULT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `cart_id` int UNSIGNED NOT NULL,
  `tax_category_id` int UNSIGNED NULL DEFAULT NULL,
  `applied_cart_rule_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `additional` json NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cart_items_parent_id_foreign`(`parent_id` ASC) USING BTREE,
  INDEX `cart_items_product_id_foreign`(`product_id` ASC) USING BTREE,
  INDEX `cart_items_cart_id_foreign`(`cart_id` ASC) USING BTREE,
  INDEX `cart_items_tax_category_id_foreign`(`tax_category_id` ASC) USING BTREE,
  CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cart_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `cart_items` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cart_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_items
-- ----------------------------

-- ----------------------------
-- Table structure for cart_payment
-- ----------------------------
DROP TABLE IF EXISTS `cart_payment`;
CREATE TABLE `cart_payment`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cart_id` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cart_payment_cart_id_foreign`(`cart_id` ASC) USING BTREE,
  CONSTRAINT `cart_payment_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_payment
-- ----------------------------

-- ----------------------------
-- Table structure for cart_rule_channels
-- ----------------------------
DROP TABLE IF EXISTS `cart_rule_channels`;
CREATE TABLE `cart_rule_channels`  (
  `cart_rule_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`cart_rule_id`, `channel_id`) USING BTREE,
  INDEX `cart_rule_channels_channel_id_foreign`(`channel_id` ASC) USING BTREE,
  CONSTRAINT `cart_rule_channels_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cart_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_rule_channels
-- ----------------------------

-- ----------------------------
-- Table structure for cart_rule_coupon_usage
-- ----------------------------
DROP TABLE IF EXISTS `cart_rule_coupon_usage`;
CREATE TABLE `cart_rule_coupon_usage`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `times_used` int NOT NULL DEFAULT 0,
  `cart_rule_coupon_id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cart_rule_coupon_usage_cart_rule_coupon_id_foreign`(`cart_rule_coupon_id` ASC) USING BTREE,
  INDEX `cart_rule_coupon_usage_customer_id_foreign`(`customer_id` ASC) USING BTREE,
  CONSTRAINT `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` FOREIGN KEY (`cart_rule_coupon_id`) REFERENCES `cart_rule_coupons` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cart_rule_coupon_usage_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_rule_coupon_usage
-- ----------------------------

-- ----------------------------
-- Table structure for cart_rule_coupons
-- ----------------------------
DROP TABLE IF EXISTS `cart_rule_coupons`;
CREATE TABLE `cart_rule_coupons`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `usage_limit` int UNSIGNED NOT NULL DEFAULT 0,
  `usage_per_customer` int UNSIGNED NOT NULL DEFAULT 0,
  `times_used` int UNSIGNED NOT NULL DEFAULT 0,
  `type` int UNSIGNED NOT NULL DEFAULT 0,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `expired_at` date NULL DEFAULT NULL,
  `cart_rule_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cart_rule_coupons_cart_rule_id_foreign`(`cart_rule_id` ASC) USING BTREE,
  CONSTRAINT `cart_rule_coupons_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_rule_coupons
-- ----------------------------

-- ----------------------------
-- Table structure for cart_rule_customer_groups
-- ----------------------------
DROP TABLE IF EXISTS `cart_rule_customer_groups`;
CREATE TABLE `cart_rule_customer_groups`  (
  `cart_rule_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`cart_rule_id`, `customer_group_id`) USING BTREE,
  INDEX `cart_rule_customer_groups_customer_group_id_foreign`(`customer_group_id` ASC) USING BTREE,
  CONSTRAINT `cart_rule_customer_groups_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cart_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_rule_customer_groups
-- ----------------------------

-- ----------------------------
-- Table structure for cart_rule_customers
-- ----------------------------
DROP TABLE IF EXISTS `cart_rule_customers`;
CREATE TABLE `cart_rule_customers`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `times_used` bigint UNSIGNED NOT NULL DEFAULT 0,
  `customer_id` int UNSIGNED NOT NULL,
  `cart_rule_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cart_rule_customers_cart_rule_id_foreign`(`cart_rule_id` ASC) USING BTREE,
  INDEX `cart_rule_customers_customer_id_foreign`(`customer_id` ASC) USING BTREE,
  CONSTRAINT `cart_rule_customers_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cart_rule_customers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_rule_customers
-- ----------------------------

-- ----------------------------
-- Table structure for cart_rule_translations
-- ----------------------------
DROP TABLE IF EXISTS `cart_rule_translations`;
CREATE TABLE `cart_rule_translations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `cart_rule_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cart_rule_translations_cart_rule_id_locale_unique`(`cart_rule_id` ASC, `locale` ASC) USING BTREE,
  CONSTRAINT `cart_rule_translations_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_rule_translations
-- ----------------------------

-- ----------------------------
-- Table structure for cart_rules
-- ----------------------------
DROP TABLE IF EXISTS `cart_rules`;
CREATE TABLE `cart_rules`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `starts_from` datetime NULL DEFAULT NULL,
  `ends_till` datetime NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `coupon_type` int NOT NULL DEFAULT 1,
  `use_auto_generation` tinyint(1) NOT NULL DEFAULT 0,
  `usage_per_customer` int NOT NULL DEFAULT 0,
  `uses_per_coupon` int NOT NULL DEFAULT 0,
  `times_used` int UNSIGNED NOT NULL DEFAULT 0,
  `condition_type` tinyint(1) NOT NULL DEFAULT 1,
  `conditions` json NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT 0,
  `uses_attribute_conditions` tinyint(1) NOT NULL DEFAULT 0,
  `action_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `discount_amount` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `discount_quantity` int NOT NULL DEFAULT 1,
  `discount_step` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `apply_to_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_rules
-- ----------------------------

-- ----------------------------
-- Table structure for cart_shipping_rates
-- ----------------------------
DROP TABLE IF EXISTS `cart_shipping_rates`;
CREATE TABLE `cart_shipping_rates`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `carrier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT 0,
  `base_price` double NULL DEFAULT 0,
  `discount_amount` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_discount_amount` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `tax_percent` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `tax_amount` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_tax_amount` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `price_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `applied_tax_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_calculate_tax` tinyint(1) NOT NULL DEFAULT 1,
  `cart_address_id` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_id` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cart_shipping_rates_cart_id_foreign`(`cart_id` ASC) USING BTREE,
  CONSTRAINT `cart_shipping_rates_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_shipping_rates
-- ----------------------------

-- ----------------------------
-- Table structure for catalog_rule_channels
-- ----------------------------
DROP TABLE IF EXISTS `catalog_rule_channels`;
CREATE TABLE `catalog_rule_channels`  (
  `catalog_rule_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`catalog_rule_id`, `channel_id`) USING BTREE,
  INDEX `catalog_rule_channels_channel_id_foreign`(`channel_id` ASC) USING BTREE,
  CONSTRAINT `catalog_rule_channels_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `catalog_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of catalog_rule_channels
-- ----------------------------

-- ----------------------------
-- Table structure for catalog_rule_customer_groups
-- ----------------------------
DROP TABLE IF EXISTS `catalog_rule_customer_groups`;
CREATE TABLE `catalog_rule_customer_groups`  (
  `catalog_rule_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`catalog_rule_id`, `customer_group_id`) USING BTREE,
  INDEX `catalog_rule_customer_groups_customer_group_id_foreign`(`customer_group_id` ASC) USING BTREE,
  CONSTRAINT `catalog_rule_customer_groups_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `catalog_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of catalog_rule_customer_groups
-- ----------------------------

-- ----------------------------
-- Table structure for catalog_rule_product_prices
-- ----------------------------
DROP TABLE IF EXISTS `catalog_rule_product_prices`;
CREATE TABLE `catalog_rule_product_prices`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `price` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `rule_date` date NOT NULL,
  `starts_from` datetime NULL DEFAULT NULL,
  `ends_till` datetime NULL DEFAULT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED NOT NULL,
  `catalog_rule_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `catalog_rule_product_prices_product_id_foreign`(`product_id` ASC) USING BTREE,
  INDEX `catalog_rule_product_prices_customer_group_id_foreign`(`customer_group_id` ASC) USING BTREE,
  INDEX `catalog_rule_product_prices_catalog_rule_id_foreign`(`catalog_rule_id` ASC) USING BTREE,
  INDEX `catalog_rule_product_prices_channel_id_foreign`(`channel_id` ASC) USING BTREE,
  CONSTRAINT `catalog_rule_product_prices_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `catalog_rule_product_prices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `catalog_rule_product_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `catalog_rule_product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of catalog_rule_product_prices
-- ----------------------------

-- ----------------------------
-- Table structure for catalog_rule_products
-- ----------------------------
DROP TABLE IF EXISTS `catalog_rule_products`;
CREATE TABLE `catalog_rule_products`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `starts_from` datetime NULL DEFAULT NULL,
  `ends_till` datetime NULL DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT 0,
  `action_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `discount_amount` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `sort_order` int UNSIGNED NOT NULL DEFAULT 0,
  `product_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED NOT NULL,
  `catalog_rule_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `catalog_rule_products_product_id_foreign`(`product_id` ASC) USING BTREE,
  INDEX `catalog_rule_products_customer_group_id_foreign`(`customer_group_id` ASC) USING BTREE,
  INDEX `catalog_rule_products_catalog_rule_id_foreign`(`catalog_rule_id` ASC) USING BTREE,
  INDEX `catalog_rule_products_channel_id_foreign`(`channel_id` ASC) USING BTREE,
  CONSTRAINT `catalog_rule_products_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `catalog_rule_products_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `catalog_rule_products_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `catalog_rule_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of catalog_rule_products
-- ----------------------------

-- ----------------------------
-- Table structure for catalog_rules
-- ----------------------------
DROP TABLE IF EXISTS `catalog_rules`;
CREATE TABLE `catalog_rules`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `starts_from` date NULL DEFAULT NULL,
  `ends_till` date NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `condition_type` tinyint(1) NOT NULL DEFAULT 1,
  `conditions` json NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT 0,
  `action_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `discount_amount` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `sort_order` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of catalog_rules
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `position` int NOT NULL DEFAULT 0,
  `logo_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `display_mode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'products_and_description',
  `_lft` int UNSIGNED NOT NULL DEFAULT 0,
  `_rgt` int UNSIGNED NOT NULL DEFAULT 0,
  `parent_id` int UNSIGNED NULL DEFAULT NULL,
  `additional` json NULL,
  `banner_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `categories__lft__rgt_parent_id_index`(`_lft` ASC, `_rgt` ASC, `parent_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 1, NULL, 1, 'products_and_description', 1, 6, NULL, NULL, NULL, '2025-04-13 19:52:26', '2025-04-13 19:52:26');

-- ----------------------------
-- Table structure for category_filterable_attributes
-- ----------------------------
DROP TABLE IF EXISTS `category_filterable_attributes`;
CREATE TABLE `category_filterable_attributes`  (
  `category_id` int UNSIGNED NOT NULL,
  `attribute_id` int UNSIGNED NOT NULL,
  INDEX `category_filterable_attributes_category_id_foreign`(`category_id` ASC) USING BTREE,
  INDEX `category_filterable_attributes_attribute_id_foreign`(`attribute_id` ASC) USING BTREE,
  CONSTRAINT `category_filterable_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `category_filterable_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category_filterable_attributes
-- ----------------------------

-- ----------------------------
-- Table structure for category_translations
-- ----------------------------
DROP TABLE IF EXISTS `category_translations`;
CREATE TABLE `category_translations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int UNSIGNED NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_path` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `meta_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `locale_id` int UNSIGNED NULL DEFAULT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `category_translations_category_id_slug_locale_unique`(`category_id` ASC, `slug` ASC, `locale` ASC) USING BTREE,
  INDEX `category_translations_locale_id_foreign`(`locale_id` ASC) USING BTREE,
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `category_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category_translations
-- ----------------------------
INSERT INTO `category_translations` VALUES (1, 1, 'Root', 'root', '', 'Root Category Description', '', '', '', NULL, 'en');

-- ----------------------------
-- Table structure for channel_currencies
-- ----------------------------
DROP TABLE IF EXISTS `channel_currencies`;
CREATE TABLE `channel_currencies`  (
  `channel_id` int UNSIGNED NOT NULL,
  `currency_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`channel_id`, `currency_id`) USING BTREE,
  INDEX `channel_currencies_currency_id_foreign`(`currency_id` ASC) USING BTREE,
  CONSTRAINT `channel_currencies_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `channel_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of channel_currencies
-- ----------------------------
INSERT INTO `channel_currencies` VALUES (1, 1);

-- ----------------------------
-- Table structure for channel_inventory_sources
-- ----------------------------
DROP TABLE IF EXISTS `channel_inventory_sources`;
CREATE TABLE `channel_inventory_sources`  (
  `channel_id` int UNSIGNED NOT NULL,
  `inventory_source_id` int UNSIGNED NOT NULL,
  UNIQUE INDEX `channel_inventory_source_unique`(`channel_id` ASC, `inventory_source_id` ASC) USING BTREE,
  INDEX `channel_inventory_sources_inventory_source_id_foreign`(`inventory_source_id` ASC) USING BTREE,
  CONSTRAINT `channel_inventory_sources_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `channel_inventory_sources_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of channel_inventory_sources
-- ----------------------------
INSERT INTO `channel_inventory_sources` VALUES (1, 1);

-- ----------------------------
-- Table structure for channel_locales
-- ----------------------------
DROP TABLE IF EXISTS `channel_locales`;
CREATE TABLE `channel_locales`  (
  `channel_id` int UNSIGNED NOT NULL,
  `locale_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`channel_id`, `locale_id`) USING BTREE,
  INDEX `channel_locales_locale_id_foreign`(`locale_id` ASC) USING BTREE,
  CONSTRAINT `channel_locales_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `channel_locales_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of channel_locales
-- ----------------------------
INSERT INTO `channel_locales` VALUES (1, 1);

-- ----------------------------
-- Table structure for channel_translations
-- ----------------------------
DROP TABLE IF EXISTS `channel_translations`;
CREATE TABLE `channel_translations`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `channel_id` int UNSIGNED NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `maintenance_mode_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `home_seo` json NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `channel_translations_channel_id_locale_unique`(`channel_id` ASC, `locale` ASC) USING BTREE,
  INDEX `channel_translations_locale_index`(`locale` ASC) USING BTREE,
  CONSTRAINT `channel_translations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of channel_translations
-- ----------------------------
INSERT INTO `channel_translations` VALUES (1, 1, 'en', 'Default', NULL, '', '{\"meta_title\": \"Green Revolution\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}', NULL, '2025-04-15 20:04:35');

-- ----------------------------
-- Table structure for channels
-- ----------------------------
DROP TABLE IF EXISTS `channels`;
CREATE TABLE `channels`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `theme` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `home_seo` json NULL,
  `is_maintenance_on` tinyint(1) NOT NULL DEFAULT 0,
  `allowed_ips` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `root_category_id` int UNSIGNED NULL DEFAULT NULL,
  `default_locale_id` int UNSIGNED NOT NULL,
  `base_currency_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `channels_root_category_id_foreign`(`root_category_id` ASC) USING BTREE,
  INDEX `channels_default_locale_id_foreign`(`default_locale_id` ASC) USING BTREE,
  INDEX `channels_base_currency_id_foreign`(`base_currency_id` ASC) USING BTREE,
  CONSTRAINT `channels_base_currency_id_foreign` FOREIGN KEY (`base_currency_id`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `channels_default_locale_id_foreign` FOREIGN KEY (`default_locale_id`) REFERENCES `locales` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `channels_root_category_id_foreign` FOREIGN KEY (`root_category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of channels
-- ----------------------------
INSERT INTO `channels` VALUES (1, 'default', NULL, 'default', 'http://localhost:8000', 'channel/1/lmyXygYhJHqOxyDznHLZso3S7rjrwULJxrioq2mX.png', 'channel/1/vxLVS4TuSijiTSQUxTYuLH6licqiHxzMaugRhNaf.webp', NULL, 0, '', 1, 1, 1, '2025-04-13 19:52:26', '2025-04-15 20:04:35');

-- ----------------------------
-- Table structure for cms_page_channels
-- ----------------------------
DROP TABLE IF EXISTS `cms_page_channels`;
CREATE TABLE `cms_page_channels`  (
  `cms_page_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  UNIQUE INDEX `cms_page_channels_cms_page_id_channel_id_unique`(`cms_page_id` ASC, `channel_id` ASC) USING BTREE,
  INDEX `cms_page_channels_channel_id_foreign`(`channel_id` ASC) USING BTREE,
  CONSTRAINT `cms_page_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cms_page_channels_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_page_channels
-- ----------------------------

-- ----------------------------
-- Table structure for cms_page_translations
-- ----------------------------
DROP TABLE IF EXISTS `cms_page_translations`;
CREATE TABLE `cms_page_translations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `meta_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cms_page_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cms_page_translations_cms_page_id_url_key_locale_unique`(`cms_page_id` ASC, `url_key` ASC, `locale` ASC) USING BTREE,
  CONSTRAINT `cms_page_translations_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_page_translations
-- ----------------------------
INSERT INTO `cms_page_translations` VALUES (1, 'About Us', 'about-us', '<div class=\"static-container\"><div class=\"mb-5\">About Us Page Content</div></div>', 'about us', '', 'aboutus', 'en', 1);
INSERT INTO `cms_page_translations` VALUES (2, 'Return Policy', 'return-policy', '<div class=\"static-container\"><div class=\"mb-5\">Return Policy Page Content</div></div>', 'return policy', '', 'return, policy', 'en', 2);
INSERT INTO `cms_page_translations` VALUES (3, 'Refund Policy', 'refund-policy', '<div class=\"static-container\"><div class=\"mb-5\">Refund Policy Page Content</div></div>', 'Refund policy', '', 'refund, policy', 'en', 3);
INSERT INTO `cms_page_translations` VALUES (4, 'Terms & Conditions', 'terms-conditions', '<div class=\"static-container\"><div class=\"mb-5\">Terms & Conditions Page Content</div></div>', 'Terms & Conditions', '', 'term, conditions', 'en', 4);
INSERT INTO `cms_page_translations` VALUES (5, 'Terms of Use', 'terms-of-use', '<div class=\"static-container\"><div class=\"mb-5\">Terms of Use Page Content</div></div>', 'Terms of use', '', 'term, use', 'en', 5);
INSERT INTO `cms_page_translations` VALUES (6, 'Customer Service', 'customer-service', '<div class=\"static-container\"><div class=\"mb-5\">Customer Service Page Content</div></div>', 'Customer Service', '', 'customer, service', 'en', 6);
INSERT INTO `cms_page_translations` VALUES (7, 'What\'s New', 'whats-new', '<div class=\"static-container\"><div class=\"mb-5\">What\'s New page content</div></div>', 'What\'s New', '', 'new', 'en', 7);
INSERT INTO `cms_page_translations` VALUES (8, 'Payment Policy', 'payment-policy', '<div class=\"static-container\"><div class=\"mb-5\">Payment Policy Page Content</div></div>', 'Payment Policy', '', 'payment, policy', 'en', 8);
INSERT INTO `cms_page_translations` VALUES (9, 'Shipping Policy', 'shipping-policy', '<div class=\"static-container\"><div class=\"mb-5\">Shipping Policy Page Content</div></div>', 'Shipping Policy', '', 'shipping, policy', 'en', 9);
INSERT INTO `cms_page_translations` VALUES (10, 'Privacy Policy', 'privacy-policy', '<div class=\"static-container\"><div class=\"mb-5\">Privacy Policy Page Content</div></div>', 'Privacy Policy', '', 'privacy, policy', 'en', 10);

-- ----------------------------
-- Table structure for cms_pages
-- ----------------------------
DROP TABLE IF EXISTS `cms_pages`;
CREATE TABLE `cms_pages`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_pages
-- ----------------------------
INSERT INTO `cms_pages` VALUES (1, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `cms_pages` VALUES (2, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `cms_pages` VALUES (3, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `cms_pages` VALUES (4, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `cms_pages` VALUES (5, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `cms_pages` VALUES (6, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `cms_pages` VALUES (7, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `cms_pages` VALUES (8, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `cms_pages` VALUES (9, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `cms_pages` VALUES (10, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');

-- ----------------------------
-- Table structure for compare_items
-- ----------------------------
DROP TABLE IF EXISTS `compare_items`;
CREATE TABLE `compare_items`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `compare_items_product_id_foreign`(`product_id` ASC) USING BTREE,
  INDEX `compare_items_customer_id_foreign`(`customer_id` ASC) USING BTREE,
  CONSTRAINT `compare_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `compare_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of compare_items
-- ----------------------------

-- ----------------------------
-- Table structure for core_config
-- ----------------------------
DROP TABLE IF EXISTS `core_config`;
CREATE TABLE `core_config`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `locale_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of core_config
-- ----------------------------
INSERT INTO `core_config` VALUES (1, 'sales.checkout.shopping_cart.allow_guest_checkout', '1', NULL, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `core_config` VALUES (2, 'emails.general.notifications.emails.general.notifications.verification', '1', NULL, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `core_config` VALUES (3, 'emails.general.notifications.emails.general.notifications.registration', '1', NULL, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `core_config` VALUES (4, 'emails.general.notifications.emails.general.notifications.customer_registration_confirmation_mail_to_admin', '0', NULL, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `core_config` VALUES (5, 'emails.general.notifications.emails.general.notifications.customer_account_credentials', '1', NULL, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `core_config` VALUES (6, 'emails.general.notifications.emails.general.notifications.new_order', '1', NULL, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `core_config` VALUES (7, 'emails.general.notifications.emails.general.notifications.new_order_mail_to_admin', '1', NULL, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `core_config` VALUES (8, 'emails.general.notifications.emails.general.notifications.new_invoice', '1', NULL, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `core_config` VALUES (9, 'emails.general.notifications.emails.general.notifications.new_invoice_mail_to_admin', '0', NULL, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `core_config` VALUES (10, 'emails.general.notifications.emails.general.notifications.new_refund', '1', NULL, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `core_config` VALUES (11, 'emails.general.notifications.emails.general.notifications.new_refund_mail_to_admin', '0', NULL, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `core_config` VALUES (12, 'emails.general.notifications.emails.general.notifications.new_shipment', '1', NULL, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `core_config` VALUES (13, 'emails.general.notifications.emails.general.notifications.new_shipment_mail_to_admin', '0', NULL, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `core_config` VALUES (14, 'emails.general.notifications.emails.general.notifications.new_inventory_source', '1', NULL, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `core_config` VALUES (15, 'emails.general.notifications.emails.general.notifications.cancel_order', '1', NULL, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `core_config` VALUES (16, 'emails.general.notifications.emails.general.notifications.cancel_order_mail_to_admin', '0', NULL, NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `core_config` VALUES (17, 'customer.settings.social_login.enable_facebook', '1', 'default', NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `core_config` VALUES (18, 'customer.settings.social_login.enable_twitter', '1', 'default', NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `core_config` VALUES (19, 'customer.settings.social_login.enable_google', '1', 'default', NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `core_config` VALUES (20, 'customer.settings.social_login.enable_linkedin', '1', 'default', NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `core_config` VALUES (21, 'customer.settings.social_login.enable_github', '1', 'default', NULL, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `core_config` VALUES (22, 'general.design.admin_logo.logo_image', 'configuration/pjQ7ZZM95buD3dqzvh0SazqSsiYTAOjBauFNEVyC.webp', NULL, NULL, '2025-04-13 19:53:54', '2025-04-14 18:55:56');
INSERT INTO `core_config` VALUES (23, 'general.design.admin_logo.favicon', 'configuration/3IcCZiF3jnDsqK1qibbs801hR3oVVivQpOGKw0o3.webp', NULL, NULL, '2025-04-13 19:53:54', '2025-04-14 18:35:13');
INSERT INTO `core_config` VALUES (24, 'general.content.header_offer.title', '', NULL, NULL, '2025-04-15 21:00:27', '2025-04-15 21:00:27');
INSERT INTO `core_config` VALUES (25, 'general.content.header_offer.redirection_title', '', NULL, NULL, '2025-04-15 21:00:27', '2025-04-15 21:00:27');
INSERT INTO `core_config` VALUES (26, 'general.content.header_offer.redirection_link', '', NULL, NULL, '2025-04-15 21:00:27', '2025-04-15 21:00:27');
INSERT INTO `core_config` VALUES (27, 'general.content.custom_scripts.custom_css', '', 'default', NULL, '2025-04-15 21:00:28', '2025-04-15 21:01:21');
INSERT INTO `core_config` VALUES (28, 'general.content.custom_scripts.custom_javascript', '', 'default', NULL, '2025-04-15 21:00:28', '2025-04-15 21:00:28');

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 256 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of countries
-- ----------------------------
INSERT INTO `countries` VALUES (1, 'AF', 'Afghanistan');
INSERT INTO `countries` VALUES (2, 'AX', 'Åland Islands');
INSERT INTO `countries` VALUES (3, 'AL', 'Albania');
INSERT INTO `countries` VALUES (4, 'DZ', 'Algeria');
INSERT INTO `countries` VALUES (5, 'AS', 'American Samoa');
INSERT INTO `countries` VALUES (6, 'AD', 'Andorra');
INSERT INTO `countries` VALUES (7, 'AO', 'Angola');
INSERT INTO `countries` VALUES (8, 'AI', 'Anguilla');
INSERT INTO `countries` VALUES (9, 'AQ', 'Antarctica');
INSERT INTO `countries` VALUES (10, 'AG', 'Antigua & Barbuda');
INSERT INTO `countries` VALUES (11, 'AR', 'Argentina');
INSERT INTO `countries` VALUES (12, 'AM', 'Armenia');
INSERT INTO `countries` VALUES (13, 'AW', 'Aruba');
INSERT INTO `countries` VALUES (14, 'AC', 'Ascension Island');
INSERT INTO `countries` VALUES (15, 'AU', 'Australia');
INSERT INTO `countries` VALUES (16, 'AT', 'Austria');
INSERT INTO `countries` VALUES (17, 'AZ', 'Azerbaijan');
INSERT INTO `countries` VALUES (18, 'BS', 'Bahamas');
INSERT INTO `countries` VALUES (19, 'BH', 'Bahrain');
INSERT INTO `countries` VALUES (20, 'BD', 'Bangladesh');
INSERT INTO `countries` VALUES (21, 'BB', 'Barbados');
INSERT INTO `countries` VALUES (22, 'BY', 'Belarus');
INSERT INTO `countries` VALUES (23, 'BE', 'Belgium');
INSERT INTO `countries` VALUES (24, 'BZ', 'Belize');
INSERT INTO `countries` VALUES (25, 'BJ', 'Benin');
INSERT INTO `countries` VALUES (26, 'BM', 'Bermuda');
INSERT INTO `countries` VALUES (27, 'BT', 'Bhutan');
INSERT INTO `countries` VALUES (28, 'BO', 'Bolivia');
INSERT INTO `countries` VALUES (29, 'BA', 'Bosnia & Herzegovina');
INSERT INTO `countries` VALUES (30, 'BW', 'Botswana');
INSERT INTO `countries` VALUES (31, 'BR', 'Brazil');
INSERT INTO `countries` VALUES (32, 'IO', 'British Indian Ocean Territory');
INSERT INTO `countries` VALUES (33, 'VG', 'British Virgin Islands');
INSERT INTO `countries` VALUES (34, 'BN', 'Brunei');
INSERT INTO `countries` VALUES (35, 'BG', 'Bulgaria');
INSERT INTO `countries` VALUES (36, 'BF', 'Burkina Faso');
INSERT INTO `countries` VALUES (37, 'BI', 'Burundi');
INSERT INTO `countries` VALUES (38, 'KH', 'Cambodia');
INSERT INTO `countries` VALUES (39, 'CM', 'Cameroon');
INSERT INTO `countries` VALUES (40, 'CA', 'Canada');
INSERT INTO `countries` VALUES (41, 'IC', 'Canary Islands');
INSERT INTO `countries` VALUES (42, 'CV', 'Cape Verde');
INSERT INTO `countries` VALUES (43, 'BQ', 'Caribbean Netherlands');
INSERT INTO `countries` VALUES (44, 'KY', 'Cayman Islands');
INSERT INTO `countries` VALUES (45, 'CF', 'Central African Republic');
INSERT INTO `countries` VALUES (46, 'EA', 'Ceuta & Melilla');
INSERT INTO `countries` VALUES (47, 'TD', 'Chad');
INSERT INTO `countries` VALUES (48, 'CL', 'Chile');
INSERT INTO `countries` VALUES (49, 'CN', 'China');
INSERT INTO `countries` VALUES (50, 'CX', 'Christmas Island');
INSERT INTO `countries` VALUES (51, 'CC', 'Cocos (Keeling) Islands');
INSERT INTO `countries` VALUES (52, 'CO', 'Colombia');
INSERT INTO `countries` VALUES (53, 'KM', 'Comoros');
INSERT INTO `countries` VALUES (54, 'CG', 'Congo - Brazzaville');
INSERT INTO `countries` VALUES (55, 'CD', 'Congo - Kinshasa');
INSERT INTO `countries` VALUES (56, 'CK', 'Cook Islands');
INSERT INTO `countries` VALUES (57, 'CR', 'Costa Rica');
INSERT INTO `countries` VALUES (58, 'CI', 'Côte d’Ivoire');
INSERT INTO `countries` VALUES (59, 'HR', 'Croatia');
INSERT INTO `countries` VALUES (60, 'CU', 'Cuba');
INSERT INTO `countries` VALUES (61, 'CW', 'Curaçao');
INSERT INTO `countries` VALUES (62, 'CY', 'Cyprus');
INSERT INTO `countries` VALUES (63, 'CZ', 'Czechia');
INSERT INTO `countries` VALUES (64, 'DK', 'Denmark');
INSERT INTO `countries` VALUES (65, 'DG', 'Diego Garcia');
INSERT INTO `countries` VALUES (66, 'DJ', 'Djibouti');
INSERT INTO `countries` VALUES (67, 'DM', 'Dominica');
INSERT INTO `countries` VALUES (68, 'DO', 'Dominican Republic');
INSERT INTO `countries` VALUES (69, 'EC', 'Ecuador');
INSERT INTO `countries` VALUES (70, 'EG', 'Egypt');
INSERT INTO `countries` VALUES (71, 'SV', 'El Salvador');
INSERT INTO `countries` VALUES (72, 'GQ', 'Equatorial Guinea');
INSERT INTO `countries` VALUES (73, 'ER', 'Eritrea');
INSERT INTO `countries` VALUES (74, 'EE', 'Estonia');
INSERT INTO `countries` VALUES (75, 'ET', 'Ethiopia');
INSERT INTO `countries` VALUES (76, 'EZ', 'Eurozone');
INSERT INTO `countries` VALUES (77, 'FK', 'Falkland Islands');
INSERT INTO `countries` VALUES (78, 'FO', 'Faroe Islands');
INSERT INTO `countries` VALUES (79, 'FJ', 'Fiji');
INSERT INTO `countries` VALUES (80, 'FI', 'Finland');
INSERT INTO `countries` VALUES (81, 'FR', 'France');
INSERT INTO `countries` VALUES (82, 'GF', 'French Guiana');
INSERT INTO `countries` VALUES (83, 'PF', 'French Polynesia');
INSERT INTO `countries` VALUES (84, 'TF', 'French Southern Territories');
INSERT INTO `countries` VALUES (85, 'GA', 'Gabon');
INSERT INTO `countries` VALUES (86, 'GM', 'Gambia');
INSERT INTO `countries` VALUES (87, 'GE', 'Georgia');
INSERT INTO `countries` VALUES (88, 'DE', 'Germany');
INSERT INTO `countries` VALUES (89, 'GH', 'Ghana');
INSERT INTO `countries` VALUES (90, 'GI', 'Gibraltar');
INSERT INTO `countries` VALUES (91, 'GR', 'Greece');
INSERT INTO `countries` VALUES (92, 'GL', 'Greenland');
INSERT INTO `countries` VALUES (93, 'GD', 'Grenada');
INSERT INTO `countries` VALUES (94, 'GP', 'Guadeloupe');
INSERT INTO `countries` VALUES (95, 'GU', 'Guam');
INSERT INTO `countries` VALUES (96, 'GT', 'Guatemala');
INSERT INTO `countries` VALUES (97, 'GG', 'Guernsey');
INSERT INTO `countries` VALUES (98, 'GN', 'Guinea');
INSERT INTO `countries` VALUES (99, 'GW', 'Guinea-Bissau');
INSERT INTO `countries` VALUES (100, 'GY', 'Guyana');
INSERT INTO `countries` VALUES (101, 'HT', 'Haiti');
INSERT INTO `countries` VALUES (102, 'HN', 'Honduras');
INSERT INTO `countries` VALUES (103, 'HK', 'Hong Kong SAR China');
INSERT INTO `countries` VALUES (104, 'HU', 'Hungary');
INSERT INTO `countries` VALUES (105, 'IS', 'Iceland');
INSERT INTO `countries` VALUES (106, 'IN', 'India');
INSERT INTO `countries` VALUES (107, 'ID', 'Indonesia');
INSERT INTO `countries` VALUES (108, 'IR', 'Iran');
INSERT INTO `countries` VALUES (109, 'IQ', 'Iraq');
INSERT INTO `countries` VALUES (110, 'IE', 'Ireland');
INSERT INTO `countries` VALUES (111, 'IM', 'Isle of Man');
INSERT INTO `countries` VALUES (112, 'IL', 'Israel');
INSERT INTO `countries` VALUES (113, 'IT', 'Italy');
INSERT INTO `countries` VALUES (114, 'JM', 'Jamaica');
INSERT INTO `countries` VALUES (115, 'JP', 'Japan');
INSERT INTO `countries` VALUES (116, 'JE', 'Jersey');
INSERT INTO `countries` VALUES (117, 'JO', 'Jordan');
INSERT INTO `countries` VALUES (118, 'KZ', 'Kazakhstan');
INSERT INTO `countries` VALUES (119, 'KE', 'Kenya');
INSERT INTO `countries` VALUES (120, 'KI', 'Kiribati');
INSERT INTO `countries` VALUES (121, 'XK', 'Kosovo');
INSERT INTO `countries` VALUES (122, 'KW', 'Kuwait');
INSERT INTO `countries` VALUES (123, 'KG', 'Kyrgyzstan');
INSERT INTO `countries` VALUES (124, 'LA', 'Laos');
INSERT INTO `countries` VALUES (125, 'LV', 'Latvia');
INSERT INTO `countries` VALUES (126, 'LB', 'Lebanon');
INSERT INTO `countries` VALUES (127, 'LS', 'Lesotho');
INSERT INTO `countries` VALUES (128, 'LR', 'Liberia');
INSERT INTO `countries` VALUES (129, 'LY', 'Libya');
INSERT INTO `countries` VALUES (130, 'LI', 'Liechtenstein');
INSERT INTO `countries` VALUES (131, 'LT', 'Lithuania');
INSERT INTO `countries` VALUES (132, 'LU', 'Luxembourg');
INSERT INTO `countries` VALUES (133, 'MO', 'Macau SAR China');
INSERT INTO `countries` VALUES (134, 'MK', 'Macedonia');
INSERT INTO `countries` VALUES (135, 'MG', 'Madagascar');
INSERT INTO `countries` VALUES (136, 'MW', 'Malawi');
INSERT INTO `countries` VALUES (137, 'MY', 'Malaysia');
INSERT INTO `countries` VALUES (138, 'MV', 'Maldives');
INSERT INTO `countries` VALUES (139, 'ML', 'Mali');
INSERT INTO `countries` VALUES (140, 'MT', 'Malta');
INSERT INTO `countries` VALUES (141, 'MH', 'Marshall Islands');
INSERT INTO `countries` VALUES (142, 'MQ', 'Martinique');
INSERT INTO `countries` VALUES (143, 'MR', 'Mauritania');
INSERT INTO `countries` VALUES (144, 'MU', 'Mauritius');
INSERT INTO `countries` VALUES (145, 'YT', 'Mayotte');
INSERT INTO `countries` VALUES (146, 'MX', 'Mexico');
INSERT INTO `countries` VALUES (147, 'FM', 'Micronesia');
INSERT INTO `countries` VALUES (148, 'MD', 'Moldova');
INSERT INTO `countries` VALUES (149, 'MC', 'Monaco');
INSERT INTO `countries` VALUES (150, 'MN', 'Mongolia');
INSERT INTO `countries` VALUES (151, 'ME', 'Montenegro');
INSERT INTO `countries` VALUES (152, 'MS', 'Montserrat');
INSERT INTO `countries` VALUES (153, 'MA', 'Morocco');
INSERT INTO `countries` VALUES (154, 'MZ', 'Mozambique');
INSERT INTO `countries` VALUES (155, 'MM', 'Myanmar (Burma)');
INSERT INTO `countries` VALUES (156, 'NA', 'Namibia');
INSERT INTO `countries` VALUES (157, 'NR', 'Nauru');
INSERT INTO `countries` VALUES (158, 'NP', 'Nepal');
INSERT INTO `countries` VALUES (159, 'NL', 'Netherlands');
INSERT INTO `countries` VALUES (160, 'NC', 'New Caledonia');
INSERT INTO `countries` VALUES (161, 'NZ', 'New Zealand');
INSERT INTO `countries` VALUES (162, 'NI', 'Nicaragua');
INSERT INTO `countries` VALUES (163, 'NE', 'Niger');
INSERT INTO `countries` VALUES (164, 'NG', 'Nigeria');
INSERT INTO `countries` VALUES (165, 'NU', 'Niue');
INSERT INTO `countries` VALUES (166, 'NF', 'Norfolk Island');
INSERT INTO `countries` VALUES (167, 'KP', 'North Korea');
INSERT INTO `countries` VALUES (168, 'MP', 'Northern Mariana Islands');
INSERT INTO `countries` VALUES (169, 'NO', 'Norway');
INSERT INTO `countries` VALUES (170, 'OM', 'Oman');
INSERT INTO `countries` VALUES (171, 'PK', 'Pakistan');
INSERT INTO `countries` VALUES (172, 'PW', 'Palau');
INSERT INTO `countries` VALUES (173, 'PS', 'Palestinian Territories');
INSERT INTO `countries` VALUES (174, 'PA', 'Panama');
INSERT INTO `countries` VALUES (175, 'PG', 'Papua New Guinea');
INSERT INTO `countries` VALUES (176, 'PY', 'Paraguay');
INSERT INTO `countries` VALUES (177, 'PE', 'Peru');
INSERT INTO `countries` VALUES (178, 'PH', 'Philippines');
INSERT INTO `countries` VALUES (179, 'PN', 'Pitcairn Islands');
INSERT INTO `countries` VALUES (180, 'PL', 'Poland');
INSERT INTO `countries` VALUES (181, 'PT', 'Portugal');
INSERT INTO `countries` VALUES (182, 'PR', 'Puerto Rico');
INSERT INTO `countries` VALUES (183, 'QA', 'Qatar');
INSERT INTO `countries` VALUES (184, 'RE', 'Réunion');
INSERT INTO `countries` VALUES (185, 'RO', 'Romania');
INSERT INTO `countries` VALUES (186, 'RU', 'Russia');
INSERT INTO `countries` VALUES (187, 'RW', 'Rwanda');
INSERT INTO `countries` VALUES (188, 'WS', 'Samoa');
INSERT INTO `countries` VALUES (189, 'SM', 'San Marino');
INSERT INTO `countries` VALUES (190, 'ST', 'São Tomé & Príncipe');
INSERT INTO `countries` VALUES (191, 'SA', 'Saudi Arabia');
INSERT INTO `countries` VALUES (192, 'SN', 'Senegal');
INSERT INTO `countries` VALUES (193, 'RS', 'Serbia');
INSERT INTO `countries` VALUES (194, 'SC', 'Seychelles');
INSERT INTO `countries` VALUES (195, 'SL', 'Sierra Leone');
INSERT INTO `countries` VALUES (196, 'SG', 'Singapore');
INSERT INTO `countries` VALUES (197, 'SX', 'Sint Maarten');
INSERT INTO `countries` VALUES (198, 'SK', 'Slovakia');
INSERT INTO `countries` VALUES (199, 'SI', 'Slovenia');
INSERT INTO `countries` VALUES (200, 'SB', 'Solomon Islands');
INSERT INTO `countries` VALUES (201, 'SO', 'Somalia');
INSERT INTO `countries` VALUES (202, 'ZA', 'South Africa');
INSERT INTO `countries` VALUES (203, 'GS', 'South Georgia & South Sandwich Islands');
INSERT INTO `countries` VALUES (204, 'KR', 'South Korea');
INSERT INTO `countries` VALUES (205, 'SS', 'South Sudan');
INSERT INTO `countries` VALUES (206, 'ES', 'Spain');
INSERT INTO `countries` VALUES (207, 'LK', 'Sri Lanka');
INSERT INTO `countries` VALUES (208, 'BL', 'St. Barthélemy');
INSERT INTO `countries` VALUES (209, 'SH', 'St. Helena');
INSERT INTO `countries` VALUES (210, 'KN', 'St. Kitts & Nevis');
INSERT INTO `countries` VALUES (211, 'LC', 'St. Lucia');
INSERT INTO `countries` VALUES (212, 'MF', 'St. Martin');
INSERT INTO `countries` VALUES (213, 'PM', 'St. Pierre & Miquelon');
INSERT INTO `countries` VALUES (214, 'VC', 'St. Vincent & Grenadines');
INSERT INTO `countries` VALUES (215, 'SD', 'Sudan');
INSERT INTO `countries` VALUES (216, 'SR', 'Suriname');
INSERT INTO `countries` VALUES (217, 'SJ', 'Svalbard & Jan Mayen');
INSERT INTO `countries` VALUES (218, 'SZ', 'Swaziland');
INSERT INTO `countries` VALUES (219, 'SE', 'Sweden');
INSERT INTO `countries` VALUES (220, 'CH', 'Switzerland');
INSERT INTO `countries` VALUES (221, 'SY', 'Syria');
INSERT INTO `countries` VALUES (222, 'TW', 'Taiwan');
INSERT INTO `countries` VALUES (223, 'TJ', 'Tajikistan');
INSERT INTO `countries` VALUES (224, 'TZ', 'Tanzania');
INSERT INTO `countries` VALUES (225, 'TH', 'Thailand');
INSERT INTO `countries` VALUES (226, 'TL', 'Timor-Leste');
INSERT INTO `countries` VALUES (227, 'TG', 'Togo');
INSERT INTO `countries` VALUES (228, 'TK', 'Tokelau');
INSERT INTO `countries` VALUES (229, 'TO', 'Tonga');
INSERT INTO `countries` VALUES (230, 'TT', 'Trinidad & Tobago');
INSERT INTO `countries` VALUES (231, 'TA', 'Tristan da Cunha');
INSERT INTO `countries` VALUES (232, 'TN', 'Tunisia');
INSERT INTO `countries` VALUES (233, 'TR', 'Turkey');
INSERT INTO `countries` VALUES (234, 'TM', 'Turkmenistan');
INSERT INTO `countries` VALUES (235, 'TC', 'Turks & Caicos Islands');
INSERT INTO `countries` VALUES (236, 'TV', 'Tuvalu');
INSERT INTO `countries` VALUES (237, 'UM', 'U.S. Outlying Islands');
INSERT INTO `countries` VALUES (238, 'VI', 'U.S. Virgin Islands');
INSERT INTO `countries` VALUES (239, 'UG', 'Uganda');
INSERT INTO `countries` VALUES (240, 'UA', 'Ukraine');
INSERT INTO `countries` VALUES (241, 'AE', 'United Arab Emirates');
INSERT INTO `countries` VALUES (242, 'GB', 'United Kingdom');
INSERT INTO `countries` VALUES (244, 'US', 'United States');
INSERT INTO `countries` VALUES (245, 'UY', 'Uruguay');
INSERT INTO `countries` VALUES (246, 'UZ', 'Uzbekistan');
INSERT INTO `countries` VALUES (247, 'VU', 'Vanuatu');
INSERT INTO `countries` VALUES (248, 'VA', 'Vatican City');
INSERT INTO `countries` VALUES (249, 'VE', 'Venezuela');
INSERT INTO `countries` VALUES (250, 'VN', 'Vietnam');
INSERT INTO `countries` VALUES (251, 'WF', 'Wallis & Futuna');
INSERT INTO `countries` VALUES (252, 'EH', 'Western Sahara');
INSERT INTO `countries` VALUES (253, 'YE', 'Yemen');
INSERT INTO `countries` VALUES (254, 'ZM', 'Zambia');
INSERT INTO `countries` VALUES (255, 'ZW', 'Zimbabwe');

-- ----------------------------
-- Table structure for country_state_translations
-- ----------------------------
DROP TABLE IF EXISTS `country_state_translations`;
CREATE TABLE `country_state_translations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `country_state_id` int UNSIGNED NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `country_state_translations_country_state_id_foreign`(`country_state_id` ASC) USING BTREE,
  CONSTRAINT `country_state_translations_country_state_id_foreign` FOREIGN KEY (`country_state_id`) REFERENCES `country_states` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of country_state_translations
-- ----------------------------

-- ----------------------------
-- Table structure for country_states
-- ----------------------------
DROP TABLE IF EXISTS `country_states`;
CREATE TABLE `country_states`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `country_id` int UNSIGNED NULL DEFAULT NULL,
  `country_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `default_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `country_states_country_id_foreign`(`country_id` ASC) USING BTREE,
  CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 587 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of country_states
-- ----------------------------
INSERT INTO `country_states` VALUES (1, 244, 'US', 'AL', 'Alabama');
INSERT INTO `country_states` VALUES (2, 244, 'US', 'AK', 'Alaska');
INSERT INTO `country_states` VALUES (3, 244, 'US', 'AS', 'American Samoa');
INSERT INTO `country_states` VALUES (4, 244, 'US', 'AZ', 'Arizona');
INSERT INTO `country_states` VALUES (5, 244, 'US', 'AR', 'Arkansas');
INSERT INTO `country_states` VALUES (6, 244, 'US', 'AE', 'Armed Forces Africa');
INSERT INTO `country_states` VALUES (7, 244, 'US', 'AA', 'Armed Forces Americas');
INSERT INTO `country_states` VALUES (8, 244, 'US', 'AE', 'Armed Forces Canada');
INSERT INTO `country_states` VALUES (9, 244, 'US', 'AE', 'Armed Forces Europe');
INSERT INTO `country_states` VALUES (10, 244, 'US', 'AE', 'Armed Forces Middle East');
INSERT INTO `country_states` VALUES (11, 244, 'US', 'AP', 'Armed Forces Pacific');
INSERT INTO `country_states` VALUES (12, 244, 'US', 'CA', 'California');
INSERT INTO `country_states` VALUES (13, 244, 'US', 'CO', 'Colorado');
INSERT INTO `country_states` VALUES (14, 244, 'US', 'CT', 'Connecticut');
INSERT INTO `country_states` VALUES (15, 244, 'US', 'DE', 'Delaware');
INSERT INTO `country_states` VALUES (16, 244, 'US', 'DC', 'District of Columbia');
INSERT INTO `country_states` VALUES (17, 244, 'US', 'FM', 'Federated States Of Micronesia');
INSERT INTO `country_states` VALUES (18, 244, 'US', 'FL', 'Florida');
INSERT INTO `country_states` VALUES (19, 244, 'US', 'GA', 'Georgia');
INSERT INTO `country_states` VALUES (20, 244, 'US', 'GU', 'Guam');
INSERT INTO `country_states` VALUES (21, 244, 'US', 'HI', 'Hawaii');
INSERT INTO `country_states` VALUES (22, 244, 'US', 'ID', 'Idaho');
INSERT INTO `country_states` VALUES (23, 244, 'US', 'IL', 'Illinois');
INSERT INTO `country_states` VALUES (24, 244, 'US', 'IN', 'Indiana');
INSERT INTO `country_states` VALUES (25, 244, 'US', 'IA', 'Iowa');
INSERT INTO `country_states` VALUES (26, 244, 'US', 'KS', 'Kansas');
INSERT INTO `country_states` VALUES (27, 244, 'US', 'KY', 'Kentucky');
INSERT INTO `country_states` VALUES (28, 244, 'US', 'LA', 'Louisiana');
INSERT INTO `country_states` VALUES (29, 244, 'US', 'ME', 'Maine');
INSERT INTO `country_states` VALUES (30, 244, 'US', 'MH', 'Marshall Islands');
INSERT INTO `country_states` VALUES (31, 244, 'US', 'MD', 'Maryland');
INSERT INTO `country_states` VALUES (32, 244, 'US', 'MA', 'Massachusetts');
INSERT INTO `country_states` VALUES (33, 244, 'US', 'MI', 'Michigan');
INSERT INTO `country_states` VALUES (34, 244, 'US', 'MN', 'Minnesota');
INSERT INTO `country_states` VALUES (35, 244, 'US', 'MS', 'Mississippi');
INSERT INTO `country_states` VALUES (36, 244, 'US', 'MO', 'Missouri');
INSERT INTO `country_states` VALUES (37, 244, 'US', 'MT', 'Montana');
INSERT INTO `country_states` VALUES (38, 244, 'US', 'NE', 'Nebraska');
INSERT INTO `country_states` VALUES (39, 244, 'US', 'NV', 'Nevada');
INSERT INTO `country_states` VALUES (40, 244, 'US', 'NH', 'New Hampshire');
INSERT INTO `country_states` VALUES (41, 244, 'US', 'NJ', 'New Jersey');
INSERT INTO `country_states` VALUES (42, 244, 'US', 'NM', 'New Mexico');
INSERT INTO `country_states` VALUES (43, 244, 'US', 'NY', 'New York');
INSERT INTO `country_states` VALUES (44, 244, 'US', 'NC', 'North Carolina');
INSERT INTO `country_states` VALUES (45, 244, 'US', 'ND', 'North Dakota');
INSERT INTO `country_states` VALUES (46, 244, 'US', 'MP', 'Northern Mariana Islands');
INSERT INTO `country_states` VALUES (47, 244, 'US', 'OH', 'Ohio');
INSERT INTO `country_states` VALUES (48, 244, 'US', 'OK', 'Oklahoma');
INSERT INTO `country_states` VALUES (49, 244, 'US', 'OR', 'Oregon');
INSERT INTO `country_states` VALUES (50, 244, 'US', 'PW', 'Palau');
INSERT INTO `country_states` VALUES (51, 244, 'US', 'PA', 'Pennsylvania');
INSERT INTO `country_states` VALUES (52, 244, 'US', 'PR', 'Puerto Rico');
INSERT INTO `country_states` VALUES (53, 244, 'US', 'RI', 'Rhode Island');
INSERT INTO `country_states` VALUES (54, 244, 'US', 'SC', 'South Carolina');
INSERT INTO `country_states` VALUES (55, 244, 'US', 'SD', 'South Dakota');
INSERT INTO `country_states` VALUES (56, 244, 'US', 'TN', 'Tennessee');
INSERT INTO `country_states` VALUES (57, 244, 'US', 'TX', 'Texas');
INSERT INTO `country_states` VALUES (58, 244, 'US', 'UT', 'Utah');
INSERT INTO `country_states` VALUES (59, 244, 'US', 'VT', 'Vermont');
INSERT INTO `country_states` VALUES (60, 244, 'US', 'VI', 'Virgin Islands');
INSERT INTO `country_states` VALUES (61, 244, 'US', 'VA', 'Virginia');
INSERT INTO `country_states` VALUES (62, 244, 'US', 'WA', 'Washington');
INSERT INTO `country_states` VALUES (63, 244, 'US', 'WV', 'West Virginia');
INSERT INTO `country_states` VALUES (64, 244, 'US', 'WI', 'Wisconsin');
INSERT INTO `country_states` VALUES (65, 244, 'US', 'WY', 'Wyoming');
INSERT INTO `country_states` VALUES (66, 40, 'CA', 'AB', 'Alberta');
INSERT INTO `country_states` VALUES (67, 40, 'CA', 'BC', 'British Columbia');
INSERT INTO `country_states` VALUES (68, 40, 'CA', 'MB', 'Manitoba');
INSERT INTO `country_states` VALUES (69, 40, 'CA', 'NL', 'Newfoundland and Labrador');
INSERT INTO `country_states` VALUES (70, 40, 'CA', 'NB', 'New Brunswick');
INSERT INTO `country_states` VALUES (71, 40, 'CA', 'NS', 'Nova Scotia');
INSERT INTO `country_states` VALUES (72, 40, 'CA', 'NT', 'Northwest Territories');
INSERT INTO `country_states` VALUES (73, 40, 'CA', 'NU', 'Nunavut');
INSERT INTO `country_states` VALUES (74, 40, 'CA', 'ON', 'Ontario');
INSERT INTO `country_states` VALUES (75, 40, 'CA', 'PE', 'Prince Edward Island');
INSERT INTO `country_states` VALUES (76, 40, 'CA', 'QC', 'Quebec');
INSERT INTO `country_states` VALUES (77, 40, 'CA', 'SK', 'Saskatchewan');
INSERT INTO `country_states` VALUES (78, 40, 'CA', 'YT', 'Yukon Territory');
INSERT INTO `country_states` VALUES (79, 88, 'DE', 'NDS', 'Niedersachsen');
INSERT INTO `country_states` VALUES (80, 88, 'DE', 'BAW', 'Baden-Württemberg');
INSERT INTO `country_states` VALUES (81, 88, 'DE', 'BAY', 'Bayern');
INSERT INTO `country_states` VALUES (82, 88, 'DE', 'BER', 'Berlin');
INSERT INTO `country_states` VALUES (83, 88, 'DE', 'BRG', 'Brandenburg');
INSERT INTO `country_states` VALUES (84, 88, 'DE', 'BRE', 'Bremen');
INSERT INTO `country_states` VALUES (85, 88, 'DE', 'HAM', 'Hamburg');
INSERT INTO `country_states` VALUES (86, 88, 'DE', 'HES', 'Hessen');
INSERT INTO `country_states` VALUES (87, 88, 'DE', 'MEC', 'Mecklenburg-Vorpommern');
INSERT INTO `country_states` VALUES (88, 88, 'DE', 'NRW', 'Nordrhein-Westfalen');
INSERT INTO `country_states` VALUES (89, 88, 'DE', 'RHE', 'Rheinland-Pfalz');
INSERT INTO `country_states` VALUES (90, 88, 'DE', 'SAR', 'Saarland');
INSERT INTO `country_states` VALUES (91, 88, 'DE', 'SAS', 'Sachsen');
INSERT INTO `country_states` VALUES (92, 88, 'DE', 'SAC', 'Sachsen-Anhalt');
INSERT INTO `country_states` VALUES (93, 88, 'DE', 'SCN', 'Schleswig-Holstein');
INSERT INTO `country_states` VALUES (94, 88, 'DE', 'THE', 'Thüringen');
INSERT INTO `country_states` VALUES (95, 16, 'AT', 'WI', 'Wien');
INSERT INTO `country_states` VALUES (96, 16, 'AT', 'NO', 'Niederösterreich');
INSERT INTO `country_states` VALUES (97, 16, 'AT', 'OO', 'Oberösterreich');
INSERT INTO `country_states` VALUES (98, 16, 'AT', 'SB', 'Salzburg');
INSERT INTO `country_states` VALUES (99, 16, 'AT', 'KN', 'Kärnten');
INSERT INTO `country_states` VALUES (100, 16, 'AT', 'ST', 'Steiermark');
INSERT INTO `country_states` VALUES (101, 16, 'AT', 'TI', 'Tirol');
INSERT INTO `country_states` VALUES (102, 16, 'AT', 'BL', 'Burgenland');
INSERT INTO `country_states` VALUES (103, 16, 'AT', 'VB', 'Vorarlberg');
INSERT INTO `country_states` VALUES (104, 220, 'CH', 'AG', 'Aargau');
INSERT INTO `country_states` VALUES (105, 220, 'CH', 'AI', 'Appenzell Innerrhoden');
INSERT INTO `country_states` VALUES (106, 220, 'CH', 'AR', 'Appenzell Ausserrhoden');
INSERT INTO `country_states` VALUES (107, 220, 'CH', 'BE', 'Bern');
INSERT INTO `country_states` VALUES (108, 220, 'CH', 'BL', 'Basel-Landschaft');
INSERT INTO `country_states` VALUES (109, 220, 'CH', 'BS', 'Basel-Stadt');
INSERT INTO `country_states` VALUES (110, 220, 'CH', 'FR', 'Freiburg');
INSERT INTO `country_states` VALUES (111, 220, 'CH', 'GE', 'Genf');
INSERT INTO `country_states` VALUES (112, 220, 'CH', 'GL', 'Glarus');
INSERT INTO `country_states` VALUES (113, 220, 'CH', 'GR', 'Graubünden');
INSERT INTO `country_states` VALUES (114, 220, 'CH', 'JU', 'Jura');
INSERT INTO `country_states` VALUES (115, 220, 'CH', 'LU', 'Luzern');
INSERT INTO `country_states` VALUES (116, 220, 'CH', 'NE', 'Neuenburg');
INSERT INTO `country_states` VALUES (117, 220, 'CH', 'NW', 'Nidwalden');
INSERT INTO `country_states` VALUES (118, 220, 'CH', 'OW', 'Obwalden');
INSERT INTO `country_states` VALUES (119, 220, 'CH', 'SG', 'St. Gallen');
INSERT INTO `country_states` VALUES (120, 220, 'CH', 'SH', 'Schaffhausen');
INSERT INTO `country_states` VALUES (121, 220, 'CH', 'SO', 'Solothurn');
INSERT INTO `country_states` VALUES (122, 220, 'CH', 'SZ', 'Schwyz');
INSERT INTO `country_states` VALUES (123, 220, 'CH', 'TG', 'Thurgau');
INSERT INTO `country_states` VALUES (124, 220, 'CH', 'TI', 'Tessin');
INSERT INTO `country_states` VALUES (125, 220, 'CH', 'UR', 'Uri');
INSERT INTO `country_states` VALUES (126, 220, 'CH', 'VD', 'Waadt');
INSERT INTO `country_states` VALUES (127, 220, 'CH', 'VS', 'Wallis');
INSERT INTO `country_states` VALUES (128, 220, 'CH', 'ZG', 'Zug');
INSERT INTO `country_states` VALUES (129, 220, 'CH', 'ZH', 'Zürich');
INSERT INTO `country_states` VALUES (130, 206, 'ES', 'A Coruсa', 'A Coruña');
INSERT INTO `country_states` VALUES (131, 206, 'ES', 'Alava', 'Alava');
INSERT INTO `country_states` VALUES (132, 206, 'ES', 'Albacete', 'Albacete');
INSERT INTO `country_states` VALUES (133, 206, 'ES', 'Alicante', 'Alicante');
INSERT INTO `country_states` VALUES (134, 206, 'ES', 'Almeria', 'Almeria');
INSERT INTO `country_states` VALUES (135, 206, 'ES', 'Asturias', 'Asturias');
INSERT INTO `country_states` VALUES (136, 206, 'ES', 'Avila', 'Avila');
INSERT INTO `country_states` VALUES (137, 206, 'ES', 'Badajoz', 'Badajoz');
INSERT INTO `country_states` VALUES (138, 206, 'ES', 'Baleares', 'Baleares');
INSERT INTO `country_states` VALUES (139, 206, 'ES', 'Barcelona', 'Barcelona');
INSERT INTO `country_states` VALUES (140, 206, 'ES', 'Burgos', 'Burgos');
INSERT INTO `country_states` VALUES (141, 206, 'ES', 'Caceres', 'Caceres');
INSERT INTO `country_states` VALUES (142, 206, 'ES', 'Cadiz', 'Cadiz');
INSERT INTO `country_states` VALUES (143, 206, 'ES', 'Cantabria', 'Cantabria');
INSERT INTO `country_states` VALUES (144, 206, 'ES', 'Castellon', 'Castellon');
INSERT INTO `country_states` VALUES (145, 206, 'ES', 'Ceuta', 'Ceuta');
INSERT INTO `country_states` VALUES (146, 206, 'ES', 'Ciudad Real', 'Ciudad Real');
INSERT INTO `country_states` VALUES (147, 206, 'ES', 'Cordoba', 'Cordoba');
INSERT INTO `country_states` VALUES (148, 206, 'ES', 'Cuenca', 'Cuenca');
INSERT INTO `country_states` VALUES (149, 206, 'ES', 'Girona', 'Girona');
INSERT INTO `country_states` VALUES (150, 206, 'ES', 'Granada', 'Granada');
INSERT INTO `country_states` VALUES (151, 206, 'ES', 'Guadalajara', 'Guadalajara');
INSERT INTO `country_states` VALUES (152, 206, 'ES', 'Guipuzcoa', 'Guipuzcoa');
INSERT INTO `country_states` VALUES (153, 206, 'ES', 'Huelva', 'Huelva');
INSERT INTO `country_states` VALUES (154, 206, 'ES', 'Huesca', 'Huesca');
INSERT INTO `country_states` VALUES (155, 206, 'ES', 'Jaen', 'Jaen');
INSERT INTO `country_states` VALUES (156, 206, 'ES', 'La Rioja', 'La Rioja');
INSERT INTO `country_states` VALUES (157, 206, 'ES', 'Las Palmas', 'Las Palmas');
INSERT INTO `country_states` VALUES (158, 206, 'ES', 'Leon', 'Leon');
INSERT INTO `country_states` VALUES (159, 206, 'ES', 'Lleida', 'Lleida');
INSERT INTO `country_states` VALUES (160, 206, 'ES', 'Lugo', 'Lugo');
INSERT INTO `country_states` VALUES (161, 206, 'ES', 'Madrid', 'Madrid');
INSERT INTO `country_states` VALUES (162, 206, 'ES', 'Malaga', 'Malaga');
INSERT INTO `country_states` VALUES (163, 206, 'ES', 'Melilla', 'Melilla');
INSERT INTO `country_states` VALUES (164, 206, 'ES', 'Murcia', 'Murcia');
INSERT INTO `country_states` VALUES (165, 206, 'ES', 'Navarra', 'Navarra');
INSERT INTO `country_states` VALUES (166, 206, 'ES', 'Ourense', 'Ourense');
INSERT INTO `country_states` VALUES (167, 206, 'ES', 'Palencia', 'Palencia');
INSERT INTO `country_states` VALUES (168, 206, 'ES', 'Pontevedra', 'Pontevedra');
INSERT INTO `country_states` VALUES (169, 206, 'ES', 'Salamanca', 'Salamanca');
INSERT INTO `country_states` VALUES (170, 206, 'ES', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife');
INSERT INTO `country_states` VALUES (171, 206, 'ES', 'Segovia', 'Segovia');
INSERT INTO `country_states` VALUES (172, 206, 'ES', 'Sevilla', 'Sevilla');
INSERT INTO `country_states` VALUES (173, 206, 'ES', 'Soria', 'Soria');
INSERT INTO `country_states` VALUES (174, 206, 'ES', 'Tarragona', 'Tarragona');
INSERT INTO `country_states` VALUES (175, 206, 'ES', 'Teruel', 'Teruel');
INSERT INTO `country_states` VALUES (176, 206, 'ES', 'Toledo', 'Toledo');
INSERT INTO `country_states` VALUES (177, 206, 'ES', 'Valencia', 'Valencia');
INSERT INTO `country_states` VALUES (178, 206, 'ES', 'Valladolid', 'Valladolid');
INSERT INTO `country_states` VALUES (179, 206, 'ES', 'Vizcaya', 'Vizcaya');
INSERT INTO `country_states` VALUES (180, 206, 'ES', 'Zamora', 'Zamora');
INSERT INTO `country_states` VALUES (181, 206, 'ES', 'Zaragoza', 'Zaragoza');
INSERT INTO `country_states` VALUES (182, 81, 'FR', '1', 'Ain');
INSERT INTO `country_states` VALUES (183, 81, 'FR', '2', 'Aisne');
INSERT INTO `country_states` VALUES (184, 81, 'FR', '3', 'Allier');
INSERT INTO `country_states` VALUES (185, 81, 'FR', '4', 'Alpes-de-Haute-Provence');
INSERT INTO `country_states` VALUES (186, 81, 'FR', '5', 'Hautes-Alpes');
INSERT INTO `country_states` VALUES (187, 81, 'FR', '6', 'Alpes-Maritimes');
INSERT INTO `country_states` VALUES (188, 81, 'FR', '7', 'Ardèche');
INSERT INTO `country_states` VALUES (189, 81, 'FR', '8', 'Ardennes');
INSERT INTO `country_states` VALUES (190, 81, 'FR', '9', 'Ariège');
INSERT INTO `country_states` VALUES (191, 81, 'FR', '10', 'Aube');
INSERT INTO `country_states` VALUES (192, 81, 'FR', '11', 'Aude');
INSERT INTO `country_states` VALUES (193, 81, 'FR', '12', 'Aveyron');
INSERT INTO `country_states` VALUES (194, 81, 'FR', '13', 'Bouches-du-Rhône');
INSERT INTO `country_states` VALUES (195, 81, 'FR', '14', 'Calvados');
INSERT INTO `country_states` VALUES (196, 81, 'FR', '15', 'Cantal');
INSERT INTO `country_states` VALUES (197, 81, 'FR', '16', 'Charente');
INSERT INTO `country_states` VALUES (198, 81, 'FR', '17', 'Charente-Maritime');
INSERT INTO `country_states` VALUES (199, 81, 'FR', '18', 'Cher');
INSERT INTO `country_states` VALUES (200, 81, 'FR', '19', 'Corrèze');
INSERT INTO `country_states` VALUES (201, 81, 'FR', '2A', 'Corse-du-Sud');
INSERT INTO `country_states` VALUES (202, 81, 'FR', '2B', 'Haute-Corse');
INSERT INTO `country_states` VALUES (203, 81, 'FR', '21', 'Côte-d\'Or');
INSERT INTO `country_states` VALUES (204, 81, 'FR', '22', 'Côtes-d\'Armor');
INSERT INTO `country_states` VALUES (205, 81, 'FR', '23', 'Creuse');
INSERT INTO `country_states` VALUES (206, 81, 'FR', '24', 'Dordogne');
INSERT INTO `country_states` VALUES (207, 81, 'FR', '25', 'Doubs');
INSERT INTO `country_states` VALUES (208, 81, 'FR', '26', 'Drôme');
INSERT INTO `country_states` VALUES (209, 81, 'FR', '27', 'Eure');
INSERT INTO `country_states` VALUES (210, 81, 'FR', '28', 'Eure-et-Loir');
INSERT INTO `country_states` VALUES (211, 81, 'FR', '29', 'Finistère');
INSERT INTO `country_states` VALUES (212, 81, 'FR', '30', 'Gard');
INSERT INTO `country_states` VALUES (213, 81, 'FR', '31', 'Haute-Garonne');
INSERT INTO `country_states` VALUES (214, 81, 'FR', '32', 'Gers');
INSERT INTO `country_states` VALUES (215, 81, 'FR', '33', 'Gironde');
INSERT INTO `country_states` VALUES (216, 81, 'FR', '34', 'Hérault');
INSERT INTO `country_states` VALUES (217, 81, 'FR', '35', 'Ille-et-Vilaine');
INSERT INTO `country_states` VALUES (218, 81, 'FR', '36', 'Indre');
INSERT INTO `country_states` VALUES (219, 81, 'FR', '37', 'Indre-et-Loire');
INSERT INTO `country_states` VALUES (220, 81, 'FR', '38', 'Isère');
INSERT INTO `country_states` VALUES (221, 81, 'FR', '39', 'Jura');
INSERT INTO `country_states` VALUES (222, 81, 'FR', '40', 'Landes');
INSERT INTO `country_states` VALUES (223, 81, 'FR', '41', 'Loir-et-Cher');
INSERT INTO `country_states` VALUES (224, 81, 'FR', '42', 'Loire');
INSERT INTO `country_states` VALUES (225, 81, 'FR', '43', 'Haute-Loire');
INSERT INTO `country_states` VALUES (226, 81, 'FR', '44', 'Loire-Atlantique');
INSERT INTO `country_states` VALUES (227, 81, 'FR', '45', 'Loiret');
INSERT INTO `country_states` VALUES (228, 81, 'FR', '46', 'Lot');
INSERT INTO `country_states` VALUES (229, 81, 'FR', '47', 'Lot-et-Garonne');
INSERT INTO `country_states` VALUES (230, 81, 'FR', '48', 'Lozère');
INSERT INTO `country_states` VALUES (231, 81, 'FR', '49', 'Maine-et-Loire');
INSERT INTO `country_states` VALUES (232, 81, 'FR', '50', 'Manche');
INSERT INTO `country_states` VALUES (233, 81, 'FR', '51', 'Marne');
INSERT INTO `country_states` VALUES (234, 81, 'FR', '52', 'Haute-Marne');
INSERT INTO `country_states` VALUES (235, 81, 'FR', '53', 'Mayenne');
INSERT INTO `country_states` VALUES (236, 81, 'FR', '54', 'Meurthe-et-Moselle');
INSERT INTO `country_states` VALUES (237, 81, 'FR', '55', 'Meuse');
INSERT INTO `country_states` VALUES (238, 81, 'FR', '56', 'Morbihan');
INSERT INTO `country_states` VALUES (239, 81, 'FR', '57', 'Moselle');
INSERT INTO `country_states` VALUES (240, 81, 'FR', '58', 'Nièvre');
INSERT INTO `country_states` VALUES (241, 81, 'FR', '59', 'Nord');
INSERT INTO `country_states` VALUES (242, 81, 'FR', '60', 'Oise');
INSERT INTO `country_states` VALUES (243, 81, 'FR', '61', 'Orne');
INSERT INTO `country_states` VALUES (244, 81, 'FR', '62', 'Pas-de-Calais');
INSERT INTO `country_states` VALUES (245, 81, 'FR', '63', 'Puy-de-Dôme');
INSERT INTO `country_states` VALUES (246, 81, 'FR', '64', 'Pyrénées-Atlantiques');
INSERT INTO `country_states` VALUES (247, 81, 'FR', '65', 'Hautes-Pyrénées');
INSERT INTO `country_states` VALUES (248, 81, 'FR', '66', 'Pyrénées-Orientales');
INSERT INTO `country_states` VALUES (249, 81, 'FR', '67', 'Bas-Rhin');
INSERT INTO `country_states` VALUES (250, 81, 'FR', '68', 'Haut-Rhin');
INSERT INTO `country_states` VALUES (251, 81, 'FR', '69', 'Rhône');
INSERT INTO `country_states` VALUES (252, 81, 'FR', '70', 'Haute-Saône');
INSERT INTO `country_states` VALUES (253, 81, 'FR', '71', 'Saône-et-Loire');
INSERT INTO `country_states` VALUES (254, 81, 'FR', '72', 'Sarthe');
INSERT INTO `country_states` VALUES (255, 81, 'FR', '73', 'Savoie');
INSERT INTO `country_states` VALUES (256, 81, 'FR', '74', 'Haute-Savoie');
INSERT INTO `country_states` VALUES (257, 81, 'FR', '75', 'Paris');
INSERT INTO `country_states` VALUES (258, 81, 'FR', '76', 'Seine-Maritime');
INSERT INTO `country_states` VALUES (259, 81, 'FR', '77', 'Seine-et-Marne');
INSERT INTO `country_states` VALUES (260, 81, 'FR', '78', 'Yvelines');
INSERT INTO `country_states` VALUES (261, 81, 'FR', '79', 'Deux-Sèvres');
INSERT INTO `country_states` VALUES (262, 81, 'FR', '80', 'Somme');
INSERT INTO `country_states` VALUES (263, 81, 'FR', '81', 'Tarn');
INSERT INTO `country_states` VALUES (264, 81, 'FR', '82', 'Tarn-et-Garonne');
INSERT INTO `country_states` VALUES (265, 81, 'FR', '83', 'Var');
INSERT INTO `country_states` VALUES (266, 81, 'FR', '84', 'Vaucluse');
INSERT INTO `country_states` VALUES (267, 81, 'FR', '85', 'Vendée');
INSERT INTO `country_states` VALUES (268, 81, 'FR', '86', 'Vienne');
INSERT INTO `country_states` VALUES (269, 81, 'FR', '87', 'Haute-Vienne');
INSERT INTO `country_states` VALUES (270, 81, 'FR', '88', 'Vosges');
INSERT INTO `country_states` VALUES (271, 81, 'FR', '89', 'Yonne');
INSERT INTO `country_states` VALUES (272, 81, 'FR', '90', 'Territoire-de-Belfort');
INSERT INTO `country_states` VALUES (273, 81, 'FR', '91', 'Essonne');
INSERT INTO `country_states` VALUES (274, 81, 'FR', '92', 'Hauts-de-Seine');
INSERT INTO `country_states` VALUES (275, 81, 'FR', '93', 'Seine-Saint-Denis');
INSERT INTO `country_states` VALUES (276, 81, 'FR', '94', 'Val-de-Marne');
INSERT INTO `country_states` VALUES (277, 81, 'FR', '95', 'Val-d\'Oise');
INSERT INTO `country_states` VALUES (278, 185, 'RO', 'AB', 'Alba');
INSERT INTO `country_states` VALUES (279, 185, 'RO', 'AR', 'Arad');
INSERT INTO `country_states` VALUES (280, 185, 'RO', 'AG', 'Argeş');
INSERT INTO `country_states` VALUES (281, 185, 'RO', 'BC', 'Bacău');
INSERT INTO `country_states` VALUES (282, 185, 'RO', 'BH', 'Bihor');
INSERT INTO `country_states` VALUES (283, 185, 'RO', 'BN', 'Bistriţa-Năsăud');
INSERT INTO `country_states` VALUES (284, 185, 'RO', 'BT', 'Botoşani');
INSERT INTO `country_states` VALUES (285, 185, 'RO', 'BV', 'Braşov');
INSERT INTO `country_states` VALUES (286, 185, 'RO', 'BR', 'Brăila');
INSERT INTO `country_states` VALUES (287, 185, 'RO', 'B', 'Bucureşti');
INSERT INTO `country_states` VALUES (288, 185, 'RO', 'BZ', 'Buzău');
INSERT INTO `country_states` VALUES (289, 185, 'RO', 'CS', 'Caraş-Severin');
INSERT INTO `country_states` VALUES (290, 185, 'RO', 'CL', 'Călăraşi');
INSERT INTO `country_states` VALUES (291, 185, 'RO', 'CJ', 'Cluj');
INSERT INTO `country_states` VALUES (292, 185, 'RO', 'CT', 'Constanţa');
INSERT INTO `country_states` VALUES (293, 185, 'RO', 'CV', 'Covasna');
INSERT INTO `country_states` VALUES (294, 185, 'RO', 'DB', 'Dâmboviţa');
INSERT INTO `country_states` VALUES (295, 185, 'RO', 'DJ', 'Dolj');
INSERT INTO `country_states` VALUES (296, 185, 'RO', 'GL', 'Galaţi');
INSERT INTO `country_states` VALUES (297, 185, 'RO', 'GR', 'Giurgiu');
INSERT INTO `country_states` VALUES (298, 185, 'RO', 'GJ', 'Gorj');
INSERT INTO `country_states` VALUES (299, 185, 'RO', 'HR', 'Harghita');
INSERT INTO `country_states` VALUES (300, 185, 'RO', 'HD', 'Hunedoara');
INSERT INTO `country_states` VALUES (301, 185, 'RO', 'IL', 'Ialomiţa');
INSERT INTO `country_states` VALUES (302, 185, 'RO', 'IS', 'Iaşi');
INSERT INTO `country_states` VALUES (303, 185, 'RO', 'IF', 'Ilfov');
INSERT INTO `country_states` VALUES (304, 185, 'RO', 'MM', 'Maramureş');
INSERT INTO `country_states` VALUES (305, 185, 'RO', 'MH', 'Mehedinţi');
INSERT INTO `country_states` VALUES (306, 185, 'RO', 'MS', 'Mureş');
INSERT INTO `country_states` VALUES (307, 185, 'RO', 'NT', 'Neamţ');
INSERT INTO `country_states` VALUES (308, 185, 'RO', 'OT', 'Olt');
INSERT INTO `country_states` VALUES (309, 185, 'RO', 'PH', 'Prahova');
INSERT INTO `country_states` VALUES (310, 185, 'RO', 'SM', 'Satu-Mare');
INSERT INTO `country_states` VALUES (311, 185, 'RO', 'SJ', 'Sălaj');
INSERT INTO `country_states` VALUES (312, 185, 'RO', 'SB', 'Sibiu');
INSERT INTO `country_states` VALUES (313, 185, 'RO', 'SV', 'Suceava');
INSERT INTO `country_states` VALUES (314, 185, 'RO', 'TR', 'Teleorman');
INSERT INTO `country_states` VALUES (315, 185, 'RO', 'TM', 'Timiş');
INSERT INTO `country_states` VALUES (316, 185, 'RO', 'TL', 'Tulcea');
INSERT INTO `country_states` VALUES (317, 185, 'RO', 'VS', 'Vaslui');
INSERT INTO `country_states` VALUES (318, 185, 'RO', 'VL', 'Vâlcea');
INSERT INTO `country_states` VALUES (319, 185, 'RO', 'VN', 'Vrancea');
INSERT INTO `country_states` VALUES (320, 80, 'FI', 'Lappi', 'Lappi');
INSERT INTO `country_states` VALUES (321, 80, 'FI', 'Pohjois-Pohjanmaa', 'Pohjois-Pohjanmaa');
INSERT INTO `country_states` VALUES (322, 80, 'FI', 'Kainuu', 'Kainuu');
INSERT INTO `country_states` VALUES (323, 80, 'FI', 'Pohjois-Karjala', 'Pohjois-Karjala');
INSERT INTO `country_states` VALUES (324, 80, 'FI', 'Pohjois-Savo', 'Pohjois-Savo');
INSERT INTO `country_states` VALUES (325, 80, 'FI', 'Etelä-Savo', 'Etelä-Savo');
INSERT INTO `country_states` VALUES (326, 80, 'FI', 'Etelä-Pohjanmaa', 'Etelä-Pohjanmaa');
INSERT INTO `country_states` VALUES (327, 80, 'FI', 'Pohjanmaa', 'Pohjanmaa');
INSERT INTO `country_states` VALUES (328, 80, 'FI', 'Pirkanmaa', 'Pirkanmaa');
INSERT INTO `country_states` VALUES (329, 80, 'FI', 'Satakunta', 'Satakunta');
INSERT INTO `country_states` VALUES (330, 80, 'FI', 'Keski-Pohjanmaa', 'Keski-Pohjanmaa');
INSERT INTO `country_states` VALUES (331, 80, 'FI', 'Keski-Suomi', 'Keski-Suomi');
INSERT INTO `country_states` VALUES (332, 80, 'FI', 'Varsinais-Suomi', 'Varsinais-Suomi');
INSERT INTO `country_states` VALUES (333, 80, 'FI', 'Etelä-Karjala', 'Etelä-Karjala');
INSERT INTO `country_states` VALUES (334, 80, 'FI', 'Päijät-Häme', 'Päijät-Häme');
INSERT INTO `country_states` VALUES (335, 80, 'FI', 'Kanta-Häme', 'Kanta-Häme');
INSERT INTO `country_states` VALUES (336, 80, 'FI', 'Uusimaa', 'Uusimaa');
INSERT INTO `country_states` VALUES (337, 80, 'FI', 'Itä-Uusimaa', 'Itä-Uusimaa');
INSERT INTO `country_states` VALUES (338, 80, 'FI', 'Kymenlaakso', 'Kymenlaakso');
INSERT INTO `country_states` VALUES (339, 80, 'FI', 'Ahvenanmaa', 'Ahvenanmaa');
INSERT INTO `country_states` VALUES (340, 74, 'EE', 'EE-37', 'Harjumaa');
INSERT INTO `country_states` VALUES (341, 74, 'EE', 'EE-39', 'Hiiumaa');
INSERT INTO `country_states` VALUES (342, 74, 'EE', 'EE-44', 'Ida-Virumaa');
INSERT INTO `country_states` VALUES (343, 74, 'EE', 'EE-49', 'Jõgevamaa');
INSERT INTO `country_states` VALUES (344, 74, 'EE', 'EE-51', 'Järvamaa');
INSERT INTO `country_states` VALUES (345, 74, 'EE', 'EE-57', 'Läänemaa');
INSERT INTO `country_states` VALUES (346, 74, 'EE', 'EE-59', 'Lääne-Virumaa');
INSERT INTO `country_states` VALUES (347, 74, 'EE', 'EE-65', 'Põlvamaa');
INSERT INTO `country_states` VALUES (348, 74, 'EE', 'EE-67', 'Pärnumaa');
INSERT INTO `country_states` VALUES (349, 74, 'EE', 'EE-70', 'Raplamaa');
INSERT INTO `country_states` VALUES (350, 74, 'EE', 'EE-74', 'Saaremaa');
INSERT INTO `country_states` VALUES (351, 74, 'EE', 'EE-78', 'Tartumaa');
INSERT INTO `country_states` VALUES (352, 74, 'EE', 'EE-82', 'Valgamaa');
INSERT INTO `country_states` VALUES (353, 74, 'EE', 'EE-84', 'Viljandimaa');
INSERT INTO `country_states` VALUES (354, 74, 'EE', 'EE-86', 'Võrumaa');
INSERT INTO `country_states` VALUES (355, 125, 'LV', 'LV-DGV', 'Daugavpils');
INSERT INTO `country_states` VALUES (356, 125, 'LV', 'LV-JEL', 'Jelgava');
INSERT INTO `country_states` VALUES (357, 125, 'LV', 'Jēkabpils', 'Jēkabpils');
INSERT INTO `country_states` VALUES (358, 125, 'LV', 'LV-JUR', 'Jūrmala');
INSERT INTO `country_states` VALUES (359, 125, 'LV', 'LV-LPX', 'Liepāja');
INSERT INTO `country_states` VALUES (360, 125, 'LV', 'LV-LE', 'Liepājas novads');
INSERT INTO `country_states` VALUES (361, 125, 'LV', 'LV-REZ', 'Rēzekne');
INSERT INTO `country_states` VALUES (362, 125, 'LV', 'LV-RIX', 'Rīga');
INSERT INTO `country_states` VALUES (363, 125, 'LV', 'LV-RI', 'Rīgas novads');
INSERT INTO `country_states` VALUES (364, 125, 'LV', 'Valmiera', 'Valmiera');
INSERT INTO `country_states` VALUES (365, 125, 'LV', 'LV-VEN', 'Ventspils');
INSERT INTO `country_states` VALUES (366, 125, 'LV', 'Aglonas novads', 'Aglonas novads');
INSERT INTO `country_states` VALUES (367, 125, 'LV', 'LV-AI', 'Aizkraukles novads');
INSERT INTO `country_states` VALUES (368, 125, 'LV', 'Aizputes novads', 'Aizputes novads');
INSERT INTO `country_states` VALUES (369, 125, 'LV', 'Aknīstes novads', 'Aknīstes novads');
INSERT INTO `country_states` VALUES (370, 125, 'LV', 'Alojas novads', 'Alojas novads');
INSERT INTO `country_states` VALUES (371, 125, 'LV', 'Alsungas novads', 'Alsungas novads');
INSERT INTO `country_states` VALUES (372, 125, 'LV', 'LV-AL', 'Alūksnes novads');
INSERT INTO `country_states` VALUES (373, 125, 'LV', 'Amatas novads', 'Amatas novads');
INSERT INTO `country_states` VALUES (374, 125, 'LV', 'Apes novads', 'Apes novads');
INSERT INTO `country_states` VALUES (375, 125, 'LV', 'Auces novads', 'Auces novads');
INSERT INTO `country_states` VALUES (376, 125, 'LV', 'Babītes novads', 'Babītes novads');
INSERT INTO `country_states` VALUES (377, 125, 'LV', 'Baldones novads', 'Baldones novads');
INSERT INTO `country_states` VALUES (378, 125, 'LV', 'Baltinavas novads', 'Baltinavas novads');
INSERT INTO `country_states` VALUES (379, 125, 'LV', 'LV-BL', 'Balvu novads');
INSERT INTO `country_states` VALUES (380, 125, 'LV', 'LV-BU', 'Bauskas novads');
INSERT INTO `country_states` VALUES (381, 125, 'LV', 'Beverīnas novads', 'Beverīnas novads');
INSERT INTO `country_states` VALUES (382, 125, 'LV', 'Brocēnu novads', 'Brocēnu novads');
INSERT INTO `country_states` VALUES (383, 125, 'LV', 'Burtnieku novads', 'Burtnieku novads');
INSERT INTO `country_states` VALUES (384, 125, 'LV', 'Carnikavas novads', 'Carnikavas novads');
INSERT INTO `country_states` VALUES (385, 125, 'LV', 'Cesvaines novads', 'Cesvaines novads');
INSERT INTO `country_states` VALUES (386, 125, 'LV', 'Ciblas novads', 'Ciblas novads');
INSERT INTO `country_states` VALUES (387, 125, 'LV', 'LV-CE', 'Cēsu novads');
INSERT INTO `country_states` VALUES (388, 125, 'LV', 'Dagdas novads', 'Dagdas novads');
INSERT INTO `country_states` VALUES (389, 125, 'LV', 'LV-DA', 'Daugavpils novads');
INSERT INTO `country_states` VALUES (390, 125, 'LV', 'LV-DO', 'Dobeles novads');
INSERT INTO `country_states` VALUES (391, 125, 'LV', 'Dundagas novads', 'Dundagas novads');
INSERT INTO `country_states` VALUES (392, 125, 'LV', 'Durbes novads', 'Durbes novads');
INSERT INTO `country_states` VALUES (393, 125, 'LV', 'Engures novads', 'Engures novads');
INSERT INTO `country_states` VALUES (394, 125, 'LV', 'Garkalnes novads', 'Garkalnes novads');
INSERT INTO `country_states` VALUES (395, 125, 'LV', 'Grobiņas novads', 'Grobiņas novads');
INSERT INTO `country_states` VALUES (396, 125, 'LV', 'LV-GU', 'Gulbenes novads');
INSERT INTO `country_states` VALUES (397, 125, 'LV', 'Iecavas novads', 'Iecavas novads');
INSERT INTO `country_states` VALUES (398, 125, 'LV', 'Ikšķiles novads', 'Ikšķiles novads');
INSERT INTO `country_states` VALUES (399, 125, 'LV', 'Ilūkstes novads', 'Ilūkstes novads');
INSERT INTO `country_states` VALUES (400, 125, 'LV', 'Inčukalna novads', 'Inčukalna novads');
INSERT INTO `country_states` VALUES (401, 125, 'LV', 'Jaunjelgavas novads', 'Jaunjelgavas novads');
INSERT INTO `country_states` VALUES (402, 125, 'LV', 'Jaunpiebalgas novads', 'Jaunpiebalgas novads');
INSERT INTO `country_states` VALUES (403, 125, 'LV', 'Jaunpils novads', 'Jaunpils novads');
INSERT INTO `country_states` VALUES (404, 125, 'LV', 'LV-JL', 'Jelgavas novads');
INSERT INTO `country_states` VALUES (405, 125, 'LV', 'LV-JK', 'Jēkabpils novads');
INSERT INTO `country_states` VALUES (406, 125, 'LV', 'Kandavas novads', 'Kandavas novads');
INSERT INTO `country_states` VALUES (407, 125, 'LV', 'Kokneses novads', 'Kokneses novads');
INSERT INTO `country_states` VALUES (408, 125, 'LV', 'Krimuldas novads', 'Krimuldas novads');
INSERT INTO `country_states` VALUES (409, 125, 'LV', 'Krustpils novads', 'Krustpils novads');
INSERT INTO `country_states` VALUES (410, 125, 'LV', 'LV-KR', 'Krāslavas novads');
INSERT INTO `country_states` VALUES (411, 125, 'LV', 'LV-KU', 'Kuldīgas novads');
INSERT INTO `country_states` VALUES (412, 125, 'LV', 'Kārsavas novads', 'Kārsavas novads');
INSERT INTO `country_states` VALUES (413, 125, 'LV', 'Lielvārdes novads', 'Lielvārdes novads');
INSERT INTO `country_states` VALUES (414, 125, 'LV', 'LV-LM', 'Limbažu novads');
INSERT INTO `country_states` VALUES (415, 125, 'LV', 'Lubānas novads', 'Lubānas novads');
INSERT INTO `country_states` VALUES (416, 125, 'LV', 'LV-LU', 'Ludzas novads');
INSERT INTO `country_states` VALUES (417, 125, 'LV', 'Līgatnes novads', 'Līgatnes novads');
INSERT INTO `country_states` VALUES (418, 125, 'LV', 'Līvānu novads', 'Līvānu novads');
INSERT INTO `country_states` VALUES (419, 125, 'LV', 'LV-MA', 'Madonas novads');
INSERT INTO `country_states` VALUES (420, 125, 'LV', 'Mazsalacas novads', 'Mazsalacas novads');
INSERT INTO `country_states` VALUES (421, 125, 'LV', 'Mālpils novads', 'Mālpils novads');
INSERT INTO `country_states` VALUES (422, 125, 'LV', 'Mārupes novads', 'Mārupes novads');
INSERT INTO `country_states` VALUES (423, 125, 'LV', 'Naukšēnu novads', 'Naukšēnu novads');
INSERT INTO `country_states` VALUES (424, 125, 'LV', 'Neretas novads', 'Neretas novads');
INSERT INTO `country_states` VALUES (425, 125, 'LV', 'Nīcas novads', 'Nīcas novads');
INSERT INTO `country_states` VALUES (426, 125, 'LV', 'LV-OG', 'Ogres novads');
INSERT INTO `country_states` VALUES (427, 125, 'LV', 'Olaines novads', 'Olaines novads');
INSERT INTO `country_states` VALUES (428, 125, 'LV', 'Ozolnieku novads', 'Ozolnieku novads');
INSERT INTO `country_states` VALUES (429, 125, 'LV', 'LV-PR', 'Preiļu novads');
INSERT INTO `country_states` VALUES (430, 125, 'LV', 'Priekules novads', 'Priekules novads');
INSERT INTO `country_states` VALUES (431, 125, 'LV', 'Priekuļu novads', 'Priekuļu novads');
INSERT INTO `country_states` VALUES (432, 125, 'LV', 'Pārgaujas novads', 'Pārgaujas novads');
INSERT INTO `country_states` VALUES (433, 125, 'LV', 'Pāvilostas novads', 'Pāvilostas novads');
INSERT INTO `country_states` VALUES (434, 125, 'LV', 'Pļaviņu novads', 'Pļaviņu novads');
INSERT INTO `country_states` VALUES (435, 125, 'LV', 'Raunas novads', 'Raunas novads');
INSERT INTO `country_states` VALUES (436, 125, 'LV', 'Riebiņu novads', 'Riebiņu novads');
INSERT INTO `country_states` VALUES (437, 125, 'LV', 'Rojas novads', 'Rojas novads');
INSERT INTO `country_states` VALUES (438, 125, 'LV', 'Ropažu novads', 'Ropažu novads');
INSERT INTO `country_states` VALUES (439, 125, 'LV', 'Rucavas novads', 'Rucavas novads');
INSERT INTO `country_states` VALUES (440, 125, 'LV', 'Rugāju novads', 'Rugāju novads');
INSERT INTO `country_states` VALUES (441, 125, 'LV', 'Rundāles novads', 'Rundāles novads');
INSERT INTO `country_states` VALUES (442, 125, 'LV', 'LV-RE', 'Rēzeknes novads');
INSERT INTO `country_states` VALUES (443, 125, 'LV', 'Rūjienas novads', 'Rūjienas novads');
INSERT INTO `country_states` VALUES (444, 125, 'LV', 'Salacgrīvas novads', 'Salacgrīvas novads');
INSERT INTO `country_states` VALUES (445, 125, 'LV', 'Salas novads', 'Salas novads');
INSERT INTO `country_states` VALUES (446, 125, 'LV', 'Salaspils novads', 'Salaspils novads');
INSERT INTO `country_states` VALUES (447, 125, 'LV', 'LV-SA', 'Saldus novads');
INSERT INTO `country_states` VALUES (448, 125, 'LV', 'Saulkrastu novads', 'Saulkrastu novads');
INSERT INTO `country_states` VALUES (449, 125, 'LV', 'Siguldas novads', 'Siguldas novads');
INSERT INTO `country_states` VALUES (450, 125, 'LV', 'Skrundas novads', 'Skrundas novads');
INSERT INTO `country_states` VALUES (451, 125, 'LV', 'Skrīveru novads', 'Skrīveru novads');
INSERT INTO `country_states` VALUES (452, 125, 'LV', 'Smiltenes novads', 'Smiltenes novads');
INSERT INTO `country_states` VALUES (453, 125, 'LV', 'Stopiņu novads', 'Stopiņu novads');
INSERT INTO `country_states` VALUES (454, 125, 'LV', 'Strenču novads', 'Strenču novads');
INSERT INTO `country_states` VALUES (455, 125, 'LV', 'Sējas novads', 'Sējas novads');
INSERT INTO `country_states` VALUES (456, 125, 'LV', 'LV-TA', 'Talsu novads');
INSERT INTO `country_states` VALUES (457, 125, 'LV', 'LV-TU', 'Tukuma novads');
INSERT INTO `country_states` VALUES (458, 125, 'LV', 'Tērvetes novads', 'Tērvetes novads');
INSERT INTO `country_states` VALUES (459, 125, 'LV', 'Vaiņodes novads', 'Vaiņodes novads');
INSERT INTO `country_states` VALUES (460, 125, 'LV', 'LV-VK', 'Valkas novads');
INSERT INTO `country_states` VALUES (461, 125, 'LV', 'LV-VM', 'Valmieras novads');
INSERT INTO `country_states` VALUES (462, 125, 'LV', 'Varakļānu novads', 'Varakļānu novads');
INSERT INTO `country_states` VALUES (463, 125, 'LV', 'Vecpiebalgas novads', 'Vecpiebalgas novads');
INSERT INTO `country_states` VALUES (464, 125, 'LV', 'Vecumnieku novads', 'Vecumnieku novads');
INSERT INTO `country_states` VALUES (465, 125, 'LV', 'LV-VE', 'Ventspils novads');
INSERT INTO `country_states` VALUES (466, 125, 'LV', 'Viesītes novads', 'Viesītes novads');
INSERT INTO `country_states` VALUES (467, 125, 'LV', 'Viļakas novads', 'Viļakas novads');
INSERT INTO `country_states` VALUES (468, 125, 'LV', 'Viļānu novads', 'Viļānu novads');
INSERT INTO `country_states` VALUES (469, 125, 'LV', 'Vārkavas novads', 'Vārkavas novads');
INSERT INTO `country_states` VALUES (470, 125, 'LV', 'Zilupes novads', 'Zilupes novads');
INSERT INTO `country_states` VALUES (471, 125, 'LV', 'Ādažu novads', 'Ādažu novads');
INSERT INTO `country_states` VALUES (472, 125, 'LV', 'Ērgļu novads', 'Ērgļu novads');
INSERT INTO `country_states` VALUES (473, 125, 'LV', 'Ķeguma novads', 'Ķeguma novads');
INSERT INTO `country_states` VALUES (474, 125, 'LV', 'Ķekavas novads', 'Ķekavas novads');
INSERT INTO `country_states` VALUES (475, 131, 'LT', 'LT-AL', 'Alytaus Apskritis');
INSERT INTO `country_states` VALUES (476, 131, 'LT', 'LT-KU', 'Kauno Apskritis');
INSERT INTO `country_states` VALUES (477, 131, 'LT', 'LT-KL', 'Klaipėdos Apskritis');
INSERT INTO `country_states` VALUES (478, 131, 'LT', 'LT-MR', 'Marijampolės Apskritis');
INSERT INTO `country_states` VALUES (479, 131, 'LT', 'LT-PN', 'Panevėžio Apskritis');
INSERT INTO `country_states` VALUES (480, 131, 'LT', 'LT-SA', 'Šiaulių Apskritis');
INSERT INTO `country_states` VALUES (481, 131, 'LT', 'LT-TA', 'Tauragės Apskritis');
INSERT INTO `country_states` VALUES (482, 131, 'LT', 'LT-TE', 'Telšių Apskritis');
INSERT INTO `country_states` VALUES (483, 131, 'LT', 'LT-UT', 'Utenos Apskritis');
INSERT INTO `country_states` VALUES (484, 131, 'LT', 'LT-VL', 'Vilniaus Apskritis');
INSERT INTO `country_states` VALUES (485, 31, 'BR', 'AC', 'Acre');
INSERT INTO `country_states` VALUES (486, 31, 'BR', 'AL', 'Alagoas');
INSERT INTO `country_states` VALUES (487, 31, 'BR', 'AP', 'Amapá');
INSERT INTO `country_states` VALUES (488, 31, 'BR', 'AM', 'Amazonas');
INSERT INTO `country_states` VALUES (489, 31, 'BR', 'BA', 'Bahia');
INSERT INTO `country_states` VALUES (490, 31, 'BR', 'CE', 'Ceará');
INSERT INTO `country_states` VALUES (491, 31, 'BR', 'ES', 'Espírito Santo');
INSERT INTO `country_states` VALUES (492, 31, 'BR', 'GO', 'Goiás');
INSERT INTO `country_states` VALUES (493, 31, 'BR', 'MA', 'Maranhão');
INSERT INTO `country_states` VALUES (494, 31, 'BR', 'MT', 'Mato Grosso');
INSERT INTO `country_states` VALUES (495, 31, 'BR', 'MS', 'Mato Grosso do Sul');
INSERT INTO `country_states` VALUES (496, 31, 'BR', 'MG', 'Minas Gerais');
INSERT INTO `country_states` VALUES (497, 31, 'BR', 'PA', 'Pará');
INSERT INTO `country_states` VALUES (498, 31, 'BR', 'PB', 'Paraíba');
INSERT INTO `country_states` VALUES (499, 31, 'BR', 'PR', 'Paraná');
INSERT INTO `country_states` VALUES (500, 31, 'BR', 'PE', 'Pernambuco');
INSERT INTO `country_states` VALUES (501, 31, 'BR', 'PI', 'Piauí');
INSERT INTO `country_states` VALUES (502, 31, 'BR', 'RJ', 'Rio de Janeiro');
INSERT INTO `country_states` VALUES (503, 31, 'BR', 'RN', 'Rio Grande do Norte');
INSERT INTO `country_states` VALUES (504, 31, 'BR', 'RS', 'Rio Grande do Sul');
INSERT INTO `country_states` VALUES (505, 31, 'BR', 'RO', 'Rondônia');
INSERT INTO `country_states` VALUES (506, 31, 'BR', 'RR', 'Roraima');
INSERT INTO `country_states` VALUES (507, 31, 'BR', 'SC', 'Santa Catarina');
INSERT INTO `country_states` VALUES (508, 31, 'BR', 'SP', 'São Paulo');
INSERT INTO `country_states` VALUES (509, 31, 'BR', 'SE', 'Sergipe');
INSERT INTO `country_states` VALUES (510, 31, 'BR', 'TO', 'Tocantins');
INSERT INTO `country_states` VALUES (511, 31, 'BR', 'DF', 'Distrito Federal');
INSERT INTO `country_states` VALUES (512, 59, 'HR', 'HR-01', 'Zagrebačka županija');
INSERT INTO `country_states` VALUES (513, 59, 'HR', 'HR-02', 'Krapinsko-zagorska županija');
INSERT INTO `country_states` VALUES (514, 59, 'HR', 'HR-03', 'Sisačko-moslavačka županija');
INSERT INTO `country_states` VALUES (515, 59, 'HR', 'HR-04', 'Karlovačka županija');
INSERT INTO `country_states` VALUES (516, 59, 'HR', 'HR-05', 'Varaždinska županija');
INSERT INTO `country_states` VALUES (517, 59, 'HR', 'HR-06', 'Koprivničko-križevačka županija');
INSERT INTO `country_states` VALUES (518, 59, 'HR', 'HR-07', 'Bjelovarsko-bilogorska županija');
INSERT INTO `country_states` VALUES (519, 59, 'HR', 'HR-08', 'Primorsko-goranska županija');
INSERT INTO `country_states` VALUES (520, 59, 'HR', 'HR-09', 'Ličko-senjska županija');
INSERT INTO `country_states` VALUES (521, 59, 'HR', 'HR-10', 'Virovitičko-podravska županija');
INSERT INTO `country_states` VALUES (522, 59, 'HR', 'HR-11', 'Požeško-slavonska županija');
INSERT INTO `country_states` VALUES (523, 59, 'HR', 'HR-12', 'Brodsko-posavska županija');
INSERT INTO `country_states` VALUES (524, 59, 'HR', 'HR-13', 'Zadarska županija');
INSERT INTO `country_states` VALUES (525, 59, 'HR', 'HR-14', 'Osječko-baranjska županija');
INSERT INTO `country_states` VALUES (526, 59, 'HR', 'HR-15', 'Šibensko-kninska županija');
INSERT INTO `country_states` VALUES (527, 59, 'HR', 'HR-16', 'Vukovarsko-srijemska županija');
INSERT INTO `country_states` VALUES (528, 59, 'HR', 'HR-17', 'Splitsko-dalmatinska županija');
INSERT INTO `country_states` VALUES (529, 59, 'HR', 'HR-18', 'Istarska županija');
INSERT INTO `country_states` VALUES (530, 59, 'HR', 'HR-19', 'Dubrovačko-neretvanska županija');
INSERT INTO `country_states` VALUES (531, 59, 'HR', 'HR-20', 'Međimurska županija');
INSERT INTO `country_states` VALUES (532, 59, 'HR', 'HR-21', 'Grad Zagreb');
INSERT INTO `country_states` VALUES (533, 106, 'IN', 'AN', 'Andaman and Nicobar Islands');
INSERT INTO `country_states` VALUES (534, 106, 'IN', 'AP', 'Andhra Pradesh');
INSERT INTO `country_states` VALUES (535, 106, 'IN', 'AR', 'Arunachal Pradesh');
INSERT INTO `country_states` VALUES (536, 106, 'IN', 'AS', 'Assam');
INSERT INTO `country_states` VALUES (537, 106, 'IN', 'BR', 'Bihar');
INSERT INTO `country_states` VALUES (538, 106, 'IN', 'CH', 'Chandigarh');
INSERT INTO `country_states` VALUES (539, 106, 'IN', 'CT', 'Chhattisgarh');
INSERT INTO `country_states` VALUES (540, 106, 'IN', 'DN', 'Dadra and Nagar Haveli');
INSERT INTO `country_states` VALUES (541, 106, 'IN', 'DD', 'Daman and Diu');
INSERT INTO `country_states` VALUES (542, 106, 'IN', 'DL', 'Delhi');
INSERT INTO `country_states` VALUES (543, 106, 'IN', 'GA', 'Goa');
INSERT INTO `country_states` VALUES (544, 106, 'IN', 'GJ', 'Gujarat');
INSERT INTO `country_states` VALUES (545, 106, 'IN', 'HR', 'Haryana');
INSERT INTO `country_states` VALUES (546, 106, 'IN', 'HP', 'Himachal Pradesh');
INSERT INTO `country_states` VALUES (547, 106, 'IN', 'JK', 'Jammu and Kashmir');
INSERT INTO `country_states` VALUES (548, 106, 'IN', 'JH', 'Jharkhand');
INSERT INTO `country_states` VALUES (549, 106, 'IN', 'KA', 'Karnataka');
INSERT INTO `country_states` VALUES (550, 106, 'IN', 'KL', 'Kerala');
INSERT INTO `country_states` VALUES (551, 106, 'IN', 'LD', 'Lakshadweep');
INSERT INTO `country_states` VALUES (552, 106, 'IN', 'MP', 'Madhya Pradesh');
INSERT INTO `country_states` VALUES (553, 106, 'IN', 'MH', 'Maharashtra');
INSERT INTO `country_states` VALUES (554, 106, 'IN', 'MN', 'Manipur');
INSERT INTO `country_states` VALUES (555, 106, 'IN', 'ML', 'Meghalaya');
INSERT INTO `country_states` VALUES (556, 106, 'IN', 'MZ', 'Mizoram');
INSERT INTO `country_states` VALUES (557, 106, 'IN', 'NL', 'Nagaland');
INSERT INTO `country_states` VALUES (558, 106, 'IN', 'OR', 'Odisha');
INSERT INTO `country_states` VALUES (559, 106, 'IN', 'PY', 'Puducherry');
INSERT INTO `country_states` VALUES (560, 106, 'IN', 'PB', 'Punjab');
INSERT INTO `country_states` VALUES (561, 106, 'IN', 'RJ', 'Rajasthan');
INSERT INTO `country_states` VALUES (562, 106, 'IN', 'SK', 'Sikkim');
INSERT INTO `country_states` VALUES (563, 106, 'IN', 'TN', 'Tamil Nadu');
INSERT INTO `country_states` VALUES (564, 106, 'IN', 'TG', 'Telangana');
INSERT INTO `country_states` VALUES (565, 106, 'IN', 'TR', 'Tripura');
INSERT INTO `country_states` VALUES (566, 106, 'IN', 'UP', 'Uttar Pradesh');
INSERT INTO `country_states` VALUES (567, 106, 'IN', 'UT', 'Uttarakhand');
INSERT INTO `country_states` VALUES (568, 106, 'IN', 'WB', 'West Bengal');
INSERT INTO `country_states` VALUES (569, 176, 'PY', 'PY-16', 'Alto Paraguay');
INSERT INTO `country_states` VALUES (570, 176, 'PY', 'PY-10', 'Alto Paraná');
INSERT INTO `country_states` VALUES (571, 176, 'PY', 'PY-13', 'Amambay');
INSERT INTO `country_states` VALUES (572, 176, 'PY', 'PY-ASU', 'Asunción');
INSERT INTO `country_states` VALUES (573, 176, 'PY', 'PY-19', 'Boquerón');
INSERT INTO `country_states` VALUES (574, 176, 'PY', 'PY-5', 'Caaguazú');
INSERT INTO `country_states` VALUES (575, 176, 'PY', 'PY-6', 'Caazapá');
INSERT INTO `country_states` VALUES (576, 176, 'PY', 'PY-14', 'Canindeyú');
INSERT INTO `country_states` VALUES (577, 176, 'PY', 'PY-11', 'Central');
INSERT INTO `country_states` VALUES (578, 176, 'PY', 'PY-1', 'Concepción');
INSERT INTO `country_states` VALUES (579, 176, 'PY', 'PY-3', 'Cordillera');
INSERT INTO `country_states` VALUES (580, 176, 'PY', 'PY-4', 'Guairá');
INSERT INTO `country_states` VALUES (581, 176, 'PY', 'PY-7', 'Itapúa');
INSERT INTO `country_states` VALUES (582, 176, 'PY', 'PY-8', 'Misiones');
INSERT INTO `country_states` VALUES (583, 176, 'PY', 'PY-9', 'Paraguarí');
INSERT INTO `country_states` VALUES (584, 176, 'PY', 'PY-15', 'Presidente Hayes');
INSERT INTO `country_states` VALUES (585, 176, 'PY', 'PY-2', 'San Pedro');
INSERT INTO `country_states` VALUES (586, 176, 'PY', 'PY-12', 'Ñeembucú');

-- ----------------------------
-- Table structure for country_translations
-- ----------------------------
DROP TABLE IF EXISTS `country_translations`;
CREATE TABLE `country_translations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `country_id` int UNSIGNED NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `country_translations_country_id_foreign`(`country_id` ASC) USING BTREE,
  CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of country_translations
-- ----------------------------

-- ----------------------------
-- Table structure for currencies
-- ----------------------------
DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `decimal` int UNSIGNED NOT NULL DEFAULT 2,
  `group_separator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ',',
  `decimal_separator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '.',
  `currency_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of currencies
-- ----------------------------
INSERT INTO `currencies` VALUES (1, 'PHP', 'Philippine Peso', '₱', 2, ',', '.', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for currency_exchange_rates
-- ----------------------------
DROP TABLE IF EXISTS `currency_exchange_rates`;
CREATE TABLE `currency_exchange_rates`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `rate` decimal(24, 12) NOT NULL,
  `target_currency` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `currency_exchange_rates_target_currency_unique`(`target_currency` ASC) USING BTREE,
  CONSTRAINT `currency_exchange_rates_target_currency_foreign` FOREIGN KEY (`target_currency`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of currency_exchange_rates
-- ----------------------------

-- ----------------------------
-- Table structure for customer_groups
-- ----------------------------
DROP TABLE IF EXISTS `customer_groups`;
CREATE TABLE `customer_groups`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `customer_groups_code_unique`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_groups
-- ----------------------------
INSERT INTO `customer_groups` VALUES (1, 'guest', 'Guest', 0, NULL, NULL);
INSERT INTO `customer_groups` VALUES (2, 'general', 'General', 0, NULL, NULL);
INSERT INTO `customer_groups` VALUES (3, 'wholesale', 'Wholesale', 0, NULL, NULL);

-- ----------------------------
-- Table structure for customer_notes
-- ----------------------------
DROP TABLE IF EXISTS `customer_notes`;
CREATE TABLE `customer_notes`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int UNSIGNED NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customer_notes_customer_id_foreign`(`customer_id` ASC) USING BTREE,
  CONSTRAINT `customer_notes_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_notes
-- ----------------------------

-- ----------------------------
-- Table structure for customer_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `customer_password_resets`;
CREATE TABLE `customer_password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `customer_password_resets_email_index`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for customer_social_accounts
-- ----------------------------
DROP TABLE IF EXISTS `customer_social_accounts`;
CREATE TABLE `customer_social_accounts`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int UNSIGNED NOT NULL,
  `provider_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `provider_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `customer_social_accounts_provider_id_unique`(`provider_id` ASC) USING BTREE,
  INDEX `customer_social_accounts_customer_id_foreign`(`customer_id` ASC) USING BTREE,
  CONSTRAINT `customer_social_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_social_accounts
-- ----------------------------

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date_of_birth` date NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT 1,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `api_token` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `customer_group_id` int UNSIGNED NULL DEFAULT NULL,
  `channel_id` int UNSIGNED NULL DEFAULT NULL,
  `subscribed_to_news_letter` tinyint(1) NOT NULL DEFAULT 0,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `is_suspended` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `customers_email_unique`(`email` ASC) USING BTREE,
  UNIQUE INDEX `customers_phone_unique`(`phone` ASC) USING BTREE,
  UNIQUE INDEX `customers_api_token_unique`(`api_token` ASC) USING BTREE,
  INDEX `customers_customer_group_id_foreign`(`customer_group_id` ASC) USING BTREE,
  INDEX `customers_channel_id_foreign`(`channel_id` ASC) USING BTREE,
  CONSTRAINT `customers_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES (1, 'John Paul', 'Linogao', NULL, NULL, 'castrodesjohnpaul@gmail.com', NULL, NULL, 1, '$2y$12$dsGlPVTnCD82mWzszm9HSucJJfMO2w45Epa.66lgTfuuxh/8rmrm.', 'pBenXvlANNLPxxbEUdS8FpCUp3zESp0uk6ZuCDQoYImiB8x5B9V9MAWPAIywyVh92WxMZoEdwbiue7TO', 1, 1, 0, 1, 0, '4137a0d75d7a15ae3e0e6b868598ac2e', NULL, '2025-04-15 21:23:40', '2025-04-15 21:23:40');

-- ----------------------------
-- Table structure for datagrid_saved_filters
-- ----------------------------
DROP TABLE IF EXISTS `datagrid_saved_filters`;
CREATE TABLE `datagrid_saved_filters`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `datagrid_saved_filters_user_id_name_src_unique`(`user_id` ASC, `name` ASC, `src` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of datagrid_saved_filters
-- ----------------------------

-- ----------------------------
-- Table structure for downloadable_link_purchased
-- ----------------------------
DROP TABLE IF EXISTS `downloadable_link_purchased`;
CREATE TABLE `downloadable_link_purchased`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `download_bought` int NOT NULL DEFAULT 0,
  `download_used` int NOT NULL DEFAULT 0,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `order_item_id` int UNSIGNED NOT NULL,
  `download_canceled` int NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `downloadable_link_purchased_customer_id_foreign`(`customer_id` ASC) USING BTREE,
  INDEX `downloadable_link_purchased_order_id_foreign`(`order_id` ASC) USING BTREE,
  INDEX `downloadable_link_purchased_order_item_id_foreign`(`order_item_id` ASC) USING BTREE,
  CONSTRAINT `downloadable_link_purchased_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `downloadable_link_purchased_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `downloadable_link_purchased_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of downloadable_link_purchased
-- ----------------------------

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for gdpr_data_request
-- ----------------------------
DROP TABLE IF EXISTS `gdpr_data_request`;
CREATE TABLE `gdpr_data_request`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `gdpr_data_request_customer_id_foreign`(`customer_id` ASC) USING BTREE,
  CONSTRAINT `gdpr_data_request_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gdpr_data_request
-- ----------------------------

-- ----------------------------
-- Table structure for import_batches
-- ----------------------------
DROP TABLE IF EXISTS `import_batches`;
CREATE TABLE `import_batches`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `data` json NOT NULL,
  `summary` json NULL,
  `import_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `import_batches_import_id_foreign`(`import_id` ASC) USING BTREE,
  CONSTRAINT `import_batches_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of import_batches
-- ----------------------------

-- ----------------------------
-- Table structure for imports
-- ----------------------------
DROP TABLE IF EXISTS `imports`;
CREATE TABLE `imports`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `process_in_queue` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation_strategy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_errors` int NOT NULL DEFAULT 0,
  `processed_rows_count` int NOT NULL DEFAULT 0,
  `invalid_rows_count` int NOT NULL DEFAULT 0,
  `errors_count` int NOT NULL DEFAULT 0,
  `errors` json NULL,
  `field_separator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `images_directory_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `error_file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `summary` json NULL,
  `started_at` datetime NULL DEFAULT NULL,
  `completed_at` datetime NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of imports
-- ----------------------------

-- ----------------------------
-- Table structure for inventory_sources
-- ----------------------------
DROP TABLE IF EXISTS `inventory_sources`;
CREATE TABLE `inventory_sources`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `contact_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int NOT NULL DEFAULT 0,
  `latitude` decimal(10, 5) NULL DEFAULT NULL,
  `longitude` decimal(10, 5) NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `inventory_sources_code_unique`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inventory_sources
-- ----------------------------
INSERT INTO `inventory_sources` VALUES (1, 'default', 'Default', NULL, 'Default', 'warehouse@example.com', '1234567899', NULL, 'US', 'MI', 'Detroit', '12th Street', '48127', 0, NULL, NULL, 1, NULL, NULL);

-- ----------------------------
-- Table structure for invoice_items
-- ----------------------------
DROP TABLE IF EXISTS `invoice_items`;
CREATE TABLE `invoice_items`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int UNSIGNED NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `qty` int NULL DEFAULT NULL,
  `price` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_price` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `total` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `tax_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_tax_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `discount_percent` decimal(12, 4) NULL DEFAULT 0.0000,
  `discount_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_discount_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `price_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `total_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_total_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `product_id` int UNSIGNED NULL DEFAULT NULL,
  `product_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `order_item_id` int UNSIGNED NULL DEFAULT NULL,
  `invoice_id` int UNSIGNED NULL DEFAULT NULL,
  `additional` json NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `invoice_items_invoice_id_foreign`(`invoice_id` ASC) USING BTREE,
  INDEX `invoice_items_parent_id_foreign`(`parent_id` ASC) USING BTREE,
  CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `invoice_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of invoice_items
-- ----------------------------

-- ----------------------------
-- Table structure for invoices
-- ----------------------------
DROP TABLE IF EXISTS `invoices`;
CREATE TABLE `invoices`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `total_qty` int NULL DEFAULT NULL,
  `base_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `channel_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `order_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sub_total` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_sub_total` decimal(12, 4) NULL DEFAULT 0.0000,
  `grand_total` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_grand_total` decimal(12, 4) NULL DEFAULT 0.0000,
  `shipping_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_shipping_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `tax_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_tax_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `discount_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_discount_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `shipping_tax_amount` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_shipping_tax_amount` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `sub_total_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_sub_total_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `shipping_amount_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `order_id` int UNSIGNED NULL DEFAULT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `reminders` int NOT NULL DEFAULT 0,
  `next_reminder_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `invoices_order_id_foreign`(`order_id` ASC) USING BTREE,
  CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of invoices
-- ----------------------------

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `cancelled_at` int NULL DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_batches
-- ----------------------------

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED NULL DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`queue` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for locales
-- ----------------------------
DROP TABLE IF EXISTS `locales`;
CREATE TABLE `locales`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` enum('ltr','rtl') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `logo_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `locales_code_unique`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of locales
-- ----------------------------
INSERT INTO `locales` VALUES (1, 'en', 'English', 'ltr', 'locales/NTrmFUmWDoGAKpW1y8E3Wpy6Szcb2PXJbVFhnb7b.png', NULL, NULL);

-- ----------------------------
-- Table structure for marketing_campaigns
-- ----------------------------
DROP TABLE IF EXISTS `marketing_campaigns`;
CREATE TABLE `marketing_campaigns`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `spooling` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `channel_id` int UNSIGNED NULL DEFAULT NULL,
  `customer_group_id` int UNSIGNED NULL DEFAULT NULL,
  `marketing_template_id` int UNSIGNED NULL DEFAULT NULL,
  `marketing_event_id` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `marketing_campaigns_channel_id_foreign`(`channel_id` ASC) USING BTREE,
  INDEX `marketing_campaigns_customer_group_id_foreign`(`customer_group_id` ASC) USING BTREE,
  INDEX `marketing_campaigns_marketing_template_id_foreign`(`marketing_template_id` ASC) USING BTREE,
  INDEX `marketing_campaigns_marketing_event_id_foreign`(`marketing_event_id` ASC) USING BTREE,
  CONSTRAINT `marketing_campaigns_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `marketing_campaigns_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `marketing_campaigns_marketing_event_id_foreign` FOREIGN KEY (`marketing_event_id`) REFERENCES `marketing_events` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `marketing_campaigns_marketing_template_id_foreign` FOREIGN KEY (`marketing_template_id`) REFERENCES `marketing_templates` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of marketing_campaigns
-- ----------------------------

-- ----------------------------
-- Table structure for marketing_events
-- ----------------------------
DROP TABLE IF EXISTS `marketing_events`;
CREATE TABLE `marketing_events`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `date` date NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of marketing_events
-- ----------------------------
INSERT INTO `marketing_events` VALUES (1, 'Birthday', 'Birthday', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for marketing_templates
-- ----------------------------
DROP TABLE IF EXISTS `marketing_templates`;
CREATE TABLE `marketing_templates`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of marketing_templates
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 156 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_admin_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (4, '2018_06_12_111907_create_admins_table', 1);
INSERT INTO `migrations` VALUES (5, '2018_06_13_055341_create_roles_table', 1);
INSERT INTO `migrations` VALUES (6, '2018_07_05_130148_create_attributes_table', 1);
INSERT INTO `migrations` VALUES (7, '2018_07_05_132854_create_attribute_translations_table', 1);
INSERT INTO `migrations` VALUES (8, '2018_07_05_135150_create_attribute_families_table', 1);
INSERT INTO `migrations` VALUES (9, '2018_07_05_135152_create_attribute_groups_table', 1);
INSERT INTO `migrations` VALUES (10, '2018_07_05_140832_create_attribute_options_table', 1);
INSERT INTO `migrations` VALUES (11, '2018_07_05_140856_create_attribute_option_translations_table', 1);
INSERT INTO `migrations` VALUES (12, '2018_07_05_142820_create_categories_table', 1);
INSERT INTO `migrations` VALUES (13, '2018_07_10_055143_create_locales_table', 1);
INSERT INTO `migrations` VALUES (14, '2018_07_20_054426_create_countries_table', 1);
INSERT INTO `migrations` VALUES (15, '2018_07_20_054502_create_currencies_table', 1);
INSERT INTO `migrations` VALUES (16, '2018_07_20_054542_create_currency_exchange_rates_table', 1);
INSERT INTO `migrations` VALUES (17, '2018_07_20_064849_create_channels_table', 1);
INSERT INTO `migrations` VALUES (18, '2018_07_21_142836_create_category_translations_table', 1);
INSERT INTO `migrations` VALUES (19, '2018_07_23_110040_create_inventory_sources_table', 1);
INSERT INTO `migrations` VALUES (20, '2018_07_24_082635_create_customer_groups_table', 1);
INSERT INTO `migrations` VALUES (21, '2018_07_24_082930_create_customers_table', 1);
INSERT INTO `migrations` VALUES (22, '2018_07_27_065727_create_products_table', 1);
INSERT INTO `migrations` VALUES (23, '2018_07_27_070011_create_product_attribute_values_table', 1);
INSERT INTO `migrations` VALUES (24, '2018_07_27_092623_create_product_reviews_table', 1);
INSERT INTO `migrations` VALUES (25, '2018_07_27_113941_create_product_images_table', 1);
INSERT INTO `migrations` VALUES (26, '2018_07_27_113956_create_product_inventories_table', 1);
INSERT INTO `migrations` VALUES (27, '2018_08_30_064755_create_tax_categories_table', 1);
INSERT INTO `migrations` VALUES (28, '2018_08_30_065042_create_tax_rates_table', 1);
INSERT INTO `migrations` VALUES (29, '2018_08_30_065840_create_tax_mappings_table', 1);
INSERT INTO `migrations` VALUES (30, '2018_09_05_150444_create_cart_table', 1);
INSERT INTO `migrations` VALUES (31, '2018_09_05_150915_create_cart_items_table', 1);
INSERT INTO `migrations` VALUES (32, '2018_09_11_064045_customer_password_resets', 1);
INSERT INTO `migrations` VALUES (33, '2018_09_19_093453_create_cart_payment', 1);
INSERT INTO `migrations` VALUES (34, '2018_09_19_093508_create_cart_shipping_rates_table', 1);
INSERT INTO `migrations` VALUES (35, '2018_09_20_060658_create_core_config_table', 1);
INSERT INTO `migrations` VALUES (36, '2018_09_27_113154_create_orders_table', 1);
INSERT INTO `migrations` VALUES (37, '2018_09_27_113207_create_order_items_table', 1);
INSERT INTO `migrations` VALUES (38, '2018_09_27_115022_create_shipments_table', 1);
INSERT INTO `migrations` VALUES (39, '2018_09_27_115029_create_shipment_items_table', 1);
INSERT INTO `migrations` VALUES (40, '2018_09_27_115135_create_invoices_table', 1);
INSERT INTO `migrations` VALUES (41, '2018_09_27_115144_create_invoice_items_table', 1);
INSERT INTO `migrations` VALUES (42, '2018_10_01_095504_create_order_payment_table', 1);
INSERT INTO `migrations` VALUES (43, '2018_10_03_025230_create_wishlist_table', 1);
INSERT INTO `migrations` VALUES (44, '2018_10_12_101803_create_country_translations_table', 1);
INSERT INTO `migrations` VALUES (45, '2018_10_12_101913_create_country_states_table', 1);
INSERT INTO `migrations` VALUES (46, '2018_10_12_101923_create_country_state_translations_table', 1);
INSERT INTO `migrations` VALUES (47, '2018_11_16_173504_create_subscribers_list_table', 1);
INSERT INTO `migrations` VALUES (48, '2018_11_21_144411_create_cart_item_inventories_table', 1);
INSERT INTO `migrations` VALUES (49, '2018_12_06_185202_create_product_flat_table', 1);
INSERT INTO `migrations` VALUES (50, '2018_12_24_123812_create_channel_inventory_sources_table', 1);
INSERT INTO `migrations` VALUES (51, '2018_12_26_165327_create_product_ordered_inventories_table', 1);
INSERT INTO `migrations` VALUES (52, '2019_05_13_024321_create_cart_rules_table', 1);
INSERT INTO `migrations` VALUES (53, '2019_05_13_024322_create_cart_rule_channels_table', 1);
INSERT INTO `migrations` VALUES (54, '2019_05_13_024323_create_cart_rule_customer_groups_table', 1);
INSERT INTO `migrations` VALUES (55, '2019_05_13_024324_create_cart_rule_translations_table', 1);
INSERT INTO `migrations` VALUES (56, '2019_05_13_024325_create_cart_rule_customers_table', 1);
INSERT INTO `migrations` VALUES (57, '2019_05_13_024326_create_cart_rule_coupons_table', 1);
INSERT INTO `migrations` VALUES (58, '2019_05_13_024327_create_cart_rule_coupon_usage_table', 1);
INSERT INTO `migrations` VALUES (59, '2019_06_17_180258_create_product_downloadable_samples_table', 1);
INSERT INTO `migrations` VALUES (60, '2019_06_17_180314_create_product_downloadable_sample_translations_table', 1);
INSERT INTO `migrations` VALUES (61, '2019_06_17_180325_create_product_downloadable_links_table', 1);
INSERT INTO `migrations` VALUES (62, '2019_06_17_180346_create_product_downloadable_link_translations_table', 1);
INSERT INTO `migrations` VALUES (63, '2019_06_21_202249_create_downloadable_link_purchased_table', 1);
INSERT INTO `migrations` VALUES (64, '2019_07_02_180307_create_booking_products_table', 1);
INSERT INTO `migrations` VALUES (65, '2019_07_05_154415_create_booking_product_default_slots_table', 1);
INSERT INTO `migrations` VALUES (66, '2019_07_05_154429_create_booking_product_appointment_slots_table', 1);
INSERT INTO `migrations` VALUES (67, '2019_07_05_154440_create_booking_product_event_tickets_table', 1);
INSERT INTO `migrations` VALUES (68, '2019_07_05_154451_create_booking_product_rental_slots_table', 1);
INSERT INTO `migrations` VALUES (69, '2019_07_05_154502_create_booking_product_table_slots_table', 1);
INSERT INTO `migrations` VALUES (70, '2019_07_30_153530_create_cms_pages_table', 1);
INSERT INTO `migrations` VALUES (71, '2019_07_31_143339_create_category_filterable_attributes_table', 1);
INSERT INTO `migrations` VALUES (72, '2019_08_02_105320_create_product_grouped_products_table', 1);
INSERT INTO `migrations` VALUES (73, '2019_08_20_170510_create_product_bundle_options_table', 1);
INSERT INTO `migrations` VALUES (74, '2019_08_20_170520_create_product_bundle_option_translations_table', 1);
INSERT INTO `migrations` VALUES (75, '2019_08_20_170528_create_product_bundle_option_products_table', 1);
INSERT INTO `migrations` VALUES (76, '2019_09_11_184511_create_refunds_table', 1);
INSERT INTO `migrations` VALUES (77, '2019_09_11_184519_create_refund_items_table', 1);
INSERT INTO `migrations` VALUES (78, '2019_12_03_184613_create_catalog_rules_table', 1);
INSERT INTO `migrations` VALUES (79, '2019_12_03_184651_create_catalog_rule_channels_table', 1);
INSERT INTO `migrations` VALUES (80, '2019_12_03_184732_create_catalog_rule_customer_groups_table', 1);
INSERT INTO `migrations` VALUES (81, '2019_12_06_101110_create_catalog_rule_products_table', 1);
INSERT INTO `migrations` VALUES (82, '2019_12_06_110507_create_catalog_rule_product_prices_table', 1);
INSERT INTO `migrations` VALUES (83, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (84, '2020_01_14_191854_create_cms_page_translations_table', 1);
INSERT INTO `migrations` VALUES (85, '2020_01_15_130209_create_cms_page_channels_table', 1);
INSERT INTO `migrations` VALUES (86, '2020_02_18_165639_create_bookings_table', 1);
INSERT INTO `migrations` VALUES (87, '2020_02_21_121201_create_booking_product_event_ticket_translations_table', 1);
INSERT INTO `migrations` VALUES (88, '2020_04_16_185147_add_table_addresses', 1);
INSERT INTO `migrations` VALUES (89, '2020_05_06_171638_create_order_comments_table', 1);
INSERT INTO `migrations` VALUES (90, '2020_05_21_171500_create_product_customer_group_prices_table', 1);
INSERT INTO `migrations` VALUES (91, '2020_06_25_162154_create_customer_social_accounts_table', 1);
INSERT INTO `migrations` VALUES (92, '2020_08_07_174804_create_gdpr_data_request_table', 1);
INSERT INTO `migrations` VALUES (93, '2020_11_19_112228_create_product_videos_table', 1);
INSERT INTO `migrations` VALUES (94, '2020_11_26_141455_create_marketing_templates_table', 1);
INSERT INTO `migrations` VALUES (95, '2020_11_26_150534_create_marketing_events_table', 1);
INSERT INTO `migrations` VALUES (96, '2020_11_26_150644_create_marketing_campaigns_table', 1);
INSERT INTO `migrations` VALUES (97, '2020_12_21_000200_create_channel_translations_table', 1);
INSERT INTO `migrations` VALUES (98, '2020_12_27_121950_create_jobs_table', 1);
INSERT INTO `migrations` VALUES (99, '2021_03_11_212124_create_order_transactions_table', 1);
INSERT INTO `migrations` VALUES (100, '2021_04_07_132010_create_product_review_images_table', 1);
INSERT INTO `migrations` VALUES (101, '2021_12_15_104544_notifications', 1);
INSERT INTO `migrations` VALUES (102, '2022_03_15_160510_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (103, '2022_04_01_094622_create_sitemaps_table', 1);
INSERT INTO `migrations` VALUES (104, '2022_10_03_144232_create_product_price_indices_table', 1);
INSERT INTO `migrations` VALUES (105, '2022_10_04_144444_create_job_batches_table', 1);
INSERT INTO `migrations` VALUES (106, '2022_10_08_134150_create_product_inventory_indices_table', 1);
INSERT INTO `migrations` VALUES (107, '2023_05_26_213105_create_wishlist_items_table', 1);
INSERT INTO `migrations` VALUES (108, '2023_05_26_213120_create_compare_items_table', 1);
INSERT INTO `migrations` VALUES (109, '2023_06_27_163529_rename_product_review_images_to_product_review_attachments', 1);
INSERT INTO `migrations` VALUES (110, '2023_07_06_140013_add_logo_path_column_to_locales', 1);
INSERT INTO `migrations` VALUES (111, '2023_07_10_184256_create_theme_customizations_table', 1);
INSERT INTO `migrations` VALUES (112, '2023_07_12_181722_remove_home_page_and_footer_content_column_from_channel_translations_table', 1);
INSERT INTO `migrations` VALUES (113, '2023_07_20_185324_add_column_column_in_attribute_groups_table', 1);
INSERT INTO `migrations` VALUES (114, '2023_07_25_145943_add_regex_column_in_attributes_table', 1);
INSERT INTO `migrations` VALUES (115, '2023_07_25_165945_drop_notes_column_from_customers_table', 1);
INSERT INTO `migrations` VALUES (116, '2023_07_25_171058_create_customer_notes_table', 1);
INSERT INTO `migrations` VALUES (117, '2023_07_31_125232_rename_image_and_category_banner_columns_from_categories_table', 1);
INSERT INTO `migrations` VALUES (118, '2023_09_15_170053_create_theme_customization_translations_table', 1);
INSERT INTO `migrations` VALUES (119, '2023_09_20_102031_add_default_value_column_in_attributes_table', 1);
INSERT INTO `migrations` VALUES (120, '2023_09_20_102635_add_inventories_group_in_attribute_groups_table', 1);
INSERT INTO `migrations` VALUES (121, '2023_09_26_155709_add_columns_to_currencies', 1);
INSERT INTO `migrations` VALUES (122, '2023_10_05_163612_create_visits_table', 1);
INSERT INTO `migrations` VALUES (123, '2023_10_12_090446_add_tax_category_id_column_in_order_items_table', 1);
INSERT INTO `migrations` VALUES (124, '2023_11_08_054614_add_code_column_in_attribute_groups_table', 1);
INSERT INTO `migrations` VALUES (125, '2023_11_08_140116_create_search_terms_table', 1);
INSERT INTO `migrations` VALUES (126, '2023_11_09_162805_create_url_rewrites_table', 1);
INSERT INTO `migrations` VALUES (127, '2023_11_17_150401_create_search_synonyms_table', 1);
INSERT INTO `migrations` VALUES (128, '2023_12_11_054614_add_channel_id_column_in_product_price_indices_table', 1);
INSERT INTO `migrations` VALUES (129, '2024_01_11_154640_create_imports_table', 1);
INSERT INTO `migrations` VALUES (130, '2024_01_11_154741_create_import_batches_table', 1);
INSERT INTO `migrations` VALUES (131, '2024_01_19_170350_add_unique_id_column_in_product_attribute_values_table', 1);
INSERT INTO `migrations` VALUES (132, '2024_01_19_170350_add_unique_id_column_in_product_customer_group_prices_table', 1);
INSERT INTO `migrations` VALUES (133, '2024_01_22_170814_add_unique_index_in_mapping_tables', 1);
INSERT INTO `migrations` VALUES (134, '2024_02_26_153000_add_columns_to_addresses_table', 1);
INSERT INTO `migrations` VALUES (135, '2024_03_07_193421_rename_address1_column_in_addresses_table', 1);
INSERT INTO `migrations` VALUES (136, '2024_04_16_144400_add_cart_id_column_in_cart_shipping_rates_table', 1);
INSERT INTO `migrations` VALUES (137, '2024_04_19_102939_add_incl_tax_columns_in_orders_table', 1);
INSERT INTO `migrations` VALUES (138, '2024_04_19_135405_add_incl_tax_columns_in_cart_items_table', 1);
INSERT INTO `migrations` VALUES (139, '2024_04_19_144641_add_incl_tax_columns_in_order_items_table', 1);
INSERT INTO `migrations` VALUES (140, '2024_04_23_133154_add_incl_tax_columns_in_cart_table', 1);
INSERT INTO `migrations` VALUES (141, '2024_04_23_150945_add_incl_tax_columns_in_cart_shipping_rates_table', 1);
INSERT INTO `migrations` VALUES (142, '2024_04_24_102939_add_incl_tax_columns_in_invoices_table', 1);
INSERT INTO `migrations` VALUES (143, '2024_04_24_102939_add_incl_tax_columns_in_refunds_table', 1);
INSERT INTO `migrations` VALUES (144, '2024_04_24_144641_add_incl_tax_columns_in_invoice_items_table', 1);
INSERT INTO `migrations` VALUES (145, '2024_04_24_144641_add_incl_tax_columns_in_refund_items_table', 1);
INSERT INTO `migrations` VALUES (146, '2024_04_24_144641_add_incl_tax_columns_in_shipment_items_table', 1);
INSERT INTO `migrations` VALUES (147, '2024_05_10_152848_create_saved_filters_table', 1);
INSERT INTO `migrations` VALUES (148, '2024_06_03_174128_create_product_channels_table', 1);
INSERT INTO `migrations` VALUES (149, '2024_06_04_130527_add_channel_id_column_in_customers_table', 1);
INSERT INTO `migrations` VALUES (150, '2024_06_04_134403_add_channel_id_column_in_visits_table', 1);
INSERT INTO `migrations` VALUES (151, '2024_06_13_184426_add_theme_column_into_theme_customizations_table', 1);
INSERT INTO `migrations` VALUES (152, '2024_07_17_172645_add_additional_column_to_sitemaps_table', 1);
INSERT INTO `migrations` VALUES (153, '2024_10_11_135010_create_product_customizable_options_table', 1);
INSERT INTO `migrations` VALUES (154, '2024_10_11_135110_create_product_customizable_option_translations_table', 1);
INSERT INTO `migrations` VALUES (155, '2024_10_11_135228_create_product_customizable_option_prices_table', 1);

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `order_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `notifications_order_id_foreign`(`order_id` ASC) USING BTREE,
  CONSTRAINT `notifications_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notifications
-- ----------------------------

-- ----------------------------
-- Table structure for order_comments
-- ----------------------------
DROP TABLE IF EXISTS `order_comments`;
CREATE TABLE `order_comments`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int UNSIGNED NULL DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_comments_order_id_foreign`(`order_id` ASC) USING BTREE,
  CONSTRAINT `order_comments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_comments
-- ----------------------------

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `coupon_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `weight` decimal(12, 4) NULL DEFAULT 0.0000,
  `total_weight` decimal(12, 4) NULL DEFAULT 0.0000,
  `qty_ordered` int NULL DEFAULT 0,
  `qty_shipped` int NULL DEFAULT 0,
  `qty_invoiced` int NULL DEFAULT 0,
  `qty_canceled` int NULL DEFAULT 0,
  `qty_refunded` int NULL DEFAULT 0,
  `price` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_price` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `total` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `total_invoiced` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_total_invoiced` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `amount_refunded` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_amount_refunded` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `discount_percent` decimal(12, 4) NULL DEFAULT 0.0000,
  `discount_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_discount_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `discount_invoiced` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_discount_invoiced` decimal(12, 4) NULL DEFAULT 0.0000,
  `discount_refunded` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_discount_refunded` decimal(12, 4) NULL DEFAULT 0.0000,
  `tax_percent` decimal(12, 4) NULL DEFAULT 0.0000,
  `tax_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_tax_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `tax_amount_invoiced` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_tax_amount_invoiced` decimal(12, 4) NULL DEFAULT 0.0000,
  `tax_amount_refunded` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_tax_amount_refunded` decimal(12, 4) NULL DEFAULT 0.0000,
  `price_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `total_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_total_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `product_id` int UNSIGNED NULL DEFAULT NULL,
  `product_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `order_id` int UNSIGNED NULL DEFAULT NULL,
  `tax_category_id` int UNSIGNED NULL DEFAULT NULL,
  `parent_id` int UNSIGNED NULL DEFAULT NULL,
  `additional` json NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_items_order_id_foreign`(`order_id` ASC) USING BTREE,
  INDEX `order_items_parent_id_foreign`(`parent_id` ASC) USING BTREE,
  INDEX `order_items_tax_category_id_foreign`(`tax_category_id` ASC) USING BTREE,
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_items
-- ----------------------------

-- ----------------------------
-- Table structure for order_payment
-- ----------------------------
DROP TABLE IF EXISTS `order_payment`;
CREATE TABLE `order_payment`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int UNSIGNED NULL DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `additional` json NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_payment_order_id_foreign`(`order_id` ASC) USING BTREE,
  CONSTRAINT `order_payment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_payment
-- ----------------------------

-- ----------------------------
-- Table structure for order_transactions
-- ----------------------------
DROP TABLE IF EXISTS `order_transactions`;
CREATE TABLE `order_transactions`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data` json NULL,
  `invoice_id` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_transactions_order_id_foreign`(`order_id` ASC) USING BTREE,
  CONSTRAINT `order_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_transactions
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `channel_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_guest` tinyint(1) NULL DEFAULT NULL,
  `customer_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `customer_first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `customer_last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `shipping_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `shipping_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `shipping_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `coupon_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT 0,
  `total_item_count` int NULL DEFAULT NULL,
  `total_qty_ordered` int NULL DEFAULT NULL,
  `base_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `channel_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `order_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `grand_total` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_grand_total` decimal(12, 4) NULL DEFAULT 0.0000,
  `grand_total_invoiced` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_grand_total_invoiced` decimal(12, 4) NULL DEFAULT 0.0000,
  `grand_total_refunded` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_grand_total_refunded` decimal(12, 4) NULL DEFAULT 0.0000,
  `sub_total` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_sub_total` decimal(12, 4) NULL DEFAULT 0.0000,
  `sub_total_invoiced` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_sub_total_invoiced` decimal(12, 4) NULL DEFAULT 0.0000,
  `sub_total_refunded` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_sub_total_refunded` decimal(12, 4) NULL DEFAULT 0.0000,
  `discount_percent` decimal(12, 4) NULL DEFAULT 0.0000,
  `discount_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_discount_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `discount_invoiced` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_discount_invoiced` decimal(12, 4) NULL DEFAULT 0.0000,
  `discount_refunded` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_discount_refunded` decimal(12, 4) NULL DEFAULT 0.0000,
  `tax_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_tax_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `tax_amount_invoiced` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_tax_amount_invoiced` decimal(12, 4) NULL DEFAULT 0.0000,
  `tax_amount_refunded` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_tax_amount_refunded` decimal(12, 4) NULL DEFAULT 0.0000,
  `shipping_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_shipping_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `shipping_invoiced` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_shipping_invoiced` decimal(12, 4) NULL DEFAULT 0.0000,
  `shipping_refunded` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_shipping_refunded` decimal(12, 4) NULL DEFAULT 0.0000,
  `shipping_discount_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_shipping_discount_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `shipping_tax_amount` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_shipping_tax_amount` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `shipping_tax_refunded` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_shipping_tax_refunded` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `sub_total_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_sub_total_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `shipping_amount_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `customer_id` int UNSIGNED NULL DEFAULT NULL,
  `customer_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `channel_id` int UNSIGNED NULL DEFAULT NULL,
  `channel_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cart_id` int NULL DEFAULT NULL,
  `applied_cart_rule_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orders_increment_id_unique`(`increment_id` ASC) USING BTREE,
  INDEX `orders_customer_id_foreign`(`customer_id` ASC) USING BTREE,
  INDEX `orders_channel_id_foreign`(`channel_id` ASC) USING BTREE,
  CONSTRAINT `orders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for product_attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `product_attribute_values`;
CREATE TABLE `product_attribute_values`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `text_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `boolean_value` tinyint(1) NULL DEFAULT NULL,
  `integer_value` int NULL DEFAULT NULL,
  `float_value` decimal(12, 4) NULL DEFAULT NULL,
  `datetime_value` datetime NULL DEFAULT NULL,
  `date_value` date NULL DEFAULT NULL,
  `json_value` json NULL,
  `product_id` int UNSIGNED NOT NULL,
  `attribute_id` int UNSIGNED NOT NULL,
  `unique_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `chanel_locale_attribute_value_index_unique`(`channel` ASC, `locale` ASC, `attribute_id` ASC, `product_id` ASC) USING BTREE,
  UNIQUE INDEX `product_attribute_values_unique_id_unique`(`unique_id` ASC) USING BTREE,
  INDEX `product_attribute_values_product_id_foreign`(`product_id` ASC) USING BTREE,
  INDEX `product_attribute_values_attribute_id_foreign`(`attribute_id` ASC) USING BTREE,
  CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_attribute_values
-- ----------------------------

-- ----------------------------
-- Table structure for product_bundle_option_products
-- ----------------------------
DROP TABLE IF EXISTS `product_bundle_option_products`;
CREATE TABLE `product_bundle_option_products`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int UNSIGNED NOT NULL,
  `product_bundle_option_id` int UNSIGNED NOT NULL,
  `qty` int NOT NULL DEFAULT 0,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `bundle_option_products_product_id_bundle_option_id_unique`(`product_id` ASC, `product_bundle_option_id` ASC) USING BTREE,
  INDEX `product_bundle_option_id_foreign`(`product_bundle_option_id` ASC) USING BTREE,
  CONSTRAINT `product_bundle_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_bundle_option_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_bundle_option_products
-- ----------------------------

-- ----------------------------
-- Table structure for product_bundle_option_translations
-- ----------------------------
DROP TABLE IF EXISTS `product_bundle_option_translations`;
CREATE TABLE `product_bundle_option_translations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_bundle_option_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_bundle_option_translations_option_id_locale_unique`(`product_bundle_option_id` ASC, `locale` ASC) USING BTREE,
  UNIQUE INDEX `bundle_option_translations_locale_label_bundle_option_id_unique`(`locale` ASC, `label` ASC, `product_bundle_option_id` ASC) USING BTREE,
  CONSTRAINT `product_bundle_option_translations_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_bundle_option_translations
-- ----------------------------

-- ----------------------------
-- Table structure for product_bundle_options
-- ----------------------------
DROP TABLE IF EXISTS `product_bundle_options`;
CREATE TABLE `product_bundle_options`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_bundle_options_product_id_foreign`(`product_id` ASC) USING BTREE,
  CONSTRAINT `product_bundle_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_bundle_options
-- ----------------------------

-- ----------------------------
-- Table structure for product_categories
-- ----------------------------
DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE `product_categories`  (
  `product_id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  UNIQUE INDEX `product_categories_product_id_category_id_unique`(`product_id` ASC, `category_id` ASC) USING BTREE,
  INDEX `product_categories_category_id_foreign`(`category_id` ASC) USING BTREE,
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_categories
-- ----------------------------

-- ----------------------------
-- Table structure for product_channels
-- ----------------------------
DROP TABLE IF EXISTS `product_channels`;
CREATE TABLE `product_channels`  (
  `product_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  UNIQUE INDEX `product_channels_product_id_channel_id_unique`(`product_id` ASC, `channel_id` ASC) USING BTREE,
  INDEX `product_channels_channel_id_foreign`(`channel_id` ASC) USING BTREE,
  CONSTRAINT `product_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_channels_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_channels
-- ----------------------------

-- ----------------------------
-- Table structure for product_cross_sells
-- ----------------------------
DROP TABLE IF EXISTS `product_cross_sells`;
CREATE TABLE `product_cross_sells`  (
  `parent_id` int UNSIGNED NOT NULL,
  `child_id` int UNSIGNED NOT NULL,
  UNIQUE INDEX `product_cross_sells_parent_id_child_id_unique`(`parent_id` ASC, `child_id` ASC) USING BTREE,
  INDEX `product_cross_sells_child_id_foreign`(`child_id` ASC) USING BTREE,
  CONSTRAINT `product_cross_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_cross_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_cross_sells
-- ----------------------------

-- ----------------------------
-- Table structure for product_customer_group_prices
-- ----------------------------
DROP TABLE IF EXISTS `product_customer_group_prices`;
CREATE TABLE `product_customer_group_prices`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT 0,
  `value_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `product_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unique_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_customer_group_prices_unique_id_unique`(`unique_id` ASC) USING BTREE,
  INDEX `product_customer_group_prices_product_id_foreign`(`product_id` ASC) USING BTREE,
  INDEX `product_customer_group_prices_customer_group_id_foreign`(`customer_group_id` ASC) USING BTREE,
  CONSTRAINT `product_customer_group_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_customer_group_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_customer_group_prices
-- ----------------------------

-- ----------------------------
-- Table structure for product_customizable_option_prices
-- ----------------------------
DROP TABLE IF EXISTS `product_customizable_option_prices`;
CREATE TABLE `product_customizable_option_prices`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `price` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `product_customizable_option_id` int UNSIGNED NOT NULL,
  `sort_order` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pcop_product_customizable_option_id_foreign`(`product_customizable_option_id` ASC) USING BTREE,
  CONSTRAINT `pcop_product_customizable_option_id_foreign` FOREIGN KEY (`product_customizable_option_id`) REFERENCES `product_customizable_options` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_customizable_option_prices
-- ----------------------------

-- ----------------------------
-- Table structure for product_customizable_option_translations
-- ----------------------------
DROP TABLE IF EXISTS `product_customizable_option_translations`;
CREATE TABLE `product_customizable_option_translations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `product_customizable_option_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_customizable_option_id_locale_unique`(`product_customizable_option_id` ASC, `locale` ASC) USING BTREE,
  CONSTRAINT `pcot_product_customizable_option_id_foreign` FOREIGN KEY (`product_customizable_option_id`) REFERENCES `product_customizable_options` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_customizable_option_translations
-- ----------------------------

-- ----------------------------
-- Table structure for product_customizable_options
-- ----------------------------
DROP TABLE IF EXISTS `product_customizable_options`;
CREATE TABLE `product_customizable_options`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 1,
  `max_characters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `supported_file_extensions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `sort_order` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_customizable_options_product_id_foreign`(`product_id` ASC) USING BTREE,
  CONSTRAINT `product_customizable_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_customizable_options
-- ----------------------------

-- ----------------------------
-- Table structure for product_downloadable_link_translations
-- ----------------------------
DROP TABLE IF EXISTS `product_downloadable_link_translations`;
CREATE TABLE `product_downloadable_link_translations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_downloadable_link_id` int UNSIGNED NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `link_translations_link_id_foreign`(`product_downloadable_link_id` ASC) USING BTREE,
  CONSTRAINT `link_translations_link_id_foreign` FOREIGN KEY (`product_downloadable_link_id`) REFERENCES `product_downloadable_links` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_downloadable_link_translations
-- ----------------------------

-- ----------------------------
-- Table structure for product_downloadable_links
-- ----------------------------
DROP TABLE IF EXISTS `product_downloadable_links`;
CREATE TABLE `product_downloadable_links`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int UNSIGNED NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `sample_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sample_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sample_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sample_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `downloads` int NOT NULL DEFAULT 0,
  `sort_order` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_downloadable_links_product_id_foreign`(`product_id` ASC) USING BTREE,
  CONSTRAINT `product_downloadable_links_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_downloadable_links
-- ----------------------------

-- ----------------------------
-- Table structure for product_downloadable_sample_translations
-- ----------------------------
DROP TABLE IF EXISTS `product_downloadable_sample_translations`;
CREATE TABLE `product_downloadable_sample_translations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_downloadable_sample_id` int UNSIGNED NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sample_translations_sample_id_foreign`(`product_downloadable_sample_id` ASC) USING BTREE,
  CONSTRAINT `sample_translations_sample_id_foreign` FOREIGN KEY (`product_downloadable_sample_id`) REFERENCES `product_downloadable_samples` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_downloadable_sample_translations
-- ----------------------------

-- ----------------------------
-- Table structure for product_downloadable_samples
-- ----------------------------
DROP TABLE IF EXISTS `product_downloadable_samples`;
CREATE TABLE `product_downloadable_samples`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int UNSIGNED NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_downloadable_samples_product_id_foreign`(`product_id` ASC) USING BTREE,
  CONSTRAINT `product_downloadable_samples_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_downloadable_samples
-- ----------------------------

-- ----------------------------
-- Table structure for product_flat
-- ----------------------------
DROP TABLE IF EXISTS `product_flat`;
CREATE TABLE `product_flat`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `url_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `new` tinyint(1) NULL DEFAULT NULL,
  `featured` tinyint(1) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `meta_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `price` decimal(12, 4) NULL DEFAULT NULL,
  `special_price` decimal(12, 4) NULL DEFAULT NULL,
  `special_price_from` date NULL DEFAULT NULL,
  `special_price_to` date NULL DEFAULT NULL,
  `weight` decimal(12, 4) NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attribute_family_id` int UNSIGNED NULL DEFAULT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `parent_id` int UNSIGNED NULL DEFAULT NULL,
  `visible_individually` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_flat_unique_index`(`product_id` ASC, `channel` ASC, `locale` ASC) USING BTREE,
  INDEX `product_flat_attribute_family_id_foreign`(`attribute_family_id` ASC) USING BTREE,
  INDEX `product_flat_parent_id_foreign`(`parent_id` ASC) USING BTREE,
  CONSTRAINT `product_flat_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_flat_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_flat_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_flat
-- ----------------------------

-- ----------------------------
-- Table structure for product_grouped_products
-- ----------------------------
DROP TABLE IF EXISTS `product_grouped_products`;
CREATE TABLE `product_grouped_products`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int UNSIGNED NOT NULL,
  `associated_product_id` int UNSIGNED NOT NULL,
  `qty` int NOT NULL DEFAULT 0,
  `sort_order` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `grouped_products_product_id_associated_product_id_unique`(`product_id` ASC, `associated_product_id` ASC) USING BTREE,
  INDEX `product_grouped_products_associated_product_id_foreign`(`associated_product_id` ASC) USING BTREE,
  CONSTRAINT `product_grouped_products_associated_product_id_foreign` FOREIGN KEY (`associated_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_grouped_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_grouped_products
-- ----------------------------

-- ----------------------------
-- Table structure for product_images
-- ----------------------------
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `position` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_images_product_id_foreign`(`product_id` ASC) USING BTREE,
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_images
-- ----------------------------

-- ----------------------------
-- Table structure for product_inventories
-- ----------------------------
DROP TABLE IF EXISTS `product_inventories`;
CREATE TABLE `product_inventories`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT 0,
  `product_id` int UNSIGNED NOT NULL,
  `vendor_id` int NOT NULL DEFAULT 0,
  `inventory_source_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_source_vendor_index_unique`(`product_id` ASC, `inventory_source_id` ASC, `vendor_id` ASC) USING BTREE,
  INDEX `product_inventories_inventory_source_id_foreign`(`inventory_source_id` ASC) USING BTREE,
  CONSTRAINT `product_inventories_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_inventories
-- ----------------------------

-- ----------------------------
-- Table structure for product_inventory_indices
-- ----------------------------
DROP TABLE IF EXISTS `product_inventory_indices`;
CREATE TABLE `product_inventory_indices`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT 0,
  `product_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_inventory_indices_product_id_channel_id_unique`(`product_id` ASC, `channel_id` ASC) USING BTREE,
  INDEX `product_inventory_indices_channel_id_foreign`(`channel_id` ASC) USING BTREE,
  CONSTRAINT `product_inventory_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_inventory_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_inventory_indices
-- ----------------------------

-- ----------------------------
-- Table structure for product_ordered_inventories
-- ----------------------------
DROP TABLE IF EXISTS `product_ordered_inventories`;
CREATE TABLE `product_ordered_inventories`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT 0,
  `product_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_ordered_inventories_product_id_channel_id_unique`(`product_id` ASC, `channel_id` ASC) USING BTREE,
  INDEX `product_ordered_inventories_channel_id_foreign`(`channel_id` ASC) USING BTREE,
  CONSTRAINT `product_ordered_inventories_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_ordered_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_ordered_inventories
-- ----------------------------

-- ----------------------------
-- Table structure for product_price_indices
-- ----------------------------
DROP TABLE IF EXISTS `product_price_indices`;
CREATE TABLE `product_price_indices`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED NULL DEFAULT NULL,
  `channel_id` int UNSIGNED NOT NULL DEFAULT 1,
  `min_price` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `regular_min_price` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `max_price` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `regular_max_price` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `price_indices_product_id_customer_group_id_channel_id_unique`(`product_id` ASC, `customer_group_id` ASC, `channel_id` ASC) USING BTREE,
  INDEX `product_price_indices_customer_group_id_foreign`(`customer_group_id` ASC) USING BTREE,
  INDEX `product_price_indices_channel_id_foreign`(`channel_id` ASC) USING BTREE,
  CONSTRAINT `product_price_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_price_indices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_price_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_price_indices
-- ----------------------------

-- ----------------------------
-- Table structure for product_relations
-- ----------------------------
DROP TABLE IF EXISTS `product_relations`;
CREATE TABLE `product_relations`  (
  `parent_id` int UNSIGNED NOT NULL,
  `child_id` int UNSIGNED NOT NULL,
  UNIQUE INDEX `product_relations_parent_id_child_id_unique`(`parent_id` ASC, `child_id` ASC) USING BTREE,
  INDEX `product_relations_child_id_foreign`(`child_id` ASC) USING BTREE,
  CONSTRAINT `product_relations_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_relations
-- ----------------------------

-- ----------------------------
-- Table structure for product_review_attachments
-- ----------------------------
DROP TABLE IF EXISTS `product_review_attachments`;
CREATE TABLE `product_review_attachments`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `review_id` int UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image',
  `mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_review_images_review_id_foreign`(`review_id` ASC) USING BTREE,
  CONSTRAINT `product_review_images_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_review_attachments
-- ----------------------------

-- ----------------------------
-- Table structure for product_reviews
-- ----------------------------
DROP TABLE IF EXISTS `product_reviews`;
CREATE TABLE `product_reviews`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `customer_id` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_reviews_product_id_foreign`(`product_id` ASC) USING BTREE,
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_reviews
-- ----------------------------

-- ----------------------------
-- Table structure for product_super_attributes
-- ----------------------------
DROP TABLE IF EXISTS `product_super_attributes`;
CREATE TABLE `product_super_attributes`  (
  `product_id` int UNSIGNED NOT NULL,
  `attribute_id` int UNSIGNED NOT NULL,
  UNIQUE INDEX `product_super_attributes_product_id_attribute_id_unique`(`product_id` ASC, `attribute_id` ASC) USING BTREE,
  INDEX `product_super_attributes_attribute_id_foreign`(`attribute_id` ASC) USING BTREE,
  CONSTRAINT `product_super_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_super_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_super_attributes
-- ----------------------------

-- ----------------------------
-- Table structure for product_up_sells
-- ----------------------------
DROP TABLE IF EXISTS `product_up_sells`;
CREATE TABLE `product_up_sells`  (
  `parent_id` int UNSIGNED NOT NULL,
  `child_id` int UNSIGNED NOT NULL,
  UNIQUE INDEX `product_up_sells_parent_id_child_id_unique`(`parent_id` ASC, `child_id` ASC) USING BTREE,
  INDEX `product_up_sells_child_id_foreign`(`child_id` ASC) USING BTREE,
  CONSTRAINT `product_up_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_up_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_up_sells
-- ----------------------------

-- ----------------------------
-- Table structure for product_videos
-- ----------------------------
DROP TABLE IF EXISTS `product_videos`;
CREATE TABLE `product_videos`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_videos_product_id_foreign`(`product_id` ASC) USING BTREE,
  CONSTRAINT `product_videos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_videos
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int UNSIGNED NULL DEFAULT NULL,
  `attribute_family_id` int UNSIGNED NULL DEFAULT NULL,
  `additional` json NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `products_sku_unique`(`sku` ASC) USING BTREE,
  INDEX `products_attribute_family_id_foreign`(`attribute_family_id` ASC) USING BTREE,
  INDEX `products_parent_id_foreign`(`parent_id` ASC) USING BTREE,
  CONSTRAINT `products_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------

-- ----------------------------
-- Table structure for refund_items
-- ----------------------------
DROP TABLE IF EXISTS `refund_items`;
CREATE TABLE `refund_items`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int UNSIGNED NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `qty` int NULL DEFAULT NULL,
  `price` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_price` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `total` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `tax_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_tax_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `discount_percent` decimal(12, 4) NULL DEFAULT 0.0000,
  `discount_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_discount_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `price_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `total_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_total_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `product_id` int UNSIGNED NULL DEFAULT NULL,
  `product_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `order_item_id` int UNSIGNED NULL DEFAULT NULL,
  `refund_id` int UNSIGNED NULL DEFAULT NULL,
  `additional` json NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `refund_items_parent_id_foreign`(`parent_id` ASC) USING BTREE,
  INDEX `refund_items_order_item_id_foreign`(`order_item_id` ASC) USING BTREE,
  INDEX `refund_items_refund_id_foreign`(`refund_id` ASC) USING BTREE,
  CONSTRAINT `refund_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `refund_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `refund_items` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `refund_items_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `refunds` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of refund_items
-- ----------------------------

-- ----------------------------
-- Table structure for refunds
-- ----------------------------
DROP TABLE IF EXISTS `refunds`;
CREATE TABLE `refunds`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `total_qty` int NULL DEFAULT NULL,
  `base_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `channel_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `order_currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `adjustment_refund` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_adjustment_refund` decimal(12, 4) NULL DEFAULT 0.0000,
  `adjustment_fee` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_adjustment_fee` decimal(12, 4) NULL DEFAULT 0.0000,
  `sub_total` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_sub_total` decimal(12, 4) NULL DEFAULT 0.0000,
  `grand_total` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_grand_total` decimal(12, 4) NULL DEFAULT 0.0000,
  `shipping_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_shipping_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `tax_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_tax_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `discount_percent` decimal(12, 4) NULL DEFAULT 0.0000,
  `discount_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_discount_amount` decimal(12, 4) NULL DEFAULT 0.0000,
  `shipping_tax_amount` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_shipping_tax_amount` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `sub_total_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_sub_total_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `shipping_amount_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `order_id` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `refunds_order_id_foreign`(`order_id` ASC) USING BTREE,
  CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of refunds
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `permission_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` json NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Administrator', 'This role users will have all the access', 'all', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for search_synonyms
-- ----------------------------
DROP TABLE IF EXISTS `search_synonyms`;
CREATE TABLE `search_synonyms`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of search_synonyms
-- ----------------------------

-- ----------------------------
-- Table structure for search_terms
-- ----------------------------
DROP TABLE IF EXISTS `search_terms`;
CREATE TABLE `search_terms`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `term` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `results` int NOT NULL DEFAULT 0,
  `uses` int NOT NULL DEFAULT 0,
  `redirect_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `display_in_suggested_terms` tinyint(1) NOT NULL DEFAULT 0,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `search_terms_channel_id_foreign`(`channel_id` ASC) USING BTREE,
  CONSTRAINT `search_terms_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of search_terms
-- ----------------------------

-- ----------------------------
-- Table structure for shipment_items
-- ----------------------------
DROP TABLE IF EXISTS `shipment_items`;
CREATE TABLE `shipment_items`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `qty` int NULL DEFAULT NULL,
  `weight` int NULL DEFAULT NULL,
  `price` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_price` decimal(12, 4) NULL DEFAULT 0.0000,
  `total` decimal(12, 4) NULL DEFAULT 0.0000,
  `base_total` decimal(12, 4) NULL DEFAULT 0.0000,
  `price_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12, 4) NOT NULL DEFAULT 0.0000,
  `product_id` int UNSIGNED NULL DEFAULT NULL,
  `product_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `order_item_id` int UNSIGNED NULL DEFAULT NULL,
  `shipment_id` int UNSIGNED NOT NULL,
  `additional` json NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shipment_items_shipment_id_foreign`(`shipment_id` ASC) USING BTREE,
  CONSTRAINT `shipment_items_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shipment_items
-- ----------------------------

-- ----------------------------
-- Table structure for shipments
-- ----------------------------
DROP TABLE IF EXISTS `shipments`;
CREATE TABLE `shipments`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `total_qty` int NULL DEFAULT NULL,
  `total_weight` int NULL DEFAULT NULL,
  `carrier_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `carrier_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `track_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `customer_id` int UNSIGNED NULL DEFAULT NULL,
  `customer_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `order_address_id` int UNSIGNED NULL DEFAULT NULL,
  `inventory_source_id` int UNSIGNED NULL DEFAULT NULL,
  `inventory_source_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shipments_order_id_foreign`(`order_id` ASC) USING BTREE,
  INDEX `shipments_inventory_source_id_foreign`(`inventory_source_id` ASC) USING BTREE,
  CONSTRAINT `shipments_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shipments
-- ----------------------------

-- ----------------------------
-- Table structure for sitemaps
-- ----------------------------
DROP TABLE IF EXISTS `sitemaps`;
CREATE TABLE `sitemaps`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional` json NULL,
  `generated_at` datetime NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sitemaps
-- ----------------------------

-- ----------------------------
-- Table structure for subscribers_list
-- ----------------------------
DROP TABLE IF EXISTS `subscribers_list`;
CREATE TABLE `subscribers_list`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT 0,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `customer_id` int UNSIGNED NULL DEFAULT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subscribers_list_customer_id_foreign`(`customer_id` ASC) USING BTREE,
  INDEX `subscribers_list_channel_id_foreign`(`channel_id` ASC) USING BTREE,
  CONSTRAINT `subscribers_list_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `subscribers_list_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subscribers_list
-- ----------------------------

-- ----------------------------
-- Table structure for tax_categories
-- ----------------------------
DROP TABLE IF EXISTS `tax_categories`;
CREATE TABLE `tax_categories`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tax_categories_code_unique`(`code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tax_categories
-- ----------------------------

-- ----------------------------
-- Table structure for tax_categories_tax_rates
-- ----------------------------
DROP TABLE IF EXISTS `tax_categories_tax_rates`;
CREATE TABLE `tax_categories_tax_rates`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `tax_category_id` int UNSIGNED NOT NULL,
  `tax_rate_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tax_map_index_unique`(`tax_category_id` ASC, `tax_rate_id` ASC) USING BTREE,
  INDEX `tax_categories_tax_rates_tax_rate_id_foreign`(`tax_rate_id` ASC) USING BTREE,
  CONSTRAINT `tax_categories_tax_rates_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tax_categories_tax_rates_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tax_categories_tax_rates
-- ----------------------------

-- ----------------------------
-- Table structure for tax_rates
-- ----------------------------
DROP TABLE IF EXISTS `tax_rates`;
CREATE TABLE `tax_rates`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_zip` tinyint(1) NOT NULL DEFAULT 0,
  `zip_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `zip_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `zip_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate` decimal(12, 4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tax_rates_identifier_unique`(`identifier` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tax_rates
-- ----------------------------

-- ----------------------------
-- Table structure for theme_customization_translations
-- ----------------------------
DROP TABLE IF EXISTS `theme_customization_translations`;
CREATE TABLE `theme_customization_translations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `theme_customization_id` int UNSIGNED NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` json NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `theme_customization_id_foreign`(`theme_customization_id` ASC) USING BTREE,
  CONSTRAINT `theme_customization_id_foreign` FOREIGN KEY (`theme_customization_id`) REFERENCES `theme_customizations` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of theme_customization_translations
-- ----------------------------
INSERT INTO `theme_customization_translations` VALUES (1, 1, 'en', '{\"images\": [{\"link\": \"\", \"image\": \"storage/theme/1/Qt2DUVlXGofmI3iMTbAj9mqSDTaAveJjSzJato3M.webp\", \"title\": \"Get Ready For New Collection\"}, {\"link\": \"\", \"image\": \"storage/theme/1/EdH3guAfMwYIFVNNuq2RhL0DrAuPCnCW3GIVTABi.webp\", \"title\": \"Get Ready For New Collection\"}, {\"link\": \"\", \"image\": \"storage/theme/1/NT9b5cGtxpIcHK7JDO5iKPSBuhnWjIgTxyCkGzcO.webp\", \"title\": \"Get Ready For New Collection\"}, {\"link\": \"\", \"image\": \"storage/theme/1/8Nx5TzPBTqXhSEs5Tz86UQG0U5p2KcHlBBSndkRT.webp\", \"title\": \"Get Ready For New Collection\"}]}');
INSERT INTO `theme_customization_translations` VALUES (2, 2, 'en', '{\"css\": \".home-offer h1 {\\r\\n    display: block;\\r\\n    font-weight: 500;\\r\\n    text-align: center;\\r\\n    font-size: 22px;\\r\\n    font-family: DM Serif Display;\\r\\n    background-color: #a3e635;\\r\\n    padding-top: 20px;\\r\\n    padding-bottom: 20px;\\r\\n    color: #022c22;\\r\\n}\\r\\n@media (max-width:768px) {\\r\\n    .home-offer h1 {\\r\\n        font-size:18px;\\r\\n        padding-top: 10px;\\r\\n        padding-bottom: 10px;\\r\\n    }\\r\\n    @media (max-width:525px) {\\r\\n        .home-offer h1 {\\r\\n            font-size:14px;\\r\\n            padding-top: 6px;\\r\\n            padding-bottom: 6px;\\r\\n        }\\r\\n    }\", \"html\": \"<div class=\\\"home-offer\\\">\\r\\n     <h1>Join The Green Revolution</h1>\\r\\n\\r\\n</div>\"}');
INSERT INTO `theme_customization_translations` VALUES (3, 3, 'en', '{\"filters\": {\"sort\": \"asc\", \"limit\": 10, \"parent_id\": 1}}');
INSERT INTO `theme_customization_translations` VALUES (4, 4, 'en', '{\"title\": \"New Products\", \"filters\": {\"new\": \"1\", \"sort\": \"name-asc\", \"limit\": \"12\"}}');
INSERT INTO `theme_customization_translations` VALUES (5, 5, 'en', '{\"css\": \".top-collection-container {\\r\\n    overflow: hidden;\\r\\n}\\r\\n.top-collection-header {\\r\\n    padding-left: 15px;\\r\\n    padding-right: 15px;\\r\\n    text-align: center;\\r\\n    font-size: 70px;\\r\\n    line-height: 90px;\\r\\n    color: #060C3B;\\r\\n    margin-top: 80px;\\r\\n}\\r\\n.top-collection-header h2 {\\r\\n    max-width: 595px;\\r\\n    margin-left: auto;\\r\\n    margin-right: auto;\\r\\n    font-family: DM Serif Display;\\r\\n}\\r\\n.top-collection-grid {\\r\\n    display: flex;\\r\\n    flex-wrap: wrap;\\r\\n    gap: 32px;\\r\\n    justify-content: center;\\r\\n    margin-top: 60px;\\r\\n    width: 100%;\\r\\n    margin-right: auto;\\r\\n    margin-left: auto;\\r\\n    padding-right: 90px;\\r\\n    padding-left: 90px;\\r\\n}\\r\\n\\r\\n.top-collection-card {\\r\\n    position: relative;\\r\\n    background: #f9fafb;\\r\\n    overflow: hidden;\\r\\n    border-radius: 20px;\\r\\n    width: 396px;\\r\\n    height: 396px; \\r\\n}\\r\\n\\r\\n.top-collection-card img {\\r\\n    width: 100%;\\r\\n    height: 100%;\\r\\n    object-fit: cover;\\r\\n    border-radius: 16px;\\r\\n    transition: transform 300ms ease;\\r\\n    transform: scale(1);\\r\\n    display: block;\\r\\n}\\r\\n\\r\\n.top-collection-card:hover img {\\r\\n    transform: scale(1.05);\\r\\n    transition: all 300ms ease;\\r\\n}\\r\\n.top-collection-card h3 {\\r\\n    color: #060C3B;\\r\\n    font-size: 30px;\\r\\n    font-family: DM Serif Display;\\r\\n    transform: translateX(-50%);\\r\\n    width: max-content;\\r\\n    left: 50%;\\r\\n    bottom: 30px;\\r\\n    position: absolute;\\r\\n    margin: 0;\\r\\n    font-weight: inherit;\\r\\n}\\r\\n@media not all and (min-width: 525px) {\\r\\n    .top-collection-header {\\r\\n        margin-top: 28px;\\r\\n        font-size: 20px;\\r\\n        line-height: 1.5;\\r\\n    }\\r\\n    .top-collection-grid {\\r\\n        gap: 10px\\r\\n    }\\r\\n}\\r\\n@media not all and (min-width: 768px) {\\r\\n    .top-collection-header {\\r\\n        margin-top: 30px;\\r\\n        font-size: 28px;\\r\\n        line-height: 3;\\r\\n    }\\r\\n    .top-collection-header h2 {\\r\\n        line-height:2;\\r\\n        margin-bottom:20px;\\r\\n    }\\r\\n    .top-collection-grid {\\r\\n        gap: 14px\\r\\n    }\\r\\n}\\r\\n@media not all and (min-width: 1024px) {\\r\\n    .top-collection-grid {\\r\\n        padding-left: 30px;\\r\\n        padding-right: 30px;\\r\\n    }\\r\\n}\\r\\n@media (max-width: 768px) {\\r\\n    .top-collection-grid {\\r\\n        row-gap:15px;\\r\\n        column-gap:0px;\\r\\n        justify-content: space-between;\\r\\n        margin-top: 0px;\\r\\n    }\\r\\n    .top-collection-card {\\r\\n        width:48%\\r\\n    }\\r\\n    .top-collection-card img {\\r\\n        width:100%;\\r\\n    }\\r\\n    .top-collection-card h3 {\\r\\n        font-size:24px;\\r\\n        bottom: 16px;\\r\\n    }\\r\\n}\\r\\n@media (max-width:520px) {\\r\\n    .top-collection-grid {\\r\\n        padding-left: 15px;\\r\\n        padding-right: 15px;\\r\\n    }\\r\\n    .top-collection-card h3 {\\r\\n        font-size:18px;\\r\\n        bottom: 10px;\\r\\n    }\\r\\n}\", \"html\": \"<div class=\\\"top-collection-container\\\">\\r\\n    <div class=\\\"top-collection-header\\\">\\r\\n         <h2>Find the material you need</h2>\\r\\n\\r\\n    </div>\\r\\n    <div class=\\\"top-collection-grid container\\\">\\r\\n        <div class=\\\"top-collection-card\\\">\\r\\n            <img src=\\\"\\\" data-src=\\\"http://localhost:8000/storage/theme/5/UambFY6EaCnf6HwZmGElOAmtZZJvTxfGmAxmGJRW.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\">\\r\\n             <h3>Tyres</h3>\\r\\n\\r\\n        </div>\\r\\n        <div class=\\\"top-collection-card\\\">\\r\\n            <img src=\\\"\\\" data-src=\\\"http://localhost:8000/storage/theme/5/88FPowGZferD2NBAFwTynWk3NltVeyvlfb49ftyJ.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\">\\r\\n             <h3>Glass </h3>\\r\\n\\r\\n        </div>\\r\\n        <div class=\\\"top-collection-card\\\">\\r\\n            <img src=\\\"\\\" data-src=\\\"http://localhost:8000/storage/theme/5/K2ReDzJC2ELGXpfLk2xybaTwCfvx1h0sXEU1S4vy.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\">\\r\\n             <h3>Plastic</h3>\\r\\n\\r\\n        </div>\\r\\n        <div class=\\\"top-collection-card\\\">\\r\\n            <img src=\\\"\\\" data-src=\\\"http://localhost:8000/storage/theme/5/Ub8cvqTWPEUi1CPEsP8vaGzMER0CRn5cJI0wEowO.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\">\\r\\n             <h3>Clothes</h3>\\r\\n\\r\\n        </div>\\r\\n        <div class=\\\"top-collection-card\\\">\\r\\n            <img src=\\\"\\\" data-src=\\\"http://localhost:8000/storage/theme/5/SeHzfw7cnsZwO20PTrSUtCSNsbZomJ1MvxB3djv7.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\">\\r\\n             <h3>Food</h3>\\r\\n\\r\\n        </div>\\r\\n        <div class=\\\"top-collection-card\\\">\\r\\n            <img src=\\\"\\\" data-src=\\\"http://localhost:8000/storage/theme/5/kaG4MnEbvNeFd8ne9PqXfd3WwC10g1N7sQ27KTEB.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\">\\r\\n             <h3>Metal</h3>\\r\\n\\r\\n        </div>\\r\\n    </div>\\r\\n</div>\"}');
INSERT INTO `theme_customization_translations` VALUES (6, 6, 'en', '{\"css\": \".section-gap {\\r\\n    margin-top:80px\\r\\n}\\r\\n.direction-ltr {\\r\\n    direction:ltr\\r\\n}\\r\\n.direction-rtl {\\r\\n    direction:rtl\\r\\n}\\r\\n.inline-col-wrapper {\\r\\n    display:grid;\\r\\n    grid-template-columns:auto 1fr;\\r\\n    grid-gap:60px;\\r\\n    align-items:center\\r\\n}\\r\\n.inline-col-wrapper .inline-col-image-wrapper {\\r\\n    overflow:hidden\\r\\n}\\r\\n.inline-col-wrapper .inline-col-image-wrapper img {\\r\\n    max-width:100%;\\r\\n    height:auto;\\r\\n    border-radius:16px;\\r\\n    text-indent:-9999px\\r\\n}\\r\\n.inline-col-wrapper .inline-col-content-wrapper {\\r\\n    display:flex;\\r\\n    flex-wrap:wrap;\\r\\n    gap:20px;\\r\\n    max-width:464px\\r\\n}\\r\\n.inline-col-wrapper .inline-col-content-wrapper .inline-col-title {\\r\\n    max-width:442px;\\r\\n    font-size:60px;\\r\\n    font-weight:400;\\r\\n    color:#022c22;\\r\\n    line-height:70px;\\r\\n    font-family:DM Serif Display;\\r\\n    margin:0\\r\\n}\\r\\n.inline-col-wrapper .inline-col-content-wrapper .inline-col-description {\\r\\n    margin:0;\\r\\n    font-size:20px;\\r\\n    color:#15803d;\\r\\n    font-family:Poppins;\\r\\n}\\r\\n@media (max-width:991px) {\\r\\n    .inline-col-wrapper {\\r\\n        grid-template-columns:1fr;\\r\\n        grid-gap:16px\\r\\n    }\\r\\n    .inline-col-wrapper .inline-col-content-wrapper {\\r\\n        gap:10px\\r\\n    }\\r\\n}\\r\\n@media (max-width:768px) {\\r\\n    .inline-col-wrapper .inline-col-image-wrapper img {\\r\\n        width:100%;\\r\\n    }\\r\\n    .inline-col-wrapper .inline-col-content-wrapper .inline-col-title {\\r\\n        font-size:28px !important;\\r\\n        line-height:normal !important\\r\\n    }\\r\\n}\\r\\n@media (max-width:525px) {\\r\\n    .inline-col-wrapper .inline-col-content-wrapper .inline-col-title {\\r\\n        font-size:20px !important;\\r\\n    }\\r\\n    .inline-col-description {\\r\\n        font-size:16px\\r\\n    }\\r\\n    .inline-col-wrapper {\\r\\n        grid-gap:10px\\r\\n    }\\r\\n}\", \"html\": \"<div class=\\\"section-gap bold-collections container\\\">\\r\\n    <div class=\\\"inline-col-wrapper\\\">\\r\\n        <div class=\\\"inline-col-image-wrapper\\\">\\r\\n            <img src=\\\"\\\" data-src=\\\"storage/theme/6/aypfAETAC5xEqWcgJ6N95aznssJ0APf1YZPL52it.webp\\\" class=\\\"lazy\\\" width=\\\"632\\\" height=\\\"510\\\" alt=\\\"Get Ready for our new Bold Collections!\\\">\\r\\n        </div>\\r\\n        <div class=\\\"inline-col-content-wrapper\\\">\\r\\n             <h2 class=\\\"inline-col-title\\\"> Sell your goods </h2> \\r\\n            <p class=\\\"inline-col-description\\\">Find the best solution to sell your good with lower cots and better profit</p>\\r\\n            <button class=\\\"primary-button max-md:rounded-lg max-md:px-4 max-md:py-2.5 max-md:text-sm\\\">View Collections</button>\\r\\n        </div>\\r\\n    </div>\\r\\n</div>\"}');
INSERT INTO `theme_customization_translations` VALUES (7, 7, 'en', '{\"title\": \"Featured Products\", \"filters\": {\"sort\": \"name-desc\", \"limit\": 12, \"featured\": 1}}');
INSERT INTO `theme_customization_translations` VALUES (8, 8, 'en', '{\"css\": \".section-game {overflow: hidden;}.section-title,.section-title h2{font-weight:400;font-family:DM Serif Display}.section-title{margin-top:80px;padding-left:15px;padding-right:15px;text-align:center;line-height:90px}.section-title h2{font-size:70px;color:#060c3b;max-width:595px;margin:auto}.collection-card-wrapper{display:flex;flex-wrap:wrap;justify-content:center;gap:30px}.collection-card-wrapper .single-collection-card{position:relative}.collection-card-wrapper .single-collection-card img{border-radius:16px;background-color:#f5f5f5;max-width:100%;height:auto;text-indent:-9999px}.collection-card-wrapper .single-collection-card .overlay-text{font-size:50px;font-weight:400;max-width:234px;font-style:italic;color:#060c3b;font-family:DM Serif Display;position:absolute;bottom:30px;left:30px;margin:0}@media (max-width:1024px){.section-title{padding:0 30px}}@media (max-width:991px){.collection-card-wrapper{flex-wrap:wrap}}@media (max-width:768px) {.collection-card-wrapper .single-collection-card .overlay-text{font-size:32px; bottom:20px}.section-title{margin-top:32px}.section-title h2{font-size:28px;line-height:normal}} @media (max-width:525px){.collection-card-wrapper .single-collection-card .overlay-text{font-size:18px; bottom:10px} .section-title{margin-top:28px}.section-title h2{font-size:20px;} .collection-card-wrapper{gap:10px; 15px; row-gap:15px; column-gap:0px;justify-content: space-between;margin-top: 15px;} .collection-card-wrapper .single-collection-card {width:48%;}}\", \"html\": \"<div class=\\\"section-game\\\"><div class=\\\"section-title\\\"> <h2>The game with our new additions!</h2> </div> <div class=\\\"section-gap container\\\"> <div class=\\\"collection-card-wrapper\\\"> <div class=\\\"single-collection-card\\\"> <img src=\\\"\\\" data-src=\\\"storage/theme/8/l1ZyIIbNP78I8zoYKUEvhUcZL4JTEDrzMuxykBDl.webp\\\" class=\\\"lazy\\\" width=\\\"615\\\" height=\\\"600\\\" alt=\\\"The game with our new additions!\\\"> <h3 class=\\\"overlay-text\\\">Our Collections</h3> </div> <div class=\\\"single-collection-card\\\"> <img src=\\\"\\\" data-src=\\\"storage/theme/8/wVBUVOBbxe9G8Nd7qHUShcMRZDbzslpSG5XeMLM2.webp\\\" class=\\\"lazy\\\" width=\\\"615\\\" height=\\\"600\\\" alt=\\\"The game with our new additions!\\\"> <h3 class=\\\"overlay-text\\\"> Our Collections </h3> </div> </div> </div> </div>\"}');
INSERT INTO `theme_customization_translations` VALUES (9, 9, 'en', '{\"title\": \"All Products\", \"filters\": {\"sort\": \"name-desc\", \"limit\": 12}}');
INSERT INTO `theme_customization_translations` VALUES (10, 10, 'en', '{\"css\": \".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}}@media (max-width:768px) {.inline-col-wrapper .inline-col-image-wrapper img {max-width:100%;}.inline-col-wrapper .inline-col-content-wrapper{max-width:100%;justify-content:center; text-align:center} .section-gap{padding:0 30px; gap:20px;margin-top:24px} .bold-collections{margin-top:32px;}} @media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper{gap:10px} .inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:20px;line-height:normal} .section-gap{padding:0 15px; gap:15px;margin-top:10px} .bold-collections{margin-top:28px;}  .inline-col-description{font-size:16px !important} .inline-col-wrapper{grid-gap:15px}\", \"html\": \"<div class=\\\"section-gap bold-collections container\\\"> <div class=\\\"inline-col-wrapper direction-rtl\\\"> <div class=\\\"inline-col-image-wrapper\\\"> <img src=\\\"\\\" data-src=\\\"storage/theme/10/kMBAakMdT4jdZk5fHfgOui3zExrn7ypdYNiOkvZe.webp\\\" class=\\\"lazy\\\" width=\\\"632\\\" height=\\\"510\\\" alt=\\\"Get Ready for our new Bold Collections!\\\"> </div> <div class=\\\"inline-col-content-wrapper direction-ltr\\\"> <h2 class=\\\"inline-col-title\\\"> Get Ready for our new Bold Collections! </h2> <p class=\\\"inline-col-description\\\">Introducing Our New Bold Collections! Elevate your style with daring designs and vibrant statements. Explore striking patterns and bold colors that redefine your wardrobe. Get ready to embrace the extraordinary!</p> <button class=\\\"primary-button max-md:rounded-lg max-md:px-4 max-md:py-2.5 max-md:text-sm\\\">View Collections</button> </div> </div> </div>\"}');
INSERT INTO `theme_customization_translations` VALUES (11, 11, 'en', '{\"column_1\": [{\"url\": \"http://localhost:8000/page/about-us\", \"title\": \"About Us\", \"sort_order\": \"1\"}, {\"url\": \"http://localhost:8000/contact-us\", \"title\": \"Contact Us\", \"sort_order\": \"2\"}, {\"url\": \"http://localhost:8000/page/customer-service\", \"title\": \"Customer Service\", \"sort_order\": \"3\"}, {\"url\": \"http://localhost:8000/page/whats-new\", \"title\": \"What\'s New\", \"sort_order\": \"4\"}, {\"url\": \"http://localhost:8000/page/terms-of-use\", \"title\": \"Terms of Use\", \"sort_order\": \"5\"}, {\"url\": \"http://localhost:8000/page/terms-conditions\", \"title\": \"Terms & Conditions\", \"sort_order\": \"6\"}], \"column_2\": [{\"url\": \"http://localhost:8000/page/privacy-policy\", \"title\": \"Privacy Policy\", \"sort_order\": \"1\"}, {\"url\": \"http://localhost:8000/page/payment-policy\", \"title\": \"Payment Policy\", \"sort_order\": \"2\"}, {\"url\": \"http://localhost:8000/page/shipping-policy\", \"title\": \"Shipping Policy\", \"sort_order\": \"3\"}, {\"url\": \"http://localhost:8000/page/refund-policy\", \"title\": \"Refund Policy\", \"sort_order\": \"4\"}, {\"url\": \"http://localhost:8000/page/return-policy\", \"title\": \"Return Policy\", \"sort_order\": \"5\"}]}');
INSERT INTO `theme_customization_translations` VALUES (12, 12, 'en', '{\"services\": [{\"title\": \"Free Shipping\", \"description\": \"Enjoy free shipping on all orders\", \"service_icon\": \"icon-truck\"}, {\"title\": \"Product Replace\", \"description\": \"Easy Product Replacement Available!\", \"service_icon\": \"icon-product\"}, {\"title\": \"24/7 Support\", \"description\": \"Dedicated 24/7 support via chat and email\", \"service_icon\": \"icon-support\"}]}');
INSERT INTO `theme_customization_translations` VALUES (13, 13, 'en', '{\"images\": [{\"link\": \"\", \"image\": \"storage/theme/13/femV3zOw89z4YGHGMNrGthWwTIdFXIU6f0ImHL8o.webp\", \"title\": \"Recycle and Trade\"}]}');

-- ----------------------------
-- Table structure for theme_customizations
-- ----------------------------
DROP TABLE IF EXISTS `theme_customizations`;
CREATE TABLE `theme_customizations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `theme_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'default',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `channel_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `theme_customizations_channel_id_foreign`(`channel_id` ASC) USING BTREE,
  CONSTRAINT `theme_customizations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of theme_customizations
-- ----------------------------
INSERT INTO `theme_customizations` VALUES (1, 'default', 'image_carousel', 'Image Carousel', 1, 0, 1, '2025-04-13 19:52:27', '2025-04-15 20:07:23');
INSERT INTO `theme_customizations` VALUES (2, 'default', 'static_content', 'Offer Information', 2, 1, 1, '2025-04-13 19:52:27', '2025-04-15 21:22:24');
INSERT INTO `theme_customizations` VALUES (3, 'default', 'category_carousel', 'Categories Collections', 3, 1, 1, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `theme_customizations` VALUES (4, 'default', 'product_carousel', 'New Products', 4, 1, 1, '2025-04-13 19:52:27', '2025-04-15 20:20:38');
INSERT INTO `theme_customizations` VALUES (5, 'default', 'static_content', 'Top Collections', 5, 1, 1, '2025-04-13 19:52:27', '2025-04-16 20:19:40');
INSERT INTO `theme_customizations` VALUES (6, 'default', 'static_content', 'Bold Collections', 6, 1, 1, '2025-04-13 19:52:27', '2025-04-15 21:33:27');
INSERT INTO `theme_customizations` VALUES (7, 'default', 'product_carousel', 'Featured Collections', 7, 1, 1, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `theme_customizations` VALUES (8, 'default', 'static_content', 'Game Container', 8, 1, 1, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `theme_customizations` VALUES (9, 'default', 'product_carousel', 'All Products', 9, 1, 1, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `theme_customizations` VALUES (10, 'default', 'static_content', 'Bold Collections', 10, 1, 1, '2025-04-13 19:52:27', '2025-04-13 19:52:27');
INSERT INTO `theme_customizations` VALUES (11, 'default', 'footer_links', 'Footer Links', 11, 1, 1, '2025-04-13 19:52:27', '2025-04-15 21:20:06');
INSERT INTO `theme_customizations` VALUES (12, 'default', 'services_content', 'Services Content', 12, 1, 1, '2025-04-13 19:52:27', '2025-04-15 20:18:58');
INSERT INTO `theme_customizations` VALUES (13, 'default', 'image_carousel', 'admin', 1, 1, 1, '2025-04-14 19:08:08', '2025-04-15 20:41:04');

-- ----------------------------
-- Table structure for url_rewrites
-- ----------------------------
DROP TABLE IF EXISTS `url_rewrites`;
CREATE TABLE `url_rewrites`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of url_rewrites
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for visits
-- ----------------------------
DROP TABLE IF EXISTS `visits`;
CREATE TABLE `visits`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `request` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `url` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `referer` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `languages` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `useragent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `headers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `device` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `platform` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `browser` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `visitable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `visitable_id` bigint UNSIGNED NULL DEFAULT NULL,
  `visitor_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `visitor_id` bigint UNSIGNED NULL DEFAULT NULL,
  `channel_id` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `visits_visitable_type_visitable_id_index`(`visitable_type` ASC, `visitable_id` ASC) USING BTREE,
  INDEX `visits_visitor_type_visitor_id_index`(`visitor_type` ASC, `visitor_id` ASC) USING BTREE,
  INDEX `visits_channel_id_foreign`(`channel_id` ASC) USING BTREE,
  CONSTRAINT `visits_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of visits
-- ----------------------------
INSERT INTO `visits` VALUES (1, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Brave\\\";v=\\\"135\\\", \\\"Not-A.Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"135\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8\"],\"sec-gpc\":[\"1\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"dark_mode=1; XSRF-TOKEN=eyJpdiI6IjlERGVhSWNncHpYTGk4T2dhNU1Ubmc9PSIsInZhbHVlIjoiQTUvaVBrNStRVWRWSFZyazNaQVNKOXo1SGRHN3RxTFNEUTgxQmkyQ2lQZzlpSDc2ZHlFbzJmSmtCeG1PbFBPUWx2TmNPeTFqK09tZWExNTBTTG1VREM4Y3Q4ZE9ubGlSYW5Scjlzc0V5cHpXYlJ5a1l0S3YycWNwYTl5eGVCSSsiLCJtYWMiOiJhODdiN2RhNmZjNjE3MjY1MDhhYjhkNjExYzRhMDJlMWEyNWZmMTM2ZTU0MDliYmI2MTE1MzhlZTRjNmVjOTYwIiwidGFnIjoiIn0%3D; greenrevolution_session=eyJpdiI6IjcxTTlHRG1YSjd0dTk0NjhNSjFxcVE9PSIsInZhbHVlIjoiWk41cHB5QzQ1eEFmSEx5WTdSQ2M5ZUJZQnJSUVNrSW1DckNnSHFUS25tNVUrODYwQ3I2b3VLN3EwOVNtZzMyU3M2aEpuYXlkWW1EWXJCcDd0TUdmUU9lb00xL29GQUUrREpNZnhwRUljTkRnZnRPcS9SVk9DZE1ydDFqSGRXM0IiLCJtYWMiOiJkNmZjZWUzMTI4YTQyNDdhNDdmZWQ3MzFhMDM0NTI4MTZjNzIxYmQ0YzkzOWIwMGJmZmU4ZTNjNWQwYzYyNzExIiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-04-13 19:55:06', '2025-04-13 19:55:06');
INSERT INTO `visits` VALUES (2, 'GET', '[]', 'http://localhost:8000', NULL, '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Brave\\\";v=\\\"135\\\", \\\"Not-A.Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"135\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8\"],\"sec-gpc\":[\"1\"],\"accept-language\":[\"en-US,en;q=0.8\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"]}', '', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-04-14 18:28:15', '2025-04-14 18:28:15');
INSERT INTO `visits` VALUES (3, 'GET', '[]', 'http://localhost:8000', NULL, '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Brave\\\";v=\\\"135\\\", \\\"Not-A.Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"135\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8\"],\"sec-gpc\":[\"1\"],\"accept-language\":[\"en-US,en;q=0.8\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"cookie\":[\"dark_mode=0\"]}', '', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-04-15 19:26:03', '2025-04-15 19:26:03');
INSERT INTO `visits` VALUES (4, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:137.0) Gecko/20100101 Firefox/137.0', '{\"host\":[\"127.0.0.1:8000\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:137.0) Gecko\\/20100101 Firefox\\/137.0\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8\"],\"accept-language\":[\"en-US,en;q=0.5\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"dnt\":[\"1\"],\"sec-gpc\":[\"1\"],\"connection\":[\"keep-alive\"],\"upgrade-insecure-requests\":[\"1\"],\"sec-fetch-dest\":[\"document\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-user\":[\"?1\"],\"priority\":[\"u=0, i\"]}', '', 'Windows', 'Firefox', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-04-15 19:59:29', '2025-04-15 19:59:29');
INSERT INTO `visits` VALUES (5, 'GET', '[]', 'http://127.0.0.1:8000/placeholder.svg', 'http://127.0.0.1:8000/products/men', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Brave\\\";v=\\\"135\\\", \\\"Not-A.Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"135\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-gpc\":[\"1\"],\"accept-language\":[\"en-US,en;q=0.6\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/products\\/men\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"]}', '', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-04-15 20:11:03', '2025-04-15 20:11:03');
INSERT INTO `visits` VALUES (6, 'GET', '[]', 'http://127.0.0.1:8000/&', 'http://127.0.0.1:8000/', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:137.0) Gecko/20100101 Firefox/137.0', '{\"host\":[\"127.0.0.1:8000\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:137.0) Gecko\\/20100101 Firefox\\/137.0\"],\"accept\":[\"text\\/css,*\\/*;q=0.1\"],\"accept-language\":[\"en-US,en;q=0.5\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"dnt\":[\"1\"],\"sec-gpc\":[\"1\"],\"connection\":[\"keep-alive\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6InRUbXpWQWFHWGRMVjJjOEtUTnJyMkE9PSIsInZhbHVlIjoiQkdhKzI4UFdQTk16clJJMVRPdTAxKzdSd0k3NTlzb0NtbzBuU21PcWNFdjlHNkhFejlwQUM3ZUVwMjBTcmpZa2o2REo0ZFB3ckk4ai9QbnZiVDQyQi9GMjdMR3RtNE10ZGJjc2w0WXd1RUcxK2lIOWhOR2pianBqUXozTkZWOU4iLCJtYWMiOiI5MGNjZWYwYTUxZjA5NzBhMWEwOTJlMjgzMWNmZjE2OTc2ZGExMDJlNWQxYjUxN2UwOTMyNmZkNzI5OWZjNzFjIiwidGFnIjoiIn0%3D; greenrevolution_session=eyJpdiI6IktpcTNUTEN4MkFnQzNCLzhCaWZQZ3c9PSIsInZhbHVlIjoiZlFJZXIzcUMxejBHOG5OSzJCMEdNekt1Y1hCM1AwZVdpK3dDb25VZnFIR3dOQmY3UExOUFpOek9BUG9nVkVoS1FSVTBCa2dINi9CV25ibVFUUlpNOERieE9ZUnVEY29vZGZWd3psZVhRVk96NEtUUU5yVXAzanF2VVZWVVZFdmkiLCJtYWMiOiJkYTY1ODlhYzY2NGViOGI3ODM1ODQ5ZWUyNjIxZGMyOWJkNDA4OWYxZmI1MjBlNjc0MWUzMGNkYjFjMTg4OTVhIiwidGFnIjoiIn0%3D\"],\"sec-fetch-dest\":[\"style\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-site\":[\"same-origin\"],\"priority\":[\"u=2\"]}', '', 'Windows', 'Firefox', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-04-15 20:50:18', '2025-04-15 20:50:18');
INSERT INTO `visits` VALUES (7, 'GET', '[]', 'http://localhost:8000/&', 'http://localhost:8000/', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Brave\\\";v=\\\"135\\\", \\\"Not-A.Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"135\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"text\\/css,*\\/*;q=0.1\"],\"sec-gpc\":[\"1\"],\"accept-language\":[\"en-US,en;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"style\"],\"referer\":[\"http:\\/\\/localhost:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6Ik1jOWo0VDZvZlFtbG83bEtvOUZNSVE9PSIsInZhbHVlIjoidnU1cFhIam5hSlRoeFlQU2VCTllEQnB5VVM4MlV4U3dzSGF5Z1BjZ1YrL1FNQ3VhdTdUdnh3UE5EMU0wTXloZkNra2Y1OHAwdWJzN01HTGhvYXdOb2d5OU5Dcml1K3N3RytwTDNCaWt3cjh0MFVBQVFOUzQ2d1lFeVBUOEh5eUkiLCJtYWMiOiIxZTgyYWU5ZWEwODljODZjYzU3M2RkMzhmYzI5YzUxOTdjM2ZhYzljMjQ2ZWZmNjAxZDdiNzliNmNmZTVhODk0IiwidGFnIjoiIn0%3D; greenrevolution_session=eyJpdiI6Im40TklKaVAyOWJKc2VlZVN5TVU4clE9PSIsInZhbHVlIjoiSDgxR3MzQnZsZS9QMit2RkpZQU1QWXBZb21jU28vUzl0aGNLdEFMdllWTmVvbVQvQTVuTVhGNHI5bHVNbHNrUXlMV0NWLzBzNlFqVS9rYnJFR0JBcE9memJJQkR6YU5PQ3RIM0lvYmVIR29mNms4SVd6N3huRzV3SWdVY25ENUEiLCJtYWMiOiIxYmUwY2Q4YzI3N2VhODQ2MTA0ZjNiNDgyZWVhNThhYWU5NWVmNzA1NGEyNWZjOTU2ZWExZDliOTBmZjAxNDFiIiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-04-15 20:55:32', '2025-04-15 20:55:32');
INSERT INTO `visits` VALUES (8, 'GET', '[]', 'http://localhost:8000', 'http://localhost:8000/customer/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8\"],\"sec-gpc\":[\"1\"],\"accept-language\":[\"en-US,en;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"sec-ch-ua\":[\"\\\"Brave\\\";v=\\\"135\\\", \\\"Not-A.Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"135\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"referer\":[\"http:\\/\\/localhost:8000\\/customer\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IkQzajRDVk5jRzI1Mmw1TG80bTM2ZlE9PSIsInZhbHVlIjoiK0F3aXhFb01XNWgxdmtlQ2hDNU5MSm9VbGRhemhuSklFendMWklyNlI1WW5PTUw3c1ZaU1FzN0xuWDJBQ1ZuZ2xiOHNRMGV1RCtta0o0Ymg1WnBoekhrSWZCczY0bjNxZDl1cjk5ZDE1NWMzcFZrOEZ0ei9ZazN3ZFp5bGJrejIiLCJtYWMiOiI0MDM5MzkzZmZiMTZmMmZiMGIxMjMxYjY1OTQ4ZjkzMmY3YTQ1YTVmM2M3ODVlY2M3NTI1MzQyOWVhM2ExYjRhIiwidGFnIjoiIn0%3D; greenrevolution_session=eyJpdiI6InJGQzhmeFpkRHRadVpvREN3L3ZjeHc9PSIsInZhbHVlIjoiVHhwWWZSV1lTM3Q3VTkwb1NiVUJLTXMzRkdnVXRXZ2did2pNSzNrSDNCSVE5dDlDYTBJNzNuaytDaDhyN2lTaHpYZTF6YTkwb1hBR2Q4MzFnUzFmeU1XSUJ4cmdZZktFbzdDWlhTai9nTVpyRUxQUEVXamgwYjhKeE5QRTRSMHkiLCJtYWMiOiJiNjNjYWFiYzk5YmQ1YTMxOThlZmY2ODRhOTMwNWZlZTM2NzA3ZGU0ZTViM2RhZWU3ZmQ2ZDM1YjcxZDdjOTgyIiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2025-04-15 21:23:54', '2025-04-15 21:23:54');
INSERT INTO `visits` VALUES (9, 'GET', '[]', 'http://localhost:8000', NULL, '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '{\"host\":[\"localhost:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Brave\\\";v=\\\"135\\\", \\\"Not-A.Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"135\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8\"],\"sec-gpc\":[\"1\"],\"accept-language\":[\"en-US,en;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"cookie\":[\"dark_mode=0\"]}', '', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-04-16 18:21:05', '2025-04-16 18:21:05');

-- ----------------------------
-- Table structure for wishlist
-- ----------------------------
DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE `wishlist`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `channel_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `item_options` json NULL,
  `moved_to_cart` date NULL DEFAULT NULL,
  `shared` tinyint(1) NULL DEFAULT NULL,
  `time_of_moving` date NULL DEFAULT NULL,
  `additional` json NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `wishlist_channel_id_foreign`(`channel_id` ASC) USING BTREE,
  INDEX `wishlist_product_id_foreign`(`product_id` ASC) USING BTREE,
  INDEX `wishlist_customer_id_foreign`(`customer_id` ASC) USING BTREE,
  CONSTRAINT `wishlist_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `wishlist_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wishlist
-- ----------------------------

-- ----------------------------
-- Table structure for wishlist_items
-- ----------------------------
DROP TABLE IF EXISTS `wishlist_items`;
CREATE TABLE `wishlist_items`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `channel_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `additional` json NULL,
  `moved_to_cart` date NULL DEFAULT NULL,
  `shared` tinyint(1) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `wishlist_items_channel_id_foreign`(`channel_id` ASC) USING BTREE,
  INDEX `wishlist_items_product_id_foreign`(`product_id` ASC) USING BTREE,
  INDEX `wishlist_items_customer_id_foreign`(`customer_id` ASC) USING BTREE,
  CONSTRAINT `wishlist_items_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `wishlist_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `wishlist_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wishlist_items
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

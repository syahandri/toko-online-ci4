/*
 Navicat Premium Data Transfer

 Source Server         : webstore
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : webstore

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 07/06/2022 09:52:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `jalan` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kecamatan` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kabupaten` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `provinsi` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kode_kabupaten` int UNSIGNED NOT NULL,
  `kode_provinsi` int UNSIGNED NOT NULL,
  `kode_pos` int UNSIGNED NOT NULL,
  `flags` bit(1) NOT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, 2, 'Jln. ABC No. 6, Kebogadung, RT 05 / RW 02', 'Jatibarang', 'Brebes', 'Jawa Tengah', 92, 10, 52261, b'1', '2006-09-30 22:20:33', '2022-06-07 09:39:25');
INSERT INTO `address` VALUES (2, 3, 'Jln. XYZ No. 7, Kebogadung, RT 02 / RW 05', 'Jatibarang', 'Brebes', 'Jawa Tengah', 92, 10, 52261, b'1', '1975-03-24 03:22:37', '2022-06-07 09:39:25');

-- ----------------------------
-- Table structure for auth_activation_attempts
-- ----------------------------
DROP TABLE IF EXISTS `auth_activation_attempts`;
CREATE TABLE `auth_activation_attempts`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_activation_attempts
-- ----------------------------
INSERT INTO `auth_activation_attempts` VALUES (1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.63 Safari/537.36 Edg/102.0.1245.33', '77a973312d1e6dc87855595bc1402555', '2022-06-07 09:40:53');

-- ----------------------------
-- Table structure for auth_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_groups`;
CREATE TABLE `auth_groups`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_groups
-- ----------------------------
INSERT INTO `auth_groups` VALUES (1, 'admin', 'administrator');
INSERT INTO `auth_groups` VALUES (2, 'member', 'member user');
INSERT INTO `auth_groups` VALUES (3, 'user', 'reguler user');

-- ----------------------------
-- Table structure for auth_groups_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_groups_permissions`;
CREATE TABLE `auth_groups_permissions`  (
  `group_id` int UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int UNSIGNED NOT NULL DEFAULT 0,
  INDEX `auth_groups_permissions_permission_id_foreign`(`permission_id`) USING BTREE,
  INDEX `group_id_permission_id`(`group_id`, `permission_id`) USING BTREE,
  CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_groups_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_groups_users
-- ----------------------------
DROP TABLE IF EXISTS `auth_groups_users`;
CREATE TABLE `auth_groups_users`  (
  `group_id` int UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int UNSIGNED NOT NULL DEFAULT 0,
  INDEX `auth_groups_users_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `group_id_user_id`(`group_id`, `user_id`) USING BTREE,
  CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_groups_users
-- ----------------------------
INSERT INTO `auth_groups_users` VALUES (1, 1);
INSERT INTO `auth_groups_users` VALUES (3, 2);

-- ----------------------------
-- Table structure for auth_logins
-- ----------------------------
DROP TABLE IF EXISTS `auth_logins`;
CREATE TABLE `auth_logins`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int UNSIGNED NULL DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `email`(`email`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_logins
-- ----------------------------
INSERT INTO `auth_logins` VALUES (1, '::1', 'userbaru@gmail.com', 2, '2022-06-07 09:41:03', 1);
INSERT INTO `auth_logins` VALUES (2, '::1', 'admin@gmail.com', 1, '2022-06-07 09:43:40', 1);
INSERT INTO `auth_logins` VALUES (3, '::1', 'userbaru@gmail.com', 2, '2022-06-07 09:45:14', 1);
INSERT INTO `auth_logins` VALUES (4, '::1', 'admin@gmail.com', 1, '2022-06-07 09:46:57', 1);
INSERT INTO `auth_logins` VALUES (5, '::1', 'userbaru@gmail.com', 2, '2022-06-07 09:48:58', 1);
INSERT INTO `auth_logins` VALUES (6, '::1', 'admin', NULL, '2022-06-07 09:50:21', 0);
INSERT INTO `auth_logins` VALUES (7, '::1', 'admin@gmail.com', 1, '2022-06-07 09:50:29', 1);

-- ----------------------------
-- Table structure for auth_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_permissions`;
CREATE TABLE `auth_permissions`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_reset_attempts
-- ----------------------------
DROP TABLE IF EXISTS `auth_reset_attempts`;
CREATE TABLE `auth_reset_attempts`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_reset_attempts
-- ----------------------------

-- ----------------------------
-- Table structure for auth_tokens
-- ----------------------------
DROP TABLE IF EXISTS `auth_tokens`;
CREATE TABLE `auth_tokens`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `selector` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hashedValidator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_tokens_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `selector`(`selector`) USING BTREE,
  CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for auth_users_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_users_permissions`;
CREATE TABLE `auth_users_permissions`  (
  `user_id` int UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int UNSIGNED NOT NULL DEFAULT 0,
  INDEX `auth_users_permissions_permission_id_foreign`(`permission_id`) USING BTREE,
  INDEX `user_id_permission_id`(`user_id`, `permission_id`) USING BTREE,
  CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_users_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for cancel_orders
-- ----------------------------
DROP TABLE IF EXISTS `cancel_orders`;
CREATE TABLE `cancel_orders`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `product` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `color` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `size` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `flags` bit(1) NOT NULL DEFAULT b'0',
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cancel_orders
-- ----------------------------

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carts
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `slug`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Aksesoris', 'aksesoris', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `categories` VALUES (2, 'Jaket', 'jaket', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `categories` VALUES (3, 'Celana', 'celana', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `categories` VALUES (4, 'Kaos', 'kaos', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `categories` VALUES (5, 'Kemeja', 'kemeja', '2022-06-07 09:38:47', '2022-06-07 09:38:47');

-- ----------------------------
-- Table structure for checkouts
-- ----------------------------
DROP TABLE IF EXISTS `checkouts`;
CREATE TABLE `checkouts`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `courier` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shipping_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `estimate_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cost` int UNSIGNED NOT NULL,
  `total` bigint UNSIGNED NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Pending',
  `resi_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jalan` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kecamatan` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kabupaten` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `provinsi` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kode_pos` int UNSIGNED NOT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of checkouts
-- ----------------------------
INSERT INTO `checkouts` VALUES (1, 'ONKHT202206070941512', 2, 'jne', 'Ongkos Kirim Ekonomis', '3-6', 108000, 2860224, 'Sending', 'RESI12345', 'Jln. ABC No. 6, Kebogadung, RT 05 / RW 02', 'Jatibarang', 'Brebes', 'Jawa Tengah', 52261, '2022-06-07 09:41:51', '2022-06-07 09:44:35');
INSERT INTO `checkouts` VALUES (2, '6M4PN202206070945532', 2, 'pos', 'Paket Kilat Khusus', '2 HARI', 159600, 559045, 'Sending', 'RESI12345', 'Jln. ABC No. 6, Kebogadung, RT 05 / RW 02', 'Jatibarang', 'Brebes', 'Jawa Tengah', 52261, '2022-06-07 09:45:53', '2022-06-07 09:47:38');
INSERT INTO `checkouts` VALUES (3, '1GZNC202206070949422', 2, 'jne', 'Ongkos Kirim Ekonomis', '3-6', 168000, 534879, 'Sending', 'RESI12345', 'Jln. ABC No. 6, Kebogadung, RT 05 / RW 02', 'Jatibarang', 'Brebes', 'Jawa Tengah', 52261, '2022-06-07 09:49:42', '2022-06-07 09:51:21');

-- ----------------------------
-- Table structure for colors
-- ----------------------------
DROP TABLE IF EXISTS `colors`;
CREATE TABLE `colors`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of colors
-- ----------------------------
INSERT INTO `colors` VALUES (1, 'black', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (2, 'navy', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (3, 'blue', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (4, 'darkgreen', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (5, 'green', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (6, 'teal', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (7, 'deepskyblue', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (8, 'lime', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (9, 'indigo', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (10, 'maroon', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (11, 'purple', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (12, 'gray', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (13, 'grey', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (14, 'darkred', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (15, 'brown', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (16, 'salmon', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (17, 'red', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (18, 'deeppink', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (19, 'orangered', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (20, 'hotpink', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (21, 'orange', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (22, 'lightpink', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (23, 'pink', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (24, 'gold', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (25, 'yellow', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `colors` VALUES (26, 'white', '2022-06-07 09:38:47', '2022-06-07 09:38:47');

-- ----------------------------
-- Table structure for confirms
-- ----------------------------
DROP TABLE IF EXISTS `confirms`;
CREATE TABLE `confirms`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bank` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image_transfer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of confirms
-- ----------------------------
INSERT INTO `confirms` VALUES (1, 'ONKHT202206070941512', 2, 'User Baru', 'MANDIRI', '1654569788_3d6a7a2f0e9ff6cbb56c.jpg', '2022-06-07 09:43:14', '2022-06-07 09:43:14');
INSERT INTO `confirms` VALUES (2, '6M4PN202206070945532', 2, 'User Baru', 'BCA', '1654569975_b542f35faac6270b157b.jpg', '2022-06-07 09:46:24', '2022-06-07 09:46:24');
INSERT INTO `confirms` VALUES (3, '1GZNC202206070949422', 2, 'User Baru', 'BCA', '1654570200_c30e474d9172291f0ff8.jpg', '2022-06-07 09:50:06', '2022-06-07 09:50:06');

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'event.jpg',
  `published` bit(1) NOT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO `events` VALUES (1, 'Ratione et.', 'ratione-et.', 'Quo et aperiam id odio molestias. Quaerat eum odio et sit velit. Beatae nemo vel id praesentium rerum earum voluptate.\n\nPossimus in sequi rerum eaque magnam consequatur possimus. Quae esse dolorum harum occaecati.\n\nMinima sit autem assumenda est facilis enim quo. Rerum aliquam sint nisi non. Nulla blanditiis occaecati adipisci praesentium minima omnis numquam. Et rerum blanditiis similique natus in maiores.\n\nAlias perferendis similique eos porro doloremque fugiat. Enim qui quibusdam mollitia laudantium. Expedita excepturi reprehenderit voluptas sit non et. Dolores vel non sequi architecto maiores consequatur.\n\nEt sed sed illum natus. Velit soluta repellat consequuntur nihil quam. Iusto sed quas quae et enim culpa. Est eos voluptas sed repellat dolorum id reprehenderit.\n\nEt non voluptas ipsa rerum excepturi. Et nulla excepturi nostrum non corporis mollitia unde. Rerum tempore qui id et. Totam et cupiditate est distinctio nihil similique et.\n\nQuos incidunt corrupti laudantium quibusdam ut enim dolore perferendis. Temporibus quis iure consequatur quo quisquam necessitatibus. Dolor consectetur modi quis repudiandae quibusdam repellat.\n\nEt labore quia ut laborum. Ratione aliquam tempore sit deserunt. Minima tenetur maxime odio amet mollitia. Placeat nulla est non iste earum optio sint.\n\nIpsam ad quis libero odit odit unde deserunt. Sed quos mollitia voluptas et quibusdam odio mollitia. Illo esse excepturi et et. Dicta ut occaecati qui incidunt magni consequatur voluptatum rerum.\n\nVeritatis placeat deleniti et velit quas nostrum quidem. Fugiat molestiae voluptas cum ad aut officiis eveniet. Est quis vero impedit est.', 'event.jpg', b'1', '1978-04-05', '1978-04-06', '2003-02-08 10:29:07', '2012-09-06 12:19:17');
INSERT INTO `events` VALUES (2, 'Et et dolores.', 'et-et-dolores.', 'Tempora est temporibus quia unde. Est sint quo quaerat asperiores qui quia. Dolorum iste commodi exercitationem voluptas eos dolor.\n\nQui eum quia tenetur laborum expedita alias corporis. Quisquam distinctio fuga quis veniam et qui similique. Adipisci unde nulla et sit id dicta. Consequuntur itaque est est commodi adipisci officiis.\n\nRem expedita exercitationem vero quod mollitia. Animi repellendus aspernatur magnam a provident quasi. Perferendis et quia harum et quae adipisci. Reprehenderit distinctio illo consequatur dignissimos quo.\n\nRerum officiis architecto dolorem eveniet. Quos quia aperiam tempore. Asperiores ea qui nemo architecto adipisci nostrum quis. Id qui ut exercitationem illum et voluptas dolor. Autem odio expedita ut natus quae perspiciatis voluptatum.\n\nRecusandae quia sapiente et voluptate assumenda. Rerum tempora quam eos dicta aliquid. Dolore tempora vitae velit est est perspiciatis.\n\nSimilique rerum qui laboriosam quia. Nostrum nostrum non quam necessitatibus et dolore. Sapiente alias consectetur eum nisi placeat minima.\n\nConsequatur esse nostrum perferendis voluptatem dolores molestiae impedit. Praesentium libero error commodi voluptate. Nemo natus ab iure dolorum. Sequi quis voluptatem consectetur aperiam provident sint qui.\n\nConsectetur rem aliquid odio nostrum excepturi. Molestiae voluptatem omnis dolores sit et voluptates amet ad. Ex reprehenderit et impedit et atque porro inventore reiciendis.\n\nEst sapiente sed odit velit repudiandae ut. Ipsum ea dignissimos eos illum nesciunt expedita est. Doloremque quisquam porro est consequatur.\n\nExcepturi consequatur quidem quibusdam dolore. Explicabo sed eos soluta non autem qui id. Et vel dolor consequatur doloribus qui. Nihil cum incidunt enim dolorum.', 'event.jpg', b'1', '1996-02-14', '1996-02-15', '1994-01-20 17:44:54', '2016-05-15 08:35:48');
INSERT INTO `events` VALUES (3, 'In omnis quod.', 'in-omnis-quod.', 'Dignissimos atque expedita voluptas aliquid illum. Dolores debitis sunt occaecati maiores odit quidem. Sed cumque vitae omnis reprehenderit a. Voluptas sunt dolores quo aut officiis quis fugit.\n\nHic maiores iste nihil. Ut vero sapiente expedita exercitationem. Qui similique pariatur omnis officiis cumque natus quisquam. Aut necessitatibus nam deserunt.\n\nHic ab tempore expedita et numquam. Quod dolores maxime sint ut et eos deserunt itaque. Labore eum natus quasi.\n\nQuia et sint et ducimus pariatur. Dicta sed nulla dignissimos blanditiis porro labore aliquam ea. Veniam placeat explicabo voluptas eum.\n\nNemo dolor consequatur eos aut mollitia aspernatur eius. Sed sit quisquam sint est modi labore. Quia saepe aut accusantium officiis maiores aliquid.\n\nNihil doloremque tempora corporis ratione harum placeat. Esse ratione aliquid dolorem culpa. Ea non explicabo itaque saepe placeat tempora hic. Vel accusantium quibusdam totam debitis sequi omnis.\n\nQuibusdam ullam maiores accusantium dolorem mollitia. Doloribus quisquam labore cumque voluptate qui aliquam corrupti. Ea unde temporibus reprehenderit corrupti omnis. Eligendi quas velit voluptatibus corrupti dicta. Officia rem officiis voluptatem aut quae.\n\nError et iste nisi quia eligendi fuga facere. Adipisci qui vel quo ut voluptates ut. Placeat eius consequatur adipisci sit hic quam odio. In iste impedit voluptas eius consequatur distinctio voluptas.\n\nNon rerum rem reiciendis quisquam ea labore saepe vero. Omnis nam molestiae ut quidem maiores.\n\nNesciunt quasi cupiditate minima doloribus. Ut dicta labore eius natus illum qui sequi. Nulla perferendis at sapiente earum excepturi.', 'event.jpg', b'0', '1998-08-15', '1998-08-16', '2005-04-03 14:30:30', '2010-10-01 11:53:46');
INSERT INTO `events` VALUES (4, 'Qui ipsum incidunt.', 'qui-ipsum-incidunt.', 'Eaque quasi mollitia quaerat unde quia voluptatem dolorem. Nostrum vitae inventore quae at corrupti suscipit. Debitis facilis laboriosam sit dolores eum. Enim autem labore consequatur maiores eligendi aut sunt.\n\nImpedit amet nesciunt incidunt suscipit tempora possimus optio distinctio. Voluptates consequatur accusantium sequi veritatis ea enim.\n\nId hic nobis nam cum occaecati. Iusto necessitatibus suscipit voluptatem nemo quo et sed. Delectus nulla et facilis facere vel animi. Non quis nihil veniam quo.\n\nMolestiae dicta enim alias velit exercitationem. Aperiam suscipit reprehenderit harum vitae exercitationem rerum. Corrupti sit reiciendis in molestiae ab debitis. Aut ipsa odio consequatur veniam velit ut quibusdam.\n\nCumque iusto architecto sunt nulla tenetur est reprehenderit sint. Nulla ratione similique odio fugiat sapiente illo soluta. Sit similique minus praesentium adipisci mollitia velit.\n\nNesciunt voluptatibus ut expedita fugit dolorem consequatur. Sed eius ex delectus error quidem placeat deleniti voluptas. Maiores et inventore ut quas. Ut sit sit ipsa quia sapiente et dolores et.\n\nEt voluptas doloribus atque beatae aut. Et recusandae ut sit debitis odio voluptates. Maiores vitae et aut libero eveniet eligendi. Quidem aut numquam velit unde in nam molestiae.\n\nExplicabo vitae illo tempore fugit et eius quo. Voluptates itaque et consequuntur ut iusto. Reprehenderit aut natus qui. Expedita maiores explicabo eum nisi eum atque.\n\nIure recusandae maiores numquam et. Dolore est quae qui eos qui. Voluptas quos aut molestiae vel voluptates est. Corrupti nemo molestias fugiat non repudiandae et.\n\nNumquam dolores eos corporis ut eos. Autem asperiores quia aspernatur inventore. Cumque ea consectetur voluptatem ut ea eligendi. Natus officiis quia voluptas est ut. Fuga non sit rem praesentium et iste.', 'event.jpg', b'1', '1992-08-20', '1992-08-21', '1993-05-15 11:56:11', '1974-10-16 07:03:20');
INSERT INTO `events` VALUES (5, 'At quasi quod.', 'at-quasi-quod.', 'Et aut consequuntur illum ea numquam distinctio. Provident corrupti doloribus deleniti. Deserunt necessitatibus atque culpa et nihil quos eos. Cupiditate et repellat et eos iste.\n\nSoluta aspernatur ea suscipit blanditiis. Et veritatis modi maxime asperiores aliquid et et est. Aliquid enim asperiores repellat rerum voluptas. Suscipit velit est quam repellendus recusandae nam beatae.\n\nBlanditiis minus sunt et sequi non minima vitae. Quaerat iusto architecto vel quo. Voluptas necessitatibus et debitis iure. Animi impedit aut rerum error blanditiis.\n\nAut consequatur quo atque. Eos aut nobis dolorum architecto rerum consequatur.\n\nQuia architecto quo rerum a praesentium. Et doloribus maxime molestias ratione. Sit consequatur nesciunt quaerat error. Sit commodi libero necessitatibus nam velit.\n\nEst et voluptatem earum officiis. Ab et libero sed aspernatur. Incidunt et qui nesciunt officiis veritatis. Accusamus est omnis quo quisquam officiis at.\n\nRepudiandae sequi reiciendis alias fuga vel fugiat sit. Ipsum accusantium ad dolores reprehenderit quas aliquid porro.\n\nTemporibus quae earum in qui debitis qui sit. Rerum eum nostrum tempore quo veritatis dolorum nesciunt. Rerum impedit aut accusantium eius nihil recusandae.\n\nNatus aperiam cumque eos. Architecto ut quos nesciunt enim autem. Et labore numquam sit quae et temporibus aliquid.\n\nVel quaerat accusamus aut quas. Delectus temporibus nihil est quis cum consequatur et. Neque reprehenderit ut natus eaque a natus at.', 'event.jpg', b'1', '2014-02-04', '2014-02-05', '2003-01-19 09:46:18', '1990-09-20 16:49:14');
INSERT INTO `events` VALUES (6, 'Deleniti dolorum voluptates.', 'deleniti-dolorum-voluptates.', 'Quidem ut non illum exercitationem. Consequatur voluptas aut culpa quis dolorem blanditiis ut. Aut et vel temporibus qui quos.\n\nQui quidem est modi id recusandae est necessitatibus ut. Quas natus eligendi vero tempore. Qui natus aspernatur ut nulla.\n\nOfficia saepe officia suscipit hic. Hic perferendis voluptatem ratione distinctio molestias. Accusamus maxime iste et dolorem repudiandae unde ut. Et sint dolor nihil ut. Architecto soluta ut saepe commodi tenetur commodi soluta.\n\nEos aut qui a et voluptatem. Dicta dolorum ut est odit. Consequatur perspiciatis unde blanditiis minima libero autem cum doloremque.\n\nId voluptates nisi dolorum. Esse similique dignissimos architecto culpa assumenda facere. Sed accusamus illo eaque fuga.\n\nMaiores animi impedit natus sit alias autem et. Quia repellat ratione facere recusandae.\n\nPerspiciatis voluptatem minima voluptatem voluptatem sapiente blanditiis sunt mollitia. Pariatur temporibus occaecati sit nihil ullam. Quas facere eveniet in magnam ullam et perferendis.\n\nLibero vitae maiores illum non. Explicabo id hic deserunt architecto. In quia voluptatem ab velit quia atque autem.\n\nVel iste et aperiam laboriosam est quidem adipisci. Nostrum laborum praesentium libero reiciendis et dolores. Quo architecto voluptas modi cumque vitae et deleniti.\n\nVoluptatem laboriosam sit quae dolor quae nobis voluptatem delectus. Fugit sed est porro illo. Corporis aut sed nisi ut.', 'event.jpg', b'1', '2001-04-09', '2001-04-10', '2015-07-03 15:26:19', '1974-09-09 18:10:23');
INSERT INTO `events` VALUES (7, 'Culpa expedita magnam repudiandae.', 'culpa-expedita-magnam-repudiandae.', 'Nobis labore reprehenderit rerum et aliquam quae quae. Rerum cupiditate rerum cumque magnam cum. Maxime magni sapiente quibusdam nemo qui vitae. Amet atque veniam ipsum ipsam ducimus non optio hic. Optio reiciendis ipsam quo consequatur tenetur non.\n\nPossimus accusantium libero totam tempora necessitatibus eos eos. Amet non illum magnam nobis. Voluptatem aliquam voluptates dolores aut impedit quisquam. Voluptate ipsa et amet id.\n\nDucimus beatae est et corrupti eveniet aut. Alias qui quas molestiae consequatur. Corrupti et eius quis molestiae eos sint pariatur.\n\nCum illo et numquam. Unde expedita impedit corrupti omnis eum et itaque. Quibusdam molestias illum et voluptas. Nulla sit saepe voluptate pariatur ab amet.\n\nSimilique est facilis illum totam. Aut vel ex ipsa facilis et. Vel cum qui voluptatem dolores.\n\nCulpa aut aut et. Vitae ut aut quos mollitia quia sed architecto. Explicabo natus unde reiciendis aut velit.\n\nMolestias labore aut nisi et voluptatem ratione laboriosam sit. Quas fuga voluptatem officiis. Repellendus vel assumenda excepturi et qui fugiat quas.\n\nAutem recusandae perspiciatis rerum atque praesentium. Eveniet soluta repellat voluptas. Unde reiciendis nulla laborum eius ut aperiam tempora.\n\nOfficia ab ea eos similique temporibus. Doloribus repellat earum non voluptatem iure officia. Magni quas nihil exercitationem deleniti.\n\nIste omnis et sed id et facere voluptate dolores. Quis nihil cumque deleniti aut tempore dolore. Ipsum voluptatem nihil laborum laudantium. Nostrum minima totam ad.', 'event.jpg', b'1', '2002-04-06', '2002-04-07', '2003-03-19 16:57:06', '1993-06-18 02:53:46');
INSERT INTO `events` VALUES (8, 'Consectetur consequuntur.', 'consectetur-consequuntur.', 'Et quis fugiat doloribus eum ipsam. Non occaecati consequatur illo rerum sint. Iste in molestiae inventore.\n\nRatione magnam voluptatem qui est eos nemo dolores. Dolores occaecati dolor expedita et quia eligendi. Et corporis doloribus minus id.\n\nAutem non enim dicta voluptas accusantium quibusdam numquam. Quia corrupti voluptatem veritatis commodi. Nobis ab saepe et voluptatem itaque iure dolore. Maiores est nihil vel enim quidem.\n\nDeleniti suscipit nulla atque. Expedita ut optio dolorem fugit dolor mollitia. Quisquam repudiandae quod vitae consequatur accusantium.\n\nTempora reiciendis temporibus ab. Ducimus explicabo veniam ea est. Quasi qui tempore sed at sit est eius.\n\nDucimus officia illum necessitatibus soluta dolore aut. Doloremque eos et qui temporibus officia quis sed. Dolorum odit dicta dolorem cumque. Et voluptatem doloribus excepturi est aut corrupti.\n\nEarum ut doloribus aut iste voluptate. Consectetur ab doloremque maiores magnam. Illum provident nihil nihil consectetur et.\n\nUt atque assumenda adipisci voluptatem numquam sunt fugiat. Molestiae dolores ab explicabo sit architecto rem dolorem. Molestiae sunt velit occaecati voluptatem minus aut vitae. Similique excepturi reprehenderit totam voluptate veritatis qui.\n\nConsequatur amet dolore facere. Voluptatem omnis est illum velit nesciunt. Dolor error commodi necessitatibus nostrum sint ut.\n\nBlanditiis inventore odio quas et nam est. Voluptas fuga quis porro aut alias. Aut dicta enim unde ut.', 'event.jpg', b'0', '1989-01-16', '1989-01-17', '2014-11-05 07:54:34', '1992-07-29 17:32:53');
INSERT INTO `events` VALUES (9, 'Non ad corporis laudantium.', 'non-ad-corporis-laudantium.', 'Ullam sit repellendus culpa eum quasi et ut quibusdam. Optio voluptatum totam quo dolores a omnis.\n\nNumquam qui corrupti tempora expedita. Et quo eveniet quis quaerat reprehenderit. Ut labore quibusdam non dolorem vero quos. Labore et dicta architecto.\n\nEa non officia temporibus. Voluptas incidunt veniam eos architecto non voluptatem reprehenderit. Tempore voluptatem dolores reprehenderit est laudantium. Nostrum praesentium ut aut debitis facilis.\n\nEx saepe qui aut corporis eius assumenda sequi. Nostrum voluptatem cupiditate itaque excepturi. Quis eum debitis ut laborum sit ut voluptatum. Ad aliquid cupiditate minima adipisci voluptatem esse.\n\nRepellat saepe ratione ipsum mollitia. Sequi velit itaque explicabo est. Quibusdam et vel aut ea. Est consequatur ea ducimus harum.\n\nNeque deserunt accusantium molestiae voluptas voluptate nisi consequatur molestiae. Facilis ad rerum nihil sequi ea ex quae. Error eos impedit accusantium quia.\n\nSed rerum totam ex. Dolorem ut ut numquam. Vitae recusandae quae suscipit quod. Et architecto officia iste beatae eveniet exercitationem. Sed iusto fugiat corrupti voluptatibus.\n\nVeniam quis iure nihil neque debitis eum reiciendis. Est doloremque autem ut sunt ullam. Eligendi saepe quia necessitatibus alias sint. Ducimus eaque eligendi et quod nostrum.\n\nAut aut facere ex voluptas dignissimos. Iste a magni consequuntur ad. Nobis odio voluptates ab temporibus doloremque. Ratione qui labore magni qui natus tempora dolores.\n\nNon pariatur voluptate amet est dicta distinctio hic. Sit harum aperiam numquam hic fugiat sit. Expedita ut voluptatem illum at quibusdam earum inventore.', 'event.jpg', b'0', '1971-12-28', '1971-12-29', '2016-11-01 03:59:02', '1995-06-11 16:54:03');
INSERT INTO `events` VALUES (10, 'Ipsa aspernatur suscipit.', 'ipsa-aspernatur-suscipit.', 'Quae vel nulla harum. Beatae sunt odio et rerum.\n\nHic aut autem inventore aliquam corrupti eum quia quod. Praesentium veritatis itaque consequatur et qui blanditiis. Repellat repellendus natus impedit.\n\nUllam deserunt molestias est architecto quia expedita ut dolore. Et quod aut quae necessitatibus explicabo neque voluptatem. Quis ut reprehenderit et vel nihil et. Ea sunt tempora accusamus vel ducimus voluptate hic.\n\nVeniam repudiandae ut eveniet rerum ut rerum. Tempora illum rerum qui expedita autem repudiandae. Mollitia a tempora quia asperiores.\n\nMagnam numquam quasi quae iste quae velit. Voluptatem dolorem molestiae voluptate sunt perferendis iure. Occaecati sequi molestias eum. Harum est ut qui quibusdam illum sunt dolores. Et nulla optio quis harum culpa possimus quod similique.\n\nIure eveniet provident corporis quasi dolorem ad. Cum neque dolorem qui. Velit ut fugiat deleniti occaecati iusto ratione aut aut.\n\nAssumenda laborum rem dolorem aliquid. Sint neque asperiores qui aut minus consequatur. Omnis fuga corporis sit maxime accusantium dolor praesentium et.\n\nNulla consequatur illo et in voluptatem. Fugiat id eum occaecati. Veniam sed sunt illum sit consectetur animi.\n\nQuidem corrupti beatae ut id recusandae. Aliquid nostrum aperiam facere pariatur dolores at. Hic id tempore quod numquam dolorum et. Soluta dignissimos at quisquam fugiat.\n\nConsequuntur molestiae dolorem dignissimos repellat mollitia. Harum et voluptas optio iure consequatur id perferendis et. Vel perferendis ducimus ut expedita architecto. Et error sunt qui eligendi ex eius nihil.', 'event.jpg', b'0', '2014-12-19', '2014-12-20', '1993-05-11 17:46:37', '2007-04-08 20:43:37');

-- ----------------------------
-- Table structure for historysales
-- ----------------------------
DROP TABLE IF EXISTS `historysales`;
CREATE TABLE `historysales`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stock` int NOT NULL,
  `sold` int NOT NULL,
  `tgl_transaksi` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of historysales
-- ----------------------------
INSERT INTO `historysales` VALUES (1, 'Et corrupti error repudiandae.', 100, 3, '2022-06-07 09:44:35');
INSERT INTO `historysales` VALUES (2, 'Dolorem voluptate voluptatem dolores.', 100, 3, '2022-06-07 09:44:35');
INSERT INTO `historysales` VALUES (3, 'Nihil optio dolor.', 100, 2, '2022-06-07 09:47:38');
INSERT INTO `historysales` VALUES (4, 'Occaecati voluptas occaecati aut.', 100, 1, '2022-06-07 09:47:38');
INSERT INTO `historysales` VALUES (5, 'Nihil optio dolor.', 98, 3, '2022-06-07 09:51:21');

-- ----------------------------
-- Table structure for historyusers
-- ----------------------------
DROP TABLE IF EXISTS `historyusers`;
CREATE TABLE `historyusers`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `tgl_registrasi` datetime NULL DEFAULT NULL,
  `tgl_gabung_member` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of historyusers
-- ----------------------------
INSERT INTO `historyusers` VALUES (1, 2, '2022-06-07 09:40:24', NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `namespace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` int NOT NULL,
  `batch` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (18, '2017-11-20-223112', 'Myth\\Auth\\Database\\Migrations\\CreateAuthTables', 'default', 'Myth\\Auth', 1654569507, 1);
INSERT INTO `migrations` VALUES (19, '2022-01-25-111041', 'App\\Database\\Migrations\\Products', 'default', 'App', 1654569507, 1);
INSERT INTO `migrations` VALUES (20, '2022-01-25-112702', 'App\\Database\\Migrations\\Categories', 'default', 'App', 1654569507, 1);
INSERT INTO `migrations` VALUES (21, '2022-01-25-113448', 'App\\Database\\Migrations\\Colors', 'default', 'App', 1654569508, 1);
INSERT INTO `migrations` VALUES (22, '2022-01-25-113510', 'App\\Database\\Migrations\\Sizes', 'default', 'App', 1654569508, 1);
INSERT INTO `migrations` VALUES (23, '2022-01-25-115054', 'App\\Database\\Migrations\\Productsize', 'default', 'App', 1654569509, 1);
INSERT INTO `migrations` VALUES (24, '2022-01-25-115103', 'App\\Database\\Migrations\\Productcolor', 'default', 'App', 1654569509, 1);
INSERT INTO `migrations` VALUES (25, '2022-01-29-094818', 'App\\Database\\Migrations\\Cart', 'default', 'App', 1654569510, 1);
INSERT INTO `migrations` VALUES (26, '2022-01-29-095124', 'App\\Database\\Migrations\\Productcart', 'default', 'App', 1654569510, 1);
INSERT INTO `migrations` VALUES (27, '2022-02-28-042727', 'App\\Database\\Migrations\\Address', 'default', 'App', 1654569510, 1);
INSERT INTO `migrations` VALUES (28, '2022-02-28-043735', 'App\\Database\\Migrations\\Checkouts', 'default', 'App', 1654569511, 1);
INSERT INTO `migrations` VALUES (29, '2022-03-04-021129', 'App\\Database\\Migrations\\Confirms', 'default', 'App', 1654569511, 1);
INSERT INTO `migrations` VALUES (30, '2022-03-16-023137', 'App\\Database\\Migrations\\Events', 'default', 'App', 1654569511, 1);
INSERT INTO `migrations` VALUES (31, '2022-03-21-040430', 'App\\Database\\Migrations\\CancelOrders', 'default', 'App', 1654569512, 1);
INSERT INTO `migrations` VALUES (32, '2022-03-23-035447', 'App\\Database\\Migrations\\Productcheckout', 'default', 'App', 1654569513, 1);
INSERT INTO `migrations` VALUES (33, '2022-06-06-055254', 'App\\Database\\Migrations\\Historyuser', 'default', 'App', 1654569514, 1);
INSERT INTO `migrations` VALUES (34, '2022-06-07-023439', 'App\\Database\\Migrations\\Historysales', 'default', 'App', 1654569514, 1);

-- ----------------------------
-- Table structure for productcart
-- ----------------------------
DROP TABLE IF EXISTS `productcart`;
CREATE TABLE `productcart`  (
  `cart_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `size` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `color` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productcart
-- ----------------------------

-- ----------------------------
-- Table structure for productcheckout
-- ----------------------------
DROP TABLE IF EXISTS `productcheckout`;
CREATE TABLE `productcheckout`  (
  `checkout_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `color` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `size` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` bigint UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `grand_total` bigint UNSIGNED NOT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productcheckout
-- ----------------------------
INSERT INTO `productcheckout` VALUES (1, 77, 'brown', 'XL', 476817, 3, 1430451, '');
INSERT INTO `productcheckout` VALUES (1, 91, 'darkred', 'XL', 440591, 3, 1321773, '');
INSERT INTO `productcheckout` VALUES (2, 81, 'brown', 'S', 122293, 2, 244586, '');
INSERT INTO `productcheckout` VALUES (2, 100, 'black', 'S', 154859, 1, 154859, '');
INSERT INTO `productcheckout` VALUES (3, 81, 'brown', 'XL', 122293, 3, 366879, '');

-- ----------------------------
-- Table structure for productcolor
-- ----------------------------
DROP TABLE IF EXISTS `productcolor`;
CREATE TABLE `productcolor`  (
  `product_id` int UNSIGNED NOT NULL,
  `color_id` int UNSIGNED NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productcolor
-- ----------------------------
INSERT INTO `productcolor` VALUES (70, 14);
INSERT INTO `productcolor` VALUES (63, 18);
INSERT INTO `productcolor` VALUES (20, 18);
INSERT INTO `productcolor` VALUES (13, 1);
INSERT INTO `productcolor` VALUES (1, 21);
INSERT INTO `productcolor` VALUES (52, 4);
INSERT INTO `productcolor` VALUES (20, 22);
INSERT INTO `productcolor` VALUES (98, 5);
INSERT INTO `productcolor` VALUES (62, 8);
INSERT INTO `productcolor` VALUES (92, 15);
INSERT INTO `productcolor` VALUES (100, 1);
INSERT INTO `productcolor` VALUES (34, 13);
INSERT INTO `productcolor` VALUES (68, 10);
INSERT INTO `productcolor` VALUES (87, 4);
INSERT INTO `productcolor` VALUES (89, 2);
INSERT INTO `productcolor` VALUES (49, 4);
INSERT INTO `productcolor` VALUES (41, 5);
INSERT INTO `productcolor` VALUES (19, 7);
INSERT INTO `productcolor` VALUES (58, 21);
INSERT INTO `productcolor` VALUES (36, 26);
INSERT INTO `productcolor` VALUES (62, 6);
INSERT INTO `productcolor` VALUES (99, 26);
INSERT INTO `productcolor` VALUES (98, 20);
INSERT INTO `productcolor` VALUES (98, 14);
INSERT INTO `productcolor` VALUES (44, 25);
INSERT INTO `productcolor` VALUES (77, 15);
INSERT INTO `productcolor` VALUES (43, 5);
INSERT INTO `productcolor` VALUES (99, 25);
INSERT INTO `productcolor` VALUES (81, 15);
INSERT INTO `productcolor` VALUES (23, 11);
INSERT INTO `productcolor` VALUES (70, 15);
INSERT INTO `productcolor` VALUES (87, 7);
INSERT INTO `productcolor` VALUES (11, 6);
INSERT INTO `productcolor` VALUES (77, 23);
INSERT INTO `productcolor` VALUES (4, 10);
INSERT INTO `productcolor` VALUES (60, 22);
INSERT INTO `productcolor` VALUES (94, 26);
INSERT INTO `productcolor` VALUES (76, 17);
INSERT INTO `productcolor` VALUES (57, 20);
INSERT INTO `productcolor` VALUES (72, 14);
INSERT INTO `productcolor` VALUES (61, 21);
INSERT INTO `productcolor` VALUES (10, 10);
INSERT INTO `productcolor` VALUES (6, 23);
INSERT INTO `productcolor` VALUES (87, 19);
INSERT INTO `productcolor` VALUES (97, 17);
INSERT INTO `productcolor` VALUES (34, 4);
INSERT INTO `productcolor` VALUES (95, 16);
INSERT INTO `productcolor` VALUES (71, 10);
INSERT INTO `productcolor` VALUES (67, 22);
INSERT INTO `productcolor` VALUES (69, 17);
INSERT INTO `productcolor` VALUES (44, 3);
INSERT INTO `productcolor` VALUES (14, 20);
INSERT INTO `productcolor` VALUES (22, 24);
INSERT INTO `productcolor` VALUES (92, 7);
INSERT INTO `productcolor` VALUES (31, 1);
INSERT INTO `productcolor` VALUES (94, 14);
INSERT INTO `productcolor` VALUES (33, 21);
INSERT INTO `productcolor` VALUES (28, 2);
INSERT INTO `productcolor` VALUES (69, 9);
INSERT INTO `productcolor` VALUES (83, 3);
INSERT INTO `productcolor` VALUES (44, 9);
INSERT INTO `productcolor` VALUES (90, 8);
INSERT INTO `productcolor` VALUES (70, 14);
INSERT INTO `productcolor` VALUES (14, 13);
INSERT INTO `productcolor` VALUES (47, 12);
INSERT INTO `productcolor` VALUES (45, 12);
INSERT INTO `productcolor` VALUES (11, 26);
INSERT INTO `productcolor` VALUES (6, 12);
INSERT INTO `productcolor` VALUES (24, 7);
INSERT INTO `productcolor` VALUES (8, 2);
INSERT INTO `productcolor` VALUES (38, 24);
INSERT INTO `productcolor` VALUES (29, 16);
INSERT INTO `productcolor` VALUES (87, 6);
INSERT INTO `productcolor` VALUES (42, 5);
INSERT INTO `productcolor` VALUES (10, 16);
INSERT INTO `productcolor` VALUES (96, 8);
INSERT INTO `productcolor` VALUES (45, 24);
INSERT INTO `productcolor` VALUES (41, 10);
INSERT INTO `productcolor` VALUES (19, 17);
INSERT INTO `productcolor` VALUES (8, 1);
INSERT INTO `productcolor` VALUES (79, 26);
INSERT INTO `productcolor` VALUES (27, 12);
INSERT INTO `productcolor` VALUES (21, 11);
INSERT INTO `productcolor` VALUES (29, 7);
INSERT INTO `productcolor` VALUES (68, 9);
INSERT INTO `productcolor` VALUES (67, 6);
INSERT INTO `productcolor` VALUES (80, 15);
INSERT INTO `productcolor` VALUES (40, 5);
INSERT INTO `productcolor` VALUES (68, 1);
INSERT INTO `productcolor` VALUES (46, 23);
INSERT INTO `productcolor` VALUES (41, 23);
INSERT INTO `productcolor` VALUES (79, 7);
INSERT INTO `productcolor` VALUES (64, 21);
INSERT INTO `productcolor` VALUES (34, 12);
INSERT INTO `productcolor` VALUES (78, 15);
INSERT INTO `productcolor` VALUES (63, 21);
INSERT INTO `productcolor` VALUES (21, 3);
INSERT INTO `productcolor` VALUES (16, 8);
INSERT INTO `productcolor` VALUES (87, 23);
INSERT INTO `productcolor` VALUES (31, 19);
INSERT INTO `productcolor` VALUES (74, 7);
INSERT INTO `productcolor` VALUES (54, 2);
INSERT INTO `productcolor` VALUES (38, 11);
INSERT INTO `productcolor` VALUES (57, 17);
INSERT INTO `productcolor` VALUES (86, 9);
INSERT INTO `productcolor` VALUES (17, 22);
INSERT INTO `productcolor` VALUES (17, 2);
INSERT INTO `productcolor` VALUES (74, 2);
INSERT INTO `productcolor` VALUES (89, 9);
INSERT INTO `productcolor` VALUES (8, 26);
INSERT INTO `productcolor` VALUES (16, 22);
INSERT INTO `productcolor` VALUES (72, 11);
INSERT INTO `productcolor` VALUES (8, 10);
INSERT INTO `productcolor` VALUES (63, 14);
INSERT INTO `productcolor` VALUES (59, 19);
INSERT INTO `productcolor` VALUES (7, 8);
INSERT INTO `productcolor` VALUES (52, 4);
INSERT INTO `productcolor` VALUES (60, 4);
INSERT INTO `productcolor` VALUES (39, 1);
INSERT INTO `productcolor` VALUES (1, 5);
INSERT INTO `productcolor` VALUES (21, 10);
INSERT INTO `productcolor` VALUES (97, 10);
INSERT INTO `productcolor` VALUES (62, 6);
INSERT INTO `productcolor` VALUES (37, 13);
INSERT INTO `productcolor` VALUES (99, 24);
INSERT INTO `productcolor` VALUES (78, 1);
INSERT INTO `productcolor` VALUES (25, 5);
INSERT INTO `productcolor` VALUES (86, 13);
INSERT INTO `productcolor` VALUES (75, 17);
INSERT INTO `productcolor` VALUES (31, 3);
INSERT INTO `productcolor` VALUES (70, 23);
INSERT INTO `productcolor` VALUES (96, 25);
INSERT INTO `productcolor` VALUES (23, 12);
INSERT INTO `productcolor` VALUES (74, 1);
INSERT INTO `productcolor` VALUES (43, 25);
INSERT INTO `productcolor` VALUES (99, 4);
INSERT INTO `productcolor` VALUES (86, 6);
INSERT INTO `productcolor` VALUES (56, 23);
INSERT INTO `productcolor` VALUES (81, 19);
INSERT INTO `productcolor` VALUES (44, 9);
INSERT INTO `productcolor` VALUES (73, 26);
INSERT INTO `productcolor` VALUES (3, 10);
INSERT INTO `productcolor` VALUES (96, 17);
INSERT INTO `productcolor` VALUES (35, 9);
INSERT INTO `productcolor` VALUES (5, 23);
INSERT INTO `productcolor` VALUES (98, 15);
INSERT INTO `productcolor` VALUES (17, 20);
INSERT INTO `productcolor` VALUES (4, 2);
INSERT INTO `productcolor` VALUES (21, 24);
INSERT INTO `productcolor` VALUES (69, 1);
INSERT INTO `productcolor` VALUES (10, 13);
INSERT INTO `productcolor` VALUES (42, 25);
INSERT INTO `productcolor` VALUES (76, 10);
INSERT INTO `productcolor` VALUES (54, 4);
INSERT INTO `productcolor` VALUES (96, 9);
INSERT INTO `productcolor` VALUES (5, 7);
INSERT INTO `productcolor` VALUES (54, 24);
INSERT INTO `productcolor` VALUES (27, 7);
INSERT INTO `productcolor` VALUES (65, 26);
INSERT INTO `productcolor` VALUES (90, 10);
INSERT INTO `productcolor` VALUES (2, 20);
INSERT INTO `productcolor` VALUES (3, 3);
INSERT INTO `productcolor` VALUES (10, 16);
INSERT INTO `productcolor` VALUES (53, 9);
INSERT INTO `productcolor` VALUES (81, 18);
INSERT INTO `productcolor` VALUES (3, 23);
INSERT INTO `productcolor` VALUES (98, 7);
INSERT INTO `productcolor` VALUES (31, 1);
INSERT INTO `productcolor` VALUES (47, 21);
INSERT INTO `productcolor` VALUES (12, 12);
INSERT INTO `productcolor` VALUES (67, 24);
INSERT INTO `productcolor` VALUES (21, 9);
INSERT INTO `productcolor` VALUES (66, 24);
INSERT INTO `productcolor` VALUES (91, 14);
INSERT INTO `productcolor` VALUES (38, 3);
INSERT INTO `productcolor` VALUES (88, 25);
INSERT INTO `productcolor` VALUES (53, 20);
INSERT INTO `productcolor` VALUES (48, 11);
INSERT INTO `productcolor` VALUES (83, 2);
INSERT INTO `productcolor` VALUES (46, 1);
INSERT INTO `productcolor` VALUES (68, 16);
INSERT INTO `productcolor` VALUES (17, 21);
INSERT INTO `productcolor` VALUES (40, 14);
INSERT INTO `productcolor` VALUES (72, 16);
INSERT INTO `productcolor` VALUES (8, 8);
INSERT INTO `productcolor` VALUES (9, 3);
INSERT INTO `productcolor` VALUES (10, 18);
INSERT INTO `productcolor` VALUES (9, 17);
INSERT INTO `productcolor` VALUES (30, 10);
INSERT INTO `productcolor` VALUES (19, 22);
INSERT INTO `productcolor` VALUES (59, 23);
INSERT INTO `productcolor` VALUES (36, 1);
INSERT INTO `productcolor` VALUES (29, 15);
INSERT INTO `productcolor` VALUES (52, 19);
INSERT INTO `productcolor` VALUES (61, 23);
INSERT INTO `productcolor` VALUES (98, 23);
INSERT INTO `productcolor` VALUES (90, 19);
INSERT INTO `productcolor` VALUES (30, 20);
INSERT INTO `productcolor` VALUES (69, 13);
INSERT INTO `productcolor` VALUES (41, 2);
INSERT INTO `productcolor` VALUES (82, 20);
INSERT INTO `productcolor` VALUES (75, 3);
INSERT INTO `productcolor` VALUES (65, 12);
INSERT INTO `productcolor` VALUES (82, 19);
INSERT INTO `productcolor` VALUES (24, 8);
INSERT INTO `productcolor` VALUES (54, 7);
INSERT INTO `productcolor` VALUES (73, 1);
INSERT INTO `productcolor` VALUES (6, 18);
INSERT INTO `productcolor` VALUES (88, 12);
INSERT INTO `productcolor` VALUES (8, 16);
INSERT INTO `productcolor` VALUES (44, 24);
INSERT INTO `productcolor` VALUES (32, 15);
INSERT INTO `productcolor` VALUES (96, 25);
INSERT INTO `productcolor` VALUES (99, 19);
INSERT INTO `productcolor` VALUES (63, 13);
INSERT INTO `productcolor` VALUES (26, 6);
INSERT INTO `productcolor` VALUES (57, 13);
INSERT INTO `productcolor` VALUES (29, 8);
INSERT INTO `productcolor` VALUES (33, 6);
INSERT INTO `productcolor` VALUES (64, 23);
INSERT INTO `productcolor` VALUES (71, 25);
INSERT INTO `productcolor` VALUES (45, 3);
INSERT INTO `productcolor` VALUES (89, 8);
INSERT INTO `productcolor` VALUES (1, 16);
INSERT INTO `productcolor` VALUES (97, 20);
INSERT INTO `productcolor` VALUES (66, 18);
INSERT INTO `productcolor` VALUES (78, 2);
INSERT INTO `productcolor` VALUES (31, 6);
INSERT INTO `productcolor` VALUES (84, 5);
INSERT INTO `productcolor` VALUES (95, 25);
INSERT INTO `productcolor` VALUES (52, 7);
INSERT INTO `productcolor` VALUES (2, 8);
INSERT INTO `productcolor` VALUES (98, 26);
INSERT INTO `productcolor` VALUES (98, 10);
INSERT INTO `productcolor` VALUES (54, 3);
INSERT INTO `productcolor` VALUES (31, 4);
INSERT INTO `productcolor` VALUES (82, 5);
INSERT INTO `productcolor` VALUES (44, 22);
INSERT INTO `productcolor` VALUES (19, 24);
INSERT INTO `productcolor` VALUES (95, 24);
INSERT INTO `productcolor` VALUES (10, 10);
INSERT INTO `productcolor` VALUES (20, 6);
INSERT INTO `productcolor` VALUES (19, 16);
INSERT INTO `productcolor` VALUES (14, 13);
INSERT INTO `productcolor` VALUES (56, 23);
INSERT INTO `productcolor` VALUES (91, 20);
INSERT INTO `productcolor` VALUES (32, 2);
INSERT INTO `productcolor` VALUES (53, 21);
INSERT INTO `productcolor` VALUES (67, 15);
INSERT INTO `productcolor` VALUES (96, 24);
INSERT INTO `productcolor` VALUES (15, 15);
INSERT INTO `productcolor` VALUES (22, 9);
INSERT INTO `productcolor` VALUES (39, 8);
INSERT INTO `productcolor` VALUES (91, 26);
INSERT INTO `productcolor` VALUES (32, 7);
INSERT INTO `productcolor` VALUES (5, 7);
INSERT INTO `productcolor` VALUES (97, 1);
INSERT INTO `productcolor` VALUES (12, 8);
INSERT INTO `productcolor` VALUES (8, 24);
INSERT INTO `productcolor` VALUES (28, 11);
INSERT INTO `productcolor` VALUES (18, 12);
INSERT INTO `productcolor` VALUES (51, 14);
INSERT INTO `productcolor` VALUES (3, 10);
INSERT INTO `productcolor` VALUES (100, 11);
INSERT INTO `productcolor` VALUES (79, 20);
INSERT INTO `productcolor` VALUES (36, 2);
INSERT INTO `productcolor` VALUES (5, 18);
INSERT INTO `productcolor` VALUES (23, 26);
INSERT INTO `productcolor` VALUES (71, 1);
INSERT INTO `productcolor` VALUES (2, 13);
INSERT INTO `productcolor` VALUES (25, 2);
INSERT INTO `productcolor` VALUES (48, 3);
INSERT INTO `productcolor` VALUES (92, 6);
INSERT INTO `productcolor` VALUES (1, 1);
INSERT INTO `productcolor` VALUES (27, 4);
INSERT INTO `productcolor` VALUES (80, 15);
INSERT INTO `productcolor` VALUES (15, 5);
INSERT INTO `productcolor` VALUES (16, 1);
INSERT INTO `productcolor` VALUES (86, 8);
INSERT INTO `productcolor` VALUES (52, 3);
INSERT INTO `productcolor` VALUES (21, 7);
INSERT INTO `productcolor` VALUES (28, 10);
INSERT INTO `productcolor` VALUES (62, 19);
INSERT INTO `productcolor` VALUES (30, 23);
INSERT INTO `productcolor` VALUES (33, 25);
INSERT INTO `productcolor` VALUES (86, 26);
INSERT INTO `productcolor` VALUES (18, 4);
INSERT INTO `productcolor` VALUES (63, 4);
INSERT INTO `productcolor` VALUES (86, 13);
INSERT INTO `productcolor` VALUES (26, 21);
INSERT INTO `productcolor` VALUES (89, 25);
INSERT INTO `productcolor` VALUES (39, 14);
INSERT INTO `productcolor` VALUES (64, 13);
INSERT INTO `productcolor` VALUES (19, 4);
INSERT INTO `productcolor` VALUES (62, 23);
INSERT INTO `productcolor` VALUES (9, 16);
INSERT INTO `productcolor` VALUES (14, 24);
INSERT INTO `productcolor` VALUES (12, 22);
INSERT INTO `productcolor` VALUES (34, 24);
INSERT INTO `productcolor` VALUES (53, 19);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` int NOT NULL,
  `discount` float NOT NULL,
  `weight` int NOT NULL,
  `stock` int NOT NULL,
  `image_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'product.jpg',
  `image_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'product.jpg',
  `image_3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'product.jpg',
  `sold` int NOT NULL DEFAULT 0,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `slug`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 4, 'Est sit quia debitis corrupti.', 'est-sit-quia-debitis-corrupti.', 'Veniam dignissimos eum harum fugiat vel praesentium accusamus. Laborum non iusto quas consequuntur. Consectetur maiores rerum sunt officiis nam voluptatem. Iste repudiandae aut voluptatem non.\n\nDolore quam magni labore pariatur ipsum dolor. Occaecati omnis et consequatur consequatur fugiat eaque aspernatur facilis. Rerum eius ab et eos. Molestiae aut ut officia magni enim.\n\nVoluptas ea sequi magnam ea. Quia alias facilis non est. Facere tenetur est doloribus aut quae sunt ratione rerum. Nihil voluptas dolor qui facilis vitae.\n\nPlaceat reiciendis sunt quae sapiente error. Rem doloremque veniam maxime minus consequatur. Dolorum rerum perspiciatis nemo corrupti.\n\nUt voluptatem ab et molestiae vero recusandae rerum provident. Dolores et modi quam laborum natus veniam cumque. Ut nesciunt delectus explicabo quod ut est voluptas quia.', 225614, 49, 1143, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2017-11-26 16:29:15', '2022-06-07 09:38:47');
INSERT INTO `products` VALUES (2, 2, 'Veniam aut ut.', 'veniam-aut-ut.', 'Iure minus aspernatur aut nam similique nostrum provident neque. Facilis quia sunt vel sit sit. Qui expedita eveniet omnis quia est quidem. Dolorum molestiae quis et voluptatum dicta suscipit.\n\nIncidunt odio et explicabo maxime. Expedita harum quia atque dolores error. Labore incidunt aliquid a occaecati et qui.\n\nOmnis voluptatem est deserunt assumenda corrupti voluptas. Quia unde accusamus magnam voluptatum aut. Iure delectus fuga voluptas vitae.\n\nQuis sit pariatur earum perferendis quisquam sunt. Ut eaque possimus vero.\n\nVoluptatum explicabo optio aspernatur quisquam. Aut nesciunt rerum atque beatae. Architecto dicta asperiores consequatur.', 628966, 2, 4902, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1992-04-07 16:29:32', '2022-06-07 09:38:47');
INSERT INTO `products` VALUES (3, 5, 'Dolorum et et.', 'dolorum-et-et.', 'Unde voluptatem iste expedita nesciunt. Architecto explicabo dolorem vel corrupti nihil occaecati veritatis. Ut officia et non quia et ipsa. Molestias rerum ratione qui officiis saepe quia facilis.\n\nDicta reiciendis quidem facilis aut sequi. Nemo sequi odit ut et. Ex quidem inventore quo dolore. Repellat provident voluptatem velit voluptatum a. Deleniti corporis cupiditate error.\n\nFuga voluptatem dolor qui dolorem et alias commodi. Nulla enim aut reprehenderit voluptatem. Similique molestiae et et aut culpa est. Quaerat sed dolorum atque occaecati sit neque veritatis.\n\nSequi nisi in voluptas rerum vitae non fuga. Et dicta ut accusantium iste repellat dolores. Alias sequi et iusto.\n\nUnde voluptas illo sit voluptatem commodi. Vel sapiente ut inventore ipsa a. Sunt quaerat nobis voluptatem deleniti. Hic at ut voluptatem.', 666567, 5, 2654, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1992-08-14 16:21:55', '2022-06-07 09:38:47');
INSERT INTO `products` VALUES (4, 4, 'Ipsa nam doloremque.', 'ipsa-nam-doloremque.', 'Suscipit sint delectus laboriosam magni porro illo. Ut nihil debitis ut. Ullam eum fugiat consequuntur repellendus nesciunt. Aspernatur ullam voluptatem libero aut voluptatem.\n\nVoluptatem labore consequatur quos vel sed nam. Nulla nesciunt sunt amet maxime. Reiciendis omnis aperiam facilis perspiciatis dolor fugit veniam corporis.\n\nConsectetur dolores inventore autem autem aut. Qui et saepe perspiciatis. Culpa minus repellat ea doloremque. Dicta atque ab et et sapiente quae. Deserunt vitae voluptatem molestias dolor quibusdam voluptatem praesentium officia.\n\nOdio omnis iste quis repellendus sequi. Culpa animi autem non voluptas iusto dolores. Vero ut minus hic inventore culpa aut.\n\nPerferendis qui distinctio excepturi ea quas repellendus adipisci voluptate. Esse culpa voluptates et magni eum dolorum. Vero ea nam maxime totam cupiditate est. Tempore vel maiores quasi ut illo assumenda.', 178838, 15, 1343, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1983-06-27 22:59:23', '2022-06-07 09:38:47');
INSERT INTO `products` VALUES (5, 5, 'Quaerat ex itaque harum.', 'quaerat-ex-itaque-harum.', 'Vero excepturi recusandae vel impedit nostrum magnam. Perferendis cupiditate eaque voluptate et consequatur nam. Dolor qui ratione tempore nam qui tempore velit. Eveniet eius ut tenetur ipsam.\n\nDebitis quam est praesentium non ipsam id est. Excepturi laboriosam et enim expedita et necessitatibus qui. Cumque fuga eligendi consequuntur quo qui ea maxime quaerat. Assumenda dolorem quisquam debitis enim dignissimos deserunt.\n\nOmnis porro ut mollitia porro voluptate. Nam aspernatur maiores cupiditate sed et. Facere molestiae ipsa vel est accusamus ea recusandae. Dolor harum nihil non iure atque. Eos eum consequatur ipsa harum.\n\nRepellendus beatae nobis vero. Velit perferendis exercitationem et laboriosam labore laborum voluptatem illo. Distinctio dolor expedita eum id libero distinctio nam.\n\nFacilis magni quod itaque cumque porro iure laboriosam. Minus nihil fugiat minus ut soluta temporibus eum quod. Maxime deserunt maxime voluptas.', 767878, 23, 1156, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2007-04-07 00:01:42', '2022-06-07 09:38:47');
INSERT INTO `products` VALUES (6, 1, 'Quam dolorem delectus.', 'quam-dolorem-delectus.', 'Doloremque odio suscipit sint accusantium quisquam sint at. Atque est deserunt consectetur deserunt necessitatibus ab impedit tempore. Rem odio quo laborum et. Rerum dolorum itaque eveniet tenetur voluptate aut repudiandae.\n\nEveniet dolor voluptates quisquam sed qui. Et est aut itaque. Et ut et qui ratione eum aut.\n\nNumquam magni at aut deleniti distinctio voluptatem neque. Sed sit nisi eos est sint. Dolorum quia eligendi unde aliquam et veritatis fugiat dolores.\n\nEt odit rerum labore est sunt magni. Tempore voluptatum at perferendis cum non harum officiis. Commodi id quasi quia repellat omnis sint ratione dolor.\n\nConsequuntur non aperiam aut ut. Est cupiditate quae ea ducimus.', 341195, 42, 3944, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1974-06-15 01:49:26', '2022-06-07 09:38:47');
INSERT INTO `products` VALUES (7, 2, 'Ratione laborum qui.', 'ratione-laborum-qui.', 'Praesentium enim id porro quo ratione. In error enim hic et earum.\n\nRerum porro nemo consequatur sit eum. Et sit repellendus et modi repellendus numquam. Qui et et temporibus ut quo corrupti provident.\n\nDolore eos debitis earum id. Facere eius fugiat nobis iste magni voluptatibus cumque. Corporis voluptatem id mollitia fugit consequatur ut ex. Impedit amet eos quia numquam cum.\n\nSunt quasi qui omnis magni. Minus nemo nesciunt beatae nesciunt voluptatem ea et. Cumque neque et culpa repellat accusantium est sed.\n\nEt fuga molestiae quo voluptatum dicta aperiam occaecati. Quia odio veritatis ullam ipsum. Laudantium voluptate necessitatibus enim sed tempora.', 744675, 61, 2528, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1987-02-08 16:05:25', '2022-06-07 09:38:47');
INSERT INTO `products` VALUES (8, 4, 'Suscipit voluptates magnam numquam.', 'suscipit-voluptates-magnam-numquam.', 'Dolor temporibus amet voluptatem id consectetur vitae. Qui sit aliquam eos est facere illum sed et. Porro id dolorem cum dolorum doloremque incidunt. Et id dolore id voluptatibus rerum. Sunt voluptates est voluptas assumenda.\n\nDolor corrupti similique aliquam et harum. Debitis sapiente sint dolorum distinctio voluptatem aspernatur. Impedit aperiam fugit officiis quae placeat. Et ab rerum aliquid exercitationem cupiditate consectetur nam aut.\n\nEst fuga ducimus quo vel at voluptatibus voluptate. Numquam esse eum nobis molestias quia fugiat deleniti. Ut quae nam et praesentium. Iste et dolor excepturi iusto qui.\n\nMolestiae sed autem esse et qui sint. Exercitationem consequatur aliquam cum consectetur quo. Tenetur quibusdam eaque et dolorem omnis. Eos est tempora qui.\n\nAmet in architecto libero. Minima id quaerat est quae iste. Provident dolores facere illum corporis. Autem molestiae sint qui voluptas dolor asperiores.', 906078, 5, 4244, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2006-09-26 16:32:18', '2022-06-07 09:38:47');
INSERT INTO `products` VALUES (9, 5, 'Quas veniam ipsum vel beatae.', 'quas-veniam-ipsum-vel-beatae.', 'Sed est autem vero id incidunt iure. Magnam id praesentium et natus eligendi. Voluptatem magni doloremque quam incidunt sunt blanditiis possimus.\n\nAtque vel eveniet omnis inventore veniam beatae qui. Facilis praesentium dicta in fugit voluptatibus doloremque suscipit. Sed nihil exercitationem magnam non odit consequatur quasi dolores.\n\nUt voluptate aut vitae quidem. Commodi quae non qui cupiditate. Eos dolores qui blanditiis.\n\nEst deserunt quisquam cumque consectetur ipsam quibusdam assumenda pariatur. Nihil suscipit rerum explicabo quidem. Ipsum magnam dolor quisquam iste optio alias dolore.\n\nDoloremque alias iste expedita et sit. Fugit dignissimos sunt similique. At ut omnis consequatur laborum neque ut.', 666278, 16, 4577, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1984-08-20 05:58:33', '2022-06-07 09:38:47');
INSERT INTO `products` VALUES (10, 1, 'Repellendus eos dolor quidem consectetur.', 'repellendus-eos-dolor-quidem-consectetur.', 'Sed nam esse repudiandae nulla quis. Voluptatum facere reprehenderit nulla accusantium dolores omnis sit saepe. Sed culpa consequatur reprehenderit quam laudantium consequatur quisquam. Sint velit a illo est impedit esse asperiores. Omnis rerum iure natus voluptatum minus.\n\nMagnam voluptatibus quo ratione sint. Ut id deserunt aut dicta suscipit aliquid.\n\nEt nostrum consequatur et saepe minima aut et. Enim quia quo soluta explicabo quaerat. Numquam excepturi corporis aut non. Tempora esse dolores et et velit molestiae officiis.\n\nIncidunt deserunt tempora eius excepturi ad voluptatibus. Aut dolor quas earum non. Nemo sapiente soluta eos numquam quaerat. Recusandae nostrum asperiores at voluptas.\n\nNihil culpa placeat ullam illo quis voluptatum. Excepturi ratione officia porro possimus rem ut vitae. Dolor ab voluptas excepturi quaerat facilis voluptatibus deserunt. Et cumque nulla impedit.', 642720, 68, 3392, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2009-12-25 22:39:22', '2022-06-07 09:38:48');
INSERT INTO `products` VALUES (11, 4, 'Rerum voluptatibus aut.', 'rerum-voluptatibus-aut.', 'Non eligendi et et dolore incidunt natus. Dolor voluptate incidunt atque eveniet facilis. Necessitatibus atque voluptas animi rerum. Distinctio ipsam nobis et quia.\n\nUt eius soluta pariatur dolores reiciendis voluptate. Non delectus velit architecto enim libero aut. Ut nesciunt a animi maiores necessitatibus tenetur. Voluptatem ea eum et incidunt aut.\n\nId aperiam nihil pariatur omnis incidunt omnis excepturi. Dolore ipsa deserunt a tenetur. Eos quaerat reprehenderit porro.\n\nUt est facilis tempore veniam maiores repellat ab. Animi iste et ipsam voluptas non dolorum adipisci rerum. Molestiae facilis hic accusamus ab.\n\nAut magni debitis optio doloribus deserunt qui. Placeat dicta sit qui et rem ad. Deserunt voluptate ipsa numquam quia quo accusantium ad. Sint maiores exercitationem sunt unde voluptatibus. Aut quod non et ipsum.', 266000, 49, 2485, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2013-08-01 12:46:48', '2022-06-07 09:38:48');
INSERT INTO `products` VALUES (12, 4, 'Impedit velit est voluptates.', 'impedit-velit-est-voluptates.', 'Nesciunt sapiente consequatur dignissimos molestiae aspernatur dolorum magnam. Enim illo delectus tempora incidunt quis rerum pariatur. Beatae perspiciatis voluptatem sed et itaque ad aperiam. Nihil ut voluptatem corporis aut et necessitatibus.\n\nNatus incidunt aut dolores fuga ut rerum. Nulla enim similique velit est molestiae doloremque est. Velit sed mollitia dolorem.\n\nNobis atque quia ex qui. Placeat blanditiis quaerat ea vel labore sint maiores praesentium. Ea sit voluptas est.\n\nVoluptas facere facere autem natus dolores qui ut sapiente. Est eveniet aut deleniti veniam. Similique perferendis amet qui quis.\n\nEa dolorem at qui. Eligendi aut qui vitae aut et asperiores autem. Esse aut veritatis non magnam necessitatibus ducimus voluptatem. Earum consequatur sint ducimus aspernatur ab. Vero ullam culpa et autem.', 807496, 41, 3990, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2002-09-28 18:44:59', '2022-06-07 09:38:48');
INSERT INTO `products` VALUES (13, 2, 'Debitis ipsum officia consequuntur.', 'debitis-ipsum-officia-consequuntur.', 'Et in odio fugiat. Molestiae consequuntur et officia quia omnis voluptates. Odio soluta perspiciatis architecto quae possimus.\n\nEsse soluta hic aut ipsam non sint aspernatur. Modi laboriosam quae in consectetur nemo nam. Officia aut enim perspiciatis labore.\n\nQuam distinctio corporis dolorum. Doloremque id vero deleniti neque praesentium. Iure odio saepe aspernatur distinctio possimus alias.\n\nMinus consequatur autem voluptatem praesentium aliquid neque consequatur ut. Ea voluptatem ut impedit facilis. Sint facilis perferendis quam sit rerum quod.\n\nPariatur vel eveniet porro ipsum. Explicabo quo voluptas animi aliquam corrupti nobis. Voluptatum dolorum facilis ipsum eaque. Nihil voluptates ipsam libero sit in voluptates praesentium.', 319787, 60, 2992, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1996-01-09 11:30:23', '2022-06-07 09:38:48');
INSERT INTO `products` VALUES (14, 4, 'Sit tempore quia eum.', 'sit-tempore-quia-eum.', 'Qui omnis ullam qui commodi non quaerat debitis. Laboriosam doloribus provident aut ad sed. Commodi aut doloremque non aperiam impedit distinctio unde. Optio odio quis eaque ipsa doloremque similique. Sit similique alias sint soluta ut adipisci quia.\n\nSunt aspernatur hic quia nam quia. Vel ut corporis quaerat quas unde pariatur libero. Sed fugiat fugiat eum autem aut quasi et. Qui laudantium doloremque earum commodi sit veniam non.\n\nNatus laborum aut quae cupiditate qui blanditiis. Culpa sed explicabo sint reiciendis ipsum impedit. Iste nihil aut aut id quasi reprehenderit et.\n\nLaborum accusantium inventore architecto. Ratione deserunt soluta facilis autem. Temporibus sint delectus perspiciatis.\n\nDolor sequi quaerat odit ducimus et quia. Nobis quod mollitia voluptatem consequatur. Dolor eum aliquid quis voluptas ad quis culpa. Ut quod vitae sit qui praesentium.', 720658, 32, 2785, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1977-07-03 19:37:10', '2022-06-07 09:38:48');
INSERT INTO `products` VALUES (15, 4, 'Aliquid inventore et nobis.', 'aliquid-inventore-et-nobis.', 'Quo ab quo eveniet rerum illo. Magni dolor sit corporis alias explicabo. Voluptatem omnis enim consequuntur quae doloremque in natus quas.\n\nDolorum sint velit doloribus et possimus nihil. Et molestias doloribus quisquam a sint repudiandae natus nihil. Neque ut modi quam nisi est vel provident eligendi.\n\nSaepe vel exercitationem et velit vitae non id. Consequatur minima ut adipisci adipisci. Alias repellendus animi et sapiente vero aut eos.\n\nIpsa ad nulla quod. Molestias optio numquam consequatur vel molestiae. Non rerum enim consequatur cum numquam.\n\nFacilis rem fuga consequatur qui quae quia provident. Laboriosam cupiditate facilis labore et ut. Molestiae asperiores sunt quasi voluptatibus reiciendis est corrupti.', 682265, 40, 4296, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2007-04-23 03:36:41', '2022-06-07 09:38:48');
INSERT INTO `products` VALUES (16, 1, 'Doloremque dolorem consectetur aliquid.', 'doloremque-dolorem-consectetur-aliquid.', 'Et ab non quod iste quasi cum possimus. Ut ut impedit dignissimos et tenetur nesciunt. Iste totam culpa numquam voluptatem.\n\nAt rerum aut aut itaque temporibus officia. Quis sunt et rerum molestiae qui consectetur. Quis velit ab et nam. Odio et voluptatem quisquam fuga corrupti iure doloremque id.\n\nSed facilis eum dolorem natus modi. Vitae fugiat aspernatur expedita libero rem nihil omnis nisi. Tenetur rerum ducimus labore eius quasi modi accusantium fuga.\n\nFacilis ipsam omnis est aut sit. Autem tenetur rerum quos aut. Et voluptates quos unde ab voluptate tempore.\n\nDicta iste occaecati est eum cupiditate nemo consequatur. Hic ipsa sequi rerum possimus accusantium voluptas quas. Itaque quia id fugiat impedit magni quasi consequuntur alias.', 707226, 41, 1655, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1994-06-24 15:12:55', '2022-06-07 09:38:48');
INSERT INTO `products` VALUES (17, 4, 'Maxime officiis voluptatibus.', 'maxime-officiis-voluptatibus.', 'Illum id delectus sint in. Repellat cumque quia est dolor. Nam tenetur necessitatibus magnam ratione modi nostrum commodi. Voluptatem quisquam possimus aut qui eum accusantium quaerat.\n\nEum architecto quia quis alias delectus. Omnis et ratione reprehenderit assumenda. Dolor ullam itaque ab. Laudantium distinctio nulla quas excepturi aut facere dolores. Quia molestiae et praesentium ipsam reprehenderit ab pariatur.\n\nEt in tempora sed optio excepturi rem non. Adipisci est alias quo. Ut totam reiciendis dolorum vero nobis. Hic quaerat assumenda sit voluptatem incidunt et.\n\nQuibusdam blanditiis harum in accusantium autem sapiente. Nobis ea accusamus impedit ut mollitia minus. Beatae quae rerum et rerum. Eaque aliquid alias qui qui architecto.\n\nQuia et tempora veritatis temporibus eligendi consequatur rem. Voluptas perspiciatis nostrum suscipit veritatis ducimus qui.', 355710, 20, 1638, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2005-06-18 13:05:44', '2022-06-07 09:38:48');
INSERT INTO `products` VALUES (18, 3, 'Illum voluptas incidunt.', 'illum-voluptas-incidunt.', 'Asperiores repellat porro sunt expedita harum quasi. Qui ratione doloribus id est ut eligendi.\n\nDelectus rerum ullam nihil facilis aut asperiores iure. Et iusto aut amet ut qui corrupti. Optio sint eveniet doloribus autem sit.\n\nPariatur corporis vero et esse nam. Ut in doloribus sed id voluptatem consequatur. Aut ipsam eius ipsam quia quis et magni. Quia similique exercitationem blanditiis porro.\n\nAut quasi dignissimos aut eos. Ea est quos et quam tenetur. Voluptas qui et aliquam molestiae deleniti ad omnis vero. Dolor odio dicta at cupiditate consequatur voluptas voluptate.\n\nQuidem eum dignissimos ducimus. Ut dicta occaecati excepturi quos reiciendis atque nesciunt. Consectetur occaecati voluptatem voluptatem rerum vero est quibusdam. Voluptatem consequatur aut nisi neque dolor.', 546479, 28, 2092, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1974-05-24 08:27:39', '2022-06-07 09:38:48');
INSERT INTO `products` VALUES (19, 2, 'Molestiae magnam non delectus est.', 'molestiae-magnam-non-delectus-est.', 'Vitae nemo fugiat voluptatem voluptatibus. Aliquid ipsa voluptatem possimus esse praesentium in labore.\n\nEt qui rerum eum ducimus sed ut accusamus. Voluptatem nihil veniam sed natus qui. Maiores aut ut corporis voluptas soluta quis. Illo autem sed quasi commodi.\n\nMagnam voluptas qui autem ducimus eum dolores libero. Laudantium autem ut et. Facere assumenda nobis est deserunt autem ut porro.\n\nVelit ad sint voluptas. Quibusdam sequi dolorem et porro. Dolorum sed quis officiis consectetur tenetur.\n\nEst inventore commodi qui quo at neque molestias error. Quisquam tenetur nostrum debitis similique vel. Fuga veritatis cupiditate vero sapiente delectus facilis.', 408992, 51, 1863, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1976-11-29 18:45:50', '2022-06-07 09:38:48');
INSERT INTO `products` VALUES (20, 1, 'Laboriosam officiis magni rerum.', 'laboriosam-officiis-magni-rerum.', 'Est et nam inventore ut. Doloribus est sed nihil voluptate odit. Id quia perferendis quo. Et eum voluptates consequatur.\n\nSaepe ea magnam qui dolore et rerum voluptatem. Est reprehenderit nemo placeat est. Accusantium amet quia eum ut ut tempore et qui. Ullam omnis delectus fuga qui rerum aut perferendis quos. Perspiciatis mollitia quas numquam et voluptate.\n\nVoluptas incidunt temporibus voluptas voluptas eum voluptates. Sed hic magni temporibus quibusdam. Quia velit debitis eum incidunt quae. Aspernatur fuga minima optio rerum a hic sit quasi.\n\nEnim esse sapiente distinctio aliquid. Expedita tenetur fugit nobis nihil provident ex sunt. Reiciendis fuga reiciendis aliquid doloribus ut dolor magnam. Qui odio et et nisi.\n\nEum libero consequatur fuga recusandae similique suscipit quis. Veniam dolorum quam illo odit rem. Quia pariatur ea ut aut repudiandae voluptas. Laborum rerum quas et quibusdam dignissimos.', 783432, 32, 3284, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1975-02-08 02:41:09', '2022-06-07 09:38:48');
INSERT INTO `products` VALUES (21, 5, 'Mollitia pariatur sit.', 'mollitia-pariatur-sit.', 'Asperiores tempora reiciendis id non. Rerum minus assumenda accusamus et. Aperiam et sit facilis minus mollitia ad.\n\nRem modi ea distinctio aliquam quae tempora. Qui reprehenderit eum consequatur consequatur quam autem ab. Minima minus consectetur alias incidunt corporis at.\n\nCorrupti eligendi aliquam magnam saepe non. Nemo aperiam harum et dolorem. Eos voluptatem alias quibusdam et amet optio. Repellat corrupti laborum et velit voluptas quis.\n\nEt voluptatum inventore id et. Enim aut enim necessitatibus in error. Beatae qui quibusdam sint tempore a qui quibusdam. Sunt et vel voluptas.\n\nDicta beatae expedita aspernatur earum voluptatem. Fuga quae officia repellat porro aut voluptas ex. Dolorem voluptatum doloribus dolore aperiam iste non. Praesentium voluptas in dolore maxime placeat et.', 716908, 4, 3666, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2009-04-15 23:31:17', '2022-06-07 09:38:48');
INSERT INTO `products` VALUES (22, 2, 'Enim aliquid explicabo earum.', 'enim-aliquid-explicabo-earum.', 'Id quibusdam velit blanditiis quasi temporibus fuga dolores ratione. Aut doloribus porro est qui tempora beatae. Nihil magni beatae et iste. Non laboriosam sint repudiandae est rerum voluptatum.\n\nNisi aliquid impedit quam corrupti commodi. Quis temporibus tempora explicabo similique nisi impedit maxime qui. Quia error voluptatem qui esse dolore consequuntur nam dolores.\n\nMinima nisi culpa enim. Autem corrupti fugiat vel.\n\nMagnam ratione incidunt quia eos veritatis dolorum. Est voluptas repellat ipsum autem corporis architecto. Autem delectus amet reprehenderit aut deleniti animi.\n\nIpsum alias assumenda assumenda neque et illum. Quam itaque quis et autem et inventore. Voluptatem fuga et asperiores vel quia rerum autem. Et repellendus distinctio ut enim.', 619407, 46, 3248, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1970-05-31 08:17:07', '2022-06-07 09:38:48');
INSERT INTO `products` VALUES (23, 1, 'Quis praesentium aut.', 'quis-praesentium-aut.', 'Omnis amet alias omnis. Expedita delectus excepturi ullam est. Nihil ut vitae voluptas ad.\n\nNam veritatis sint ea rem id. Nam pariatur qui et quis praesentium.\n\nAd ipsa ut sed ullam voluptatem. Repellat repellendus blanditiis error dolores cumque rerum porro. Ea nesciunt quas omnis. Suscipit et architecto nihil.\n\nAsperiores voluptatem dolor alias itaque sint quia necessitatibus quisquam. Sapiente itaque vel ut officiis nisi ducimus exercitationem dolorum. Ut quas voluptatem unde sint nihil illo.\n\nAutem soluta vitae reiciendis et exercitationem. Minus reprehenderit voluptatem quasi quia vel dolorem. Explicabo rerum sint nesciunt ullam. Fugit aut blanditiis dolores aperiam quia.', 600039, 45, 4159, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1989-04-03 19:03:31', '2022-06-07 09:38:49');
INSERT INTO `products` VALUES (24, 5, 'Dolores quibusdam sunt accusantium nobis.', 'dolores-quibusdam-sunt-accusantium-nobis.', 'Minima nam et totam et assumenda. Eaque quo necessitatibus consequatur et odio deleniti in. Occaecati explicabo quo est aliquid ut est dolor. Modi dolorum distinctio dicta recusandae expedita soluta velit.\n\nNeque sed itaque iste aut fuga exercitationem aut. Aut velit occaecati quae deleniti aut. Iste omnis voluptatum repellendus ratione et.\n\nQuasi veritatis expedita et voluptates. Voluptate qui possimus omnis. Dicta qui rerum dolor. Aut aut aliquid cum eveniet est quia natus.\n\nReprehenderit eum sit deserunt et voluptatem sunt reiciendis. Animi molestias repudiandae qui sequi possimus inventore illum.\n\nEt qui non placeat iure sapiente dolores distinctio. Natus molestiae tenetur et asperiores. Omnis officiis voluptatem placeat voluptas.', 543763, 20, 4439, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1970-11-16 18:28:25', '2022-06-07 09:38:49');
INSERT INTO `products` VALUES (25, 5, 'Ad ipsum aut.', 'ad-ipsum-aut.', 'Sapiente nobis esse inventore molestiae voluptas eos. Et voluptate quaerat ipsum. Ex libero vero tempora autem. Animi debitis in aliquam placeat explicabo sunt.\n\nTemporibus excepturi accusamus et quia dicta. Ratione assumenda ab sapiente. Tempore voluptatum ut aut.\n\nAspernatur expedita hic sunt maxime. Facilis et pariatur eaque dicta non totam voluptatem eligendi. Aut sapiente et sit. Voluptatum ea iure rerum consectetur magnam dolorem.\n\nMinima quia labore ut aut excepturi id est dolores. Ut cumque iusto provident ea. Ullam totam dolor similique neque odit enim dolorem.\n\nDolorum tempore in nemo. Voluptatem sint aliquid ut in nihil cupiditate dolore. Molestias dolores voluptates repellendus adipisci omnis architecto voluptatem.', 614730, 25, 2148, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1983-02-19 13:28:29', '2022-06-07 09:38:49');
INSERT INTO `products` VALUES (26, 2, 'Omnis numquam.', 'omnis-numquam.', 'Hic fugit minima sunt animi. Sunt animi autem quos sunt sit vel expedita. Et blanditiis voluptatem eum atque exercitationem facere.\n\nUt est in et quia. Minus quis enim cum vel totam quia tenetur. Repellendus quis cumque eos eaque.\n\nUt quaerat et eum voluptatem vero minima. Quidem excepturi labore quo qui molestiae. Vel est optio fugit pariatur vel repudiandae.\n\nBeatae mollitia voluptas illum alias ut qui. Ducimus ipsum dolorem ab voluptatibus. Aut iste pariatur tenetur beatae nemo explicabo aut. Explicabo et qui expedita est.\n\nVelit sint sequi quo necessitatibus. Aspernatur eum quisquam neque vel minus dolor. Vero quis aut quia mollitia laboriosam illo nisi.', 432739, 56, 4997, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1988-12-08 10:33:37', '2022-06-07 09:38:49');
INSERT INTO `products` VALUES (27, 1, 'Sint beatae labore.', 'sint-beatae-labore.', 'Modi nisi asperiores est non rem ad. Blanditiis vel eum quo ut omnis et placeat. Vel voluptas nemo dolorem quia eos.\n\nQui nihil suscipit voluptatem nihil et adipisci non. Rerum cumque cumque possimus iusto occaecati molestiae.\n\nEt nobis minus corrupti omnis nihil. Reiciendis sed in est voluptate eius sed voluptatibus sed. Nisi non sed voluptatem.\n\nUnde ut nulla suscipit nesciunt et quasi fuga. Nesciunt ducimus et sunt rem. Dolores numquam quis sed itaque. Aperiam commodi et iste et sapiente veritatis. Saepe quasi et distinctio dolor atque quia.\n\nQuos sequi tenetur cum doloremque. Qui ex nisi dolores qui qui eum. Enim repudiandae dolorem vitae voluptas tenetur id.', 386378, 38, 3015, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2007-01-05 04:14:10', '2022-06-07 09:38:49');
INSERT INTO `products` VALUES (28, 5, 'Quasi sed expedita.', 'quasi-sed-expedita.', 'Molestiae quia tenetur eos sunt commodi. Sint aut nisi voluptas. Quidem est maiores qui omnis non. Rerum ipsam ut dolorum aliquam et nesciunt qui necessitatibus.\n\nExpedita modi et aspernatur earum aut harum consequatur. Occaecati magnam et et. Officia velit aut laborum sed et et.\n\nSit necessitatibus explicabo culpa. Delectus occaecati voluptate illo consequatur. Consequatur dolorem eum non iure fugit assumenda eos. Ut eveniet est minima ex aut qui.\n\nVel necessitatibus dolor voluptatem fuga voluptatibus nulla. Ea fuga ullam facilis quia. Hic debitis porro sequi vel ratione natus. Soluta rerum voluptatem laborum nihil nihil fugiat ad.\n\nAut ratione magnam soluta et nihil minima non. Sit consectetur fugit vel odio ad optio. Et optio sed vel esse. Dignissimos autem voluptas dolor quo.', 779834, 5, 4603, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1972-05-27 13:42:13', '2022-06-07 09:38:49');
INSERT INTO `products` VALUES (29, 1, 'Ut et explicabo.', 'ut-et-explicabo.', 'Et enim dicta similique veniam iure et officiis et. Voluptatum aut ducimus laborum reiciendis eveniet consequatur voluptatem voluptatum. Alias odit corrupti nesciunt. Excepturi sed quam numquam quia voluptatum in.\n\nVelit ex occaecati consequatur eveniet velit. Rem et sunt quia. Aspernatur illo non nulla ex quia. Et inventore necessitatibus voluptatum veniam natus fugiat eum. Distinctio ea aut qui sit.\n\nUt nulla quo qui eos odio odit culpa. Ea quidem sunt deleniti iste sunt et dolorum. Consectetur cum autem perspiciatis illum et.\n\nNihil recusandae corporis quo velit. Illo aliquid aut numquam ea debitis porro quo velit. Odio et eum sequi culpa.\n\nSimilique sit qui eum nam sunt voluptas quibusdam. Ut id nam voluptate. Qui qui debitis consectetur deserunt. Ab ab sed quaerat delectus occaecati.', 40877, 48, 4560, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2008-08-22 21:12:28', '2022-06-07 09:38:49');
INSERT INTO `products` VALUES (30, 4, 'Et vel reprehenderit est.', 'et-vel-reprehenderit-est.', 'Facere tempore nihil non quidem. Est deleniti dolor ut tempora ipsam accusantium. Sint dolor voluptatem est similique incidunt.\n\nItaque et adipisci animi earum amet optio. Ut qui consequatur voluptatem sed nulla qui. In voluptatem adipisci dolores magnam sunt.\n\nQui delectus quos iste corporis dolorem qui. Qui molestias voluptatem enim nam voluptate nesciunt animi. Ut rerum magni laborum sint repudiandae facilis. Possimus dolor tenetur perferendis neque. Quis dolore corporis molestiae.\n\nEt ut ipsam dicta et quos. Doloribus maiores omnis sunt. Ut ex sit sapiente maxime. Quae autem debitis voluptatibus in laboriosam qui animi.\n\nVoluptatem amet eaque est quam accusamus vel rem. Et reiciendis omnis asperiores doloremque cupiditate placeat. Fugit corporis magnam numquam ipsum qui. Dolorem labore deleniti facere labore dolore quo. Et mollitia eos consequatur.', 668000, 61, 2049, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1982-07-02 15:48:39', '2022-06-07 09:38:49');
INSERT INTO `products` VALUES (31, 1, 'Neque tempora amet neque.', 'neque-tempora-amet-neque.', 'Minus soluta maiores aut repudiandae aliquam est. Dolorem consequatur repudiandae nulla ut ipsa. Voluptatem rerum dignissimos nesciunt dicta dolores dignissimos.\n\nHarum non dicta error doloribus. Dolores debitis voluptate voluptatem.\n\nNeque rem dolores natus quidem reprehenderit. Sapiente sint labore doloremque omnis.\n\nDoloremque repellat qui unde et quaerat. Occaecati explicabo est debitis est. Aut soluta sequi ut dolores dignissimos ipsam voluptas impedit.\n\nTempora dolor dicta laudantium sed qui beatae provident. Facere doloremque ea quod repellat. Omnis distinctio fuga facilis unde consequatur.', 988218, 72, 1653, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2009-09-23 22:33:51', '2022-06-07 09:38:49');
INSERT INTO `products` VALUES (32, 1, 'Officia quam tempora et.', 'officia-quam-tempora-et.', 'Laboriosam blanditiis repellendus odit. Quam debitis et beatae alias numquam consequatur commodi in.\n\nMolestiae repellendus repellendus odio minus omnis enim rerum. Debitis fugiat cupiditate aspernatur voluptate reprehenderit qui explicabo. Sit vel voluptatibus omnis perferendis. Esse nam nulla magni quia rerum.\n\nUt fugit accusamus in ut ut aperiam accusantium. Eaque fugiat voluptas est consequatur quis. Harum esse consequuntur perferendis voluptas modi corporis.\n\nEos sapiente quaerat aut aut aut molestiae et et. Maxime deleniti incidunt aut facilis sequi ducimus commodi. Nulla aut et dicta reiciendis ducimus. Nisi esse aut vel quasi. Quis non aut pariatur corrupti doloribus incidunt est.\n\nConsectetur vel sint optio nostrum. Aperiam vel et laboriosam quia. Hic ea maxime ipsa quos quia numquam. Totam itaque ipsum ut aspernatur.', 407904, 43, 1120, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1971-04-08 16:11:23', '2022-06-07 09:38:49');
INSERT INTO `products` VALUES (33, 3, 'Cumque voluptatem et laboriosam.', 'cumque-voluptatem-et-laboriosam.', 'Numquam est similique dolorum non voluptatem atque. Sit sint ut incidunt omnis deserunt sit totam. Saepe non dolorem recusandae facere maiores autem qui earum. Maxime sapiente voluptatibus similique voluptas aut magni.\n\nEt ea velit omnis quia ut eum saepe. Consequuntur perferendis blanditiis tempora cumque perferendis adipisci qui. Earum id suscipit id esse et. Architecto repudiandae animi nam neque voluptatem dolores.\n\nEst ullam nulla asperiores quibusdam dolor. Aut iusto voluptatem commodi. Iusto voluptas eius ut reprehenderit accusamus et vitae.\n\nEsse et quos exercitationem fuga. Temporibus laboriosam sed maxime et amet eos. Unde exercitationem voluptas qui sit id.\n\nVelit aliquid hic quis enim consequatur est accusamus. Qui culpa et unde sunt possimus perspiciatis soluta.', 263828, 63, 3801, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2004-12-24 08:22:20', '2022-06-07 09:38:49');
INSERT INTO `products` VALUES (34, 5, 'Soluta dolore.', 'soluta-dolore.', 'Dolor veritatis explicabo veniam blanditiis saepe dolores in consequatur. Doloremque porro est a sed et praesentium velit ut.\n\nUnde ipsam et quasi deserunt. Rerum nemo in optio doloremque. Et a quia autem eius.\n\nAlias enim et illum cupiditate. Dolorem quis rerum labore voluptatem omnis. Aut suscipit itaque inventore. Sed quod est eum dolorum debitis explicabo.\n\nSoluta molestiae totam numquam. Magnam nobis id ratione sed hic labore voluptatem aspernatur. Ex quia rerum repudiandae perspiciatis delectus iusto temporibus.\n\nPraesentium est ipsa suscipit enim eius debitis officia. Facere doloribus quod consequuntur voluptate rerum est ad ipsum. Libero in est harum quae expedita. Consequatur quae consequuntur dolor modi et et.', 35500, 57, 2182, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1980-08-20 11:01:52', '2022-06-07 09:38:49');
INSERT INTO `products` VALUES (35, 5, 'Eligendi eligendi quisquam sed.', 'eligendi-eligendi-quisquam-sed.', 'Assumenda nesciunt nihil nihil necessitatibus architecto. Ut voluptatum explicabo sed. Ipsum mollitia labore velit consequuntur quia.\n\nSuscipit perferendis aperiam voluptas et itaque ratione. Eum esse earum et aut inventore debitis sed. Aut eum necessitatibus non ratione. Eum quo reiciendis corrupti delectus voluptate qui. Dolorem est architecto nemo ullam pariatur.\n\nFugit est placeat praesentium laborum et reiciendis. Error quia repudiandae adipisci suscipit provident iste officiis. Ratione laboriosam excepturi sit quo ad. Atque sint quos assumenda nobis.\n\nEt consequatur impedit aliquid eum harum ipsum voluptatem. Quis aut sit aspernatur et illo eveniet. Sit nam temporibus doloremque eligendi quam ut ducimus. Consequatur voluptatem ipsam atque quas natus possimus pariatur.\n\nPariatur neque omnis culpa illo sit. Eveniet quod vero aut neque voluptatem doloribus minus. Aut velit incidunt ut. Quia quia est necessitatibus tenetur possimus repudiandae.', 563564, 74, 4942, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1999-04-10 06:10:28', '2022-06-07 09:38:49');
INSERT INTO `products` VALUES (36, 2, 'Tempore voluptatum.', 'tempore-voluptatum.', 'Adipisci accusamus quis repudiandae earum et praesentium optio. Autem reprehenderit quis nobis praesentium et maiores natus. Et ullam quis possimus consectetur omnis cupiditate molestiae tempora.\n\nRepudiandae dolorem praesentium tempora reiciendis qui et non. Voluptas omnis iusto neque rerum. Rerum placeat est autem odit aspernatur earum omnis.\n\nFugiat rerum quis velit tempore. Eum provident rerum ut perferendis praesentium et hic.\n\nSequi totam eveniet doloremque repellat. Blanditiis quam sint natus aperiam quod consequatur ad. Porro sint laboriosam a qui consectetur tempore eligendi voluptatum. Est expedita dicta rerum et numquam doloremque consequatur.\n\nQui omnis adipisci magnam recusandae et perspiciatis sit. Culpa ut voluptatem quibusdam. Ipsum soluta temporibus nihil quasi vero et.', 885480, 29, 4980, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2003-09-15 19:16:11', '2022-06-07 09:38:49');
INSERT INTO `products` VALUES (37, 2, 'Ratione ipsum quos animi possimus.', 'ratione-ipsum-quos-animi-possimus.', 'Commodi mollitia rerum ut ut quos. Ipsam velit dolore quod dignissimos sed. Voluptate deserunt eos quis repellendus earum. Dolore ut eaque et quaerat est.\n\nHarum quasi voluptatem beatae et nobis vel. Sint accusantium fugit quidem maxime. Est iusto omnis quasi voluptatem ut.\n\nOdit voluptatem dolorum quo animi et facilis omnis. Corrupti quo dignissimos qui ipsam. Sed voluptatibus quidem aut voluptas reprehenderit asperiores fuga. Architecto debitis voluptas velit vero omnis quia incidunt.\n\nDolorem quam et quia voluptatibus. Sint et nostrum quod pariatur. Quibusdam et est magni qui neque. Voluptatum porro ullam eum voluptatem.\n\nEaque quia aut ut quis est quia ea. Corporis quod autem est ipsum. Molestiae inventore enim doloribus nisi temporibus qui.', 875153, 66, 2782, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1988-01-29 12:33:42', '2022-06-07 09:38:49');
INSERT INTO `products` VALUES (38, 5, 'Facilis explicabo aut.', 'facilis-explicabo-aut.', 'Qui ad nemo voluptatem nobis. Itaque quia rerum quia voluptas. Quas aut et facilis officiis quas. Cupiditate aut nihil corporis in et voluptatem.\n\nEligendi consequatur veritatis veritatis laborum excepturi. Rerum debitis inventore expedita quisquam laudantium minima. Sit quia ipsa excepturi ea velit.\n\nMolestiae voluptas delectus quia iure sit saepe. Occaecati fugiat doloremque impedit sed delectus illo sit. Ut autem voluptatibus placeat velit. Quia vero quia aut quo ducimus ipsam.\n\nSint quo et autem accusamus et ut. Voluptas ut dolor ab autem neque. Sequi temporibus tempore ut eaque dicta qui autem. Animi debitis et hic inventore soluta saepe quam velit.\n\nFugit dignissimos nulla autem repellendus dolorem. Magni voluptatum esse facilis voluptas eum. Dignissimos tempora et odit qui repellat quae.', 368037, 68, 3468, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1995-01-11 22:45:15', '2022-06-07 09:38:49');
INSERT INTO `products` VALUES (39, 5, 'Odit in neque.', 'odit-in-neque.', 'Soluta dolores possimus asperiores quod vero facere natus. Error et ipsum necessitatibus nemo modi qui harum. Autem non quos eligendi unde.\n\nFacilis aut consectetur eos adipisci. Non expedita ullam accusantium sint repellat accusamus non omnis. Delectus facere quidem totam qui accusantium placeat illum.\n\nMolestiae amet aut nihil culpa fugiat. Voluptate deserunt molestias deserunt ut numquam ea dolores temporibus. Esse quo eos doloremque. Dolor sit dignissimos libero nihil aliquid porro.\n\nFuga temporibus ut consectetur in quis. A voluptas sint consequatur quia. Tenetur voluptatum quo quidem recusandae fuga ipsum consequatur minus. Dolores quisquam nostrum quod repudiandae illo vitae. Vel non hic sapiente molestiae.\n\nOdit ab fugiat praesentium. Fuga nobis rerum occaecati similique a modi suscipit. Delectus sint porro unde reiciendis sapiente velit dolore.', 245579, 30, 3091, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2010-11-26 22:29:55', '2022-06-07 09:38:50');
INSERT INTO `products` VALUES (40, 4, 'Et architecto aut magnam.', 'et-architecto-aut-magnam.', 'Cum rem voluptatem sint dolorem fugit. Odit optio est et vitae qui consectetur quasi. Illum ut provident ipsam facilis ipsum voluptas dolorem. Est numquam incidunt mollitia quia sed et.\n\nIllum non adipisci voluptatibus esse. Et minima a eligendi incidunt nostrum.\n\nBlanditiis quis dolore id cum. Assumenda magnam laboriosam dignissimos. Similique maiores sint vel iste voluptatem. Voluptatibus voluptatem amet enim harum sit et voluptas.\n\nAdipisci et dolorem nisi enim aut voluptas recusandae. Molestiae iure nihil inventore vitae enim sapiente nihil. Dolores consequatur facere esse inventore.\n\nQuo maiores temporibus fugiat modi. Non mollitia et facilis reiciendis occaecati et voluptatibus. Est quidem rerum vel atque cumque.', 15228, 47, 3709, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2019-03-25 01:46:50', '2022-06-07 09:38:50');
INSERT INTO `products` VALUES (41, 5, 'Eaque consectetur.', 'eaque-consectetur.', 'Dolorem amet dolores alias. Voluptatem consequuntur ratione aut excepturi earum corporis. Et maiores dolor rerum molestiae autem.\n\nAnimi accusamus quis dolores eius facere. Iste recusandae sint vel deleniti perferendis dicta. Est officiis sit sunt nulla et eaque est.\n\nNesciunt expedita qui nihil ad voluptas. Quo praesentium eum nulla amet dolor esse cumque vero. Est id maiores rem quia id est. Minima soluta quas est nesciunt odit omnis eum.\n\nReiciendis a magnam est neque cum nulla illum autem. Aperiam vel odio distinctio vitae unde et molestias nisi. Ut maiores ratione eos quas ut enim error. Dignissimos beatae quos in qui.\n\nEligendi quis amet vel. Autem itaque enim a.', 808658, 36, 2302, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2007-05-30 03:50:06', '2022-06-07 09:38:50');
INSERT INTO `products` VALUES (42, 4, 'Quia neque ut eius.', 'quia-neque-ut-eius.', 'Sed explicabo soluta id dolores ut. Blanditiis dolor debitis saepe eveniet. Aspernatur provident maxime aperiam aut aliquam.\n\nVoluptas voluptates nostrum veritatis non voluptatem. Adipisci non laborum mollitia a.\n\nEt possimus ipsa itaque laborum. Architecto numquam aut voluptatem possimus eius aut. Ea hic id recusandae enim sed dolorem veniam.\n\nEos quo in est sed consequatur. Ullam architecto quia quia. Et commodi omnis dolores voluptatem.\n\nDeserunt nihil sit in nam ipsum. Dolor nesciunt repellendus sit enim. Et reiciendis tenetur et asperiores doloribus.', 283401, 24, 2416, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1995-04-21 03:33:50', '2022-06-07 09:38:50');
INSERT INTO `products` VALUES (43, 1, 'Magnam voluptatibus officia.', 'magnam-voluptatibus-officia.', 'Quo rerum totam ut molestiae ipsa consequatur. Porro aliquam ab nisi architecto dolorem. Minus nulla quidem quos praesentium.\n\nAutem dolorem ut ratione sit voluptatem dicta. Porro eligendi aut quia ducimus impedit. Excepturi est hic aut iure. Explicabo nihil dolore ut cupiditate. Fugiat eaque id sit ipsam eligendi quibusdam modi.\n\nEveniet perspiciatis deserunt fugiat consectetur sit quos sed. Minus neque minima quas rem. Rerum laudantium et quaerat placeat totam qui et. Numquam hic dolores quam ut in quia.\n\nDelectus laboriosam maiores modi similique nihil ut eum. Eum odit in iure cum eius.\n\nNihil vel ipsam mollitia. Consequuntur nesciunt et tenetur vero enim. Neque quia quam quia ut. Dolorem enim quod sed quis molestiae amet ut consequuntur.', 962384, 73, 3005, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1993-09-20 06:26:37', '2022-06-07 09:38:50');
INSERT INTO `products` VALUES (44, 2, 'Aut voluptas ea qui.', 'aut-voluptas-ea-qui.', 'Voluptatem adipisci non velit deserunt ea. Animi a labore et ut sequi totam suscipit. Ea harum excepturi accusamus eos. Itaque quia ab tenetur velit in quo laborum in. Ad voluptatem id consequatur placeat est expedita.\n\nIpsam et excepturi nihil quia. Est perferendis beatae deserunt aspernatur dolore placeat quos. Excepturi asperiores porro et nostrum quam.\n\nIllo laboriosam praesentium doloribus molestias sed tempora dicta. Aut vel eligendi magni et. Occaecati et quasi libero quia exercitationem et.\n\nEst non inventore culpa libero corporis non. Dolorem alias suscipit cumque. Ipsum dolor consequatur repellendus aperiam iure.\n\nOptio unde commodi quia veritatis sed rerum. Aliquam dignissimos qui officia quam. Quisquam sed officiis ut adipisci suscipit. Nostrum nam dolore voluptate.', 962800, 22, 3592, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2006-01-03 03:31:35', '2022-06-07 09:38:50');
INSERT INTO `products` VALUES (45, 4, 'Repellendus et reprehenderit impedit.', 'repellendus-et-reprehenderit-impedit.', 'Odit excepturi aut aut eos sunt. Aliquam quisquam itaque tempore id qui nulla est. Molestiae debitis quos ipsam unde ipsum dolorum. Alias fugit ipsa similique labore sunt officiis.\n\nVoluptas molestiae ut asperiores ut enim quis. Et nulla ex velit repellendus neque sint quibusdam. Ut rerum sint ut soluta molestias dolorum enim.\n\nCommodi ea voluptatem atque ullam vero reprehenderit repellat amet. Sequi voluptas non omnis natus voluptatem laborum. Voluptatem pariatur eius officiis ex nihil non. Et nihil libero mollitia distinctio vel voluptatem voluptate optio.\n\nEx repudiandae quod sit deserunt. Fugit assumenda vel sequi a odit molestiae. Aliquam ut laboriosam vero eaque voluptatem nulla minus. Ullam eligendi accusantium nobis itaque.\n\nUllam sed nihil numquam et repudiandae dolorem. Et at ut commodi dolores in qui vero maxime. Est sunt voluptatem assumenda sunt. Autem facere cum voluptatem voluptas aut.', 329660, 37, 2317, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1990-11-10 20:51:52', '2022-06-07 09:38:50');
INSERT INTO `products` VALUES (46, 1, 'Voluptatem qui voluptatem voluptas.', 'voluptatem-qui-voluptatem-voluptas.', 'Ut sapiente nihil voluptates nihil ea omnis. Magni voluptatum sed omnis in. Officiis est aut rerum quaerat possimus qui officiis.\n\nEt facilis libero consequatur ut vel quis non. Et ut atque dicta. Modi debitis repellat unde beatae laborum.\n\nError ipsum quas praesentium fuga quia. Blanditiis rerum numquam praesentium quis eos id corrupti. At atque ut sed animi soluta ullam ipsum. Sint aut suscipit dolorum voluptatem sit.\n\nQuae dignissimos praesentium quia soluta enim. Ex non eligendi qui voluptas nesciunt et. Et molestiae et sint rerum tempore. Eaque et pariatur qui quo et eaque aperiam. In sunt fugiat hic earum recusandae.\n\nLibero ut ipsum cumque ipsa ut earum. Culpa dolore sit impedit quos. Ut quia quam consequatur. Similique quidem ad rem officiis.', 407609, 17, 1703, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1999-10-02 08:26:29', '2022-06-07 09:38:50');
INSERT INTO `products` VALUES (47, 4, 'Dolore sed quibusdam aperiam quo.', 'dolore-sed-quibusdam-aperiam-quo.', 'Est voluptas at qui deserunt nulla. Quod quia modi placeat ipsa consequatur illum est. Fugiat rerum voluptatem labore excepturi unde. Aspernatur corporis illo sed ea eveniet accusantium et et.\n\nDolores asperiores cum qui illum quisquam vero. Pariatur hic nihil id hic dolor eaque sunt. Quibusdam aspernatur earum odio vel qui libero hic. Tempore repellat quisquam nam harum. Recusandae suscipit voluptate saepe magnam molestias.\n\nOptio illum recusandae aliquam aspernatur. Eius quibusdam quis corrupti ipsum. Quasi modi culpa autem eos saepe aut. Unde natus reiciendis ut voluptatum atque dolorum.\n\nEt in rerum nihil repellendus aperiam. Rem quibusdam ad odio ea. Voluptatem veritatis quam atque vel non.\n\nVoluptatum officia repudiandae sit ipsum id aperiam. Ut rerum quidem harum eligendi beatae. Voluptas eveniet inventore et porro quis.', 934453, 21, 2662, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2007-02-14 19:50:41', '2022-06-07 09:38:50');
INSERT INTO `products` VALUES (48, 2, 'Consectetur quod.', 'consectetur-quod.', 'Voluptas est consequatur ullam officiis cumque eum. Dolor placeat quod illum. Qui sed et voluptatibus at laudantium accusamus sequi. Nihil nihil aliquam vel sed id voluptates.\n\nAutem non quia harum quis. Quasi quam facere necessitatibus ducimus commodi rerum. Ullam qui sed maxime voluptatem nesciunt excepturi sunt.\n\nAutem cum sunt mollitia numquam. Nihil sit incidunt quo totam harum et. Quae magni ea consequatur debitis perferendis ex quis. Reiciendis et minima illo aut ut. Qui quos illo sapiente omnis qui in.\n\nTemporibus alias magnam voluptas perspiciatis vitae. Ea omnis quae in velit. Exercitationem est quasi blanditiis harum.\n\nLaborum aut debitis ullam libero. Amet quo voluptatem temporibus ut ratione. Eos quia dolor accusamus assumenda expedita.', 980757, 0, 2846, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1988-05-07 09:30:55', '2022-06-07 09:38:50');
INSERT INTO `products` VALUES (49, 1, 'Numquam reprehenderit similique.', 'numquam-reprehenderit-similique.', 'Veritatis ullam fuga saepe delectus. Aliquam quo molestiae illo repellat aut velit. Dolor mollitia dolores dicta ut et ut iste.\n\nSit sapiente blanditiis ut. Facilis corporis aspernatur ratione provident quas libero. Consectetur incidunt et aut. Soluta esse sunt esse sed assumenda quisquam cupiditate. A maxime rerum voluptatem soluta.\n\nConsectetur nemo porro quisquam consectetur aliquam dolorem consectetur vel. Laboriosam sunt commodi repellat corrupti et. Maxime nisi omnis recusandae illo doloribus excepturi quis. Facere iste similique quo non deleniti aut quia.\n\nAperiam ea animi atque minima architecto fugit natus. Ut voluptas cum eum ducimus nisi provident. Explicabo dolor ut doloremque nostrum ut rerum. Perspiciatis deleniti quia officiis maiores molestiae possimus enim quae. Perspiciatis provident tempore dolorem ut aut qui explicabo consequuntur.\n\nSit quia autem quo velit sequi. Vel nisi placeat tempore sit voluptatum ad ipsum perferendis. Eligendi illo et voluptatem. Sit illum sed est mollitia.', 709746, 74, 2421, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1971-12-22 11:04:06', '2022-06-07 09:38:50');
INSERT INTO `products` VALUES (50, 4, 'Iusto quo omnis temporibus delectus.', 'iusto-quo-omnis-temporibus-delectus.', 'Rerum reprehenderit quis cum voluptatum et facere. Aspernatur vero et ea in. Sapiente dolor nihil illo sed.\n\nEt soluta eos rerum voluptatem non quis. Molestias doloremque nemo nisi quos modi voluptas. Quis odit dolores reprehenderit aut dolores. Omnis sequi sit tempore est aut rerum ipsam.\n\nDolore impedit est et occaecati aut neque. Sit dolor iste qui quia sed quia vel officia. Suscipit qui alias dolorem debitis voluptatibus dolores. Vitae et corrupti dolorem corporis.\n\nDolorem velit et tenetur iste rerum. Quibusdam maiores laboriosam natus autem molestias. Aliquam odio aspernatur recusandae aut vero minus consequatur.\n\nVelit consequatur doloremque eius maxime dicta quidem. Incidunt aut doloribus reiciendis enim autem doloremque non voluptatum.', 332496, 57, 2470, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2005-03-19 02:56:00', '2022-06-07 09:38:50');
INSERT INTO `products` VALUES (51, 3, 'Dicta error rem.', 'dicta-error-rem.', 'Minus et dolore non ducimus sint. Itaque provident dolor qui. Consequatur consectetur fugiat et ea eaque mollitia necessitatibus occaecati.\n\nUt temporibus earum magnam aut. Ut fugiat beatae occaecati expedita nihil atque dolore. Ea eligendi dignissimos voluptate fugit provident. Unde tempore eius vel ipsum assumenda omnis. Cupiditate voluptatem perferendis eos.\n\nAd aut ex modi dicta. Omnis voluptas est a repellendus cumque veritatis sed. Est dolores laborum omnis ipsa qui et qui.\n\nTempore eveniet sed tempora neque assumenda harum. At aut perferendis ex autem repellendus. Et nobis autem qui eos. Sunt ducimus ipsa quo ducimus earum.\n\nEos nam quibusdam vitae vel sit. Dolor voluptas magnam dolor accusamus dolor. Qui corrupti vitae tempore voluptas aut dicta facere. Enim vero enim doloremque quae.', 763918, 49, 2581, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1980-04-27 23:57:47', '2022-06-07 09:38:50');
INSERT INTO `products` VALUES (52, 1, 'Voluptatem voluptatem eum nemo.', 'voluptatem-voluptatem-eum-nemo.', 'Hic soluta nesciunt et quia atque itaque mollitia. Illum consectetur non omnis consequatur magnam placeat. Tempore minima odio ut. Enim et qui in porro impedit beatae. Expedita dolorum totam sed qui.\n\nIpsum voluptate rerum sequi ut neque ab. Sapiente quidem quibusdam sequi consequatur. Id id quidem cumque molestiae. Id rerum aut omnis qui repellat quisquam voluptatem. Consectetur quae incidunt quia repellendus esse quaerat animi deserunt.\n\nVoluptatem corporis est et magni. Voluptas sit sed qui nobis et dolore libero.\n\nEsse id sunt velit voluptatem nemo et. Ut inventore aperiam ut cum rerum ducimus recusandae. Cupiditate est quas cumque tempore dolores ut.\n\nDeserunt eveniet quas libero amet itaque. Dolore saepe dolorem ratione quis odit. Facere voluptates rerum odio voluptates ut cum esse.', 276628, 13, 3582, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1988-01-18 14:19:21', '2022-06-07 09:38:50');
INSERT INTO `products` VALUES (53, 1, 'Vitae et.', 'vitae-et.', 'Dicta tempora maiores iusto nam consectetur. Omnis quia assumenda inventore odio quasi hic quia. Dolor id officia est aut expedita beatae.\n\nAut et maiores laudantium distinctio qui adipisci laudantium. Qui ut voluptatum molestias asperiores non sit. Ipsam excepturi rerum dignissimos sapiente veritatis qui ratione neque.\n\nHarum blanditiis dolor perferendis asperiores asperiores. Dolor accusamus non autem voluptatem eos ut perspiciatis. Quis quisquam sit aspernatur maiores. Voluptatem consequatur et atque qui quae iusto commodi.\n\nIncidunt est omnis eum. Laboriosam ipsa est doloremque iusto cumque sapiente. Quis nisi veritatis quam beatae incidunt odio.\n\nVitae voluptas molestiae occaecati. Voluptatibus nam molestias nobis debitis. Unde consequatur quas similique rem qui quos voluptate qui. Similique beatae placeat odit veritatis dolor ipsam error.', 229420, 7, 3133, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1984-08-09 05:22:56', '2022-06-07 09:38:50');
INSERT INTO `products` VALUES (54, 4, 'Est quia saepe.', 'est-quia-saepe.', 'Odit quia consectetur dolorem velit. Iste tenetur veritatis ea voluptas asperiores saepe. Quas voluptatem inventore magnam voluptas incidunt aut aut. Qui voluptatem sit laboriosam maiores.\n\nDolor nesciunt fugit dignissimos unde mollitia. Vel est debitis voluptas similique.\n\nSequi libero aspernatur odit et. Consequuntur vel impedit quod et eum est. Dignissimos quasi sit nulla rerum.\n\nAccusantium eveniet laborum dicta voluptatibus repudiandae. Modi quaerat quod at repudiandae sint earum. Nihil nobis quas nemo fugiat est ut.\n\nUllam reprehenderit dolore ab temporibus blanditiis. Dolore animi magni illo sint. Aspernatur optio suscipit aut magni ullam placeat praesentium.', 217297, 44, 4639, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1971-12-18 20:15:40', '2022-06-07 09:38:50');
INSERT INTO `products` VALUES (55, 2, 'Quo quisquam illo voluptas.', 'quo-quisquam-illo-voluptas.', 'Illo qui est id impedit cumque. Et quis ea at qui. Nihil at voluptate nostrum molestias cum.\n\nLaudantium voluptatem ex alias quo soluta minus neque. Velit facilis non sit sed dolorem est. Sed et rerum aut eius accusamus blanditiis voluptatum.\n\nDolorem tempore aspernatur enim vitae. In sunt molestiae tempore quae numquam. Et necessitatibus expedita molestiae est. Iusto pariatur qui in commodi est.\n\nEt deserunt et quaerat quod. Sed sit modi vero doloribus neque autem. Fugiat dolorem saepe expedita id voluptatum qui excepturi. Consequatur illo vitae non odit. Placeat quis in ut atque reiciendis.\n\nBeatae reiciendis nesciunt rerum eaque fugiat ut quo. Debitis odit qui autem fuga nostrum tenetur ut. Asperiores omnis beatae ut libero suscipit earum. Sed est nesciunt voluptatem qui.', 426886, 26, 2861, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2000-06-12 22:01:10', '2022-06-07 09:38:50');
INSERT INTO `products` VALUES (56, 3, 'Optio tempora sapiente.', 'optio-tempora-sapiente.', 'Magni nostrum accusamus ut qui eos. Corporis quos soluta delectus explicabo temporibus iusto vero. Numquam vel aut officia cum unde.\n\nLibero consequuntur voluptas dolores commodi beatae et qui ab. Ut et minima quis aspernatur. Quis quia nihil quam.\n\nEarum ut tempore et fugit officia consequatur. Laboriosam aut a nemo et quia similique qui.\n\nAspernatur unde aut perspiciatis repellat omnis. Sit sit voluptatem suscipit consequatur ratione consequuntur doloremque minus. Est ipsam dolore doloremque consequatur commodi modi et nulla. Magnam pariatur et vel velit enim aut consectetur.\n\nA ab id veniam ullam enim id. Fugit velit dolorem minima omnis maxime inventore. Inventore dolores at dolore eligendi. Officia omnis ut nobis dolorum voluptatibus.', 305630, 12, 3334, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1985-03-07 08:41:42', '2022-06-07 09:38:51');
INSERT INTO `products` VALUES (57, 3, 'Voluptas voluptatem ullam dignissimos.', 'voluptas-voluptatem-ullam-dignissimos.', 'Asperiores non incidunt dolorem rerum rem rerum. Vel officiis possimus rerum numquam in est. Numquam eum eligendi vel optio maiores. Possimus consequuntur consequatur aut et at.\n\nVoluptas laboriosam autem esse similique. Numquam alias accusamus mollitia ipsa.\n\nNon quos aut dolores odio dolor ullam temporibus. Rerum voluptas et earum incidunt repellat unde dolor. Quibusdam sunt maiores nulla ut.\n\nVero fugit necessitatibus occaecati illo quod. Voluptatem est perferendis fuga debitis rerum. Praesentium laudantium sit nemo corporis explicabo aliquam.\n\nArchitecto qui aspernatur beatae. Repellendus quia neque ut recusandae.', 438077, 75, 3243, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2009-02-01 13:48:36', '2022-06-07 09:38:51');
INSERT INTO `products` VALUES (58, 4, 'Enim omnis.', 'enim-omnis.', 'Consequuntur unde aut modi consequatur delectus. Sunt omnis id illo quos ipsum odio deserunt. Odit nulla id dolores ut quae fugit tenetur. Reiciendis earum possimus quaerat eaque officia totam ea dolor.\n\nRepudiandae nostrum saepe commodi nihil qui. Saepe rerum ipsam optio. Qui voluptatem corrupti vel sed iusto. Commodi cumque odit autem non.\n\nLaborum fugit vitae vitae ipsa velit. Dolores ut ut dicta delectus et reprehenderit error. Dolor amet maxime est nisi vero ea. Animi consequuntur cupiditate omnis earum laborum. Velit voluptates nobis qui beatae.\n\nNon saepe nemo corrupti mollitia. Sed sint quaerat vitae ad numquam est eius voluptas. Est necessitatibus animi deleniti et quis omnis et voluptas. Numquam delectus id quibusdam ratione ipsam ratione.\n\nIusto velit assumenda ab repellendus. Dignissimos maxime et voluptates maiores aut. Soluta sapiente minima iure ut tempora.', 648209, 27, 1409, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2001-05-01 20:35:55', '2022-06-07 09:38:51');
INSERT INTO `products` VALUES (59, 2, 'Ullam aliquam vel iure.', 'ullam-aliquam-vel-iure.', 'Aut ab voluptatibus velit. Doloribus odit eum quis qui minus rerum. Ab consequuntur aliquam aliquam.\n\nEt est totam eveniet perspiciatis. Et mollitia qui est. Ea quo velit molestias autem consequatur. Ipsam maxime sit ut.\n\nDistinctio est similique alias. Ab est nisi quis expedita maiores. Facilis eius deleniti unde consequuntur molestiae ducimus. Voluptate aut iste quis rerum voluptatem.\n\nCum assumenda aliquid iure quibusdam sunt. Beatae mollitia odio rerum esse exercitationem sunt rerum. Aut sapiente aspernatur qui et.\n\nAut officiis maiores et natus vel. Deleniti inventore magni eos iure. Voluptas est harum neque rem.', 617523, 43, 1729, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2000-05-11 02:24:48', '2022-06-07 09:38:51');
INSERT INTO `products` VALUES (60, 5, 'Quasi laudantium explicabo ea.', 'quasi-laudantium-explicabo-ea.', 'Autem enim cumque aut sed ipsum. Autem similique occaecati qui nesciunt voluptas voluptate et quo. Quia sed quidem quis iure non.\n\nNon in molestias illum. Non ipsam qui repellendus enim. Perferendis aut a eum omnis sed.\n\nAut voluptatum suscipit sit labore quam praesentium. Officia placeat nostrum possimus corrupti sequi quia. A aut ab quisquam nihil minus doloribus. Sapiente sit occaecati ducimus ut omnis totam quisquam.\n\nAtque officia labore itaque repellat voluptas est minima. Nihil optio tenetur voluptatibus id est. Temporibus et et voluptas a.\n\nDoloremque provident qui quibusdam non non et maiores. Est officia esse accusamus illo eos aliquam ad voluptate. Ratione aperiam esse consequatur soluta. Blanditiis iste provident aut ut vel. Vitae voluptatibus recusandae iste illo.', 193146, 21, 4874, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1976-04-16 06:21:01', '2022-06-07 09:38:51');
INSERT INTO `products` VALUES (61, 2, 'Assumenda voluptatem hic magni.', 'assumenda-voluptatem-hic-magni.', 'Commodi sed non eaque consectetur voluptas. Libero animi aperiam sed neque. Sequi occaecati eum enim omnis. Vitae aut excepturi incidunt iusto aspernatur saepe soluta doloribus.\n\nQuisquam pariatur deleniti qui omnis voluptatem est explicabo. Amet sapiente ut nobis quo. Sunt dignissimos beatae saepe quod.\n\nMolestiae est sequi ipsum ut maxime tenetur quis. Molestiae sed aut architecto. Incidunt et corrupti quis quia.\n\nOccaecati ipsam quibusdam voluptatibus distinctio enim consectetur. Beatae magni molestiae quos hic vero praesentium quos. Sit rem mollitia sed beatae. Magnam nihil sit excepturi.\n\nVoluptas facere sit perferendis accusantium commodi. Aut est quaerat repudiandae odit fugiat quo. Itaque tempore dolore et ipsum. Tempora porro quia et omnis.', 759463, 48, 2109, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1991-03-27 12:36:21', '2022-06-07 09:38:51');
INSERT INTO `products` VALUES (62, 1, 'Qui ea qui doloremque.', 'qui-ea-qui-doloremque.', 'Voluptatem tempore et aut optio maiores eius eum. Illum dignissimos odit adipisci aliquid suscipit fuga. Nihil atque libero exercitationem.\n\nTenetur cupiditate et reprehenderit itaque officiis sunt. Ipsa et numquam aut consequatur non sit tenetur.\n\nIn quae rem animi sed ut omnis qui maiores. In dolorem aliquid veritatis dolorem suscipit et ut. Corrupti illum tempora vel porro non alias quidem nisi.\n\nVoluptatem veritatis molestias neque nisi. Omnis et iste libero veniam. Est laborum accusantium nam et.\n\nIste suscipit repellendus et dolorem et blanditiis distinctio. Error voluptas voluptates et molestiae non. Magni beatae aut enim eos soluta eum.', 604969, 68, 4673, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1975-10-07 15:24:57', '2022-06-07 09:38:51');
INSERT INTO `products` VALUES (63, 3, 'Quas voluptate.', 'quas-voluptate.', 'Rem sit eaque accusantium possimus. Blanditiis ipsam voluptatem quia qui minus et reiciendis. Id quod accusamus accusantium ipsa optio ullam.\n\nOfficiis excepturi quasi hic labore sint. Laborum dolor quis sit nihil iste delectus.\n\nAt et tempora fugiat unde. Et tempore officia voluptas voluptatem sed et deserunt est. Officia recusandae quam ut. Nihil assumenda vel aperiam totam optio qui.\n\nCorrupti voluptas et recusandae inventore rerum. Iusto inventore dolor repudiandae quia quisquam sunt. Voluptas ex voluptatem fuga in doloribus qui.\n\nCulpa cum accusantium dolor voluptatibus. Doloribus illum sed voluptatem sit. Quas et voluptatem nisi quod expedita et accusantium. Voluptatibus quia ut eum dicta laboriosam porro quam.', 980301, 72, 2256, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2007-04-17 18:55:06', '2022-06-07 09:38:51');
INSERT INTO `products` VALUES (64, 4, 'Sint soluta eos.', 'sint-soluta-eos.', 'Nam qui explicabo praesentium officiis nam vero sint occaecati. Consectetur sit quae vel quo quibusdam et. Possimus eum consequatur neque voluptatem.\n\nUt explicabo accusamus maiores dolorem et blanditiis adipisci. Vero minima quo ea ut non aut dolores molestias. Ut sed ullam atque eum. Quasi nihil facilis ratione culpa et.\n\nExercitationem nesciunt in rerum ipsa iure dolore iure. Cumque enim necessitatibus nostrum dolores unde similique. Animi reprehenderit dolorem enim quisquam labore est.\n\nEos ducimus veritatis rem excepturi odit facere ut voluptates. Error minima cumque facere explicabo atque itaque.\n\nDelectus id qui voluptates mollitia et. Reprehenderit omnis soluta commodi occaecati. Suscipit quasi nihil modi corporis adipisci. Qui iusto aut rem.', 440394, 67, 1660, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1987-05-30 05:03:54', '2022-06-07 09:38:51');
INSERT INTO `products` VALUES (65, 3, 'Et dolore atque.', 'et-dolore-atque.', 'Voluptatum et quia vel sit in. Modi perferendis reiciendis voluptatem aliquam libero. Non qui ut recusandae.\n\nCumque id culpa non aliquid sed aut. Voluptatem labore commodi sequi voluptatem. In vel fuga ipsam vel quibusdam modi. Assumenda et culpa aut est.\n\nVeritatis commodi voluptatem quis similique nostrum. Ut autem aut possimus omnis rerum saepe. Hic modi ipsum deserunt voluptatem. Blanditiis aliquid quas rem quis voluptas enim.\n\nUt libero qui quaerat quia perferendis ipsa repellat. Incidunt aut velit id et. Nostrum quas voluptatem ipsa cupiditate voluptate.\n\nAd rerum aut ut ullam voluptates neque cupiditate ipsam. Ex provident voluptatem consequatur sit et. In ut neque quo magnam.', 264033, 71, 4031, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2006-12-12 23:28:19', '2022-06-07 09:38:51');
INSERT INTO `products` VALUES (66, 2, 'Eveniet officia velit.', 'eveniet-officia-velit.', 'Voluptates non minima a. Iure sed ex non est quia. Necessitatibus consequatur iure praesentium facere. Corrupti soluta error velit et ad dolores enim.\n\nCupiditate expedita et iste labore voluptas corporis. Nihil quibusdam ut et rerum adipisci ad suscipit. Porro ducimus perspiciatis quia necessitatibus doloremque odio eligendi non.\n\nOptio sit quia nisi tempora qui rem. At harum deserunt rerum delectus cum et iure non. Dolorem maxime quod qui est dolorum pariatur. Alias vel in veniam ipsum explicabo ex.\n\nPerferendis ea optio quia quis totam iusto aut necessitatibus. Omnis voluptas aut non quis modi et qui. Voluptatum amet illo eos praesentium eum quo veniam provident. Amet sunt quae aut optio ut. Neque quos saepe ipsa cupiditate quis optio qui sit.\n\nOmnis ducimus et eaque reiciendis. Fuga tempora iure illo et sed dignissimos iusto. Veniam aliquid distinctio in est cumque. Officia nemo voluptatem minus ut blanditiis accusantium qui. Eum velit nihil hic aut aut porro.', 723396, 34, 4552, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1981-01-09 18:48:54', '2022-06-07 09:38:51');
INSERT INTO `products` VALUES (67, 1, 'Consequatur omnis ratione officiis.', 'consequatur-omnis-ratione-officiis.', 'Necessitatibus atque consectetur unde id magni cumque. Repudiandae sunt ex ut excepturi. Facere unde voluptas aut illum perspiciatis.\n\nVeritatis quaerat eos et eveniet praesentium. Dignissimos et provident maxime rerum mollitia ab. Ad fuga assumenda et perspiciatis architecto commodi dicta.\n\nAut ad et et facere ut velit molestiae. Non non quisquam culpa. Excepturi iste aperiam esse et ut eveniet occaecati.\n\nExpedita tenetur ducimus iste sapiente omnis. Aut mollitia ducimus id perspiciatis dolorum qui. Repudiandae a quis et quasi. Facere mollitia perspiciatis et commodi aut.\n\nEnim quis sit ut deleniti. Sed molestias dicta dolore eos harum dolorem non. Eaque cupiditate iure culpa repudiandae.', 503962, 25, 1247, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1995-11-02 03:37:25', '2022-06-07 09:38:51');
INSERT INTO `products` VALUES (68, 4, 'Voluptatibus ipsum voluptatem explicabo.', 'voluptatibus-ipsum-voluptatem-explicabo.', 'Voluptate ad totam vel quidem. Nisi accusantium quos optio qui totam. Illo itaque aut inventore. Unde voluptatum similique voluptatem soluta cupiditate voluptatum magni.\n\nDolores voluptates eos officiis alias consequatur maiores. Quidem aperiam dolorem ab placeat quis. Ut voluptas quam occaecati dolor veritatis.\n\nAliquid dolores repellat hic est voluptatum. Et quod rerum aut voluptatem quos aut adipisci. Deserunt esse eum nesciunt quae.\n\nDignissimos perferendis ab repudiandae vitae pariatur. At quidem et ducimus enim enim et. Id id quis ipsam voluptate veniam.\n\nEt voluptatibus corporis quia qui consequatur assumenda. Quas recusandae fugiat et quis enim voluptate. Facilis consequatur est et veniam iure eius nulla quibusdam.', 198995, 25, 1777, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2018-07-16 04:49:56', '2022-06-07 09:38:51');
INSERT INTO `products` VALUES (69, 2, 'Quia quis nostrum.', 'quia-quis-nostrum.', 'Nihil maxime ea a. Quam ut culpa nulla neque nam. Est accusantium aut dolore voluptas quo.\n\nNobis recusandae illum autem vel. Eos reprehenderit voluptates rem tenetur voluptatem distinctio ea. Eum accusantium nobis repudiandae voluptatem. Repellat sunt eligendi odit qui eius atque. Sit aut occaecati qui quo doloremque perferendis sint.\n\nFacere mollitia facilis vero. Mollitia necessitatibus et aut ut tenetur non. Aliquid aut ut nemo doloremque nihil et quis.\n\nSunt a alias corporis non consequatur rerum. Consequatur odio aut nihil iure et. Architecto doloribus aut excepturi.\n\nPerspiciatis vitae libero autem. Doloremque ducimus ut et. Rerum quia corporis sapiente. Quam quis recusandae quisquam incidunt perferendis qui blanditiis dolore.', 624214, 62, 4842, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2007-11-25 01:39:07', '2022-06-07 09:38:51');
INSERT INTO `products` VALUES (70, 3, 'Est maxime omnis.', 'est-maxime-omnis.', 'Distinctio laborum doloremque similique et sapiente. Ullam veniam et laborum et. Dolorem dolores deleniti atque voluptatem.\n\nQuo quae aut qui suscipit veniam iure aut et. Velit similique praesentium quibusdam autem ut quis. Quod harum esse aut corrupti ut nulla dolores. Distinctio eum nihil tempore commodi tempora consequatur corrupti.\n\nUllam ut expedita voluptas aut totam sit. Et distinctio ex repudiandae sed. Doloremque exercitationem deserunt omnis maxime. Dicta quaerat dolores ipsa dolor fuga.\n\nLabore magnam dolores et aut. Vel deserunt qui accusantium voluptatum. In officia sit doloremque ea veritatis.\n\nCommodi odio veniam iusto ut nam. Ad quis cupiditate omnis omnis ipsum. Aperiam aut ullam ut adipisci eaque aut numquam.', 258835, 62, 1946, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1999-12-06 13:30:06', '2022-06-07 09:38:51');
INSERT INTO `products` VALUES (71, 3, 'Deleniti suscipit eum unde asperiores.', 'deleniti-suscipit-eum-unde-asperiores.', 'Vero minus ea ut minima. Fuga eos consequatur dolores quia. Assumenda perspiciatis sit amet est. Unde sed quas explicabo eum iure.\n\nQuia ipsam alias velit alias aut dolores. Cupiditate dolorum suscipit qui quaerat quia dolor aut neque. Dolorem doloremque voluptatem rerum at aut deleniti fugit.\n\nExercitationem sunt non eos totam. Laborum aut ea quidem accusamus laboriosam. Officia aperiam voluptatibus aut. Magni qui rerum architecto omnis culpa ea.\n\nQuia quas dignissimos laudantium accusamus. Rerum tenetur dolores dolores voluptas. Quia nihil enim aut et autem laboriosam. Nesciunt beatae ut voluptate unde nesciunt nihil expedita. Quaerat cumque necessitatibus possimus sed qui et.\n\nCum omnis ratione rerum nulla mollitia voluptates provident. Excepturi incidunt fugiat vitae deleniti reiciendis qui omnis. Eveniet et animi dolorem officia velit qui. Ipsam qui molestiae assumenda rerum repellat voluptatem impedit aut.', 52244, 40, 2337, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1995-04-13 13:38:42', '2022-06-07 09:38:51');
INSERT INTO `products` VALUES (72, 3, 'Illo temporibus distinctio et.', 'illo-temporibus-distinctio-et.', 'Repudiandae id repudiandae similique quam dolorem. Eaque voluptatem ab qui sequi optio ipsum accusamus. Id aperiam sed dolor ea quas. Optio qui et qui ut et iste. Quia voluptatibus molestiae et eum.\n\nAd impedit ut autem sit saepe. Voluptatem vel iusto est reiciendis. Tempora unde illum fugit eius omnis quibusdam similique.\n\nVoluptatum recusandae dolor reprehenderit temporibus eveniet. Debitis voluptatem saepe voluptatibus praesentium qui. Corrupti iure cum numquam.\n\nEos rerum aliquam aspernatur dolorem voluptatem. Ut est optio illum voluptas consequatur blanditiis fugiat ipsam. Odio molestiae necessitatibus ut sed id adipisci expedita.\n\nSint voluptas ut fugit. Sed accusantium qui nobis quod. Rerum quam expedita in et excepturi earum necessitatibus et. Adipisci eos id itaque accusamus reprehenderit non.', 934960, 24, 1064, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2017-05-22 20:34:29', '2022-06-07 09:38:51');
INSERT INTO `products` VALUES (73, 5, 'Et harum omnis.', 'et-harum-omnis.', 'Repellendus fugiat consectetur aperiam qui qui tenetur. Praesentium natus tenetur consequatur numquam beatae pariatur. Beatae odio optio molestias eius. Velit odio qui doloribus eum repellat amet corporis.\n\nTemporibus explicabo ipsa aut non. A fuga natus commodi sapiente iure. Consequuntur neque commodi excepturi quisquam provident aliquid exercitationem. Voluptatibus et in quia ut ipsam incidunt.\n\nQuasi sit vel veniam suscipit. Temporibus qui consequatur maxime earum velit aut. Est et perferendis nam sint.\n\nAut corrupti sequi blanditiis molestiae. Aspernatur quidem nostrum quia tempora asperiores est eveniet. Veniam quaerat velit earum quibusdam sequi voluptatem enim voluptatem.\n\nAsperiores aut sit sed et nobis qui nihil. Nam odit in ut nobis voluptas quo quasi explicabo. Vel et ducimus sit velit optio iste. Minus harum amet culpa qui.', 850937, 54, 2380, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2019-01-09 17:22:27', '2022-06-07 09:38:51');
INSERT INTO `products` VALUES (74, 5, 'In quod consectetur rerum.', 'in-quod-consectetur-rerum.', 'Quasi voluptatem molestias debitis debitis soluta esse est. Dolorem aut quasi voluptas corrupti consequuntur vel id. Culpa quo autem nihil laborum. Ipsa iure dolor eum alias.\n\nQuaerat sit inventore ea labore. Ullam dolor sunt ducimus nihil unde quo.\n\nDolores voluptatem et voluptatibus voluptas iure non. Qui sint laborum deserunt eos expedita expedita odio repellendus. Deserunt qui quibusdam non possimus rem rerum eaque. Libero rerum est vitae omnis.\n\nQuidem consectetur non odio quis sed assumenda. Vel ut impedit aliquam error nesciunt ut.\n\nInventore et inventore dolore inventore eius corrupti at. Asperiores fugit sint et ea recusandae beatae placeat aut. In in debitis at ut. Et eos molestiae sed iste.', 104817, 36, 2177, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2019-03-16 00:54:24', '2022-06-07 09:38:51');
INSERT INTO `products` VALUES (75, 1, 'Voluptate consequatur eius natus.', 'voluptate-consequatur-eius-natus.', 'Molestiae consequatur qui excepturi quam eligendi alias. Porro sunt non saepe eum.\n\nIure et praesentium dignissimos. Cupiditate deserunt alias voluptatem fugit. Quia ea ex mollitia veritatis.\n\nOdio qui unde quos at deleniti est aut. Dolor magni numquam praesentium ex accusantium. Dolorem eius placeat earum ut ad.\n\nMolestiae vel doloribus ex maxime. Consequatur culpa eum quas numquam. Aliquid nam molestiae corrupti dignissimos praesentium fuga enim id. Est nihil expedita quis dolor aut.\n\nDolores sunt cum similique neque. Omnis enim sequi doloribus sint. Quasi omnis rerum est et repudiandae. Et occaecati consectetur illum totam et quis culpa.', 363975, 10, 4048, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1989-12-21 13:58:59', '2022-06-07 09:38:51');
INSERT INTO `products` VALUES (76, 1, 'Dolorem eum repellendus.', 'dolorem-eum-repellendus.', 'Enim occaecati et rerum enim error. Sequi dolore quisquam possimus tempora et sequi aperiam. Aspernatur repellendus ea numquam molestiae. Maiores aspernatur natus facilis debitis eius quis assumenda. Cumque cupiditate sit quia architecto laboriosam deserunt culpa.\n\nA et fugit praesentium vel officia consequatur qui. Tenetur porro ipsa aut consequatur aspernatur qui. Minima odit non numquam maiores ipsam pariatur vel.\n\nAtque magni temporibus perferendis molestiae. Nesciunt velit expedita aliquam nihil quod illum. Accusamus sunt perspiciatis tenetur quod quod est dolor. Accusamus non rerum aut ut pariatur.\n\nConsequuntur dolor est quaerat esse fuga quia voluptas. Provident ea voluptate rerum dicta sed atque. Enim et aspernatur vel consequatur libero molestias eum. Aut cupiditate non eligendi numquam repellendus recusandae fugiat.\n\nEt praesentium eaque aliquam sit voluptatibus aut delectus. Fuga aut suscipit aut. Quod adipisci praesentium ut et commodi.', 695697, 20, 2132, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1970-04-22 06:53:48', '2022-06-07 09:38:51');
INSERT INTO `products` VALUES (77, 2, 'Et corrupti error repudiandae.', 'et-corrupti-error-repudiandae.', 'Ipsam et neque perferendis. Nemo aperiam ex illum rem omnis delectus.\n\nNobis est expedita nihil sed possimus aut. Asperiores natus dolorem deleniti non. Accusantium libero quidem ad quia quia molestias voluptatem et. Asperiores sint molestiae asperiores cupiditate et.\n\nBlanditiis sunt nihil possimus recusandae unde architecto libero. Mollitia sit perspiciatis non porro autem in reprehenderit. Nihil sed ipsam aut. Distinctio odit sed fugit magni dignissimos molestias laboriosam.\n\nSimilique commodi assumenda impedit est eum rerum ut. Debitis nam eligendi modi perferendis dolor quae dolores. Commodi repudiandae veritatis aut ratione sint possimus. Sint iure ducimus aut modi dolorem quidem amet.\n\nAsperiores culpa perspiciatis est mollitia. Et tempore aut voluptas eius optio. Nesciunt ex omnis sed. Est nostrum in nam quasi ut aut.', 476817, 69, 1401, 97, 'product.jpg', 'product.jpg', 'product.jpg', 3, '2020-01-14 03:43:17', '2022-06-07 09:38:52');
INSERT INTO `products` VALUES (78, 4, 'Officia aut fuga natus aut.', 'officia-aut-fuga-natus-aut.', 'Distinctio dignissimos aut vel. Sint voluptatibus facilis ipsa aut autem vel ut. Qui et ut cumque officia blanditiis. Vel ut fugiat hic consequatur. Repellendus assumenda beatae itaque ratione libero.\n\nAccusantium nostrum quo laboriosam omnis hic nihil. Velit similique esse et voluptatibus. A commodi necessitatibus quibusdam dolor commodi nemo quas molestiae.\n\nOdio quia itaque autem. Expedita consequatur enim veniam eveniet sunt suscipit possimus. Consequatur delectus voluptatibus consequatur blanditiis dolorum qui est. Mollitia doloremque odio et qui quasi qui quidem.\n\nMolestiae nam et est aut. Fuga corporis libero numquam omnis. Quasi quae doloribus voluptatum debitis eos facilis quis. Excepturi nesciunt soluta et.\n\nBlanditiis explicabo laborum facere laboriosam recusandae autem ducimus. Et fugit praesentium quas veniam. Tempore nam sed assumenda odit voluptatum. Voluptatibus voluptatem perspiciatis asperiores dolorem ut dignissimos commodi.', 85529, 68, 3926, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2008-04-30 06:52:37', '2022-06-07 09:38:52');
INSERT INTO `products` VALUES (79, 4, 'Rerum illo aliquam ut.', 'rerum-illo-aliquam-ut.', 'Repellat consequuntur sit provident inventore harum nulla. Voluptatem minus nemo debitis nihil. Minima fuga omnis et voluptatem.\n\nNatus eum consequatur beatae. Magnam et quibusdam libero amet ipsa porro beatae. Quis voluptatem assumenda nemo commodi.\n\nUt fuga nesciunt ullam non. Explicabo optio dolore molestias similique. Voluptas aut eum est ducimus.\n\nUt quis rerum iste qui nihil ad est. Est saepe quisquam eligendi beatae libero inventore dolor doloremque.\n\nSapiente et suscipit architecto accusamus. Ut unde voluptates earum veniam quo. Ipsam odit optio maiores ut nisi qui. Est magni sed unde voluptas.', 174310, 6, 2494, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1981-09-18 06:41:25', '2022-06-07 09:38:52');
INSERT INTO `products` VALUES (80, 2, 'Veritatis rem nihil.', 'veritatis-rem-nihil.', 'Nam quos facilis libero quae aliquid dolorem. Culpa omnis in voluptates non quis. Est nulla sunt aut eveniet.\n\nEt perferendis et sunt laboriosam dolorem sint. Qui maiores neque odit. Natus harum voluptas placeat et voluptas.\n\nNon ab inventore eligendi fugit qui. Rerum impedit vel quos iusto natus. Qui itaque et eius. Accusantium et excepturi quos nihil.\n\nUt cumque minus in rerum. Fugit quibusdam corporis impedit sunt. Sint sed hic adipisci expedita nemo voluptatum sed. Rerum cumque magni accusantium. Perspiciatis quod eveniet saepe et ut voluptas.\n\nExplicabo nostrum voluptatem quo cum. Laboriosam modi nihil et a libero. Necessitatibus repudiandae provident eos est sapiente sint qui.', 39137, 70, 2910, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2010-02-17 00:43:13', '2022-06-07 09:38:52');
INSERT INTO `products` VALUES (81, 1, 'Nihil optio dolor.', 'nihil-optio-dolor.', 'Dolor ex qui qui quia vel dolores at. Culpa veniam expedita ut. Voluptatem ea numquam ut rerum atque debitis vitae voluptatibus. Iste quo voluptas non qui beatae quibusdam est.\n\nRem ad sed non deserunt veritatis. Et non consequatur molestiae nobis ullam ullam sed eveniet. Nostrum qui nostrum adipisci rem accusamus. Architecto reprehenderit porro inventore tempora numquam eos aut.\n\nDicta aliquam eum nemo est. Dolores magni et et. Et tempora est quasi vitae fuga. Ab et dolores at neque a eaque.\n\nExcepturi et consequatur ullam id. Dolore et tempore placeat. Reiciendis sit nam voluptatem adipisci hic.\n\nUt maxime nemo in vel laborum a dolore aut. Exercitationem et nostrum quibusdam. Quia nam quo non et explicabo perferendis. Inventore sapiente id quis quis dolores optio.', 122293, 70, 4667, 95, 'product.jpg', 'product.jpg', 'product.jpg', 5, '2017-07-24 10:51:57', '2022-06-07 09:38:52');
INSERT INTO `products` VALUES (82, 5, 'Asperiores perspiciatis in.', 'asperiores-perspiciatis-in.', 'Quis eius voluptas dolorem at. Sapiente sed quod aut dolor dolores voluptatum perferendis. Praesentium at aut vel optio.\n\nEos qui quod illo est ea. Perspiciatis numquam velit et unde distinctio. Architecto voluptates quo rerum cum autem. Aut qui consequatur consequuntur ducimus.\n\nQui voluptatem optio autem labore laudantium aut aut. Autem sed et vel qui. Libero occaecati aspernatur in autem ut qui.\n\nOmnis voluptas quidem et rerum sed. Autem id quo omnis magnam. A at doloremque eos. Quibusdam aut consequatur sunt similique ratione velit autem. Vel voluptatem est odit quaerat hic.\n\nRerum eum magni expedita accusamus quis dolores ut dicta. Aut consequatur ab enim est. Accusantium placeat quia soluta enim magni a.', 188277, 39, 2142, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2013-12-15 23:55:16', '2022-06-07 09:38:52');
INSERT INTO `products` VALUES (83, 2, 'Corrupti sit eum qui.', 'corrupti-sit-eum-qui.', 'Corrupti veniam voluptates voluptates sit quia quisquam. Est non veniam quo numquam inventore. Quas et corrupti dolor rerum possimus. Voluptatem sint voluptatem consequatur.\n\nOdit reiciendis laudantium quo autem. Consequatur praesentium a veniam. Ut velit recusandae quam quas quam ut velit.\n\nMagni est rerum sapiente. Blanditiis non accusamus numquam molestiae. Ea iste dolorem eaque. Pariatur sint consequatur eum.\n\nEum dolorem totam ullam. Quasi sit sit eaque quia debitis rerum labore. Vitae ut deserunt dignissimos deserunt.\n\nAut laborum natus odio voluptatem. Labore tenetur possimus consequatur sed. Voluptate qui natus ab temporibus facere vel.', 776645, 20, 1432, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2004-05-11 16:16:59', '2022-06-07 09:38:52');
INSERT INTO `products` VALUES (84, 2, 'Est quibusdam aspernatur consectetur.', 'est-quibusdam-aspernatur-consectetur.', 'Recusandae sit aliquid ut ullam quisquam ipsum. Repellendus explicabo molestiae odit natus dicta voluptatibus. Non accusantium dolor quia quia qui odio qui.\n\nVoluptatum quis natus repellendus harum. Itaque architecto deserunt fugiat. Dolores dolor ab deserunt repellat quo debitis velit incidunt.\n\nSapiente nemo non in laborum laudantium illo. Vel omnis aliquid hic aut. Suscipit sed et dolores dolorem incidunt amet eius. Aut dolore accusantium accusantium et hic cumque atque.\n\nVel accusamus libero ut voluptatem minima praesentium. Aliquid nostrum enim commodi iusto et.\n\nDolorem corrupti deserunt ea ut eaque officia nostrum. Omnis rem ipsam omnis minima et explicabo quis. Ipsum et omnis magnam voluptate blanditiis.', 78652, 18, 4396, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2006-10-31 14:36:34', '2022-06-07 09:38:52');
INSERT INTO `products` VALUES (85, 5, 'Impedit dolores sint laboriosam.', 'impedit-dolores-sint-laboriosam.', 'Provident saepe quo consectetur veritatis vero maxime illo. Voluptates quod qui nihil voluptatem ut cum. Nostrum dolorum doloremque est quis in voluptas aut. Praesentium qui sit dolores iusto.\n\nDoloremque autem eveniet qui ullam voluptates unde qui. Odit ullam consequatur natus ea veritatis modi. Quis aut est quia odit. Sed quia at ut veniam.\n\nDolores atque voluptatibus eos aut. Ea natus totam eius ea autem. Qui omnis non magni eaque.\n\nProvident magnam sit laudantium ad molestiae quo voluptate incidunt. Neque voluptas nihil et labore. A earum hic aut. Eos maiores laudantium voluptatem dolorem molestias occaecati dignissimos.\n\nNihil est dolorum veritatis sapiente impedit temporibus vitae. Et amet perferendis magni nesciunt saepe illo. Accusantium a nesciunt sed ab numquam dolorem. Qui suscipit voluptatem commodi ipsum. Dolor eaque inventore id repellat omnis.', 931158, 74, 1364, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2019-04-16 10:57:31', '2022-06-07 09:38:52');
INSERT INTO `products` VALUES (86, 3, 'Est minus.', 'est-minus.', 'Qui nostrum voluptatum non ea. Id optio qui nihil distinctio iusto quia dolorem voluptas. Beatae deserunt atque cumque praesentium aut commodi sunt saepe.\n\nUt doloremque temporibus fuga odit architecto ut. Illo ut commodi voluptatem aliquid. Voluptas quod praesentium expedita omnis.\n\nEos qui voluptas eum assumenda odio. Autem nihil culpa doloremque voluptatum reprehenderit reprehenderit et. Et aut in explicabo quaerat ipsam et. Adipisci ad libero assumenda.\n\nIncidunt quasi unde consequuntur sequi molestiae est veritatis quis. Eum accusamus nisi rerum enim nam. Est quisquam tempora deserunt est doloribus. Perferendis repellendus quis commodi amet reprehenderit fugit.\n\nDolores possimus rem qui quia consectetur ea excepturi. Ullam voluptatem est repellendus amet. Ullam earum quo et ea necessitatibus. Voluptatem dolorem accusamus repellendus iure.', 678409, 45, 4256, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2014-05-12 23:53:59', '2022-06-07 09:38:52');
INSERT INTO `products` VALUES (87, 3, 'Et quo et est.', 'et-quo-et-est.', 'Debitis et voluptatem eum ea deserunt est qui. Velit iste sint libero et officia nihil fuga. Quis necessitatibus minima perspiciatis et molestiae cumque itaque. Ut et facilis atque quo rem.\n\nDeleniti aut voluptatum in nesciunt vel. Necessitatibus ut mollitia adipisci omnis eius. Ad voluptas voluptatem rerum doloribus.\n\nMaiores enim ut voluptatem inventore. Neque asperiores distinctio est adipisci pariatur aliquid earum. Sit incidunt reprehenderit repudiandae rerum quia nostrum. Deleniti repudiandae est sunt hic quia enim dignissimos.\n\nAut sed numquam dignissimos ut voluptatibus. Molestiae rerum quibusdam et dolorem id sed enim ipsam. Eveniet qui repellendus harum nihil rem.\n\nNostrum ut consequuntur rem sed. Reprehenderit ad et molestias vel quaerat. Cumque rerum dolor sit temporibus est enim eius. In sunt fugiat quasi cum quaerat.', 957003, 17, 3103, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1980-09-23 08:25:26', '2022-06-07 09:38:52');
INSERT INTO `products` VALUES (88, 1, 'Amet et.', 'amet-et.', 'Non nisi rem voluptates iure in aut. Laborum deleniti animi itaque neque. Sed velit nostrum recusandae adipisci et et. Officia iste porro occaecati recusandae. Ipsam rerum aut distinctio.\n\nFacere impedit non deleniti et corporis eos velit. Sunt quo culpa cum. Consequatur voluptatem laboriosam nulla aut quam.\n\nVoluptate quisquam ea asperiores quibusdam est corrupti. Vel qui et ratione eius repudiandae deserunt quidem autem. Vel corporis enim enim accusantium illum et. Ab ea molestiae deserunt et magnam.\n\nCulpa dolor mollitia optio. Consequatur repellat quam nostrum et nobis necessitatibus. Itaque laborum esse labore voluptatem et et magni. Rem a ex consequatur accusamus quaerat sit iste.\n\nQuasi eum aliquam quam odio. Asperiores atque fuga est in dolorem quam. Harum molestiae in quia omnis asperiores. Sint qui ipsam vel veritatis nemo.', 106284, 70, 3961, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1973-01-18 13:10:36', '2022-06-07 09:38:52');
INSERT INTO `products` VALUES (89, 3, 'Voluptates asperiores impedit.', 'voluptates-asperiores-impedit.', 'Qui ea et voluptas sunt dolor pariatur ducimus. Ratione tenetur nesciunt molestiae quas et quia. Et iusto et voluptas sint non.\n\nQuia sint aut recusandae aperiam sit ducimus sed. Adipisci nihil molestiae dolor fugit autem debitis sed. Neque ex eum ex sint fuga.\n\nEst est voluptatem cumque ipsam. Vitae repellat modi ab aliquam. Maxime exercitationem quasi consectetur eligendi esse dolorum sit. Est earum et enim temporibus.\n\nAut enim sunt distinctio amet perspiciatis amet. Nesciunt aut dolorum vel aut saepe. Mollitia dolores doloremque quas commodi.\n\nReiciendis nulla sit natus dolore ut ut blanditiis. Quae ut in rerum autem qui libero molestiae. Omnis occaecati asperiores odit recusandae ut qui repellat. Ratione porro eaque culpa mollitia dicta dolorem est.', 397270, 3, 3890, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1971-07-09 13:27:43', '2022-06-07 09:38:52');
INSERT INTO `products` VALUES (90, 2, 'Et et neque repellendus.', 'et-et-neque-repellendus.', 'Qui eligendi quam animi praesentium. Provident quidem reprehenderit dicta nesciunt ut sunt repellat. Aut nulla fugiat harum possimus.\n\nUt autem expedita ut rem quis ut. Quo ipsam eius animi nihil quam voluptates qui doloremque. Est consequatur iure dolore quae aliquam dolores corrupti. Rerum eum inventore officia ut voluptas et omnis.\n\nEt voluptatem placeat similique atque rem provident et. Vel eum sed voluptas omnis omnis quia. Non sapiente dolorem qui et. Quia pariatur hic velit esse.\n\nVelit nostrum voluptates vel magni est. Rem aut veritatis aut voluptas voluptatem blanditiis rerum. Delectus quo libero consequatur distinctio quis autem omnis porro.\n\nMolestias est et natus ut laudantium quidem. Asperiores voluptatem qui officia dolorem. Quas at aperiam qui facilis. Quaerat debitis doloremque in vel omnis doloribus.', 457295, 24, 4030, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2005-02-04 14:46:15', '2022-06-07 09:38:52');
INSERT INTO `products` VALUES (91, 1, 'Dolorem voluptate voluptatem dolores.', 'dolorem-voluptate-voluptatem-dolores.', 'Rerum voluptatem totam dolorum quia necessitatibus. Facilis consequuntur sed ea asperiores. Sit ipsum ratione assumenda unde.\n\nDolor corrupti ea in accusantium suscipit quia voluptate. Aut officia ut numquam eligendi eligendi cum voluptas voluptatem. Libero in fugit optio consequatur blanditiis similique. Quia quisquam voluptas qui facere sunt.\n\nDolores aut quis qui qui sit. Ratione eveniet soluta dolorem. Eius at molestias impedit ut non libero.\n\nNemo neque dolores maiores et fugiat laudantium et non. Dolorem tempore delectus est in est. Doloribus rerum doloribus consequatur.\n\nQuibusdam libero sint molestiae illo nihil aliquam. Incidunt delectus eaque harum consectetur eum. Fugit officiis pariatur fuga quibusdam dolorem et voluptatum.', 440591, 68, 1439, 97, 'product.jpg', 'product.jpg', 'product.jpg', 3, '2018-03-19 06:03:33', '2022-06-07 09:38:52');
INSERT INTO `products` VALUES (92, 5, 'Tempora porro rerum.', 'tempora-porro-rerum.', 'Voluptatem voluptatum amet voluptas dicta distinctio id aut. Non amet enim quis quo dolorem unde officia. Eius natus veniam neque temporibus a. Dolorem at quas consequatur ea qui id.\n\nQuo totam repudiandae consectetur commodi minima quidem quia. Voluptas corporis voluptas expedita eveniet amet sunt laboriosam. Consequatur sint tempore animi magnam est. Illum velit odio doloremque dignissimos quis quis.\n\nSed quis consequatur et quod exercitationem. Alias voluptatem illo sit autem explicabo eum facere. Minus illum sunt praesentium rem reiciendis id voluptas. Quis omnis quaerat tempora expedita accusantium sit.\n\nError molestiae delectus magnam perspiciatis. Et sequi quas aliquam rerum quae vero vitae et. Voluptates est maxime id rerum sint accusamus ut. Eos nulla est quia ut sit.\n\nNemo distinctio dolorem quis quia eveniet voluptatem veniam. Praesentium dolor exercitationem id dolorem quas. Fugiat aut quia corrupti voluptatum totam. Dolore non dolorem sequi voluptas fuga rem repellat facere.', 333096, 31, 1451, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1989-06-17 12:51:55', '2022-06-07 09:38:52');
INSERT INTO `products` VALUES (93, 4, 'Aut harum cum.', 'aut-harum-cum.', 'Non et sint qui illum. Praesentium rem perspiciatis minima et tenetur voluptates vel. Velit ut ad adipisci mollitia.\n\nA fuga eligendi qui in sit soluta. Deleniti officiis nihil culpa impedit ratione. Omnis rerum voluptatem quo. Consequuntur et voluptatum eaque ut.\n\nAut dolor unde sit quam non. Vel et id voluptatem adipisci omnis iste. Nulla et dolorum ratione. Enim esse pariatur fuga illo laborum exercitationem.\n\nDolores quae blanditiis ut hic pariatur. Vero est officia qui maxime adipisci eum qui. In quisquam est nihil. Architecto dolores aut earum eos ut nihil. Minima natus vel nemo non.\n\nPerferendis amet numquam mollitia quas vero provident temporibus. Non autem et sunt quos.', 118229, 51, 1315, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1998-04-21 18:22:12', '2022-06-07 09:38:52');
INSERT INTO `products` VALUES (94, 3, 'Totam quo voluptate.', 'totam-quo-voluptate.', 'Sapiente nesciunt id repellendus et facere porro. Et est ipsa quo ipsum. Illum accusantium accusamus quas facere non id in.\n\nAut magnam quia soluta recusandae sit. Est vero rerum optio maxime ducimus ipsam accusantium. Ipsam ipsum iure et hic magni reprehenderit rerum aut. Voluptas doloremque culpa fugiat placeat quis maiores autem labore.\n\nEum quos dolore ex adipisci quaerat. Maxime ullam eius dolores expedita voluptatem pariatur voluptatem.\n\nImpedit in tenetur iure non. Quia eum incidunt aliquid recusandae corrupti eum.\n\nRem error consequatur earum sint porro. Explicabo animi eaque et eius consequatur. Est voluptas voluptas distinctio doloribus saepe dolorem. Minus quia rerum mollitia.', 973072, 31, 1059, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2004-10-12 03:32:55', '2022-06-07 09:38:52');
INSERT INTO `products` VALUES (95, 1, 'Odio quia quia id.', 'odio-quia-quia-id.', 'Fugiat neque natus est asperiores. Et earum voluptatibus necessitatibus quas quasi ipsum. Aut quis aliquam qui ut est iste.\n\nImpedit ab facere libero distinctio. Eaque vel adipisci in. Tempora doloribus corporis temporibus aliquid quis.\n\nEligendi aut nostrum et assumenda totam. Ea sed autem aut doloribus asperiores. Voluptatibus accusamus vel iusto perspiciatis exercitationem ut consequuntur. Possimus aliquid maxime dolorum suscipit laudantium. Magni sed nihil eveniet corporis officia labore necessitatibus.\n\nOdio doloribus iure alias molestias labore deleniti. Beatae aut in quae eos id et inventore. Rerum voluptatem veritatis iusto.\n\nHic alias doloribus accusamus laudantium quisquam voluptates cupiditate. Qui ut eveniet numquam voluptate odit enim aut. Expedita molestias rerum voluptates quaerat.', 962457, 10, 2064, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '2003-03-08 10:00:29', '2022-06-07 09:38:52');
INSERT INTO `products` VALUES (96, 4, 'Quaerat occaecati harum quia ratione.', 'quaerat-occaecati-harum-quia-ratione.', 'Culpa voluptatem sit aut aut. Odit debitis cum non consectetur veniam. Modi incidunt aut ut et porro est. Consequatur dignissimos corrupti et doloribus numquam.\n\nUt magni placeat dolorem sed sunt. Quae sit nemo eos sed ut quas. Aliquid sint ut distinctio consequuntur et quod tempore. Explicabo nihil rem praesentium consectetur quo nisi qui. Optio dolores perferendis magni repellendus et illum reiciendis.\n\nItaque tenetur est eos sapiente nulla est. Praesentium expedita velit ut molestias. Illo rerum inventore voluptatem officiis laborum et cumque tempora. Repellendus ut nihil laboriosam nisi ducimus.\n\nNemo facere est modi est et mollitia ut. Recusandae qui consequuntur quo distinctio totam est qui. Quidem laudantium illo qui ratione debitis fugiat. Ut eum impedit voluptatem perspiciatis.\n\nSint deserunt totam dolorem animi laborum eaque vel. Tempore quia tempore ratione quisquam. Molestiae debitis repellat beatae qui ratione similique dolorum. Excepturi et natus enim numquam fuga nihil.', 933135, 33, 1039, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1999-12-02 08:22:39', '2022-06-07 09:38:52');
INSERT INTO `products` VALUES (97, 3, 'Neque inventore sunt.', 'neque-inventore-sunt.', 'Quam placeat illum ab ratione consequatur velit vel. Repellendus quis consequatur et quisquam sed unde sed. Adipisci eveniet porro voluptatem perferendis.\n\nQui voluptatem minima ea natus eum vel. Nostrum enim aspernatur quia incidunt. Blanditiis eum voluptatum nulla repudiandae. Ipsum ea possimus accusamus est.\n\nNumquam cum culpa omnis eos voluptatem eaque. Necessitatibus ad vitae doloremque quis voluptas. Accusantium temporibus dignissimos nihil. Quia quae dolor quis.\n\nEst sunt quidem ipsum eius vel qui. Laborum eos ullam quis ex vel maxime. Sequi natus laboriosam itaque magni ducimus nostrum iusto.\n\nTotam illo rerum velit ratione quia deserunt tempore dolorem. Modi animi itaque accusantium possimus molestiae. Expedita sunt voluptates aut facilis.', 115854, 7, 3189, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1996-01-25 04:43:41', '2022-06-07 09:38:52');
INSERT INTO `products` VALUES (98, 2, 'Ex sit quas beatae.', 'ex-sit-quas-beatae.', 'Eius quos est quia consectetur aut dignissimos est. Est cupiditate non architecto eos. Minima unde adipisci et non sit quaerat.\n\nIn quaerat non vel neque. Rem aliquam vel sit cum sed velit quis. Quia nihil fugiat impedit molestias consequatur similique. Eligendi sit doloribus qui in.\n\nAssumenda qui eos dolor. Voluptas minus autem voluptas eum. Et aspernatur deleniti veritatis cupiditate in at. Esse accusamus quo magnam laudantium et ut sed.\n\nId qui sunt exercitationem rem. Molestias eligendi veritatis voluptate sed suscipit. Unde sapiente dolor laudantium ut quae alias. Et quaerat voluptas ipsa sunt similique et. Rerum et adipisci aliquam nam aut deleniti.\n\nCulpa accusantium est sed. Soluta repellendus doloribus sapiente perferendis sunt sit numquam. Laborum animi sint rerum excepturi.', 830849, 7, 2685, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1987-11-07 03:56:01', '2022-06-07 09:38:52');
INSERT INTO `products` VALUES (99, 2, 'Voluptas totam omnis.', 'voluptas-totam-omnis.', 'Accusamus illum esse nam consequatur earum quam ut. Voluptatem perferendis adipisci occaecati voluptatem qui consequatur qui.\n\nDolor dignissimos fuga distinctio consequatur explicabo. Aliquam ab voluptatibus esse nihil officiis. Corrupti qui ipsum saepe atque minima expedita.\n\nQui qui temporibus repellendus. Animi modi exercitationem repellat autem nihil voluptate veritatis nulla. Aliquid possimus hic totam vero odit quia minima.\n\nMagnam commodi magnam voluptate dolorum similique sit. Magnam quasi eum sint praesentium rerum qui. Praesentium assumenda sint dolor quisquam dolor nihil. Sint id aspernatur quaerat error accusamus.\n\nMaxime quod ipsa velit. Nesciunt magni eos dolores voluptates fugiat.', 814135, 25, 2191, 100, 'product.jpg', 'product.jpg', 'product.jpg', 0, '1977-02-03 08:44:29', '2022-06-07 09:38:52');
INSERT INTO `products` VALUES (100, 3, 'Occaecati voluptas occaecati aut.', 'occaecati-voluptas-occaecati-aut.', 'Id alias et quae. Inventore et delectus itaque ut maxime praesentium. Ut id asperiores sequi voluptatem libero delectus distinctio. Aut doloremque a dolorem et molestias eos.\n\nVoluptate dolores quo et voluptatem sunt impedit. Dolorum quae excepturi quam voluptatem aut. Dolor incidunt numquam est corporis amet. Dolor quod sed odio consequatur odit dolorem sed.\n\nEnim facilis et repudiandae nostrum omnis illum et. Pariatur itaque consequuntur vel eligendi magni. Incidunt maxime sint vel atque dolor. Eum sint consectetur voluptas qui ducimus. Doloremque tenetur ipsum officia non suscipit.\n\nVoluptatem velit deserunt labore unde. Incidunt in nisi qui voluptatem nemo a. Enim autem alias et voluptas veniam. Commodi rerum sunt nostrum.\n\nAd quae et repellat pariatur quidem reiciendis sed dolorem. Et et unde tempore labore consequuntur nihil. Consequatur doloribus vero voluptatem et maiores. Ipsa enim quasi consequatur voluptatem qui dolorem et.', 154859, 74, 4554, 99, 'product.jpg', 'product.jpg', 'product.jpg', 1, '2017-03-05 04:19:03', '2022-06-07 09:38:52');

-- ----------------------------
-- Table structure for productsize
-- ----------------------------
DROP TABLE IF EXISTS `productsize`;
CREATE TABLE `productsize`  (
  `product_id` int UNSIGNED NOT NULL,
  `size_id` int UNSIGNED NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productsize
-- ----------------------------
INSERT INTO `productsize` VALUES (71, 4);
INSERT INTO `productsize` VALUES (64, 5);
INSERT INTO `productsize` VALUES (75, 3);
INSERT INTO `productsize` VALUES (98, 3);
INSERT INTO `productsize` VALUES (34, 4);
INSERT INTO `productsize` VALUES (43, 1);
INSERT INTO `productsize` VALUES (17, 2);
INSERT INTO `productsize` VALUES (72, 3);
INSERT INTO `productsize` VALUES (43, 2);
INSERT INTO `productsize` VALUES (38, 5);
INSERT INTO `productsize` VALUES (40, 4);
INSERT INTO `productsize` VALUES (32, 4);
INSERT INTO `productsize` VALUES (49, 1);
INSERT INTO `productsize` VALUES (31, 2);
INSERT INTO `productsize` VALUES (11, 3);
INSERT INTO `productsize` VALUES (62, 5);
INSERT INTO `productsize` VALUES (73, 5);
INSERT INTO `productsize` VALUES (61, 3);
INSERT INTO `productsize` VALUES (92, 5);
INSERT INTO `productsize` VALUES (58, 3);
INSERT INTO `productsize` VALUES (23, 5);
INSERT INTO `productsize` VALUES (25, 3);
INSERT INTO `productsize` VALUES (56, 1);
INSERT INTO `productsize` VALUES (4, 2);
INSERT INTO `productsize` VALUES (99, 1);
INSERT INTO `productsize` VALUES (16, 2);
INSERT INTO `productsize` VALUES (85, 2);
INSERT INTO `productsize` VALUES (92, 4);
INSERT INTO `productsize` VALUES (73, 5);
INSERT INTO `productsize` VALUES (37, 4);
INSERT INTO `productsize` VALUES (82, 1);
INSERT INTO `productsize` VALUES (53, 1);
INSERT INTO `productsize` VALUES (7, 2);
INSERT INTO `productsize` VALUES (55, 4);
INSERT INTO `productsize` VALUES (96, 5);
INSERT INTO `productsize` VALUES (90, 4);
INSERT INTO `productsize` VALUES (96, 1);
INSERT INTO `productsize` VALUES (9, 3);
INSERT INTO `productsize` VALUES (56, 2);
INSERT INTO `productsize` VALUES (98, 4);
INSERT INTO `productsize` VALUES (91, 4);
INSERT INTO `productsize` VALUES (1, 4);
INSERT INTO `productsize` VALUES (45, 4);
INSERT INTO `productsize` VALUES (26, 1);
INSERT INTO `productsize` VALUES (24, 2);
INSERT INTO `productsize` VALUES (19, 2);
INSERT INTO `productsize` VALUES (21, 5);
INSERT INTO `productsize` VALUES (8, 1);
INSERT INTO `productsize` VALUES (15, 2);
INSERT INTO `productsize` VALUES (80, 3);
INSERT INTO `productsize` VALUES (41, 3);
INSERT INTO `productsize` VALUES (81, 1);
INSERT INTO `productsize` VALUES (13, 5);
INSERT INTO `productsize` VALUES (35, 1);
INSERT INTO `productsize` VALUES (33, 5);
INSERT INTO `productsize` VALUES (38, 1);
INSERT INTO `productsize` VALUES (49, 3);
INSERT INTO `productsize` VALUES (17, 4);
INSERT INTO `productsize` VALUES (72, 5);
INSERT INTO `productsize` VALUES (30, 5);
INSERT INTO `productsize` VALUES (10, 3);
INSERT INTO `productsize` VALUES (85, 2);
INSERT INTO `productsize` VALUES (32, 1);
INSERT INTO `productsize` VALUES (16, 4);
INSERT INTO `productsize` VALUES (79, 2);
INSERT INTO `productsize` VALUES (35, 2);
INSERT INTO `productsize` VALUES (56, 2);
INSERT INTO `productsize` VALUES (86, 2);
INSERT INTO `productsize` VALUES (29, 4);
INSERT INTO `productsize` VALUES (8, 3);
INSERT INTO `productsize` VALUES (29, 2);
INSERT INTO `productsize` VALUES (16, 2);
INSERT INTO `productsize` VALUES (76, 1);
INSERT INTO `productsize` VALUES (81, 4);
INSERT INTO `productsize` VALUES (60, 3);
INSERT INTO `productsize` VALUES (38, 2);
INSERT INTO `productsize` VALUES (89, 1);
INSERT INTO `productsize` VALUES (93, 1);
INSERT INTO `productsize` VALUES (72, 4);
INSERT INTO `productsize` VALUES (28, 1);
INSERT INTO `productsize` VALUES (36, 1);
INSERT INTO `productsize` VALUES (95, 5);
INSERT INTO `productsize` VALUES (57, 2);
INSERT INTO `productsize` VALUES (7, 5);
INSERT INTO `productsize` VALUES (75, 2);
INSERT INTO `productsize` VALUES (5, 2);
INSERT INTO `productsize` VALUES (91, 4);
INSERT INTO `productsize` VALUES (19, 3);
INSERT INTO `productsize` VALUES (56, 5);
INSERT INTO `productsize` VALUES (39, 4);
INSERT INTO `productsize` VALUES (91, 2);
INSERT INTO `productsize` VALUES (38, 5);
INSERT INTO `productsize` VALUES (48, 4);
INSERT INTO `productsize` VALUES (92, 2);
INSERT INTO `productsize` VALUES (93, 4);
INSERT INTO `productsize` VALUES (70, 4);
INSERT INTO `productsize` VALUES (18, 3);
INSERT INTO `productsize` VALUES (87, 4);
INSERT INTO `productsize` VALUES (52, 3);
INSERT INTO `productsize` VALUES (37, 1);
INSERT INTO `productsize` VALUES (7, 2);
INSERT INTO `productsize` VALUES (77, 4);
INSERT INTO `productsize` VALUES (25, 1);
INSERT INTO `productsize` VALUES (19, 1);
INSERT INTO `productsize` VALUES (99, 4);
INSERT INTO `productsize` VALUES (55, 5);
INSERT INTO `productsize` VALUES (96, 5);
INSERT INTO `productsize` VALUES (64, 4);
INSERT INTO `productsize` VALUES (2, 4);
INSERT INTO `productsize` VALUES (41, 3);
INSERT INTO `productsize` VALUES (50, 5);
INSERT INTO `productsize` VALUES (74, 2);
INSERT INTO `productsize` VALUES (42, 4);
INSERT INTO `productsize` VALUES (78, 4);
INSERT INTO `productsize` VALUES (58, 5);
INSERT INTO `productsize` VALUES (59, 3);
INSERT INTO `productsize` VALUES (54, 1);
INSERT INTO `productsize` VALUES (13, 2);
INSERT INTO `productsize` VALUES (9, 2);
INSERT INTO `productsize` VALUES (84, 4);
INSERT INTO `productsize` VALUES (70, 1);
INSERT INTO `productsize` VALUES (72, 3);
INSERT INTO `productsize` VALUES (10, 4);
INSERT INTO `productsize` VALUES (96, 4);
INSERT INTO `productsize` VALUES (17, 3);
INSERT INTO `productsize` VALUES (85, 4);
INSERT INTO `productsize` VALUES (7, 4);
INSERT INTO `productsize` VALUES (57, 4);
INSERT INTO `productsize` VALUES (6, 2);
INSERT INTO `productsize` VALUES (42, 4);
INSERT INTO `productsize` VALUES (54, 5);
INSERT INTO `productsize` VALUES (97, 1);
INSERT INTO `productsize` VALUES (88, 3);
INSERT INTO `productsize` VALUES (17, 1);
INSERT INTO `productsize` VALUES (48, 2);
INSERT INTO `productsize` VALUES (7, 3);
INSERT INTO `productsize` VALUES (63, 4);
INSERT INTO `productsize` VALUES (84, 4);
INSERT INTO `productsize` VALUES (53, 4);
INSERT INTO `productsize` VALUES (91, 2);
INSERT INTO `productsize` VALUES (84, 3);
INSERT INTO `productsize` VALUES (65, 2);
INSERT INTO `productsize` VALUES (21, 3);
INSERT INTO `productsize` VALUES (73, 5);
INSERT INTO `productsize` VALUES (28, 2);
INSERT INTO `productsize` VALUES (51, 5);
INSERT INTO `productsize` VALUES (43, 4);
INSERT INTO `productsize` VALUES (64, 1);
INSERT INTO `productsize` VALUES (19, 2);
INSERT INTO `productsize` VALUES (39, 5);
INSERT INTO `productsize` VALUES (4, 3);
INSERT INTO `productsize` VALUES (70, 4);
INSERT INTO `productsize` VALUES (33, 3);
INSERT INTO `productsize` VALUES (33, 1);
INSERT INTO `productsize` VALUES (73, 3);
INSERT INTO `productsize` VALUES (67, 4);
INSERT INTO `productsize` VALUES (93, 4);
INSERT INTO `productsize` VALUES (72, 1);
INSERT INTO `productsize` VALUES (81, 5);
INSERT INTO `productsize` VALUES (14, 4);
INSERT INTO `productsize` VALUES (23, 5);
INSERT INTO `productsize` VALUES (23, 5);
INSERT INTO `productsize` VALUES (20, 2);
INSERT INTO `productsize` VALUES (4, 1);
INSERT INTO `productsize` VALUES (64, 2);
INSERT INTO `productsize` VALUES (61, 5);
INSERT INTO `productsize` VALUES (16, 4);
INSERT INTO `productsize` VALUES (50, 3);
INSERT INTO `productsize` VALUES (64, 3);
INSERT INTO `productsize` VALUES (27, 3);
INSERT INTO `productsize` VALUES (71, 1);
INSERT INTO `productsize` VALUES (78, 5);
INSERT INTO `productsize` VALUES (80, 1);
INSERT INTO `productsize` VALUES (74, 1);
INSERT INTO `productsize` VALUES (72, 2);
INSERT INTO `productsize` VALUES (34, 5);
INSERT INTO `productsize` VALUES (65, 3);
INSERT INTO `productsize` VALUES (10, 4);
INSERT INTO `productsize` VALUES (91, 1);
INSERT INTO `productsize` VALUES (36, 1);
INSERT INTO `productsize` VALUES (15, 2);
INSERT INTO `productsize` VALUES (24, 3);
INSERT INTO `productsize` VALUES (87, 2);
INSERT INTO `productsize` VALUES (32, 3);
INSERT INTO `productsize` VALUES (97, 2);
INSERT INTO `productsize` VALUES (58, 3);
INSERT INTO `productsize` VALUES (87, 1);
INSERT INTO `productsize` VALUES (82, 5);
INSERT INTO `productsize` VALUES (55, 2);
INSERT INTO `productsize` VALUES (74, 3);
INSERT INTO `productsize` VALUES (86, 3);
INSERT INTO `productsize` VALUES (62, 2);
INSERT INTO `productsize` VALUES (91, 1);
INSERT INTO `productsize` VALUES (14, 4);
INSERT INTO `productsize` VALUES (50, 5);
INSERT INTO `productsize` VALUES (72, 4);
INSERT INTO `productsize` VALUES (93, 4);
INSERT INTO `productsize` VALUES (17, 1);
INSERT INTO `productsize` VALUES (82, 4);
INSERT INTO `productsize` VALUES (98, 5);
INSERT INTO `productsize` VALUES (100, 1);
INSERT INTO `productsize` VALUES (86, 2);
INSERT INTO `productsize` VALUES (40, 1);
INSERT INTO `productsize` VALUES (59, 5);
INSERT INTO `productsize` VALUES (73, 5);
INSERT INTO `productsize` VALUES (86, 1);
INSERT INTO `productsize` VALUES (27, 3);
INSERT INTO `productsize` VALUES (43, 5);
INSERT INTO `productsize` VALUES (64, 2);
INSERT INTO `productsize` VALUES (15, 4);
INSERT INTO `productsize` VALUES (7, 1);
INSERT INTO `productsize` VALUES (34, 1);
INSERT INTO `productsize` VALUES (49, 3);
INSERT INTO `productsize` VALUES (91, 2);
INSERT INTO `productsize` VALUES (44, 2);
INSERT INTO `productsize` VALUES (50, 3);
INSERT INTO `productsize` VALUES (32, 2);
INSERT INTO `productsize` VALUES (56, 5);
INSERT INTO `productsize` VALUES (100, 5);
INSERT INTO `productsize` VALUES (62, 1);
INSERT INTO `productsize` VALUES (95, 5);
INSERT INTO `productsize` VALUES (87, 1);
INSERT INTO `productsize` VALUES (19, 2);
INSERT INTO `productsize` VALUES (44, 5);
INSERT INTO `productsize` VALUES (94, 1);
INSERT INTO `productsize` VALUES (39, 2);
INSERT INTO `productsize` VALUES (43, 3);
INSERT INTO `productsize` VALUES (10, 1);
INSERT INTO `productsize` VALUES (94, 2);
INSERT INTO `productsize` VALUES (37, 3);
INSERT INTO `productsize` VALUES (5, 1);
INSERT INTO `productsize` VALUES (65, 2);
INSERT INTO `productsize` VALUES (75, 3);
INSERT INTO `productsize` VALUES (42, 2);
INSERT INTO `productsize` VALUES (7, 1);
INSERT INTO `productsize` VALUES (42, 4);
INSERT INTO `productsize` VALUES (47, 3);
INSERT INTO `productsize` VALUES (86, 2);
INSERT INTO `productsize` VALUES (56, 5);
INSERT INTO `productsize` VALUES (12, 5);
INSERT INTO `productsize` VALUES (9, 4);
INSERT INTO `productsize` VALUES (25, 1);
INSERT INTO `productsize` VALUES (51, 4);
INSERT INTO `productsize` VALUES (59, 5);
INSERT INTO `productsize` VALUES (64, 2);
INSERT INTO `productsize` VALUES (81, 3);
INSERT INTO `productsize` VALUES (2, 5);
INSERT INTO `productsize` VALUES (9, 4);
INSERT INTO `productsize` VALUES (43, 4);
INSERT INTO `productsize` VALUES (100, 5);
INSERT INTO `productsize` VALUES (95, 4);
INSERT INTO `productsize` VALUES (80, 3);
INSERT INTO `productsize` VALUES (10, 4);
INSERT INTO `productsize` VALUES (62, 4);
INSERT INTO `productsize` VALUES (45, 5);
INSERT INTO `productsize` VALUES (47, 3);
INSERT INTO `productsize` VALUES (59, 1);
INSERT INTO `productsize` VALUES (41, 3);
INSERT INTO `productsize` VALUES (82, 3);
INSERT INTO `productsize` VALUES (19, 1);
INSERT INTO `productsize` VALUES (82, 5);
INSERT INTO `productsize` VALUES (9, 3);
INSERT INTO `productsize` VALUES (89, 1);
INSERT INTO `productsize` VALUES (10, 2);
INSERT INTO `productsize` VALUES (29, 5);
INSERT INTO `productsize` VALUES (73, 2);
INSERT INTO `productsize` VALUES (82, 1);
INSERT INTO `productsize` VALUES (66, 4);
INSERT INTO `productsize` VALUES (71, 5);
INSERT INTO `productsize` VALUES (61, 1);
INSERT INTO `productsize` VALUES (57, 2);
INSERT INTO `productsize` VALUES (81, 2);
INSERT INTO `productsize` VALUES (78, 5);
INSERT INTO `productsize` VALUES (99, 3);
INSERT INTO `productsize` VALUES (43, 4);
INSERT INTO `productsize` VALUES (40, 2);
INSERT INTO `productsize` VALUES (54, 3);
INSERT INTO `productsize` VALUES (9, 3);
INSERT INTO `productsize` VALUES (85, 2);
INSERT INTO `productsize` VALUES (39, 2);
INSERT INTO `productsize` VALUES (66, 1);
INSERT INTO `productsize` VALUES (52, 4);
INSERT INTO `productsize` VALUES (69, 4);
INSERT INTO `productsize` VALUES (39, 5);
INSERT INTO `productsize` VALUES (2, 3);
INSERT INTO `productsize` VALUES (24, 3);
INSERT INTO `productsize` VALUES (34, 5);
INSERT INTO `productsize` VALUES (56, 5);
INSERT INTO `productsize` VALUES (77, 2);
INSERT INTO `productsize` VALUES (53, 4);
INSERT INTO `productsize` VALUES (60, 3);
INSERT INTO `productsize` VALUES (30, 3);
INSERT INTO `productsize` VALUES (35, 2);
INSERT INTO `productsize` VALUES (14, 3);
INSERT INTO `productsize` VALUES (85, 3);
INSERT INTO `productsize` VALUES (2, 3);
INSERT INTO `productsize` VALUES (76, 4);
INSERT INTO `productsize` VALUES (31, 3);
INSERT INTO `productsize` VALUES (15, 5);
INSERT INTO `productsize` VALUES (14, 5);

-- ----------------------------
-- Table structure for sizes
-- ----------------------------
DROP TABLE IF EXISTS `sizes`;
CREATE TABLE `sizes`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sizes
-- ----------------------------
INSERT INTO `sizes` VALUES (1, 'S', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `sizes` VALUES (2, 'M', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `sizes` VALUES (3, 'L', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `sizes` VALUES (4, 'XL', '2022-06-07 09:38:47', '2022-06-07 09:38:47');
INSERT INTO `sizes` VALUES (5, 'XXL', '2022-06-07 09:38:47', '2022-06-07 09:38:47');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fullname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picture` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'profile.png',
  `password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reset_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reset_at` datetime NULL DEFAULT NULL,
  `reset_expires` datetime NULL DEFAULT NULL,
  `activate_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin@gmail.com', '0878111122222', 'admin', 'Administrator', 'profile.png', '$2y$10$QMUu7NjZH1xijkHSSSK0r.jWNYGj6WXUh.QdCgt8kn1ZsiHv04JMO', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2022-03-01 11:31:22', '2022-03-01 11:31:40', NULL);
INSERT INTO `users` VALUES (2, 'userbaru@gmail.com', '', 'userbaru', 'User Baru', 'profile.png', '$2y$10$NP//Rx96DhjCRpWmqSu.JeFLtZEvhRzoE560NB.vu5tadrsxMXUM6', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2022-06-07 09:40:24', '2022-06-07 09:40:53', NULL);

-- ----------------------------
-- Triggers structure for table productcheckout
-- ----------------------------
DROP TRIGGER IF EXISTS `kurangStok`;
delimiter ;;
CREATE TRIGGER `kurangStok` AFTER INSERT ON `productcheckout` FOR EACH ROW UPDATE products SET stock = stock - NEW.quantity WHERE id = NEW.product_id
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table productcheckout
-- ----------------------------
DROP TRIGGER IF EXISTS `tambahSold`;
delimiter ;;
CREATE TRIGGER `tambahSold` AFTER INSERT ON `productcheckout` FOR EACH ROW UPDATE products SET sold = sold + NEW.quantity WHERE id = NEW.product_id
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table productcheckout
-- ----------------------------
DROP TRIGGER IF EXISTS `ubahStok`;
delimiter ;;
CREATE TRIGGER `ubahStok` AFTER UPDATE ON `productcheckout` FOR EACH ROW UPDATE products SET stock = (stock + OLD.quantity) - NEW.quantity WHERE id = OLD.product_id
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table productcheckout
-- ----------------------------
DROP TRIGGER IF EXISTS `ubahSold`;
delimiter ;;
CREATE TRIGGER `ubahSold` AFTER UPDATE ON `productcheckout` FOR EACH ROW UPDATE products SET sold = (sold - OLD.quantity) + NEW.quantity WHERE id = OLD.product_id
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table productcheckout
-- ----------------------------
DROP TRIGGER IF EXISTS `hapusStok`;
delimiter ;;
CREATE TRIGGER `hapusStok` AFTER DELETE ON `productcheckout` FOR EACH ROW UPDATE products SET stock = stock + OLD.quantity WHERE id = OLD.product_id
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table productcheckout
-- ----------------------------
DROP TRIGGER IF EXISTS `hapusSold`;
delimiter ;;
CREATE TRIGGER `hapusSold` AFTER DELETE ON `productcheckout` FOR EACH ROW UPDATE products SET sold = sold - OLD.quantity WHERE id = OLD.product_id
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : mall

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 25/04/2018 18:57:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for addressee
-- ----------------------------
DROP TABLE IF EXISTS `addressee`;
CREATE TABLE `addressee`  (
  `addresseeId` int(20) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `telephone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`addresseeId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand`  (
  `brandId` int(20) NOT NULL,
  `brandName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `brandInfo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `brandImg` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `productNum` int(20) NULL DEFAULT NULL COMMENT '多少款商品',
  PRIMARY KEY (`brandId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `categoryId` int(20) NOT NULL,
  `categoryName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '例如：项链、手链、手串、戒指、耳饰、手镯、吊坠',
  PRIMARY KEY (`categoryId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `commentId` int(20) NOT NULL,
  `orderItemId` int(20) NOT NULL COMMENT '哪个订单项的评价',
  `userId` int(20) NOT NULL COMMENT '哪个用户评价',
  `content` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '评价内容',
  `createTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`commentId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `productId` int(100) NOT NULL,
  `productName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `salePrice` decimal(10, 2) NOT NULL,
  `productNum` int(100) NULL DEFAULT NULL,
  `saleNum` int(100) NULL DEFAULT NULL,
  `productImg` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `productInfo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `productDetail` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL COMMENT '1销售中，2已下架，3热卖',
  `sex` int(1) NULL DEFAULT NULL COMMENT '款式是男性还是女性',
  `brandName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '商品的品牌',
  `materialName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '商品的材质',
  `createTime` datetime(6) NULL DEFAULT NULL COMMENT '商品上线时间',
  PRIMARY KEY (`productId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material`  (
  `materialId` int(20) NOT NULL,
  `materialName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '材质的名称 例如：钻石、玉石、黄金、铂金、足银、珍珠、木质、水晶',
  PRIMARY KEY (`materialId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `orderId` int(20) NOT NULL,
  `userId` int(20) NOT NULL COMMENT '哪个用户的订单',
  `addresseeId` int(20) NOT NULL COMMENT '订单收货地址',
  `orderTotalPrice` decimal(10, 2) NOT NULL,
  `status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '订单是否删除，0未删除，1已删除',
  `createTime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`orderId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `orderItemId` int(20) NOT NULL,
  `orderId` int(20) NOT NULL COMMENT '属于哪个订单',
  `productId` int(20) NOT NULL COMMENT '对应哪个商品',
  `saleNum` int(20) NOT NULL DEFAULT 1,
  `totalPrice` decimal(65, 0) NOT NULL,
  `isComment` int(1) NULL DEFAULT 0 COMMENT '是否已评价',
  PRIMARY KEY (`orderItemId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pricescope
-- ----------------------------
DROP TABLE IF EXISTS `pricescope`;
CREATE TABLE `pricescope`  (
  `priceScopeId` int(20) NOT NULL,
  `startPrice` decimal(10, 2) NOT NULL,
  `endPrice` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`priceScopeId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for shoppingitem
-- ----------------------------
DROP TABLE IF EXISTS `shoppingitem`;
CREATE TABLE `shoppingitem`  (
  `shoppingCartId` int(20) NOT NULL,
  `productId` int(20) NOT NULL COMMENT '关联到商品',
  `addedNum` int(20) NOT NULL COMMENT '已添加的数量',
  `userId` int(20) NOT NULL COMMENT '关联到具体用户',
  PRIMARY KEY (`shoppingCartId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

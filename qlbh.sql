-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for my_store
CREATE DATABASE IF NOT EXISTS `my_store` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `my_store`;

-- Dumping structure for table my_store.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table my_store.category: ~5 rows (approximately)
INSERT INTO `category` (`id`, `name`, `description`) VALUES
	(1, 'Điện thoại', 'Danh mục các loại điện thoại'),
	(2, 'Laptop', 'Danh mục các loại laptop'),
	(3, 'Máy tính bảng', 'Danh mục các loại máy tính bảng'),
	(4, 'Phụ kiện', 'Danh mục phụ kiện điện tử'),
	(5, 'Thiết bị âm thanh', 'Danh mục loa, tai nghe, micro');

-- Dumping structure for table my_store.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table my_store.orders: ~1 rows (approximately)
INSERT INTO `orders` (`id`, `name`, `phone`, `address`, `created_at`) VALUES
	(3, 'tuan long', '0132654789', 'thu duc', '2025-03-24 07:57:11');

-- Dumping structure for table my_store.order_details
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_order_details_order` (`order_id`),
  KEY `idx_order_details_product` (`product_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table my_store.order_details: ~2 rows (approximately)
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
	(3, 3, 2, 1, 23999.99),
	(4, 3, 3, 1, 21999.99);

-- Dumping structure for table my_store.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_product_category` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table my_store.product: ~11 rows (approximately)
INSERT INTO `product` (`id`, `name`, `description`, `price`, `image`, `category_id`) VALUES
	(2, 'iPhone 14', 'Điện thoại iPhone 14 với màn hình OLED, chip A15 Bionic', 23999000.00, 'public/uploads/67e10f84e66be_iPhone-14-plus-thumb-xanh-600x600.jpg', 1),
	(3, 'Samsung Galaxy S23', 'Điện thoại Samsung Galaxy S23 với màn hình Dynamic AMOLED 2X', 21000000.00, 'public/uploads/67e10f8c510c8_pinks.png', 1),
	(4, 'MacBook Air M2', 'Laptop MacBook Air M2, chip Apple M2, màn hình Retina', 34999000.00, 'public/uploads/67e10f9413983_MacBook-Air-M2-scaled-e1730436986584.jpg', 2),
	(5, 'Dell XPS 13', 'Laptop Dell XPS 13 với màn hình InfinityEdge, chip Intel Core i7', 20000000.00, 'public/uploads/67e10ff286262_20221201_PlICvqJ6VXXgoAdvzS7uRQeF.png', 2),
	(6, 'iPad Pro 12.9', 'Máy tính bảng iPad Pro 12.9 với màn hình Liquid Retina XDR, chip M1', 15000000.00, 'public/uploads/67e10fa123b37_12.9-5g-300x200.png', 3),
	(7, 'Samsung Galaxy Tab S8', 'Máy tính bảng Samsung Galaxy Tab S8, màn hình 11 inch', 18999999.00, 'public/uploads/67e10fa88d6f5_samsung-galaxy-tab-s8-white-thumb-600x600.jpg', 3),
	(8, 'Tai nghe AirPods Pro 2', 'Tai nghe không dây AirPods Pro 2 với khả năng khử tiếng ồn', 999999.00, 'public/uploads/67e10fae1a2ce_0000211_airpods-pro-2_550.png', 4),
	(9, 'Loa Bluetooth JBL Charge 5', 'Loa Bluetooth JBL Charge 5, âm thanh mạnh mẽ, pin lâu', 499000.00, 'public/uploads/67e10fb597b83_JBL_Charge_5_Lifestyle1_904x560px.png', 5),
	(10, 'Sony WH-1000XM5', 'Tai nghe Sony WH-1000XM5 với tính năng chống ồn chủ động', 399000.00, 'public/uploads/67e10fc360d93_3123_tai_nghe_sony_wh_1000xm5_blue_songlongmedia.png', 4),
	(11, 'Dell Alienware Aurora R15', 'Máy tính gaming Dell Alienware Aurora R15 với card đồ họa RTX 4080', 35000000.00, 'public/uploads/67e10fe2171e1_dellxps13931510-2024-08-30-17-49-45.jpg', 2),
	(12, 'Micro thu âm Rode NT1-A', 'Micro thu âm Rode NT1-A với chất lượng âm thanh cao', 129000.00, 'public/uploads/67e10fcb22080_Micro-Thu-Am-Rode-NT2-A-Phu-Kien-Vlog-HTCamera-600x600.png', 5);

-- Dumping structure for table my_store.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table my_store.users: ~2 rows (approximately)
INSERT INTO `users` (`id`, `username`, `fullname`, `password`, `role`) VALUES
	(4, 'tuyet', 'maituyet', '$2y$12$qRvWtwcCqtzY2nUK7QTgSOm86Z07G6cP1fED.tXefOccqMekQglwK', 'admin'),
	(6, 'long', 'tuanlong', '$2y$12$GXuNnm3fscEuVBJIttMvfeg1Cycz.A9ojBkaVxevYIZgij7RMdgU2', 'user');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

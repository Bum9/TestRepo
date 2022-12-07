-- -- 221121
-- CREATE TABLE IF NOT EXISTS `users` (`id` INTEGER NOT NULL auto_increment , `email` VARCHAR(300) UNIQUE, `name` VARCHAR(30) NOT NULL, `nickname` VARCHAR(15) NOT NULL, `provider` VARCHAR(10) NOT NULL DEFAULT 'local', `sns_id` VARCHAR(30), `password` VARCHAR(300), `telephone` VARCHAR(13), `created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, `deleted_at` DATETIME, PRIMARY KEY (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- DROP TABLE IF EXISTS `products`;
-- CREATE TABLE IF NOT EXISTS `products` (`id` INTEGER NOT NULL auto_increment , `name` VARCHAR(20) NOT NULL, `desc` VARCHAR(255) NOT NULL, `price` VARCHAR(12) NOT NULL, `quantity` INTEGER(10) NOT NULL DEFAULT 1, `category` VARCHAR(50) NOT NULL DEFAULT 1, `created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- DROP TABLE IF EXISTS `payments`;
-- CREATE TABLE IF NOT EXISTS `payments` (`id` INTEGER NOT NULL auto_increment , `order_id` INTEGER UNSIGNED NOT NULL, `submit_code` VARCHAR(50), `amount` INTEGER UNSIGNED NOT NULL, `payment_id` VARCHAR(100) NOT NULL, `payment_type` ENUM('CARD', 'VIRTUAL_ACCOUNT', 'MOBILE_PHONE', 'TRANSFER', 'CULTURE_GIFT_CERTIFICATE', 'BOOK_GIFT_CERTIFICATE', 'GAME_GIFT_CERTIFICATE') NOT NULL, `status` VARCHAR(10), `created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, PRIMARY KEY (`id`)) 
-- ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- DROP TABLE IF EXISTS `orders`;
-- CREATE TABLE IF NOT EXISTS `orders` (`id` INTEGER NOT NULL auto_increment , `total` INTEGER UNSIGNED NOT NULL, `created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, `user_id` INTEGER, `payment_id` INTEGER, PRIMARY KEY (`id`), FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE, FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON 
-- DELETE SET NULL ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;       
-- DROP TABLE IF EXISTS `orderItems`;
-- CREATE TABLE IF NOT EXISTS `orderItems` (`id` INTEGER UNSIGNED , `created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, `product_id` INTEGER, `order_id` INTEGER, PRIMARY KEY (`id`), FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE, FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- DROP TABLE IF EXISTS `carts`;
-- CREATE TABLE IF NOT EXISTS `carts` (`id` INTEGER NOT NULL auto_increment , `total` DECIMAL(11) UNSIGNED NOT NULL, `created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, `user_id` INTEGER, PRIMARY KEY (`id`), FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- DROP TABLE IF EXISTS `cartItems`;
-- CREATE TABLE IF NOT EXISTS `cartItems` (`id` INTEGER NOT NULL auto_increment , `quantity` DECIMAL(11) UNSIGNED NOT NULL, `created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, `product_id` INTEGER, `cart_id` INTEGER, PRIMARY KEY (`id`), FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE, FOREIGN KEY (`cart_id`) REFERENCES `carts` 
-- (`id`) ON DELETE SET NULL ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- DROP TABLE IF EXISTS `admin`;
-- CREATE TABLE IF NOT EXISTS `admin` (`id` INTEGER NOT NULL auto_increment , `admin_name` VARCHAR(12) NOT NULL, `role` VARCHAR(15) NOT NULL, `password` VARCHAR(255), `telephone` VARCHAR(13), `created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, `deleted_at` DATETIME, PRIMARY KEY (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- DROP TABLE IF EXISTS `Bookmark`;
-- CREATE TABLE IF NOT EXISTS `Bookmark` (`created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, `user_id` INTEGER , `product_id` INTEGER , PRIMARY KEY (`user_id`, `product_id`), FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- DROP TABLE IF EXISTS `Checkout`;
-- CREATE TABLE IF NOT EXISTS `Checkout` (`created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, `payment_id` INTEGER , `order_id` INTEGER , PRIMARY KEY (`payment_id`, `order_id`), FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB 
-- DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;



-- -- 221127
-- CREATE TABLE IF NOT EXISTS `users` (`id` INTEGER NOT NULL auto_increment , `email` VARCHAR(300) UNIQUE, `name` VARCHAR(30) NOT NULL, `nickname` VARCHAR(15) NOT NULL, `provider` VARCHAR(10) NOT NULL DEFAULT 'local', `sns_id` VARCHAR(30), `password` VARCHAR(300), `telephone` VARCHAR(13), `created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, `deleted_at` DATETIME, PRIMARY KEY (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- CREATE TABLE IF NOT EXISTS `products` (`id` INTEGER NOT NULL auto_increment , `name` VARCHAR(20) NOT NULL, `desc` VARCHAR(255) NOT NULL, `price` VARCHAR(12) NOT NULL, `quantity` INTEGER(10) NOT NULL DEFAULT 1, `category` VARCHAR(50) NOT NULL DEFAULT 1, `created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- CREATE TABLE IF NOT EXISTS `payments` (`id` INTEGER NOT NULL auto_increment , `order_id` INTEGER UNSIGNED NOT NULL, `submit_code` VARCHAR(50), `amount` INTEGER UNSIGNED NOT NULL, `payment_id` VARCHAR(100) NOT NULL, `payment_type` ENUM('CARD', 'VIRTUAL_ACCOUNT', 'MOBILE_PHONE', 'TRANSFER', 'CULTURE_GIFT_CERTIFICATE', 'BOOK_GIFT_CERTIFICATE', 'GAME_GIFT_CERTIFICATE') NOT NULL, `status` VARCHAR(10), `created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- CREATE TABLE IF NOT EXISTS `orders` (`id` INTEGER NOT NULL auto_increment , `total` INTEGER UNSIGNED NOT NULL, `created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, `user_id` INTEGER, `payment_id` INTEGER, PRIMARY KEY (`id`), FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE, FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- CREATE TABLE IF NOT EXISTS `orderItems` (`id` INTEGER UNSIGNED , `created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, `product_id` INTEGER, `order_id` INTEGER, PRIMARY KEY (`id`), FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE, FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- CREATE TABLE IF NOT EXISTS `carts` (`id` INTEGER NOT NULL auto_increment , `total` DECIMAL(11) UNSIGNED NOT NULL, `created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, `user_id` INTEGER, PRIMARY KEY (`id`), FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- CREATE TABLE IF NOT EXISTS `cartItems` (`id` INTEGER NOT NULL auto_increment , `quantity` DECIMAL(11) UNSIGNED NOT NULL, `created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, `product_id` INTEGER, `cart_id` INTEGER, PRIMARY KEY (`id`), FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE, FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- CREATE TABLE IF NOT EXISTS `admin` (`id` INTEGER NOT NULL auto_increment , `admin_name` VARCHAR(12) NOT NULL, `role` VARCHAR(15) NOT NULL, `password` VARCHAR(255), `telephone` VARCHAR(13), `created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, `deleted_at` DATETIME, PRIMARY KEY (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- CREATE TABLE IF NOT EXISTS `bookmark` (`created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, `user_id` INTEGER , `product_id` INTEGER , PRIMARY KEY (`user_id`, `product_id`), FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- CREATE TABLE IF NOT EXISTS `checkout` (`created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, `payment_id` INTEGER , `order_id` INTEGER , PRIMARY KEY (`payment_id`, `order_id`), FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- -- 221202
-- CREATE TABLE IF NOT EXISTS `users` (`id` INTEGER NOT NULL auto_increment , `email` VARCHAR(300) UNIQUE, `name` VARCHAR(30) NOT NULL, `nickname` VARCHAR(15) NOT NULL, `provider` VARCHAR(10) NOT NULL DEFAULT 'local', `sns_id` VARCHAR(30), `password` VARCHAR(300), `telephone` VARCHAR(13), `created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, `deleted_at` DATETIME, PRIMARY KEY (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- CREATE TABLE IF NOT EXISTS `products` (`id` INTEGER NOT NULL auto_increment , `name` VARCHAR(20) NOT NULL, `desc` VARCHAR(255) NOT NULL, `price` VARCHAR(12) NOT NULL, `quantity` INTEGER(10) NOT NULL DEFAULT 1, `category` VARCHAR(50) NOT NULL DEFAULT 1, `created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- CREATE TABLE IF NOT EXISTS `orders` (`id` INTEGER NOT NULL auto_increment , `total` INTEGER UNSIGNED NOT NULL, `created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, `user_id` INTEGER, PRIMARY KEY (`id`), FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- CREATE TABLE IF NOT EXISTS `payments` (`id` INTEGER NOT NULL auto_increment , `submit_code` VARCHAR(50), `amount` INTEGER UNSIGNED NOT NULL, `payment_id` VARCHAR(100) NOT NULL, `payment_type` VARCHAR(20) NOT NULL, `status` VARCHAR(10), `created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, `order_id` INTEGER, PRIMARY KEY (`id`), FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- CREATE TABLE IF NOT EXISTS `orderItems` (`id` INTEGER UNSIGNED , `product_id` INTEGER, `order_id` INTEGER, PRIMARY KEY (`id`), FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE, FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- CREATE TABLE IF NOT EXISTS `carts` (`id` INTEGER NOT NULL auto_increment , `total` DECIMAL(11) UNSIGNED NOT NULL, `created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, `user_id` INTEGER, PRIMARY KEY (`id`), FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- CREATE TABLE IF NOT EXISTS `cartItems` (`id` INTEGER NOT NULL auto_increment , `quantity` DECIMAL(11) UNSIGNED NOT NULL, `product_id` INTEGER, `cart_id` INTEGER, PRIMARY KEY (`id`), FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE, FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- CREATE TABLE IF NOT EXISTS `admin` (`id` INTEGER NOT NULL auto_increment , `admin_name` VARCHAR(12) NOT NULL, `role` VARCHAR(15) NOT NULL, `password` VARCHAR(255), `telephone` VARCHAR(13), `created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, `deleted_at` DATETIME, PRIMARY KEY (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- CREATE TABLE IF NOT EXISTS `bookmark` (`created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, `user_id` INTEGER , `product_id` INTEGER , PRIMARY KEY (`user_id`, `product_id`), FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;
-- CREATE TABLE IF NOT EXISTS `checkouts` (`created_at` DATETIME NOT NULL, `updated_at` DATETIME NOT NULL, `payment_id` INTEGER , `order_id` INTEGER , PRIMARY KEY (`payment_id`, `order_id`), FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

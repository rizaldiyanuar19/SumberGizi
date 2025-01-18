-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2025 at 06:05 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ciolshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(125) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `username`, `password`, `role`) VALUES
(1, 'Khaidir', 'admin', '$2y$10$CpalghYghxAcc0Qo0fePiuH0d4JKvPlFRvWzhjJlNQ9WSir64rIbG', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `message` text NOT NULL,
  `sub_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `id_user`, `id_product`, `quantity`, `message`, `sub_total`) VALUES
(10, 1, 5, 1, '', 250000),
(11, 1, 1, 1, '', 150000);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`, `slug`) VALUES
(10, 'Daging sapi segar', 'daging-sapi-segar'),
(11, 'daging sapi tulang', 'daging-sapi-tulang'),
(12, 'daging sapi dadu', 'daging-sapi-dadu'),
(13, 'daging sapi giling', 'daging-sapi-giling');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(125) NOT NULL,
  `province` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `courier` varchar(125) NOT NULL,
  `cost_courier` int(11) NOT NULL,
  `waybill` varchar(125) DEFAULT NULL,
  `status` enum('waiting','paid','process','delivered','cancel') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `date`, `invoice`, `total`, `name`, `address`, `city`, `province`, `phone`, `courier`, `cost_courier`, `waybill`, `status`) VALUES
(8, 5, '2025-01-11', '520250111233936', 100000, 'yanto', 'Jogja', 'Yogyakarta', 'DI Yogyakarta', '081288384474743', 'JNE', 34000, '123455667890--', 'process'),
(9, 5, '2025-01-12', '520250112235653', 300000, 'yanto', 'Jogja', 'Yogyakarta', 'DI Yogyakarta', '081288384474743', 'JNE', 34000, NULL, 'delivered'),
(10, 5, '2025-01-12', '520250112235850', 400000, 'yanto', 'Jogja', 'Yogyakarta', 'DI Yogyakarta', '081288384474743', 'POS Indonesia', 34500, NULL, 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `order_confirm`
--

CREATE TABLE `order_confirm` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` int(50) NOT NULL,
  `nominal` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_confirm`
--

INSERT INTO `order_confirm` (`id`, `id_orders`, `account_name`, `account_number`, `nominal`, `note`, `image`) VALUES
(1, 1, 'Rakhmat Khaidir', 2147483647, 207000, '-', '120200517051437-20200517125810.png'),
(2, 2, 'Rakhmat Khaidir', 2147483647, 1628000, '-', '220200518152229-20200518152322.jpg'),
(3, 3, 'Rakhmat Khaidir', 2147483647, 165000, '-', '220200518154713-20200518154933.jpg'),
(4, 4, 'Rakhmat Khaidir', 2147483647, 135000, '-', '220200518215129-20200518215202.jpg'),
(5, 5, 'yanuar', 123456789, 836, '-fdg', '420241204121215-20241204122812.png'),
(6, 6, 'aradh', 2147483647, 37, '-edf', '420241204133620-20241204133754.png'),
(7, 7, 'avsdjvsad', 2147483647, 834, '-dfg', '420241204170714-20241204170809.png'),
(8, 8, 'Yanto', 2147483647, 3000000, '-ajhsajhsajsh', '520250111233936-20250111234028.png'),
(9, 10, 'Yanto', 2147483647, 3, 'Yanto', '520250112235850-20250112235945.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(4) NOT NULL,
  `message` text NOT NULL,
  `sub_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `id_orders`, `id_product`, `quantity`, `message`, `sub_total`) VALUES
(1, 1, 1, 1, '', 150000),
(2, 2, 9, 2, 'Ukuran M', 1600000),
(3, 3, 1, 1, '', 150000),
(4, 4, 5, 1, '', 250000),
(5, 5, 9, 1, '', 800000),
(6, 6, 11, 1, '', 30),
(7, 7, 9, 1, '', 800000),
(8, 8, 12, 1, 'mantap', 100000),
(9, 9, 18, 1, 'Dging nya satu kilo', 300000),
(10, 10, 16, 1, 'daging', 400000);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `size` varchar(125) NOT NULL,
  `color` varchar(255) NOT NULL,
  `type` enum('L','W') NOT NULL,
  `price` int(11) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) NOT NULL,
  `delete` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `id_category`, `slug`, `title`, `description`, `size`, `color`, `type`, `price`, `is_available`, `image`, `delete`) VALUES
(16, 10, 'daging-sapi-segar', 'Daging sapi segar', 'daging segar', '5 kg', 'dag', 'L', 400000, 1, 'daging-sapi-segar-20250112234617.jpg', 1),
(17, 13, 'daging-giling', 'Daging giling', 'daging sapi giling', '3 kg', 'daging giling', 'W', 100000, 1, 'daging-giling-20250112234842.jpg', 1),
(18, 12, 'daging-dadu', 'Daging dadu', 'daging sapi dadu', '4 kg', 'daging sapi dadu', 'L', 300000, 1, 'daging-dadu-20250112235142.jpg', 1),
(19, 11, 'daging-sapi-tulang', 'Daging sapi tulang', 'daging sapi tulang', '3 kg', 'daging sapi tulang', 'W', 100000, 1, 'daging-sapi-tulang-20250112235241.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `sequence` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `title`, `sequence`, `image`) VALUES
(2, 'Gratis Ongkir', 2, 'img-2.jpg'),
(6, 'Promo daging', 4, 'promo-daging-20250111223153.jpg'),
(8, 'Promo Kurban', 1, 'asaksjaks-20250111232720.png');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `date_register` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `image`, `is_active`, `date_register`) VALUES
(1, 'Rakhmat Khaidir', 'rkhaidir084@yahoo.com', '$2y$10$9V8oAaE2lP4dv8/dHQHROu32Q0TceECn8GI1zZ3/RfdaaPRMhlIVS', 'rakhmat-khaidir-20200518134148.png', 1, 1589606335),
(2, 'test', 'test@roket.id', '$2y$10$G4JBqYZtsQXiRJlxWnSSke1IE27N9HIQrlT0TKJs8mJPKpmLvJdSC', '', 1, 1589606941),
(3, 'test', 'test@roket.com', '$2y$10$.XGuvelX4jEzd6tUgfpGrO3OXL1ROxY6Ovmah0L9ljM3xe3J9in3C', '', 1, 1589607434),
(4, 'rizal', 'rizaldiyanuar19@gmail.com', '$2y$10$CasLnsH8Z39BMIKABYx.8OOW4vq0Iusn4QMtBKR0h36TUU5xZCKQi', '', 1, 1733288905),
(5, 'yanto', 'yanto@gmail.com', '$2y$10$hHSFx/rRQtF.1NrMbGq/HeaF6TOdyCmbu3l4dd1aGgJQy5mXon5GO', '', 1, 1736700034);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_confirm`
--
ALTER TABLE `order_confirm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_confirm`
--
ALTER TABLE `order_confirm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

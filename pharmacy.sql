-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jan 04, 2022 at 01:13 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(250) NOT NULL,
  `price` double NOT NULL,
  `weight_in_mg` double NOT NULL,
  `expiry_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`product_id`, `product_name`, `price`, `weight_in_mg`, `expiry_date`) VALUES
(101, 'Protein Plus', 500, 500, '2024-02-04');

-- --------------------------------------------------------

--
-- Table structure for table `health_care`
--

CREATE TABLE `health_care` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(250) NOT NULL,
  `price` double NOT NULL,
  `weight_in_mg` double NOT NULL,
  `expiry_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `health_care`
--

INSERT INTO `health_care` (`product_id`, `product_name`, `price`, `weight_in_mg`, `expiry_date`) VALUES
(101, 'Protein Plus', 500, 500, '2024-02-04'),
(102, 'Revital H', 600, 1000, '2025-11-04'),
(103, 'Dabur chavanprash', 316, 1000, '2024-10-04'),
(104, 'Himalaya neem facewash', 72, 500, '2024-11-04'),
(105, 'Celevida', 587, 4000, '2023-11-04');

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `product_id` int(11) NOT NULL,
  `medicine_name` varchar(250) NOT NULL,
  `price` double NOT NULL,
  `weight_in_mg` double NOT NULL,
  `expiry_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`product_id`, `medicine_name`, `price`, `weight_in_mg`, `expiry_date`) VALUES
(1, 'Eltroxin Tablet', 300, 100, '2023-12-28'),
(2, 'Asthalin Inhaler', 400, 100, '2024-11-04'),
(3, 'Lisinopril', 104, 100, '2022-01-29'),
(4, 'Metformin', 1000, 78, '2022-01-21'),
(5, 'Albeuterol', 243, 50, '2024-11-04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `email`, `password`) VALUES
('Apeksha shetty', 'shettyapeksha21@gmail.com', 'apeksha'),
('bangude', 'bangude@gmail.com', 'bangude'),
('Karthik_shetty', 'shettykarthik110@gmail.com', 'karthik'),
('keerthan', 'keerthan110@gmail.com', 'keerthan'),
('Shreya', 'shreyasherigar097@gmail.com', 'shreya'),
('yakshita', 'yakshita@gmail.com', 'yakshita');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `health_care`
--
ALTER TABLE `health_care`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100001;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

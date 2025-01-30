-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2023 at 01:42 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mypro_bbms`
--

-- --------------------------------------------------------

--
-- Table structure for table `bgroup`
--

CREATE TABLE `bgroup` (
  `id` int(11) NOT NULL,
  `bgroup` varchar(10) NOT NULL,
  `units` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bgroup`
--

INSERT INTO `bgroup` (`id`, `bgroup`, `units`) VALUES
(1, 'A+', 1),
(3, 'A-', 2),
(4, 'B+', 2),
(5, 'B-', 4),
(6, 'AB+', 5),
(7, 'AB-', 0),
(8, 'O+', 4),
(9, 'O-', 1),
(10, 'Oh+', 1),
(11, 'Oh-', 1);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `donor_id` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `cdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `donor_id`, `action`, `cdate`) VALUES
(57, '64306048deb74', 'Inserted', '2023-04-07 23:56:16'),
(58, '643060b9917b3', 'Inserted', '2023-04-07 23:58:09'),
(59, '6430610d2536e', 'Inserted', '2023-04-07 23:59:33'),
(60, '643061982ef27', 'Inserted', '2023-04-08 00:01:52'),
(61, '643062a70cf4e', 'Inserted', '2023-04-08 00:06:23'),
(62, '643062f805153', 'Inserted', '2023-04-08 00:07:44'),
(63, '643063632fa36', 'Inserted', '2023-04-08 00:09:31'),
(64, '643063b131307', 'Inserted', '2023-04-08 00:10:49'),
(65, '64306048deb74', 'Deleted', '2023-04-08 00:13:00'),
(66, '643060b9917b3', 'Deleted', '2023-04-08 00:13:00'),
(67, '6430610d2536e', 'Deleted', '2023-04-08 00:13:00'),
(68, '643064c47607d', 'Inserted', '2023-04-08 00:15:24'),
(69, '6430650b96458', 'Inserted', '2023-04-08 00:16:35'),
(70, '6430656228656', 'Inserted', '2023-04-08 00:18:02'),
(71, '643065abc3479', 'Inserted', '2023-04-08 00:19:15'),
(72, '643065abc3479', 'Deleted', '2023-04-08 00:20:00'),
(73, '6430662fea9a2', 'Inserted', '2023-04-08 00:21:27'),
(74, '6430669d8dac6', 'Inserted', '2023-04-08 00:23:17'),
(75, '643066f3a273f', 'Inserted', '2023-04-08 00:24:43'),
(76, '6430676b9447f', 'Inserted', '2023-04-08 00:26:43'),
(77, '643067aed9a91', 'Inserted', '2023-04-08 00:27:50'),
(78, '6430683359546', 'Inserted', '2023-04-08 00:30:03'),
(79, '643062a70cf4e', 'updated', '2023-04-08 00:31:44'),
(80, '643062a70cf4e', 'updated', '2023-04-08 00:34:02'),
(81, '643062a70cf4e', 'updated', '2023-04-08 00:34:21'),
(82, '643062f805153', 'updated', '2023-04-08 00:34:47'),
(83, '643063632fa36', 'updated', '2023-04-08 00:36:50'),
(84, '64306a1e67111', 'Inserted', '2023-04-08 00:38:14'),
(85, '64306b7335cb8', 'Inserted', '2023-04-08 00:43:55'),
(86, '643061982ef27', 'Deleted', '2023-04-08 00:57:51'),
(87, '64306eb797345', 'Inserted', '2023-04-08 00:57:51'),
(88, '643063b131307', 'updated', '2023-04-08 01:00:16'),
(89, '643064c47607d', 'updated', '2023-04-08 01:00:30'),
(90, '6430650b96458', 'updated', '2023-04-08 01:00:44'),
(91, '6430656228656', 'updated', '2023-04-08 01:00:58'),
(92, '6430662fea9a2', 'updated', '2023-04-08 01:01:20'),
(93, '6430669d8dac6', 'updated', '2023-04-08 01:01:36'),
(94, '643066f3a273f', 'updated', '2023-04-08 01:02:04'),
(95, '6430676b9447f', 'updated', '2023-04-08 01:02:28'),
(96, '643067aed9a91', 'updated', '2023-04-08 01:02:57'),
(97, '6430683359546', 'updated', '2023-04-08 01:03:13'),
(98, '6432d87d78b4f', 'Inserted', '2023-04-09 20:53:41'),
(99, '6432d8ad2e30e', 'Inserted', '2023-04-09 20:54:29'),
(100, '6432d87d78b4f', 'updated', '2023-04-09 20:56:43'),
(101, '6432d87d78b4f', 'updated', '2023-04-09 20:56:47'),
(102, '6432d87d78b4f', 'updated', '2023-04-09 20:56:54'),
(103, '6432d8ad2e30e', 'updated', '2023-04-09 20:56:59'),
(104, '6432d8ad2e30e', 'updated', '2023-04-09 20:57:01'),
(105, '6432d87d78b4f', 'updated', '2023-04-09 20:57:16'),
(106, '6432d8ad2e30e', 'updated', '2023-04-09 20:57:24'),
(107, '6432d8ad2e30e', 'updated', '2023-04-09 20:57:29'),
(108, '6432d87d78b4f', 'updated', '2023-04-09 20:57:47'),
(109, '6432d8ad2e30e', 'updated', '2023-04-09 20:57:53'),
(110, '6433dacc990f1', 'Inserted', '2023-04-10 15:15:48'),
(111, '6433dacc990f1', 'updated', '2023-04-10 15:16:48'),
(112, '643fb4360ff12', 'Inserted', '2023-04-19 14:58:22'),
(113, '6432d87d78b4f', 'updated', '2023-04-19 18:07:58'),
(114, '6443b8a9a6e8c', 'Inserted', '2023-04-22 16:06:25'),
(115, '6443b8a9a6e8c', 'updated', '2023-04-22 16:08:15'),
(116, '6443b8a9a6e8c', 'updated', '2023-04-22 16:08:47'),
(117, '6443b8a9a6e8c', 'updated', '2023-04-22 16:08:54'),
(118, '6443b8a9a6e8c', 'updated', '2023-04-22 16:09:32');

-- --------------------------------------------------------

--
-- Table structure for table `special_ids`
--

CREATE TABLE `special_ids` (
  `special_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `special_ids`
--

INSERT INTO `special_ids` (`special_id`) VALUES
('0802006683'),
('1047006478'),
('1414617504'),
('2040750362'),
('4543239473'),
('5547223233'),
('5823275183'),
('7942177200'),
('9253052468'),
('9469767633'),
('9665487853');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bgroup`
--
ALTER TABLE `bgroup`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bgroup` (`bgroup`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `special_ids`
--
ALTER TABLE `special_ids`
  ADD PRIMARY KEY (`special_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bgroup`
--
ALTER TABLE `bgroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

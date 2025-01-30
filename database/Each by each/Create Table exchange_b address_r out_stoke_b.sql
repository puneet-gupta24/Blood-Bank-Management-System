-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2023 at 01:41 PM
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
-- Table structure for table `address_r`
--

CREATE TABLE `address_r` (
  `id` varchar(20) NOT NULL,
  `flat` varchar(10) NOT NULL,
  `street` varchar(50) NOT NULL,
  `pincode` int(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address_r`
--

INSERT INTO `address_r` (`id`, `flat`, `street`, `pincode`, `city`, `state`, `country`) VALUES
('64306eb797345', '4A/3', 'Hemant Nagar', 133001, 'Patiala', 'Punjab', 'India');

-- --------------------------------------------------------

--
-- Table structure for table `exchange_b`
--

CREATE TABLE `exchange_b` (
  `id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `fname` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `bgroup_d` varchar(10) NOT NULL,
  `bgroup_e` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exchange_b`
--

INSERT INTO `exchange_b` (`id`, `name`, `age`, `gender`, `fname`, `email`, `mobile`, `bgroup_d`, `bgroup_e`) VALUES
('64306eb797345', 'Hemant', 56, 'Male', 'HG', 'hg@gmail.com ', '8654123698', 'AB+', 'A+');

-- --------------------------------------------------------

--
-- Table structure for table `out_stoke_b`
--

CREATE TABLE `out_stoke_b` (
  `id` int(11) NOT NULL,
  `bgroup` varchar(10) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `mobile` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `out_stoke_b`
--

INSERT INTO `out_stoke_b` (`id`, `bgroup`, `name`, `mobile`) VALUES
(55, 'A+', 'Ansh', 2147483647);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address_r`
--
ALTER TABLE `address_r`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exchange_b`
--
ALTER TABLE `exchange_b`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `out_stoke_b`
--
ALTER TABLE `out_stoke_b`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `out_stoke_b`
--
ALTER TABLE `out_stoke_b`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address_r`
--
ALTER TABLE `address_r`
  ADD CONSTRAINT `fky` FOREIGN KEY (`id`) REFERENCES `exchange_b` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

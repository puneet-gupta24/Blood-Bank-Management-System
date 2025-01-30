-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2023 at 01:39 PM
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
-- Table structure for table `address_d`
--

CREATE TABLE `address_d` (
  `id` varchar(20) NOT NULL,
  `flat` varchar(10) NOT NULL,
  `street` varchar(50) NOT NULL,
  `pincode` int(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address_d`
--

INSERT INTO `address_d` (`id`, `flat`, `street`, `pincode`, `city`, `state`, `country`) VALUES
('643062a70cf4e', '4A/3', 'Green Park', 110016, 'Delhi', 'Delhi', 'India'),
('643062f805153', '2B/5', 'Shanti Nagar', 40007, 'Mumbai', 'Maharashtra', 'India'),
('643063632fa36', '3C/7', 'Sector 18', 201301, 'Noida', 'Uttar Pradesh', 'India'),
('643063b131307', '1D/9', 'Rajouri Garden', 110027, 'Delhi', 'Delhi', 'India'),
('643064c47607d', '2G/5', 'Banashankari', 560070, 'Bangalore', 'Karnataka', 'India'),
('6430650b96458', '5E/1', 'Malviya Nagar', 302017, 'Jaipur', 'Rajasthan', 'India'),
('6430656228656', 'F-102', 'MG Road', 400102, 'Mumbai', 'Maharashtra', 'India'),
('6430662fea9a2', ' D-503', 'Salt Lake City', 700106, 'Kolkata', 'West Bengal', 'India'),
('6430669d8dac6', 'B-602', 'Jubilee Hills', 500033, 'Hyderabad', 'Telangana', 'India'),
('643066f3a273f', 'A-50', 'Tollygunge, Kolkata', 700040, 'Kolkata', 'West Bengal', 'India'),
('6430676b9447f', '21', 'kannaught', 140507, 'Mumbai', 'Maharashtra', 'India'),
('643067aed9a91', '2B/A', 'Jadooi Kolony', 201911, 'Mumbai', 'Maharashtra', 'India'),
('6430683359546', '26B', 'BCC Colony', 981292, 'Mumbai', 'Maharashtra', 'India'),
('64306a1e67111', '4A/3', 'DAYA nagar', 201301, 'Derabassi', 'Punjab', 'India'),
('64306b7335cb8', 'S1/64', 'ABC Road,Near RJ Studios', 140507, 'Raipur', 'Chattisgarh', 'India'),
('64306eb797345', '4A/3', 'Hemant Nagar', 133001, 'Patiala', 'Punjab', 'India'),
('6432d87d78b4f', 'a4', 'bcd', 111222, 'Ambala', 'Haryana', 'India'),
('6432d8ad2e30e', '4b', 'g compound', 111222, 'Ambala', 'Haryana', 'India'),
('6433dacc990f1', '4A/3', 'Abc colony', 134112, 'Panchkula', 'Haryana', 'India'),
('643fb4360ff12', '1/67A', 'XYZ street', 140507, 'Derabassi', 'Punjab', 'India'),
('6443b8a9a6e8c', '4/j', 'abc colony d', 210123, 'Mumbai', 'Maharashtra', 'India');

-- --------------------------------------------------------

--
-- Table structure for table `donor_registration`
--

CREATE TABLE `donor_registration` (
  `id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL CHECK (`name` <> NULL),
  `AGE` int(11) NOT NULL CHECK (`AGE` >= 18),
  `gender` varchar(10) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `bgroup` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donor_registration`
--

INSERT INTO `donor_registration` (`id`, `name`, `AGE`, `gender`, `fname`, `email`, `mobile`, `bgroup`) VALUES
('643062a70cf4e', 'Aarav Gupta', 26, 'Male', 'Ajay Gupta', 'aaravgupta@gmail.com', '9034785216', 'A-'),
('643062f805153', 'Nidhi Singh', 35, 'Female', 'Rajendra Singh', 'nidhisingh@yahoo.com', '9437197634', 'O+'),
('643063632fa36', 'Aditya Verma', 29, 'Male', 'Pradeep Verma', 'adityaverma@hotmail.com', '9045871365', 'B+'),
('643063b131307', 'Pooja Sharma', 32, 'Female', 'Anil Sharma', 'poojasharma@gmail.com', '7984653210', 'O-'),
('643064c47607d', 'Arjun Singh', 31, 'Male', 'Alok Singh', 'arjunsingh@gmail.com', '8712639405', 'B-'),
('6430650b96458', 'Rohan Gupta', 28, 'Male', 'Vikas Gupta', 'rohangupta@yahoo.com', '9521738640', 'A+'),
('6430656228656', 'Ayaan Gupta', 27, 'Male', 'Rajesh Gupta', 'ayaan.gupta@example.com', '6879341025', 'AB+'),
('6430662fea9a2', 'Avik Das', 29, 'Male', 'Anirban Das', 'avik.das@example', '7405936182', 'Oh-'),
('6430669d8dac6', 'Srishti Mehta', 26, 'Female', 'Rahul Mehta', 'srishti.mehta@example.com', '8649321075', 'B-'),
('643066f3a273f', 'Ishaan Chatterjee', 30, 'Male', 'Ritesh Chatterjee', 'ishaan.chatterjee@example.com', '5362417890', 'AB+'),
('6430676b9447f', 'Ishika', 33, 'Select', 'sample', 'tagik27253@proexbol.com', '8149263750', 'O+'),
('643067aed9a91', 'Raj Kapoor', 23, 'Other', 'G', 'mgupta5_be21@thapar.edu', '9265310457', 'O+'),
('6430683359546', 'Mohit', 19, 'Male', 'AA', 'mohitexam2003@gmail.com', '8009542376', 'O+'),
('64306a1e67111', 'Mayank', 36, 'Male', 'MJ', 'dsnjdfs@gmail.com', '8737197634', 'A-'),
('64306b7335cb8', 'Ajay Singhania', 45, 'Male', 'Raju', 'gggg@gmail.com', '2548923187', 'B+'),
('64306eb797345', 'Hemant', 56, 'Male', 'HG', 'hg@gmail.com ', '8654123698', 'AB+'),
('6432d87d78b4f', 'M', 34, 'Male', 'G', 'hi', '1111111234', 'B-'),
('6432d8ad2e30e', 'Ghh', 23, 'Male', 'fs', 'GEh', '2458796537', 'B-'),
('6433dacc990f1', 'Ankur Dhawan', 20, 'Male', 'Rajnesh Dhawan', 'Adhawan@gmail.com', '8398878544', 'Oh+'),
('643fb4360ff12', 'Guniya', 45, 'Other', 'Rajesh', 'dsnjdfs@gmail.com', '1112225552', 'AB+'),
('6443b8a9a6e8c', 'Pareesh', 19, 'Male', 'XYZ', 'tagik27253@proexbol.com', '1221212121', 'AB+');

--
-- Triggers `donor_registration`
--
DELIMITER $$
CREATE TRIGGER `on_delete` BEFORE DELETE ON `donor_registration` FOR EACH ROW INSERT INTO LOGS VALUES(null,old.id,'Deleted',now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `on_insert` AFTER INSERT ON `donor_registration` FOR EACH ROW INSERT INTO LOGS VALUES(null,new.id,'Inserted',now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `on_update` AFTER UPDATE ON `donor_registration` FOR EACH ROW INSERT INTO LOGS VALUES(null,new.id,'updated',now())
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address_d`
--
ALTER TABLE `address_d`
  ADD KEY `fk` (`id`);

--
-- Indexes for table `donor_registration`
--
ALTER TABLE `donor_registration`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address_d`
--
ALTER TABLE `address_d`
  ADD CONSTRAINT `fk` FOREIGN KEY (`id`) REFERENCES `donor_registration` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

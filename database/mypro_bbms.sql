-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2023 at 01:35 PM
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

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_insert` (IN `in_uname` VARCHAR(50), IN `in_pass` VARCHAR(50), IN `in_con_pass` VARCHAR(50), IN `in_name` VARCHAR(50), IN `in_email` VARCHAR(50), IN `in_special_id` VARCHAR(10), OUT `p_message` VARCHAR(255))   BEGIN
DECLARE userc INT DEFAULT 0;
DECLARE isdc INT DEFAULT 0;

	DECLARE foreign_key_error CONDITION FOR 1452;
	DECLARE unique_key_error CONDITION FOR 1062;
		 DECLARE EXIT HANDLER FOR foreign_key_error 
  	  		SET p_message = 'Wrong Special_id';
 		 DECLARE EXIT HANDLER FOR unique_key_error
        	SET p_message = 'Username already exists';
        
IF (in_pass != in_con_pass) THEN
    SET p_message = 'Password and Confirm Password do not match';
ELSE   
    INSERT INTO admin (uname,pass,con_pass,name,email,special_id) VALUES (in_uname,in_pass,in_con_pass,in_name,in_email,in_special_id);
    SET p_message = 'Admin Registration Successful';
    End IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `list_bgroup` ()   BEGIN
   DECLARE bg VARCHAR(10);
   DECLARE unitss INT;
   DECLARE done INT DEFAULT FALSE;
   DECLARE bgroup_cursor CURSOR FOR SELECT bgroup, units FROM bgroup;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

   OPEN bgroup_cursor;

   SET @result = '';
   
   read_loop: LOOP
      FETCH bgroup_cursor INTO bg, unitss;
      IF done THEN
         LEAVE read_loop;
      END IF;

      SET @result = CONCAT(@result, '<tr><td>', bg, '</td><td>', unitss, '</td></tr>');
   END LOOP;

   CLOSE bgroup_cursor;

   SELECT @result;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `search_donor` (IN `p_bgroup` VARCHAR(10), IN `p_state` VARCHAR(100))   BEGIN
SELECT dr1.name, dr1.mobile, dr1.bgroup, da.state, dr1.age
  FROM donor_registration dr1
  JOIN donor_registration dr2 ON dr1.id = dr2.id
  JOIN address_d da ON dr2.id = da.id
  WHERE dr1.bgroup = p_bgroup AND da.state = p_state;
  END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `update_mobile` (`p_id` VARCHAR(20), `new_mobile` VARCHAR(11)) RETURNS TEXT CHARSET utf8mb4 COLLATE utf8mb4_general_ci  BEGIN
  DECLARE v_count INT;
  DECLARE v_error_message TEXT;
  DECLARE v_success_message TEXT;
  DECLARE temp INT;
  SET v_error_message = 'ID not found';
  SET v_success_message = 'Mobile number updated successfully';
  
  UPDATE donor_registration SET mobile = new_mobile WHERE id = p_id;
  SELECT mobile INTO TEMP FROM donor_registration WHERE id = p_id;
 
  IF temp = new_mobile THEN   
     RETURN v_success_message;
  ELSE
     RETURN v_error_message;
  END IF;
END$$

DELIMITER ;

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
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `pass` varchar(10) NOT NULL,
  `con_pass` varchar(50) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(20) NOT NULL,
  `special_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `uname`, `pass`, `con_pass`, `name`, `email`, `special_id`) VALUES
(1, 'admin', 'a123', 'a123', 'mohit', 'aja@gmail.com', '0802006683'),
(31, 'Gupta_361', 'Gupta@361', 'Gupta@361', 'Mohit', 'mgupta5_be21@thapar.', '1414617504'),
(32, 'adhawan', '1234', '1234', 'Ankur Dhawan', 'dsnjdfs@gmail.com', '1047006478'),
(35, 'Bhayana56', 'Bhayana@56', 'Bhayana@56', 'Guneesh', 'tagik27253@proexbol.', '5823275183'),
(36, 'pa234', '1234', '1234', 'Pareesh', 'werrwe', '2040750362');

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
-- Indexes for table `address_d`
--
ALTER TABLE `address_d`
  ADD KEY `fk` (`id`);

--
-- Indexes for table `address_r`
--
ALTER TABLE `address_r`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uname` (`uname`),
  ADD UNIQUE KEY `special_id` (`special_id`);

--
-- Indexes for table `bgroup`
--
ALTER TABLE `bgroup`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bgroup` (`bgroup`);

--
-- Indexes for table `donor_registration`
--
ALTER TABLE `donor_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exchange_b`
--
ALTER TABLE `exchange_b`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `out_stoke_b`
--
ALTER TABLE `out_stoke_b`
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
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

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

--
-- AUTO_INCREMENT for table `out_stoke_b`
--
ALTER TABLE `out_stoke_b`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address_d`
--
ALTER TABLE `address_d`
  ADD CONSTRAINT `fk` FOREIGN KEY (`id`) REFERENCES `donor_registration` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `address_r`
--
ALTER TABLE `address_r`
  ADD CONSTRAINT `fky` FOREIGN KEY (`id`) REFERENCES `exchange_b` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fkl` FOREIGN KEY (`special_id`) REFERENCES `special_ids` (`special_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

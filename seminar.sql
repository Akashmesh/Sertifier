-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2024 at 05:13 PM
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
-- Database: `seminar`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminlogin`
--

CREATE TABLE `adminlogin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminlogin`
--

INSERT INTO `adminlogin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `empregno` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL DEFAULT '',
  `fathersName` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `contactAddress` text NOT NULL,
  `photoPath` varchar(255) DEFAULT NULL,
  `companyName` varchar(255) NOT NULL,
  `jobTitle` varchar(255) NOT NULL,
  `dateOfJoining` date NOT NULL,
  `mobileNumber` varchar(15) NOT NULL,
  `whatsappNumber` varchar(15) DEFAULT NULL,
  `workshopSeminar` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `fees` int(11) NOT NULL,
  `surname` varchar(255) DEFAULT '',
  `namePrefix` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`empregno`, `fname`, `lname`, `fathersName`, `dob`, `contactAddress`, `photoPath`, `companyName`, `jobTitle`, `dateOfJoining`, `mobileNumber`, `whatsappNumber`, `workshopSeminar`, `title`, `date`, `time`, `fees`, `surname`, `namePrefix`) VALUES
('EMP20763', 'Aakash', 'Meshram', 'Sanjay', '2001-05-20', 'Morshi', 'uploads/my_2.jpg', 'AK Org', ' Manager', '2024-02-01', '8856821788', '8856821788', 'Tool Automation', 'By JAdhao Group', '2024-05-01', '04:00:00', 0, 'Meshram', 'Mr.'),
('EMP23924', 'shivansh', 'khurad', 'ram', '2002-12-06', 'warud', NULL, 'jk', 'xyz', '2023-06-07', '8765934509', NULL, 'Tool Automation', 'By JAdhao Group', '2024-08-07', '04:00:00', 800, '', 'Mr.'),
('EMP82760', 'Vaishnavi', 'Khurad', 'Pramodrao', '2001-03-07', 'Warud', 'uploads/WhatsApp Image 2023-12-24 at 10.51.27_5ba8b03c-modified_7.png', 'Ak Lts', 'HR', '2024-02-01', '7575757575', '9595959595', 'Tool Automation', 'By JAdhao Group', '2024-06-01', '04:00:00', 0, 'Khurad', 'Miss.'),
('EMP88217', 'Dnyanendrakantibabu', 'deshmukh', 'Gulabrao', '1960-01-01', 'Wathioda', 'uploads/WhatsApp Image 2023-12-24 at 10.51.27_5ba8b03c-modified_8.png', 'Deshmukh and Sons', 'Owner', '2024-01-01', '8528528523', '9639639633', 'Tool Automation', 'By JAdhao Group', '2024-01-01', '04:00:00', 0, 'Deshmukh', 'Mr.');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`id`, `name`, `username`, `password`) VALUES
(1, 'AKASH', 'manager1', 'manager1'),
(2, 'Kale', 'manager2', 'manager2');

-- --------------------------------------------------------

--
-- Table structure for table `seminar`
--

CREATE TABLE `seminar` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seminar`
--

INSERT INTO `seminar` (`id`, `name`) VALUES
(14, 'Tool Automation');

-- --------------------------------------------------------

--
-- Table structure for table `title`
--

CREATE TABLE `title` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `title`
--

INSERT INTO `title` (`id`, `name`) VALUES
(17, 'By JAdhao Group');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminlogin`
--
ALTER TABLE `adminlogin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`empregno`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seminar`
--
ALTER TABLE `seminar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `title`
--
ALTER TABLE `title`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminlogin`
--
ALTER TABLE `adminlogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seminar`
--
ALTER TABLE `seminar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `title`
--
ALTER TABLE `title`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

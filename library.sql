-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2024 at 08:22 AM
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
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `code` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`code`, `title`, `author`, `stock`, `createdAt`, `updatedAt`) VALUES
('HOB-83', 'The Hobbit, or There and Back Again', 'J.R.R. Tolkien', 1, '2024-06-06 01:32:44', '2024-06-06 01:32:44'),
('JK-45', 'Harry Potter', 'J.K Rowling', 1, '2024-06-06 01:32:44', '2024-06-06 01:32:44'),
('NRN-7', 'The Lion, the Witch and the Wardrobe', 'C.S. Lewis', 1, '2024-06-06 01:32:44', '2024-06-06 01:32:44'),
('SHR-1', 'A Study in Scarlet', 'Arthur Conan Doyle', 1, '2024-06-06 01:32:44', '2024-06-06 01:32:44'),
('TW-11', 'Twilight', 'Stephenie Meyer', 1, '2024-06-06 01:32:44', '2024-06-06 01:32:44');

-- --------------------------------------------------------

--
-- Table structure for table `borrows`
--

CREATE TABLE `borrows` (
  `id` int(11) NOT NULL,
  `memberCode` varchar(255) DEFAULT NULL,
  `bookCode` varchar(255) DEFAULT NULL,
  `borrowDate` datetime DEFAULT NULL,
  `returnDate` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`code`, `name`, `createdAt`, `updatedAt`) VALUES
('M001', 'Angga', '2024-06-06 01:32:44', '2024-06-06 01:32:44'),
('M002', 'Ferry', '2024-06-06 01:32:44', '2024-06-06 01:32:44'),
('M003', 'Putri', '2024-06-06 01:32:44', '2024-06-06 01:32:44');

-- --------------------------------------------------------

--
-- Table structure for table `penalties`
--

CREATE TABLE `penalties` (
  `id` int(11) NOT NULL,
  `memberCode` varchar(255) DEFAULT NULL,
  `penaltyEndDate` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `borrows`
--
ALTER TABLE `borrows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `memberCode` (`memberCode`),
  ADD KEY `bookCode` (`bookCode`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `penalties`
--
ALTER TABLE `penalties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `memberCode` (`memberCode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `borrows`
--
ALTER TABLE `borrows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `penalties`
--
ALTER TABLE `penalties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrows`
--
ALTER TABLE `borrows`
  ADD CONSTRAINT `borrows_ibfk_1` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_10` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_11` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_12` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_13` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_14` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_15` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_16` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_17` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_18` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_19` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_2` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_20` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_21` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_22` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_23` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_24` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_25` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_26` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_27` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_28` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_29` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_3` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_30` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_31` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_32` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_33` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_34` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_35` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_36` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_37` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_38` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_39` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_4` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_40` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_41` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_42` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_43` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_44` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_45` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_46` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_47` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_48` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_49` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_5` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_50` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_51` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_52` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_53` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_54` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_6` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_7` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_8` FOREIGN KEY (`bookCode`) REFERENCES `books` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrows_ibfk_9` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penalties`
--
ALTER TABLE `penalties`
  ADD CONSTRAINT `penalties_ibfk_1` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_10` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_11` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_12` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_13` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_14` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_15` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_16` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_17` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_18` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_19` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_2` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_20` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_21` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_22` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_23` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_24` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_25` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_26` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_27` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_3` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_4` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_5` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_6` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_7` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_8` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penalties_ibfk_9` FOREIGN KEY (`memberCode`) REFERENCES `members` (`code`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

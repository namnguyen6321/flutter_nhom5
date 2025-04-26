-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 19, 2025 at 04:05 AM
-- Server version: 8.0.41-0ubuntu0.24.04.1
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chess`
--

-- --------------------------------------------------------

--
-- Table structure for table `audience`
--

CREATE TABLE `audience` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chess_game`
--

CREATE TABLE `chess_game` (
  `id` int NOT NULL,
  `player_white` int DEFAULT NULL,
  `player_black` int DEFAULT NULL,
  `is_playing` tinyint(1) DEFAULT '1',
  `winner` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `game_history`
--

CREATE TABLE `game_history` (
  `id` int NOT NULL,
  `game_id` int DEFAULT NULL,
  `player_id` int DEFAULT NULL,
  `move_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `move`
--

CREATE TABLE `move` (
  `id` int NOT NULL,
  `start` varchar(5) NOT NULL,
  `end` varchar(5) NOT NULL,
  `type` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `move_type`
--

CREATE TABLE `move_type` (
  `id` int NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `elo` int DEFAULT '1200',
  `money` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audience`
--
ALTER TABLE `audience`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `chess_game`
--
ALTER TABLE `chess_game`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_white` (`player_white`),
  ADD KEY `player_black` (`player_black`),
  ADD KEY `winner` (`winner`);

--
-- Indexes for table `game_history`
--
ALTER TABLE `game_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_id` (`game_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `move_id` (`move_id`);

--
-- Indexes for table `move`
--
ALTER TABLE `move`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `move_type`
--
ALTER TABLE `move_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
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
-- AUTO_INCREMENT for table `audience`
--
ALTER TABLE `audience`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chess_game`
--
ALTER TABLE `chess_game`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `game_history`
--
ALTER TABLE `game_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `move`
--
ALTER TABLE `move`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `move_type`
--
ALTER TABLE `move_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audience`
--
ALTER TABLE `audience`
  ADD CONSTRAINT `audience_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `audience_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`);

--
-- Constraints for table `chess_game`
--
ALTER TABLE `chess_game`
  ADD CONSTRAINT `chess_game_ibfk_1` FOREIGN KEY (`player_white`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `chess_game_ibfk_2` FOREIGN KEY (`player_black`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `chess_game_ibfk_3` FOREIGN KEY (`winner`) REFERENCES `user` (`id`);

--
-- Constraints for table `game_history`
--
ALTER TABLE `game_history`
  ADD CONSTRAINT `game_history_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `chess_game` (`id`),
  ADD CONSTRAINT `game_history_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `game_history_ibfk_3` FOREIGN KEY (`move_id`) REFERENCES `move` (`id`);

--
-- Constraints for table `move`
--
ALTER TABLE `move`
  ADD CONSTRAINT `move_ibfk_1` FOREIGN KEY (`type`) REFERENCES `move_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

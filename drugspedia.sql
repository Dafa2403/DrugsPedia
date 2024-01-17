-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2024 at 05:35 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `drugspedia`
--

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `id_drugs` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_time` timestamp(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3),
  `drugs_name` text NOT NULL,
  `subTitle` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`id_drugs`, `id_user`, `created_time`, `drugs_name`, `subTitle`, `deskripsi`, `image`) VALUES
(2, 1, '2023-12-08 16:03:54.605', 'obat 1', 'obat obatan', 'hola hola asd', 'google.ocm'),
(5, 5, '2023-12-03 23:05:54.136', 'obat a', 'sakit kepala', 'untuk meredakan sakit kepala', 'google.ocm'),
(6, 1, '2024-01-05 23:51:00.321', 'obat 6', 'obat obatan 6', 'hola holam2', 'image_1704498660314.png'),
(7, 1, '2024-01-05 23:51:52.162', 'obat 6', 'obat obatan 6', 'hola holam2', 'image_1704498712153.png'),
(8, 1, '2024-01-05 23:52:54.768', 'obat 6', 'obat obatan 6', 'hola holam2', 'image_1704498774760.png'),
(9, 1, '2024-01-06 00:53:04.729', 'obat 6', 'obat obatan 6', 'hola holam2', 'upload\\img\\image_1704502384721.png'),
(10, 1, '2024-01-06 00:55:14.752', 'obat 6', 'obat obatan 6', 'hola holam2', 'upload\\img\\image_1704502514746'),
(11, 1, '2024-01-06 00:58:37.205', 'obat 6', 'obat obatan 6', 'hola holam2', 'upload\\img\\Meme_do_vilager.png-1704502717198'),
(12, 1, '2024-01-06 01:01:56.768', 'obat 6', 'obat obatan 6', 'hola holam2', 'upload\\img\\1704502916763-Meme_do_vilager.png'),
(13, 1, '2024-01-06 01:09:23.884', 'obat 6', 'obat obatan 6', 'hola holam2', '1704503363879-Meme_do_vilager.png'),
(14, 1, '2024-01-06 02:09:46.003', 'obat 6', 'obat obatan 6', 'hola holam2', '1704506985999-Meme_do_vilager.png'),
(15, 1, '2024-01-08 17:38:00.107', 'obat 6', 'obat obatan 6', 'hola holam2', '1704735480028-Meme_do_vilager.png'),
(16, 9, '2024-01-08 17:44:46.104', 'asda', 'asda', 'asd\r\nasd\r\nasda', '1704735886010-Meme_do_vilager.png'),
(17, 9, '2024-01-08 17:45:37.928', '', '', '', '1704735937849-drug pedia.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `created_time` timestamp(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3),
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `imgProfile` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `created_time`, `name`, `username`, `email`, `password`, `token`, `role`, `imgProfile`) VALUES
(1, '2023-08-14 05:53:59.687', '123asdasd', 'test', 'test@test.com', 'testing123', NULL, 1, ''),
(5, '2023-08-14 07:56:33.188', 'tetot', 'tetot', 'tetot@asd.com', 'e76e6d2eada4f03712db36f0b973847e', NULL, 1, ''),
(9, '2024-01-06 02:06:27.293', 'testing123', 'testing123', 'testing123@mail.com', '7f2ababa423061c509f4923dd04b6cf1', NULL, 1, '1704506787279-mercy.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users_token`
--

CREATE TABLE `users_token` (
  `id_access_token` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `access_token` text NOT NULL,
  `ip_address` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_token`
--

INSERT INTO `users_token` (`id_access_token`, `id_user`, `access_token`, `ip_address`) VALUES
(118, 9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF91c2VyIjo5LCJjcmVhdGVkX3RpbWUiOiIyMDI0LTAxLTA2VDAyOjA2OjI3LjI5M1oiLCJuYW1lIjoidGVzdGluZzEyMyIsInVzZXJuYW1lIjoidGVzdGluZzEyMyIsImVtYWlsIjoidGVzdGluZzEyM0BtYWlsLmNvbSIsInBhc3N3b3JkIjoiN2YyYWJhYmE0MjMwNjFjNTA5ZjQ5MjNkZDA0YjZjZjEiLCJ0b2tlbiI6bnVsbCwicm9sZSI6MSwiaW1nUHJvZmlsZSI6IjE3MDQ1MDY3ODcyNzktbWVyY3kuanBnIn1dLCJpYXQiOjE3MDQ3MjUyMTYsImV4cCI6MTcwNDcyODgxNn0.eHaOLtSV8ho-cbKZlNlpjPk6vCJ9sZfN6rXEPvOWQQA', '192.168.56.1'),
(119, 9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF91c2VyIjo5LCJjcmVhdGVkX3RpbWUiOiIyMDI0LTAxLTA2VDAyOjA2OjI3LjI5M1oiLCJuYW1lIjoidGVzdGluZzEyMyIsInVzZXJuYW1lIjoidGVzdGluZzEyMyIsImVtYWlsIjoidGVzdGluZzEyM0BtYWlsLmNvbSIsInBhc3N3b3JkIjoiN2YyYWJhYmE0MjMwNjFjNTA5ZjQ5MjNkZDA0YjZjZjEiLCJ0b2tlbiI6bnVsbCwicm9sZSI6MSwiaW1nUHJvZmlsZSI6IjE3MDQ1MDY3ODcyNzktbWVyY3kuanBnIn1dLCJpYXQiOjE3MDQ3MjU0MjcsImV4cCI6MTcwNDcyOTAyN30.9RdONBoTWsjhtc2RjfaW6nPU6OcqidxJ8PPsR6Ld6oQ', '192.168.56.1'),
(120, 9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF91c2VyIjo5LCJjcmVhdGVkX3RpbWUiOiIyMDI0LTAxLTA2VDAyOjA2OjI3LjI5M1oiLCJuYW1lIjoidGVzdGluZzEyMyIsInVzZXJuYW1lIjoidGVzdGluZzEyMyIsImVtYWlsIjoidGVzdGluZzEyM0BtYWlsLmNvbSIsInBhc3N3b3JkIjoiN2YyYWJhYmE0MjMwNjFjNTA5ZjQ5MjNkZDA0YjZjZjEiLCJ0b2tlbiI6bnVsbCwicm9sZSI6MSwiaW1nUHJvZmlsZSI6IjE3MDQ1MDY3ODcyNzktbWVyY3kuanBnIn1dLCJpYXQiOjE3MDQ3MjkxMTMsImV4cCI6MTcwNDczMjcxM30.rHIC4CNU9-Q4s7QpvkhMDAJEAmSztkKg5T9lvYLqZ5k', '192.168.56.1'),
(121, 9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF91c2VyIjo5LCJjcmVhdGVkX3RpbWUiOiIyMDI0LTAxLTA2VDAyOjA2OjI3LjI5M1oiLCJuYW1lIjoidGVzdGluZzEyMyIsInVzZXJuYW1lIjoidGVzdGluZzEyMyIsImVtYWlsIjoidGVzdGluZzEyM0BtYWlsLmNvbSIsInBhc3N3b3JkIjoiN2YyYWJhYmE0MjMwNjFjNTA5ZjQ5MjNkZDA0YjZjZjEiLCJ0b2tlbiI6bnVsbCwicm9sZSI6MSwiaW1nUHJvZmlsZSI6IjE3MDQ1MDY3ODcyNzktbWVyY3kuanBnIn1dLCJpYXQiOjE3MDQ3MzQ4NjksImV4cCI6MTcwNDczODQ2OX0.fBEfSk0j1G5B94jvhjzJtjMdnT7doOglPPDPJUEPSYQ', '192.168.56.1'),
(122, 9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF91c2VyIjo5LCJjcmVhdGVkX3RpbWUiOiIyMDI0LTAxLTA2VDAyOjA2OjI3LjI5M1oiLCJuYW1lIjoidGVzdGluZzEyMyIsInVzZXJuYW1lIjoidGVzdGluZzEyMyIsImVtYWlsIjoidGVzdGluZzEyM0BtYWlsLmNvbSIsInBhc3N3b3JkIjoiN2YyYWJhYmE0MjMwNjFjNTA5ZjQ5MjNkZDA0YjZjZjEiLCJ0b2tlbiI6bnVsbCwicm9sZSI6MSwiaW1nUHJvZmlsZSI6IjE3MDQ1MDY3ODcyNzktbWVyY3kuanBnIn1dLCJpYXQiOjE3MDQ3MzQ5NDQsImV4cCI6MTcwNDczODU0NH0.UtcCxlb_qel6nsZbXKg_Q9rBvueJtTM_uK9Vo8OEPu4', '192.168.56.1'),
(123, 9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF91c2VyIjo5LCJjcmVhdGVkX3RpbWUiOiIyMDI0LTAxLTA2VDAyOjA2OjI3LjI5M1oiLCJuYW1lIjoidGVzdGluZzEyMyIsInVzZXJuYW1lIjoidGVzdGluZzEyMyIsImVtYWlsIjoidGVzdGluZzEyM0BtYWlsLmNvbSIsInBhc3N3b3JkIjoiN2YyYWJhYmE0MjMwNjFjNTA5ZjQ5MjNkZDA0YjZjZjEiLCJ0b2tlbiI6bnVsbCwicm9sZSI6MSwiaW1nUHJvZmlsZSI6IjE3MDQ1MDY3ODcyNzktbWVyY3kuanBnIn1dLCJpYXQiOjE3MDQ3MzUzNTAsImV4cCI6MTcwNDczODk1MH0.eU1ZqjC1yQZBg2rHDNNGX3IF1Ni6GWBpvlQXuNsL8Bw', '192.168.56.1'),
(124, 9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF91c2VyIjo5LCJjcmVhdGVkX3RpbWUiOiIyMDI0LTAxLTA2VDAyOjA2OjI3LjI5M1oiLCJuYW1lIjoidGVzdGluZzEyMyIsInVzZXJuYW1lIjoidGVzdGluZzEyMyIsImVtYWlsIjoidGVzdGluZzEyM0BtYWlsLmNvbSIsInBhc3N3b3JkIjoiN2YyYWJhYmE0MjMwNjFjNTA5ZjQ5MjNkZDA0YjZjZjEiLCJ0b2tlbiI6bnVsbCwicm9sZSI6MSwiaW1nUHJvZmlsZSI6IjE3MDQ1MDY3ODcyNzktbWVyY3kuanBnIn1dLCJpYXQiOjE3MDQ3Mzc2NzgsImV4cCI6MTcwNDc0MTI3OH0.JmNjqkR90EF373d9c9PHEDIYmKG7A8SNyhMsAak0GME', '192.168.56.1');

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('0481f914-02ae-4768-8784-d82fc17d59c6', '0df15431ea63983c6ed883e2a6db09aa408b9be2f5159efbac7b3264ad12e8e0', '2023-08-14 03:38:11.411', '20230811060513_create_table_drugs', NULL, NULL, '2023-08-14 03:38:11.388', 1),
('9bd95db2-d12b-4031-baf2-59354515d10a', 'fe5932b003301d9e70bbed18ed22a2884f189b5efdf8140ff72f1b42c58d12e1', '2023-08-14 03:38:11.362', '20230811060216_create_table_drugs', NULL, NULL, '2023-08-14 03:38:11.309', 1),
('d9fe9b2c-5e28-409d-b2c7-064b13c9f65e', 'e8a5085b00c7e75932e9ab0e2fcbe641fab0383dc83cdc962ce6e44fb7969707', '2023-08-14 03:38:11.308', '20230811054846_create_table_users', NULL, NULL, '2023-08-14 03:38:11.292', 1),
('dcd5f092-c9b2-4395-a5f2-752894a74e12', '9758f009f78c3e35510931f2605107900e13554d4d8364d79d59a24b49fb2b08', '2023-08-14 03:38:11.387', '20230811060332_create_table_drugs', NULL, NULL, '2023-08-14 03:38:11.363', 1),
('e39230a8-5a1f-400e-893f-36b0c65ad3ca', '0df15431ea63983c6ed883e2a6db09aa408b9be2f5159efbac7b3264ad12e8e0', '2023-08-14 03:38:32.945', '20230814033832_add', NULL, NULL, '2023-08-14 03:38:32.914', 1),
('ea91b567-751e-460e-8809-fe62eac86e2a', 'd0475a26b8ffb5cede7977ef0e4a01142ff08e2f65887cda23784d6d08ac1649', '2023-08-14 03:38:11.291', '20230811054657_create_table_users', NULL, NULL, '2023-08-14 03:38:11.268', 1),
('f806c077-7528-4caa-b7cf-242fdd44db63', '0df15431ea63983c6ed883e2a6db09aa408b9be2f5159efbac7b3264ad12e8e0', '2023-08-14 03:38:29.690', '20230814033816_add', NULL, NULL, '2023-08-14 03:38:29.658', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`id_drugs`),
  ADD KEY `drugs_id_user_fkey` (`id_user`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `users_username_key` (`username`),
  ADD UNIQUE KEY `users_email_key` (`email`);

--
-- Indexes for table `users_token`
--
ALTER TABLE `users_token`
  ADD PRIMARY KEY (`id_access_token`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `id_drugs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users_token`
--
ALTER TABLE `users_token`
  MODIFY `id_access_token` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `drugs`
--
ALTER TABLE `drugs`
  ADD CONSTRAINT `drugs_id_user_fkey` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE;

--
-- Constraints for table `users_token`
--
ALTER TABLE `users_token`
  ADD CONSTRAINT `users_token_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

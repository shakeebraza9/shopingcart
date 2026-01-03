-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2026 at 09:45 AM
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
-- Database: `cart`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `image_id` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `is_featured` int(11) NOT NULL DEFAULT 0,
  `sort` int(11) DEFAULT NULL,
  `is_enable` int(11) NOT NULL DEFAULT 1,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `details`, `image_id`, `parent_id`, `level`, `is_featured`, `sort`, `is_enable`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`) VALUES
(45, 'Watches', 'watches', 'Watches', 'filemanager/683c646a74480.jpeg', NULL, 1, 1, 4, 1, 'Watches', 'Watches', 'Watches', '2025-06-01 19:32:24', '2025-06-01 19:32:43'),
(44, 'Health & Beauty', 'health-beauty', 'Health & Beauty', 'filemanager/683c64084f063.jpeg', NULL, 1, 1, 3, 1, 'Health & Beauty', 'Health & Beauty', 'Health & Beauty', '2025-06-01 19:30:41', '2025-06-01 19:30:59'),
(43, 'Gift sets', 'gift-sets', 'Gift sets', 'filemanager/683c639148ada.jpeg', NULL, 1, 1, 2, 1, 'Gift sets', 'Gift sets', 'Gift sets', '2025-06-01 19:28:58', '2025-06-01 19:29:23'),
(42, 'Perfumes', 'perfumes', 'Perfumes', 'filemanager/683c63121df3f.jpeg', NULL, 1, 1, 1, 1, 'Perfumes', 'Perfumes', 'Perfumes', '2025-06-01 19:26:42', '2025-06-01 19:27:32');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `filemanager`
--

CREATE TABLE `filemanager` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `path` text DEFAULT NULL,
  `filename` text NOT NULL,
  `size` double DEFAULT NULL,
  `extension` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_enable` int(11) NOT NULL DEFAULT 1,
  `grouping` text NOT NULL DEFAULT 'others'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `filemanager`
--

INSERT INTO `filemanager` (`id`, `title`, `description`, `path`, `filename`, `size`, `extension`, `type`, `created_by`, `created_at`, `updated_at`, `is_enable`, `grouping`) VALUES
(28, 'logo', 'logo', 'filemanager/684b2226c64cb.png', 'logo.png', 1529662, 'png', 'image/png', NULL, '2024-09-25 16:48:48', '2025-06-12 18:53:26', 1, 'others'),
(48, 'perfumes', 'perfumes', 'filemanager/6831591a38850.png', '6831591a38850.png', 922616, 'png', 'image/png', NULL, '2025-05-24 10:28:58', '2025-05-24 10:28:58', 1, 'others'),
(229, 'ss', 'ss', 'filemanager/684d315fb9067.png', '684d315fb9067.png', 1529662, 'png', 'image/png', NULL, '2025-06-14 08:22:55', '2025-06-14 08:22:55', 1, 'others'),
(50, 'banner 2', 'banner 2', 'filemanager/683cab6437ebe.png', '683c4f3aac067.avif', 141685, 'png', 'image/png', NULL, '2025-06-01 18:01:46', '2025-06-01 19:35:00', 1, 'banner'),
(51, 'banner3', 'banner3', 'filemanager/683cab80b1cd2.jpg', '683c4f50b3f6d.avif', 164261, 'jpg', 'image/jpeg', NULL, '2025-06-01 18:02:08', '2025-06-01 19:35:28', 1, 'banner'),
(52, 'icon webmenu', 'icon webmenu', 'filemanager/683c608ab0706.png', '683c608ab0706.png', 81214, 'png', 'image/png', NULL, '2025-06-01 19:15:38', '2025-06-01 19:15:38', 1, 'favicon'),
(53, 'category perfumes', 'category perfumes', 'filemanager/683c63121df3f.jpeg', '683c63121df3f.jpeg', 197756, 'jpeg', 'image/jpeg', NULL, '2025-06-01 19:26:26', '2025-06-01 19:26:26', 1, 'perfumes'),
(54, 'Gift sets', 'Gift sets', 'filemanager/683c639148ada.jpeg', '683c639148ada.jpeg', 239433, 'jpeg', 'image/jpeg', NULL, '2025-06-01 19:28:33', '2025-06-01 19:28:33', 1, 'Gift sets'),
(55, 'Health & Beauty', 'Health & Beauty', 'filemanager/683c64084f063.jpeg', '683c64084f063.jpeg', 205767, 'jpeg', 'image/jpeg', NULL, '2025-06-01 19:30:32', '2025-06-01 19:30:32', 1, 'Health & Beauty'),
(56, 'Watchescat', 'Watches', 'filemanager/683c646a74480.jpeg', '683c646a74480.jpeg', 292523, 'jpeg', 'image/jpeg', NULL, '2025-06-01 19:32:10', '2025-06-01 19:32:10', 1, 'Watches'),
(57, 'AJMAL front', 'AJMAL front', 'filemanager/683c653cbdd73.jpeg', '683c653cbdd73.jpeg', 228005, 'jpeg', 'image/jpeg', NULL, '2025-06-01 19:35:40', '2025-06-01 19:35:40', 1, 'AJMAL'),
(58, 'AJMAL back', 'AJMAL back', 'filemanager/683c65502614a.jpeg', '683c65502614a.jpeg', 223382, 'jpeg', 'image/jpeg', NULL, '2025-06-01 19:36:00', '2025-06-01 19:36:00', 1, 'AJMAL'),
(59, 'COACH back', 'COACH back', 'filemanager/683c6bf3a06ae.jpeg', '683c6bf3a06ae.jpeg', 225658, 'jpeg', 'image/jpeg', NULL, '2025-06-01 20:04:19', '2025-06-01 20:04:19', 1, 'COACH'),
(60, 'COACH fornt', 'COACH', 'filemanager/683c6bfef3463.jpeg', '683c6bfef3463.jpeg', 221881, 'jpeg', 'image/jpeg', NULL, '2025-06-01 20:04:30', '2025-06-01 20:04:30', 1, 'COACH'),
(61, 'Kenneth Cole front', 'Kenneth Cole', 'filemanager/683c6d1f0a0e9.jpeg', '683c6d1f0a0e9.jpeg', 188381, 'jpeg', 'image/jpeg', NULL, '2025-06-01 20:09:19', '2025-06-01 20:09:19', 1, 'Kenneth Cole'),
(62, 'Kenneth Cole back', 'Kenneth Cole', 'filemanager/683c6d5aa0a17.jpeg', '683c6d31f4122.jpeg', 213254, 'jpeg', 'image/jpeg', NULL, '2025-06-01 20:09:38', '2025-06-01 20:10:18', 1, 'Kenneth Cole'),
(63, 'VICTORINOX', 'VICTORINOX', 'filemanager/68480550f0ae6.png', '68480550f0ae6.png', 35465, 'png', 'image/png', NULL, '2025-06-10 10:13:36', '2025-06-10 10:13:36', 1, 'others'),
(64, 'Trussardi', 'Trussardi', 'filemanager/684805602c5df.png', '684805602c5df.png', 26847, 'png', 'image/png', NULL, '2025-06-10 10:13:52', '2025-06-10 10:13:52', 1, 'others'),
(65, 'MONTALE', 'MONTALE', 'filemanager/6848056d5e5ba.png', '6848056d5e5ba.png', 26873, 'png', 'image/png', NULL, '2025-06-10 10:14:05', '2025-06-10 10:14:05', 1, 'others'),
(66, 'Mont Blanc', 'Mont Blanc', 'filemanager/6848057d977f0.png', '6848057d977f0.png', 33812, 'png', 'image/png', NULL, '2025-06-10 10:14:21', '2025-06-10 10:14:21', 1, 'others'),
(67, 'MANCERA', 'MANCERA', 'filemanager/684805893f08b.png', '684805893f08b.png', 31347, 'png', 'image/png', NULL, '2025-06-10 10:14:33', '2025-06-10 10:14:33', 1, 'others'),
(68, 'Kenneth Cole', 'Kenneth Cole', 'filemanager/6848059d6fcbb.png', '6848059d6fcbb.png', 26456, 'png', 'image/png', NULL, '2025-06-10 10:14:53', '2025-06-10 10:14:53', 1, 'others'),
(69, 'Juicy Couture', 'Juicy Couture', 'filemanager/684805b5ef40b.png', '684805b5ef40b.png', 28295, 'png', 'image/png', NULL, '2025-06-10 10:15:17', '2025-06-10 10:15:17', 1, 'others'),
(70, 'John Varvatos', 'John Varvatos', 'filemanager/684805c11c433.png', '684805c11c433.png', 22809, 'png', 'image/png', NULL, '2025-06-10 10:15:29', '2025-06-10 10:15:29', 1, 'others'),
(71, 'Jimmy Choo', 'Jimmy Choo', 'filemanager/684805d0215d8.png', '684805d0215d8.png', 31375, 'png', 'image/png', NULL, '2025-06-10 10:15:44', '2025-06-10 10:15:44', 1, 'others'),
(72, 'Elizabeth Arden', 'Elizabeth Arden', 'filemanager/684805db1f72d.png', '684805db1f72d.png', 27327, 'png', 'image/png', NULL, '2025-06-10 10:15:55', '2025-06-10 10:15:55', 1, 'others'),
(73, 'COACH logo', 'COACH', 'filemanager/684805eab6009.png', '684805eab6009.png', 40154, 'png', 'image/png', NULL, '2025-06-10 10:16:10', '2025-06-10 10:16:10', 1, 'others'),
(74, 'ajmal logo', 'ajmal logo', 'filemanager/684805f6c932d.png', '684805f6c932d.png', 54978, 'png', 'image/png', NULL, '2025-06-10 10:16:22', '2025-06-10 10:16:22', 1, 'others'),
(75, '1001 NIGHTS EDP', '1001 NIGHTS EDP', 'filemanager/68481c3624d1c.jpg', '68481c3624d1c.jpg', 248694, 'jpg', 'image/jpeg', NULL, '2025-06-10 11:51:18', '2025-06-10 11:51:18', 1, 'others'),
(76, '1001 NIGHTS EDP3', '1001 NIGHTS EDP3', 'filemanager/68481c5f7a1a1.jpg', '68481c5f7a1a1.jpg', 131381, 'jpg', 'image/jpeg', NULL, '2025-06-10 11:51:59', '2025-06-10 11:51:59', 1, 'others'),
(77, '1001 NIGHTS EDP2', '1001 NIGHTS EDP2', 'filemanager/68481c689bde2.jpg', '68481c689bde2.jpg', 197471, 'jpg', 'image/jpeg', NULL, '2025-06-10 11:52:08', '2025-06-10 11:52:08', 1, 'others'),
(78, 'AMBER MUSC', 'AMBER MUSC', 'filemanager/68481d142a1e0.jpg', '68481d142a1e0.jpg', 171083, 'jpg', 'image/jpeg', NULL, '2025-06-10 11:55:00', '2025-06-10 11:55:00', 1, 'others'),
(79, 'AMBER MUSC2', 'AMBER MUSC2', 'filemanager/68481d1fb3fc8.jpg', '68481d1fb3fc8.jpg', 78180, 'jpg', 'image/jpeg', NULL, '2025-06-10 11:55:11', '2025-06-10 11:55:11', 1, 'others'),
(80, 'AMBER MUSC3', 'AMBER MUSC3', 'filemanager/68481d2a5bf7b.jpg', '68481d2a5bf7b.jpg', 137854, 'jpg', 'image/jpeg', NULL, '2025-06-10 11:55:22', '2025-06-10 11:55:22', 1, 'others'),
(81, 'AMBER WOOD', 'AMBER WOOD', 'filemanager/68481dbc2c378.jpg', '68481dbc2c378.jpg', 274961, 'jpg', 'image/jpeg', NULL, '2025-06-10 11:57:48', '2025-06-10 11:57:48', 1, 'others'),
(82, 'AMBER WOOD2', 'AMBER WOOD2', 'filemanager/68481dc4b7122.jpg', '68481dc4b7122.jpg', 100052, 'jpg', 'image/jpeg', NULL, '2025-06-10 11:57:56', '2025-06-10 11:57:56', 1, 'others'),
(83, 'AMBER WOOD3', 'AMBER WOOD3', 'filemanager/68481dce4d797.jpg', '68481dce4d797.jpg', 227108, 'jpg', 'image/jpeg', NULL, '2025-06-10 11:58:06', '2025-06-10 11:58:06', 1, 'others'),
(84, 'ARISTOCRAT HER', 'ARISTOCRAT HER', 'filemanager/684820d93bc30.jpg', '684820d93bc30.jpg', 268115, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:11:05', '2025-06-10 12:11:05', 1, 'others'),
(85, 'ARISTOCRAT HER2', 'ARISTOCRAT HER2', 'filemanager/684820e8b7170.jpg', '684820e8b7170.jpg', 140342, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:11:20', '2025-06-10 12:11:20', 1, 'others'),
(86, 'ARISTOCRAT HER3', 'ARISTOCRAT HER3', 'filemanager/684820f50dab8.jpg', '684820f50dab8.jpg', 158823, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:11:33', '2025-06-10 12:11:33', 1, 'others'),
(87, 'ARISTOCRAT HIM', 'ARISTOCRAT HIM', 'filemanager/684822f162fb0.jpg', '684822f162fb0.jpg', 242908, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:20:01', '2025-06-10 12:20:01', 1, 'others'),
(88, 'ARISTOCRAT HIM', 'ARISTOCRAT HIM', 'filemanager/684822f16349f.jpg', '684822f16349f.jpg', 207206, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:20:01', '2025-06-10 12:20:01', 1, 'others'),
(89, 'ARISTOCRAT HIM', 'ARISTOCRAT HIM', 'filemanager/684822f163872.jpg', '684822f163872.jpg', 408084, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:20:01', '2025-06-10 12:20:01', 1, 'others'),
(90, 'ARISTOCRAT PLATINUM', 'ARISTOCRAT PLATINUM', 'filemanager/68482374387c3.jpg', '68482374387c3.jpg', 98133, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:22:12', '2025-06-10 12:22:12', 1, 'others'),
(91, 'ARISTOCRAT PLATINUM', 'ARISTOCRAT PLATINUM', 'filemanager/6848237438ca8.jpg', '6848237438ca8.jpg', 148387, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:22:12', '2025-06-10 12:22:12', 1, 'others'),
(92, 'ARISTOCRAT PLATINUM', 'ARISTOCRAT PLATINUM', 'filemanager/68482374390ca.jpg', '68482374390ca.jpg', 124125, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:22:12', '2025-06-10 12:22:12', 1, 'others'),
(93, 'AURUM', 'AURUM', 'filemanager/684823ea0c4e2.jpg', '684823ea0c4e2.jpg', 127148, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:24:10', '2025-06-10 12:24:10', 1, 'others'),
(94, 'AURUM', 'AURUM', 'filemanager/684823ea0cac9.jpg', '684823ea0cac9.jpg', 338745, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:24:10', '2025-06-10 12:24:10', 1, 'others'),
(95, 'AURUM', 'AURUM', 'filemanager/684823ea0d0dc.jpg', '684823ea0d0dc.jpg', 412924, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:24:10', '2025-06-10 12:24:10', 1, 'others'),
(96, 'AURUM MINIATURE', 'AURUM MINIATURE', 'filemanager/6848245f4d865.jpg', '6848245f4d865.jpg', 73203, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:26:07', '2025-06-10 12:26:07', 1, 'others'),
(97, 'AURUM MINIATURE', 'AURUM MINIATURE', 'filemanager/6848245f4dd17.jpg', '6848245f4dd17.jpg', 132329, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:26:07', '2025-06-10 12:26:07', 1, 'others'),
(98, 'AURUM MINIATURE', 'AURUM MINIATURE', 'filemanager/6848245f4e111.jpg', '6848245f4e111.jpg', 141570, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:26:07', '2025-06-10 12:26:07', 1, 'others'),
(99, 'AURUM SUMMER', 'AURUM SUMMER', 'filemanager/684824cd0a41f.jpg', '684824cd0a41f.jpg', 75288, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:27:57', '2025-06-10 12:27:57', 1, 'others'),
(100, 'AURUM SUMMER', 'AURUM SUMMER', 'filemanager/684824cd0a84b.jpg', '684824cd0a84b.jpg', 122105, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:27:57', '2025-06-10 12:27:57', 1, 'others'),
(101, 'AURUM SUMMER', 'AURUM SUMMER', 'filemanager/684824cd0ac1a.jpg', '684824cd0ac1a.jpg', 98554, 'jpg', 'image/jpeg', NULL, '2025-06-10 12:27:57', '2025-06-10 12:27:57', 1, 'others'),
(107, 'dd', 'dd', 'filemanager/68495cd959b1d.jpg', '68495cd959b1d.jpg', 9604, 'jpg', 'image/jpeg', NULL, '2025-06-11 10:39:21', '2025-06-11 10:39:21', 1, 'others'),
(104, 'logonee', 'shakeeb', 'filemanager/684950ae0c22f.jpg', '684950ae0c22f.jpg', 9604, 'jpg', 'image/jpeg', NULL, '2025-06-11 09:47:26', '2025-06-11 10:21:54', 1, 'others'),
(108, 'test', 'test', 'filemanager/6849690ab3ed1.png', '6849690ab3ed1.png', 1529662, 'png', 'image/png', NULL, '2025-06-11 11:31:22', '2025-06-11 11:31:22', 1, 'others'),
(110, 'BLU BY AJMAL', 'BLU BY AJMAL', 'filemanager/68497fd872030.jpg', '68497fd872030.jpg', 299782, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:08:40', '2025-06-11 13:08:40', 1, 'BLU BY AJMAL'),
(111, 'BLU BY AJMAL', 'BLU BY AJMAL', 'filemanager/68497fd87251c.jpg', '68497fd87251c.jpg', 142786, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:08:40', '2025-06-11 13:08:40', 1, 'BLU BY AJMAL'),
(112, 'BLU BY AJMAL', 'BLU BY AJMAL', 'filemanager/68497fd8728a4.jpg', '68497fd8728a4.jpg', 223095, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:08:40', '2025-06-11 13:08:40', 1, 'BLU BY AJMAL'),
(113, 'BLU MINIATURE', 'BLU MINIATURE', 'filemanager/68498036971e7.jpg', '68498036971e7.jpg', 71002, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:10:14', '2025-06-11 13:10:14', 1, 'BLU MINIATURE'),
(114, 'BLU MINIATURE', 'BLU MINIATURE', 'filemanager/68498036975f4.jpg', '68498036975f4.jpg', 129670, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:10:14', '2025-06-11 13:10:14', 1, 'BLU MINIATURE'),
(115, 'BLU MINIATURE', 'BLU MINIATURE', 'filemanager/6849803697949.jpg', '6849803697949.jpg', 125136, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:10:14', '2025-06-11 13:10:14', 1, 'BLU MINIATURE'),
(116, '6293708000425', '6293708000425', 'filemanager/68498097bea51.jpg', '68498097bea51.jpg', 83558, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:11:51', '2025-06-11 13:11:51', 1, 'others'),
(117, '6293708000425-1', '6293708000425-1', 'filemanager/68498097bee7a.jpg', '68498097bee7a.jpg', 54189, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:11:51', '2025-06-11 13:11:51', 1, 'others'),
(118, '6293708000425-2', '6293708000425-2', 'filemanager/68498097bf1cd.jpg', '68498097bf1cd.jpg', 72641, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:11:51', '2025-06-11 13:11:51', 1, 'others'),
(119, 'CARBON', 'CARBON', 'filemanager/684980b024caa.jpg', '684980b024caa.jpg', 83558, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:12:16', '2025-06-11 13:12:16', 1, 'others'),
(120, 'CARBON', 'CARBON', 'filemanager/684980b02508a.jpg', '684980b02508a.jpg', 54189, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:12:16', '2025-06-11 13:12:16', 1, 'others'),
(121, 'CARBON', 'CARBON', 'filemanager/684980b0253b0.jpg', '684980b0253b0.jpg', 72641, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:12:16', '2025-06-11 13:12:16', 1, 'others'),
(122, 'CASHMERE MUSC', 'CASHMERE MUSC', 'filemanager/684981008b5bd.jpg', '684981008b5bd.jpg', 49343, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:13:36', '2025-06-11 13:13:36', 1, 'others'),
(123, 'CASHMERE MUSC', 'CASHMERE MUSC', 'filemanager/684981008bb13.jpg', '684981008bb13.jpg', 64028, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:13:36', '2025-06-11 13:13:36', 1, 'others'),
(124, 'CASHMERE MUSC', 'CASHMERE MUSC', 'filemanager/684981008bf4e.jpg', '684981008bf4e.jpg', 49354, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:13:36', '2025-06-11 13:13:36', 1, 'others'),
(125, 'CASHMERE MUSC', 'CASHMERE MUSC', 'filemanager/684981008c256.jpg', '684981008c256.jpg', 104776, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:13:36', '2025-06-11 13:13:36', 1, 'others'),
(126, 'CASHMERE MUSC', 'CASHMERE MUSC', 'filemanager/684981008c574.jpg', '684981008c574.jpg', 134335, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:13:36', '2025-06-11 13:13:36', 1, 'others'),
(127, 'CHIVALRY', 'CHIVALRY', 'filemanager/68498151babf5.jpg', '68498151babf5.jpg', 74471, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:14:57', '2025-06-11 13:14:57', 1, 'CHIVALRY'),
(128, 'CHIVALRY', 'CHIVALRY', 'filemanager/68498151bb095.jpg', '68498151bb095.jpg', 178502, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:14:57', '2025-06-11 13:14:57', 1, 'CHIVALRY'),
(129, 'CHIVALRY', 'CHIVALRY', 'filemanager/68498151bb47c.jpg', '68498151bb47c.jpg', 182036, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:14:57', '2025-06-11 13:14:57', 1, 'CHIVALRY'),
(130, 'CUIR MUSC', 'CUIR MUSC', 'filemanager/6849819d2b58e.jpg', '6849819d2b58e.jpg', 69011, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:16:13', '2025-06-11 13:16:13', 1, 'CUIR MUSC'),
(131, 'CUIR MUSC', 'CUIR MUSC', 'filemanager/6849819d2b956.jpg', '6849819d2b956.jpg', 76611, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:16:13', '2025-06-11 13:16:13', 1, 'CUIR MUSC'),
(132, 'CUIR MUSC', 'CUIR MUSC', 'filemanager/6849819d2bc5c.jpg', '6849819d2bc5c.jpg', 63112, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:16:13', '2025-06-11 13:16:13', 1, 'CUIR MUSC'),
(133, 'DANAT AL DUNIYA', 'DANAT AL DUNIYA', 'filemanager/684981fc75c45.jpg', '684981fc75c45.jpg', 57961, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:17:48', '2025-06-11 13:17:48', 1, 'DANAT AL DUNIYA'),
(134, 'DANAT AL DUNIYA', 'DANAT AL DUNIYA', 'filemanager/684981fc760d7.jpg', '684981fc760d7.jpg', 110182, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:17:48', '2025-06-11 13:17:48', 1, 'DANAT AL DUNIYA'),
(135, 'DANAT AL DUNIYA', 'DANAT AL DUNIYA', 'filemanager/684981fc764b9.jpg', '684981fc764b9.jpg', 108838, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:17:48', '2025-06-11 13:17:48', 1, 'DANAT AL DUNIYA'),
(136, 'ELIXIR INTENSE', 'ELIXIR INTENSE', 'filemanager/68498298b8109.jpg', '68498298b8109.jpg', 63090, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:20:24', '2025-06-11 13:20:24', 1, 'ELIXIR INTENSE'),
(137, 'ELIXIR INTENSE', 'ELIXIR INTENSE', 'filemanager/68498298b8673.jpg', '68498298b8673.jpg', 67807, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:20:24', '2025-06-11 13:20:24', 1, 'ELIXIR INTENSE'),
(138, 'ELIXIR INTENSE', 'ELIXIR INTENSE', 'filemanager/68498298b8a3f.jpg', '68498298b8a3f.jpg', 63064, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:20:24', '2025-06-11 13:20:24', 1, 'ELIXIR INTENSE'),
(139, 'ELIXIR PRECIOUS', 'ELIXIR PRECIOUS', 'filemanager/684982f3f1aee.jpg', '684982f3f1aee.jpg', 65667, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:21:55', '2025-06-11 13:21:55', 1, 'others'),
(140, 'ELIXIR PRECIOUS', 'ELIXIR PRECIOUS', 'filemanager/684982f3f1f04.jpg', '684982f3f1f04.jpg', 68252, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:21:55', '2025-06-11 13:21:55', 1, 'others'),
(141, 'ELIXIR PRECIOUS', 'ELIXIR PRECIOUS', 'filemanager/684982f3f2226.jpg', '684982f3f2226.jpg', 63688, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:21:55', '2025-06-11 13:21:55', 1, 'others'),
(142, 'ELIXIR SUAVE', 'ELIXIR SUAVE', 'filemanager/684983cb547b7.jpg', '684983cb547b7.jpg', 59766, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:25:31', '2025-06-11 13:25:31', 1, 'others'),
(143, 'ELIXIR SUAVE', 'ELIXIR SUAVE', 'filemanager/684983cb54bbe.jpg', '684983cb54bbe.jpg', 67410, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:25:31', '2025-06-11 13:25:31', 1, 'others'),
(144, 'ELIXIR SUAVE', 'ELIXIR SUAVE', 'filemanager/684983cb54fdb.jpg', '684983cb54fdb.jpg', 62205, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:25:31', '2025-06-11 13:25:31', 1, 'others'),
(145, 'EVOKE HIM', 'EVOKE HIM', 'filemanager/6849847522f4f.jpg', '6849847522f4f.jpg', 65876, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:28:21', '2025-06-11 13:28:21', 1, 'EVOKE HIM'),
(146, 'EVOKE HIM', 'EVOKE HIM', 'filemanager/68498475235bb.jpg', '68498475235bb.jpg', 155550, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:28:21', '2025-06-11 13:28:21', 1, 'EVOKE HIM'),
(147, 'EVOKE HIM', 'EVOKE HIM', 'filemanager/6849847523985.jpg', '6849847523985.jpg', 166362, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:28:21', '2025-06-11 13:28:21', 1, 'EVOKE HIM'),
(148, 'GOLD MAN', 'GOLD MAN', 'filemanager/684984ba46a9e.jpg', '684984ba46a9e.jpg', 72241, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:29:30', '2025-06-11 13:29:30', 1, 'GOLD MAN'),
(149, 'GOLD MAN', 'GOLD MAN', 'filemanager/684984ba46e78.jpg', '684984ba46e78.jpg', 170220, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:29:30', '2025-06-11 13:29:30', 1, 'GOLD MAN'),
(150, 'GOLD MAN', 'GOLD MAN', 'filemanager/684984ba471e0.jpg', '684984ba471e0.jpg', 183227, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:29:30', '2025-06-11 13:29:30', 1, 'GOLD MAN'),
(151, 'GRAY', 'GRAY', 'filemanager/684984fe0d8e4.jpg', '684984fe0d8e4.jpg', 57842, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:30:38', '2025-06-11 13:30:38', 1, 'others'),
(152, 'GRAY', 'GRAY', 'filemanager/684984fe0dd33.jpg', '684984fe0dd33.jpg', 78806, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:30:38', '2025-06-11 13:30:38', 1, 'others'),
(153, 'GRAY', 'GRAY', 'filemanager/684984fe0e0e8.jpg', '684984fe0e0e8.jpg', 68304, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:30:38', '2025-06-11 13:30:38', 1, 'others'),
(154, 'HATKORA WOOD', 'HATKORA WOOD', 'filemanager/6849853f1702f.jpg', '6849853f1702f.jpg', 54595, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:31:43', '2025-06-11 13:31:43', 1, 'others'),
(155, 'HATKORA WOOD', 'HATKORA WOOD', 'filemanager/6849853f17472.jpg', '6849853f17472.jpg', 97949, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:31:43', '2025-06-11 13:31:43', 1, 'others'),
(156, 'HATKORA WOOD', 'HATKORA WOOD', 'filemanager/6849853f177b7.jpg', '6849853f177b7.jpg', 102720, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:31:43', '2025-06-11 13:31:43', 1, 'others'),
(157, 'INCENSE WOOD', 'INCENSE WOOD', 'filemanager/6849863f42557.jpg', '6849863f42557.jpg', 52337, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:35:59', '2025-06-11 13:35:59', 1, 'INCENSE WOOD'),
(158, 'INCENSE WOOD', 'INCENSE WOOD', 'filemanager/6849863f42a73.jpg', '6849863f42a73.jpg', 67084, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:35:59', '2025-06-11 13:35:59', 1, 'INCENSE WOOD'),
(159, 'INCENSE WOOD', 'INCENSE WOOD', 'filemanager/6849863f42d49.jpg', '6849863f42d49.jpg', 61262, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:35:59', '2025-06-11 13:35:59', 1, 'INCENSE WOOD'),
(160, 'KURO', 'KURO', 'filemanager/6849868ebd833.jpg', '6849868ebd833.jpg', 64214, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:37:18', '2025-06-11 13:37:18', 1, 'KURO'),
(161, 'KURO', 'KURO', 'filemanager/6849868ebdc61.jpg', '6849868ebdc61.jpg', 191002, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:37:18', '2025-06-11 13:37:18', 1, 'KURO'),
(162, 'KURO', 'KURO', 'filemanager/6849868ebe096.jpg', '6849868ebe096.jpg', 153675, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:37:18', '2025-06-11 13:37:18', 1, 'KURO'),
(163, 'MIZYAAN', 'MIZYAAN', 'filemanager/684986cd7f203.jpg', '684986cd7f203.jpg', 144257, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:38:21', '2025-06-11 13:38:21', 1, 'MIZYAAN'),
(164, 'MIZYAAN', 'MIZYAAN', 'filemanager/684986cd7f67f.jpg', '684986cd7f67f.jpg', 268898, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:38:21', '2025-06-11 13:38:21', 1, 'MIZYAAN'),
(165, 'MIZYAAN', 'MIZYAAN', 'filemanager/684986cd7fa73.jpg', '684986cd7fa73.jpg', 275980, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:38:21', '2025-06-11 13:38:21', 1, 'MIZYAAN'),
(166, 'MUSK KHAS', 'MUSK KHAS', 'filemanager/684987487b22b.jpg', '684987487b22b.jpg', 100052, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:40:24', '2025-06-11 13:40:24', 1, 'MUSK KHAS'),
(167, 'MUSK KHAS', 'MUSK KHAS', 'filemanager/684987487b6e4.jpg', '684987487b6e4.jpg', 227108, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:40:24', '2025-06-11 13:40:24', 1, 'MUSK KHAS'),
(168, 'MUSK KHAS', 'MUSK KHAS', 'filemanager/684987487bbd6.jpg', '684987487bbd6.jpg', 274961, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:40:24', '2025-06-11 13:40:24', 1, 'MUSK KHAS'),
(169, 'NEUTRON', 'NEUTRON', 'filemanager/684987f22dc22.jpg', '684987f22dc22.jpg', 118849, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:43:14', '2025-06-11 13:43:14', 1, 'NEUTRON'),
(170, 'NEUTRON', 'NEUTRON', 'filemanager/684987f22e146.jpg', '684987f22e146.jpg', 101735, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:43:14', '2025-06-11 13:43:14', 1, 'NEUTRON'),
(171, 'NEUTRON', 'NEUTRON', 'filemanager/684987f22e55d.jpg', '684987f22e55d.jpg', 131641, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:43:14', '2025-06-11 13:43:14', 1, 'NEUTRON'),
(172, 'PATCHOULI WOOD', 'PATCHOULI WOOD', 'filemanager/6849882898a4f.jpg', '6849882898a4f.jpg', 94610, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:44:08', '2025-06-11 13:44:08', 1, 'others'),
(173, 'PATCHOULI WOOD', 'PATCHOULI WOOD', 'filemanager/6849882898e6d.jpg', '6849882898e6d.jpg', 77910, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:44:08', '2025-06-11 13:44:08', 1, 'others'),
(174, 'PATCHOULI WOOD', 'PATCHOULI WOOD', 'filemanager/6849882899193.jpg', '6849882899193.jpg', 67077, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:44:08', '2025-06-11 13:44:08', 1, 'others'),
(175, 'RAINDROPS', 'RAINDROPS', 'filemanager/684988e2f29a5.jpg', '684988e2f29a5.jpg', 57941, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:47:14', '2025-06-11 13:47:14', 1, 'RAINDROPS'),
(176, 'RAINDROPS', 'RAINDROPS', 'filemanager/684988e2f2f15.jpg', '684988e2f2f15.jpg', 45800, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:47:14', '2025-06-11 13:47:14', 1, 'RAINDROPS'),
(177, 'RAINDROPS', 'RAINDROPS', 'filemanager/684988e2f3258.jpg', '684988e2f3258.jpg', 57780, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:47:14', '2025-06-11 13:47:14', 1, 'RAINDROPS'),
(178, 'RAINDROPS MINIATURE', 'RAINDROPS MINIATURE', 'filemanager/68498a3290791.jpg', '68498a3290791.jpg', 61072, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:52:50', '2025-06-11 13:52:50', 1, 'RAINDROPS MINIATURE'),
(179, 'RAINDROPS MINIATURE', 'RAINDROPS MINIATURE', 'filemanager/68498a3290b58.jpg', '68498a3290b58.jpg', 84362, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:52:50', '2025-06-11 13:52:50', 1, 'RAINDROPS MINIATURE'),
(180, 'RAINDROPS MINIATURE', 'RAINDROPS MINIATURE', 'filemanager/68498a3290ec4.jpg', '68498a3290ec4.jpg', 72488, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:52:50', '2025-06-11 13:52:50', 1, 'RAINDROPS MINIATURE'),
(181, 'ROSE WOOD', 'ROSE WOOD', 'filemanager/68498a6d4d0a8.jpg', '68498a6d4d0a8.jpg', 61667, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:53:49', '2025-06-11 13:53:49', 1, 'others'),
(182, 'ROSE WOOD', 'ROSE WOOD', 'filemanager/68498a6d4d4f1.jpg', '68498a6d4d4f1.jpg', 117977, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:53:49', '2025-06-11 13:53:49', 1, 'others'),
(183, 'ROSE WOOD', 'ROSE WOOD', 'filemanager/68498a6d4d8fd.jpg', '68498a6d4d8fd.jpg', 117926, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:53:49', '2025-06-11 13:53:49', 1, 'others'),
(184, 'SACRED LOVE', 'SACRED LOVE', 'filemanager/68498aa6597cd.jpg', '68498aa6597cd.jpg', 104776, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:54:46', '2025-06-11 13:54:46', 1, 'SACRED LOVE'),
(185, 'SACRED LOVE', 'SACRED LOVE', 'filemanager/68498aa659d8c.jpg', '68498aa659d8c.jpg', 116396, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:54:46', '2025-06-11 13:54:46', 1, 'SACRED LOVE'),
(186, 'SACRED LOVE', 'SACRED LOVE', 'filemanager/68498aa65a2a8.jpg', '68498aa65a2a8.jpg', 166366, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:54:46', '2025-06-11 13:54:46', 1, 'SACRED LOVE'),
(187, 'SACRED LOVE MINIATURE', 'SACRED LOVE MINIATURE', 'filemanager/68498ae02d1cc.jpg', '68498ae02d1cc.jpg', 73937, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:55:44', '2025-06-11 13:55:44', 1, 'SACRED LOVE MINIATURE'),
(188, 'SACRED LOVE MINIATURE', 'SACRED LOVE MINIATURE', 'filemanager/68498ae02d6b2.jpg', '68498ae02d6b2.jpg', 108390, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:55:44', '2025-06-11 13:55:44', 1, 'SACRED LOVE MINIATURE'),
(189, 'SACRED LOVE MINIATURE', 'SACRED LOVE MINIATURE', 'filemanager/68498ae02da7b.jpg', '68498ae02da7b.jpg', 88447, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:55:44', '2025-06-11 13:55:44', 1, 'SACRED LOVE MINIATURE'),
(190, 'SANTAL WOOD', 'SANTAL WOOD', 'filemanager/68498b27b2459.jpg', '68498b27b2459.jpg', 78208, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:56:55', '2025-06-11 13:56:55', 1, 'SANTAL WOOD'),
(191, 'SANTAL WOOD', 'SANTAL WOOD', 'filemanager/68498b27b289e.jpg', '68498b27b289e.jpg', 98676, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:56:55', '2025-06-11 13:56:55', 1, 'SANTAL WOOD'),
(192, 'SANTAL WOOD', 'SANTAL WOOD', 'filemanager/68498b27b2c0d.jpg', '68498b27b2c0d.jpg', 83486, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:56:55', '2025-06-11 13:56:55', 1, 'SANTAL WOOD'),
(193, 'SERENITY IN ME', 'SERENITY IN ME', 'filemanager/68498b5ca20fd.jpg', '68498b5ca20fd.jpg', 58722, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:57:48', '2025-06-11 13:57:48', 1, 'SERENITY IN ME'),
(194, 'SERENITY IN ME', 'SERENITY IN ME', 'filemanager/68498b5ca261c.jpg', '68498b5ca261c.jpg', 100838, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:57:48', '2025-06-11 13:57:48', 1, 'SERENITY IN ME'),
(195, 'SERENITY IN ME', 'SERENITY IN ME', 'filemanager/68498b5ca2dc7.jpg', '68498b5ca2dc7.jpg', 87910, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:57:48', '2025-06-11 13:57:48', 1, 'SERENITY IN ME'),
(196, 'SHADOW HER', 'SHADOW HER', 'filemanager/68498bc3d36d1.jpg', '68498bc3d36d1.jpg', 136139, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:59:31', '2025-06-11 13:59:31', 1, 'SHADOW HER'),
(197, 'SHADOW HER', 'SHADOW HER', 'filemanager/68498bc3d3b43.jpg', '68498bc3d3b43.jpg', 135630, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:59:31', '2025-06-11 13:59:31', 1, 'SHADOW HER'),
(198, 'SHADOW HER', 'SHADOW HER', 'filemanager/68498bc3d3f0f.jpg', '68498bc3d3f0f.jpg', 179178, 'jpg', 'image/jpeg', NULL, '2025-06-11 13:59:31', '2025-06-11 13:59:31', 1, 'SHADOW HER'),
(199, 'SHADOW HIM', 'SHADOW HIM', 'filemanager/68498bfb8770d.jpg', '68498bfb8770d.jpg', 70938, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:00:27', '2025-06-11 14:00:27', 1, 'SHADOW HIM'),
(200, 'SHADOW HIM', 'SHADOW HIM', 'filemanager/68498bfb87d38.jpg', '68498bfb87d38.jpg', 105552, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:00:27', '2025-06-11 14:00:27', 1, 'SHADOW HIM'),
(201, 'SHADOW HIM', 'SHADOW HIM', 'filemanager/68498bfb8828b.jpg', '68498bfb8828b.jpg', 90328, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:00:27', '2025-06-11 14:00:27', 1, 'SHADOW HIM'),
(202, 'SHINE', 'SHINE', 'filemanager/68498c41c337e.jpg', '68498c41c337e.jpg', 112433, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:01:37', '2025-06-11 14:01:37', 1, 'SHINE'),
(203, 'SHINE', 'SHINE', 'filemanager/68498c41c3802.jpg', '68498c41c3802.jpg', 333460, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:01:37', '2025-06-11 14:01:37', 1, 'SHINE'),
(204, 'SHINE', 'SHINE', 'filemanager/68498c41c3c8b.jpg', '68498c41c3c8b.jpg', 360039, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:01:37', '2025-06-11 14:01:37', 1, 'SHINE'),
(205, 'SIGNIFY', 'SIGNIFY', 'filemanager/68498c963ce0a.jpg', '68498c963ce0a.jpg', 190049, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:03:02', '2025-06-11 14:03:02', 1, 'SIGNIFY'),
(206, 'SIGNIFY', 'SIGNIFY', 'filemanager/68498c963d39f.jpg', '68498c963d39f.jpg', 523207, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:03:02', '2025-06-11 14:03:02', 1, 'SIGNIFY'),
(207, 'SIGNIFY', 'SIGNIFY', 'filemanager/68498c963d982.jpg', '68498c963d982.jpg', 400125, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:03:02', '2025-06-11 14:03:02', 1, 'SIGNIFY'),
(208, 'SILVER SHADE', 'SILVER SHADE', 'filemanager/68498d708124a.jpg', '68498d708124a.jpg', 116012, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:06:40', '2025-06-11 14:06:40', 1, 'SILVER SHADE'),
(209, 'SILVER SHADE', 'SILVER SHADE', 'filemanager/68498d7081710.jpg', '68498d7081710.jpg', 162844, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:06:40', '2025-06-11 14:06:40', 1, 'SILVER SHADE'),
(210, 'SILVER SHADE', 'SILVER SHADE', 'filemanager/68498d7081ab0.jpg', '68498d7081ab0.jpg', 174526, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:06:40', '2025-06-11 14:06:40', 1, 'SILVER SHADE'),
(211, 'TITANIUM HIM', 'TITANIUM HIM', 'filemanager/68498f1f23974.jpg', '68498f1f23974.jpg', 51227, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:13:51', '2025-06-11 14:13:51', 1, 'TITANIUM HIM'),
(212, 'TITANIUM HIM', 'TITANIUM HIM', 'filemanager/68498f1f23d31.jpg', '68498f1f23d31.jpg', 65550, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:13:51', '2025-06-11 14:13:51', 1, 'TITANIUM HIM'),
(213, 'TITANIUM HIM', 'TITANIUM HIM', 'filemanager/68498f1f24060.jpg', '68498f1f24060.jpg', 54269, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:13:51', '2025-06-11 14:13:51', 1, 'TITANIUM HIM'),
(214, 'VIOLET MUSC', 'VIOLET MUSC', 'filemanager/68498f65db16d.jpg', '68498f65db16d.jpg', 79441, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:15:01', '2025-06-11 14:15:01', 1, 'VIOLET MUSC'),
(215, 'VIOLET MUSC', 'VIOLET MUSC', 'filemanager/68498f65db52d.jpg', '68498f65db52d.jpg', 142458, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:15:01', '2025-06-11 14:15:01', 1, 'VIOLET MUSC'),
(216, 'VIOLET MUSC', 'VIOLET MUSC', 'filemanager/68498f65db8d0.jpg', '68498f65db8d0.jpg', 97377, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:15:01', '2025-06-11 14:15:01', 1, 'VIOLET MUSC'),
(217, 'WANDERER', 'WANDERER', 'filemanager/68498fa0b82c1.jpg', '68498fa0b82c1.jpg', 72945, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:16:00', '2025-06-11 14:16:00', 1, 'WANDERER'),
(218, 'WANDERER', 'WANDERER', 'filemanager/68498fa0b8824.jpg', '68498fa0b8824.jpg', 158220, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:16:00', '2025-06-11 14:16:00', 1, 'WANDERER'),
(219, 'WANDERER', 'WANDERER', 'filemanager/68498fa0b8bf6.jpg', '68498fa0b8bf6.jpg', 156689, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:16:00', '2025-06-11 14:16:00', 1, 'WANDERER'),
(220, 'WISAL', 'WISAL', 'filemanager/6849900c017bc.jpg', '6849900c017bc.jpg', 119300, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:17:48', '2025-06-11 14:17:48', 1, 'WISAL'),
(221, 'WISAL', 'WISAL', 'filemanager/6849900c01c2e.jpg', '6849900c01c2e.jpg', 183937, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:17:48', '2025-06-11 14:17:48', 1, 'WISAL'),
(222, 'WISAL', 'WISAL', 'filemanager/6849900c01fa8.jpg', '6849900c01fa8.jpg', 188961, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:17:48', '2025-06-11 14:17:48', 1, 'WISAL'),
(223, 'WISAL DHAHAB', 'WISAL DHAHAB', 'filemanager/6849904bca617.jpg', '6849904bca617.jpg', 107694, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:18:51', '2025-06-11 14:18:51', 1, 'WISAL DHAHAB'),
(224, 'WISAL DHAHAB', 'WISAL DHAHAB', 'filemanager/6849904bcaaaa.jpg', '6849904bcaaaa.jpg', 245120, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:18:51', '2025-06-11 14:18:51', 1, 'WISAL DHAHAB'),
(225, 'WISAL DHAHAB', 'WISAL DHAHAB', 'filemanager/6849904bcaf3c.jpg', '6849904bcaf3c.jpg', 254905, 'jpg', 'image/jpeg', NULL, '2025-06-11 14:18:51', '2025-06-11 14:18:51', 1, 'WISAL DHAHAB'),
(226, 'banner rear', 'banner rear', 'filemanager/684999bfabc64.png', '684999bfabc64.png', 2332876, 'png', 'image/png', NULL, '2025-06-11 14:59:11', '2025-06-11 14:59:11', 1, 'banner rear'),
(227, 'banner rear2', 'banner rear2', 'filemanager/68499a6001516.png', '68499a6001516.png', 1483809, 'png', 'image/png', NULL, '2025-06-11 15:01:52', '2025-06-11 15:01:52', 1, 'banner rear'),
(228, 'banner rear3', 'banner rear3', 'filemanager/684d33b3b9fe6.png', '68499ad269847.png', 937770, 'png', 'image/png', NULL, '2025-06-11 15:03:46', '2025-06-14 08:32:51', 1, 'banner rear'),
(232, 'asdasd', 'asdasd', 'filemanager/684d4b9342bcd.png', '684d4b9342bcd.png', 28295, 'png', 'image/png', NULL, '2025-06-14 15:14:43', '2025-06-14 15:14:43', 1, 'others'),
(233, 'new logo', 'new', 'filemanager/68a37916d0046.png', '68a37916d0046.png', 516074, 'png', 'image/png', NULL, '2025-08-19 02:03:50', '2025-08-19 02:03:50', 1, 'others');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_05_18_140129_create_attributes_table', 1),
(6, '2024_05_18_140812_create_brands_table', 1),
(7, '2024_05_18_141703_create_categories_table', 1),
(8, '2024_05_18_141752_create_collections_table', 1),
(9, '2024_05_18_142133_create_filemanager_table', 1),
(10, '2024_05_18_142230_create_menus_table', 1),
(11, '2024_05_18_142420_create_menu_items_table', 1),
(12, '2024_05_18_143227_create_newsletters_table', 1),
(13, '2024_05_18_143629_create_pages_table', 1),
(14, '2024_05_18_143810_create_payment_methods_table', 1),
(15, '2024_05_18_144340_create_products_table', 1),
(16, '2024_05_18_144425_create_product_collections_table', 1),
(17, '2024_05_18_144517_create_roles_table', 1),
(18, '2024_05_18_144624_create_settings_table', 1),
(19, '2024_05_18_144728_create_sliders_table', 1),
(20, '2024_05_18_144939_create_values_table', 1),
(21, '2024_05_18_145043_create_variations_table', 1),
(22, '2024_05_18_145125_create_variation_attributes_table', 1),
(23, '2024_05_18_145126_create_orders_table', 1),
(24, '2024_05_18_145127_create_order_status_table', 1),
(25, '2024_05_18_145128_create_order_items_table', 1),
(26, '2024_05_21_103826_add_settings_data', 1),
(27, '2024_05_21_104016_add_role_and_user', 1),
(28, '2026_01_01_063120_create_jobs_table', 2),
(29, '2026_01_01_063205_create_cache_table', 3),
(30, '2026_01_01_071437_create_failed_jobs_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tracking_id` text DEFAULT NULL,
  `sno` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_phone` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `order_status` text NOT NULL,
  `order_notes` text DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `delivery_charges` double NOT NULL DEFAULT 0,
  `grandtotal` double DEFAULT NULL,
  `is_enable` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `customer_notes` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `tracking_id`, `sno`, `customer_name`, `customer_email`, `customer_phone`, `country`, `city`, `address`, `payment_method`, `payment_status`, `order_status`, `order_notes`, `subtotal`, `delivery_charges`, `grandtotal`, `is_enable`, `created_at`, `updated_at`, `customer_notes`) VALUES
(14, 'ORD-695245a998cfd', NULL, 'Muhammad Shakeeb', 'shakeeb@test.com', '03001234567', 'Pakistan', 'Lahore', 'Model Town, Lahore', '1', 'unpaid', '1', NULL, 1000, 100, 1100, 1, '2026-01-01 07:16:05', '2026-01-01 07:16:29', 'Please deliver after 6pm'),
(13, 'ORD-69524594af259', NULL, 'Muhammad Shakeeb', 'shakeeb@test.com', '03001234567', 'Pakistan', 'Lahore', 'Model Town, Lahore', '1', 'unpaid', '1', NULL, 1000, 100, 1100, 1, '2026-01-01 04:10:44', '2026-01-01 07:07:14', 'Please deliver after 6pm'),
(12, 'ORD-6952458117806', NULL, 'Muhammad Shakeeb', 'shakeeb@test.com', '03001234567', 'Pakistan', 'Lahore', 'Model Town, Lahore', '1', 'unpaid', '1', NULL, 1000, 100, 1100, 1, '2026-01-01 04:10:25', '2026-01-01 07:07:21', 'Please deliver after 6pm'),
(11, 'ORD-6952456b43247', NULL, 'Muhammad Shakeeb', 'shakeeb@test.com', '03001234567', 'Pakistan', 'Lahore', 'Model Town, Lahore', '1', 'unpaid', '1', NULL, 1000, 100, 1100, 1, '2025-12-29 04:10:03', '2025-12-29 04:10:03', 'Please deliver after 6pm'),
(10, 'ORD-695244b422f29', NULL, 'Muhammad Shakeeb', 'shakeeb@test.com', '03001234567', 'Pakistan', 'Lahore', 'Model Town, Lahore', '1', 'unpaid', '1', NULL, 1000, 100, 1100, 1, '2025-12-29 04:07:00', '2025-12-29 04:07:00', 'Please deliver after 6pm'),
(15, 'ORD-695245b9d645c', NULL, 'Muhammad Shakeeb', 'shakeeb@test.com', '03001234567', 'Pakistan', 'Lahore', 'Model Town, Lahore', '1', 'unpaid', '1', NULL, 1000, 100, 1100, 1, '2025-12-29 04:11:21', '2025-12-29 04:11:21', 'Please deliver after 6pm'),
(16, 'ORD-695246f58f422', NULL, 'Muhammad Shakeeb', 'shakeeb@test.com', '03001234567', 'Pakistan', 'Lahore', 'Model Town, Lahore', '1', 'unpaid', '1', NULL, 1000, 100, 1100, 1, '2025-12-29 04:16:37', '2025-12-29 04:16:37', 'Please deliver after 6pm'),
(17, 'ORD-6958ce76f3ea1', NULL, 'Shakeeb', 'man411210@gmail.com', '2342423', 'Pakistan', 'fsfsdf', 'sdfsdfsdf', '1', 'unpaid', '1', NULL, 8050, 100, 8150, 1, '2026-01-03 03:08:23', '2026-01-03 03:08:23', 'sdfsdf');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `variation_id` bigint(20) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `sku` text DEFAULT NULL,
  `image_id` text DEFAULT NULL,
  `quantity` decimal(10,0) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `attr` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `variation_id`, `title`, `sku`, `image_id`, `quantity`, `price`, `total`, `attr`, `created_at`, `updated_at`) VALUES
(19, 16, 37, 'Test Product', 'TP001', '1', 2, 500, 1000, '{\"color\":\"Red\"}', '2025-12-29 04:16:37', '2025-12-29 04:16:37'),
(18, 15, 37, 'Test Product', 'TP001', '1', 2, 500, 1000, '{\"color\":\"Red\"}', '2025-12-29 04:11:21', '2025-12-29 04:11:21'),
(17, 14, 37, 'Test Product', 'TP001', '1', 2, 500, 1000, '{\"color\":\"Red\"}', '2025-12-29 04:11:05', '2025-12-29 04:11:05'),
(16, 13, 37, 'Test Product', 'TP001', '1', 2, 500, 1000, '{\"color\":\"Red\"}', '2025-12-29 04:10:44', '2025-12-29 04:10:44'),
(15, 12, 37, 'Test Product', 'TP001', '1', 2, 500, 1000, '{\"color\":\"Red\"}', '2025-12-29 04:10:25', '2025-12-29 04:10:25'),
(13, 10, 37, 'Test Product', 'TP001', '1', 2, 500, 1000, '{\"color\":\"Red\"}', '2025-12-29 04:07:00', '2025-12-29 04:07:00'),
(14, 11, 37, 'Test Product', 'TP001', '1', 2, 500, 1000, '{\"color\":\"Red\"}', '2025-12-29 04:10:03', '2025-12-29 04:10:03'),
(20, 17, 66, 'WISAL DHAHAB', '200 ml', 'filemanager/6849904bcaf3c.jpg', 1, 1250, 1250, '[]', '2026-01-03 03:08:23', '2026-01-03 03:08:23'),
(21, 17, 65, 'WISAL', '200 ml', 'filemanager/6849900c01fa8.jpg', 4, 1700, 6800, '[]', '2026-01-03 03:08:23', '2026-01-03 03:08:23');

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `is_enable` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `title`, `is_enable`, `created_at`, `updated_at`) VALUES
(1, 'Pending', 1, '2025-12-29 09:06:57', '2025-12-29 09:06:57');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `slug` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_enable` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `title`, `slug`, `message`, `is_enable`, `created_at`, `updated_at`) VALUES
(1, 'Cash On Delivery', 'cash_on_delivery', 'Cash On Delivery Message', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48'),
(2, 'Bank Transfer', 'bank_transfer', 'Bank Transfer Message', 1, '2024-09-25 16:48:48', '2024-09-25 16:48:48');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'autoboli_token', 'c4d9ded8a4d151999ec7df52ac9921caba8ef816304d251267c07de9aebca110', '[\"*\"]', NULL, NULL, '2025-10-30 06:27:50', '2025-10-30 06:27:50'),
(2, 'App\\Models\\User', 1, 'autoboli_token', '7a992484773ef76976850c0ae4eff1552ef01385788c2b5fede999bbbe5e410f', '[\"*\"]', NULL, NULL, '2025-10-30 06:28:11', '2025-10-30 06:28:11'),
(3, 'App\\Models\\User', 1, 'autoboli_token', 'b0afad355d6bb60d5d03307f2d21cdee9fedde64d03b9ebcd39e39927eeaf9d1', '[\"*\"]', NULL, NULL, '2025-10-30 06:36:55', '2025-10-30 06:36:55'),
(4, 'App\\Models\\User', 1, 'autoboli_token', 'c3e234a12818af7eee23b80cb6af3fc6714ed50ec920f416c8a7b3abd13d956a', '[\"*\"]', '2025-10-30 08:41:10', NULL, '2025-10-30 06:37:42', '2025-10-30 08:41:10'),
(5, 'App\\Models\\User', 1, 'autoboli_token', '856c3c0ed466611b63e6bdeffe3279b56f6af339924b31b97c462a0c201bf1f9', '[\"*\"]', NULL, NULL, '2025-10-30 09:13:32', '2025-10-30 09:13:32'),
(6, 'App\\Models\\User', 1, 'autoboli_token', 'dc26b01e2f22b6f1f040f04745794f39e6b6084af9b25d04e25de9d80cb3cb86', '[\"*\"]', NULL, NULL, '2025-10-30 09:13:53', '2025-10-30 09:13:53'),
(7, 'App\\Models\\User', 1, 'autoboli_token', '189957866d2da0c60f12b5b73d0386f325477eb523f84d326b3818d1dbaf456e', '[\"*\"]', NULL, NULL, '2025-10-30 09:14:26', '2025-10-30 09:14:26'),
(8, 'App\\Models\\User', 1, 'autoboli_token', '85b4ffd17259dab5ded01ba9d1ea81cc5341639e9e5f1e01a719142a5b196322', '[\"*\"]', NULL, NULL, '2025-10-30 09:22:31', '2025-10-30 09:22:31'),
(9, 'App\\Models\\User', 1, 'autoboli_token', '4023c595b171a9dbc5a025ef3c7d8a15d49169a8c8ebe052ef1052ed127761bd', '[\"*\"]', NULL, NULL, '2025-10-30 09:22:34', '2025-10-30 09:22:34'),
(10, 'App\\Models\\User', 1, 'autoboli_token', 'c205d0c4eb8feb70726b2d0fe1ff60a33970befb817d29e71f3cf11497954e67', '[\"*\"]', NULL, NULL, '2025-10-30 09:22:52', '2025-10-30 09:22:52'),
(11, 'App\\Models\\User', 1, 'autoboli_token', '2f3a302679bb7af6a8df826669b5a0b1ac211df6b0fffc127bf52c055d82fdfa', '[\"*\"]', NULL, NULL, '2025-10-30 09:23:38', '2025-10-30 09:23:38'),
(12, 'App\\Models\\User', 1, 'autoboli_token', '12e611b39b11240bf618db0d02d4030f097131c6c18800b78c9de0e35439b00a', '[\"*\"]', NULL, NULL, '2025-10-30 09:23:47', '2025-10-30 09:23:47'),
(13, 'App\\Models\\User', 1, 'autoboli_token', '96ab35e9f767eb68cb76aa149c276e534c51442cbe26eeb15992de5706418543', '[\"*\"]', NULL, NULL, '2025-10-30 09:24:04', '2025-10-30 09:24:04'),
(14, 'App\\Models\\User', 1, 'autoboli_token', '301948aaa1484a32a59112f8229bfc7814c14720087f1f55133bed65a3b464e3', '[\"*\"]', NULL, NULL, '2025-10-30 09:24:14', '2025-10-30 09:24:14'),
(15, 'App\\Models\\User', 1, 'autoboli_token', '7ed97c0f3a1303b9a097d60abf6d38b78bb938dd48c0bb808bd4b8e9dc12ae33', '[\"*\"]', NULL, NULL, '2025-10-30 09:27:34', '2025-10-30 09:27:34'),
(16, 'App\\Models\\User', 1, 'autoboli_token', 'c089a2694015f57deaf3ed248413ee9e5771affff25850cf6b58cb5e4adbbaf7', '[\"*\"]', NULL, NULL, '2025-10-30 09:28:09', '2025-10-30 09:28:09'),
(17, 'App\\Models\\User', 1, 'autoboli_token', 'ac0d703d05aa469827f3fc2f32120a7e11b68f386f867a57f0c9b8e58c3292b0', '[\"*\"]', NULL, NULL, '2025-10-30 09:56:52', '2025-10-30 09:56:52'),
(18, 'App\\Models\\User', 1, 'autoboli_token', '492ed6690881a44e8682939662c724e4abcb1854406658751841ce2da8bf7455', '[\"*\"]', NULL, NULL, '2025-10-30 09:57:45', '2025-10-30 09:57:45'),
(19, 'App\\Models\\User', 1, 'autoboli_token', 'ac7bcb384af84aa2a78acfbcd58c5991e62862716c19746ad44f888f0aaeeb8f', '[\"*\"]', NULL, NULL, '2025-10-30 09:58:03', '2025-10-30 09:58:03'),
(20, 'App\\Models\\User', 1, 'autoboli_token', 'bae6318876c1968d76d29222a7c26f69dd35833384751170b59a66af7fe8b0f3', '[\"*\"]', NULL, NULL, '2025-10-30 10:01:52', '2025-10-30 10:01:52'),
(21, 'App\\Models\\User', 1, 'autoboli_token', '699637b75ab478533dd6351da68724188c290d18eedfe702842c64810d4cb5bc', '[\"*\"]', NULL, NULL, '2025-10-30 10:02:08', '2025-10-30 10:02:08'),
(22, 'App\\Models\\User', 1, 'autoboli_token', '87dec7113f885772fbaf2a62783c293a51b6f4f3963e5aa58ca37c9b2192dd3b', '[\"*\"]', NULL, NULL, '2025-10-30 10:02:37', '2025-10-30 10:02:37'),
(23, 'App\\Models\\User', 1, 'autoboli_token', '4332497f963cedf3b066db98f2c1c67c6d9061204e180f189ae2dadacb9539de', '[\"*\"]', NULL, NULL, '2025-10-30 10:03:48', '2025-10-30 10:03:48'),
(24, 'App\\Models\\User', 1, 'autoboli_token', '39b9969e7a1a320d76807271e5f1e0383f731cf9c72076a58c2e1d8b7f42b0d3', '[\"*\"]', NULL, NULL, '2025-10-30 10:04:25', '2025-10-30 10:04:25'),
(25, 'App\\Models\\User', 1, 'autoboli_token', '9ea52c6f2a2995bb45fd7b6657b6eb99637ca5b27f0342ecac71beb032ec79d5', '[\"*\"]', NULL, NULL, '2025-10-30 10:10:42', '2025-10-30 10:10:42'),
(26, 'App\\Models\\User', 1, 'autoboli_token', '66dde97375755510136789748f20c95725aea4ae29686c1231eabd19f30bcf34', '[\"*\"]', NULL, NULL, '2025-10-30 10:20:38', '2025-10-30 10:20:38'),
(27, 'App\\Models\\User', 1, 'autoboli_token', 'a7814af4343698997315dc005515bd1d2a069b9af85d52d6a829a4e21d5ee622', '[\"*\"]', NULL, NULL, '2025-10-30 10:21:03', '2025-10-30 10:21:03'),
(28, 'App\\Models\\User', 1, 'autoboli_token', 'ee825412c27d9893a96191727805a7cd1e9f3a46509555ce9e1c8feb41da1cc9', '[\"*\"]', '2025-10-30 10:34:48', NULL, '2025-10-30 10:34:48', '2025-10-30 10:34:48'),
(29, 'App\\Models\\User', 1, 'autoboli_token', '49930ea00935366c29fa04c99761bb59b2b92290374fc1d37713ee7b5e598eb0', '[\"*\"]', '2025-10-30 10:35:04', NULL, '2025-10-30 10:35:04', '2025-10-30 10:35:04'),
(30, 'App\\Models\\User', 1, 'autoboli_token', '76caa848d782ea6cc41021e452bdfa95286dba7ad7d1db53f7e15a01e2ea7557', '[\"*\"]', '2025-10-30 10:36:32', NULL, '2025-10-30 10:36:32', '2025-10-30 10:36:32'),
(31, 'App\\Models\\User', 1, 'autoboli_token', '626019db81a42caa4cf6fe9cdfa412368542336752b3d9efa8a18061b3c06ca2', '[\"*\"]', '2025-10-30 10:37:48', NULL, '2025-10-30 10:37:47', '2025-10-30 10:37:48'),
(32, 'App\\Models\\User', 1, 'autoboli_token', '5111cf9f8d1c807bb787eee1bc5ef106857e81bdac390cab7540888696e9c648', '[\"*\"]', NULL, NULL, '2025-10-31 06:48:54', '2025-10-31 06:48:54'),
(33, 'App\\Models\\User', 1, 'autoboli_token', '2ab08d2dc29b0caa77fdf0f76b0998c8ae398ac7b2d73e8dbdc4c14d5a410ac6', '[\"*\"]', NULL, NULL, '2025-10-31 06:49:14', '2025-10-31 06:49:14'),
(34, 'App\\Models\\User', 1, 'autoboli_token', '22b45f4d48db5bcc732adf12be250d3989bf1417196e60c71626a4e159371634', '[\"*\"]', NULL, NULL, '2025-10-31 06:50:06', '2025-10-31 06:50:06'),
(35, 'App\\Models\\User', 1, 'autoboli_token', 'c59d5cf8610e5d17a1309d559c1738147f8f9f6b71da60502cae520a0de53f92', '[\"*\"]', NULL, NULL, '2025-10-31 06:50:21', '2025-10-31 06:50:21'),
(36, 'App\\Models\\User', 1, 'autoboli_token', 'b6028659a691e53422623772fbe9874886dfad9304ad015813002608698dc3ab', '[\"*\"]', NULL, NULL, '2025-10-31 07:20:02', '2025-10-31 07:20:02'),
(37, 'App\\Models\\User', 1, 'autoboli_token', '84ae66a97c89f514aae2e346f6d88f7aad21c586df7ad91f03822b1a64269841', '[\"*\"]', NULL, NULL, '2025-10-31 07:20:14', '2025-10-31 07:20:14'),
(38, 'App\\Models\\User', 1, 'autoboli_token', 'f91f81427b8f5d94712f2216baeef1370be0f17eaa311697d58562be4d730e75', '[\"*\"]', NULL, NULL, '2025-10-31 07:20:44', '2025-10-31 07:20:44'),
(39, 'App\\Models\\User', 1, 'autoboli_token', 'cef024f42105359f6024a3843a821360b2e5ee013c79b66b0219ef8bd1ed53f8', '[\"*\"]', NULL, NULL, '2025-10-31 07:23:24', '2025-10-31 07:23:24'),
(40, 'App\\Models\\User', 1, 'autoboli_token', 'e4d54ca607424a0aa56b67affaae5a7bfcca0dacff5d6bcfa8f7656c69761766', '[\"*\"]', NULL, NULL, '2025-10-31 07:24:23', '2025-10-31 07:24:23'),
(41, 'App\\Models\\User', 1, 'autoboli_token', '39bf2d5c0d89c7f7439a9c85b243e7e2968589dea22f0259a4dcafb71cc85375', '[\"*\"]', NULL, NULL, '2025-10-31 07:26:02', '2025-10-31 07:26:02'),
(42, 'App\\Models\\User', 1, 'autoboli_token', 'dab2d881dad6b910a447d5ab6af0cd875f6732603069955cc4b447c3fbd3ee12', '[\"*\"]', NULL, NULL, '2025-10-31 07:52:47', '2025-10-31 07:52:47'),
(43, 'App\\Models\\User', 1, 'autoboli_token', 'd4f6250d0f9b5f63153b6b2f8186f933ccbac700816262fce67addd9f0207cac', '[\"*\"]', NULL, NULL, '2025-10-31 09:00:02', '2025-10-31 09:00:02'),
(44, 'App\\Models\\User', 1, 'autoboli_token', '5756cbc9b70076d9b65b29b9654c18d57c092d09ca4386c242bd72968f71952e', '[\"*\"]', NULL, NULL, '2025-10-31 09:00:24', '2025-10-31 09:00:24'),
(45, 'App\\Models\\User', 1, 'autoboli_token', '60e677ad333fd47824c151ee03d838ef0a06d031de1c1fbfc9751e0522b5af63', '[\"*\"]', NULL, NULL, '2025-10-31 09:01:52', '2025-10-31 09:01:52'),
(46, 'App\\Models\\User', 1, 'autoboli_token', '7f2bae758350198c0feb88305e23703d59ac5b4a95e4ff407fc29aa797090165', '[\"*\"]', NULL, NULL, '2025-10-31 09:05:46', '2025-10-31 09:05:46'),
(47, 'App\\Models\\User', 1, 'autoboli_token', 'a1459cb9ff2ef009058309d3a9d7ec60d34079f5085b07d0e3aa43131be22829', '[\"*\"]', NULL, NULL, '2025-10-31 09:06:02', '2025-10-31 09:06:02'),
(48, 'App\\Models\\User', 1, 'autoboli_token', 'df2a4a90ee38c963556bd0a6e0ff81e33e383d07ad4cdbdeee07287695a34612', '[\"*\"]', NULL, NULL, '2025-10-31 09:07:19', '2025-10-31 09:07:19'),
(49, 'App\\Models\\User', 1, 'autoboli_token', 'a923ee87465f82949607d463dedafc1b58039ef055ebef863d3daa15a573551e', '[\"*\"]', '2025-10-31 09:12:14', NULL, '2025-10-31 09:12:13', '2025-10-31 09:12:14'),
(50, 'App\\Models\\User', 1, 'autoboli_token', 'aab13676840553848db3e5701b6f6a1e67b1ca721655d5c9cce440e473bc6efc', '[\"*\"]', '2025-10-31 09:16:58', NULL, '2025-10-31 09:16:58', '2025-10-31 09:16:58'),
(51, 'App\\Models\\User', 1, 'autoboli_token', 'c1cc9184b5efe4a6c07c59fe01c44bc7709967392457fa7538fa086a288e1b59', '[\"*\"]', '2025-10-31 09:18:21', NULL, '2025-10-31 09:18:21', '2025-10-31 09:18:21'),
(52, 'App\\Models\\User', 1, 'autoboli_token', 'e16950e61255d364d91b61f485a5887e161f00b9bd089af5e5c4cd725a354378', '[\"*\"]', '2025-10-31 09:21:31', NULL, '2025-10-31 09:21:30', '2025-10-31 09:21:31'),
(53, 'App\\Models\\User', 1, 'autoboli_token', 'cd21c4a7c27fe45f33b60733bdc331077328d5c102de8c36353a1ce7834285f0', '[\"*\"]', '2025-10-31 09:29:32', NULL, '2025-10-31 09:29:32', '2025-10-31 09:29:32'),
(54, 'App\\Models\\User', 1, 'autoboli_token', '1c867258febcaca7c5fd95dc30262b6392309820c099e23994e4c703eea5107a', '[\"*\"]', '2025-10-31 09:31:07', NULL, '2025-10-31 09:31:06', '2025-10-31 09:31:07'),
(55, 'App\\Models\\User', 1, 'autoboli_token', '9e40eba8cfe1ad051cb8f288c3509005b6078b16519c3720c96269cb4ef14dfb', '[\"*\"]', '2025-10-31 09:31:23', NULL, '2025-10-31 09:31:22', '2025-10-31 09:31:23'),
(56, 'App\\Models\\User', 1, 'autoboli_token', '323741e2e2104db4d8445f72df00801819b94d53c383cd9d088455aa0aae8bae', '[\"*\"]', '2025-10-31 09:32:46', NULL, '2025-10-31 09:32:46', '2025-10-31 09:32:46'),
(57, 'App\\Models\\User', 1, 'autoboli_token', '4caea12341a450aa29f4e80ac36e0c37536bb59954652111f81d0b5e249c25e7', '[\"*\"]', '2025-10-31 09:32:59', NULL, '2025-10-31 09:32:58', '2025-10-31 09:32:59'),
(58, 'App\\Models\\User', 1, 'autoboli_token', '54fa350f0372467369690ee8033ba87c822c719b1a44568c312408009b5408e2', '[\"*\"]', '2025-10-31 10:09:05', NULL, '2025-10-31 10:09:05', '2025-10-31 10:09:05'),
(59, 'App\\Models\\User', 1, 'autoboli_token', 'ebbc23acc9f86f97e2eb250f562792ee8e11551cdac0921be40df4975f0331bc', '[\"*\"]', '2025-10-31 10:09:18', NULL, '2025-10-31 10:09:18', '2025-10-31 10:09:18'),
(60, 'App\\Models\\User', 1, 'autoboli_token', '33b8324217255ca41753f22c042ba48c43c4c50ebdccd70819573c16cbd205d3', '[\"*\"]', '2025-10-31 10:09:21', NULL, '2025-10-31 10:09:21', '2025-10-31 10:09:21'),
(61, 'App\\Models\\User', 1, 'autoboli_token', '0b1eab185d28db4d5f123d4ce07d7de09db9330ee2889e53419ba8717bc0ddcf', '[\"*\"]', '2025-10-31 10:09:24', NULL, '2025-10-31 10:09:24', '2025-10-31 10:09:24'),
(62, 'App\\Models\\User', 1, 'autoboli_token', 'b9a8ed7511f16240b32418676f1cafb7118a168edaf39eb963d2f481a0b54a99', '[\"*\"]', '2025-10-31 10:09:34', NULL, '2025-10-31 10:09:33', '2025-10-31 10:09:34'),
(63, 'App\\Models\\User', 1, 'autoboli_token', '99d834e20317b0e64b9a4f05d9a597dda2180d37cc9fc635ea405e7aa70a8062', '[\"*\"]', '2025-11-05 05:40:20', NULL, '2025-11-05 05:38:33', '2025-11-05 05:40:20'),
(64, 'App\\Models\\User', 1, 'autoboli_token', 'db44f1d0ed5de5e1f2d30a5768c26b0bb54b6fee1002ebffd85003ff78f53111', '[\"*\"]', '2025-11-05 06:17:19', NULL, '2025-11-05 06:14:38', '2025-11-05 06:17:19'),
(65, 'App\\Models\\User', 1, 'autoboli_token', '487a66aa236906550a855e0f8306a6c11b2b693d403b3530c25debc5a013d02f', '[\"*\"]', '2025-11-05 06:37:21', NULL, '2025-11-05 06:17:18', '2025-11-05 06:37:21'),
(66, 'App\\Models\\User', 1, 'autoboli_token', 'a9d72c50faa65fe595fd54cbc4c755858fa32f0ac9d9859eb8e3bdc175bd2b66', '[\"*\"]', '2025-11-05 06:38:02', NULL, '2025-11-05 06:37:21', '2025-11-05 06:38:02'),
(67, 'App\\Models\\User', 1, 'autoboli_token', 'c82fe5d5f47f3292b0fe28bf62aa5b18124258288a009ab9659b6a9589d7ebe2', '[\"*\"]', '2025-11-05 06:37:48', NULL, '2025-11-05 06:37:48', '2025-11-05 06:37:48'),
(68, 'App\\Models\\User', 1, 'autoboli_token', 'd249dab79f093619f2b8393dd2b9aff8d5a200d4a9e2d58144c2077b302c05b1', '[\"*\"]', '2025-11-05 06:37:53', NULL, '2025-11-05 06:37:53', '2025-11-05 06:37:53'),
(69, 'App\\Models\\User', 1, 'autoboli_token', '7f059299d90e4461a977a2a5ce154cee5bb7ebfcaec9254e4f4f1a605fc8c0a8', '[\"*\"]', '2025-11-05 06:37:57', NULL, '2025-11-05 06:37:57', '2025-11-05 06:37:57'),
(70, 'App\\Models\\User', 1, 'autoboli_token', 'f0b70b29c2a1dfaf6122b1fd8c7f8f3c9aaf4efeda224d03b103622486fad0a1', '[\"*\"]', '2025-11-05 06:37:59', NULL, '2025-11-05 06:37:59', '2025-11-05 06:37:59'),
(71, 'App\\Models\\User', 1, 'autoboli_token', '1eeaf41cff6f27b9153f0fb7b25ab28486dceee259fd1872bfaeb3361af64f82', '[\"*\"]', '2025-11-05 06:40:14', NULL, '2025-11-05 06:38:02', '2025-11-05 06:40:14'),
(72, 'App\\Models\\User', 1, 'autoboli_token', 'b614d247c0c23786be71af33a06e731125a1ecb11fedb547e5f9a47f15a56e5d', '[\"*\"]', '2025-11-05 06:41:45', NULL, '2025-11-05 06:40:55', '2025-11-05 06:41:45'),
(73, 'App\\Models\\User', 1, 'autoboli_token', 'a1d6a22e367f7f40b697e752d3efb9a8d6d27b8f976a801bbf343bcb0c7a225e', '[\"*\"]', '2025-11-05 07:02:19', NULL, '2025-11-05 07:02:19', '2025-11-05 07:02:19'),
(74, 'App\\Models\\User', 1, 'autoboli_token', '85fc302b320fccb56ae8df1d3654a24125f9497b19d8a61ac011e43391495814', '[\"*\"]', '2025-11-05 07:02:29', NULL, '2025-11-05 07:02:29', '2025-11-05 07:02:29'),
(75, 'App\\Models\\User', 1, 'autoboli_token', 'e58613952868d36ebc3a38e91a319594e9194992931aba26bebf095b9dcbee93', '[\"*\"]', '2025-11-05 07:03:06', NULL, '2025-11-05 07:02:36', '2025-11-05 07:03:06'),
(76, 'App\\Models\\User', 1, 'autoboli_token', '61a6b5f479cd4acb4c65b7ac074cae0037be1993a4af449bd6be431b65c3cab5', '[\"*\"]', '2025-11-05 07:26:56', NULL, '2025-11-05 07:23:40', '2025-11-05 07:26:56'),
(77, 'App\\Models\\User', 1, 'autoboli_token', '6eb51fd168a3f68f726f8780eb94e2a30a04b5874ce8ca6f19fee50dbc9367cb', '[\"*\"]', '2025-11-05 07:27:58', NULL, '2025-11-05 07:27:57', '2025-11-05 07:27:58'),
(78, 'App\\Models\\User', 1, 'autoboli_token', '4cf3e36199321c736380d4e252756680381bf81c07be94e790e6f292b0116a6c', '[\"*\"]', '2025-11-05 07:31:22', NULL, '2025-11-05 07:31:22', '2025-11-05 07:31:22'),
(79, 'App\\Models\\User', 1, 'autoboli_token', 'abc0136d7dadc898fc8eb1981a637eaee97e4840bd13af4ebf667c8effd755dc', '[\"*\"]', '2025-11-05 07:32:11', NULL, '2025-11-05 07:32:11', '2025-11-05 07:32:11'),
(80, 'App\\Models\\User', 1, 'autoboli_token', 'cded4578c7e76a1582f519c5fbd7549b472c4938c0a483ae7523827a22783876', '[\"*\"]', NULL, NULL, '2025-11-05 07:46:08', '2025-11-05 07:46:08'),
(81, 'App\\Models\\User', 1, 'autoboli_token', 'cdabfe69fd764fb05448b8da008e69021efe20d69057a89b2ec36bb1d06e2aeb', '[\"*\"]', NULL, NULL, '2025-11-05 07:46:20', '2025-11-05 07:46:20'),
(82, 'App\\Models\\User', 1, 'autoboli_token', 'c1cec4511bf891099124eaa5880171adf07f6ab8646cc63a1192c4735adc2d44', '[\"*\"]', NULL, NULL, '2025-11-05 07:46:49', '2025-11-05 07:46:49'),
(83, 'App\\Models\\User', 1, 'autoboli_token', '018e5d36534f43e980b0f689421cce87ae463726de0788dcc3eb76bc0de38b6d', '[\"*\"]', NULL, NULL, '2025-11-05 07:47:00', '2025-11-05 07:47:00'),
(84, 'App\\Models\\User', 1, 'autoboli_token', 'b19da84f3ba41f651071bfaea08db084830b2c8079122bd6bfb1538248def5b1', '[\"*\"]', NULL, NULL, '2025-11-05 07:48:35', '2025-11-05 07:48:35'),
(85, 'App\\Models\\User', 1, 'autoboli_token', 'efe03ee8e54a300a53483d9f4273c9edbe61848bf88646d189327edbd8b6c8c6', '[\"*\"]', '2025-11-05 07:51:44', NULL, '2025-11-05 07:51:43', '2025-11-05 07:51:44'),
(86, 'App\\Models\\User', 1, 'autoboli_token', '5dd797992f7d2e157c466bd19f42f5c71ff36176189b5cd4c9d5a29bfd74e01c', '[\"*\"]', '2025-11-05 07:54:30', NULL, '2025-11-05 07:54:30', '2025-11-05 07:54:30'),
(87, 'App\\Models\\User', 1, 'autoboli_token', 'c701feec66f8e9d39aee4fa01408c3fae7b6b16199ae1d08c438386af7694fa3', '[\"*\"]', '2025-11-05 08:35:33', NULL, '2025-11-05 08:11:54', '2025-11-05 08:35:33'),
(88, 'App\\Models\\User', 1, 'autoboli_token', 'd356a32a08e83136539fc431f01ba72993f7aada480b28e699ce8e6d34473b65', '[\"*\"]', '2025-11-05 09:16:55', NULL, '2025-11-05 08:59:06', '2025-11-05 09:16:55'),
(89, 'App\\Models\\User', 1, 'autoboli_token', '1e44e1a9b0c034db6ef7df9edab2a7ebfeaa3e437bead7ab38433669ab248ad5', '[\"*\"]', '2025-11-05 09:17:40', NULL, '2025-11-05 09:17:30', '2025-11-05 09:17:40'),
(90, 'App\\Models\\User', 1, 'autoboli_token', 'c87d2b9b7fe22c1c46473a9443bdf4a07e348f5783c20a901bf8d80fef0c20d8', '[\"*\"]', '2025-11-05 09:32:35', NULL, '2025-11-05 09:17:50', '2025-11-05 09:32:35'),
(91, 'App\\Models\\User', 1, 'autoboli_token', 'e9b1bd5740dd1f4f8db3dcb44dd1f794c8a4a7d4215151c45390d1033f418d72', '[\"*\"]', '2025-11-05 09:48:28', NULL, '2025-11-05 09:48:28', '2025-11-05 09:48:28'),
(92, 'App\\Models\\User', 1, 'autoboli_token', 'e711ca197296e4d4fbd5129409d6b2324fda1b2bcd1340298608346d993fa142', '[\"*\"]', '2025-11-05 10:06:12', NULL, '2025-11-05 09:48:45', '2025-11-05 10:06:12'),
(93, 'App\\Models\\User', 1, 'autoboli_token', 'c8a617dc47b4b13c97cbaeb083d5dadeac35e9d3a77dc71192399b8f3f19c54b', '[\"*\"]', '2025-11-05 10:44:05', NULL, '2025-11-05 10:44:02', '2025-11-05 10:44:05'),
(94, 'App\\Models\\User', 1, 'autoboli_token', 'f8c63c774e71b6e6c09bda77361278103a90149b295aa7aca9949548d5a66401', '[\"*\"]', '2025-11-05 11:01:22', NULL, '2025-11-05 10:44:59', '2025-11-05 11:01:22'),
(95, 'App\\Models\\User', 1, 'autoboli_token', '666390b3f40b163fed1da4ee596034dbc5f185549840c8671bbb2dfd5a90640e', '[\"*\"]', '2025-11-05 11:03:11', NULL, '2025-11-05 11:01:38', '2025-11-05 11:03:11'),
(96, 'App\\Models\\User', 1, 'autoboli_token', '2acc3f32b3a9c633478e0000a471e6dd228c823a617d1273793b18b0a5ee53ca', '[\"*\"]', '2025-11-06 08:08:22', NULL, '2025-11-06 05:58:43', '2025-11-06 08:08:22'),
(97, 'App\\Models\\User', 1, 'autoboli_token', '218b96cece561fcf59e71548888940a8e0c3b23e5b27d8ac7d366361c4a3e833', '[\"*\"]', '2025-11-06 09:30:22', NULL, '2025-11-06 09:09:35', '2025-11-06 09:30:22'),
(98, 'App\\Models\\User', 1, 'autoboli_token', '3a4341bef97b141b079fa96160826d2e5c157185bbd38d2073ca5190ca82e125', '[\"*\"]', '2025-11-06 10:42:20', NULL, '2025-11-06 10:39:58', '2025-11-06 10:42:20'),
(99, 'App\\Models\\User', 1, 'autoboli_token', '8103047d4efa867f6127607cf143dd22d74522a31b1be1bc75b5c0f6013b329f', '[\"*\"]', NULL, NULL, '2025-11-07 06:15:07', '2025-11-07 06:15:07'),
(100, 'App\\Models\\User', 1, 'autoboli_token', '546a9995bcf2c301e652adbda5f5ee00aa2dfdbffb755498077b59cb160e9253', '[\"*\"]', '2025-12-26 08:30:00', NULL, '2025-11-07 06:19:42', '2025-12-26 08:30:00'),
(101, 'App\\Models\\User', 1, 'autoboli_token', '9afc03a52703d039c331e4ec0c8d5a11c7db3ba308f7ef6d84c642fc26a01ee5', '[\"*\"]', '2025-11-07 06:37:18', NULL, '2025-11-07 06:37:10', '2025-11-07 06:37:18'),
(102, 'App\\Models\\User', 1, 'autoboli_token', '5aafeea8468f291852e8b268eb0d7f59e017275aac829d6ea13fc605d703c6ae', '[\"*\"]', '2025-11-07 08:37:07', NULL, '2025-11-07 06:54:34', '2025-11-07 08:37:07'),
(103, 'App\\Models\\User', 1, 'autoboli_token', '312d53aa0d53b59da0d4b2f45d6f7ee3403d2c1178b9aa49651f3a0bb249c7ef', '[\"*\"]', '2025-11-07 10:14:04', NULL, '2025-11-07 08:38:34', '2025-11-07 10:14:04'),
(104, 'App\\Models\\User', 1, 'autoboli_token', '5714b3205dc0bc1d720a2cb8cf51fe15f5bd435f81e5a1627fca8e952800c39d', '[\"*\"]', '2025-11-10 11:01:43', NULL, '2025-11-10 07:01:24', '2025-11-10 11:01:43'),
(105, 'App\\Models\\User', 1, 'autoboli_token', '476359bb6ab5e7e938eaccdeba16b2c71a58fc14b8b3e65757ed0814c385173f', '[\"*\"]', '2025-11-11 06:07:57', NULL, '2025-11-11 05:14:09', '2025-11-11 06:07:57'),
(106, 'App\\Models\\User', 1, 'autoboli_token', '6c91205c2a167abf3fe72b315e717b89aac44686b62a7ae39605479b2d8e03cc', '[\"*\"]', '2025-11-11 06:54:14', NULL, '2025-11-11 06:41:46', '2025-11-11 06:54:14'),
(107, 'App\\Models\\User', 1, 'autoboli_token', 'a1e69db0e3d438bba7a9b251dff10f60a548a951d1fa545707491596ba2d8dc0', '[\"*\"]', '2025-11-11 09:23:13', NULL, '2025-11-11 07:44:39', '2025-11-11 09:23:13'),
(108, 'App\\Models\\User', 48, 'autoboli_token', '994c34c1f95157e86c8e0251381a658cdb72db5c72393b1cdc29722c119cd593', '[\"*\"]', NULL, NULL, '2025-11-11 11:53:45', '2025-11-11 11:53:45'),
(109, 'App\\Models\\User', 49, 'autoboli_token', '20bbacb014950fe3b4518de2d2f5ac8251c3bdbcd7a099ef2f38d37949e7d7f7', '[\"*\"]', NULL, NULL, '2025-11-11 11:56:46', '2025-11-11 11:56:46'),
(110, 'App\\Models\\User', 50, 'autoboli_token', '1e773249fb85cdb9331f6ad554789ad7125631c81e6baff888976d3b049d6e91', '[\"*\"]', NULL, NULL, '2025-11-11 12:01:12', '2025-11-11 12:01:12'),
(111, 'App\\Models\\User', 1, 'autoboli_token', '9514318dbe0e7ff30bd2933aa6e3dc56f58892702de1f5e6f614b912d02c5e93', '[\"*\"]', '2025-11-12 05:04:42', NULL, '2025-11-12 05:01:08', '2025-11-12 05:04:42'),
(112, 'App\\Models\\User', 1, 'autoboli_token', '3cc9c2028d467da3d1799cde65e757dfa9ac5c49b8f80f1a88cce6950c3c18b8', '[\"*\"]', NULL, NULL, '2025-11-12 05:22:19', '2025-11-12 05:22:19'),
(113, 'App\\Models\\User', 1, 'autoboli_token', 'b472c2bfc9c0eb97f356ffa71d41d96c95a1869e83b60f28a4445e715812675b', '[\"*\"]', NULL, NULL, '2025-11-12 05:22:37', '2025-11-12 05:22:37'),
(114, 'App\\Models\\User', 1, 'autoboli_token', 'de28175a49abac6bb49b760f91f084c893c0390161b35518bea47e8e8aa579b8', '[\"*\"]', '2025-11-12 05:56:26', NULL, '2025-11-12 05:22:59', '2025-11-12 05:56:26'),
(115, 'App\\Models\\User', 51, 'autoboli_token', 'c43acd38e54734e3ad01b28a1bd46ba9540ba9fceb7a01627581e6288890810f', '[\"*\"]', NULL, NULL, '2025-11-12 07:04:25', '2025-11-12 07:04:25'),
(116, 'App\\Models\\User', 52, 'autoboli_token', '958d12fb69c1285728b38ef335da505b7042550f636664853484d7e044ea8b3b', '[\"*\"]', NULL, NULL, '2025-11-12 07:25:48', '2025-11-12 07:25:48'),
(117, 'App\\Models\\User', 53, 'autoboli_token', '614c4b1f2c7c682e8c60874d969be4ca2783b54fe3e20b17cf78ae2173642e2c', '[\"*\"]', NULL, NULL, '2025-11-12 07:27:22', '2025-11-12 07:27:22'),
(118, 'App\\Models\\User', 1, 'autoboli_token', '24eea66865501a861de5e9af91b863c572b04f51ee16633bedc2ae8de7a03ef7', '[\"*\"]', '2025-11-12 09:20:15', NULL, '2025-11-12 09:09:35', '2025-11-12 09:20:15'),
(119, 'App\\Models\\User', 1, 'autoboli_token', '1b4b6ceebd0e70086018c4a8846427a61dc411daa31c3eba84f739e72674b73e', '[\"*\"]', '2025-11-12 10:29:47', NULL, '2025-11-12 10:26:29', '2025-11-12 10:29:47'),
(120, 'App\\Models\\User', 1, 'autoboli_token', '784c635cf2642c5c1439fcdfe76f43ae6abf57848de8ce5b3cd21639ab7eefda', '[\"*\"]', '2025-11-12 10:32:05', NULL, '2025-11-12 10:32:05', '2025-11-12 10:32:05'),
(121, 'App\\Models\\User', 1, 'autoboli_token', '5feb652e066093e94b178be524bcc914d9425678861196b5dc87bd860b79742c', '[\"*\"]', '2025-11-13 05:46:11', NULL, '2025-11-12 11:43:46', '2025-11-13 05:46:11'),
(122, 'App\\Models\\User', 54, 'autoboli_token', '12f726b0eca94efde74caf1c8bfab50be783819d651e63aded725dc41597c382', '[\"*\"]', '2025-11-13 05:50:40', NULL, '2025-11-13 05:48:33', '2025-11-13 05:50:40'),
(123, 'App\\Models\\User', 1, 'autoboli_token', 'd06670678569e0cb897d2ba62aaafac9c2e3a549f2d6757e900a8d24cb8b131e', '[\"*\"]', '2025-11-13 05:51:18', NULL, '2025-11-13 05:51:18', '2025-11-13 05:51:18'),
(124, 'App\\Models\\User', 1, 'autoboli_token', '78a475e43416db12c3f467fb4f2b1bb08b4144ef8eeb69be9343bc63fa0af88f', '[\"*\"]', '2025-11-13 05:52:29', NULL, '2025-11-13 05:52:29', '2025-11-13 05:52:29'),
(125, 'App\\Models\\User', 1, 'autoboli_token', 'db53da34b351a0353522b9ddb0acb1c71a64615b7673e3122ed07f3604485dca', '[\"*\"]', '2025-11-13 05:52:57', NULL, '2025-11-13 05:52:57', '2025-11-13 05:52:57'),
(126, 'App\\Models\\User', 1, 'autoboli_token', '715f2db3619f74b889435435df7d2d6df3874d82becf8cb878fc7ed1ce625a72', '[\"*\"]', '2025-11-14 10:58:13', NULL, '2025-11-13 05:53:35', '2025-11-14 10:58:13'),
(127, 'App\\Models\\User', 1, 'autoboli_token', '4473876021a0039a1129bba08de4a740685a9bb0ea2728945844f936394d4d7a', '[\"*\"]', '2025-11-14 11:02:26', NULL, '2025-11-14 10:58:49', '2025-11-14 11:02:26'),
(128, 'App\\Models\\User', 1, 'autoboli_token', 'a5eb6e79f0ac76904ef8b6295447f77599ad2860a87e8928ddafc186011b591c', '[\"*\"]', '2025-11-14 11:14:22', NULL, '2025-11-14 11:02:39', '2025-11-14 11:14:22'),
(129, 'App\\Models\\User', 1, 'autoboli_token', '62c515e0678bc6e1b459f8e5c84f4198fe954f5dea6e0e2e22b03a410eceb8ca', '[\"*\"]', '2025-11-26 06:33:32', NULL, '2025-11-14 11:15:28', '2025-11-26 06:33:32'),
(130, 'App\\Models\\User', 1, 'autoboli_token', '5e87d89f080c93c78c7aa3f59605006e484878862d98c6e63e0bd0380d20e924', '[\"*\"]', '2025-11-24 06:20:21', NULL, '2025-11-24 05:57:30', '2025-11-24 06:20:21'),
(131, 'App\\Models\\User', 1, 'autoboli_token', 'f9e39c8b72f20af0222ab58571962fd67634b99fe3b8240eaf5d3807ad1b384d', '[\"*\"]', '2025-12-17 07:39:04', NULL, '2025-11-24 06:03:04', '2025-12-17 07:39:04'),
(132, 'App\\Models\\User', 1, 'autoboli_token', '66b2e7df57e8b9796936ba195b8450c11900245cdfa9f5c01805c495d614a1cd', '[\"*\"]', '2025-11-24 06:11:36', NULL, '2025-11-24 06:11:35', '2025-11-24 06:11:36'),
(133, 'App\\Models\\User', 1, 'autoboli_token', '3c5a836d0c777c402bf64b83d01c3e56d23695f962712af8b7ed426c49fa1a87', '[\"*\"]', '2025-12-01 05:20:41', NULL, '2025-11-26 06:40:50', '2025-12-01 05:20:41'),
(134, 'App\\Models\\User', 1, 'autoboli_token', '0229fc439d434d2cffa1877e17f78e423612ad38e88ec200ece77be6e9f7543e', '[\"*\"]', '2025-12-03 08:41:55', NULL, '2025-12-01 05:26:07', '2025-12-03 08:41:55'),
(135, 'App\\Models\\User', 1, 'autoboli_token', 'b6da40628244b9a7f3bef5c50b1c97156c03399420a3e57737a24ee677303be6', '[\"*\"]', '2025-12-01 10:46:23', NULL, '2025-12-01 10:43:27', '2025-12-01 10:46:23'),
(136, 'App\\Models\\User', 1, 'autoboli_token', '68c395cdedf7be4e48a69d303f630f62f52facf553bcf4ae16405cd253084e5e', '[\"*\"]', '2025-12-05 07:58:07', NULL, '2025-12-03 09:37:15', '2025-12-05 07:58:07'),
(137, 'App\\Models\\User', 1, 'autoboli_token', '1c64891cca0554104c9eec3b7d80ef5e9e2986b5928218eaa2d75a9cd5cc9032', '[\"*\"]', '2025-12-05 08:39:38', NULL, '2025-12-05 08:04:49', '2025-12-05 08:39:38'),
(138, 'App\\Models\\User', 1, 'autoboli_token', '49501aacf61b976e58a0fede060c42edba7dc7474f543c4acc483d08744651a9', '[\"*\"]', '2025-12-08 06:21:38', NULL, '2025-12-05 08:47:24', '2025-12-08 06:21:38'),
(139, 'App\\Models\\User', 1, 'autoboli_token', '081df3216acb3955efb2797f1b1c17fd74d75f28a569df3aab3268e36a1f75f5', '[\"*\"]', '2025-12-08 10:29:49', NULL, '2025-12-08 06:21:42', '2025-12-08 10:29:49'),
(140, 'App\\Models\\User', 1, 'autoboli_token', 'ef0b13fa05174c6b15865e7af87527cb9f9e8dc84a4ef2e1bb0211baa6506df5', '[\"*\"]', '2025-12-08 10:37:01', NULL, '2025-12-08 10:34:17', '2025-12-08 10:37:01'),
(141, 'App\\Models\\User', 1, 'autoboli_token', 'df83bfb2308ea07a16104e2d9c6d6fe6716cafc7b4613281239e0b697150f135', '[\"*\"]', '2025-12-09 03:58:13', NULL, '2025-12-09 03:58:12', '2025-12-09 03:58:13'),
(142, 'App\\Models\\User', 1, 'autoboli_token', '4837a6f7ad4ecc413aebb1e5619bb721045d13f1ab274af8d1fa67098f871d98', '[\"*\"]', '2025-12-09 04:24:19', NULL, '2025-12-09 04:21:48', '2025-12-09 04:24:19'),
(143, 'App\\Models\\User', 1, 'autoboli_token', '1345e36bd68c80ac16e7918271954457f98e8524b6d75020fac8707544abc1e1', '[\"*\"]', '2025-12-09 08:21:41', NULL, '2025-12-09 04:31:22', '2025-12-09 08:21:41'),
(144, 'App\\Models\\User', 1, 'autoboli_token', '07be8e577b6b33c5ddd27cd1658a6cce22b41877d9287358e351b03fad095d7e', '[\"*\"]', '2025-12-15 06:43:46', NULL, '2025-12-09 08:21:52', '2025-12-15 06:43:46'),
(145, 'App\\Models\\User', 1, 'autoboli_token', 'a85cb273a686e335b04829e07adc506394b675406b92a7aa07d0aff90bcb25aa', '[\"*\"]', '2025-12-15 07:52:56', NULL, '2025-12-15 07:52:54', '2025-12-15 07:52:56'),
(146, 'App\\Models\\User', 1, 'autoboli_token', '7ba115bbcd4cb430c8870ef0ab690ee903e6808e82512bd07e18797309998d93', '[\"*\"]', '2025-12-16 08:39:50', NULL, '2025-12-15 07:53:52', '2025-12-16 08:39:50'),
(147, 'App\\Models\\User', 1, 'autoboli_token', '6b04efd439ca17d6d9c001e23a41aa1f69e7125cc5996a9368378415b23bd88f', '[\"*\"]', '2025-12-17 10:49:30', NULL, '2025-12-16 08:39:53', '2025-12-17 10:49:30'),
(148, 'App\\Models\\User', 1, 'autoboli_token', '326ff731fbb1f0a6b014f62bbb8a995a4e1e83317e45ce06abbea227c94efb9b', '[\"*\"]', '2025-12-16 11:46:58', NULL, '2025-12-16 11:43:22', '2025-12-16 11:46:58'),
(149, 'App\\Models\\User', 1, 'autoboli_token', 'eded2a84d87664ec057db6ce3a01f94ae17276d97398c8a309114cc7034f5c83', '[\"*\"]', '2025-12-17 10:58:10', NULL, '2025-12-17 10:53:19', '2025-12-17 10:58:10'),
(150, 'App\\Models\\User', 1, 'autoboli_token', 'e3dd22c38c6d40e4043c6f77dc4e203837e93951c9ba4043417b6870f267e8f2', '[\"*\"]', '2025-12-17 11:19:41', NULL, '2025-12-17 10:58:18', '2025-12-17 11:19:41'),
(151, 'App\\Models\\User', 1, 'autoboli_token', 'a7cfbd48ecb19818a076e596f6040447d642e25c74f0db6ef1c61e4daed3e974', '[\"*\"]', '2025-12-18 06:47:37', NULL, '2025-12-17 11:20:06', '2025-12-18 06:47:37'),
(152, 'App\\Models\\User', 1, 'autoboli_token', '7cbff9e574d3a6209e8655288679aaf75fba73cabbac953da4ae316e2ffa9414', '[\"*\"]', '2025-12-18 05:41:05', NULL, '2025-12-18 04:22:14', '2025-12-18 05:41:05'),
(153, 'App\\Models\\User', 1, 'autoboli_token', 'b12c956f9d551085a1cf133e40876e74d608e67a2cfb23a2d242bde83ec9df1c', '[\"*\"]', '2025-12-18 05:41:12', NULL, '2025-12-18 05:41:04', '2025-12-18 05:41:12'),
(154, 'App\\Models\\User', 1, 'autoboli_token', '02212bfbb780b80c5bf6f239af529c8d68c347017cfd64c422500774cee96edf', '[\"*\"]', '2025-12-18 08:32:06', NULL, '2025-12-18 07:02:07', '2025-12-18 08:32:06'),
(155, 'App\\Models\\User', 1, 'autoboli_token', '075818f07262073b4b11fdb14b001000e451289936c46e6e9fe432291a29aeee', '[\"*\"]', NULL, NULL, '2025-12-18 07:04:34', '2025-12-18 07:04:34'),
(156, 'App\\Models\\User', 1, 'autoboli_token', 'ffa614ff52519a2dcbf4aa7e702e752b8d4235071136f678cc5102e51c9b2aee', '[\"*\"]', NULL, NULL, '2025-12-18 08:02:18', '2025-12-18 08:02:18'),
(157, 'App\\Models\\User', 1, 'autoboli_token', '417f14a6da50becc3eba2448c7e3d600776c676add4517d237c9cc03ca79f650', '[\"*\"]', '2025-12-19 06:04:21', NULL, '2025-12-18 08:38:08', '2025-12-19 06:04:21'),
(158, 'App\\Models\\User', 1, 'autoboli_token', 'ddb9331d3fcae2dececb4fdfb5dc9c15a71ddc6f6a653c64f77483687836bc0e', '[\"*\"]', '2025-12-19 06:15:59', NULL, '2025-12-19 06:07:52', '2025-12-19 06:15:59'),
(159, 'App\\Models\\User', 1, 'autoboli_token', 'ac38052c424faaf27ca4dcc58dfb01138b253de7e5c72629a9e5b48ec25bd868', '[\"*\"]', '2025-12-19 06:55:00', NULL, '2025-12-19 06:16:22', '2025-12-19 06:55:00'),
(160, 'App\\Models\\User', 1, 'autoboli_token', 'ef80a4ec57937f6d2cd3b380854ab73ebbaa56903d271e4fb89a12a8e3da51c1', '[\"*\"]', '2025-12-19 07:04:08', NULL, '2025-12-19 06:56:04', '2025-12-19 07:04:08'),
(161, 'App\\Models\\User', 1, 'autoboli_token', '276021f88b9006b9e18ebcacdacad4614b958918048fb229a9e3cde4c294f1b7', '[\"*\"]', '2025-12-19 11:27:27', NULL, '2025-12-19 07:08:07', '2025-12-19 11:27:27'),
(162, 'App\\Models\\User', 1, 'autoboli_token', 'ee495535524b5cb54347eec09d23a598359979f41ae4518f9a1724d60e422d19', '[\"*\"]', '2025-12-22 03:51:14', NULL, '2025-12-22 03:24:15', '2025-12-22 03:51:14'),
(163, 'App\\Models\\User', 1, 'autoboli_token', '877f9498f9cdd4fb1c15fd8da0a8a6cb2905b60c8be77c7492cc86ef2f028ebb', '[\"*\"]', '2025-12-22 04:24:43', NULL, '2025-12-22 03:51:47', '2025-12-22 04:24:43'),
(164, 'App\\Models\\User', 1, 'autoboli_token', '7d4927e85b21556ca501db6c9d5e282b81de4d3e5974d3ecf93a537f590ea95f', '[\"*\"]', '2025-12-22 05:18:05', NULL, '2025-12-22 04:25:27', '2025-12-22 05:18:05'),
(165, 'App\\Models\\User', 1, 'autoboli_token', '7b810e730a6e54fa003a34ea6ab3bdba9ffd2b41149749716ee1d12aa7188b07', '[\"*\"]', '2025-12-22 06:39:33', NULL, '2025-12-22 05:20:23', '2025-12-22 06:39:33'),
(166, 'App\\Models\\User', 1, 'autoboli_token', '6a18417bfd5f31ff3467cf6f0d68c7abcb29636db0f75c1d320756d75807f40e', '[\"*\"]', '2025-12-22 07:25:35', NULL, '2025-12-22 06:42:23', '2025-12-22 07:25:35'),
(167, 'App\\Models\\User', 1, 'autoboli_token', '810aa37e8c92a405102f4f980d5727b579ab49f1afa6f0ce524e637f2bc874da', '[\"*\"]', '2025-12-23 06:29:54', NULL, '2025-12-22 07:26:59', '2025-12-23 06:29:54'),
(168, 'App\\Models\\User', 1, 'autoboli_token', '6fcf16dd9aadf9e63da3725957a4dba6e8aa8f108c0cf10e28e6c157e6bc75ad', '[\"*\"]', '2025-12-23 08:31:22', NULL, '2025-12-23 07:26:02', '2025-12-23 08:31:22'),
(169, 'App\\Models\\User', 1, 'autoboli_token', 'aa4bba6cb69de7fe78181cbd6bd15a0b194cf5c48254a82131534b7f79c6950e', '[\"*\"]', NULL, NULL, '2025-12-23 08:03:48', '2025-12-23 08:03:48'),
(170, 'App\\Models\\User', 1, 'autoboli_token', '6e0d8d505b58ee8fddbe844124acbfa13f6475232ab40cb757f9e70064cdd160', '[\"*\"]', '2025-12-24 01:29:02', NULL, '2025-12-23 08:43:47', '2025-12-24 01:29:02'),
(171, 'App\\Models\\User', 1, 'autoboli_token', 'e56282f6ac230867d1d30467730b94af3dc684d5f29aa5161725969131e8b58a', '[\"*\"]', '2025-12-24 04:05:45', NULL, '2025-12-24 01:29:07', '2025-12-24 04:05:45'),
(172, 'App\\Models\\User', 1, 'autoboli_token', '4d1db3a4f7d821c171756b5c2151d688d846c0583b811287f4d9cc689d4b012a', '[\"*\"]', '2025-12-24 09:02:04', NULL, '2025-12-24 05:06:20', '2025-12-24 09:02:04'),
(173, 'App\\Models\\User', 1, 'autoboli_token', '693f2761072ed86c36d1e22b6d1668e20ba6e958b7dd8c433480be8798fc7dbd', '[\"*\"]', '2025-12-26 05:57:53', NULL, '2025-12-24 09:06:46', '2025-12-26 05:57:53'),
(174, 'App\\Models\\User', 1, 'autoboli_token', '1028b9e99f4b10f5ce390cc1cd186f1f183ea08f675bfc8fcfcde8aa4ab3ce7c', '[\"*\"]', NULL, NULL, '2025-12-26 05:57:55', '2025-12-26 05:57:55'),
(175, 'App\\Models\\User', 1, 'autoboli_token', 'bf9a8bce253e988cf94d7855ce77e1a15c4f100fc4788b9f761cc29b912347e9', '[\"*\"]', '2025-12-29 02:21:28', NULL, '2025-12-26 05:58:00', '2025-12-29 02:21:28'),
(176, 'App\\Models\\User', 1, 'autoboli_token', 'b6d1db3b951344348686616021b180a4cd2a9b3bfacb15d3785f54df7b128709', '[\"*\"]', '2025-12-29 03:29:52', NULL, '2025-12-29 02:21:31', '2025-12-29 03:29:52'),
(177, 'App\\Models\\User', 1, 'autoboli_token', '6d9040208b348490b853dd0d35e000114b6a54e577b23cb56a5b36ea25342ebf', '[\"*\"]', NULL, NULL, '2025-12-29 04:56:17', '2025-12-29 04:56:17'),
(178, 'App\\Models\\User', 1, 'autoboli_token', '40970900fbcec138c64a0adff626b6c62cf0f921baba73865a4846b44fa49615', '[\"*\"]', NULL, NULL, '2025-12-29 04:56:25', '2025-12-29 04:56:25'),
(179, 'App\\Models\\User', 1, 'autoboli_token', '5cb343ff499f580f1fe8ef9be2743461d2fafc077cf66bf09dd7eea8f10ae51c', '[\"*\"]', NULL, NULL, '2025-12-29 04:57:10', '2025-12-29 04:57:10'),
(180, 'App\\Models\\User', 1, 'autoboli_token', '9ddccdb3040e80d0690fff299ab7a201ce8829d67c15012f840feed77eefa9df', '[\"*\"]', NULL, NULL, '2025-12-29 04:57:54', '2025-12-29 04:57:54'),
(181, 'App\\Models\\User', 1, 'autoboli_token', 'ae66e07883ef1d649b45907643381c1629443fed46072457c5ee10635abda64a', '[\"*\"]', NULL, NULL, '2025-12-29 04:58:12', '2025-12-29 04:58:12'),
(182, 'App\\Models\\User', 1, 'autoboli_token', 'db31133cc6a07f21b3f224884296eee37441fb44203a1f5d385361e473892414', '[\"*\"]', NULL, NULL, '2025-12-29 04:58:28', '2025-12-29 04:58:28'),
(183, 'App\\Models\\User', 1, 'autoboli_token', '0399ee6c928d0a584c23658df203994f743e21af5d3a00150b08b534918317b7', '[\"*\"]', NULL, NULL, '2025-12-30 06:52:22', '2025-12-30 06:52:22'),
(184, 'App\\Models\\User', 1, 'autoboli_token', '9d680d2af38fb3916717aa26c3ed1222068c9c5d0193f395ca3de36e0e7116c2', '[\"*\"]', NULL, NULL, '2025-12-30 07:00:10', '2025-12-30 07:00:10'),
(185, 'App\\Models\\User', 1, 'autoboli_token', '16ca9fc615fd8d6fc7c6bf8da9d2e3e2ec54eaba87e452591a4b064d61ca0a8a', '[\"*\"]', NULL, NULL, '2025-12-30 07:16:54', '2025-12-30 07:16:54'),
(186, 'App\\Models\\User', 1, 'autoboli_token', 'f4d07965916facf0be18aac72e62068a8d969bd3ba9211b8a9fba5c8e6367270', '[\"*\"]', '2026-01-03 02:07:58', NULL, '2026-01-03 02:07:41', '2026-01-03 02:07:58'),
(187, 'App\\Models\\User', 1, 'autoboli_token', 'f2303e37d3e00fc47ead2c23d148441bca96a14856bea9dadf4c74ecb4333a96', '[\"*\"]', '2026-01-03 02:23:10', NULL, '2026-01-03 02:10:00', '2026-01-03 02:23:10'),
(188, 'App\\Models\\User', 1, 'autoboli_token', 'b2419707816ed6ade4aa996e1bcf7551efa932506e1c464550aeb9f8c0a49a33', '[\"*\"]', NULL, NULL, '2026-01-03 02:23:36', '2026-01-03 02:23:36'),
(189, 'App\\Models\\User', 1, 'autoboli_token', '17a57058ac7bfb2f49b0517ffd7ea8058d90116ac64f351f336ab0482f3ef11b', '[\"*\"]', '2026-01-03 02:40:21', NULL, '2026-01-03 02:24:59', '2026-01-03 02:40:21'),
(190, 'App\\Models\\User', 1, 'autoboli_token', '595ea6ef9682b0505ee2aa1c94d274e83a037e50fed4ef304104c64dfc8b0d9e', '[\"*\"]', '2026-01-03 02:50:10', NULL, '2026-01-03 02:40:27', '2026-01-03 02:50:10'),
(191, 'App\\Models\\User', 1, 'autoboli_token', '051731694a6398e3bf08043a0ab5989a29dcdf0bff9fa1cfdecb91d51dae5956', '[\"*\"]', NULL, NULL, '2026-01-03 02:50:47', '2026-01-03 02:50:47'),
(192, 'App\\Models\\User', 1, 'autoboli_token', '1c28f97698d38de9c12c023e17cb84bdb7c70291d60c0ad56b4bb9147ee08694', '[\"*\"]', '2026-01-03 03:15:27', NULL, '2026-01-03 02:50:53', '2026-01-03 03:15:27'),
(193, 'App\\Models\\User', 1, 'autoboli_token', 'e00638f25b86d3bdbc9ff8fa6b417944322fafd947667fe14e0b9ab6f164865c', '[\"*\"]', '2026-01-03 03:18:01', NULL, '2026-01-03 03:15:41', '2026-01-03 03:18:01'),
(194, 'App\\Models\\User', 1, 'autoboli_token', '4ea451188b1047494c9e3a0c943af49cb8d9e89c01062357337b19225e7da9f0', '[\"*\"]', NULL, NULL, '2026-01-03 03:18:27', '2026-01-03 03:18:27'),
(195, 'App\\Models\\User', 1, 'autoboli_token', 'a8f29cfd4dc4773360ac113f2d42bf3325f90783ba42074078cfcd9be28e04da', '[\"*\"]', NULL, NULL, '2026-01-03 03:18:34', '2026-01-03 03:18:34'),
(196, 'App\\Models\\User', 1, 'autoboli_token', '34fce4623c3439ca97905d40c1e54245516babc0cc0ff50d223e17e46ccdb568', '[\"*\"]', '2026-01-03 03:20:02', NULL, '2026-01-03 03:19:25', '2026-01-03 03:20:02'),
(197, 'App\\Models\\User', 1, 'autoboli_token', 'a3a89294752516e71b97211d3b33323d17b6b4bb502d21a9a78d30b5e0cb8535', '[\"*\"]', '2026-01-03 03:21:32', NULL, '2026-01-03 03:21:26', '2026-01-03 03:21:32'),
(198, 'App\\Models\\User', 1, 'autoboli_token', '6a257dbd5cf81c6c7bd41d5f289d8558a95fb3fa95c1adce8f7e8f4714384bed', '[\"*\"]', '2026-01-03 03:22:00', NULL, '2026-01-03 03:21:50', '2026-01-03 03:22:00'),
(199, 'App\\Models\\User', 1, 'autoboli_token', 'ca50614cd08258c2b8956fde2f03b1db9d42519d2bb5d86b3d7df05c26ae6054', '[\"*\"]', '2026-01-03 03:22:09', NULL, '2026-01-03 03:22:09', '2026-01-03 03:22:09'),
(200, 'App\\Models\\User', 1, 'autoboli_token', '22744c8d731c358da47f126a8ddeabf282d678173c322b786f1a4539d97b71e2', '[\"*\"]', '2026-01-03 03:22:50', NULL, '2026-01-03 03:22:50', '2026-01-03 03:22:50'),
(201, 'App\\Models\\User', 1, 'autoboli_token', 'b88b81bd6a0530ebe98e78168f7f6a9e9337e975b34437027cc0533ffb66d202', '[\"*\"]', '2026-01-03 03:22:56', NULL, '2026-01-03 03:22:55', '2026-01-03 03:22:56'),
(202, 'App\\Models\\User', 1, 'autoboli_token', '5aeb4260139e4f250ca2810749c6f14c253c487b9fcf6da95843086e64f5d09b', '[\"*\"]', '2026-01-03 03:38:31', NULL, '2026-01-03 03:23:37', '2026-01-03 03:38:31');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `slug` text NOT NULL,
  `price` double DEFAULT NULL,
  `selling_price` double DEFAULT NULL,
  `sku` text DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subchildcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `images` text DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `hover_image` text DEFAULT NULL,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `is_popular` tinyint(4) NOT NULL DEFAULT 0,
  `details` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `is_enable` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `price`, `selling_price`, `sku`, `category_id`, `subcategory_id`, `subchildcategory_id`, `brand_id`, `tags`, `image`, `images`, `type`, `hover_image`, `is_featured`, `is_popular`, `details`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `is_enable`, `created_at`, `updated_at`) VALUES
(24, 'ARISTOCRAT HER', 'aristocrat-her', 1200, 1500, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684820d93bc30.jpg', 'filemanager/684820d93bc30.jpg,filemanager/684820e8b7170.jpg,filemanager/684820f50dab8.jpg', NULL, 'filemanager/684820f50dab8.jpg', 0, 1, NULL, '<p><br data-mce-bogus=\"1\"></p>', 'ARISTOCRAT HER', NULL, 'ARISTOCRAT HER', 1, '2025-06-10 12:11:42', '2025-06-10 12:12:42'),
(22, 'AMBER MUSC', 'amber-musc', 12000, 15000, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68481d142a1e0.jpg', 'filemanager/68481d142a1e0.jpg,filemanager/68481d1fb3fc8.jpg,filemanager/68481d2a5bf7b.jpg', NULL, 'filemanager/68481d1fb3fc8.jpg', 0, 1, NULL, NULL, 'AMBER MUSC', NULL, 'AMBER MUSC', 1, '2025-06-10 11:55:30', '2025-06-10 11:56:33'),
(23, 'AMBER WOOD', 'amber-wood', 12000, 15000, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68481dbc2c378.jpg', 'filemanager/68481dbc2c378.jpg,filemanager/68481dc4b7122.jpg,filemanager/68481dce4d797.jpg', NULL, 'filemanager/68481dc4b7122.jpg', 0, 1, NULL, NULL, 'AMBER WOOD', NULL, 'AMBER WOOD', 1, '2025-06-10 11:58:12', '2025-06-10 11:59:12'),
(25, 'ARISTOCRAT HIM', 'aristocrat-him', 12000, 15000, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684822f163872.jpg', 'filemanager/684822f162fb0.jpg,filemanager/684822f16349f.jpg,filemanager/684822f163872.jpg', NULL, 'filemanager/684822f16349f.jpg', 0, 1, NULL, '<p><br data-mce-bogus=\"1\"></p>', 'ARISTOCRAT HIM', NULL, 'ARISTOCRAT HIM', 1, '2025-06-10 12:20:08', '2025-06-10 12:20:59'),
(26, 'ARISTOCRAT PLATINUM', 'aristocrat-platinum', 12000, 15000, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68482374387c3.jpg', 'filemanager/68482374387c3.jpg,filemanager/6848237438ca8.jpg,filemanager/68482374390ca.jpg', NULL, 'filemanager/6848237438ca8.jpg', 0, 1, NULL, NULL, 'ARISTOCRAT PLATINUM', NULL, 'ARISTOCRAT PLATINUM', 1, '2025-06-10 12:22:20', '2025-06-10 12:23:08'),
(27, 'AURUM', 'aurum', 12000, 15000, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684823ea0d0dc.jpg', 'filemanager/684823ea0c4e2.jpg,filemanager/684823ea0cac9.jpg,filemanager/684823ea0d0dc.jpg', NULL, 'filemanager/684823ea0c4e2.jpg', 0, 1, NULL, '<p><br data-mce-bogus=\"1\"></p>', 'AURUM', NULL, 'AURUM', 1, '2025-06-10 12:24:12', '2025-06-10 12:24:57'),
(28, 'AURUM MINIATURE', 'aurum-miniature', 12000, 15000, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/6848245f4e111.jpg', 'filemanager/6848245f4d865.jpg,filemanager/6848245f4dd17.jpg,filemanager/6848245f4e111.jpg', NULL, 'filemanager/6848245f4d865.jpg', 0, 1, NULL, '<p><br data-mce-bogus=\"1\"></p>', 'AURUM MINIATURE', NULL, 'AURUM MINIATURE', 1, '2025-06-10 12:26:12', '2025-06-10 12:26:59'),
(29, 'AURUM SUMMER', 'aurum-summer', 14000, 16000, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684824cd0ac1a.jpg', 'filemanager/684824cd0a41f.jpg,filemanager/684824cd0a84b.jpg,filemanager/684824cd0ac1a.jpg', NULL, 'filemanager/684824cd0a41f.jpg', 0, 1, NULL, '<p><br data-mce-bogus=\"1\"></p>', 'AURUM SUMMER', NULL, 'AURUM SUMMER', 1, '2025-06-10 12:28:03', '2025-06-10 12:29:31'),
(30, 'BLU BY AJMAL', 'blu-by-ajmal', 14000, 13000, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68497fd872030.jpg', 'filemanager/68497fd872030.jpg,filemanager/68497fd87251c.jpg,filemanager/68497fd8728a4.jpg', NULL, 'filemanager/68497fd87251c.jpg', 0, 1, NULL, '<p><br data-mce-bogus=\"1\"></p>', 'BLU BY AJMAL', NULL, 'BLU BY AJMAL', 1, '2025-06-11 13:08:44', '2025-06-11 13:09:29'),
(31, 'BLU MINIATURE', 'blu-miniature', 342342, 234234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498036975f4.jpg', 'filemanager/68498036971e7.jpg,filemanager/68498036975f4.jpg,filemanager/6849803697949.jpg', NULL, 'filemanager/68498036971e7.jpg', 0, 1, NULL, NULL, 'BLU MINIATURE', NULL, 'BLU MINIATURE', 1, '2025-06-11 13:10:17', '2025-06-11 13:11:29'),
(32, 'CARBON', 'carbon', 2123123, 123123123, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684980b024caa.jpg', ',filemanager/684980b024caa.jpg,filemanager/684980b02508a.jpg,filemanager/684980b0253b0.jpg', NULL, 'filemanager/684980b0253b0.jpg', 0, 1, NULL, NULL, 'CARBON', NULL, 'CARBON', 1, '2025-06-11 13:11:54', '2025-06-11 13:12:39'),
(33, 'CASHMERE MUSC', 'cashmere-musc', 23234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684981008bb13.jpg', ',filemanager/684981008b5bd.jpg,filemanager/684981008bf4e.jpg,filemanager/684981008c256.jpg', NULL, 'filemanager/684981008bf4e.jpg', 0, 1, NULL, NULL, 'CASHMERE MUSC', NULL, 'CASHMERE MUSC', 1, '2025-06-11 13:13:42', '2025-06-11 13:14:25'),
(34, 'CHIVALRY', 'chivalry', 23434234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498151bb095.jpg', ',filemanager/68498151babf5.jpg,filemanager/68498151bb095.jpg,filemanager/68498151bb47c.jpg', NULL, 'filemanager/68498151babf5.jpg', 0, 0, NULL, NULL, 'CHIVALRY', NULL, 'CHIVALRY', 1, '2025-06-11 13:15:01', '2025-06-11 13:15:30'),
(35, 'CUIR MUSC', 'cuir-musc', 234234, 23424, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/6849819d2bc5c.jpg', ',filemanager/6849819d2b58e.jpg,filemanager/6849819d2b956.jpg,filemanager/6849819d2bc5c.jpg', NULL, 'filemanager/6849819d2b956.jpg', 0, 0, NULL, NULL, 'CUIR MUSC', NULL, 'CUIR MUSC', 1, '2025-06-11 13:16:28', '2025-06-11 13:17:15'),
(36, 'DANAT AL DUNIYA', 'danat-al-duniya', 234234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684981fc764b9.jpg', 'filemanager/684981fc75c45.jpg,filemanager/684981fc760d7.jpg,filemanager/684981fc764b9.jpg', NULL, 'filemanager/684981fc760d7.jpg', 0, 0, NULL, NULL, 'DANAT AL DUNIYA', NULL, 'DANAT AL DUNIYA', 1, '2025-06-11 13:17:51', '2025-06-11 13:18:24'),
(37, 'ELIXIR INTENSE', 'elixir-intense', 12344, 324234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498298b8a3f.jpg', ',filemanager/68498298b8109.jpg,filemanager/68498298b8673.jpg,filemanager/68498298b8a3f.jpg', NULL, 'filemanager/68498298b8673.jpg', 0, 0, NULL, NULL, 'ELIXIR INTENSE', NULL, 'ELIXIR INTENSE', 1, '2025-06-11 13:20:31', '2025-06-11 13:21:25'),
(38, 'ELIXIR PRECIOUS', 'elixir-precious', 234234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684982f3f1aee.jpg', 'filemanager/684982f3f1aee.jpg,filemanager/684982f3f1f04.jpg,filemanager/684982f3f2226.jpg', NULL, 'filemanager/684982f3f1f04.jpg', 0, 0, NULL, NULL, 'ELIXIR PRECIOUS', NULL, 'ELIXIR PRECIOUS', 1, '2025-06-11 13:21:58', '2025-06-11 13:22:30'),
(39, 'ELIXIR SUAVE', 'elixir-suave', 4234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684983cb54bbe.jpg', 'filemanager/684983cb547b7.jpg,filemanager/684983cb54bbe.jpg,filemanager/684983cb54fdb.jpg', NULL, 'filemanager/684983cb547b7.jpg', 0, 0, NULL, NULL, 'ELIXIR SUAVE', NULL, 'ELIXIR SUAVE', 1, '2025-06-11 13:25:37', '2025-06-11 13:26:10'),
(40, 'EVOKE HIM', 'evoke-him', 234234, 23424, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498475235bb.jpg', 'filemanager/6849847522f4f.jpg,filemanager/68498475235bb.jpg,filemanager/6849847523985.jpg', NULL, 'filemanager/6849847522f4f.jpg', 0, 0, NULL, NULL, 'EVOKE HIM', NULL, 'EVOKE HIM', 1, '2025-06-11 13:28:26', '2025-06-11 13:28:59'),
(41, 'GOLD MAN', 'gold-man', 234234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684984ba46e78.jpg', 'filemanager/684984ba46a9e.jpg,filemanager/684984ba46e78.jpg,filemanager/684984ba471e0.jpg', NULL, 'filemanager/684984ba46a9e.jpg', 0, 0, NULL, NULL, 'GOLD MAN', NULL, 'GOLD MAN', 1, '2025-06-11 13:29:33', '2025-06-11 13:30:07'),
(42, 'GRAY', 'gray', 234234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684984fe0dd33.jpg', 'filemanager/684984fe0d8e4.jpg,filemanager/684984fe0dd33.jpg,filemanager/684984fe0e0e8.jpg', NULL, 'filemanager/684984fe0d8e4.jpg', 0, 0, NULL, NULL, 'GRAY', NULL, 'GRAY', 1, '2025-06-11 13:30:47', '2025-06-11 13:31:16'),
(43, 'HATKORA WOOD', 'hatkora-wood', 23453, 345345, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/6849853f17472.jpg', 'filemanager/6849853f1702f.jpg,filemanager/6849853f17472.jpg,filemanager/6849853f177b7.jpg', NULL, 'filemanager/6849853f1702f.jpg', 0, 0, NULL, NULL, 'HATKORA WOOD', NULL, 'HATKORA WOOD', 1, '2025-06-11 13:31:51', '2025-06-11 13:32:26'),
(44, 'INCENSE WOOD', 'incense-wood', 234234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/6849863f42a73.jpg', 'filemanager/6849863f42557.jpg,filemanager/6849863f42a73.jpg,filemanager/6849863f42d49.jpg', NULL, 'filemanager/6849863f42d49.jpg', 0, 0, NULL, NULL, 'INCENSE WOOD', NULL, 'INCENSE WOOD', 1, '2025-06-11 13:36:14', '2025-06-11 13:36:46'),
(45, 'KURO', 'kuro', 234234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/6849868ebe096.jpg', 'filemanager/6849868ebd833.jpg,filemanager/6849868ebdc61.jpg,filemanager/6849868ebe096.jpg', NULL, 'filemanager/6849868ebd833.jpg', 0, 0, NULL, NULL, 'KURO', NULL, 'KURO', 1, '2025-06-11 13:37:23', '2025-06-11 13:37:56'),
(46, 'MIZYAAN', 'mizyaan', 234234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684986cd7fa73.jpg', 'filemanager/684986cd7f203.jpg,filemanager/684986cd7f67f.jpg,filemanager/684986cd7fa73.jpg', NULL, 'filemanager/684986cd7f203.jpg', 0, 0, NULL, NULL, 'MIZYAAN', NULL, 'MIZYAAN', 1, '2025-06-11 13:38:24', '2025-06-11 13:39:01'),
(47, 'MUSK KHAS', 'musk-khas', 5345, 345345, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684987487bbd6.jpg', 'filemanager/684987487b22b.jpg,filemanager/684987487b6e4.jpg,filemanager/684987487bbd6.jpg', NULL, 'filemanager/684987487b22b.jpg', 0, 0, NULL, NULL, 'MUSK KHAS', NULL, 'MUSK KHAS', 1, '2025-06-11 13:40:42', '2025-06-11 13:41:06'),
(48, 'NEUTRON', 'neutron', 23424, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684987f22e55d.jpg', 'filemanager/684987f22dc22.jpg,filemanager/684987f22e146.jpg,filemanager/684987f22e55d.jpg', NULL, 'filemanager/684987f22dc22.jpg', 0, 0, NULL, NULL, 'NEUTRON', NULL, 'NEUTRON', 1, '2025-06-11 13:43:18', '2025-06-11 13:43:44'),
(49, 'PATCHOULI WOOD', 'patchouli-wood', 34234, 34234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/6849882898a4f.jpg', 'filemanager/6849882898a4f.jpg,filemanager/6849882898e6d.jpg,filemanager/6849882899193.jpg', NULL, 'filemanager/6849882899193.jpg', 0, 0, NULL, NULL, 'PATCHOULI WOOD', NULL, 'PATCHOULI WOOD', 1, '2025-06-11 13:44:13', '2025-06-11 13:46:13'),
(50, 'RAINDROPS', 'raindrops', 234234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/684988e2f29a5.jpg', 'filemanager/684988e2f29a5.jpg,filemanager/684988e2f2f15.jpg,filemanager/684988e2f3258.jpg', NULL, 'filemanager/684988e2f3258.jpg', 0, 0, NULL, NULL, 'RAINDROPS', NULL, 'RAINDROPS', 1, '2025-06-11 13:47:16', '2025-06-11 13:47:42'),
(51, 'RAINDROPS MINIATURE', 'raindrops-miniature', 324234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498a3290b58.jpg', 'filemanager/68498a3290791.jpg,filemanager/68498a3290b58.jpg,filemanager/68498a3290ec4.jpg', NULL, 'filemanager/68498a3290791.jpg', 0, 0, NULL, NULL, 'RAINDROPS MINIATURE', NULL, 'RAINDROPS MINIATURE', 1, '2025-06-11 13:52:56', '2025-06-11 13:53:28'),
(52, 'ROSE WOOD', 'rose-wood', 234234, 234234, NULL, 45, NULL, NULL, NULL, NULL, 'filemanager/68498a6d4d4f1.jpg', 'filemanager/68498a6d4d4f1.jpg,filemanager/68498a6d4d0a8.jpg,filemanager/68498a6d4d8fd.jpg', NULL, 'filemanager/68498a6d4d0a8.jpg', 0, 0, NULL, NULL, 'ROSE WOOD', NULL, 'ROSE WOOD', 1, '2025-06-11 13:53:52', '2025-06-11 13:54:21'),
(53, 'SACRED LOVE', 'sacred-love', 23423423, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498aa65a2a8.jpg', 'filemanager/68498aa65a2a8.jpg,filemanager/68498aa6597cd.jpg,filemanager/68498aa659d8c.jpg', NULL, 'filemanager/68498aa6597cd.jpg', 0, 0, NULL, NULL, 'SACRED LOVE', NULL, 'SACRED LOVE', 1, '2025-06-11 13:54:50', '2025-06-11 13:55:23'),
(54, 'SACRED LOVE MINIATURE', 'sacred-love-miniature', 234234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498ae02d6b2.jpg', 'filemanager/68498ae02d1cc.jpg,filemanager/68498ae02d6b2.jpg,filemanager/68498ae02da7b.jpg', NULL, 'filemanager/68498ae02d1cc.jpg', 0, 0, NULL, NULL, 'SACRED LOVE MINIATURE', NULL, 'SACRED LOVE MINIATURE', 1, '2025-06-11 13:55:49', '2025-06-11 13:56:19'),
(55, 'SANTAL WOOD', 'santal-wood', 45345, 345345, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498b27b289e.jpg', 'filemanager/68498b27b289e.jpg,filemanager/68498b27b2459.jpg,filemanager/68498b27b2c0d.jpg', NULL, 'filemanager/68498b27b2459.jpg', 1, 0, NULL, NULL, 'SANTAL WOOD', NULL, 'SANTAL WOOD', 1, '2025-06-11 13:56:57', '2025-06-11 13:57:29'),
(56, 'SERENITY IN ME', 'serenity-in-me', 345345, 345345, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498b5ca261c.jpg', 'filemanager/68498b5ca261c.jpg,filemanager/68498b5ca20fd.jpg,filemanager/68498b5ca2dc7.jpg', NULL, 'filemanager/68498b5ca20fd.jpg', 1, 0, NULL, NULL, 'SERENITY IN ME', NULL, 'SERENITY IN ME', 1, '2025-06-11 13:57:55', '2025-06-11 13:58:24'),
(57, 'SHADOW HER', 'shadow-her', 2342342, 23424234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498bc3d3f0f.jpg', 'filemanager/68498bc3d36d1.jpg,filemanager/68498bc3d3b43.jpg,filemanager/68498bc3d3f0f.jpg', NULL, 'filemanager/68498bc3d36d1.jpg', 1, 0, NULL, NULL, 'SHADOW HER', NULL, 'SHADOW HER', 1, '2025-06-11 13:59:20', '2025-06-11 14:00:02'),
(58, 'SHADOW HIM', 'shadow-him', 23423424, 345345, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498bfb87d38.jpg', 'filemanager/68498bfb8770d.jpg,filemanager/68498bfb87d38.jpg,filemanager/68498bfb8828b.jpg', NULL, 'filemanager/68498bfb8770d.jpg', 1, 0, 'SHADOW HIM', NULL, 'SHADOW HIM', NULL, 'SHADOW HIM', 1, '2025-06-11 14:00:29', '2025-06-11 14:01:07'),
(59, 'SHINE', 'shine', 453453, 345345, NULL, 45, NULL, NULL, NULL, NULL, 'filemanager/68498c41c3c8b.jpg', 'filemanager/68498c41c337e.jpg,filemanager/68498c41c3802.jpg,filemanager/68498c41c3c8b.jpg', NULL, 'filemanager/68498c41c337e.jpg', 1, 0, 'SHINE', NULL, 'SHINE', NULL, 'SHINE', 1, '2025-06-11 14:01:37', '2025-06-11 14:02:16'),
(60, 'SIGNIFY', 'signify', 234234, 234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498c963d982.jpg', 'filemanager/68498c963ce0a.jpg,filemanager/68498c963d39f.jpg,filemanager/68498c963d982.jpg', NULL, 'filemanager/68498c963ce0a.jpg', 1, 0, 'SIGNIFY', NULL, 'SIGNIFY', NULL, 'SIGNIFY', 1, '2025-06-11 14:03:02', '2025-06-11 14:03:33'),
(61, 'SILVER SHADE', 'silver-shade', 234234, 4234234, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498d7081710.jpg', 'filemanager/68498d708124a.jpg,filemanager/68498d7081710.jpg,filemanager/68498d7081ab0.jpg', NULL, 'filemanager/68498d708124a.jpg', 1, 0, 'SILVER SHADE', NULL, 'SILVER SHADE', NULL, 'SILVER SHADE', 1, '2025-06-11 14:06:43', '2025-06-11 14:08:31'),
(62, 'TITANIUM HIM', 'titanium-him', 345345, 345345, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498f1f23d31.jpg', 'filemanager/68498f1f23974.jpg,filemanager/68498f1f23d31.jpg,filemanager/68498f1f24060.jpg', NULL, 'filemanager/68498f1f23974.jpg', 1, 0, 'TITANIUM HIM', NULL, 'TITANIUM HIM', NULL, 'TITANIUM HIM', 1, '2025-06-11 14:13:58', '2025-06-11 14:14:36'),
(63, 'VIOLET MUSC', 'violet-musc', 345345, 5345345, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/68498f65db52d.jpg', 'filemanager/68498f65db16d.jpg,filemanager/68498f65db52d.jpg,filemanager/68498f65db8d0.jpg', NULL, 'filemanager/68498f65db16d.jpg', 1, 0, NULL, NULL, 'VIOLET MUSC', NULL, 'VIOLET MUSC', 1, '2025-06-11 14:15:04', '2025-06-11 14:15:43'),
(64, 'WANDERER', 'wanderer', 234234, 342342, NULL, 45, NULL, NULL, NULL, NULL, 'filemanager/68498fa0b8824.jpg', 'filemanager/68498fa0b82c1.jpg,filemanager/68498fa0b8824.jpg,filemanager/68498fa0b8bf6.jpg', NULL, 'filemanager/68498fa0b82c1.jpg', 1, 0, 'WANDERER', NULL, 'WANDERER', NULL, 'WANDERER', 1, '2025-06-11 14:16:55', '2025-06-11 14:17:24'),
(65, 'WISAL', 'wisal', 1500, 1700, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/6849900c01fa8.jpg', 'filemanager/6849900c017bc.jpg,filemanager/6849900c01c2e.jpg,filemanager/6849900c01fa8.jpg', NULL, 'filemanager/6849900c017bc.jpg', 1, 0, 'WISAL', NULL, 'WISAL', NULL, 'WISAL', 1, '2025-06-11 14:17:53', '2025-08-27 04:54:29'),
(66, 'WISAL DHAHAB', 'wisal-dhahab', 1200, 1250, NULL, 42, NULL, NULL, NULL, NULL, 'filemanager/6849904bcaf3c.jpg', 'filemanager/6849904bca617.jpg,filemanager/6849904bcaaaa.jpg,filemanager/6849904bcaf3c.jpg', NULL, 'filemanager/6849904bca617.jpg', 1, 0, 'WISAL DHAHAB', 'A timeless fragrance that combines floral elegance with a hint of woody warmth. \nPerfect for both casual and formal occasions, this perfume leaves a refreshing \nand long-lasting impression throughout the day. Crafted with top notes of \nbergamot and jasmine, balanced with musk and amber for a sophisticated finish.\n', 'WISAL DHAHAB', NULL, 'WISAL DHAHAB', 1, '2025-06-11 14:18:53', '2025-06-11 14:19:23'),
(67, 'shakeeb', 'shakeeb', NULL, 3234234, NULL, 43, NULL, NULL, NULL, NULL, 'https://localhost/shopingcart/public/filemanager/683c608ab0706.png', NULL, NULL, 'https://localhost/shopingcart/public/filemanager/684d315fb9067.png', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '2025-12-30 07:50:55', '2025-12-30 10:42:29');

-- --------------------------------------------------------

--
-- Table structure for table `product_collections`
--

CREATE TABLE `product_collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `collection_id` bigint(20) UNSIGNED NOT NULL,
  `is_enable` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_collections`
--

INSERT INTO `product_collections` (`id`, `product_id`, `collection_id`, `is_enable`, `created_at`, `updated_at`) VALUES
(62, 22, 2, 1, '2025-06-10 11:56:33', '2025-06-10 11:56:33'),
(61, 22, 1, 1, '2025-06-10 11:56:33', '2025-06-10 11:56:33'),
(57, 21, 1, 1, '2025-06-10 11:53:43', '2025-06-10 11:53:43'),
(68, 23, 2, 1, '2025-06-10 11:59:12', '2025-06-10 11:59:12'),
(67, 23, 1, 1, '2025-06-10 11:59:12', '2025-06-10 11:59:12'),
(74, 24, 2, 1, '2025-06-10 12:12:42', '2025-06-10 12:12:42'),
(73, 24, 1, 1, '2025-06-10 12:12:42', '2025-06-10 12:12:42'),
(77, 25, 1, 1, '2025-06-10 12:20:59', '2025-06-10 12:20:59'),
(78, 26, 1, 1, '2025-06-10 12:23:08', '2025-06-10 12:23:08'),
(80, 27, 1, 1, '2025-06-10 12:24:57', '2025-06-10 12:24:57'),
(82, 28, 1, 1, '2025-06-10 12:26:59', '2025-06-10 12:26:59'),
(84, 29, 1, 1, '2025-06-10 12:29:31', '2025-06-10 12:29:31'),
(86, 30, 1, 1, '2025-06-11 13:09:29', '2025-06-11 13:09:29'),
(88, 31, 1, 1, '2025-06-11 13:11:29', '2025-06-11 13:11:29'),
(89, 32, 1, 1, '2025-06-11 13:12:39', '2025-06-11 13:12:39'),
(90, 33, 1, 1, '2025-06-11 13:14:25', '2025-06-11 13:14:25'),
(91, 34, 1, 1, '2025-06-11 13:15:30', '2025-06-11 13:15:30'),
(92, 35, 1, 1, '2025-06-11 13:17:15', '2025-06-11 13:17:15'),
(93, 36, 1, 1, '2025-06-11 13:18:24', '2025-06-11 13:18:24'),
(94, 37, 1, 1, '2025-06-11 13:21:25', '2025-06-11 13:21:25'),
(95, 38, 1, 1, '2025-06-11 13:22:30', '2025-06-11 13:22:30'),
(96, 39, 1, 1, '2025-06-11 13:26:10', '2025-06-11 13:26:10'),
(97, 40, 1, 1, '2025-06-11 13:28:59', '2025-06-11 13:28:59'),
(98, 41, 1, 1, '2025-06-11 13:30:07', '2025-06-11 13:30:07'),
(99, 42, 1, 1, '2025-06-11 13:31:16', '2025-06-11 13:31:16'),
(101, 43, 1, 1, '2025-06-11 13:36:03', '2025-06-11 13:36:03'),
(102, 44, 1, 1, '2025-06-11 13:36:46', '2025-06-11 13:36:46'),
(103, 45, 1, 1, '2025-06-11 13:37:56', '2025-06-11 13:37:56'),
(104, 46, 2, 1, '2025-06-11 13:39:01', '2025-06-11 13:39:01'),
(105, 47, 1, 1, '2025-06-11 13:41:06', '2025-06-11 13:41:06'),
(106, 48, 1, 1, '2025-06-11 13:43:44', '2025-06-11 13:43:44'),
(107, 49, 1, 1, '2025-06-11 13:46:13', '2025-06-11 13:46:13'),
(108, 50, 1, 1, '2025-06-11 13:47:42', '2025-06-11 13:47:42'),
(109, 51, 1, 1, '2025-06-11 13:53:28', '2025-06-11 13:53:28'),
(110, 52, 1, 1, '2025-06-11 13:54:21', '2025-06-11 13:54:21'),
(111, 53, 2, 1, '2025-06-11 13:55:23', '2025-06-11 13:55:23'),
(112, 54, 1, 1, '2025-06-11 13:56:19', '2025-06-11 13:56:19'),
(113, 54, 2, 1, '2025-06-11 13:56:19', '2025-06-11 13:56:19'),
(114, 55, 1, 1, '2025-06-11 13:57:29', '2025-06-11 13:57:29'),
(115, 55, 2, 1, '2025-06-11 13:57:29', '2025-06-11 13:57:29'),
(116, 56, 1, 1, '2025-06-11 13:58:24', '2025-06-11 13:58:24'),
(117, 57, 1, 1, '2025-06-11 14:00:02', '2025-06-11 14:00:02'),
(118, 58, 2, 1, '2025-06-11 14:01:07', '2025-06-11 14:01:07'),
(120, 59, 2, 1, '2025-06-11 14:02:16', '2025-06-11 14:02:16'),
(121, 60, 1, 1, '2025-06-11 14:03:33', '2025-06-11 14:03:33'),
(122, 61, 1, 1, '2025-06-11 14:08:31', '2025-06-11 14:08:31'),
(123, 62, 1, 1, '2025-06-11 14:14:36', '2025-06-11 14:14:36'),
(124, 62, 2, 1, '2025-06-11 14:14:36', '2025-06-11 14:14:36'),
(125, 63, 1, 1, '2025-06-11 14:15:43', '2025-06-11 14:15:43'),
(126, 64, 1, 1, '2025-06-11 14:17:24', '2025-06-11 14:17:24'),
(129, 65, 1, 1, '2025-08-27 04:54:29', '2025-08-27 04:54:29'),
(128, 66, 1, 1, '2025-06-11 14:19:23', '2025-06-11 14:19:23');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `review` text NOT NULL,
  `star` tinyint(4) NOT NULL CHECK (`star` between 1 and 5),
  `status` int(11) NOT NULL DEFAULT 0,
  `is_home` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `product_id`, `name`, `review`, `star`, `status`, `is_home`, `created_at`, `updated_at`) VALUES
(1, 66, 'Ali Khan', 'Bohat acha product hai, quality top notch hai.', 5, 1, 1, '2025-09-02 14:26:49', '2025-09-02 14:30:35'),
(2, 66, 'Sara Ahmed', 'Product theek thaak hai, delivery thodi late thi.', 3, 1, 1, '2025-09-02 14:26:49', '2025-09-02 14:30:38'),
(3, 66, 'Usman Raza', 'Price ke hisaab se best hai, recommended!', 4, 1, 1, '2025-09-02 14:26:49', '2025-09-02 14:30:39'),
(4, 66, 'Ayesha Noor', 'Mujhe pasand nahi aaya, quality weak thi.', 2, 1, 0, '2025-09-02 14:26:49', '2025-09-02 15:01:46'),
(5, 66, 'Hamza Malik', 'Zabardast product, dubara order karunga.', 5, 1, 0, '2025-09-02 14:26:49', '2025-09-02 15:01:49'),
(6, 66, 'Shakeeb', 'hello world', 5, 1, 0, '2025-09-02 10:53:53', '2025-09-02 10:53:53'),
(13, 63, 'test', 'test', 4, 1, 0, '2025-09-02 11:33:13', '2025-09-02 11:33:13'),
(14, 64, 'Aliz raza', 'WANDERER is my best Experience in this perfume', 5, 1, 0, '2025-09-02 11:41:52', '2025-09-02 11:41:52'),
(15, 66, 'M Shakeeb Raza', 'This product is good', 4, 1, 0, '2025-09-02 12:50:28', '2025-09-02 12:50:28');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Admin', 1, '2024-01-27 19:11:35', '2024-01-27 14:45:22', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('d9c8EDlsLky8QcJaRkje0DYkewLjZhcWI10SOlJN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTnFWUGhiNjU3Yk91N0swckM0S2gzY0czaU1COGg4UUgyZDdJeWFGTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vbG9jYWxob3N0L3Nob3BpbmdjYXJ0L3Nob3AvZmlsZW1hbmFnZXIvNjg0OTkwNGJjYWYzYy5qcGciO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767429488);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `field` text NOT NULL,
  `value` text DEFAULT NULL,
  `type` text NOT NULL DEFAULT 'text',
  `sort` int(11) NOT NULL DEFAULT 0,
  `grouping` text DEFAULT NULL,
  `section_sorting` int(11) NOT NULL DEFAULT 0,
  `group_sorting` int(11) NOT NULL DEFAULT 0,
  `section` text NOT NULL DEFAULT 'others',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `field`, `value`, `type`, `sort`, `grouping`, `section_sorting`, `group_sorting`, `section`, `created_at`, `updated_at`) VALUES
(1, 'site_title', 'The Rare Perfumes', 'text', 1, 'general', 0, 0, 'others', NULL, NULL),
(2, 'meta_title', 'Therareperfumes', 'text', 2, 'seo', 0, 0, 'seo', NULL, NULL),
(3, 'meta_description', 'Therareperfumes is fully customizable and appearing to your customers in accordance with what they need and what they search', 'text', 3, 'seo', 0, 0, 'seo', NULL, NULL),
(4, 'meta_keywords', 'Therareperfumes is fully customizable and appearing to your customers in accordance with what they need and what they search', 'text', 4, 'seo', 0, 0, 'seo', NULL, NULL),
(5, 'footer_credits', 'Copyright: 2024 <a href=\"#.\"><span class=\"color_red\">therareperfumes</span></a>', 'text', 5, 'theme', 3, 0, 'footer', NULL, NULL),
(6, 'phone_number', '000000000000', 'text', 5, 'general', 0, 0, 'others', NULL, NULL),
(7, 'email_address', 'support@therareperfumes.online', 'text', 4, 'general', 0, 0, 'others', NULL, NULL),
(8, 'address', 'Pakistan', 'text', 4, 'general', 0, 0, 'others', NULL, NULL),
(9, 'domain', 'https://therareperfumes.online/public/', 'text', 4, 'general', 0, 0, 'others', NULL, NULL),
(10, 'logo', 'filemanager/68a37916d0046.png', 'image', 1, 'general', 0, 0, 'others', NULL, NULL),
(11, 'menu_type', 'left', 'text', 1, 'general', 0, 0, 'others', NULL, NULL),
(12, 'fav_icon', 'demo/favicon.png', 'image', 1, 'general', 0, 0, 'others', NULL, NULL),
(13, 'facebook_link', 'shakeeb', 'text', 1, 'social_media', 0, 0, 'social_media', NULL, NULL),
(14, 'youtube_link', 'shakeeb', 'text', 1, 'social_media', 0, 0, 'social_media', NULL, NULL),
(31, 'twitter_link', 'shakeeb', 'text', 1, 'social_media', 0, 0, 'social_media', NULL, NULL),
(16, 'instagram_link', 'shakeeb', 'text', 1, 'social_media', 0, 0, 'social_media', NULL, NULL),
(17, 'admin_logo', '', 'image', 4, 'admin_settings', 0, 0, 'others', NULL, NULL),
(18, 'admin_favicon', '', 'image', 4, 'admin_settings', 0, 0, 'others', NULL, NULL),
(19, 'site_currency', 'PKR', 'text', 5, 'shop_settings', 0, 0, 'shop', NULL, NULL),
(20, 'topbar_title', 'Wellcome to The Rare Perfumes', 'text', 1, 'theme', 1, 0, 'header', NULL, NULL),
(21, 'site_short_details', 'therareperfumes is fully customizable and appearing to your customers in accordance with what they need and what they search Be a star of your own dream. Start your own ecommerce business right now!', 'text', 1, 'general', 0, 0, 'others', NULL, NULL),
(22, 'home_page_banner', 'filemanager/683c5350bfd65.png', 'image', 1, 'theme', 2, 0, 'homepage', NULL, NULL),
(23, 'home_page_text', 'The Rare Perfumes', 'text', 1, 'theme', 2, 0, 'homepage', NULL, NULL),
(24, 'home_page_text_color', 'white', 'text', 1, 'theme', 2, 0, 'homepage', NULL, NULL),
(25, 'home_page_details', 'WE ENJOY WORKING ON THE SERVICES & PRODUCTS. WE PROVIDE AS MUCH AS YOU NEED THEM. THIS HELP US IN DELIVERING YOUR GOALS EASILY. BROWSE THROUGH THE WIDE RANGE OF SERVICES WE PROVIDE.', 'text', 1, 'theme', 2, 0, 'homepage', NULL, NULL),
(26, 'delivery_charges', '250', 'text', 5, 'shop_settings', 0, 0, 'shop', NULL, NULL),
(27, 'shop_banner', 'public/demo/shopbanner.jpg', 'image', 5, 'shop_settings', 0, 0, 'shop', NULL, NULL),
(30, 'discount_percent', '0', 'text', 1, 'shop_settings', 0, 0, 'shop', NULL, NULL),
(32, 'tax', '10', 'text', 1, 'shop_settings', 0, 0, 'shop', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `permissions` text DEFAULT NULL,
  `profile_image` text DEFAULT NULL,
  `email_token` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `role_id`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `status`, `created_by`, `permissions`, `profile_image`, `email_token`) VALUES
(1, 'Shakeeb', 1, 'man411210@gmail.com', '2025-12-01 09:50:59', '$2y$12$mMel2UW/QXiUjEwP79PrBuLf9XnLY3ZjLlEHrNFnay8hyKP8.TZ6.', NULL, '2025-12-01 09:51:39', '2025-12-01 09:51:43', 1, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `product_id`, `sku`, `quantity`, `price`, `image`, `created_at`, `updated_at`) VALUES
(37, 20, '200 ml', 17, 10000, NULL, '2025-06-01 20:15:38', '2025-06-01 20:15:48'),
(36, 19, '100ml', 15, 17000, NULL, '2025-06-01 20:10:34', '2025-06-01 20:10:34'),
(35, 18, '100ml', 12, 12000, NULL, '2025-06-01 20:04:55', '2025-06-01 20:04:55'),
(34, 17, '100ml', 10, 49680, NULL, '2025-06-01 19:46:22', '2025-06-01 19:46:39'),
(38, 21, '100ml', 10, 12000, NULL, '2025-06-10 11:52:48', '2025-06-10 11:52:59'),
(39, 22, '300 ml', 10, 12000, NULL, '2025-06-10 11:55:52', '2025-06-10 11:56:02'),
(41, 66, '120ML', 5, 1300, NULL, '2025-08-23 00:21:54', '2025-08-23 00:22:15'),
(42, 66, '150ML', 122, 1200, NULL, '2025-08-23 00:21:54', '2025-08-23 00:22:15'),
(43, 65, '120ML', 20, 1500, NULL, '2025-08-27 04:54:12', '2025-08-27 04:54:23');

-- --------------------------------------------------------

--
-- Table structure for table `variation_attributes`
--

CREATE TABLE `variation_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variation_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `value_id` bigint(20) UNSIGNED DEFAULT NULL,
  `value` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_attributes`
--

INSERT INTO `variation_attributes` (`id`, `variation_id`, `attribute_id`, `value_id`, `value`, `created_at`, `updated_at`) VALUES
(70, 37, 3, 25, '200 ml', '2025-06-01 20:15:38', '2025-06-01 20:15:38'),
(69, 36, 3, 3, '100ml', '2025-06-01 20:10:34', '2025-06-01 20:10:34'),
(68, 35, 3, 3, '100ml', '2025-06-01 20:04:55', '2025-06-01 20:04:55'),
(67, 34, 3, 3, '100ml', '2025-06-01 19:46:22', '2025-06-01 19:46:22'),
(71, 38, 3, 3, '100ml', '2025-06-10 11:52:48', '2025-06-10 11:52:48'),
(72, 39, 3, 26, '300 ml', '2025-06-10 11:55:52', '2025-06-10 11:55:52'),
(73, 40, 3, 26, '300 ml', '2025-06-10 11:58:37', '2025-06-10 11:58:37'),
(74, 41, 3, 25, '120ML', '2025-08-23 00:21:54', '2025-08-23 00:21:54'),
(75, 42, 3, 26, '150ML', '2025-08-23 00:21:54', '2025-08-23 00:21:54'),
(76, 43, 3, 25, '120ML', '2025-08-27 04:54:12', '2025-08-27 04:54:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_index` (`parent_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `filemanager`
--
ALTER TABLE `filemanager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_variation_id_foreign` (`variation_id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_collections`
--
ALTER TABLE `product_collections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_collections_product_id_foreign` (`product_id`),
  ADD KEY `product_collections_collection_id_foreign` (`collection_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_created_by_foreign` (`created_by`),
  ADD KEY `roles_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variations_product_id_foreign` (`product_id`);

--
-- Indexes for table `variation_attributes`
--
ALTER TABLE `variation_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_attributes_variation_id_foreign` (`variation_id`),
  ADD KEY `variation_attributes_value_id_foreign` (`value_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filemanager`
--
ALTER TABLE `filemanager`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `product_collections`
--
ALTER TABLE `product_collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `variation_attributes`
--
ALTER TABLE `variation_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 23, 2025 at 06:27 AM
-- Server version: 10.11.6-MariaDB-0+deb12u1-log
-- PHP Version: 8.2.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prime_professional`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_activity_log`
--

CREATE TABLE `admin_activity_log` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `send_user` int(11) DEFAULT NULL,
  `rel_id` int(11) DEFAULT NULL,
  `url` mediumtext DEFAULT NULL,
  `rel_type` varchar(50) DEFAULT NULL,
  `see_noti` int(2) DEFAULT 0,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_activity_log`
--

CREATE TABLE `customer_activity_log` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `send_user` int(11) DEFAULT NULL,
  `rel_id` int(11) DEFAULT NULL,
  `rel_type` varchar(50) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `see_noti` int(2) NOT NULL DEFAULT 0 COMMENT '0 for not see 1 for see'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `customer_activity_log`
--

INSERT INTO `customer_activity_log` (`id`, `description`, `user_id`, `send_user`, `rel_id`, `rel_type`, `url`, `date`, `see_noti`) VALUES
(1, 'Travail soumis avec succès', 3, NULL, 1, 'pp_job_posting', 'jobs/index', '2023-10-12 11:04:28', 0),
(2, 'actif avec succès', 3, NULL, 1, 'pp_job_posting', 'jobs/index', '2023-10-12 11:04:32', 0),
(3, 'Un devis a été reçu par', 3, NULL, 1, 'quotation', 'quotation/quotes_listing?tab=pending', '2023-10-12 11:05:25', 0),
(4, 'You have successfully paid', 3, 92, 1, 'pp_job_posting', 'invoice/index', '2023-10-12 11:11:58', 0),
(5, 'Le travail a été enregistré', 3, 0, 2, '', '', '2023-10-12 12:12:23', 0),
(6, 'Un devis a été reçu par', 3, NULL, 2, 'quotation', 'quotation/quotes_listing?tab=pending', '2023-10-12 12:14:14', 0),
(7, 'Travail soumis avec succès', 3, NULL, 3, 'pp_job_posting', 'jobs/index', '2023-10-12 13:45:26', 0),
(8, 'actif avec succès', 3, NULL, 3, 'pp_job_posting', 'jobs/index', '2023-10-12 13:45:29', 0),
(9, 'Le travail a été enregistré', 3, 0, 4, '', '', '2023-10-13 15:11:46', 0),
(10, 'Un devis a été reçu par', 3, 2, 3, 'quotation', 'quotation/quotes_listing?tab=pending', '2023-10-13 15:22:41', 0),
(11, 'Un devis a été reçu par', 3, NULL, 4, 'quotation', 'quotation/quotes_listing?tab=pending', '2023-10-24 21:20:07', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pp_advar_title`
--

CREATE TABLE `pp_advar_title` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pp_advar_title`
--

INSERT INTO `pp_advar_title` (`id`, `title`, `created_date`, `updated_date`) VALUES
(1, 'Des services adaptés à votre entreprise', '2023-09-11 11:43:17', '2023-09-12 04:18:17');

-- --------------------------------------------------------

--
-- Table structure for table `pp_advertisement`
--

CREATE TABLE `pp_advertisement` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `united_city` int(11) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `attachment_path` varchar(255) DEFAULT NULL,
  `add_display_page` varchar(10) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `author` int(11) NOT NULL DEFAULT 0,
  `status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 => deactive 1=> active',
  `created_by` int(11) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pp_appointment`
--

CREATE TABLE `pp_appointment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `quot_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `add_apointment` varchar(255) DEFAULT NULL,
  `day` text DEFAULT NULL,
  `prefer_time` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `meeting_url` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `attachment` longtext DEFAULT NULL,
  `attachment_path` longtext DEFAULT NULL,
  `approve_status` int(2) DEFAULT 0 COMMENT '0 => pro send request,1=>customer approve,2 for pro approve ',
  `status` int(3) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `resedule_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pp_appointment`
--

INSERT INTO `pp_appointment` (`id`, `user_id`, `quot_id`, `job_id`, `title`, `add_apointment`, `day`, `prefer_time`, `date`, `time`, `meeting_url`, `description`, `attachment`, `attachment_path`, `approve_status`, `status`, `created_by`, `resedule_by`, `created_date`, `updated_date`) VALUES
(1, 92, 1, 1, 'vzvzvgheh', 'hsheeh', NULL, NULL, '0000-00-00', '12:15:00', NULL, 'nzjsj', NULL, NULL, 0, 0, 92, NULL, '2023-10-12 12:04:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pp_category`
--

CREATE TABLE `pp_category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `attachment_path` text DEFAULT NULL,
  `show_home_page` tinyint(1) NOT NULL DEFAULT 0,
  `slug` varchar(100) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '0=>pending,1=>approved,2=>desapproved	',
  `created_by` int(11) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `crteated_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pp_category`
--

INSERT INTO `pp_category` (`id`, `category_name`, `attachment`, `attachment_path`, `show_home_page`, `slug`, `parent`, `status`, `created_by`, `approved_by`, `crteated_date`, `updated_date`) VALUES
(1, 'Jardinier', '3ffc614def60d6786285063f3fadf0c4.jpg', 'https://clickopro.busybanda.com//public/modules/category/uploads/', 1, NULL, NULL, '0', 1, 1, '2023-07-24 07:22:32', '2023-08-30 01:25:21'),
(3, 'Avocat', '8f9d72a0a53cd5c5a1a91303b1e9d0ae.jpg', 'https://clickopro.busybanda.com//public/modules/category/uploads/', 1, NULL, NULL, '1', 1, NULL, '2023-07-24 07:23:08', '2023-08-30 01:24:12'),
(4, 'Enseignant', 'c6ed189af5a66035f4c9ef6c1f379c0d.jpg', 'https://clickopro.busybanda.com//public/modules/category/uploads/', 0, NULL, NULL, '1', 1, NULL, '2023-07-24 07:23:22', '2023-08-30 01:29:46'),
(5, 'Agent d\'entretien', '7afd8e25925d5e0c4e7ba80fea19c0d1.png', 'https://clickopro.busybanda.com//public/modules/category/uploads/', 1, NULL, NULL, '1', 1, NULL, '2023-07-24 07:23:36', '2023-08-30 01:40:25'),
(6, 'Comptable', '3ca165338b05bf1dbbb8051edcbccbc3.jpg', 'https://clickopro.busybanda.com//public/modules/category/uploads/', 0, NULL, NULL, '1', 1, NULL, '2023-07-24 07:23:48', '2023-08-31 23:52:05'),
(7, 'Maçon', '11070d14a5f75e30289c12785f34291e.jpg', 'https://clickopro.busybanda.com//public/modules/category/uploads/', 1, NULL, NULL, '1', 1, NULL, '2023-07-24 07:24:00', '2023-08-30 01:33:11'),
(8, 'Repassage', 'ff3ec745c792dfa95ee18e75cb2a1a33.jpg', 'https://clickopro.busybanda.com//public/modules/category/uploads/', 1, NULL, NULL, '1', 1, NULL, '2023-07-24 07:24:09', '2023-09-15 04:54:05'),
(9, 'Peintre', '065808523d4984def3e9a9ed7ade14ea.png', 'https://clickopro.busybanda.com//public/modules/category/uploads/', 1, NULL, NULL, '1', 1, NULL, '2023-07-24 07:24:19', '2023-08-30 01:37:39'),
(10, 'Électricien', '14d0d4a5ca52b22fe3d1a5293daa9e9d.png', 'https://clickopro.busybanda.com//public/modules/category/uploads/', 1, NULL, 0, '1', 1, NULL, '2023-07-24 07:24:31', NULL),
(11, 'Plombier', '6bede62be7cf56e1e9826232936f73ee.png', 'https://clickopro.busybanda.com//public/modules/category/uploads/', 1, NULL, 0, '1', 1, NULL, '2023-07-24 07:24:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pp_chat`
--

CREATE TABLE `pp_chat` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `pp_chat`
--

INSERT INTO `pp_chat` (`id`, `user_id`, `customer_id`, `message`, `created_by`, `created_at`) VALUES
(1, 2, 3, 'hello Sir ', 2, '2023-10-10 07:04:29');

-- --------------------------------------------------------

--
-- Table structure for table `pp_city`
--

CREATE TABLE `pp_city` (
  `id` int(11) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `city_name` varchar(100) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `attachment_path` text DEFAULT NULL,
  `show_home_page` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 => inactive, 1 => active',
  `created_by` int(11) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL,
  `India` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pp_city`
--

INSERT INTO `pp_city` (`id`, `country_id`, `region_id`, `city_name`, `attachment`, `attachment_path`, `show_home_page`, `status`, `created_by`, `approved_by`, `created_date`, `updated_date`, `India`) VALUES
(1, 1, 1, 'Fort of France', 'e9d21a906022de800f76f0040869033e.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 1, '1', 1, NULL, '2023-07-10 10:51:08', '2023-07-17 10:33:31', NULL),
(2, 1, 1, 'Trois-Îlets', 'a4be2852487fdce85b744df2aecd83eb.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-07-10 10:51:08', '2023-08-24 03:09:12', NULL),
(3, 1, 1, 'Ducos', 'c3ddff5d02705eda0803e7602b914cf2.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-07-10 10:51:08', '2023-08-24 03:08:02', NULL),
(4, 1, 1, 'Rivière Salée', '83c61fc8e1ff7af7c1fcb1c4625d2179.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 1, '1', 1, NULL, '2023-07-10 10:51:08', '2023-08-24 03:08:37', NULL),
(5, 1, 1, 'Sainte Marie', '1c492524cbad0505a360c6c989389862.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-07-10 10:51:08', '2023-08-24 03:07:11', NULL),
(6, 1, 1, 'Robert', '90150f2d1eabc97a23602a90c39ed63d.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 1, '1', 1, NULL, '2023-07-10 10:51:08', '2023-08-24 03:06:49', NULL),
(8, 1, 1, 'Schoelcher', 'dc8d680e43014da7d857ac9dfd6344f7.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 1, '1', 1, NULL, '2023-07-10 10:51:08', '2023-08-24 03:06:20', NULL),
(10, 1, 1, 'Les Anses-d\'Arlet', '1125e1e977c878cd04e96d5c6e45dc39.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-07-10 10:51:08', '2023-08-24 03:09:50', NULL),
(15, 1, 1, 'Le Diamant', 'b226f066260abdd2c3007a4e760e5ad3.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-07-10 10:51:08', '2023-08-24 03:10:10', NULL),
(16, 1, 1, 'Fonds-Saint-Denis', '1f6107540eae91424a0ddd9108814ece.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-07-10 10:51:08', '2023-08-24 03:19:55', NULL),
(17, 1, 1, 'Saint Joseph', '4f7e86b54088db75bdc557521a824e97.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 1, '1', 1, NULL, '2023-07-20 16:50:48', '2023-08-24 03:05:30', NULL),
(18, 1, 1, 'Le Marigot', 'b88c88472bc8c1962e2cd1057f330f6f.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-07-25 16:37:50', '2023-08-24 03:07:39', NULL),
(19, 1, 1, 'Le Lamentin', '9dda3dd43224dbc4c04682263c70b778.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 1, '1', 1, NULL, '2023-08-24 03:10:53', NULL, NULL),
(20, 1, 1, 'Le Marin', 'ffa9c3890de8ad7d2d0c57726100d3bf.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-08-24 03:11:37', NULL, NULL),
(21, 1, 1, 'Case-Pilote', '0ea983d8aa129b558ffb98b894a877b9.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-08-24 03:16:24', NULL, NULL),
(22, 1, 1, 'Grand-Rivière', '599803955672cc25082f410a09ddba6c.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-08-24 03:16:45', NULL, NULL),
(23, 1, 1, 'Gros-Morne', '0db4aec1cb702a2e76adf6a72ecbe1df.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-08-24 03:17:03', NULL, NULL),
(24, 1, 1, 'Sainte-Luce', '800532a1482a5a7fc26d8c2ac968026a.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-08-24 03:18:44', NULL, NULL),
(25, 1, 1, 'Rivière-Pilote', '80ad03dcf846a2118e6be573f114d34d.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-08-24 03:19:39', NULL, NULL),
(26, 1, 1, 'La Trinité', '1ca49524cb1a88744425aeeecc2d0c1c.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-08-24 03:22:49', NULL, NULL),
(27, 1, 1, 'Le Lorrain', 'c2956c9d56976f3616e08cd2a49b2ede.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-08-24 03:23:45', NULL, NULL),
(28, 1, 1, 'Macouba', '2a1b19b4af96953d07383565bd127053.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-08-24 03:24:32', NULL, NULL),
(29, 1, 1, 'Le Carbet', '43f9836fb0992536eca6f02548c0bb67.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-08-24 03:25:31', NULL, NULL),
(30, 1, 1, 'Fond Saint-Denis', '59fe5b08dd4a32e4f4228f200677781f.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-08-24 03:28:44', NULL, NULL),
(31, 1, 1, 'Basse-Pointe', '1b2807d1d882b1f8adc9048d8ae647c6.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-08-24 03:29:21', NULL, NULL),
(32, 1, 1, 'Le François', 'c3c056351c280d5ad4464ba6ad8b7dd2.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-08-24 03:29:53', NULL, NULL),
(33, 1, 1, 'Ajoupa-Bouillon', '75b56469cbd584559c535b56dcd15ae0.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-08-24 03:31:17', NULL, NULL),
(34, 1, 1, 'Sainte-Anne', '941e753f556d4fc56eb236ddcbf89d80.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-08-24 03:32:05', NULL, NULL),
(35, 1, 1, 'Saint-Esprit', '2e70507a5afcca4888b31a1c20f0c6fe.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-08-24 03:32:30', NULL, NULL),
(37, 1, 1, 'Saint-Pierre', '98a6b527fc3405de3a13d4b9581767cc.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-08-24 03:46:50', NULL, NULL),
(38, 1, 1, 'Le Vauclin', '6041a5d556b99b4eac0978349560900c.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-08-24 03:53:06', NULL, NULL),
(39, 1, 1, 'Le Prêcheur', '77a793c8134921ccba8d378df2180720.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-08-24 03:53:37', NULL, NULL),
(40, 1, 1, 'Morne-Rouge', 'd9f59ecdf6f5479cca6c1a49d445a6ef.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-08-24 03:54:26', NULL, NULL),
(41, 1, 1, 'Morne-Vert', '7dd0f2a12af54bc23d3d34e116504e37.jpg', 'https://clickopro.busybanda.com//public/modules/city/uploads/', 0, '1', 1, NULL, '2023-08-24 03:54:49', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pp_coins_trans`
--

CREATE TABLE `pp_coins_trans` (
  `id` int(11) NOT NULL,
  `professional_id` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL,
  `coins_in` int(11) NOT NULL DEFAULT 0,
  `coins_out` int(11) NOT NULL DEFAULT 0,
  `opening_bal` int(11) NOT NULL DEFAULT 0,
  `closing_bal` int(11) NOT NULL DEFAULT 0,
  `reason` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pp_country`
--

CREATE TABLE `pp_country` (
  `id` int(11) NOT NULL,
  `country_name` varchar(100) NOT NULL,
  `short_name` varchar(15) DEFAULT NULL,
  `country_code` int(11) DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 => inactive, 1 => active',
  `created_by` int(11) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pp_country`
--

INSERT INTO `pp_country` (`id`, `country_name`, `short_name`, `country_code`, `status`, `created_by`, `approved_by`, `created_date`, `updated_date`) VALUES
(1, 'France', NULL, NULL, '1', NULL, NULL, '2023-07-10 10:48:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pp_customer`
--

CREATE TABLE `pp_customer` (
  `id` int(11) NOT NULL,
  `show_home_page` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `profile_pic_path` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `professional_hired` text DEFAULT NULL,
  `job_posting` int(11) DEFAULT NULL,
  `device_token` text DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pp_customer`
--

INSERT INTO `pp_customer` (`id`, `show_home_page`, `user_id`, `name`, `email`, `password`, `gender`, `profile_pic`, `profile_pic_path`, `location`, `address`, `country_id`, `region_id`, `city_id`, `description`, `professional_hired`, `job_posting`, `device_token`, `status`, `created_date`, `updated_date`) VALUES
(1, 0, 3, 'ClickoPro', 'customer@gmail.com', '@xg7%#MTIzNDU2Nzg5*h', 'MÂLE', 'a6a9b1a14fadf27f04cc6ee351569846.png', 'https://clickopro.busybanda.com//public/modules/customers/uploads/', '10', 'testing address', NULL, 1, 10, 'testing', '0', 37, NULL, '1', '2023-08-02 11:44:01', NULL),
(34, 0, 93, 'Adelyne', 'adelyneetsebastian', '@xg7%#QWRlbHluZTk3Mj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-10-06 20:51:56', NULL),
(35, 0, 94, 'Sebastien N', 'nilor.sebastien@gmail.com', '@xg7%#a2lwa2lwa2lw*h', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-10-06 20:53:53', NULL),
(36, 0, 95, 'Adelyne', 'adelyneetsebastian@gmail.com', '@xg7%#QWRlbHluZTk3Mj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-10-06 20:57:36', NULL),
(37, 0, 96, 'Beta Testeur', 'laurent.louison@smtvd.fr', '@xg7%#MTIzNDU2Nzg5*h', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-10-06 20:58:47', NULL),
(38, 0, 97, 'Adelyne', 'adelyneedon@gmail.com', '@xg7%#QWRlbHluZTk3Mj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-10-06 21:00:43', NULL),
(39, 0, 98, 'Adelyne', 'sebastian.dft@gmail.com', '@xg7%#QWRlbHluZTk3Mj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2023-10-06 21:01:55', NULL),
(44, 0, 119, 'Yash Customer', 'yash@lastingerp.com', '@xg7%#YWRtaW5AMTIz*h', 'MÂLE', NULL, NULL, '30', 'asss', NULL, 1, 30, 'This is foe the customer role', NULL, 3, NULL, '1', '2023-10-10 10:16:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pp_customer_commission`
--

CREATE TABLE `pp_customer_commission` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `rate` int(3) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pp_customer_commission`
--

INSERT INTO `pp_customer_commission` (`id`, `title`, `rate`, `created_date`, `updated_date`) VALUES
(1, 'customer commission', 6, '2023-10-11 09:38:38', '2023-10-11 09:38:38');

-- --------------------------------------------------------

--
-- Table structure for table `pp_job_posting`
--

CREATE TABLE `pp_job_posting` (
  `id` int(11) NOT NULL,
  `show_home_page` tinyint(1) NOT NULL DEFAULT 0,
  `cust_id` int(11) DEFAULT NULL,
  `job_title` text DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `subcategory` int(11) DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `location` varchar(15) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `price` float(9,2) DEFAULT NULL,
  `attachment` longtext DEFAULT NULL,
  `attachment_path` text DEFAULT NULL,
  `status` int(11) DEFAULT 4 COMMENT '0=>active,1=>hiring,2=>complete job ,3=>deactive job, 4 => pending job',
  `bid_count` int(11) DEFAULT 0,
  `bid_applied_propfessional` longtext DEFAULT NULL,
  `bid_rejected_propfessional` text DEFAULT NULL,
  `rejected_bid` varchar(255) DEFAULT NULL,
  `remarks_by_prof` text NOT NULL,
  `marked_done` int(11) NOT NULL DEFAULT 0,
  `start_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `hired_date` date DEFAULT NULL,
  `completion_date` datetime DEFAULT NULL,
  `professional_feedback` text DEFAULT NULL,
  `professional_rating` int(11) DEFAULT NULL,
  `professional_id` varchar(11) DEFAULT NULL,
  `pay_amount` varchar(255) DEFAULT NULL,
  `payment_status` varchar(15) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pp_job_posting`
--

INSERT INTO `pp_job_posting` (`id`, `show_home_page`, `cust_id`, `job_title`, `category`, `subcategory`, `tags`, `location`, `description`, `price`, `attachment`, `attachment_path`, `status`, `bid_count`, `bid_applied_propfessional`, `bid_rejected_propfessional`, `rejected_bid`, `remarks_by_prof`, `marked_done`, `start_date`, `due_date`, `hired_date`, `completion_date`, `professional_feedback`, `professional_rating`, `professional_id`, `pay_amount`, `payment_status`, `created_date`, `updated_date`) VALUES
(1, 0, 3, 'Testing for jobs ', 3, NULL, NULL, '28', '', 555.00, '[\"2e3eb1b6a9c046478545a1964c655ea9.jpg\"]', 'https://clickopro.busybanda.com//public/modules/jobs/uploads/', 1, 1, '[\"92\"]', NULL, NULL, '', 0, '2023-10-12', '2023-10-12', '2023-10-12', NULL, NULL, NULL, '92', NULL, 'complete', '2023-10-12 05:34:28', '2023-10-12 05:43:28'),
(2, 0, 3, 'test', 3, NULL, NULL, '3', 'rttt', 888.00, NULL, NULL, 2, 1, '[\"92\"]', NULL, NULL, '', 0, '2023-10-12', '2023-10-12', '2023-10-12', NULL, NULL, NULL, '92', NULL, 'complete', '2023-10-12 06:42:23', '2023-10-12 10:17:05'),
(3, 0, 3, 'latest job for today', 4, NULL, NULL, '33', 'wefsd', 543.00, NULL, NULL, 0, 0, NULL, NULL, NULL, '', 0, '2023-10-12', '2023-10-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-12 08:15:26', '2023-10-12 08:15:29'),
(4, 0, 3, 'ff', 3, NULL, NULL, '3', 'ff', 666.00, NULL, NULL, 1, 2, '[\"2\",\"92\"]', NULL, NULL, '', 0, '2023-10-13', '2023-10-13', '2023-10-24', NULL, NULL, NULL, '92', NULL, 'complete', '2023-10-13 09:41:46', '2023-10-24 15:53:49');

-- --------------------------------------------------------

--
-- Table structure for table `pp_manage_subscriptions_plan`
--

CREATE TABLE `pp_manage_subscriptions_plan` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `total_quot` int(11) DEFAULT NULL,
  `total_invoice` int(11) DEFAULT NULL,
  `status` enum('active','expired','cancelled') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pp_manage_subscriptions_plan`
--

INSERT INTO `pp_manage_subscriptions_plan` (`id`, `user_id`, `plan_id`, `start_date`, `end_date`, `total_quot`, `total_invoice`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 5, '2023-09-19', '2023-12-18', 0, 0, 'active', '2023-09-19 07:00:21', '2023-09-26 08:29:53'),
(12, 2, 6, '2023-09-28', '2023-12-27', 30, 0, 'active', '2023-09-28 05:37:14', '2023-10-13 09:52:41'),
(14, 92, 5, '2023-09-28', '2028-09-28', 5, 0, 'active', '2023-09-28 06:58:25', '2023-10-10 10:30:28'),
(15, 2, 6, '2023-09-28', '2023-12-27', 30, 0, 'active', '2023-09-28 11:36:48', '2023-10-13 09:52:41'),
(16, 108, 5, '2023-10-09', '2028-10-09', 0, 0, 'active', '2023-10-09 10:57:01', '2023-10-09 10:57:01'),
(17, 116, 5, '2023-10-09', '2028-10-09', 0, 0, 'active', '2023-10-09 11:30:33', '2023-10-09 11:30:33'),
(18, 118, 5, '2023-10-09', '2028-10-09', 0, 0, 'active', '2023-10-09 12:23:58', '2023-10-09 12:23:58'),
(19, 119, 5, '2023-10-10', '2028-10-10', 0, 0, 'active', '2023-10-10 10:22:38', '2023-10-10 10:22:38'),
(20, 92, 6, '2023-10-11', '2024-01-10', 9, 0, 'active', '2023-10-11 07:31:05', '2023-10-24 15:50:07');

-- --------------------------------------------------------

--
-- Table structure for table `pp_negotiation`
--

CREATE TABLE `pp_negotiation` (
  `id` int(11) NOT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `deff_days` varchar(5) NOT NULL,
  `payment_due_date` date NOT NULL,
  `amount` varchar(10) NOT NULL,
  `admin_cus_commission` varchar(20) DEFAULT NULL,
  `admin_cus_per` int(10) DEFAULT NULL,
  `payment_status` varchar(10) DEFAULT NULL,
  `approve_status_pro` int(2) DEFAULT 0,
  `payment_approved_status` int(11) DEFAULT NULL,
  `quot_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `prof_id` int(11) DEFAULT NULL,
  `customer_payment_date` datetime DEFAULT NULL,
  `professional_pad_status` int(11) DEFAULT NULL,
  `professional_paid_amount` float(9,2) DEFAULT NULL,
  `admin_commission` varchar(20) DEFAULT NULL,
  `professional_pad_id` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `professional_paid_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pp_negotiation`
--

INSERT INTO `pp_negotiation` (`id`, `payment_id`, `deff_days`, `payment_due_date`, `amount`, `admin_cus_commission`, `admin_cus_per`, `payment_status`, `approve_status_pro`, `payment_approved_status`, `quot_id`, `job_id`, `cust_id`, `prof_id`, `customer_payment_date`, `professional_pad_status`, `professional_paid_amount`, `admin_commission`, `professional_pad_id`, `created_date`, `professional_paid_date`, `updated_date`) VALUES
(1, 'X9YRRZ2FBGLTW', '', '2023-10-12', '260.00', '52.52', 10, 'Complete', 0, NULL, 1, 1, 3, 92, '2023-10-12 11:13:28', NULL, NULL, NULL, NULL, '2023-10-12 11:11:03', NULL, NULL),
(2, NULL, '0', '2023-10-15', '260.00', '0', 0, NULL, 0, NULL, 1, 1, 3, 92, NULL, NULL, NULL, NULL, NULL, '2023-10-12 11:11:03', NULL, NULL),
(3, 'PAYID-MUTZMVA5XM09068H8636174K', '30', '2023-10-12', '283.33', '85', 10, 'Complete', 0, NULL, 2, 2, 3, 92, '2023-10-12 12:16:56', NULL, NULL, NULL, NULL, '2023-10-12 12:16:05', NULL, NULL),
(4, NULL, '75', '2023-10-17', '283.33', '0', 0, NULL, 0, NULL, 2, 2, 3, 92, NULL, NULL, NULL, NULL, NULL, '2023-10-12 12:16:05', NULL, NULL),
(5, NULL, '100', '2023-10-19', '283.33', '0', 0, NULL, 0, NULL, 2, 2, 3, 92, NULL, NULL, NULL, NULL, NULL, '2023-10-12 12:16:05', NULL, NULL),
(6, NULL, '10', '2023-10-13', '2.50', '0.5', 10, NULL, 0, NULL, 3, 4, 3, 2, NULL, NULL, NULL, NULL, NULL, '2023-10-13 15:23:40', NULL, NULL),
(7, NULL, '0', '2023-10-21', '2.50', '0', 0, NULL, 0, NULL, 3, 4, 3, 2, NULL, NULL, NULL, NULL, NULL, '2023-10-13 15:23:40', NULL, NULL),
(8, 'PAYID-MU36QYQ96A90129E7471580S', '50', '2023-10-24', '200.00', '60', 10, 'Complete', 0, NULL, 4, 4, 3, 92, '2023-10-24 09:23:45', NULL, NULL, NULL, NULL, '2023-10-24 21:22:23', NULL, NULL),
(9, NULL, '30', '2023-10-26', '200.00', '0', 0, NULL, 0, NULL, 4, 4, 3, 92, NULL, NULL, NULL, NULL, NULL, '2023-10-24 21:22:23', NULL, NULL),
(10, NULL, '100', '2023-10-28', '200.00', '0', 0, NULL, 0, NULL, 4, 4, 3, 92, NULL, NULL, NULL, NULL, NULL, '2023-10-24 21:22:23', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pp_payment`
--

CREATE TABLE `pp_payment` (
  `id` int(11) NOT NULL,
  `payment_id` varchar(50) DEFAULT NULL,
  `professional_id` int(11) NOT NULL,
  `payer_email` varchar(255) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `currency` varchar(12) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `job_id` int(11) NOT NULL,
  `payment_type` varchar(20) DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `info` longtext DEFAULT NULL,
  `updated_date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pp_payment`
--

INSERT INTO `pp_payment` (`id`, `payment_id`, `professional_id`, `payer_email`, `amount`, `currency`, `plan_id`, `job_id`, `payment_type`, `status`, `info`, `updated_date`, `created_date`) VALUES
(1, 'X9YRRZ2FBGLTW', 92, NULL, 260, 'EUR', NULL, 1, 'Job', 'Completed', NULL, '2023-10-12 11:13:28', '2023-10-12 05:43:28'),
(2, 'PAYID-MUTZMVA5XM09068H8636174K', 92, '', 368.33, 'EUR', NULL, 2, 'Job', 'Completed', NULL, '2023-10-12 12:16:57', '2023-10-12 06:46:57'),
(3, 'PAYID-MU36QYQ96A90129E7471580S', 92, '', 260, 'EUR', NULL, 4, 'Job', 'Completed', NULL, '2023-10-24 21:23:49', '2023-10-24 15:53:49');

-- --------------------------------------------------------

--
-- Table structure for table `pp_professional`
--

CREATE TABLE `pp_professional` (
  `id` int(11) NOT NULL,
  `show_home_page` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `first_name` varchar(150) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `prof_device_token` tinytext DEFAULT NULL,
  `id_proof_attachment` varchar(255) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `profile_status` varchar(5) DEFAULT NULL,
  `education_data` longtext DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `profile_pic_path` text DEFAULT NULL,
  `proof_pic` text DEFAULT NULL,
  `proof_pic_path` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `payment_method` mediumtext DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `proof_accept_travel_city` longtext DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `linkedin` mediumtext DEFAULT NULL,
  `facebook` mediumtext DEFAULT NULL,
  `instagram` mediumtext DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `category_details` text DEFAULT NULL,
  `work_history` longtext DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `company_logo` text DEFAULT NULL,
  `company_logo_path` longtext DEFAULT NULL,
  `previous_work_attachment` text DEFAULT NULL,
  `previous_work_attachment_path` text DEFAULT NULL,
  `subscription_plan_id` int(11) DEFAULT NULL,
  `total_quot_pending` int(11) DEFAULT NULL,
  `total_invoice_pending` int(11) DEFAULT NULL,
  `certificate` text DEFAULT NULL,
  `certificate_path` text DEFAULT NULL,
  `company_details` text DEFAULT NULL,
  `siren_or_siret_no` varchar(100) DEFAULT NULL,
  `rcs_no` varchar(100) DEFAULT NULL,
  `vat` float(9,2) DEFAULT NULL,
  `rib` varchar(20) DEFAULT NULL,
  `job_done` int(11) DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `approved_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pp_professional`
--

INSERT INTO `pp_professional` (`id`, `show_home_page`, `user_id`, `first_name`, `last_name`, `email`, `password`, `gender`, `prof_device_token`, `id_proof_attachment`, `contact_number`, `profile_status`, `education_data`, `profile_pic`, `profile_pic_path`, `proof_pic`, `proof_pic_path`, `description`, `payment_method`, `city_id`, `address`, `proof_accept_travel_city`, `website`, `linkedin`, `facebook`, `instagram`, `twitter`, `category_details`, `work_history`, `company_name`, `company_logo`, `company_logo_path`, `previous_work_attachment`, `previous_work_attachment_path`, `subscription_plan_id`, `total_quot_pending`, `total_invoice_pending`, `certificate`, `certificate_path`, `company_details`, `siren_or_siret_no`, `rcs_no`, `vat`, `rib`, `job_done`, `status`, `approved_by`, `created_date`, `updated_date`) VALUES
(1, 1, 2, 'Professional', 'User', 'professional@gmail.com', '@xg7%#MTIzNDU2Nzg5*h$C@-', 'Mâle', NULL, NULL, '9512095120', '100.0', '[{\"certi_id\":1,\"name_of_certificat\":\"10th\",\"name_of_univer\":\"CBSC\",\"passing_year\":\"2004\",\"edu_certificate\":\"\"},{\"certi_id\":2,\"name_of_certificat\":\"12th\",\"name_of_univer\":\"CBSC\",\"passing_year\":\"2006\",\"edu_certificate\":\"\"},{\"certi_id\":3,\"name_of_certificat\":\"B.Tech\",\"name_of_univer\":\"KUK\",\"passing_year\":\"2011\",\"edu_certificate\":\"\"}]', '766915d74774122f8bc32db9e88165d8.png', 'https://pro.busybanda.com//public/modules/professionals/uploads/', '\"<p>The filetype you are attempting to upload is not allowed.<\\/p>\"', 'https://pro.busybanda.com//public/modules/professionals/uploads/', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,', NULL, 21, NULL, '[\"1\",\"3\"]', 'https://www.google.com', 'https://www.google.com', 'https://facbook.com/shia', 'https://www.google.com', 'https://www.google.com', '[{\"category_id\":\"3\",\"subcategory_id\":\"4\"},{\"category_id\":\"7\",\"subcategory_id\":\"9\"}]', 'Work History is Good\r\nWork History is Good\r\nWork History is Good\r\nWork History is Good', 'Click pro new', '695265863305ac870b933f3e10aa32a4.jpg', 'https://pro.busybanda.com//public/modules/professionals/uploads/', '[\"5e876e8847384ee666f84cc1a43eff78.jpg\",\"5a13627b6d45a676e3a504a1e4ba4014.jpg\",\"2c9e2a777dc0660211a97e1748866e32.png\",\"0aff1f89eb90eda760f90b9e29023b40.jpg\",\"be9349b433f45b4ef8fc00bd53daaa09.png\"]', 'https://pro.busybanda.com//public/modules/professionals/uploads/', 6, 33, 29, '[\"bacb77179ca372f00b0e8b5fc4296b99.png\",\"6e7726f574f4d27ab03cd881695c4028.png\"]', 'https://pro.busybanda.com//public/modules/professionals/uploads/', '[{\"category_id\":\"7\",\"subcategory_id\":\"9\",\"company_name\":\"Click pro\",\"location\":\"1\",\"country\":\"France\",\"title\":\"Title Avalable\",\"periode\":\"2023-09-28\",\"from_year\":\"2023-09-30\"},{\"category_id\":\"7\",\"subcategory_id\":\"9\",\"company_name\":\"Click pro 123\",\"location\":\"1\",\"country\":\"France 123\",\"title\":\"Title Avalable 1234\",\"periode\":\"2023-10-05\",\"from_year\":\"\"},{\"category_id\":\"7\",\"subcategory_id\":\"9\",\"company_name\":\"Click pro 123345\",\"location\":\"1\",\"country\":\"Country\",\"title\":\"Title Avalable 12343435\",\"periode\":\"2023-10-14\",\"from_year\":\"2023-10-28\"}]', 'SER2012', '1', 100.00, '100', 2, '1', NULL, '2023-08-02 17:09:57', NULL),
(56, 0, 90, 'yash', 'Professional', 'yash@professional.com', '@xg7%#YWRtaW5AMTIz*h$C@-', 'MALE', NULL, NULL, '9660856335', NULL, NULL, '3afab50bd47d9f6433e246b9ed9eccb6.jpg', 'https://pro.busybanda.com/public/modules/professionals/uploads/', NULL, NULL, 'no desc', NULL, 16, NULL, '[\"1\",\"17\"]', 'www.google.com', NULL, NULL, NULL, NULL, '[]', 'no work data', NULL, NULL, NULL, '[\"8881926acd19ec5da975c9ec59c639ac.jpg\",\"833f4f76e28111873b5c8d3000f335c4.jpg\"]', 'https://pro.busybanda.com/public/modules/professionals/uploads/', NULL, NULL, NULL, '[\"c31fb8485f60017df53a983051883f67.jpg\",\"24eae6d08a38f528b6253242dab32409.jpg\",\"88c3ad1a00299d7d7f93598896821aa6.jpg\"]', 'https://pro.busybanda.com/public/modules/professionals/uploads/', '[]', '1', '1', NULL, NULL, NULL, '1', NULL, '2023-09-28 11:13:11', NULL),
(58, 0, 92, 'YNew', 'Prof', 'ynew@professional.com', '@xg7%#YWRtaW5AMTIz*h$C@-', 'Female', NULL, NULL, '9512095120', '100.0', '[{\"certi_id\":1,\"name_of_certificat\":\"Diploma\",\"name_of_univer\":\"Chandighar\",\"passing_year\":\"2021\",\"edu_certificate\":\"\"},{\"certi_id\":2,\"name_of_certificat\":\"Diploma 123\",\"name_of_univer\":\"Chandighar 123\",\"passing_year\":\"2017\",\"edu_certificate\":\"\"},{\"certi_id\":3,\"name_of_certificat\":\"Diploma 123\",\"name_of_univer\":\"Chandighar 123456\",\"passing_year\":\"2010\",\"edu_certificate\":\"\"}]', 'e1453acc9f05b0958f4ba36fa62342c5.jpg', 'https://pro.busybanda.com/public/modules/professionals/uploads/', '\"0276266f8d8f618fae9acd466e5304fd.png\"', 'https://pro.busybanda.com//public/modules/professionals/uploads/', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,', NULL, 30, NULL, '[\"1\",\"4\",\"16\"]', 'https://pro.busybanda.com/', 'https://pro.busybanda.com/', 'https://pro.busybanda.com/', 'https://pro.busybanda.com/', 'https://pro.busybanda.com/', '[{\"category_id\":\"3\",\"subcategory_id\":\"7\"},{\"category_id\":\"5\",\"subcategory_id\":\"8\"}]', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,', 'Click pro 123', '2be52e51fb207a53513c1711c8504b78.jpg', 'https://pro.busybanda.com//public/modules/professionals/uploads/', '[\"05d932aad64013e3752c093531eefe68.jpg\"]', 'https://pro.busybanda.com/public/modules/professionals/uploads/', 6, 44, 49, '[\"3eb1d5cdd0c10fd9171050f5557c901c.jpg\"]', 'https://pro.busybanda.com/public/modules/professionals/uploads/', '[{\"category_id\":\"5\",\"subcategory_id\":\"8\",\"company_name\":\"COP\",\"location\":\"3\",\"country\":\"France\",\"title\":\"Cop Titre\",\"periode\":\"2023-10-06\",\"from_year\":\"2023-10-06\"},{\"category_id\":\"5\",\"subcategory_id\":\"8\",\"company_name\":\"COP12\",\"location\":\"3\",\"country\":\"France\",\"title\":\"Cop Titre12\",\"periode\":\"2023-10-10\",\"from_year\":\"2023-10-14\"}]', '123', '123', 1.00, '1', NULL, '1', NULL, '2023-09-28 12:28:18', NULL),
(67, 0, 109, 'shilpa', 'bhard', 'shilpa@lastingerp.com', '@xg7%#MTIzNDU2Nzg5*h$C@-', NULL, NULL, NULL, '01234567891', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '2023-10-09 16:29:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pp_quotation`
--

CREATE TABLE `pp_quotation` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `clientref_id` varchar(100) DEFAULT NULL,
  `estimate` float(9,2) DEFAULT NULL,
  `total_vat` float(9,2) DEFAULT NULL,
  `estimate_price` float(9,2) DEFAULT NULL,
  `estimate_project_time` varchar(255) DEFAULT NULL,
  `cover_description` text DEFAULT NULL,
  `send_quot` varchar(100) DEFAULT NULL,
  `instalment_plan` varchar(20) DEFAULT NULL,
  `versement_date1` date DEFAULT NULL,
  `versement_date2` date DEFAULT NULL,
  `versement_date3` date DEFAULT NULL,
  `versement_date4` date DEFAULT NULL,
  `versement_date5` date DEFAULT NULL,
  `versement_amount1` varchar(10) DEFAULT NULL,
  `versement_amount2` varchar(10) DEFAULT NULL,
  `versement_amount3` varchar(10) DEFAULT NULL,
  `versement_amount4` varchar(10) DEFAULT NULL,
  `versement_amount5` varchar(10) DEFAULT NULL,
  `attachment` text DEFAULT NULL,
  `attachment_path` varchar(255) DEFAULT NULL,
  `price_download` varchar(100) DEFAULT NULL,
  `work_start_date` date DEFAULT NULL,
  `work_end_date` varchar(225) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `necessary_material` tinyint(4) DEFAULT NULL COMMENT 'checkbox',
  `material_details` text DEFAULT NULL,
  `milestone` int(11) DEFAULT NULL,
  `pay_count` varchar(11) DEFAULT NULL,
  `customer_negotiation_count` int(11) DEFAULT NULL,
  `professional_negotiation_count` int(11) DEFAULT NULL,
  `total` float(9,2) DEFAULT NULL,
  `total_tax` float(9,2) DEFAULT NULL,
  `grand_total` float(9,2) DEFAULT NULL,
  `grand_total_estimate_price` float(9,2) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pp_quotation`
--

INSERT INTO `pp_quotation` (`id`, `user_id`, `job_id`, `cust_id`, `clientref_id`, `estimate`, `total_vat`, `estimate_price`, `estimate_project_time`, `cover_description`, `send_quot`, `instalment_plan`, `versement_date1`, `versement_date2`, `versement_date3`, `versement_date4`, `versement_date5`, `versement_amount1`, `versement_amount2`, `versement_amount3`, `versement_amount4`, `versement_amount5`, `attachment`, `attachment_path`, `price_download`, `work_start_date`, `work_end_date`, `comment`, `necessary_material`, `material_details`, `milestone`, `pay_count`, `customer_negotiation_count`, `professional_negotiation_count`, `total`, `total_tax`, `grand_total`, `grand_total_estimate_price`, `status`, `created_date`, `updated_date`) VALUES
(1, 92, 1, 3, NULL, 520.00, 5.20, 525.20, '5', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,', NULL, '2', '2023-10-12', '2023-10-15', '0000-00-00', '0000-00-00', '0000-00-00', '260.00', '260.00', '', '', '', NULL, NULL, NULL, '2023-10-12', '2023-10-19', 'hxhzzjzj', 0, '', 2, '1', 1, 1, 0.00, 0.00, 0.00, 520.00, 1, '2023-10-12 11:05:25', NULL),
(2, 92, 2, 3, NULL, 850.00, 8.50, 858.50, '5', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,', NULL, '3', '2023-10-12', '2023-10-13', '2023-10-19', '0000-00-00', '0000-00-00', '283.33', '283.33', '283.33', '', '', NULL, NULL, NULL, '2023-10-12', '2023-10-14', 'v h', 0, '', 3, '1', 1, 1, 0.00, 0.00, 0.00, 850.00, 1, '2023-10-12 12:14:14', NULL),
(3, 2, 4, 3, NULL, 5.00, 0.00, 5.00, '100', 'Work History is Good\r\nWork History is Good\r\nWork History is Good\r\nWork History is Good\r\n', NULL, '2', '2023-10-13', '2023-10-17', NULL, NULL, NULL, '2.50', '2.50', '0.00', '0.00', '0.00', NULL, NULL, NULL, '2023-10-13', '2023-10-18', 'fkdgljdf', 0, '', 2, NULL, 1, 1, 0.00, 0.00, 0.00, 5.00, NULL, '2023-10-13 15:22:41', NULL),
(4, 92, 4, 3, NULL, 600.00, 6.00, 606.00, '5', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,', NULL, '3', '2023-10-24', '2023-10-26', '2023-10-28', '0000-00-00', '0000-00-00', '200.00', '200.00', '200.00', '', '', NULL, NULL, NULL, '2023-10-24', '2023-10-31', 'xg', 0, '', 3, '1', 1, 1, 0.00, 0.00, 0.00, 600.00, 1, '2023-10-24 21:20:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pp_region`
--

CREATE TABLE `pp_region` (
  `id` int(11) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `region_name` varchar(100) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL COMMENT '0 => inactive, 1 => active',
  `approved_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pp_settings`
--

CREATE TABLE `pp_settings` (
  `logo` varchar(255) NOT NULL,
  `fb_api_key` varchar(255) DEFAULT NULL,
  `fb_secret_key` varchar(255) DEFAULT NULL,
  `fb_token` varchar(255) DEFAULT NULL,
  `g_api_key` varchar(255) DEFAULT NULL,
  `g_secret_key` varchar(255) DEFAULT NULL,
  `g_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pp_set_paymet_type`
--

CREATE TABLE `pp_set_paymet_type` (
  `id` int(11) NOT NULL,
  `method` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pp_set_paymet_type`
--

INSERT INTO `pp_set_paymet_type` (`id`, `method`, `description`, `status`, `created_date`, `updated_date`) VALUES
(1, 'Paypal', 'Paypal Description', 1, '2023-10-11 12:26:16', '2023-10-11 12:26:16'),
(2, 'Click O pro', 'Click o pro Desciption', 1, '2023-10-11 12:46:29', '2023-10-11 12:46:29'),
(3, 'Espèce', 'Espèce Desciption', 1, '2023-10-11 12:48:15', '2023-10-11 12:48:15'),
(4, 'Chèque SESU', 'Chèque SESU Desciption', 1, '2023-10-11 12:48:44', '2023-10-11 12:48:44'),
(5, 'Chèque bancaire', 'Chèque bancaire Desciption', 1, '2023-10-11 12:49:03', '2023-10-11 12:49:03');

-- --------------------------------------------------------

--
-- Table structure for table `pp_subcategory`
--

CREATE TABLE `pp_subcategory` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_name` varchar(255) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pp_subscription`
--

CREATE TABLE `pp_subscription` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `price_title` varchar(100) NOT NULL,
  `price` float(9,2) NOT NULL,
  `small_description` varchar(255) DEFAULT NULL,
  `quot_manage` varchar(50) NOT NULL DEFAULT '0',
  `invoice_manage` varchar(50) NOT NULL DEFAULT '0',
  `appointment_manage` tinyint(1) NOT NULL DEFAULT 0,
  `whatsapp_auto_reminder` tinyint(1) NOT NULL DEFAULT 0,
  `commission` int(11) NOT NULL DEFAULT 0 COMMENT 'in precent',
  `subscription_type` varchar(20) NOT NULL COMMENT 'monthly, yearly',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 => inactive, 1 => active',
  `created_by` int(11) NOT NULL,
  `approved_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pp_subscription`
--

INSERT INTO `pp_subscription` (`id`, `title`, `price_title`, `price`, `small_description`, `quot_manage`, `invoice_manage`, `appointment_manage`, `whatsapp_auto_reminder`, `commission`, `subscription_type`, `status`, `created_by`, `approved_by`, `created_date`, `updated_date`) VALUES
(1, 'Découverte', 'Gratuit', 0.00, 'Etre présent sur PagesJaunes', '5 Devis', '5 Factures', 1, 0, 10, 'yearly', '1', 1, 0, '2023-07-06 17:21:55', '2023-09-15 03:32:02'),
(2, 'Standard', 'XX,99$', 99.00, 'Etre présent partout sur internet', '50 Devis', '50 Factures', 1, 1, 5, 'yearly', '1', 1, 0, '2023-07-06 17:23:58', '2023-08-01 01:13:34'),
(3, 'Prime', 'XX,99$', 99.00, 'Faites décoller votre business', '100 Devis', '100 Factures', 1, 1, 2, 'yearly', '1', 1, 0, '2023-07-06 17:24:50', '2023-07-14 01:00:41'),
(4, 'Privilèges', 'XX,99$', 99.00, 'Fidélisez vos clients', 'Illimité', 'Illimité', 1, 1, 0, 'yearly', '1', 1, 0, '2023-07-06 17:26:08', '2023-07-06 17:26:08'),
(5, 'Découverte', 'Gratuit', 0.00, 'Etre présent sur PagesJaunes', '5 Devis', '5 Factures', 1, 0, 10, 'monthly', '1', 1, 0, '2023-07-06 17:21:55', '2023-09-15 03:32:13'),
(6, 'Standard', 'XX,99$', 150.00, 'Etre présent partout sur internet', '50 Devis', '50 Factures', 1, 1, 5, 'monthly', '1', 1, 0, '2023-07-06 17:23:58', '2023-09-12 01:36:09'),
(7, 'Prime', 'XX,99$', 99.00, 'Faites décoller votre business', '100 Devis', '100 Factures', 1, 1, 2, 'monthly', '1', 1, 0, '2023-07-06 17:24:50', '2023-07-14 01:00:56'),
(8, 'Privilèges', 'XX,99$', 99.00, 'Fidélisez vos clients', 'Illimité', 'Illimité', 1, 1, 0, 'monthly', '1', 1, 0, '2023-07-06 17:26:08', '2023-07-06 17:26:08');

-- --------------------------------------------------------

--
-- Table structure for table `pp_user`
--

CREATE TABLE `pp_user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` tinyint(1) NOT NULL COMMENT '2 from customer and 1 for professional and 0 for admin',
  `email_verification` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 for not verified and 1 for not verified',
  `reset_code` varchar(8) DEFAULT NULL,
  `reset_code_updated` datetime DEFAULT NULL,
  `registeration_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 from web, 1 from Facebook and 2 for Google',
  `logintype` int(11) NOT NULL DEFAULT 0,
  `last_online` datetime DEFAULT NULL,
  `customerToken` text DEFAULT NULL,
  `professionalToken` text DEFAULT NULL,
  `firbaseToken` text DEFAULT NULL,
  `updated_date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pp_user`
--

INSERT INTO `pp_user` (`id`, `name`, `email`, `phone`, `password`, `user_type`, `email_verification`, `reset_code`, `reset_code_updated`, `registeration_type`, `logintype`, `last_online`, `customerToken`, `professionalToken`, `firbaseToken`, `updated_date`, `created_date`) VALUES
(1, 'Forssa Erwing', 'admin@gmail.com', 696457187, '@xg7%#YWRtaW5AMTIz*h$C@-', 0, 1, '966207', '2023-07-14 10:28:58', 0, 0, '2023-10-11 01:54:20', NULL, NULL, NULL, '2023-10-11 13:54:20', '2023-07-13 11:18:23'),
(2, 'Professional User', 'professional@gmail.com', 9512095120, '@xg7%#MTIzNDU2Nzg5*h$C@-', 1, 1, '', NULL, 0, 0, '2025-04-23 10:27:22', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InByb2Zlc3Npb25hbEBnbWFpbC5jb20iLCJwYXNzd29yZCI6IjEyMzQ1Njc4OSIsInRpbWVTdGFtcCI6IjIwMjMtMTAtMjUgMDQ6MDE6NTYiLCJleHAiOjE3ODQ2Mjk5MTZ9.lGIGrMx0jD990Le6iKI1HzocGHpOuvk02fdysx5WLEA', 'e', '2025-04-23 10:27:22', '2023-08-02 17:09:57'),
(3, 'ClickoPro', 'customer@gmail.com', 4684864899, '@xg7%#MTIzNDU2Nzg5*h$C@-', 2, 1, '789811', '2023-08-18 15:39:57', 0, 0, '2023-10-13 03:31:58', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImN1c3RvbWVyQGdtYWlsLmNvbSIsInBhc3N3b3JkIjoiMTIzNDU2Nzg5IiwidGltZVN0YW1wIjoiMjAyMy0xMC0xMyAwMzowNzowNyIsImV4cCI6MTc4MzU4OTgyN30.WYUoTMWCDGg_dho31_w75-uiOdwmvlos6ZK0GXld-lQ', '', 'eBi3X', '2023-10-13 15:31:58', '2023-08-02 17:14:01'),
(90, 'Yash Professional', 'yash@professional.com', 9660856335, '@xg7%#YWRtaW5AMTIz*h$C@-', 1, 1, '', NULL, 0, 0, '2023-09-29 03:55:07', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Inlhc2hAcHJvZmVzc2lvbmFsLmNvbSIsInBhc3N3b3JkIjoiYWRtaW5AMTIzIiwidGltZVN0YW1wIjoiMjAyMy0wOS0yOCAxMToxMzoxMSIsImV4cCI6MTc4MjI3OTc5MX0.duiPLmmvMW2raPAq--PL8sC3aMX7dBVpoNnkWYXEcbU', 'eHV', '2023-09-29 15:55:07', '2023-09-28 11:13:11'),
(92, 'YNew Prof', 'ynew@professional.com', 9512095120, '@xg7%#YWRtaW5AMTIz*h$C@-', 1, 1, '', NULL, 0, 0, '2023-10-25 16:01:19', NULL, '', '', '2023-10-25 16:01:20', '2023-09-28 12:28:18'),
(93, 'Adelyne', 'adelyneetsebastian', 696047175, '@xg7%#QWRlbHluZTk3MjEy*h$C@-', 2, 0, '3012', '2023-10-07 02:21:56', 0, 0, NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFkZWx5bmVldHNlYmFzdGlhbiIsInBhc3N3b3JkIjoiQWRlbHluZTk3MjEyIiwidGltZVN0YW1wIjoiMjAyMy0xMC0wNyAwMjoyMTo1NiIsImV4cCI6MTc4MzAyNTUxNn0.37pTYBDgWAia34o5YY2d-cbUpZh5q4v0eW3fGkfHGu8', NULL, 'fcm_token', '2023-10-07 02:21:56', '2023-10-07 02:21:56'),
(94, 'Sebastien N', 'nilor.sebastien@gmail.com', 5145686767, '@xg7%#a2lwa2lwa2lw*h$C@-', 2, 0, '511436', '2023-10-07 02:25:12', 0, 0, '2023-10-07 02:31:31', NULL, NULL, NULL, '2023-10-07 02:31:31', '2023-10-07 02:23:53'),
(95, 'Adelyne', 'adelyneetsebastian@gmail.com', 696047175, '@xg7%#QWRlbHluZTk3MjEy*h$C@-', 2, 0, '6283', '2023-10-07 02:27:36', 0, 0, NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFkZWx5bmVldHNlYmFzdGlhbkBnbWFpbC5jb20iLCJwYXNzd29yZCI6IkFkZWx5bmU5NzIxMiIsInRpbWVTdGFtcCI6IjIwMjMtMTAtMDcgMDI6Mjc6MzYiLCJleHAiOjE3ODMwMjU4NTZ9.lajiUmF-zKOFi3VvvTrsLnxzZcCFGq5Y2CdfJ5b1DSo', NULL, 'fcm_token', '2023-10-07 02:27:36', '2023-10-07 02:27:36'),
(96, 'Beta Testeur', 'laurent.louison@smtvd.fr', 696818253, '@xg7%#MTIzNDU2Nzg5*h$C@-', 2, 0, '16014', '2023-10-07 02:29:52', 0, 0, '2023-10-07 02:32:05', NULL, NULL, NULL, '2023-10-07 02:32:05', '2023-10-07 02:28:47'),
(97, 'Adelyne', 'adelyneedon@gmail.com', 696047175, '@xg7%#QWRlbHluZTk3MjEy*h$C@-', 2, 0, '2763', '2023-10-07 02:30:43', 0, 0, NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFkZWx5bmVlZG9uQGdtYWlsLmNvbSIsInBhc3N3b3JkIjoiQWRlbHluZTk3MjEyIiwidGltZVN0YW1wIjoiMjAyMy0xMC0wNyAwMjozMDo0MyIsImV4cCI6MTc4MzAyNjA0M30.HR-7GS5vDm8ahttIyU3OVWpE00NWxZBRE6-ruJzrZfI', NULL, 'fcm_token', '2023-10-07 02:30:43', '2023-10-07 02:30:43'),
(98, 'Adelyne', 'sebastian.dft@gmail.com', 696047175, '@xg7%#QWRlbHluZTk3MjEy*h$C@-', 2, 0, '1236', '2023-10-07 02:31:55', 0, 0, NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNlYmFzdGlhbi5kZnRAZ21haWwuY29tIiwicGFzc3dvcmQiOiJBZGVseW5lOTcyMTIiLCJ0aW1lU3RhbXAiOiIyMDIzLTEwLTA3IDAyOjMxOjU1IiwiZXhwIjoxNzgzMDI2MTE1fQ.ZD2NEgGI6ZAYqlXIIJSKRBN3trYh1EFoq5EbSu70HGM', NULL, 'fcm_token', '2023-10-07 02:31:55', '2023-10-07 02:31:55'),
(109, 'shilpa bhard', 'shilpa@lastingerp.com', 1234567891, '@xg7%#MTIzNDU2Nzg5*h$C@-', 1, 0, '190850', '2023-10-09 17:57:15', 0, 0, NULL, NULL, NULL, NULL, '2023-10-09 17:57:15', '2023-10-09 16:29:58'),
(119, 'Yash Customer', 'yash@lastingerp.com', 9660856339, '@xg7%#YWRtaW5AMTIz*h$C@-', 2, 1, '', NULL, 0, 0, '2023-10-11 11:14:53', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Inlhc2hAbGFzdGluZ2VycC5jb20iLCJwYXNzd29yZCI6ImFkbWluQDEyMyIsInRpbWVTdGFtcCI6IjIwMjMtMTAtMTAgMDM6NDY6MjYiLCJleHAiOjE3ODMzMzI5ODZ9.g3K1K6LKtglByR6aoMp52DGBnBVkSa-87nTawmUWgZk', '', '', '2023-10-11 11:14:54', '2023-10-10 15:46:26');

-- --------------------------------------------------------

--
-- Table structure for table `pro_activity_log`
--

CREATE TABLE `pro_activity_log` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '0 for new job create for all users',
  `send_user` int(11) DEFAULT NULL,
  `rel_id` int(11) DEFAULT NULL,
  `rel_type` varchar(50) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `see_noti` int(2) NOT NULL DEFAULT 0 COMMENT '0 for not see 1 for see'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pro_activity_log`
--

INSERT INTO `pro_activity_log` (`id`, `description`, `user_id`, `send_user`, `rel_id`, `rel_type`, `url`, `date`, `see_noti`) VALUES
(1, 'un nouveau travail a été ajouté', 0, 3, 1, 'pp_job_posting', 'jobs/jobs_list?tab=active_jobs', '2023-10-12 11:04:32', 0),
(2, 'A postulé avec succès pour un emploi', 92, 0, 1, '', '', '2023-10-12 11:05:25', 0),
(3, 'Un devis a été soumis pour', NULL, 3, 1, 'quotation', 'quotation/quotes_listing?tab=pending', '2023-10-12 11:05:25', 0),
(4, 'La négociation sera envoyée à partir de', 92, 3, NULL, 'pp_job_posting', 'quotation/view_quotes/1', '2023-10-12 11:11:03', 0),
(5, 'Le paiement a été reçu', 92, 3, 1, 'pp_job_posting', 'invoice/index', '2023-10-12 11:11:58', 0),
(6, 'Rendez-vous créé avec succès', 92, 0, 1, '', '', '2023-10-12 12:04:12', 0),
(7, 'A postulé avec succès pour un emploi', 92, 0, 2, '', '', '2023-10-12 12:14:14', 0),
(8, 'Un devis a été soumis pour', NULL, 3, 2, 'quotation', 'quotation/quotes_listing?tab=pending', '2023-10-12 12:14:14', 0),
(9, 'un nouveau travail a été ajouté', 0, 3, 3, 'pp_job_posting', 'jobs/jobs_list?tab=active_jobs', '2023-10-12 13:45:29', 0),
(10, 'Un devis a été soumis pour', 2, 3, 3, 'quotation', 'quotation/quotes_listing?tab=pending', '2023-10-13 15:22:41', 1),
(11, 'A postulé avec succès pour un emploi', 92, 0, 4, '', '', '2023-10-24 21:20:07', 0),
(12, 'Un devis a été soumis pour', NULL, 3, 4, 'quotation', 'quotation/quotes_listing?tab=pending', '2023-10-24 21:20:07', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_activity_log`
--
ALTER TABLE `admin_activity_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_activity_log`
--
ALTER TABLE `customer_activity_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_advar_title`
--
ALTER TABLE `pp_advar_title`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_advertisement`
--
ALTER TABLE `pp_advertisement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_appointment`
--
ALTER TABLE `pp_appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_category`
--
ALTER TABLE `pp_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_chat`
--
ALTER TABLE `pp_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_city`
--
ALTER TABLE `pp_city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_coins_trans`
--
ALTER TABLE `pp_coins_trans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_country`
--
ALTER TABLE `pp_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_customer`
--
ALTER TABLE `pp_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_customer_commission`
--
ALTER TABLE `pp_customer_commission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_job_posting`
--
ALTER TABLE `pp_job_posting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_manage_subscriptions_plan`
--
ALTER TABLE `pp_manage_subscriptions_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_negotiation`
--
ALTER TABLE `pp_negotiation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_payment`
--
ALTER TABLE `pp_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_professional`
--
ALTER TABLE `pp_professional`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_quotation`
--
ALTER TABLE `pp_quotation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_region`
--
ALTER TABLE `pp_region`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_set_paymet_type`
--
ALTER TABLE `pp_set_paymet_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_subcategory`
--
ALTER TABLE `pp_subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_subscription`
--
ALTER TABLE `pp_subscription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pp_user`
--
ALTER TABLE `pp_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pro_activity_log`
--
ALTER TABLE `pro_activity_log`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_activity_log`
--
ALTER TABLE `admin_activity_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_activity_log`
--
ALTER TABLE `customer_activity_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pp_advar_title`
--
ALTER TABLE `pp_advar_title`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pp_advertisement`
--
ALTER TABLE `pp_advertisement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pp_appointment`
--
ALTER TABLE `pp_appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pp_category`
--
ALTER TABLE `pp_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pp_chat`
--
ALTER TABLE `pp_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pp_city`
--
ALTER TABLE `pp_city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `pp_coins_trans`
--
ALTER TABLE `pp_coins_trans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pp_country`
--
ALTER TABLE `pp_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pp_customer`
--
ALTER TABLE `pp_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `pp_customer_commission`
--
ALTER TABLE `pp_customer_commission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pp_job_posting`
--
ALTER TABLE `pp_job_posting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pp_manage_subscriptions_plan`
--
ALTER TABLE `pp_manage_subscriptions_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pp_negotiation`
--
ALTER TABLE `pp_negotiation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pp_payment`
--
ALTER TABLE `pp_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pp_professional`
--
ALTER TABLE `pp_professional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `pp_quotation`
--
ALTER TABLE `pp_quotation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pp_region`
--
ALTER TABLE `pp_region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pp_set_paymet_type`
--
ALTER TABLE `pp_set_paymet_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pp_subcategory`
--
ALTER TABLE `pp_subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pp_subscription`
--
ALTER TABLE `pp_subscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pp_user`
--
ALTER TABLE `pp_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `pro_activity_log`
--
ALTER TABLE `pro_activity_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

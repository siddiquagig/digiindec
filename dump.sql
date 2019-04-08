-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 31, 2019 at 11:46 AM
-- Server version: 5.7.24-cll-lve
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `i45010_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `access_level` enum('usr','adm') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'usr',
  `is_approved` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_hidden` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_active` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_owner` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `recover_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recover_expires` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `groups` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cellphone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `about` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `created_at`, `updated_at`, `access_level`, `is_approved`, `is_hidden`, `is_active`, `is_owner`, `recover_key`, `recover_expires`, `email`, `login`, `password`, `groups`, `image`, `full_name`, `cellphone`, `job`, `about`) VALUES
(1, '2018-02-06 18:16:40', '2018-07-11 08:51:12', 'adm', '1', '0', '1', '1', NULL, NULL, 'a.sizintsev@outlook.com', 'AleXX', '$2y$10$EsmV61KL5C7t3.wikXCme.O65/991IoJgJypdnHLs729HXew2Utfm', '[\"admin\"]', 'storage/ee/0d5/d52baf/face-4b-4.jpg', 'Алексей Сизинцев', '+38 (097) 779-04-99', 'Программист', ''),
(4, '2018-07-19 09:47:34', '2018-07-19 09:47:34', 'adm', '0', '0', '1', '0', NULL, NULL, 'admin@gmail.com', 'admin', '$2y$10$oqtJPcMsibEg24usGVXShei13UPNxxQLYuPXD855hNz.ZDvgVNQlS', '[\"admin\"]', '', 'admin', '', 'admin', '');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_log`
--

CREATE TABLE `accounts_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `module_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `changelog` longtext CHARACTER SET utf8
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_options`
--

CREATE TABLE `accounts_options` (
  `account_id` int(11) UNSIGNED NOT NULL,
  `option_name` varchar(255) NOT NULL,
  `option_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_session`
--

CREATE TABLE `accounts_session` (
  `account_id` int(10) UNSIGNED NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts_session`
--

INSERT INTO `accounts_session` (`account_id`, `token`) VALUES
(1, 'c4a566c6-84e0-11e8-ad98-18a6f71a761b'),
(1, 'd6f04176-8b38-11e8-8a5a-065088fbad26'),
(4, '26b46ac4-8b58-11e8-8bdd-065088fbad26'),
(4, 'd78f6ae4-8b38-11e8-b96d-065088fbad26'),
(1, '58772b9c-17fc-11e9-9ea2-382c4a5338a3'),
(1, 'f357c402-1afc-11e9-b4bf-9f3f99d16cd2');

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_public` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blocks`
--

INSERT INTO `blocks` (`id`, `created_at`, `updated_at`, `is_public`, `title`, `slug`, `content`) VALUES
(1, '2018-07-30 10:55:33', '2018-09-04 05:59:50', '1', 'Hello dear {{ signee.name|default(signee.email) }}!', 'mail.remind', '<p>We have noticed that you were going to sign your personal digital rights declaration on the blockchain.\r\n        However, your signature wasn\'t saved on the blockchain yet because we would need your donation in\r\n        order to be able to sign the declaration on the blockchain.</p>\r\n\r\n    <p>Please, proceed and make a minimum transaction of Ethereum so that we can record your\r\n        declaration on the blockchain: <strong>{{ signee.deposit_address }}</strong>.</p>\r\n\r\n    <p>&nbsp;</p>\r\n\r\n    <p>Kind Regards, <br>\r\n        Digital Rights Declaration Team</p>'),
(2, '2018-07-30 10:55:47', '2019-01-21 06:58:38', '1', 'Hello dear {{ signee.name|default(signee.email) }}!', 'mail.success', '<p>We are happy to inform you that your personal digital independence declaration was created!</p>\r\n\r\n<p>You can view your declaration <a style=\"font-weight: bold; text-align: center; color: #012fc7;\" href=\"{{ route(\'signee\', {email : signee.id}) }}\">here</a></p>\r\n\r\n<p>Please, feel free to share your declaration to social media, so that everyone knows you are independent now!</p>\r\n<p>&nbsp;</p>\r\n\r\n<p>Kind Regards, <br>\r\nDigital Independence Declaration Team</p>'),
(3, '2018-07-31 09:11:35', '2018-07-31 09:11:35', '1', 'Hello dear {{ signee.name|default(signee.email) }}!', 'mail.remind.later', '<p>We have noticed that you were going to sign your personal digital rights declaration on the blockchain.\r\n        However, your signature wasn\'t saved on the blockchain because we would need your donation in\r\n        order to be able to sign the declaration on the blockchain.</p>\r\n\r\n    <p>Please, proceed here and make a minimum transaction of bitcoin or any other altcoin so that we can record your\r\n        declaration on the blockchain: <strong>{{ signee.deposit_address }}</strong>.</p>\r\n\r\n    <p>&nbsp;</p>\r\n\r\n    <p>Kind Regards, <br>\r\n        Digital Rights Declaration Team</p>'),
(4, '2018-08-29 04:14:23', '2018-09-04 07:04:22', '1', 'Hello dear {{ signee.name|default(signee.email) }}!', 'mail.receive-data', '<p>We have noticed that you were going to sign your personal\r\ndigital rights declaration on the blockchain. However, your\r\nsignature wasn\'t saved on the blockchain yet because we would need your\r\ndonation in order to be able to sign the declaration on the blockchain.</p>\r\n\r\n<p>Please, proceed and make a transaction of {{ fee.fee_crypto }} ETH so \r\nthat we can record your declaration on the blockchain\r\n<strong>{{ signee.deposit_address }}</strong>.</p>\r\n\r\n    <p>&nbsp;</p>\r\n\r\n    <p>Kind Regards, <br>\r\n        Digital Rights Declaration Team</p>'),
(5, '2018-08-31 05:45:21', '2018-09-04 07:19:07', '1', 'Hello dear {{ signee.name|default(signee.email) }}!', 'mail.receive-pay', '<p>We’ve received your payment, and it will be processed soon.\r\nThe transaction usually takes a few minutes, but depending on\r\nthe status of the network it may take a little longer.</p>\r\n\r\n    <p>&nbsp;</p>\r\n\r\n    <p>Kind Regards, <br>\r\n        Digital Rights Declaration Team</p>');

-- --------------------------------------------------------

--
-- Table structure for table `cdn_files`
--

CREATE TABLE `cdn_files` (
  `id` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `hash` varchar(64) NOT NULL,
  `path` varchar(255) NOT NULL,
  `mime_type` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cdn_files`
--

INSERT INTO `cdn_files` (`id`, `parent`, `filename`, `hash`, `path`, `mime_type`) VALUES
(27, 0, 'wp-20130706-002.jpg', 'fe6875ec8a45dc14350f10069174d927', 'fe/687/875ec8/wp-20130706-002.jpg', 'image/jpeg'),
(28, 0, 'face-4b-4.jpg', 'ee0d52bafff27c9a80c67386fc4276ba', 'ee/0d5/d52baf/face-4b-4.jpg', 'image/jpeg'),
(29, 0, '6112099-326933382.jpg', 'c58f0d4522a65a3e8e8755afb6d37c72', 'c5/8f0/f0d452/6112099-326933382.jpg', 'image/jpeg'),
(30, 0, '1212-3.jpg', '83341ecc9148e3ea34533dce54251e30', '83/341/41ecc9/1212-3.jpg', 'image/jpeg'),
(31, 0, 'p-anlkjxj-4.jpg', 'a3a09d7522567a7db78dbc22b1f0a519', 'a3/a09/09d752/p-anlkjxj-4.jpg', 'image/jpeg'),
(32, 0, '1212-2.jpg', '91767a5fb74c4fffd77b4b1fbcdb8a73', '91/767/67a5fb/1212-2.jpg', 'image/jpeg'),
(33, 0, 'logo1.png', 'e64069f2179ad9031d296ddf8cb8baea', 'e6/406/069f21/logo1.png', 'image/png'),
(34, 0, 'logo2.png', '6e722ee576f00f9f57167705069f4bd7', '6e/722/22ee57/logo2.png', 'image/png'),
(35, 0, 'logo3.png', '2449b8bcabda2e6ea87b4da394cacd60', '24/49b/9b8bca/logo3.png', 'image/png'),
(36, 0, 'logo4.png', '3a71082c13ef32f65a628cf324e66e1c', '3a/710/1082c1/logo4.png', 'image/png'),
(37, 0, 'logo5.png', 'f35f3fdcdc955b9ddf8374077967b81d', 'f3/5f3/f3fdcd/logo5.png', 'image/png'),
(38, 0, 'logo6.png', '7d797c7b7f5ca8d9244c796183c9a1bb', '7d/797/97c7b7/logo6.png', 'image/png'),
(39, 0, 'logo7.png', 'cbbb51e8c24343ee24ae2ddcbcb2285b', 'cb/bb5/b51e8c/logo7.png', 'image/png'),
(40, 0, 'logo8.png', '74bd88f912bfafe75198403fd37f3ba8', '74/bd8/d88f91/logo8.png', 'image/png'),
(41, 0, 'logo9.png', '5caf0f4f6862fce00d0dd16937713b00', '5c/af0/f0f4f6/logo9.png', 'image/png'),
(42, 0, 'logo10.png', 'b9d4568d355ee4555d10a7330c9b2dc8', 'b9/d45/4568d3/logo10.png', 'image/png'),
(43, 0, 'logo11.png', 'dd3838722900401f65e14e14cc7ed465', 'dd/383/838722/logo11.png', 'image/png'),
(44, 0, 'logo12.png', '2a8bad2c4bb7f07b355d31152406028b', '2a/8ba/bad2c4/logo12.png', 'image/png'),
(46, 0, 'khuy-s-probelami.jpg', 'c2a95ea1d523db55221476be1ed1ac39', 'c2/a95/95ea1d/khuy-s-probelami.jpg', 'image/jpeg'),
(47, 0, 'facebook-20150918-102539.jpg', '0cbc131b6da1cd3eabfed89459d9078e', '0c/bc1/c131b6/facebook-20150918-102539.jpg', 'image/jpeg'),
(48, 0, 'getty-962121864-2000149520009280154-359755.jpg', 'cebabbdda4fd94c5c6ded37c9fbc306d', 'ce/bab/abbdda/getty-962121864-2000149520009280154-359755.jpg', 'image/jpeg'),
(49, 0, '1515738809-4976-illyustratsiya.jpg', 'c7876cb0282f1ce9c7763132fefd7848', 'c7/876/76cb02/1515738809-4976-illyustratsiya.jpg', 'image/jpeg'),
(50, 0, 'untitled-1.png', '47b7eb8c0d6c590eadab1da2e3519e96', '47/b7e/7eb8c0/untitled-1.png', 'image/png'),
(51, 0, 'inc.png', '5b7bcd6ce6354e5c357be6cf07b00582', '5b/7bc/bcd6ce/inc.png', 'image/png'),
(52, 0, 'inc001.jpeg', '98bedd4fef00d37a7273360823efee76', '98/bed/edd4fe/inc001.jpeg', 'image/jpeg'),
(53, 0, 'cbs001.jpeg', 'e4dcd4c2fe939ed0869fe4ef58856b96', 'e4/dcd/cd4c2f/cbs001.jpeg', 'image/jpeg'),
(54, 0, 'wp001.jpeg', 'a7b13b980db71adff9690595204fe508', 'a7/b13/13b980/wp001.jpeg', 'image/jpeg'),
(55, 0, 'hbr001.jpeg', '5f1e8656230945c4c0dbb2f7c0dca3b7', '5f/1e8/e86562/hbr001.jpeg', 'image/jpeg'),
(56, 0, 'dt001.jpeg', '571748393089c5ca8664b34b376df5b3', '57/174/748393/dt001.jpeg', 'image/jpeg'),
(57, 0, 'et001.jpeg', '2ba7303209a12aee7aa33131d82147f1', '2b/a73/730320/et001.jpeg', 'image/jpeg'),
(58, 0, 'ent001.jpeg', '7d7937ad64602dc760d05eb1c5ad3eba', '7d/793/937ad6/ent001.jpeg', 'image/jpeg'),
(59, 0, 'the-verge001.jpeg', '81145866ba0b1f3025ebabc4d8dcabe7', '81/145/45866b/the-verge001.jpeg', 'image/jpeg'),
(60, 0, 'og-drd.png', '7ba033f887ed097a899a434f67f5a682', '7b/a03/033f88/og-drd.png', 'image/png'),
(61, 0, 'azb001.png', 'f6e9faf8990fc63b0e736b0e2f8081c8', 'f6/e9f/9faf89/azb001.png', 'image/png'),
(62, 0, 'azb001png001.png', '07064d39d9c2c9ac0ed99644d80fc3f9', '07/064/64d39d/azb001png001.png', 'image/png'),
(63, 0, 'logo-3.png', '3b1cf20ddf2ef4d3b37dc2b2b338e194', '3b/1cf/cf20dd/logo-3.png', 'image/png'),
(64, 0, 'ct001.png', '13ea9cbe3e428dcb8ffd74327c892964', '13/ea9/a9cbe3/ct001.png', 'image/png'),
(65, 0, 'cprkit001.png', '01e33029ee8654d39e2ed809f635db32', '01/e33/33029e/cprkit001.png', 'image/png'),
(66, 0, 'synergize001.png', 'c3f7c83b44f8ea821f3b85f92cf5af1d', 'c3/f7c/7c83b4/synergize001.png', 'image/png'),
(67, 0, 'reddit001.png', '3e24f18d88dc2c67a46c1d07c3c2f201', '3e/24f/4f18d8/reddit001.png', 'image/png');

-- --------------------------------------------------------

--
-- Table structure for table `i18n`
--

CREATE TABLE `i18n` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_default` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_short` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `i18n`
--

INSERT INTO `i18n` (`id`, `created_at`, `updated_at`, `is_active`, `is_default`, `title`, `title_short`, `code`, `position`) VALUES
(1, NULL, NULL, '1', '1', 'Русский', 'Рус', 'ru', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2018_02_06_140501_users', 1),
(2, '2018_02_06_151531_accounts_session', 1),
(3, '2018_02_07_181459_settings', 2),
(4, '2018_02_08_152422_i18n', 3),
(5, '2018_03_20_151433_blocks', 4),
(6, '2018_03_31_182104_Log', 5),
(7, '2018_03_31_182819_LogEntityIdAdd', 6),
(8, '2018_05_13_082217_Accounting', 7),
(9, '2018_05_14_113022_Tags', 7),
(10, '2018_03_27_145514_forms', 8),
(11, '2018_05_16_141551_Invoices', 9),
(12, '2018_05_29_135913_log', 10),
(13, '2018_06_04_132414_feed', 11),
(14, '2018_06_12_135802_countries', 12),
(15, '2018_06_12_140252_countries_slug', 13),
(16, '2018_06_12_144235_plantation', 14),
(17, '2018_06_13_072003_tree', 15),
(18, '2018_06_13_080908_tree_items', 16),
(19, '2018_06_14_082500_plantation_fields', 17),
(20, '2018_06_14_083518_plantation_coords', 18),
(21, '2018_06_14_100153_rubrics', 19),
(22, '2018_06_14_115428_articles', 20),
(24, '2018_06_14_120000_articles_rubrics_relations', 21),
(25, '2018_06_19_083401_menu', 22),
(26, '2018_07_11_085706_signers', 23),
(27, '2018_07_11_095106_supporters', 24),
(28, '2018_07_11_100624_reasons', 25),
(29, '2018_07_13_065417_reasons-url', 26);

-- --------------------------------------------------------

--
-- Table structure for table `reasons`
--

CREATE TABLE `reasons` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reasons`
--

INSERT INTO `reasons` (`id`, `created_at`, `updated_at`, `image`, `title`, `url`, `position`) VALUES
(8, '2018-07-19 12:41:55', '2018-07-19 12:45:21', '{\"path\":\"storage\\/98\\/bed\\/edd4fe\\/inc001.jpeg\",\"signature\":{\"1\":\"Inc.\"}}', 'Inc.: \"Facebook\'s Newest Scandal Affected 14 Million People\'s Privacy. Here\'s What\'s Different This Time\"', 'https://www.inc.com/bill-murphy-jr/facebooks-newest-privacy-scandal-is-simple-dangerous-heres-why.html', 0),
(9, '2018-07-19 12:48:56', '2018-07-19 12:48:56', '{\"path\":\"storage\\/e4\\/dcd\\/cd4c2f\\/cbs001.jpeg\",\"signature\":{\"1\":\"CBS News\"}}', 'CBS News: \"Facebook glitch changed millions of privacy settings to \"public\"', 'https://www.cbsnews.com/news/facebook-glitch-changed-millions-of-privacy-settings-to-public/', 0),
(10, '2018-07-19 12:52:14', '2018-07-19 12:52:14', '{\"path\":\"storage\\/a7\\/b13\\/13b980\\/wp001.jpeg\",\"signature\":{\"1\":\"The Washington Post\"}}', 'The Washington Post: \"Amazon is selling facial recognition to law enforcement — for a fistful of dollars\"', 'https://www.washingtonpost.com/news/the-switch/wp/2018/05/22/amazon-is-selling-facial-recognition-to-law-enforcement-for-a-fistful-of-dollars/?noredirect=on&utm_term=.4ae56ec5ec3b', 0),
(11, '2018-07-19 12:54:39', '2018-07-19 12:54:39', '{\"path\":\"storage\\/5f\\/1e8\\/e86562\\/hbr001.jpeg\",\"signature\":{\"1\":\"Harvard Business Review\"}}', 'Harvard Business Review: \"Google’s AI Assistant Is a Reminder that Privacy and Security Are Not the Same\"', 'https://hbr.org/2018/05/googles-ai-assistant-is-a-reminder-that-privacy-and-security-are-not-the-same', 0),
(12, '2018-07-19 12:59:12', '2018-07-19 12:59:12', '{\"path\":\"storage\\/57\\/174\\/748393\\/dt001.jpeg\",\"signature\":{\"1\":\"Digital Trends\"}}', 'Digital Trends: \"Amazon, Microsoft, Uber donate to oppose the California Consumer Privacy Act\"', 'https://www.digitaltrends.com/computing/tech-opposes-california-privacy-act/', 0),
(13, '2018-07-19 13:02:35', '2018-07-19 13:02:35', '{\"path\":\"storage\\/2b\\/a73\\/730320\\/et001.jpeg\",\"signature\":{\"1\":\"Economic Times\"}}', 'Economic Times: \"Alexa’s recording leak in US ‘echoes’ privacy issues here\"', 'https://economictimes.indiatimes.com/small-biz/startups/newsbuzz/alexas-recording-leak-in-us-echoes-privacy-issues-here/articleshow/64363491.cms', 0),
(14, '2018-07-19 13:05:41', '2018-07-19 13:05:41', '{\"path\":\"storage\\/7d\\/793\\/937ad6\\/ent001.jpeg\",\"signature\":{\"1\":\"Entrepreneur\"}}', 'Entrepreneur: \"Internet Users Worry About Online Privacy but Feel Powerless to Do Much About It\"', 'https://www.entrepreneur.com/article/314524', 0),
(15, '2018-07-19 13:06:57', '2018-07-19 13:08:43', '{\"path\":\"storage\\/81\\/145\\/45866b\\/the-verge001.jpeg\",\"signature\":{\"1\":\"The Verge\"}}', 'The Verge: \"How AT&T’s plan to become the new Facebook could be a privacy nightmare\"', 'https://www.theverge.com/2018/7/16/17569602/att-verizon-silicon-valley-facebook-google-net-neutrality-ad-targeting-privacy-nightmare', 0),
(16, '2018-08-02 14:46:44', '2018-08-02 14:50:35', '{\"path\":\"storage\\/3e\\/24f\\/4f18d8\\/reddit001.png\",\"signature\":{\"1\":\"Reddit Hacked, Despite SMS Two-Factor Authentication\"}}', 'Enterpreneur: \"Reddit Hacked, Despite SMS Two-Factor Authentication\"', 'https://www.entrepreneur.com/article/317830', 0);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `i18n` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `param` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `created_at`, `updated_at`, `i18n`, `param`, `storage`) VALUES
(1, '2018-02-08 14:38:41', '2018-02-08 15:14:14', '1', 'general/site_name', '{\"1\":\"\\u0425\\u0443\\u0439\",\"2\":\"Dick\"}'),
(2, '2018-06-12 10:05:53', '2019-01-21 06:43:47', '1', 'system/branding/cms/h1', '{\"1\":\"Digital Independence Declaration\"}'),
(3, '2018-06-12 10:05:53', '2019-01-21 06:43:47', '0', 'system/domain', 'digindec.com'),
(4, '2018-07-20 07:29:18', '2019-01-21 06:55:24', '0', 'social/facebook', 'https://www.facebook.com/Digital-Independence-Declaration-790593687958335/'),
(5, '2018-07-20 07:29:18', '2019-01-21 06:55:24', '0', 'social/twitter', 'https://twitter.com/DigInDec'),
(6, '2018-07-20 07:29:18', '2018-07-20 07:29:18', '0', 'social/linkedin', 'https://linkedin.com'),
(7, '2018-07-20 07:29:18', '2018-07-20 07:29:18', '0', 'social/google_plus', 'https://plus.google.com'),
(8, '2018-07-20 07:29:18', '2019-01-21 06:44:07', '0', 'meta/homepage', '{\"seo_title\":{\"1\":\"Digital Independence Declaration\"},\"seo_keywords\":{\"1\":null},\"seo_description\":{\"1\":\"Declare the independence of your digital identity on the blockchain\\u2014 independence from corporations, governments and anyone else with an interest in your personal data.\"},\"og_image\":\"storage\\/7b\\/a03\\/033f88\\/og-drd.png\",\"og_type\":\"web_site\",\"og_title\":{\"1\":\"Digital Independence Declaration\"},\"og_description\":{\"1\":\"Declare the independence of your digital identity on the blockchain\\u2014 independence from corporations, governments and anyone else with an interest in your personal data.\"}}'),
(9, '2018-07-20 07:29:18', '2019-01-21 06:44:15', '0', 'meta/signees', '{\"seo_title\":{\"1\":\"Digital Independence Declaration\"},\"seo_keywords\":{\"1\":null},\"seo_description\":{\"1\":\"Declare the independence of your digital identity on the blockchain\\u2014 independence from corporations, governments and anyone else with an interest in your personal data.\"},\"og_image\":null,\"og_type\":\"web_site\",\"og_title\":{\"1\":\"Digital Independence Declaration\"},\"og_description\":{\"1\":\"Declare the independence of your digital identity on the blockchain\\u2014 independence from corporations, governments and anyone else with an interest in your personal data.\"}}'),
(10, '2018-08-14 11:16:57', '2018-09-04 10:37:39', '1', 'content/privacy', '{\"1\":\"<p>\\u200b\\u200b\\u200b\\u200b\\u200b\\u200b\\u200b<strong>Introduction<\\/strong><\\/p><p>This Privacy Policy describes the Digitalrightsdeclaration\'s (also, the \\\"Company\\\") privacy practices with regard to your Personal Data. Personal Data includes any data about you that specifically identifies you as an individual and information about your activities, such as information about your use of our Digitalrightsdeclaration.com (also, the \\\"Service\\\"), when directly linked to personally identifiable information.<\\/p><p>You accept this Privacy Policy and consent to the collection, storage, use, and disclosure of your Personal Data in accordance with this Privacy Policy. You may withdraw your consent and require removal of your Personal Data by contacting us using the information in this paper.<\\/p><p><br data-cke-filler=\\\"true\\\"><\\/p><p><strong>Collection<\\/strong><\\/p><ol><li>During the signature procedure we may collect some Personal Data, including name and email;<\\/li><li>It is up to you to give your Email or not. In case you provide Us with it, it still won\'t be shared within the blockchain.<\\/li><li>We may collect some Personal Data automatically (your IP address, browser type and version, information about your visit including the URL clickstream to, through and from our Service, web pages you viewed or searched for, length of visits to certain web pages, web page interaction), through the use of tracking technologies including cookies and Google Analytics.<\\/li><\\/ol><p><br data-cke-filler=\\\"true\\\"><\\/p><p><strong>Use<\\/strong><\\/p><p>We may use your Personal Data for the following purposes:<\\/p><ol><li>Processing of your declaration inquiry<\\/li><li>Analyzing and understanding our audience for the purposes of improving our Declaration<\\/li><li>Investigate violations of this Privacy Policy or Service Agreement<\\/li><li>Sending you notification email with the information about your declaration. You may opt out of such email by not providing us with your email<\\/li><\\/ol><p><br data-cke-filler=\\\"true\\\"><\\/p><p><strong>Disclosure<\\/strong><\\/p><ol><li>We may disclose some information with certain third parties in case this disclosure is necessary to:<ul><li>meet any applicable law, regulation, legal process or enforceable governmental request<\\/li><li>detect, prevent, or otherwise address fraud, security or technical issues<\\/li><li>protect against harm to the rights,<\\/li><li>property or safety of the Company, our users or the public as required or permitted by law<\\/li><\\/ul><\\/li><li>We may share information with other services:<ul><li>SendPulse. We use this service in order to send you a notification about your transaction. This feature is optional, so it is up to you to choose it or not;<\\/li><li>Google Analytics. We use this service in order to get statistics and basic analytical tools; and<\\/li><li>Amazon. We use this service in order to store your data.<\\/li><\\/ul><\\/li><\\/ol><p><br data-cke-filler=\\\"true\\\"><\\/p><p><strong>Third parties services<\\/strong><\\/p><p>Our Service may contain links to and from third parties\\u2019 websites, apps or other services (including social media). If you follow a link to any of them, please note that those websites have their own privacy practices. Please check the third parties\\u2019 policies before you submit any Personal Data to their services.<\\/p><p><br data-cke-filler=\\\"true\\\"><\\/p><p><strong>Data storage and security and cross-border transfer<\\/strong><\\/p><ol><li>We will use all reasonable measures to protect your Personal Data from unauthorized access, alteration, disclosure or removal. The Service is equipped with the means of security and protection of your Personal Data.<\\/li><li>Immediate access to your Personal Data is allowed only to us and persons authorized by us and involved in the maintenance of the Website. Such persons will strictly keep confidentiality of and prevent unauthorized third-party access to your Personal Data.<\\/li><li>Please remember that our Website (and your Personal Data) may be hosted on a server outside your home country. Supplying us with your Personal Data, you permit its transfer outside the country, within the bounds of use of such Personal Data in accordance with the applicable law.<\\/li><li>We emphasize that none of the existing ways of data transfer can be absolutely safe. The Company does not guarantee the absolute security of data in case of unauthorized access of the third parties.<\\/li><li>Our Service will store your Data as long as you are our User in order to fulfill our purposes mentioned above.<\\/li><\\/ol><p><br data-cke-filler=\\\"true\\\"><\\/p><p><strong>Children\'s privacy<\\/strong><\\/p><ol><li>We do not collect, use or share the Personal Data of children (under the age under the applicable law). You must be legal adult to access to our Service under the applicable law and the law of the country where you are located.<\\/li><li>While individuals under the childhood age may use the Services, they shall do so only with the involvement, supervision, and approval of a parent or legal guardian. At any case, we are committed to complying with applicable laws and requirements of the residence country.<\\/li><\\/ol><p><br data-cke-filler=\\\"true\\\"><\\/p><p><strong>Cookies<\\/strong><\\/p><ol><li>To ensure that our Service functions properly, we may use various tracking technologies like cookies, web beacons or similar technologies.<\\/li><li>Cookies are small data files that are commonly stored on your device when you browse and use websites and online services. They are widely used to make websites work or to work more efficiently, as well as to provide reporting information and assist with service or advertising personalization.<\\/li><li>We, or third parties with our permission, may use cookies in the following ways:<ul><li>To manage our business and improve our Service based on factors such as how many users visit or use our Service, what pages and views are accessed, whether visitors are new or repeat visitors, which features of our Service most interest our visitors etc.;<\\/li><li>To provide personalized recommendations, advertising, marketing emails, and guidance on Service features based on your activity on our Service and browsing activities;<\\/li><li>To remember actions you took to avoid asking you to repeat them during a session or to provide features such as enabling you to resume reading at the last page you accessed, synchronized across devices;<\\/li><li>To measure and analyze activity on our services, or third-party services. In addition, we or any provider of such measurement and analytical services may provide non-personally identifiable data to third parties.<\\/li><\\/ul><\\/li><li>The User may block, clear and delete cookies in accordance with the instruction for their web-browser or device.<\\/li><\\/ol><p><br data-cke-filler=\\\"true\\\"><\\/p><p><strong>Amendments to Privacy Policy<\\/strong><\\/p><p>We have the right to amend this Private Policy at any time with prior notice to each User. Any changes we may make to our Privacy Policy in the future will be posted here. Where appropriate, we will notify you or seek your consent. Please check back frequently to see any updates or changes to our Privacy Policy. Nevertheless, we will try not to change this privacy policy.<\\/p><p><br data-cke-filler=\\\"true\\\"><\\/p><p><strong>Contact info<\\/strong><\\/p><p>If at any time you would like to contact us with your views about our privacy practices, or with any inquiry relating to your Personal Data (its correction, removal or use), you can do so by sending a letter to our email address: info@digitalrightsdeclaration.com<\\/p><p><br data-cke-filler=\\\"true\\\"><\\/p>\"}'),
(11, '2018-08-14 11:16:57', '2018-09-04 10:37:39', '1', 'content/terms', '{\"1\":\"<p>\\u200b\\u200b\\u200b\\u200b\\u200b\\u200b\\u200b<strong>Table of Contents:<\\/strong><\\/p><ol><li>Introduction<\\/li><li>Description of website services offered<\\/li><li>Declaration<\\/li><li>Modification of Terms<\\/li><li>Intellectual Property Rights<\\/li><li>Restrictions and obligations<\\/li><li>Website Rules and Conduct<\\/li><li>Third Party Sites<\\/li><li>Governing law<\\/li><li>Indemnification<\\/li><li>Liability Disclaimer<\\/li><li>Contact Us<\\/li><\\/ol><p><br data-cke-filler=\\\"true\\\"><\\/p><p><strong>Introduction<\\/strong><\\/p><p>These Terms and Conditions (\\u201cTerms\\u201d) manages your use of this website. These Terms will be applied fully and affect to your use of this Website. You understand that it is an agreement between you and this Service (hereinafter reffered to the \\u201cDigitalRightsDeclaration\\u201d).<\\/p><p>Please read these Terms and Conditions carefully. Your access to and use of the service is conditioned on your acceptance of and compliance with these Terms. These Terms are applied to all By using the Service in any manner you agree to be bound by these Terms without modification.<\\/p><p><br data-cke-filler=\\\"true\\\"><\\/p><p><strong>Description of website services offered<\\/strong><\\/p><p>The purpose of this Service is to provide the Users with possibility to make a record of digital rights declaration and their own comment on the blockchain. Services available through our website are the following:<\\/p><ol><li>Sign the declaration with name and comment;<\\/li><li>Make a donation. Our Service records signature permanently on the Bitcoin Blockchain for a small fee in Ethereum or other altcoins to cover the transaction cost; and<\\/li><li>Get a certificate. Our Service provides User with a certificate and link to the record of signature on the Blockchain.<\\/li><\\/ol><p>At its discretion, DigitalRightsDeclaration may offer additional website Services or update, modify or revise any current content and Services, and this Terms shall apply to any additional Services, all updated, modified or revised Services.<\\/p><p><br data-cke-filler=\\\"true\\\"><\\/p><p><strong>Declaration<\\/strong><\\/p><p>Users who wish to declare the independence of their digital rights with the DigitalRightsDeclaration are required to provide information about themselves as prompted by form provided. We are not responsible for any failure in providing the Services, which result from information that is not true and complete.<\\/p><p>When you declare, the DigitalRightsDeclaration collects only your name. Also, you are allowed to provide us with your e-mail address. Please take a look at our Privacy Policy.<\\/p><p>You have to pay a small fee for declaration in the amount of _% of the transaction. Also you have to pay a fee in Ethereum or altcoins to cover the transaction cost. We use ShapeShift (<a href=\\\"https:\\/\\/shapeshift.io\\/%2523\\/coins\\\">https:\\/\\/shapeshift.io\\/#\\/coins<\\/a>) as an exchange.&nbsp;<\\/p><p><br data-cke-filler=\\\"true\\\"><\\/p><p><strong>Modification of Terms<\\/strong><\\/p><p>DigitalRightsDeclaration reserves the right, at its sole discretion, to modify or replace this Terms and Conditions or\\/and change our partners. Nevertheless, we\\u2019ll do everything possible in order not to change anything.<\\/p><p>Your continued use of the Service following the posting of any changes to the Terms and Conditions will be subject to the new Terms and Conditions.<\\/p><p><br data-cke-filler=\\\"true\\\"><\\/p><p><strong>Intellectual Property Rights<\\/strong><\\/p><p>The Website\\u2019s owner own all the intellectual property rights and materials contained in this Website.<\\/p><p>You are granted limited license only for purposes of viewing the material contained on this Website.<\\/p><p>You warrant to DigitalRightsDeclaration that you will not use the Service for any purpose that is unlawful or prohibited by these Terms. You may not use the Site in any manner, which could damage, disable, overburden, or impair the Service or interfere with any other party\'s use and enjoyment of the Service.<\\/p><p>All content included as part of the Service, such as text, graphics, logos, images, as well as the compilation thereof, and any software used on the Site, is the property of DigitalRightsDeclaration and protected by copyright and other laws that protect intellectual property and proprietary rights.<\\/p><p>You will not modify, publish, transmit, reverse engineer, participate in the transfer or sale, create derivative works, or in any way exploit any of the content, in whole or in part, found on the Service. You will use protected content solely for your personal use, and will make no other use of the content without the express written permission of DigitalRightsDeclaration. You agree that you do not acquire any ownership rights in any protected content.<\\/p><p><br data-cke-filler=\\\"true\\\"><\\/p><p><strong>Restrictions and obligations<\\/strong><\\/p><p>You represent and warrant that if you are an individual, you are (i) at least eighteen (18) years old or (ii) if you are between the ages of thirteen (13) and eighteen (18), you have parental permission to enter into an agreement to accept these Terms of Use and to use the Service.<\\/p><p>You are specifically restricted from all of the following:<\\/p><ul><li>selling, sublicensing and\\/or otherwise commercializing any Website material;<\\/li><li>publicly performing and\\/or showing any Website material;<\\/li><li>using this Website in any way that is or may be damaging to this Website;<\\/li><li>using this Website contrary to applicable laws and regulations, or in any way may cause harm to the Website, or to any person or business entity;<\\/li><li>engaging in any data mining, data harvesting, data extracting or any other similar activity in relation to this Website;<\\/li><li>using this Website to engage in any advertising or marketing.<\\/li><\\/ul><p>Accessing the Service is prohibited from territories where the Service or any Content is illegal; you are responsible for compliance with local laws.<\\/p><p><br data-cke-filler=\\\"true\\\"><\\/p><p><strong>Website Rules and Conduct<\\/strong><\\/p><p>The Service is provided only for your own personal, non-commercial use. You shall not use the Service for any purpose that is prohibited by these Terms of Use, including:<\\/p><p>You shall not either (a) take any action or (b) upload, download, post, submit, link to or otherwise distribute or facilitate distribution of any content on or through the Service, that:<\\/p><ul><li>infringes any patent, trademark, trade secret, copyright, right of publicity or other right of any other person or entity;<\\/li><li>is unlawful, threatening, abusive, harassing, defamatory, libelous, deceptive, fraudulent, invasive of another\\u2019s privacy, tortious, obscene, offensive, or profane;<\\/li><li>involves commercial activities and\\/or sales without DigitalRightsDeclaration prior written consent such as contests, sweepstakes, barter, advertising, or pyramid schemes;<\\/li><li>contains software viruses or any other computer codes, files, or programs that are designed or intended to disrupt, damage, limit or interfere with the proper function of any software, hardware, or telecommunications equipment or to damage or obtain unauthorized access to any system, data, password or other information of DigitalRightsDeclaration or any third party; or<\\/li><\\/ul><p>You shall abide by all applicable local, state, national and international laws and regulations.<\\/p><p><br data-cke-filler=\\\"true\\\"><\\/p><p><strong>Third Party Sites<\\/strong><\\/p><p>The Service may permit you to link to other websites or resources on the Internet, and other websites or resources may contain links to the Website or another feature of the Service. When you access third party websites, you do so at your own risk. These other websites are not under DigitalRightsDeclaration control, and you acknowledge that DigitalRightsDeclaration is not responsible or liable for the content, functions, accuracy, legality, appropriateness or any other aspect of such websites or resources. You understand that DigitalRightsDeclaration shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with the use of or reliance on any such Content, goods or services available on or through any such website or resource.<\\/p><p><br data-cke-filler=\\\"true\\\"><\\/p><p><strong>Indemnification<\\/strong><\\/p><p>You agree to indemnify, defend and hold harmless DigitalRightsDeclaration, its officers, directors, employees, agents and third parties, for any losses, costs, liabilities and expenses (including reasonable attorney\'s fees) relating to or arising out of your use of or inability to use the Site or services, any user postings made by you, your violation of any terms of this Agreement or your violation of any rights of a third party, or your violation of any applicable laws, rules or regulations. DigitalRightsDeclaration reserves the right, at its own cost, to assume the exclusive defense and control of any matter otherwise subject to indemnification by you, in which event you will fully cooperate with DigitalRightsDeclaration in asserting any available defenses.<\\/p><p><br data-cke-filler=\\\"true\\\"><\\/p><p><strong>Governing law<\\/strong><\\/p><p>These terms and conditions are governed by Canadian laws and the parties agree to submit to the exclusive jurisdiction of the Canadian courts.<\\/p><p><br data-cke-filler=\\\"true\\\"><\\/p><p><strong>Liability Disclaimer<\\/strong><\\/p><p>THE INFORMATION, SOFTWARE, PRODUCTS, AND SERVICES INCLUDED IN OR AVAILABLE THROUGH THE SITE MAY INCLUDE INACCURACIES OR TYPOGRAPHICAL ERRORS. CHANGES ARE PERIODICALLY ADDED TO THE INFORMATION HEREIN. DIGITALRIGHTSDECLARATION AND\\/OR ITS SUPPLIERS MAY MAKE IMPROVEMENTS AND\\/OR CHANGES IN THE SITE AT ANY TIME.<\\/p><p>DIGITALRIGHTSDECLARATION AND\\/OR ITS SUPPLIERS MAKE NO REPRESENTATIONS ABOUT THE SUITABILITY, RELIABILITY, AVAILABILITY, TIMELINESS, AND ACCURACY OF THE INFORMATION, SOFTWARE, PRODUCTS, SERVICES AND RELATED GRAPHICS CONTAINED ON THE SITE FOR ANY PURPOSE. TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, ALL SUCH INFORMATION, SOFTWARE, PRODUCTS, SERVICES AND RELATED GRAPHICS ARE PROVIDED \\\"AS IS\\\" WITHOUT WARRANTY OR CONDITION OF ANY KIND. DIGITALRIGHTSDECLARATION AND\\/OR ITS SUPPLIERS HEREBY DISCLAIM ALL WARRANTIES AND CONDITIONS WITH REGARD TO THIS INFORMATION, SOFTWARE, PRODUCTS, SERVICES AND RELATED GRAPHICS, INCLUDING ALL IMPLIED WARRANTIES OR CONDITIONS OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. DIGITALRIGHTSDECLARATION ARE NOT RESPONSIBLE FOR THE PROBLEMS WITH SERVER AND LOSING THE DATABASE.<\\/p><p>TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, IN NO EVENT SHALL DIGITALRIGHTSDECLARATION. AND\\/OR ITS SUPPLIERS BE LIABLE FOR ANY DIRECT, INDIRECT, PUNITIVE, INCIDENTAL, SPECIAL, CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF USE, DATA OR PROFITS, ARISING OUT OF OR IN ANY WAY CONNECTED WITH THE USE OR PERFORMANCE OF THE SITE, WITH THE DELAY OR INABILITY TO USE THE SITE OR RELATED SERVICES, THE PROVISION OF OR FAILURE TO PROVIDE SERVICES, OR FOR ANY INFORMATION, SOFTWARE, PRODUCTS, SERVICES AND RELATED GRAPHICS OBTAINED THROUGH THE SITE, OR OTHERWISE ARISING OUT OF THE USE OF THE SITE, WHETHER BASED ON CONTRACT, TORT, NEGLIGENCE, STRICT LIABILITY OR OTHERWISE, EVEN IF DIGITALRIGHTSDECLARATION OR ANY OF ITS SUPPLIERS HAS BEEN ADVISED OF THE POSSIBILITY OF DAMAGES. BECAUSE SOME JURISDICTIONS DO NOT ALLOW THE EXCLUSION OR LIMITATION OF LIABILITY FOR CONSEQUENTIAL OR INCIDENTAL DAMAGES, THE ABOVE LIMITATION MAY NOT APPLY TO YOU. IF YOU ARE DISSATISFIED WITH ANY PORTION OF THE SITE, OR WITH ANY OF THESE TERMS OF USE, YOUR SOLE AND EXCLUSIVE REMEDY IS TO DISCONTINUE USING THE SITE.<\\/p><p><br data-cke-filler=\\\"true\\\"><\\/p><p><strong>Contact Us<\\/strong><\\/p><p>DigitalRightsDeclaration welcomes your questions or comments regarding the Terms:<\\/p><p>Email Address: info@digitalrightsdeclaration.com<\\/p>\"}'),
(12, '2018-08-14 11:16:57', '2018-09-05 04:41:21', '0', 'meta/privacy', '{\"seo_title\":{\"1\":\"Privacy Policy\"},\"seo_h1\":{\"1\":\"Privacy Policy\"},\"seo_keywords\":{\"1\":null},\"seo_description\":{\"1\":\"Declare the independence of your digital identity on the blockchain\\u2014 independence from corporations, governments and anyone else with an interest in your personal data.\"},\"og_image\":null,\"og_type\":\"web_site\",\"og_title\":{\"1\":null},\"og_description\":{\"1\":null}}'),
(13, '2018-08-14 11:16:57', '2018-09-05 04:41:27', '0', 'meta/terms', '{\"seo_title\":{\"1\":\"Terms and Conditions\"},\"seo_h1\":{\"1\":\"Terms and Conditions\"},\"seo_keywords\":{\"1\":null},\"seo_description\":{\"1\":\"Declare the independence of your digital identity on the blockchain\\u2014 independence from corporations, governments and anyone else with an interest in your personal data.\"},\"og_image\":null,\"og_type\":\"web_site\",\"og_title\":{\"1\":null},\"og_description\":{\"1\":null}}'),
(14, '2018-09-04 10:37:39', '2018-09-04 10:41:12', '0', 'mail/send/receive-data', '0'),
(15, '2018-09-04 10:37:39', '2018-09-04 10:38:55', '0', 'mail/send/receive-pay', '1'),
(16, '2018-09-04 10:37:39', '2018-09-05 04:40:22', '0', 'mail/send/remind', '0'),
(17, '2018-09-04 10:37:39', '2018-09-04 10:39:16', '0', 'mail/send/remind-later', '1'),
(18, '2018-09-04 10:37:39', '2018-09-04 10:39:29', '0', 'mail/send/success', '1'),
(19, '2018-09-04 10:50:16', '2019-01-21 06:55:24', '0', 'social/telegram', 'https://t.me/digindec');

-- --------------------------------------------------------

--
-- Table structure for table `signers`
--

CREATE TABLE `signers` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_profile` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `signers`
--

INSERT INTO `signers` (`id`, `created_at`, `updated_at`, `name`, `email`, `comment`, `social_profile`) VALUES
(26, '2019-01-16 14:03:19', '2019-01-17 18:40:02', 'Andrew Zapotochnyi', 'andrewzapotochnyi@icloud.com', '', '{\"id\":\"2072006489513931\",\"email\":\"andrewzapotochnyi@icloud.com\",\"name\":\"Andrew Zapotochnyi\",\"url\":\"https:\\/\\/www.facebook.com\\/2072006489513931\",\"photo\":\"https:\\/\\/graph.facebook.com\\/v2.8\\/2072006489513931\\/picture?width=150&height=150\"}'),
(30, '2019-01-16 14:12:17', '2019-01-18 06:27:59', 'Алексей Сизинцев', 'alexxgroup@gmail.com', '', '{\"id\":\"2134169639974513\",\"email\":\"alexxgroup@gmail.com\",\"name\":\"\\u0410\\u043b\\u0435\\u043a\\u0441\\u0435\\u0439 \\u0421\\u0438\\u0437\\u0438\\u043d\\u0446\\u0435\\u0432\",\"url\":\"https:\\/\\/www.facebook.com\\/2134169639974513\",\"photo\":\"https:\\/\\/graph.facebook.com\\/v2.8\\/2134169639974513\\/picture?width=150&height=150\"}'),
(35, '2019-01-18 06:40:48', '2019-01-18 06:40:48', 'Yegor Shustik', 'hello.egour@gmail.com', '', '{\"id\":\"10155783698967536\",\"email\":\"hello.egour@gmail.com\",\"name\":\"Yegor Shustik\",\"url\":\"https:\\/\\/www.facebook.com\\/10155783698967536\",\"photo\":\"https:\\/\\/graph.facebook.com\\/v2.8\\/10155783698967536\\/picture?width=150&height=150\"}'),
(36, '2019-01-20 10:50:20', '2019-01-20 10:50:20', 'Bogdana  Tkach', 'kkonstantinovna@rambler.ru', '', '{\"id\":\"995157237342257\",\"email\":\"kkonstantinovna@rambler.ru\",\"name\":\"Bogdana  Tkach\",\"url\":\"https:\\/\\/www.facebook.com\\/995157237342257\",\"photo\":\"https:\\/\\/graph.facebook.com\\/v2.8\\/995157237342257\\/picture?width=150&height=150\"}'),
(39, '2019-01-23 12:22:21', '2019-01-23 12:22:21', 'Transformation Mind', 'vlr.alxndrvch.mrnv@gmail.com', '', '{\"id\":\"118196380628433196003\",\"email\":\"vlr.alxndrvch.mrnv@gmail.com\",\"name\":\"Transformation Mind\",\"url\":\"https:\\/\\/plus.google.com\\/118196380628433196003\",\"photo\":\"https:\\/\\/lh3.googleusercontent.com\\/-4a77MpexTfQ\\/AAAAAAAAAAI\\/AAAAAAAACPw\\/f93t0DKf1Nk\\/photo.jpg\"}'),
(40, '2019-01-27 18:57:04', '2019-01-27 18:57:04', 'Bob', '', 'Bhi', ''),
(41, '2019-01-27 18:57:21', '2019-01-27 18:57:21', 'Bob', '', '', ''),
(42, '2019-01-27 20:57:30', '2019-01-27 20:57:30', 'Stephen', '', '', ''),
(43, '2019-01-30 11:10:21', '2019-01-30 11:10:21', 'Nickolay Babenko', 'babenko.nickolay@gmail.com', '', '{\"id\":\"100048208957281050589\",\"email\":\"babenko.nickolay@gmail.com\",\"name\":\"Nickolay Babenko\",\"url\":\"https:\\/\\/plus.google.com\\/100048208957281050589\",\"photo\":\"https:\\/\\/lh5.googleusercontent.com\\/-VlIlGY13BKc\\/AAAAAAAAAAI\\/AAAAAAAADN8\\/QnCaB3AVWg8\\/photo.jpg\"}');

-- --------------------------------------------------------

--
-- Table structure for table `supporters`
--

CREATE TABLE `supporters` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supporters`
--

INSERT INTO `supporters` (`id`, `created_at`, `updated_at`, `image`, `url`, `position`) VALUES
(17, '2018-07-23 18:01:50', '2018-07-23 18:03:45', '{\"path\":\"storage\\/07\\/064\\/64d39d\\/azb001png001.png\",\"signature\":{\"1\":\"AZ Blockchain\"}}', 'http://azblockchain.co/', 0),
(20, '2018-07-23 18:13:31', '2018-07-23 18:13:31', '{\"path\":\"storage\\/c3\\/f7c\\/7c83b4\\/synergize001.png\",\"signature\":{\"1\":\"Synergize\"}}', 'https://synergize.digital/', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_log`
--
ALTER TABLE `accounts_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `log_account_id_foreign` (`account_id`),
  ADD KEY `log_module_name_index` (`module_name`(191));

--
-- Indexes for table `accounts_options`
--
ALTER TABLE `accounts_options`
  ADD KEY `account_id` (`account_id`),
  ADD KEY `option_name` (`option_name`);

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blocks_slug_unique` (`slug`),
  ADD KEY `blocks_is_public_slug_index` (`is_public`,`slug`);

--
-- Indexes for table `cdn_files`
--
ALTER TABLE `cdn_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `i18n`
--
ALTER TABLE `i18n`
  ADD PRIMARY KEY (`id`),
  ADD KEY `i18n_code_index` (`code`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reasons`
--
ALTER TABLE `reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_param_unique` (`param`);

--
-- Indexes for table `signers`
--
ALTER TABLE `signers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `signers_email_index` (`email`(191));

--
-- Indexes for table `supporters`
--
ALTER TABLE `supporters`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_log`
--
ALTER TABLE `accounts_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cdn_files`
--
ALTER TABLE `cdn_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `i18n`
--
ALTER TABLE `i18n`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `reasons`
--
ALTER TABLE `reasons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `signers`
--
ALTER TABLE `signers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `supporters`
--
ALTER TABLE `supporters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

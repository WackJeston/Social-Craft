-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2022 at 12:54 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assetindexdata`
--

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assettransformindex`
--

CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assettransforms`
--

CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups`
--

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups_sites`
--

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `changedattributes`
--

CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `changedattributes`
--

INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES
(1, 1, 'firstName', '2022-03-16 10:24:16', 0, 1),
(1, 1, 'lastName', '2022-03-16 10:24:16', 0, 1),
(1, 1, 'lastPasswordChangeDate', '2022-03-16 15:36:05', 0, 1),
(1, 1, 'password', '2022-03-16 15:36:05', 0, 1),
(1, 1, 'username', '2022-03-16 17:56:13', 0, 1),
(2, 1, 'slug', '2022-03-16 10:34:37', 0, 1),
(2, 1, 'title', '2022-03-16 10:34:37', 0, 1),
(2, 1, 'uri', '2022-03-16 10:34:37', 0, 1),
(5, 1, 'slug', '2022-03-16 10:36:45', 0, 1),
(5, 1, 'title', '2022-03-16 10:36:45', 0, 1),
(5, 1, 'uri', '2022-03-16 10:36:45', 0, 1),
(7, 1, 'email', '2022-03-16 15:18:33', 0, 1),
(7, 1, 'unverifiedEmail', '2022-03-16 15:18:33', 0, 1),
(23, 1, 'slug', '2022-03-17 00:25:05', 0, 1),
(23, 1, 'title', '2022-03-17 00:25:05', 0, 1),
(23, 1, 'uri', '2022-03-17 00:25:05', 0, 1),
(25, 1, 'slug', '2022-03-17 00:25:18', 0, 1),
(25, 1, 'title', '2022-03-17 00:25:18', 0, 1),
(25, 1, 'uri', '2022-03-17 00:25:18', 0, 1),
(44, 1, 'postDate', '2022-03-17 10:09:38', 0, 1),
(48, 1, 'enabled', '2022-03-17 10:16:06', 0, 1),
(48, 1, 'postDate', '2022-03-17 10:16:06', 0, 1),
(50, 1, 'slug', '2022-03-17 10:14:00', 0, 1),
(50, 1, 'title', '2022-03-17 10:14:00', 0, 1),
(50, 1, 'uri', '2022-03-17 10:14:00', 0, 1),
(70, 1, 'enabled', '2022-03-17 10:37:11', 0, 1),
(72, 1, 'enabled', '2022-03-17 10:37:11', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `changedfields`
--

CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `changedfields`
--

INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`) VALUES
(2, 1, 1, '2022-03-16 10:34:58', 0, 1),
(5, 1, 1, '2022-03-16 10:36:43', 0, 1),
(23, 1, 1, '2022-03-17 00:25:09', 0, 1),
(25, 1, 1, '2022-03-17 00:25:20', 0, 1),
(44, 1, 1, '2022-03-17 10:09:38', 0, 1),
(50, 1, 1, '2022-03-17 10:14:07', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_text_jqxtkcjq` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_firstName_lokptvdw` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_lastName_irwlbseb` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_text_jqxtkcjq`, `field_firstName_lokptvdw`, `field_lastName_irwlbseb`) VALUES
(1, 1, 1, NULL, '2022-03-16 10:17:15', '2022-03-16 17:56:13', '4e714561-af8c-41ba-b1b2-4128ed861b59', NULL, NULL, NULL),
(2, 2, 1, '1', '2022-03-16 10:34:30', '2022-03-16 10:35:03', '868c747a-0a49-46c8-a8dc-0bfb15696fd1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', NULL, NULL),
(3, 3, 1, '1', '2022-03-16 10:34:58', '2022-03-16 10:34:58', '3cfe44d5-acbb-4bc3-8818-ba647ce524d7', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', NULL, NULL),
(4, 4, 1, '1', '2022-03-16 10:35:03', '2022-03-16 10:35:03', 'e432764b-8f08-45c4-95d6-2f5ea4671f85', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', NULL, NULL),
(5, 5, 1, '2', '2022-03-16 10:35:58', '2022-03-16 10:36:47', '58e90324-4ac6-4d38-8c94-e00fc0014646', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL, NULL),
(6, 6, 1, '2', '2022-03-16 10:36:47', '2022-03-16 10:36:47', 'f92d12b9-cde0-4627-ab4b-ced17ddf95b2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL, NULL),
(7, 7, 1, NULL, '2022-03-16 10:39:29', '2022-03-16 15:18:33', 'ba0e08fa-4438-4241-a981-21368609870b', NULL, NULL, NULL),
(8, 8, 1, NULL, '2022-03-16 15:19:44', '2022-03-16 15:34:56', 'd3f26f20-be2d-4e2a-804b-fd8d5ad99fc7', NULL, NULL, NULL),
(9, 9, 1, NULL, '2022-03-16 22:07:31', '2022-03-16 22:07:31', '0a2cbc59-c764-46f2-b770-100a136630c8', NULL, NULL, NULL),
(10, 10, 1, NULL, '2022-03-16 22:49:51', '2022-03-16 22:49:51', '4b30f4df-9b15-4f6f-8de3-014e7ea9b310', NULL, NULL, NULL),
(11, 11, 1, NULL, '2022-03-16 22:51:23', '2022-03-16 22:51:23', '8b92536f-8e12-4181-80eb-5fdf5ed89084', NULL, NULL, NULL),
(12, 12, 1, NULL, '2022-03-16 22:59:25', '2022-03-16 22:59:25', 'd976032c-0e95-49b8-a511-1ba65d699a9b', NULL, NULL, NULL),
(13, 13, 1, NULL, '2022-03-16 23:05:25', '2022-03-16 23:05:25', '8000aba3-8b98-4601-bec5-ea1238e0d85d', NULL, NULL, NULL),
(14, 14, 1, NULL, '2022-03-16 23:06:47', '2022-03-16 23:06:47', '4b3283a5-d90f-4f0a-b1cf-3020e61d7ee9', NULL, NULL, NULL),
(15, 15, 1, NULL, '2022-03-16 23:07:16', '2022-03-16 23:07:16', 'cf4dd5bb-b3e1-4621-bd3a-1d309f1789a6', NULL, NULL, NULL),
(16, 16, 1, NULL, '2022-03-16 23:10:19', '2022-03-16 23:10:19', '8efe1715-88d1-4084-bcaf-9335478747de', NULL, NULL, NULL),
(17, 17, 1, NULL, '2022-03-16 23:10:49', '2022-03-16 23:10:49', '099ac3c5-6ad4-4b52-b33e-f49b52770efb', NULL, NULL, NULL),
(18, 18, 1, NULL, '2022-03-16 23:11:44', '2022-03-16 23:11:44', 'f5ad6da2-3d92-4e54-8aa2-3f563c0c945e', NULL, NULL, NULL),
(19, 19, 1, NULL, '2022-03-16 23:12:47', '2022-03-16 23:12:47', 'e38ce378-03ca-4abe-9e4c-6afc456521a0', NULL, NULL, NULL),
(20, 20, 1, NULL, '2022-03-16 23:13:52', '2022-03-16 23:13:52', 'eb02f8fb-033e-48a0-9669-6648b5513f8f', NULL, NULL, NULL),
(21, 21, 1, NULL, '2022-03-16 23:16:37', '2022-03-16 23:16:37', 'ea513fdd-c590-4e2a-9249-550dc3ce1b14', NULL, NULL, NULL),
(22, 22, 1, NULL, '2022-03-16 23:17:31', '2022-03-16 23:17:31', 'e8499c20-b62d-4ec4-a162-f84f9adcd3f0', NULL, NULL, NULL),
(23, 23, 1, '1', '2022-03-17 00:24:26', '2022-03-17 00:25:10', 'd2c3b939-91de-4603-878d-83d07b853f2c', 'yo', NULL, NULL),
(24, 24, 1, '1', '2022-03-17 00:25:10', '2022-03-17 00:25:10', '4fc1d9ba-c392-42c8-96e4-d038e660c8e1', 'yo', NULL, NULL),
(25, 25, 1, '1', '2022-03-17 00:25:16', '2022-03-17 00:25:21', '391675eb-9265-4791-baae-46ade0b7e3e3', 'yo', NULL, NULL),
(26, 26, 1, '1', '2022-03-17 00:25:21', '2022-03-17 00:25:21', '70b4589b-4de6-45c6-8f1f-6a706044973e', 'yo', NULL, NULL),
(27, 27, 1, 'Dashboard', '2022-03-17 00:36:00', '2022-03-17 00:36:00', '111e0d28-9ee6-4704-bfab-a53d631ad019', NULL, NULL, NULL),
(28, 28, 1, 'Dashboard', '2022-03-17 00:36:00', '2022-03-17 00:36:00', '25841f13-0881-4b9c-b2f3-d096e5e3676e', NULL, NULL, NULL),
(29, 29, 1, NULL, '2022-03-17 00:48:55', '2022-03-17 00:48:55', '9a59ab39-6526-4adc-a610-ebb6078f2779', NULL, NULL, NULL),
(30, 30, 1, NULL, '2022-03-17 00:56:52', '2022-03-17 00:56:52', '27d421a3-5a7c-47bc-abf3-f2998488d190', NULL, NULL, NULL),
(31, 31, 1, NULL, '2022-03-17 01:25:49', '2022-03-17 01:25:49', '4bfa9391-e5c3-4de1-8014-75e218f46f31', NULL, NULL, NULL),
(32, 32, 1, 'Owen Wilson', '2022-03-17 09:38:24', '2022-03-17 09:38:24', '1df1ed51-710d-4c30-bc8d-c059a8873d37', NULL, NULL, NULL),
(33, 33, 1, 'Owen Wilson', '2022-03-17 09:38:24', '2022-03-17 09:38:24', '62dd5109-d1e7-4689-b2ff-94eb4d51bd19', NULL, NULL, NULL),
(34, 34, 1, 'Owen Wilson', '2022-03-17 09:44:31', '2022-03-17 09:44:31', '77f457e5-391f-40ea-a61f-372f93824114', NULL, NULL, NULL),
(35, 35, 1, 'Owen Wilson', '2022-03-17 09:44:31', '2022-03-17 09:44:31', '4aceacff-a59a-45a4-80fa-a9eca3b30470', NULL, NULL, NULL),
(36, 36, 1, 'Owen Wilson', '2022-03-17 09:47:15', '2022-03-17 09:47:15', 'da5bc397-9832-45d1-84d8-763b5db8d224', NULL, NULL, NULL),
(37, 37, 1, 'Owen Wilson', '2022-03-17 09:47:15', '2022-03-17 09:47:15', '379f86d4-c835-4ee6-a440-d30d8235bc0f', NULL, NULL, NULL),
(38, 38, 1, 'Owen Wilson', '2022-03-17 09:54:46', '2022-03-17 09:54:46', '0ec67cdc-a498-4a35-944e-4ebef4d6891f', NULL, NULL, NULL),
(39, 39, 1, 'Owen Wilson', '2022-03-17 09:54:46', '2022-03-17 09:54:46', 'fb2053a5-6ada-41d8-9c73-9d8067e23f74', NULL, NULL, NULL),
(40, 40, 1, 'Owen Wilson', '2022-03-17 09:55:46', '2022-03-17 09:55:46', '99777368-a1aa-4be2-94c9-591cd1667e71', NULL, NULL, NULL),
(41, 41, 1, 'Owen Wilson', '2022-03-17 09:55:46', '2022-03-17 09:55:46', '05d36840-d233-47e1-9af1-c8e212698c3d', NULL, NULL, NULL),
(42, 42, 1, 'Owen Wilson', '2022-03-17 09:59:59', '2022-03-17 09:59:59', 'defd8ccd-9e25-4102-a806-2a485d8dcd90', NULL, NULL, NULL),
(43, 43, 1, 'Owen Wilson', '2022-03-17 09:59:59', '2022-03-17 09:59:59', '7a26d46d-4717-4344-a3f6-94f52f1b5141', NULL, NULL, NULL),
(44, 44, 1, 'Owen Wilson', '2022-03-17 10:08:11', '2022-03-17 10:09:38', '6e9448ba-06e4-4d67-83bb-1574be85a5fd', 'fuel please', NULL, NULL),
(45, 45, 1, 'Owen Wilson', '2022-03-17 10:08:11', '2022-03-17 10:08:11', '91ed4f4b-8181-4a52-92f5-8f278cffc69d', NULL, NULL, NULL),
(47, 47, 1, 'Owen Wilson', '2022-03-17 10:09:38', '2022-03-17 10:09:38', 'f0c3e418-df33-4bfe-aa00-afd44c2afef5', 'fuel please', NULL, NULL),
(48, 48, 1, 'Owen Wilson', '2022-03-17 10:13:23', '2022-03-17 10:16:06', '299cb071-d963-4d76-af18-cc7ddd66aaac', NULL, NULL, NULL),
(49, 49, 1, 'Owen Wilson', '2022-03-17 10:13:23', '2022-03-17 10:13:23', '9e1b6365-b13b-4b88-9430-b1cbab5fed0f', NULL, NULL, NULL),
(50, 50, 1, 'jack', '2022-03-17 10:13:44', '2022-03-17 10:14:08', '06f04678-5e91-431f-9e6e-b64e655c7f1e', 'fucking work bitch', NULL, NULL),
(51, 51, 1, 'jack', '2022-03-17 10:14:08', '2022-03-17 10:14:08', '90ce839b-7280-4f0c-bc3c-80e83a1994ba', 'fucking work bitch', NULL, NULL),
(53, 53, 1, 'Owen Wilson', '2022-03-17 10:16:06', '2022-03-17 10:16:06', '661f174c-a449-44ea-8d77-f95373a288cb', NULL, NULL, NULL),
(54, 54, 1, 'Owen Wilson', '2022-03-17 10:22:20', '2022-03-17 10:22:20', 'b48c3197-d55a-4772-a258-0241a55d69c0', NULL, NULL, NULL),
(55, 55, 1, 'Owen Wilson', '2022-03-17 10:22:20', '2022-03-17 10:22:20', '6902c878-0419-4ab6-836a-03c024c79d11', NULL, NULL, NULL),
(56, 56, 1, 'Owen Wilson', '2022-03-17 10:24:09', '2022-03-17 10:24:09', 'bd95459f-f5f9-4537-873a-829bbfb1a978', NULL, NULL, NULL),
(57, 57, 1, 'Owen Wilson', '2022-03-17 10:24:09', '2022-03-17 10:24:09', 'cc4b27df-b8e7-4775-b0fb-998bad8e4bdb', NULL, NULL, NULL),
(58, 58, 1, 'Owen Wilson', '2022-03-17 10:25:01', '2022-03-17 10:25:01', 'adbe1961-7d37-49c7-8f84-7e10497c333b', NULL, NULL, NULL),
(59, 59, 1, 'Owen Wilson', '2022-03-17 10:25:01', '2022-03-17 10:25:01', '1fa424d2-d2f8-4858-9ade-a85bcff7ac18', NULL, NULL, NULL),
(60, 60, 1, 'Owen Wilson', '2022-03-17 10:25:44', '2022-03-17 10:25:44', 'e86ed389-d0c3-43b2-9889-c65fed06e2c9', NULL, NULL, NULL),
(61, 61, 1, 'Owen Wilson', '2022-03-17 10:25:44', '2022-03-17 10:25:44', 'bfa9914a-429d-4011-9c6c-645c25e8e32f', NULL, NULL, NULL),
(62, 62, 1, 'Owen Wilson', '2022-03-17 10:26:00', '2022-03-17 10:26:00', 'c39fb56e-ee31-4ddc-8566-c626977f7a7a', NULL, NULL, NULL),
(63, 63, 1, 'Owen Wilson', '2022-03-17 10:26:00', '2022-03-17 10:26:00', 'c52425f5-419e-4a0a-973f-4ffcf6f2a6e1', NULL, NULL, NULL),
(64, 64, 1, 'Owen Wilson', '2022-03-17 10:26:32', '2022-03-17 10:26:32', '5b325ec4-e13c-4d85-a292-18eb21f6f903', NULL, NULL, NULL),
(65, 65, 1, 'Owen Wilson', '2022-03-17 10:26:32', '2022-03-17 10:26:32', '2b1aa791-bc5c-4313-8cd0-accf9a66ac8b', NULL, NULL, NULL),
(66, 66, 1, 'Owen Wilson', '2022-03-17 10:29:11', '2022-03-17 10:29:11', '8d91c78b-5144-408a-b347-9c3dfb795d25', NULL, NULL, NULL),
(67, 67, 1, 'Owen Wilson', '2022-03-17 10:29:12', '2022-03-17 10:29:12', '7c70adc0-7caa-4bbb-be56-5b88b0885afc', NULL, NULL, NULL),
(68, 68, 1, 'Owen Wilson', '2022-03-17 10:29:47', '2022-03-17 10:29:47', 'cc928617-a9c9-4179-bb17-5ce100cbc958', NULL, NULL, NULL),
(69, 69, 1, 'Owen Wilson', '2022-03-17 10:29:47', '2022-03-17 10:29:47', '0902dc8d-30b3-49ca-b70e-8b0ed9304f53', NULL, NULL, NULL),
(70, 70, 1, 'Owen Wilson', '2022-03-17 10:34:50', '2022-03-17 10:37:11', 'fd8e43aa-aab0-4746-87eb-5af9bb7c8c1b', 'food', NULL, NULL),
(71, 71, 1, 'Owen Wilson', '2022-03-17 10:34:50', '2022-03-17 10:34:50', '73fdaf3b-93f8-423e-8645-6ed0356c0c75', 'food', NULL, NULL),
(72, 72, 1, 'Owen Wilson', '2022-03-17 10:36:49', '2022-03-17 10:37:11', '61b799b2-96f4-425d-aba2-25521b2e1205', 'Rusties bumper ointment!', NULL, NULL),
(73, 73, 1, 'Owen Wilson', '2022-03-17 10:36:49', '2022-03-17 10:36:49', '07f8c7fb-234c-45ca-ab42-11e7817fa653', 'Rusties bumper ointment!', NULL, NULL),
(74, 74, 1, 'Owen Wilson', '2022-03-17 10:37:11', '2022-03-17 10:37:11', 'fa5d5c6f-9163-45e3-aab4-62935c66e418', 'food', NULL, NULL),
(75, 75, 1, 'Owen Wilson', '2022-03-17 10:37:11', '2022-03-17 10:37:11', '80559ee2-6bb1-4185-b666-3929949c5be4', 'Rusties bumper ointment!', NULL, NULL),
(76, 76, 1, 'Owen Wilson', '2022-03-17 10:46:07', '2022-03-17 10:46:07', 'b0f5f049-1643-4026-8f7e-19d89c723905', 'I am Speed!', NULL, NULL),
(77, 77, 1, 'Owen Wilson', '2022-03-17 10:46:07', '2022-03-17 10:46:07', 'c4c640c0-0d67-488a-a2b2-fa670dfe0eaf', 'I am Speed!', NULL, NULL),
(78, 78, 1, 'Owen Wilson', '2022-03-17 10:48:50', '2022-03-17 10:48:50', 'c44ea2c0-02a8-41ed-ba3a-6cd75feb17a1', 'I am speed!', NULL, NULL),
(79, 79, 1, 'Owen Wilson', '2022-03-17 10:48:50', '2022-03-17 10:48:50', '9c288ccc-cb4e-4907-99c7-f3519672b05d', 'I am speed!', NULL, NULL),
(80, 80, 1, 'Owen Wilson', '2022-03-17 10:53:45', '2022-03-17 10:53:45', '8c9663aa-b950-43c2-99a2-15498b5741af', 'I need some new white walls', NULL, NULL),
(81, 81, 1, 'Owen Wilson', '2022-03-17 10:53:45', '2022-03-17 10:53:45', '610ebf34-b936-49e7-a32d-0c55e5e83608', 'I need some new white walls', NULL, NULL),
(82, 82, 1, 'Owen Wilson', '2022-03-17 10:55:45', '2022-03-17 10:55:45', '9153bc4c-6cbc-44a3-9170-a1a09f172196', 'Just lost the Piston Cup :(', NULL, NULL),
(83, 83, 1, 'Owen Wilson', '2022-03-17 10:55:45', '2022-03-17 10:55:45', '8100162b-4700-4504-a225-215e5aebfa0a', 'Just lost the Piston Cup :(', NULL, NULL),
(84, 84, 1, 'Owen Wilson', '2022-03-17 10:56:15', '2022-03-17 10:56:15', '09e2c234-0b5c-4b7c-9e66-dbce16e593f4', 'Just lost the Piston Cup :(', NULL, NULL),
(85, 85, 1, 'Owen Wilson', '2022-03-17 10:56:15', '2022-03-17 10:56:15', '979a2e15-36c2-4d9c-9a0a-c3c909e6c811', 'Just lost the Piston Cup :(', NULL, NULL),
(86, 86, 1, 'Testie McTest', '2022-03-17 11:51:25', '2022-03-17 11:51:25', 'a300fdd7-c3bb-4c5f-8dea-f087d99a7915', 'Testing! Keep Clear!!', NULL, NULL),
(87, 87, 1, 'Testie McTest', '2022-03-17 11:51:25', '2022-03-17 11:51:25', '7b9783c0-caa1-41df-9b70-c06e7f2f2511', 'Testing! Keep Clear!!', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `craftidtokens`
--

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deprecationerrors`
--

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drafts`
--

CREATE TABLE `drafts` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `drafts`
--

INSERT INTO `drafts` (`id`, `sourceId`, `creatorId`, `provisional`, `name`, `notes`, `trackChanges`, `dateLastMerged`, `saved`) VALUES
(5, NULL, 1, 0, 'First draft', NULL, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `elementindexsettings`
--

CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `elementindexsettings`
--

INSERT INTO `elementindexsettings` (`id`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft\\elements\\User', '{\"sourceOrder\":[[\"key\",\"*\"],[\"key\",\"admins\"],[\"key\",\"group:f536098f-41cc-43fe-bc2b-714fb19d2122\"]],\"sources\":{\"*\":{\"tableAttributes\":{\"1\":\"fullName\",\"2\":\"email\",\"3\":\"dateCreated\",\"4\":\"lastLoginDate\",\"5\":\"username\"}},\"admins\":{\"tableAttributes\":{\"1\":\"fullName\",\"2\":\"email\",\"3\":\"dateCreated\",\"4\":\"lastLoginDate\",\"5\":\"username\"}},\"group:f536098f-41cc-43fe-bc2b-714fb19d2122\":{\"tableAttributes\":{\"1\":\"fullName\",\"2\":\"email\",\"3\":\"dateCreated\",\"4\":\"lastLoginDate\",\"5\":\"username\"}}}}', '2022-03-16 18:39:18', '2022-03-16 18:39:18', 'aafe6217-0009-42e7-991e-6330aca0a8ac'),
(4, 'craft\\elements\\Entry', '{\"sources\":{\"section:8892c507-d287-4436-b0a3-3f7de93da202\":{\"tableAttributes\":{\"1\":\"postDate\",\"2\":\"author\",\"3\":\"field:1\"}}}}', '2022-03-17 00:25:29', '2022-03-17 00:25:29', 'f628201d-363c-4374-8732-ae2c8101cfd1');

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE `elements` (
  `id` int(11) NOT NULL,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2022-03-16 10:17:15', '2022-03-16 17:56:13', NULL, NULL, 'a3b1bed3-d74b-4058-8fa2-db75e60dabc0'),
(2, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-16 10:34:30', '2022-03-16 10:35:03', NULL, '2022-03-17 00:24:24', '8f299daf-7c6b-421b-b4b9-6ae62ecf444f'),
(3, 2, NULL, 1, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-16 10:34:58', '2022-03-16 10:34:58', NULL, '2022-03-17 00:24:24', '575414e0-380c-4d45-8b5b-2f93c483755f'),
(4, 2, NULL, 2, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-16 10:35:03', '2022-03-16 10:35:03', NULL, '2022-03-17 00:24:24', 'f982c169-d198-435d-b28d-b1c17d0b429f'),
(5, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-16 10:35:58', '2022-03-16 10:36:47', NULL, '2022-03-17 00:24:24', '126e5d49-0eb7-4f71-828c-f7f2ff232792'),
(6, 5, NULL, 3, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-16 10:36:47', '2022-03-16 10:36:47', NULL, '2022-03-17 00:24:24', '4818fae3-93c1-4986-a86d-b32cba03b392'),
(7, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2022-03-16 10:39:29', '2022-03-16 15:18:33', NULL, NULL, 'f83e40e7-78f7-4143-9b19-4f3bac7a9f30'),
(8, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2022-03-16 15:19:44', '2022-03-16 15:34:56', NULL, NULL, 'cca6ca99-2bea-4fd9-b0de-81d6f4587669'),
(9, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2022-03-16 22:07:31', '2022-03-16 22:07:31', NULL, NULL, '81147dc2-e2a6-4f6c-88ce-4ef4be3ad048'),
(10, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2022-03-16 22:49:51', '2022-03-16 22:49:51', NULL, NULL, 'f14a5dc6-cf74-43c3-b30c-6848b111db3c'),
(11, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2022-03-16 22:51:23', '2022-03-16 22:51:23', NULL, NULL, 'b4d8123d-51ed-44a7-98f9-906f4c94f2e1'),
(12, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2022-03-16 22:59:25', '2022-03-16 22:59:25', NULL, NULL, '6a5429ff-442e-4176-9bc3-6db65e2274e4'),
(13, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2022-03-16 23:05:25', '2022-03-16 23:05:25', NULL, NULL, '4594b2c0-93b1-4956-ba5c-e30a8fb05eab'),
(14, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2022-03-16 23:06:47', '2022-03-16 23:06:47', NULL, NULL, '54819c9d-b188-4801-90be-a8d440e96ac5'),
(15, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2022-03-16 23:07:16', '2022-03-16 23:07:16', NULL, NULL, '6d20839e-af61-4a14-bdcc-99f1fa439bb3'),
(16, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2022-03-16 23:10:19', '2022-03-16 23:10:19', NULL, NULL, '0573e422-094f-4eb2-a82f-9a208c823d85'),
(17, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2022-03-16 23:10:49', '2022-03-16 23:10:49', NULL, NULL, '25167306-b326-4a60-86e1-30b21ebe2ead'),
(18, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2022-03-16 23:11:44', '2022-03-16 23:11:44', NULL, '2022-03-17 00:29:39', '026f5550-7b50-4bd0-8636-17afd09b26bc'),
(19, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2022-03-16 23:12:47', '2022-03-16 23:12:47', NULL, '2022-03-17 00:29:39', '99a11e2b-b9aa-4aca-8422-1e5508b2d68e'),
(20, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2022-03-16 23:13:52', '2022-03-16 23:13:52', NULL, '2022-03-17 00:29:39', 'c7b98aae-1a19-4203-a2e9-adf2ff028405'),
(21, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2022-03-16 23:16:37', '2022-03-16 23:16:37', NULL, '2022-03-17 00:29:39', '4177257c-952a-4797-993b-12e9a54fbea6'),
(22, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2022-03-16 23:17:31', '2022-03-16 23:17:31', NULL, '2022-03-17 00:29:39', 'e4b9c309-b7de-4340-84df-9f32ded3c652'),
(23, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-17 00:24:26', '2022-03-17 00:25:10', NULL, NULL, 'd603abf1-be47-4957-9a7d-88a2020efe4e'),
(24, 23, NULL, 4, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-17 00:25:10', '2022-03-17 00:25:10', NULL, NULL, '98b1f518-16d2-4451-b4eb-aeed713dcf90'),
(25, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-17 00:25:16', '2022-03-17 00:25:21', NULL, NULL, '7adbafe4-fde2-4d23-932e-17d6632e7d26'),
(26, 25, NULL, 5, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-17 00:25:21', '2022-03-17 00:25:21', NULL, NULL, '62c030cc-6e4f-4ed2-8bda-ee13d2ead872'),
(27, NULL, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2022-03-17 00:36:00', '2022-03-17 00:36:00', NULL, NULL, 'c39f4a51-3167-42e3-b4c1-effd78de13cf'),
(28, 27, NULL, 6, 2, 'craft\\elements\\Entry', 1, 0, '2022-03-17 00:36:00', '2022-03-17 00:36:00', NULL, NULL, '76f9d17b-ce79-4f62-8610-4a176c5e65f2'),
(29, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2022-03-17 00:48:55', '2022-03-17 00:48:55', NULL, NULL, '70884259-3afe-45a9-af2a-47c624a5ce59'),
(30, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2022-03-17 00:56:52', '2022-03-17 00:56:52', NULL, NULL, '72fa6c4d-8773-4dce-b5ff-a06eac4dcd33'),
(31, NULL, 5, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-17 01:25:49', '2022-03-17 01:25:49', NULL, NULL, 'e95b4edb-e657-455c-9a3f-4a2fab5e1f06'),
(32, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 09:38:24', '2022-03-17 09:38:24', NULL, NULL, '19e86d5a-4422-4545-8423-f18e8e68b457'),
(33, 32, NULL, 7, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 09:38:24', '2022-03-17 09:38:24', NULL, NULL, 'e68d67b1-712a-4415-82e1-26fdb8b9a5b3'),
(34, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 09:44:31', '2022-03-17 09:44:31', NULL, NULL, '9f2ac2c0-29b8-4fe5-ba7a-476f685f5bf6'),
(35, 34, NULL, 8, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 09:44:31', '2022-03-17 09:44:31', NULL, NULL, '5889b423-e774-4efb-92f8-b61ad02047bb'),
(36, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 09:47:15', '2022-03-17 09:47:15', NULL, NULL, '7b5998db-2c51-44ef-8839-688d357c9e2c'),
(37, 36, NULL, 9, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 09:47:15', '2022-03-17 09:47:15', NULL, NULL, '8aa468e4-9607-4a52-a2fb-d9bb02d2ebed'),
(38, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 09:54:46', '2022-03-17 09:54:46', NULL, '2022-03-17 10:21:22', '2c51284a-e78a-4819-8e8c-f05416ea72a7'),
(39, 38, NULL, 10, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 09:54:46', '2022-03-17 09:54:46', NULL, '2022-03-17 10:21:22', '19efc12b-8969-4fb0-8552-87b4db3f8769'),
(40, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 09:55:46', '2022-03-17 09:55:46', NULL, '2022-03-17 10:21:22', '85469e8b-d7a1-40ae-ba3a-f75f744a7e08'),
(41, 40, NULL, 11, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 09:55:46', '2022-03-17 09:55:46', NULL, '2022-03-17 10:21:22', '338a86c7-73e9-4599-b21b-46bf3474e853'),
(42, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 09:59:59', '2022-03-17 09:59:59', NULL, '2022-03-17 10:21:22', '27a7ebb0-0d3a-4ea0-8c8b-ccbdf1551dea'),
(43, 42, NULL, 12, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 09:59:59', '2022-03-17 09:59:59', NULL, '2022-03-17 10:21:22', '7e4b048e-3c7e-4421-94ab-4bd4e260b7e5'),
(44, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 10:08:11', '2022-03-17 10:09:38', NULL, '2022-03-17 10:21:22', '3cd000b9-b273-45ac-b5b7-05c2d71a2715'),
(45, 44, NULL, 13, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 10:08:11', '2022-03-17 10:08:11', NULL, '2022-03-17 10:21:22', '5f41dfce-256e-43d5-a7bf-881d8abae2f4'),
(47, 44, NULL, 14, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 10:09:38', '2022-03-17 10:09:38', NULL, '2022-03-17 10:21:22', '754001c2-90eb-42a9-8bc7-b734b158dc59'),
(48, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-17 10:13:23', '2022-03-17 10:16:06', NULL, '2022-03-17 10:21:22', 'd4c04a73-6936-4ea6-9464-25a7a9aacc06'),
(49, 48, NULL, 15, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 10:13:23', '2022-03-17 10:13:23', NULL, '2022-03-17 10:21:22', 'dbfc600e-0366-4db4-ace7-c86fd4b363f8'),
(50, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-17 10:13:44', '2022-03-17 10:14:08', NULL, '2022-03-17 10:16:20', 'f598a653-b65c-4af4-8f3c-fd07dfbc897f'),
(51, 50, NULL, 16, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-17 10:14:08', '2022-03-17 10:14:08', NULL, '2022-03-17 10:16:20', 'e3ffb473-2692-4b3d-953e-1d7f5c62d0f3'),
(53, 48, NULL, 17, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-17 10:16:06', '2022-03-17 10:16:06', NULL, '2022-03-17 10:21:22', '3b57b374-2545-4a0b-9da4-a07ca6fecdd6'),
(54, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 10:22:20', '2022-03-17 10:22:20', NULL, '2022-03-17 10:40:00', '69f21623-3b6a-48f9-b576-1379ff9a8989'),
(55, 54, NULL, 18, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 10:22:20', '2022-03-17 10:22:20', NULL, '2022-03-17 10:40:00', '6795aff2-c9de-4894-962f-8ec3f3769cf7'),
(56, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 10:24:09', '2022-03-17 10:24:09', NULL, '2022-03-17 10:40:00', 'f4bf8661-9316-4ffa-b0a9-c08dee05b071'),
(57, 56, NULL, 19, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 10:24:09', '2022-03-17 10:24:09', NULL, '2022-03-17 10:40:00', '391bc00d-0347-4112-a85e-c3b303d14757'),
(58, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 10:25:01', '2022-03-17 10:25:01', NULL, '2022-03-17 10:40:00', 'd6d124ab-1845-4fc0-ad5f-f9fde6cdd5bc'),
(59, 58, NULL, 20, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 10:25:01', '2022-03-17 10:25:01', NULL, '2022-03-17 10:40:00', '112d6069-412b-44f9-ab9f-1b3ba1970f23'),
(60, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 10:25:44', '2022-03-17 10:25:44', NULL, '2022-03-17 10:40:00', 'feb34ca0-fe26-4781-9505-822f799c526f'),
(61, 60, NULL, 21, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 10:25:44', '2022-03-17 10:25:44', NULL, '2022-03-17 10:40:00', 'f011da81-d71f-497a-bb17-ed895dfe006b'),
(62, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 10:26:00', '2022-03-17 10:26:00', NULL, '2022-03-17 10:40:00', 'ce58d0bd-2918-451a-8a8c-f862a6053326'),
(63, 62, NULL, 22, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 10:26:00', '2022-03-17 10:26:00', NULL, '2022-03-17 10:40:00', '58eff1c2-1513-4707-aa2f-4da19c8429cc'),
(64, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 10:26:32', '2022-03-17 10:26:32', NULL, '2022-03-17 10:40:00', 'e24118ef-335e-44db-a3a7-06e53574edf6'),
(65, 64, NULL, 23, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 10:26:32', '2022-03-17 10:26:32', NULL, '2022-03-17 10:40:00', '9db5272d-8d35-4c03-b75c-cdf936b15310'),
(66, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 10:29:11', '2022-03-17 10:29:11', NULL, '2022-03-17 10:40:00', 'd41f09f5-2d10-4ac6-984a-acfed8086dc7'),
(67, 66, NULL, 24, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 10:29:11', '2022-03-17 10:29:12', NULL, '2022-03-17 10:40:00', '2634ef24-0d0c-42bd-94f7-f26cc895ab3c'),
(68, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 10:29:47', '2022-03-17 10:29:47', NULL, '2022-03-17 10:40:00', '07c66f16-fc75-4172-af20-8ba43774b60f'),
(69, 68, NULL, 25, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 10:29:47', '2022-03-17 10:29:47', NULL, '2022-03-17 10:40:00', '89216020-3646-4f7b-89c0-9aaffb750bf1'),
(70, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-17 10:34:50', '2022-03-17 10:37:11', NULL, '2022-03-17 10:45:56', 'daf50cad-f148-4b0a-bc26-080b3b18e59b'),
(71, 70, NULL, 26, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 10:34:50', '2022-03-17 10:34:50', NULL, '2022-03-17 10:45:56', 'b7a963dd-d801-4770-983d-c51888f32f31'),
(72, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-17 10:36:49', '2022-03-17 10:37:11', NULL, NULL, '365eac13-e7ee-40ec-b57b-9dc7c4d88efc'),
(73, 72, NULL, 27, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 10:36:49', '2022-03-17 10:36:49', NULL, NULL, 'a18b7056-6dfe-4b29-86f5-02c3896032a2'),
(74, 70, NULL, 28, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-17 10:37:11', '2022-03-17 10:37:11', NULL, '2022-03-17 10:45:56', '7b72c107-2ea2-4124-987a-7848871f23bf'),
(75, 72, NULL, 29, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-17 10:37:11', '2022-03-17 10:37:11', NULL, NULL, 'f91a5535-0d04-4ff8-a6f9-a149d539a788'),
(76, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 10:46:07', '2022-03-17 10:46:07', NULL, '2022-03-17 10:48:43', '00b9ba97-8b7f-4f61-b0d7-2ba5477c61a9'),
(77, 76, NULL, 30, 1, 'craft\\elements\\Entry', 0, 0, '2022-03-17 10:46:07', '2022-03-17 10:46:07', NULL, '2022-03-17 10:48:43', 'bc560af2-210a-40f9-9e5d-3fadb1bffc0a'),
(78, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-17 10:48:50', '2022-03-17 10:48:50', NULL, NULL, 'eedc44ef-8d48-4471-b83a-b45b8fbb4c85'),
(79, 78, NULL, 31, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-17 10:48:50', '2022-03-17 10:48:50', NULL, NULL, '0751c158-f267-4bab-8bce-37f153a43480'),
(80, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-17 10:53:45', '2022-03-17 10:53:45', NULL, NULL, '23b14722-e692-45f9-99c0-5aece12118d6'),
(81, 80, NULL, 32, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-17 10:53:45', '2022-03-17 10:53:45', NULL, NULL, 'fc25263f-b8f2-4454-bdf7-2248ad109a6a'),
(82, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-17 10:55:45', '2022-03-17 10:55:45', NULL, NULL, 'b6f5c528-18f5-4907-aef4-c8621c28d306'),
(83, 82, NULL, 33, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-17 10:55:45', '2022-03-17 10:55:45', NULL, NULL, '39370a78-391d-4be3-bd4f-497370270438'),
(84, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-17 10:56:15', '2022-03-17 10:56:15', NULL, '2022-03-17 10:56:28', '05069c11-0e40-4fd5-a538-fc4ccf3fed7d'),
(85, 84, NULL, 34, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-17 10:56:15', '2022-03-17 10:56:15', NULL, '2022-03-17 10:56:28', '42fbdc6b-eb13-4363-8037-9b739bb26ba5'),
(86, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-17 11:51:25', '2022-03-17 11:51:25', NULL, NULL, 'fa4d3245-faf4-4832-8f82-f127baa7dede'),
(87, 86, NULL, 35, 1, 'craft\\elements\\Entry', 1, 0, '2022-03-17 11:51:25', '2022-03-17 11:51:25', NULL, NULL, '4f691ee9-a09a-45b0-8ad6-4aa98cae5e32');

-- --------------------------------------------------------

--
-- Table structure for table `elements_sites`
--

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2022-03-16 10:17:15', '2022-03-16 10:17:15', '4093ced2-17dd-471a-83d9-e1730844d25d'),
(2, 2, 1, '1', 'posts/1', 1, '2022-03-16 10:34:30', '2022-03-16 10:34:37', '5cf86e48-53ff-4521-82af-257810c028a0'),
(3, 3, 1, '1', 'posts/1', 1, '2022-03-16 10:34:58', '2022-03-16 10:34:58', '66eed900-f662-4c47-aecc-1ff5e5538e88'),
(4, 4, 1, '1', 'posts/1', 1, '2022-03-16 10:35:03', '2022-03-16 10:35:03', 'e4a7bad8-dd71-486d-8407-bbd1e476bc7d'),
(5, 5, 1, '2', 'posts/2', 1, '2022-03-16 10:35:58', '2022-03-16 10:36:45', '0aefba91-d0e5-4dd0-9b0d-236e9c0dcb7e'),
(6, 6, 1, '2', 'posts/2', 1, '2022-03-16 10:36:47', '2022-03-16 10:36:47', '0152183e-ca9b-4a85-abda-ca166eb97e37'),
(7, 7, 1, NULL, NULL, 1, '2022-03-16 10:39:29', '2022-03-16 10:39:29', '261fb98d-ab41-4abc-9c4f-b241df900589'),
(8, 8, 1, NULL, NULL, 1, '2022-03-16 15:19:44', '2022-03-16 15:19:44', 'd7325c9f-e762-47cf-803e-4e54919609bf'),
(9, 9, 1, NULL, NULL, 1, '2022-03-16 22:07:31', '2022-03-16 22:07:31', '1776188b-45b0-4855-8c5b-30a19a22393a'),
(10, 10, 1, NULL, NULL, 1, '2022-03-16 22:49:51', '2022-03-16 22:49:51', '71f9b88c-c5b8-4536-bef5-f6d5dead364f'),
(11, 11, 1, NULL, NULL, 1, '2022-03-16 22:51:23', '2022-03-16 22:51:23', 'eb674604-729f-4256-96cc-c2c7b3d9a700'),
(12, 12, 1, NULL, NULL, 1, '2022-03-16 22:59:25', '2022-03-16 22:59:25', 'c05141ce-dfe6-443c-b6b0-6a25805da7b5'),
(13, 13, 1, NULL, NULL, 1, '2022-03-16 23:05:25', '2022-03-16 23:05:25', '43a43d8a-4348-432c-9e1b-8e4f803df545'),
(14, 14, 1, NULL, NULL, 1, '2022-03-16 23:06:47', '2022-03-16 23:06:47', '0fc2887e-e412-4ac8-ac70-f42147339212'),
(15, 15, 1, NULL, NULL, 1, '2022-03-16 23:07:16', '2022-03-16 23:07:16', '8dad9a21-e9f8-4a4b-a551-53e7a0ac6511'),
(16, 16, 1, NULL, NULL, 1, '2022-03-16 23:10:19', '2022-03-16 23:10:19', 'e3069919-8210-4de6-b6aa-a85d83518b4b'),
(17, 17, 1, NULL, NULL, 1, '2022-03-16 23:10:49', '2022-03-16 23:10:49', 'ac65a8ee-01b3-4b3a-b161-58c3a012163b'),
(18, 18, 1, NULL, NULL, 1, '2022-03-16 23:11:44', '2022-03-16 23:11:44', '86b984c7-64e7-4329-8cf3-80275a4118d5'),
(19, 19, 1, NULL, NULL, 1, '2022-03-16 23:12:47', '2022-03-16 23:12:47', '30b73bde-c85a-4892-9b9f-86af0b189748'),
(20, 20, 1, NULL, NULL, 1, '2022-03-16 23:13:52', '2022-03-16 23:13:52', 'f95412fb-488e-402f-8979-1d0011b439d0'),
(21, 21, 1, NULL, NULL, 1, '2022-03-16 23:16:37', '2022-03-16 23:16:37', 'a036143d-a497-40ec-a92a-bb435abae042'),
(22, 22, 1, NULL, NULL, 1, '2022-03-16 23:17:31', '2022-03-16 23:17:31', '122236af-9fd0-48c9-ab2f-dad9c8f4b008'),
(23, 23, 1, '1', 'posts/1', 1, '2022-03-17 00:24:26', '2022-03-17 00:25:05', '18f17d90-c371-4306-95a1-fd8024ee8d09'),
(24, 24, 1, '1', 'posts/1', 1, '2022-03-17 00:25:10', '2022-03-17 00:25:10', 'f0a8a6cd-5738-41f5-8981-c2ce26e3b8d6'),
(25, 25, 1, '1-2', 'posts/1-2', 1, '2022-03-17 00:25:16', '2022-03-17 00:25:18', 'ceb2918c-3702-48b6-9279-d8d3ae39a770'),
(26, 26, 1, '1-2', 'posts/1-2', 1, '2022-03-17 00:25:21', '2022-03-17 00:25:21', '2e2cbe78-0252-4965-9af4-2773f32ae75f'),
(27, 27, 1, 'dashboard', 'dashboard', 1, '2022-03-17 00:36:00', '2022-03-17 00:36:00', '94033726-61e8-4286-a986-ec4efbc9bc42'),
(28, 28, 1, 'dashboard', 'dashboard', 1, '2022-03-17 00:36:00', '2022-03-17 00:36:00', '66ab7798-b926-4a2b-94fc-a78de8f8e2bb'),
(29, 29, 1, NULL, NULL, 1, '2022-03-17 00:48:55', '2022-03-17 00:48:55', 'a4db29ae-d0b4-4d41-b251-60f8fa9a2b32'),
(30, 30, 1, NULL, NULL, 1, '2022-03-17 00:56:52', '2022-03-17 00:56:52', 'a1d82121-4b06-445e-9b45-b5265a76551f'),
(31, 31, 1, '__temp_ivvskwtigeqakaczticgdqpglnaqydryfrnt', 'posts/__temp_ivvskwtigeqakaczticgdqpglnaqydryfrnt', 1, '2022-03-17 01:25:49', '2022-03-17 01:25:49', '9a24f557-e05b-4197-88d6-ee9a9103173e'),
(32, 32, 1, 'owen-wilson', 'posts/owen-wilson', 1, '2022-03-17 09:38:24', '2022-03-17 09:38:24', '840f5e7f-030c-49ca-8054-1d176c8832db'),
(33, 33, 1, 'owen-wilson', 'posts/owen-wilson', 1, '2022-03-17 09:38:24', '2022-03-17 09:38:24', '99ced390-9a7d-4d9b-8c66-48fd454c305a'),
(34, 34, 1, 'owen-wilson-2', 'posts/owen-wilson-2', 1, '2022-03-17 09:44:31', '2022-03-17 09:44:31', '85fad566-3bb0-4984-8e9d-99b6805c8f7c'),
(35, 35, 1, 'owen-wilson-2', 'posts/owen-wilson-2', 1, '2022-03-17 09:44:31', '2022-03-17 09:44:31', '08c2acba-a54c-4ef2-9a5e-136f5b6069c2'),
(36, 36, 1, 'owen-wilson-3', 'posts/owen-wilson-3', 1, '2022-03-17 09:47:15', '2022-03-17 09:47:15', '08bbc48b-f694-4362-b47b-400ffa8a3472'),
(37, 37, 1, 'owen-wilson-3', 'posts/owen-wilson-3', 1, '2022-03-17 09:47:15', '2022-03-17 09:47:15', 'adbb2020-f642-498f-8fb8-e938bc9162a5'),
(38, 38, 1, 'owen-wilson-4', 'posts/owen-wilson-4', 1, '2022-03-17 09:54:46', '2022-03-17 09:54:46', '32bdddbe-6d2a-4dbd-aacf-8201966f58c4'),
(39, 39, 1, 'owen-wilson-4', 'posts/owen-wilson-4', 1, '2022-03-17 09:54:46', '2022-03-17 09:54:46', 'dd5bda49-a48e-48ae-bb19-1496ff59c16e'),
(40, 40, 1, 'owen-wilson-5', 'posts/owen-wilson-5', 1, '2022-03-17 09:55:46', '2022-03-17 09:55:46', 'b77d0a03-938e-4867-9c9b-dcea7c745245'),
(41, 41, 1, 'owen-wilson-5', 'posts/owen-wilson-5', 1, '2022-03-17 09:55:46', '2022-03-17 09:55:46', '296e58e7-47ae-4210-ad3c-cae50fec586d'),
(42, 42, 1, 'owen-wilson-6', 'posts/owen-wilson-6', 1, '2022-03-17 09:59:59', '2022-03-17 09:59:59', 'ff8b6516-d79e-4a8b-b386-daee30744905'),
(43, 43, 1, 'owen-wilson-6', 'posts/owen-wilson-6', 1, '2022-03-17 09:59:59', '2022-03-17 09:59:59', 'b6cfeb48-9f75-4491-9751-1b03f1b50196'),
(44, 44, 1, 'owen-wilson-7', 'posts/owen-wilson-7', 1, '2022-03-17 10:08:11', '2022-03-17 10:08:11', '58db4dfd-0227-4025-b74d-904314b3de4c'),
(45, 45, 1, 'owen-wilson-7', 'posts/owen-wilson-7', 1, '2022-03-17 10:08:11', '2022-03-17 10:08:11', 'a5688c31-9487-4e6d-8d99-91ccc790afc7'),
(47, 47, 1, 'owen-wilson-7', 'posts/owen-wilson-7', 1, '2022-03-17 10:09:38', '2022-03-17 10:09:38', '9df35244-4c73-4dd6-a981-4283502fc1d1'),
(48, 48, 1, 'owen-wilson-8', 'posts/owen-wilson-8', 1, '2022-03-17 10:13:23', '2022-03-17 10:13:23', 'fd9f6876-c265-40af-8967-d90c0e861377'),
(49, 49, 1, 'owen-wilson-8', 'posts/owen-wilson-8', 1, '2022-03-17 10:13:23', '2022-03-17 10:13:23', 'cafbb70a-692b-4f46-80de-0f05dc498b45'),
(50, 50, 1, 'jack', 'posts/jack', 1, '2022-03-17 10:13:44', '2022-03-17 10:14:00', '10b6d75a-9e75-460b-8efa-b56b30e8b445'),
(51, 51, 1, 'jack', 'posts/jack', 1, '2022-03-17 10:14:08', '2022-03-17 10:14:08', 'cfe3ceb5-967f-45ba-9b2f-ec292e51e5f3'),
(53, 53, 1, 'owen-wilson-8', 'posts/owen-wilson-8', 1, '2022-03-17 10:16:06', '2022-03-17 10:16:06', '502dc2fc-6f34-4d97-b68b-ebb508d88501'),
(54, 54, 1, 'owen-wilson-4', 'posts/owen-wilson-4', 1, '2022-03-17 10:22:20', '2022-03-17 10:22:20', '9602deca-df5c-43bf-92af-f038f911c72d'),
(55, 55, 1, 'owen-wilson-4', 'posts/owen-wilson-4', 1, '2022-03-17 10:22:20', '2022-03-17 10:22:20', '0dd057df-dffe-4cde-9d28-e0d0f211ff32'),
(56, 56, 1, 'owen-wilson-5', 'posts/owen-wilson-5', 1, '2022-03-17 10:24:09', '2022-03-17 10:24:09', '3c5fa9a1-8b3f-4fb1-af6f-a90ebb9902e5'),
(57, 57, 1, 'owen-wilson-5', 'posts/owen-wilson-5', 1, '2022-03-17 10:24:09', '2022-03-17 10:24:09', '33ae88f6-f0bd-4255-9168-aab8756a7a18'),
(58, 58, 1, 'owen-wilson-6', 'posts/owen-wilson-6', 1, '2022-03-17 10:25:01', '2022-03-17 10:25:01', '4f97af8c-5f41-4b9d-b5e2-8fb82ac258b7'),
(59, 59, 1, 'owen-wilson-6', 'posts/owen-wilson-6', 1, '2022-03-17 10:25:01', '2022-03-17 10:25:01', '5fd66ce5-b412-43e0-8e2a-d870199fa050'),
(60, 60, 1, 'owen-wilson-7', 'posts/owen-wilson-7', 1, '2022-03-17 10:25:44', '2022-03-17 10:25:44', '7da0b392-a3e3-4883-82c7-a7628f0092e6'),
(61, 61, 1, 'owen-wilson-7', 'posts/owen-wilson-7', 1, '2022-03-17 10:25:44', '2022-03-17 10:25:44', '2acc77cd-fb3d-44c8-8558-e8b150f35819'),
(62, 62, 1, 'owen-wilson-8', 'posts/owen-wilson-8', 1, '2022-03-17 10:26:00', '2022-03-17 10:26:00', '600fa72c-ea3a-4ab8-a0ef-c0e059646429'),
(63, 63, 1, 'owen-wilson-8', 'posts/owen-wilson-8', 1, '2022-03-17 10:26:00', '2022-03-17 10:26:00', '6244db43-7283-4a78-88e0-3da42bbc8a1d'),
(64, 64, 1, 'owen-wilson-9', 'posts/owen-wilson-9', 1, '2022-03-17 10:26:32', '2022-03-17 10:26:32', '453cb37c-f2ed-4f6a-910f-06cb55222b37'),
(65, 65, 1, 'owen-wilson-9', 'posts/owen-wilson-9', 1, '2022-03-17 10:26:32', '2022-03-17 10:26:32', '03197e66-7a2f-4c35-82fd-4c77b0ff40a8'),
(66, 66, 1, 'owen-wilson-10', 'posts/owen-wilson-10', 1, '2022-03-17 10:29:11', '2022-03-17 10:29:11', 'b4a9deb0-e07e-4192-967e-2ed29fe91fec'),
(67, 67, 1, 'owen-wilson-10', 'posts/owen-wilson-10', 1, '2022-03-17 10:29:12', '2022-03-17 10:29:12', 'ff69d582-839f-4ff4-99f5-76a7347c5b4b'),
(68, 68, 1, 'owen-wilson-11', 'posts/owen-wilson-11', 1, '2022-03-17 10:29:47', '2022-03-17 10:29:47', '3543472a-a09e-44cc-be0f-1b9c23380dad'),
(69, 69, 1, 'owen-wilson-11', 'posts/owen-wilson-11', 1, '2022-03-17 10:29:47', '2022-03-17 10:29:47', '77d4ccb6-b663-436c-8795-94267a3fbb9f'),
(70, 70, 1, 'owen-wilson-12', 'posts/owen-wilson-12', 1, '2022-03-17 10:34:50', '2022-03-17 10:34:50', '17701c8b-f4e8-4677-b3e6-8c0a18829efe'),
(71, 71, 1, 'owen-wilson-12', 'posts/owen-wilson-12', 1, '2022-03-17 10:34:50', '2022-03-17 10:34:50', '9af90c0f-b56e-4303-86b1-a49aadc9f9a0'),
(72, 72, 1, 'owen-wilson-13', 'posts/owen-wilson-13', 1, '2022-03-17 10:36:49', '2022-03-17 10:36:49', 'f6b8acf9-c220-4075-a3de-75e7c97ffd92'),
(73, 73, 1, 'owen-wilson-13', 'posts/owen-wilson-13', 1, '2022-03-17 10:36:49', '2022-03-17 10:36:49', '57adb74b-1a85-420e-b6fe-dd68548d4d89'),
(74, 74, 1, 'owen-wilson-12', 'posts/owen-wilson-12', 1, '2022-03-17 10:37:11', '2022-03-17 10:37:11', '728ba39d-7af8-42f9-b9dd-f46032e91af3'),
(75, 75, 1, 'owen-wilson-13', 'posts/owen-wilson-13', 1, '2022-03-17 10:37:11', '2022-03-17 10:37:11', '34374ce6-374d-4cad-9599-562b7c219fb6'),
(76, 76, 1, 'owen-wilson-4', 'posts/owen-wilson-4', 1, '2022-03-17 10:46:07', '2022-03-17 10:46:07', '17e45af0-856b-469a-8da1-b20451e82530'),
(77, 77, 1, 'owen-wilson-4', 'posts/owen-wilson-4', 1, '2022-03-17 10:46:07', '2022-03-17 10:46:07', '4bbf536e-4b39-4a17-9378-1219240708d3'),
(78, 78, 1, 'owen-wilson-4', 'posts/owen-wilson-4', 1, '2022-03-17 10:48:50', '2022-03-17 10:48:50', '67030023-a3eb-4b2f-b154-97088f81c544'),
(79, 79, 1, 'owen-wilson-4', 'posts/owen-wilson-4', 1, '2022-03-17 10:48:50', '2022-03-17 10:48:50', 'ba34ca5c-9124-4834-a2dc-9660c0c6fb32'),
(80, 80, 1, 'owen-wilson-5', 'posts/owen-wilson-5', 1, '2022-03-17 10:53:45', '2022-03-17 10:53:45', '6f7b95a0-eb8b-43d2-9b23-b79e21e76092'),
(81, 81, 1, 'owen-wilson-5', 'posts/owen-wilson-5', 1, '2022-03-17 10:53:45', '2022-03-17 10:53:45', 'b81ea5c9-eb17-426f-88f0-7118405d6545'),
(82, 82, 1, 'owen-wilson-6', 'posts/owen-wilson-6', 1, '2022-03-17 10:55:45', '2022-03-17 10:55:45', 'b7a585ca-91c2-44a4-ae3b-ff89066b03ab'),
(83, 83, 1, 'owen-wilson-6', 'posts/owen-wilson-6', 1, '2022-03-17 10:55:45', '2022-03-17 10:55:45', '35415238-bd8b-4a23-b623-b7288cc25fba'),
(84, 84, 1, 'owen-wilson-7', 'posts/owen-wilson-7', 1, '2022-03-17 10:56:15', '2022-03-17 10:56:15', '7ad2190f-c17a-4ea7-b3b9-6c58613c52fa'),
(85, 85, 1, 'owen-wilson-7', 'posts/owen-wilson-7', 1, '2022-03-17 10:56:15', '2022-03-17 10:56:15', '81ef4ffa-bfc8-47e5-b2da-fb741e415b6b'),
(86, 86, 1, 'testie-mctest', 'posts/testie-mctest', 1, '2022-03-17 11:51:25', '2022-03-17 11:51:25', 'f94aa2e8-ee71-42c2-aa72-e70b85a7bdb2'),
(87, 87, 1, 'testie-mctest', 'posts/testie-mctest', 1, '2022-03-17 11:51:25', '2022-03-17 11:51:25', '026c2093-e49d-4357-9e57-7cbb431313a0');

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `entries`
--

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(38, 1, NULL, 1, 8, '2022-03-17 10:21:22', NULL, 0, '2022-03-17 09:54:46', '2022-03-17 09:54:46', '7e6c1879-90ca-4878-b75e-83f62f2447f5'),
(39, 1, NULL, 1, 8, '2022-03-17 09:55:40', NULL, NULL, '2022-03-17 09:54:46', '2022-03-17 09:54:46', 'c15f658c-30dd-4bd1-a779-5ee6f89fae71'),
(40, 1, NULL, 1, 8, '2022-03-17 10:21:22', NULL, 0, '2022-03-17 09:55:46', '2022-03-17 09:55:46', 'c4b9c7e6-ce78-45ac-9f77-efc3f6cb5fcd'),
(41, 1, NULL, 1, 8, '2022-03-17 09:55:46', NULL, NULL, '2022-03-17 09:55:46', '2022-03-17 09:55:46', 'e8523b13-82ab-4a45-95d7-9a207c8fe71a'),
(42, 1, NULL, 1, 8, '2022-03-17 10:21:22', NULL, 0, '2022-03-17 09:59:59', '2022-03-17 09:59:59', 'd433b2df-2e21-404f-ac2a-f508987a3e1a'),
(43, 1, NULL, 1, 8, '2022-03-17 09:59:59', NULL, NULL, '2022-03-17 09:59:59', '2022-03-17 09:59:59', 'fec844ab-14f0-4670-9646-6fda4379f311'),
(44, 1, NULL, 1, 8, '2022-03-17 10:21:22', NULL, 0, '2022-03-17 10:08:11', '2022-03-17 10:09:38', '21e0d17f-8f4f-4126-a261-39839a1da918'),
(45, 1, NULL, 1, 8, '2022-03-17 10:08:11', NULL, NULL, '2022-03-17 10:08:11', '2022-03-17 10:08:11', 'c3aac179-6d2a-49dd-92eb-d80b54f8b81a'),
(47, 1, NULL, 1, 8, '2022-03-17 10:08:00', NULL, NULL, '2022-03-17 10:09:38', '2022-03-17 10:09:38', 'f08c8c3c-e51d-4435-97d3-185dbf522857'),
(48, 1, NULL, 1, 8, '2022-03-17 10:21:22', NULL, 0, '2022-03-17 10:13:23', '2022-03-17 10:16:06', 'deb29ae2-df16-4d6e-91c1-59ff267e7dc8'),
(49, 1, NULL, 1, 8, '2022-03-17 10:13:23', NULL, NULL, '2022-03-17 10:13:23', '2022-03-17 10:13:23', '9630b55d-ecd9-42fa-9bce-9712047d882c'),
(50, 1, NULL, 1, 1, '2022-03-17 10:16:20', NULL, 0, '2022-03-17 10:13:44', '2022-03-17 10:13:44', 'ffc6b5d9-27cd-4bd1-ba62-73433fe41bf0'),
(51, 1, NULL, 1, 1, '2022-03-17 10:13:00', NULL, NULL, '2022-03-17 10:14:08', '2022-03-17 10:14:08', 'd11038c1-3740-4e21-828b-55e9600fd3fb'),
(53, 1, NULL, 1, 8, '2022-03-17 10:13:00', NULL, NULL, '2022-03-17 10:16:06', '2022-03-17 10:16:06', 'c7303980-a1e4-4247-a45c-6e5a50c9c4e8'),
(54, 1, NULL, 1, 8, '2022-03-17 10:40:00', NULL, 0, '2022-03-17 10:22:20', '2022-03-17 10:22:20', 'fea45f44-1c69-4f4e-9dc0-80215bcb54bb'),
(55, 1, NULL, 1, 8, '2022-03-17 10:22:20', NULL, NULL, '2022-03-17 10:22:20', '2022-03-17 10:22:20', '8143af8c-be65-4a77-bf9d-5232a847be06'),
(56, 1, NULL, 1, 8, '2022-03-17 10:40:00', NULL, 0, '2022-03-17 10:24:09', '2022-03-17 10:24:09', '614a6def-aa6d-45ed-8f74-e6bcd89b4634'),
(57, 1, NULL, 1, 8, '2022-03-17 10:24:09', NULL, NULL, '2022-03-17 10:24:09', '2022-03-17 10:24:09', 'db3f2944-f75c-43cb-9d95-31ed9695f782'),
(58, 1, NULL, 1, 8, '2022-03-17 10:40:00', NULL, 0, '2022-03-17 10:25:01', '2022-03-17 10:25:01', '05b7eb72-2c35-49a8-9a9e-bcc083d3911e'),
(59, 1, NULL, 1, 8, '2022-03-17 10:25:01', NULL, NULL, '2022-03-17 10:25:01', '2022-03-17 10:25:01', '22ab79cb-a844-4a35-b89f-9f83c432d1bf'),
(60, 1, NULL, 1, 8, '2022-03-17 10:40:00', NULL, 0, '2022-03-17 10:25:44', '2022-03-17 10:25:44', '2b171bbe-c0f2-4e93-836a-1cde49dfca6c'),
(61, 1, NULL, 1, 8, '2022-03-17 10:25:44', NULL, NULL, '2022-03-17 10:25:44', '2022-03-17 10:25:44', 'c7662ea5-c3b6-4495-80a0-ff47ba2983fb'),
(62, 1, NULL, 1, 8, '2022-03-17 10:40:00', NULL, 0, '2022-03-17 10:26:00', '2022-03-17 10:26:00', '8ce93182-fe7a-472e-8991-946b36f624f2'),
(63, 1, NULL, 1, 8, '2022-03-17 10:26:00', NULL, NULL, '2022-03-17 10:26:00', '2022-03-17 10:26:00', 'fa84692f-0d17-434c-b910-a70d98be911f'),
(64, 1, NULL, 1, 8, '2022-03-17 10:40:00', NULL, 0, '2022-03-17 10:26:32', '2022-03-17 10:26:32', '7d70f703-dff6-4373-b6d9-b9ad3c747721'),
(65, 1, NULL, 1, 8, '2022-03-17 10:26:32', NULL, NULL, '2022-03-17 10:26:32', '2022-03-17 10:26:32', '62521bc8-2981-41a8-81c5-dd0b4d129634'),
(66, 1, NULL, 1, 8, '2022-03-17 10:40:00', NULL, 0, '2022-03-17 10:29:11', '2022-03-17 10:29:11', '5e53d034-8050-4659-8718-a6ed7e044ba0'),
(67, 1, NULL, 1, 8, '2022-03-17 10:29:12', NULL, NULL, '2022-03-17 10:29:12', '2022-03-17 10:29:12', '6fc04437-8026-44ec-9d89-273295920425'),
(68, 1, NULL, 1, 8, '2022-03-17 10:40:00', NULL, 0, '2022-03-17 10:29:47', '2022-03-17 10:29:47', 'd87b5090-bc4e-4205-8157-0109b1fcdbdb'),
(69, 1, NULL, 1, 8, '2022-03-17 10:29:47', NULL, NULL, '2022-03-17 10:29:47', '2022-03-17 10:29:47', '1d210f80-fe38-4fe6-bf93-b7ab126e56cf'),
(70, 1, NULL, 1, 8, '2022-03-17 10:45:56', NULL, 0, '2022-03-17 10:34:50', '2022-03-17 10:34:50', '49a5ec85-b063-4645-b6e9-a30ae5498aba'),
(71, 1, NULL, 1, 8, '2022-03-17 10:34:50', NULL, NULL, '2022-03-17 10:34:50', '2022-03-17 10:34:50', 'd55fd749-cc4d-4ac4-8f9d-4a6aec8a685f'),
(72, 1, NULL, 1, 8, '2022-03-17 10:36:49', NULL, NULL, '2022-03-17 10:36:49', '2022-03-17 10:36:49', '42e56b0a-a6dd-4e5f-a974-527aaf53bf51'),
(73, 1, NULL, 1, 8, '2022-03-17 10:36:49', NULL, NULL, '2022-03-17 10:36:49', '2022-03-17 10:36:49', 'cc781102-294c-4191-bd12-803955aa3e3e'),
(74, 1, NULL, 1, 8, '2022-03-17 10:34:50', NULL, NULL, '2022-03-17 10:37:11', '2022-03-17 10:37:11', '1737fb7a-f2df-48cb-acf3-53f9d2cc6774'),
(75, 1, NULL, 1, 8, '2022-03-17 10:36:49', NULL, NULL, '2022-03-17 10:37:11', '2022-03-17 10:37:11', '17124a19-abff-4623-8ce9-050d2914c638'),
(76, 1, NULL, 1, 8, '2022-03-17 10:48:43', NULL, 0, '2022-03-17 10:46:07', '2022-03-17 10:46:07', 'c42927bb-0856-461a-babd-f6b23bbbb382'),
(77, 1, NULL, 1, 8, '2022-03-17 10:46:07', NULL, NULL, '2022-03-17 10:46:07', '2022-03-17 10:46:07', '82acc78b-08a4-484f-a16b-8c4df5532234'),
(78, 1, NULL, 1, 8, '2022-03-17 10:48:00', NULL, NULL, '2022-03-17 10:48:50', '2022-03-17 10:48:50', '656d4bce-831d-41bd-a36b-c42077384fad'),
(79, 1, NULL, 1, 8, '2022-03-17 10:48:00', NULL, NULL, '2022-03-17 10:48:50', '2022-03-17 10:48:50', 'e663d08b-ee84-4f61-81e9-f2d9081ea8c4'),
(80, 1, NULL, 1, 8, '2022-03-17 10:53:00', NULL, NULL, '2022-03-17 10:53:45', '2022-03-17 10:53:45', '904b3733-3bcf-48e9-af69-b5a60bcfef01'),
(81, 1, NULL, 1, 8, '2022-03-17 10:53:00', NULL, NULL, '2022-03-17 10:53:45', '2022-03-17 10:53:45', '7552faa1-1686-4a2f-8db5-03de6c59c893'),
(82, 1, NULL, 1, 8, '2022-03-17 10:55:00', NULL, NULL, '2022-03-17 10:55:45', '2022-03-17 10:55:45', '2bf8bdf8-d1d9-4e45-ab85-a15f8129dfd8'),
(83, 1, NULL, 1, 8, '2022-03-17 10:55:00', NULL, NULL, '2022-03-17 10:55:45', '2022-03-17 10:55:45', 'd1a93589-2287-4039-a55f-5b11308a7cb2'),
(84, 1, NULL, 1, 8, '2022-03-17 10:56:28', NULL, 0, '2022-03-17 10:56:15', '2022-03-17 10:56:15', '836e515d-f85e-4a9f-a604-bc755b79e5e9'),
(85, 1, NULL, 1, 8, '2022-03-17 10:56:00', NULL, NULL, '2022-03-17 10:56:15', '2022-03-17 10:56:15', '1fbf5c01-34ad-4009-9d95-dd0e59f8010a'),
(86, 1, NULL, 1, 7, '2022-03-17 11:51:00', NULL, NULL, '2022-03-17 11:51:25', '2022-03-17 11:51:25', '6f2a6a3f-7831-4761-b479-aed5ee98f5f0'),
(87, 1, NULL, 1, 7, '2022-03-17 11:51:00', NULL, NULL, '2022-03-17 11:51:25', '2022-03-17 11:51:25', 'c677b68b-1f09-4927-a14b-a31a9d63ce55');

-- --------------------------------------------------------

--
-- Table structure for table `entrytypes`
--

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `entrytypes`
--

INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'Default Post', 'defaultPost', 1, 'site', NULL, NULL, 1, '2022-03-16 10:33:21', '2022-03-16 10:33:41', NULL, 'c6002c38-1570-4d87-b1fd-4fbf360d57ed'),
(2, 2, 2, 'Dashboard', 'dashboard', 0, 'site', NULL, '{section.name|raw}', 1, '2022-03-17 00:36:00', '2022-03-17 00:36:00', NULL, 'b884c716-81f2-4112-b8ab-91d5692c3915');

-- --------------------------------------------------------

--
-- Table structure for table `fieldgroups`
--

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fieldgroups`
--

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Common', '2022-03-16 10:17:15', '2022-03-16 10:17:15', NULL, '9dc40071-80f8-4662-8639-93d2a4afe247'),
(2, 'Posts', '2022-03-16 10:28:33', '2022-03-16 10:28:33', NULL, '0f297017-0c66-4a81-a4e1-0b7569f0ac6d'),
(3, 'Users', '2022-03-16 10:28:40', '2022-03-16 10:28:40', NULL, '160c61c7-a506-4e3b-92ec-7e9118b9e500');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayoutfields`
--

CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fieldlayoutfields`
--

INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(6, 1, 7, 1, 1, 1, '2022-03-17 10:22:00', '2022-03-17 10:22:00', '0f72dd9e-e0db-4bdd-8a0f-2ee80171c4d6');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouts`
--

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fieldlayouts`
--

INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '2022-03-16 10:33:21', '2022-03-16 10:33:21', NULL, '6783cbf8-990d-4f74-a640-a42beae5cdf1'),
(2, 'craft\\elements\\Entry', '2022-03-17 00:36:00', '2022-03-17 00:36:00', NULL, 'c037955e-87ef-4af1-bc6f-c93c715c8708');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouttabs`
--

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fieldlayouttabs`
--

INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(5, 2, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2022-03-17 00:36:00', '2022-03-17 00:36:00', 'a984d6f4-fd39-44a5-a030-7fd87f23c2a9'),
(7, 1, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":\"\",\"instructions\":\"\",\"tip\":null,\"warning\":null,\"required\":\"1\",\"width\":100,\"fieldUid\":\"119de8cb-6928-434e-ba7b-ab558fd9b8a4\"}]', 1, '2022-03-17 10:22:00', '2022-03-17 10:22:00', '15a067b5-d9bb-459d-b35a-e699beadec61');

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 2, 'Text', 'text', 'global', 'jqxtkcjq', 'Text content for posts.', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2022-03-16 10:29:55', '2022-03-17 10:41:14', '119de8cb-6928-434e-ba7b-ab558fd9b8a4'),
(2, 3, 'First Name', 'firstName', 'global', 'lokptvdw', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2022-03-16 10:30:23', '2022-03-16 10:30:23', '939c7076-db0b-4f15-a10d-647d91b2d4e6'),
(3, 3, 'Last Name', 'lastName', 'global', 'irwlbseb', '', 0, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2022-03-16 10:30:33', '2022-03-16 10:30:33', '74d5d2ed-3518-4635-ab8e-d008e3d1269a');

-- --------------------------------------------------------

--
-- Table structure for table `globalsets`
--

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gqlschemas`
--

CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gqlschemas`
--

INSERT INTO `gqlschemas` (`id`, `name`, `scope`, `isPublic`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Public Schema', '[]', 1, '2022-03-17 02:02:21', '2022-03-17 02:02:21', 'a5414745-8262-4c2c-bd5f-5ed1f3708246');

-- --------------------------------------------------------

--
-- Table structure for table `gqltokens`
--

CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gqltokens`
--

INSERT INTO `gqltokens` (`id`, `name`, `accessToken`, `enabled`, `expiryDate`, `lastUsed`, `schemaId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Public Token', '__PUBLIC__', 1, NULL, NULL, 1, '2022-03-17 02:02:21', '2022-03-17 02:02:21', 'd4d5fc30-37d5-4a1d-a389-adee03d70e38');

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.7.37', '3.7.33', 0, 'oibzinlxgujb', '2@shazszfxet', '2022-03-16 10:17:15', '2022-03-17 10:48:31', 'e9de20c4-f203-424a-a468-58dbc8959018');

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocks`
--

CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocktypes`
--

CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft', 'Install', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '6952b430-6f35-461f-be9a-966134d1caff'),
(2, 'craft', 'm150403_183908_migrations_table_changes', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '20031d44-837d-42d9-9fa9-2a2fe3b0cfc8'),
(3, 'craft', 'm150403_184247_plugins_table_changes', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'cfe1438f-0652-4fe1-b637-dbcd823d30df'),
(4, 'craft', 'm150403_184533_field_version', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'ec1ac91b-4140-4947-b2c9-19e86ac2e321'),
(5, 'craft', 'm150403_184729_type_columns', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '17025f83-cf54-4839-a6ad-dbca0cb2094e'),
(6, 'craft', 'm150403_185142_volumes', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'aec75434-6930-4c6b-9cae-c0cab51325b8'),
(7, 'craft', 'm150428_231346_userpreferences', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '5c4b5c78-80ed-4639-bf23-7b4a407ad8d4'),
(8, 'craft', 'm150519_150900_fieldversion_conversion', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '04cd5251-1c81-4834-a185-3ea5d39ee2a0'),
(9, 'craft', 'm150617_213829_update_email_settings', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'b1d0e204-2fa1-466a-808a-28c0d177d209'),
(10, 'craft', 'm150721_124739_templatecachequeries', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '5ad62e12-3ac1-4ffd-9af6-8e4988c02307'),
(11, 'craft', 'm150724_140822_adjust_quality_settings', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '08c5a2c6-fbe7-4448-9433-cc921dfb464e'),
(12, 'craft', 'm150815_133521_last_login_attempt_ip', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '20201477-abd4-4cfa-8b6a-f04fd3621ca3'),
(13, 'craft', 'm151002_095935_volume_cache_settings', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'b2075be4-eace-466e-b808-f5613cbb03f6'),
(14, 'craft', 'm151005_142750_volume_s3_storage_settings', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'cf54a02f-7394-4644-a85f-e9453cb2ad3d'),
(15, 'craft', 'm151016_133600_delete_asset_thumbnails', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'ae02ec46-73e2-4135-a797-bcebd0e086a5'),
(16, 'craft', 'm151209_000000_move_logo', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '6141595d-2bbd-4e97-afdb-4898daef617a'),
(17, 'craft', 'm151211_000000_rename_fileId_to_assetId', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'd8e0cf07-c86e-4e98-aa6a-b5c081409af5'),
(18, 'craft', 'm151215_000000_rename_asset_permissions', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '8e03f17f-5829-439c-99da-4264b00266bc'),
(19, 'craft', 'm160707_000001_rename_richtext_assetsource_setting', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'f65c5e94-38bf-453f-97d8-f8e30d60c130'),
(20, 'craft', 'm160708_185142_volume_hasUrls_setting', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'd9779411-cda2-4109-9a33-aeb3555c521e'),
(21, 'craft', 'm160714_000000_increase_max_asset_filesize', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '62e2dd71-3c68-422f-880e-2686ced158d8'),
(22, 'craft', 'm160727_194637_column_cleanup', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '9e70ba99-b2ee-44a2-86a1-76d458d9ba11'),
(23, 'craft', 'm160804_110002_userphotos_to_assets', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'fddee924-717e-4c84-a809-3b2b950df792'),
(24, 'craft', 'm160807_144858_sites', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '007b4f5f-4789-40aa-87f7-633d57493812'),
(25, 'craft', 'm160829_000000_pending_user_content_cleanup', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'b5af2cc1-90d9-4cdd-9a12-c2650b94a996'),
(26, 'craft', 'm160830_000000_asset_index_uri_increase', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '82055b7b-f686-46ca-84c9-4f0a44263bcf'),
(27, 'craft', 'm160912_230520_require_entry_type_id', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '93192b7c-108a-4849-a3ab-9863e223bec0'),
(28, 'craft', 'm160913_134730_require_matrix_block_type_id', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'bd98b3c6-2149-4380-bb9f-ff83fbffce51'),
(29, 'craft', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '99a74244-0064-43c5-8073-d69b7402a67f'),
(30, 'craft', 'm160920_231045_usergroup_handle_title_unique', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'edb0a7ba-b5c3-45bb-9b52-b716ae58857f'),
(31, 'craft', 'm160925_113941_route_uri_parts', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '6458697d-a1fe-40dc-bb02-38f1f26b6c32'),
(32, 'craft', 'm161006_205918_schemaVersion_not_null', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '82da631f-9c79-46ea-a539-90d4a89bc2a0'),
(33, 'craft', 'm161007_130653_update_email_settings', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '36440f0d-3319-4e4b-a5bc-89b223c55ad6'),
(34, 'craft', 'm161013_175052_newParentId', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '1f838639-8ba0-4440-b15f-436d230d6152'),
(35, 'craft', 'm161021_102916_fix_recent_entries_widgets', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '606bca52-8dc4-4602-8a33-1479fea56069'),
(36, 'craft', 'm161021_182140_rename_get_help_widget', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'a1ca3e1c-9986-4491-a299-6bd7e94c6802'),
(37, 'craft', 'm161025_000000_fix_char_columns', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '659d812b-e778-4c67-b81f-200373806024'),
(38, 'craft', 'm161029_124145_email_message_languages', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '95acd0a6-c83f-44af-b4aa-45efb1c5f6cc'),
(39, 'craft', 'm161108_000000_new_version_format', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'eea49328-0673-4216-b39c-cd5ee16b2ada'),
(40, 'craft', 'm161109_000000_index_shuffle', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '858bd208-eea1-44ed-9170-a79e517d8758'),
(41, 'craft', 'm161122_185500_no_craft_app', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '8f600334-0f5a-4d15-b8de-1ba7a959985f'),
(42, 'craft', 'm161125_150752_clear_urlmanager_cache', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'd07c0359-51fa-4573-8cd9-34a48dad5174'),
(43, 'craft', 'm161220_000000_volumes_hasurl_notnull', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '724adc64-0851-4c3b-9040-eda1c2c1500c'),
(44, 'craft', 'm170114_161144_udates_permission', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '075424d6-bf00-4fef-b291-d7d5420d8836'),
(45, 'craft', 'm170120_000000_schema_cleanup', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'f38d5445-a82c-4ffa-93bd-af46e610f07c'),
(46, 'craft', 'm170126_000000_assets_focal_point', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'a761fda7-2fab-461c-951a-6c0849baa28b'),
(47, 'craft', 'm170206_142126_system_name', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '80bbab84-f053-47db-a80c-9dc400ee266f'),
(48, 'craft', 'm170217_044740_category_branch_limits', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'ced7eff2-701c-4a9d-9b66-634f10a2d9b5'),
(49, 'craft', 'm170217_120224_asset_indexing_columns', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'd93caa7c-98dc-404c-ab4d-0238e518f6d0'),
(50, 'craft', 'm170223_224012_plain_text_settings', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'f9217139-6809-4e0d-98c1-70c0941c0376'),
(51, 'craft', 'm170227_120814_focal_point_percentage', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '34df1880-a2b8-4b30-b4c1-cf88880de324'),
(52, 'craft', 'm170228_171113_system_messages', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'e3c63f82-24b5-4a2b-9273-5649ea091c12'),
(53, 'craft', 'm170303_140500_asset_field_source_settings', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '94adae96-7021-44ff-9278-dc7d4b87e4fc'),
(54, 'craft', 'm170306_150500_asset_temporary_uploads', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'cddb79a0-5bf2-42b8-84ac-f2093c43f010'),
(55, 'craft', 'm170523_190652_element_field_layout_ids', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '1da0b3d7-eb1b-41c7-b925-714bf882109b'),
(56, 'craft', 'm170621_195237_format_plugin_handles', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'f6c82698-f079-4e0f-b0e5-0d68a539126a'),
(57, 'craft', 'm170630_161027_deprecation_line_nullable', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '881680bb-2dcc-4fd0-af22-c79d8230ad70'),
(58, 'craft', 'm170630_161028_deprecation_changes', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'c11b7977-d49b-4af4-b680-f3007c1e9af0'),
(59, 'craft', 'm170703_181539_plugins_table_tweaks', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '5ef6e0cf-9725-465a-9039-ac20c834e3ee'),
(60, 'craft', 'm170704_134916_sites_tables', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '0f45ba5e-6171-4714-9638-5b83959f6928'),
(61, 'craft', 'm170706_183216_rename_sequences', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'd9a568bb-3f68-4779-93f2-8184d3b98714'),
(62, 'craft', 'm170707_094758_delete_compiled_traits', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'bff4ee7f-9bba-4f7d-a6be-b39a6f63f911'),
(63, 'craft', 'm170731_190138_drop_asset_packagist', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '1d609e20-ecf2-467a-b754-73f06f29a870'),
(64, 'craft', 'm170810_201318_create_queue_table', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '1f49e362-6d43-4590-aa05-94c7c632f680'),
(65, 'craft', 'm170903_192801_longblob_for_queue_jobs', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'c8e1c30e-4e3c-44b5-8462-1e45dd1a1864'),
(66, 'craft', 'm170914_204621_asset_cache_shuffle', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'ea98f4cb-6cda-4cd9-9597-63f51b485252'),
(67, 'craft', 'm171011_214115_site_groups', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'ad0eee69-8cff-4ec5-8226-a8bfe956173c'),
(68, 'craft', 'm171012_151440_primary_site', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'ae9492c4-3573-4ae8-9ba2-1de538e53853'),
(69, 'craft', 'm171013_142500_transform_interlace', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '7a18baa9-138c-44ec-88da-82047627252a'),
(70, 'craft', 'm171016_092553_drop_position_select', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '962f5ccc-2bee-4292-9ca8-4881a654690a'),
(71, 'craft', 'm171016_221244_less_strict_translation_method', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '755100d3-4035-4959-a9b5-495ce1769229'),
(72, 'craft', 'm171107_000000_assign_group_permissions', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '95f7172d-5f51-4cc0-b5f7-630031fcc7c4'),
(73, 'craft', 'm171117_000001_templatecache_index_tune', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '96428eee-a35c-463b-af67-a9827085849f'),
(74, 'craft', 'm171126_105927_disabled_plugins', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '16455baf-2d46-4b9e-b212-8bf7c04f2e5c'),
(75, 'craft', 'm171130_214407_craftidtokens_table', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'b467aeab-1f33-4a79-90b8-59d03d7f9580'),
(76, 'craft', 'm171202_004225_update_email_settings', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'a3b32d81-4dfe-4112-858f-3daf1712f38a'),
(77, 'craft', 'm171204_000001_templatecache_index_tune_deux', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'a26dcb41-8ca9-4b5e-91c1-a8f673e9b31c'),
(78, 'craft', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'b43926ae-bec9-4d70-bda5-22eeac79d3d1'),
(79, 'craft', 'm171218_143135_longtext_query_column', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'd758108e-b981-4837-9f9d-69b8ad71b051'),
(80, 'craft', 'm171231_055546_environment_variables_to_aliases', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '5cc4476e-2853-4f1e-8f7b-7de573c56901'),
(81, 'craft', 'm180113_153740_drop_users_archived_column', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2e6e1c92-a48e-49fb-bde7-71de19fa5fc0'),
(82, 'craft', 'm180122_213433_propagate_entries_setting', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '82fdfb13-74a5-451d-97d4-0bd5499ceb40'),
(83, 'craft', 'm180124_230459_fix_propagate_entries_values', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'd892d837-72a5-4583-932b-9d6020caf8b5'),
(84, 'craft', 'm180128_235202_set_tag_slugs', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '3b2ed88d-fd15-401d-8404-d8fd2a89cbc0'),
(85, 'craft', 'm180202_185551_fix_focal_points', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '795d7964-8bd8-4d9d-b6f2-cb9c87be3311'),
(86, 'craft', 'm180217_172123_tiny_ints', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'b8067307-6e6e-4903-a51b-eda58f6ea1da'),
(87, 'craft', 'm180321_233505_small_ints', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'f1fe2464-3f0c-4d3d-8822-b7bff7a20254'),
(88, 'craft', 'm180404_182320_edition_changes', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'fc8e6a25-3121-41f8-9b10-a6919f20f9d9'),
(89, 'craft', 'm180411_102218_fix_db_routes', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '3ab01338-914c-4373-a9db-becb9d39b125'),
(90, 'craft', 'm180416_205628_resourcepaths_table', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '8299e410-0add-4b64-8bd8-d16f948da1ad'),
(91, 'craft', 'm180418_205713_widget_cleanup', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'd67457a3-66f9-49b7-bede-c2dadbd9c5d5'),
(92, 'craft', 'm180425_203349_searchable_fields', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'e435b9d4-4a49-4a80-abcd-028ea9579bc4'),
(93, 'craft', 'm180516_153000_uids_in_field_settings', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '481aed2d-473d-439f-becc-ff1e8d565208'),
(94, 'craft', 'm180517_173000_user_photo_volume_to_uid', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '1c99eb86-a252-474e-9046-28a665024468'),
(95, 'craft', 'm180518_173000_permissions_to_uid', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'ea9bac49-52aa-44bc-8bd2-d345803bd973'),
(96, 'craft', 'm180520_173000_matrix_context_to_uids', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '49e51dc3-5ab6-413b-991f-dba9af9e6e6e'),
(97, 'craft', 'm180521_172900_project_config_table', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'e5db0a84-0bc5-445e-bd82-57bf023df568'),
(98, 'craft', 'm180521_173000_initial_yml_and_snapshot', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '1c6d2034-8917-4e80-b151-27af75761d71'),
(99, 'craft', 'm180731_162030_soft_delete_sites', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '4026acf7-56a2-43de-b48a-86322f0398b8'),
(100, 'craft', 'm180810_214427_soft_delete_field_layouts', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '6acef4ed-12d9-46cb-89ad-b23f735c5c23'),
(101, 'craft', 'm180810_214439_soft_delete_elements', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '23521a6b-56d4-45cd-9f4b-2b349f35878e'),
(102, 'craft', 'm180824_193422_case_sensitivity_fixes', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'ce3d7623-c254-4c26-9e9d-21f28db6ad4c'),
(103, 'craft', 'm180901_151639_fix_matrixcontent_tables', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '4e81d056-7d99-40ad-a5cb-371b830404c4'),
(104, 'craft', 'm180904_112109_permission_changes', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '538be301-8617-48ce-8135-9a1e86247d3f'),
(105, 'craft', 'm180910_142030_soft_delete_sitegroups', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '00ac2458-9782-4001-aa4a-9fca4c4e66ee'),
(106, 'craft', 'm181011_160000_soft_delete_asset_support', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '5147e7d3-95b1-45d1-9c43-f5b7140f658f'),
(107, 'craft', 'm181016_183648_set_default_user_settings', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'fdee11df-9fea-44ef-9d5e-56e2efb1975f'),
(108, 'craft', 'm181017_225222_system_config_settings', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '97020d4e-8eac-487d-9333-391e1886735e'),
(109, 'craft', 'm181018_222343_drop_userpermissions_from_config', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'eff280aa-e2da-42ff-b2f6-17208ab63e88'),
(110, 'craft', 'm181029_130000_add_transforms_routes_to_config', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '850fb717-e68f-46a5-8cc5-8a8c31602e71'),
(111, 'craft', 'm181112_203955_sequences_table', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'cc335be9-c2d2-45a0-95ee-2b15ccfaa698'),
(112, 'craft', 'm181121_001712_cleanup_field_configs', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', 'e3cafffa-a972-4287-ad5f-d9d049ab5060'),
(113, 'craft', 'm181128_193942_fix_project_config', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '7fbfd86f-eb21-4e7e-a6db-c096f2936bb3'),
(114, 'craft', 'm181130_143040_fix_schema_version', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '337aba21-ad62-4ad6-b466-96b88a90aa9a'),
(115, 'craft', 'm181211_143040_fix_entry_type_uids', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '2022-03-16 10:17:15', '14f04034-4293-46e9-979c-3bc9767b79a0'),
(116, 'craft', 'm181217_153000_fix_structure_uids', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2c628d39-0072-4d23-a136-c6b5f772464d'),
(117, 'craft', 'm190104_152725_store_licensed_plugin_editions', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '061d5714-aae9-4478-b85b-6fb2a66334b8'),
(118, 'craft', 'm190108_110000_cleanup_project_config', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '17c5e001-54c2-4f69-8e87-da9aab88dfcb'),
(119, 'craft', 'm190108_113000_asset_field_setting_change', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2f84dece-6024-41a9-856f-65e3220aaac7'),
(120, 'craft', 'm190109_172845_fix_colspan', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'e8994efd-8c79-48a9-b814-d82e82a5577c'),
(121, 'craft', 'm190110_150000_prune_nonexisting_sites', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'cabdbdc7-6bbd-482b-bf1b-4d7f0bfc21e6'),
(122, 'craft', 'm190110_214819_soft_delete_volumes', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '746b762d-e928-4286-9c13-7748828c0785'),
(123, 'craft', 'm190112_124737_fix_user_settings', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '63b09241-676c-4f15-9e0f-d3a55c4c8b8e'),
(124, 'craft', 'm190112_131225_fix_field_layouts', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '5f529e66-d973-4852-88ef-f6776d15675a'),
(125, 'craft', 'm190112_201010_more_soft_deletes', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '933e56e0-7a20-492d-8861-511291c6b613'),
(126, 'craft', 'm190114_143000_more_asset_field_setting_changes', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '42f83854-6a98-4cfd-9f36-e017c7ea41af'),
(127, 'craft', 'm190121_120000_rich_text_config_setting', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'c0d84f53-59bf-4743-ab5c-7d61b2cb33dc'),
(128, 'craft', 'm190125_191628_fix_email_transport_password', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'ad542965-cb2b-4308-9adf-410f8ececfae'),
(129, 'craft', 'm190128_181422_cleanup_volume_folders', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '0350aed2-cbb7-4e53-a2c7-6c669c5be534'),
(130, 'craft', 'm190205_140000_fix_asset_soft_delete_index', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '13b03cc3-05e2-49d6-bec3-754bdb94a411'),
(131, 'craft', 'm190218_143000_element_index_settings_uid', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '9d9ace2c-1c9e-441b-a81e-b2de1791b75e'),
(132, 'craft', 'm190312_152740_element_revisions', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '8261fee9-ce1a-4f4c-96c6-800fc84c5573'),
(133, 'craft', 'm190327_235137_propagation_method', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '0efb58d5-e280-4b56-a2e3-5e742f86b05c'),
(134, 'craft', 'm190401_223843_drop_old_indexes', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '01f17c89-48aa-4326-809c-5b40c10c5958'),
(135, 'craft', 'm190416_014525_drop_unique_global_indexes', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '3e577feb-85ad-4564-85a5-7c3d0a13b675'),
(136, 'craft', 'm190417_085010_add_image_editor_permissions', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '1bfbc61e-0925-4696-b399-6984db82f195'),
(137, 'craft', 'm190502_122019_store_default_user_group_uid', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'a0d75c99-bcba-48d9-92db-9fdecb945ec3'),
(138, 'craft', 'm190504_150349_preview_targets', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'a8a7b2df-d5e2-46ec-81d8-a85756da5431'),
(139, 'craft', 'm190516_184711_job_progress_label', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '512db468-d3c0-4297-bf2c-46642482847b'),
(140, 'craft', 'm190523_190303_optional_revision_creators', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'f9f4573e-52b0-439a-ad48-143769a8f4dd'),
(141, 'craft', 'm190529_204501_fix_duplicate_uids', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '94862c84-5733-485b-8e05-b204f1fd7609'),
(142, 'craft', 'm190605_223807_unsaved_drafts', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2be07111-235e-45ec-b2b9-01a7a64ca6fe'),
(143, 'craft', 'm190607_230042_entry_revision_error_tables', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'e3ab4c2d-da4d-4650-88ce-b2270dc48028'),
(144, 'craft', 'm190608_033429_drop_elements_uid_idx', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'b76453f8-7562-4831-bb90-1f1af362a0d3'),
(145, 'craft', 'm190617_164400_add_gqlschemas_table', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'ce18a8fe-db3d-4779-9c95-a283fe47e215'),
(146, 'craft', 'm190624_234204_matrix_propagation_method', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '3e87f78d-8c6a-4307-8add-f4cd7c5adb8e'),
(147, 'craft', 'm190711_153020_drop_snapshots', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '0f5ca1c0-c841-4706-b272-f96824c2ca01'),
(148, 'craft', 'm190712_195914_no_draft_revisions', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'ade15e1f-e31e-4181-839d-7d6d7a7fb32a'),
(149, 'craft', 'm190723_140314_fix_preview_targets_column', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'be9a4124-01be-4415-83d3-cd352b5ade0e'),
(150, 'craft', 'm190820_003519_flush_compiled_templates', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'eca08fe1-dd27-4a06-9aa9-1baf68866ee0'),
(151, 'craft', 'm190823_020339_optional_draft_creators', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '73ba9211-0457-4c35-a155-0f251d27cd67'),
(152, 'craft', 'm190913_152146_update_preview_targets', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '02ba9494-7399-4e82-869d-8aecf4d82c0e'),
(153, 'craft', 'm191107_122000_add_gql_project_config_support', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'c8678fd6-a0f3-4cd3-92a5-8947c9e8d039'),
(154, 'craft', 'm191204_085100_pack_savable_component_settings', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '31691550-2e59-40c9-a6e6-ed48e099404b'),
(155, 'craft', 'm191206_001148_change_tracking', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '92057d04-1edc-4e63-aed9-a9459304b4e4'),
(156, 'craft', 'm191216_191635_asset_upload_tracking', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '8c49504f-f57e-44d7-8a38-ffd763c461cb'),
(157, 'craft', 'm191222_002848_peer_asset_permissions', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '74f2b6cd-cb8a-435f-bc31-4c5cee02b819'),
(158, 'craft', 'm200127_172522_queue_channels', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '6f9d1c85-bb8d-4bd8-9bb8-2ee4e3c9fbcb'),
(159, 'craft', 'm200211_175048_truncate_element_query_cache', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '1f7492c5-3ea7-4beb-96c8-8f97e8432b91'),
(160, 'craft', 'm200213_172522_new_elements_index', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '7799ba45-9a9c-485b-b257-6c023fe0e198'),
(161, 'craft', 'm200228_195211_long_deprecation_messages', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '9893fa0b-a312-42e3-9d99-13af46e7702d'),
(162, 'craft', 'm200306_054652_disabled_sites', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '8ed8212a-fae7-4a66-ba2d-3ae9b3f5fff7'),
(163, 'craft', 'm200522_191453_clear_template_caches', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'ea94b564-a9ef-4e0b-a000-981725c86313'),
(164, 'craft', 'm200606_231117_migration_tracks', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'a4a5e38e-06a4-4c97-8419-b2163a8ff3a0'),
(165, 'craft', 'm200619_215137_title_translation_method', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '34240dfa-a6b0-4277-9d99-69a5bd9fa44c'),
(166, 'craft', 'm200620_005028_user_group_descriptions', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2c2c5ef9-1638-4acd-b69c-91f80950f7d3'),
(167, 'craft', 'm200620_230205_field_layout_changes', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '6736f780-b04f-4d19-9912-8a65960243e5'),
(168, 'craft', 'm200625_131100_move_entrytypes_to_top_project_config', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'ab6b2b55-7832-4d82-8c38-2959960aa36b'),
(169, 'craft', 'm200629_112700_remove_project_config_legacy_files', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'ecf006ed-d480-4e9a-ad22-2e9a298844e7'),
(170, 'craft', 'm200630_183000_drop_configmap', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'eeeb6e1e-9111-4b6e-a6d4-4dcbf190f73c'),
(171, 'craft', 'm200715_113400_transform_index_error_flag', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'dd56a23b-f51f-49b5-b0ab-7ba10dea6e32'),
(172, 'craft', 'm200716_110900_replace_file_asset_permissions', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2d7eb247-d973-48c3-a70e-b360165b9243'),
(173, 'craft', 'm200716_153800_public_token_settings_in_project_config', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '6b46c617-b587-4f89-97da-4fbd1d739027'),
(174, 'craft', 'm200720_175543_drop_unique_constraints', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '0d37b4c9-b120-458c-bfb5-a1b65888dc6d'),
(175, 'craft', 'm200825_051217_project_config_version', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '0a936f30-a5d8-425f-bc51-c893e3e72349'),
(176, 'craft', 'm201116_190500_asset_title_translation_method', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'd53589ff-dcd7-4ded-9a89-9ab379202fda'),
(177, 'craft', 'm201124_003555_plugin_trials', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'ec185d68-ce3d-4982-9a9c-bb5e5ad20172'),
(178, 'craft', 'm210209_135503_soft_delete_field_groups', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'f1da13b2-115c-430a-9942-37c14c93257a'),
(179, 'craft', 'm210212_223539_delete_invalid_drafts', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '7d94325c-209a-4c0c-9bec-70af5b1d1b8b'),
(180, 'craft', 'm210214_202731_track_saved_drafts', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '4dbd585a-2598-4b21-b865-6e0098e3cd1d'),
(181, 'craft', 'm210223_150900_add_new_element_gql_schema_components', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '13f9f074-1c78-4dfc-b4be-9299edef41b0'),
(182, 'craft', 'm210302_212318_canonical_elements', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '77452024-7934-4d43-80a0-f32d057ae7b6'),
(183, 'craft', 'm210326_132000_invalidate_projectconfig_cache', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '4a815c44-6255-46a2-b63b-8e05bc4f6e69'),
(184, 'craft', 'm210329_214847_field_column_suffixes', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '42c6cc71-7c31-4f0d-afcd-e7c14e948741'),
(185, 'craft', 'm210331_220322_null_author', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '98cb07cc-ff98-4c02-95e8-bc196a3bf810'),
(186, 'craft', 'm210405_231315_provisional_drafts', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '9322f66d-5b5f-423a-b366-d2aba31aa9fd'),
(187, 'craft', 'm210602_111300_project_config_names_in_config', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'c06fc910-e5cf-4d7b-b4db-a8b1ea6ef7e3'),
(188, 'craft', 'm210611_233510_default_placement_settings', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'fbe438a6-a112-4d96-9278-3524da0ca1b1'),
(189, 'craft', 'm210613_145522_sortable_global_sets', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', 'ae29b315-f821-4360-8e9c-c4a8fe3b1b4c'),
(190, 'craft', 'm210613_184103_announcements', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '94b9c2b1-4de9-439e-8488-ff762b559370'),
(191, 'craft', 'm210829_000000_element_index_tweak', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '3b495f92-e0eb-48ca-a1c1-3f0e31ea71ea'),
(192, 'craft', 'm220209_095604_add_indexes', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '66ac739a-1807-4bad-995d-26f0a617cf09'),
(193, 'craft', 'm220214_000000_truncate_sessions', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '2022-03-16 10:17:16', '25da82ff-8017-4c79-8b14-72154ab9e1c6');

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'contact-form', '2.3.0', '1.0.0', 'unknown', NULL, '2022-03-16 22:56:16', '2022-03-16 22:56:16', '2022-03-17 00:34:28', 'c328ad3d-60f8-46e5-a907-6dc1a45a8ee0');

-- --------------------------------------------------------

--
-- Table structure for table `projectconfig`
--

CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projectconfig`
--

INSERT INTO `projectconfig` (`path`, `value`) VALUES
('dateModified', '1647514111'),
('email.fromEmail', '\"33kcaj33@gmail.com\"'),
('email.fromName', '\"Social Craft\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.fieldLayouts.c037955e-87ef-4af1-bc6f-c93c715c8708.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.fieldLayouts.c037955e-87ef-4af1-bc6f-c93c715c8708.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.fieldLayouts.c037955e-87ef-4af1-bc6f-c93c715c8708.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.fieldLayouts.c037955e-87ef-4af1-bc6f-c93c715c8708.tabs.0.elements.0.class', 'null'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.fieldLayouts.c037955e-87ef-4af1-bc6f-c93c715c8708.tabs.0.elements.0.disabled', 'false'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.fieldLayouts.c037955e-87ef-4af1-bc6f-c93c715c8708.tabs.0.elements.0.id', 'null'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.fieldLayouts.c037955e-87ef-4af1-bc6f-c93c715c8708.tabs.0.elements.0.instructions', 'null'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.fieldLayouts.c037955e-87ef-4af1-bc6f-c93c715c8708.tabs.0.elements.0.label', 'null'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.fieldLayouts.c037955e-87ef-4af1-bc6f-c93c715c8708.tabs.0.elements.0.max', 'null'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.fieldLayouts.c037955e-87ef-4af1-bc6f-c93c715c8708.tabs.0.elements.0.min', 'null'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.fieldLayouts.c037955e-87ef-4af1-bc6f-c93c715c8708.tabs.0.elements.0.name', 'null'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.fieldLayouts.c037955e-87ef-4af1-bc6f-c93c715c8708.tabs.0.elements.0.orientation', 'null'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.fieldLayouts.c037955e-87ef-4af1-bc6f-c93c715c8708.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.fieldLayouts.c037955e-87ef-4af1-bc6f-c93c715c8708.tabs.0.elements.0.readonly', 'false'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.fieldLayouts.c037955e-87ef-4af1-bc6f-c93c715c8708.tabs.0.elements.0.requirable', 'false'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.fieldLayouts.c037955e-87ef-4af1-bc6f-c93c715c8708.tabs.0.elements.0.size', 'null'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.fieldLayouts.c037955e-87ef-4af1-bc6f-c93c715c8708.tabs.0.elements.0.step', 'null'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.fieldLayouts.c037955e-87ef-4af1-bc6f-c93c715c8708.tabs.0.elements.0.tip', 'null'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.fieldLayouts.c037955e-87ef-4af1-bc6f-c93c715c8708.tabs.0.elements.0.title', 'null'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.fieldLayouts.c037955e-87ef-4af1-bc6f-c93c715c8708.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.fieldLayouts.c037955e-87ef-4af1-bc6f-c93c715c8708.tabs.0.elements.0.warning', 'null'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.fieldLayouts.c037955e-87ef-4af1-bc6f-c93c715c8708.tabs.0.elements.0.width', '100'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.fieldLayouts.c037955e-87ef-4af1-bc6f-c93c715c8708.tabs.0.name', '\"Content\"'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.fieldLayouts.c037955e-87ef-4af1-bc6f-c93c715c8708.tabs.0.sortOrder', '1'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.handle', '\"dashboard\"'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.hasTitleField', 'false'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.name', '\"Dashboard\"'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.section', '\"3a986760-821f-487f-ab8e-3c383434d6b1\"'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.sortOrder', '1'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.titleTranslationKeyFormat', 'null'),
('entryTypes.b884c716-81f2-4112-b8ab-91d5692c3915.titleTranslationMethod', '\"site\"'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.0.class', 'null'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.0.disabled', 'false'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.0.id', 'null'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.0.instructions', 'null'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.0.label', 'null'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.0.max', 'null'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.0.min', 'null'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.0.name', 'null'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.0.orientation', 'null'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.0.readonly', 'false'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.0.requirable', 'false'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.0.size', 'null'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.0.step', 'null'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.0.tip', 'null'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.0.title', 'null'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.0.warning', 'null'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.0.width', '100'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.1.fieldUid', '\"119de8cb-6928-434e-ba7b-ab558fd9b8a4\"'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.1.instructions', '\"\"'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.1.label', '\"\"'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.1.required', '\"1\"'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.1.tip', 'null'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.1.warning', 'null'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.elements.1.width', '100'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.name', '\"Content\"'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.fieldLayouts.6783cbf8-990d-4f74-a640-a42beae5cdf1.tabs.0.sortOrder', '1'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.handle', '\"defaultPost\"'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.hasTitleField', 'true'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.name', '\"Default Post\"'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.section', '\"8892c507-d287-4436-b0a3-3f7de93da202\"'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.sortOrder', '1'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.titleFormat', 'null'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.titleTranslationKeyFormat', 'null'),
('entryTypes.c6002c38-1570-4d87-b1fd-4fbf360d57ed.titleTranslationMethod', '\"site\"'),
('fieldGroups.0f297017-0c66-4a81-a4e1-0b7569f0ac6d.name', '\"Posts\"'),
('fieldGroups.160c61c7-a506-4e3b-92ec-7e9118b9e500.name', '\"Users\"'),
('fieldGroups.9dc40071-80f8-4662-8639-93d2a4afe247.name', '\"Common\"'),
('fields.119de8cb-6928-434e-ba7b-ab558fd9b8a4.columnSuffix', '\"jqxtkcjq\"'),
('fields.119de8cb-6928-434e-ba7b-ab558fd9b8a4.contentColumnType', '\"text\"'),
('fields.119de8cb-6928-434e-ba7b-ab558fd9b8a4.fieldGroup', '\"0f297017-0c66-4a81-a4e1-0b7569f0ac6d\"'),
('fields.119de8cb-6928-434e-ba7b-ab558fd9b8a4.handle', '\"text\"'),
('fields.119de8cb-6928-434e-ba7b-ab558fd9b8a4.instructions', '\"Text content for posts.\"'),
('fields.119de8cb-6928-434e-ba7b-ab558fd9b8a4.name', '\"Text\"'),
('fields.119de8cb-6928-434e-ba7b-ab558fd9b8a4.searchable', 'false'),
('fields.119de8cb-6928-434e-ba7b-ab558fd9b8a4.settings.byteLimit', 'null'),
('fields.119de8cb-6928-434e-ba7b-ab558fd9b8a4.settings.charLimit', 'null'),
('fields.119de8cb-6928-434e-ba7b-ab558fd9b8a4.settings.code', '\"\"'),
('fields.119de8cb-6928-434e-ba7b-ab558fd9b8a4.settings.columnType', 'null'),
('fields.119de8cb-6928-434e-ba7b-ab558fd9b8a4.settings.initialRows', '\"4\"'),
('fields.119de8cb-6928-434e-ba7b-ab558fd9b8a4.settings.multiline', '\"\"'),
('fields.119de8cb-6928-434e-ba7b-ab558fd9b8a4.settings.placeholder', 'null'),
('fields.119de8cb-6928-434e-ba7b-ab558fd9b8a4.settings.uiMode', '\"normal\"'),
('fields.119de8cb-6928-434e-ba7b-ab558fd9b8a4.translationKeyFormat', 'null'),
('fields.119de8cb-6928-434e-ba7b-ab558fd9b8a4.translationMethod', '\"none\"'),
('fields.119de8cb-6928-434e-ba7b-ab558fd9b8a4.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.74d5d2ed-3518-4635-ab8e-d008e3d1269a.columnSuffix', '\"irwlbseb\"'),
('fields.74d5d2ed-3518-4635-ab8e-d008e3d1269a.contentColumnType', '\"text\"'),
('fields.74d5d2ed-3518-4635-ab8e-d008e3d1269a.fieldGroup', '\"160c61c7-a506-4e3b-92ec-7e9118b9e500\"'),
('fields.74d5d2ed-3518-4635-ab8e-d008e3d1269a.handle', '\"lastName\"'),
('fields.74d5d2ed-3518-4635-ab8e-d008e3d1269a.instructions', '\"\"'),
('fields.74d5d2ed-3518-4635-ab8e-d008e3d1269a.name', '\"Last Name\"'),
('fields.74d5d2ed-3518-4635-ab8e-d008e3d1269a.searchable', 'false'),
('fields.74d5d2ed-3518-4635-ab8e-d008e3d1269a.settings.byteLimit', 'null'),
('fields.74d5d2ed-3518-4635-ab8e-d008e3d1269a.settings.charLimit', 'null'),
('fields.74d5d2ed-3518-4635-ab8e-d008e3d1269a.settings.code', '\"\"'),
('fields.74d5d2ed-3518-4635-ab8e-d008e3d1269a.settings.columnType', 'null'),
('fields.74d5d2ed-3518-4635-ab8e-d008e3d1269a.settings.initialRows', '\"4\"'),
('fields.74d5d2ed-3518-4635-ab8e-d008e3d1269a.settings.multiline', '\"\"'),
('fields.74d5d2ed-3518-4635-ab8e-d008e3d1269a.settings.placeholder', 'null'),
('fields.74d5d2ed-3518-4635-ab8e-d008e3d1269a.settings.uiMode', '\"normal\"'),
('fields.74d5d2ed-3518-4635-ab8e-d008e3d1269a.translationKeyFormat', 'null'),
('fields.74d5d2ed-3518-4635-ab8e-d008e3d1269a.translationMethod', '\"none\"'),
('fields.74d5d2ed-3518-4635-ab8e-d008e3d1269a.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.939c7076-db0b-4f15-a10d-647d91b2d4e6.columnSuffix', '\"lokptvdw\"'),
('fields.939c7076-db0b-4f15-a10d-647d91b2d4e6.contentColumnType', '\"text\"'),
('fields.939c7076-db0b-4f15-a10d-647d91b2d4e6.fieldGroup', '\"160c61c7-a506-4e3b-92ec-7e9118b9e500\"'),
('fields.939c7076-db0b-4f15-a10d-647d91b2d4e6.handle', '\"firstName\"'),
('fields.939c7076-db0b-4f15-a10d-647d91b2d4e6.instructions', '\"\"'),
('fields.939c7076-db0b-4f15-a10d-647d91b2d4e6.name', '\"First Name\"'),
('fields.939c7076-db0b-4f15-a10d-647d91b2d4e6.searchable', 'false'),
('fields.939c7076-db0b-4f15-a10d-647d91b2d4e6.settings.byteLimit', 'null'),
('fields.939c7076-db0b-4f15-a10d-647d91b2d4e6.settings.charLimit', 'null'),
('fields.939c7076-db0b-4f15-a10d-647d91b2d4e6.settings.code', '\"\"'),
('fields.939c7076-db0b-4f15-a10d-647d91b2d4e6.settings.columnType', 'null'),
('fields.939c7076-db0b-4f15-a10d-647d91b2d4e6.settings.initialRows', '\"4\"'),
('fields.939c7076-db0b-4f15-a10d-647d91b2d4e6.settings.multiline', '\"\"'),
('fields.939c7076-db0b-4f15-a10d-647d91b2d4e6.settings.placeholder', 'null'),
('fields.939c7076-db0b-4f15-a10d-647d91b2d4e6.settings.uiMode', '\"normal\"'),
('fields.939c7076-db0b-4f15-a10d-647d91b2d4e6.translationKeyFormat', 'null'),
('fields.939c7076-db0b-4f15-a10d-647d91b2d4e6.translationMethod', '\"none\"'),
('fields.939c7076-db0b-4f15-a10d-647d91b2d4e6.type', '\"craft\\\\fields\\\\PlainText\"'),
('graphql.publicToken.enabled', 'true'),
('graphql.publicToken.expiryDate', 'null'),
('graphql.schemas.a5414745-8262-4c2c-bd5f-5ed1f3708246.isPublic', 'true'),
('graphql.schemas.a5414745-8262-4c2c-bd5f-5ed1f3708246.name', '\"Public Schema\"'),
('meta.__names__.0f297017-0c66-4a81-a4e1-0b7569f0ac6d', '\"Posts\"'),
('meta.__names__.119de8cb-6928-434e-ba7b-ab558fd9b8a4', '\"Text\"'),
('meta.__names__.160c61c7-a506-4e3b-92ec-7e9118b9e500', '\"Users\"'),
('meta.__names__.3a986760-821f-487f-ab8e-3c383434d6b1', '\"Dashboard\"'),
('meta.__names__.74d5d2ed-3518-4635-ab8e-d008e3d1269a', '\"Last Name\"'),
('meta.__names__.8892c507-d287-4436-b0a3-3f7de93da202', '\"Posts\"'),
('meta.__names__.939c7076-db0b-4f15-a10d-647d91b2d4e6', '\"First Name\"'),
('meta.__names__.9dc40071-80f8-4662-8639-93d2a4afe247', '\"Common\"'),
('meta.__names__.a5414745-8262-4c2c-bd5f-5ed1f3708246', '\"Public Schema\"'),
('meta.__names__.b038d5dd-7094-4c93-95d6-87ab4372575d', '\"Social Craft\"'),
('meta.__names__.b884c716-81f2-4112-b8ab-91d5692c3915', '\"Dashboard\"'),
('meta.__names__.c6002c38-1570-4d87-b1fd-4fbf360d57ed', '\"Default Post\"'),
('meta.__names__.daf93206-09b9-4fec-838b-ae157efb0b15', '\"Social Craft\"'),
('meta.__names__.f536098f-41cc-43fe-bc2b-714fb19d2122', '\"Front End Users\"'),
('plugins.contact-form.edition', '\"standard\"'),
('plugins.contact-form.enabled', 'true'),
('plugins.contact-form.schemaVersion', '\"1.0.0\"'),
('sections.3a986760-821f-487f-ab8e-3c383434d6b1.defaultPlacement', '\"end\"'),
('sections.3a986760-821f-487f-ab8e-3c383434d6b1.enableVersioning', 'true'),
('sections.3a986760-821f-487f-ab8e-3c383434d6b1.handle', '\"dashboard\"'),
('sections.3a986760-821f-487f-ab8e-3c383434d6b1.name', '\"Dashboard\"'),
('sections.3a986760-821f-487f-ab8e-3c383434d6b1.previewTargets.0.__assoc__.0.0', '\"label\"'),
('sections.3a986760-821f-487f-ab8e-3c383434d6b1.previewTargets.0.__assoc__.0.1', '\"Primary entry page\"'),
('sections.3a986760-821f-487f-ab8e-3c383434d6b1.previewTargets.0.__assoc__.1.0', '\"urlFormat\"'),
('sections.3a986760-821f-487f-ab8e-3c383434d6b1.previewTargets.0.__assoc__.1.1', '\"{url}\"'),
('sections.3a986760-821f-487f-ab8e-3c383434d6b1.previewTargets.0.__assoc__.2.0', '\"refresh\"'),
('sections.3a986760-821f-487f-ab8e-3c383434d6b1.previewTargets.0.__assoc__.2.1', '\"1\"'),
('sections.3a986760-821f-487f-ab8e-3c383434d6b1.propagationMethod', '\"all\"'),
('sections.3a986760-821f-487f-ab8e-3c383434d6b1.siteSettings.daf93206-09b9-4fec-838b-ae157efb0b15.enabledByDefault', 'true'),
('sections.3a986760-821f-487f-ab8e-3c383434d6b1.siteSettings.daf93206-09b9-4fec-838b-ae157efb0b15.hasUrls', 'true'),
('sections.3a986760-821f-487f-ab8e-3c383434d6b1.siteSettings.daf93206-09b9-4fec-838b-ae157efb0b15.template', '\"/\"'),
('sections.3a986760-821f-487f-ab8e-3c383434d6b1.siteSettings.daf93206-09b9-4fec-838b-ae157efb0b15.uriFormat', '\"dashboard\"'),
('sections.3a986760-821f-487f-ab8e-3c383434d6b1.type', '\"single\"'),
('sections.8892c507-d287-4436-b0a3-3f7de93da202.defaultPlacement', '\"end\"'),
('sections.8892c507-d287-4436-b0a3-3f7de93da202.enableVersioning', 'true'),
('sections.8892c507-d287-4436-b0a3-3f7de93da202.handle', '\"posts\"'),
('sections.8892c507-d287-4436-b0a3-3f7de93da202.name', '\"Posts\"'),
('sections.8892c507-d287-4436-b0a3-3f7de93da202.previewTargets.0.__assoc__.0.0', '\"label\"'),
('sections.8892c507-d287-4436-b0a3-3f7de93da202.previewTargets.0.__assoc__.0.1', '\"Primary entry page\"'),
('sections.8892c507-d287-4436-b0a3-3f7de93da202.previewTargets.0.__assoc__.1.0', '\"urlFormat\"'),
('sections.8892c507-d287-4436-b0a3-3f7de93da202.previewTargets.0.__assoc__.1.1', '\"{url}\"'),
('sections.8892c507-d287-4436-b0a3-3f7de93da202.previewTargets.0.__assoc__.2.0', '\"refresh\"'),
('sections.8892c507-d287-4436-b0a3-3f7de93da202.previewTargets.0.__assoc__.2.1', '\"1\"'),
('sections.8892c507-d287-4436-b0a3-3f7de93da202.propagationMethod', '\"all\"'),
('sections.8892c507-d287-4436-b0a3-3f7de93da202.siteSettings.daf93206-09b9-4fec-838b-ae157efb0b15.enabledByDefault', 'true'),
('sections.8892c507-d287-4436-b0a3-3f7de93da202.siteSettings.daf93206-09b9-4fec-838b-ae157efb0b15.hasUrls', 'true'),
('sections.8892c507-d287-4436-b0a3-3f7de93da202.siteSettings.daf93206-09b9-4fec-838b-ae157efb0b15.template', '\"posts/_entry\"'),
('sections.8892c507-d287-4436-b0a3-3f7de93da202.siteSettings.daf93206-09b9-4fec-838b-ae157efb0b15.uriFormat', '\"posts/{slug}\"'),
('sections.8892c507-d287-4436-b0a3-3f7de93da202.type', '\"channel\"'),
('siteGroups.b038d5dd-7094-4c93-95d6-87ab4372575d.name', '\"Social Craft\"'),
('sites.daf93206-09b9-4fec-838b-ae157efb0b15.baseUrl', '\"$PRIMARY_SITE_URL\"'),
('sites.daf93206-09b9-4fec-838b-ae157efb0b15.handle', '\"default\"'),
('sites.daf93206-09b9-4fec-838b-ae157efb0b15.hasUrls', 'true'),
('sites.daf93206-09b9-4fec-838b-ae157efb0b15.language', '\"en-US\"'),
('sites.daf93206-09b9-4fec-838b-ae157efb0b15.name', '\"Social Craft\"'),
('sites.daf93206-09b9-4fec-838b-ae157efb0b15.primary', 'true'),
('sites.daf93206-09b9-4fec-838b-ae157efb0b15.siteGroup', '\"b038d5dd-7094-4c93-95d6-87ab4372575d\"'),
('sites.daf93206-09b9-4fec-838b-ae157efb0b15.sortOrder', '1'),
('system.edition', '\"pro\"'),
('system.live', 'true'),
('system.name', '\"Social Craft\"'),
('system.schemaVersion', '\"3.7.33\"'),
('system.timeZone', '\"America/Los_Angeles\"'),
('users.allowPublicRegistration', 'true'),
('users.defaultGroup', '\"f536098f-41cc-43fe-bc2b-714fb19d2122\"'),
('users.groups.f536098f-41cc-43fe-bc2b-714fb19d2122.description', '\"\"'),
('users.groups.f536098f-41cc-43fe-bc2b-714fb19d2122.handle', '\"frontEndUsers\"'),
('users.groups.f536098f-41cc-43fe-bc2b-714fb19d2122.name', '\"Front End Users\"'),
('users.groups.f536098f-41cc-43fe-bc2b-714fb19d2122.permissions.0', '\"createentries:8892c507-d287-4436-b0a3-3f7de93da202\"'),
('users.groups.f536098f-41cc-43fe-bc2b-714fb19d2122.permissions.1', '\"publishentries:8892c507-d287-4436-b0a3-3f7de93da202\"'),
('users.groups.f536098f-41cc-43fe-bc2b-714fb19d2122.permissions.2', '\"deleteentries:8892c507-d287-4436-b0a3-3f7de93da202\"'),
('users.groups.f536098f-41cc-43fe-bc2b-714fb19d2122.permissions.3', '\"editentries:8892c507-d287-4436-b0a3-3f7de93da202\"'),
('users.photoSubpath', 'null'),
('users.photoVolumeUid', 'null'),
('users.requireEmailVerification', 'false'),
('users.suspendByDefault', 'false'),
('users.validateOnPublicRegistration', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) UNSIGNED NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `queue`
--

INSERT INTO `queue` (`id`, `channel`, `job`, `description`, `timePushed`, `ttr`, `delay`, `priority`, `dateReserved`, `timeUpdated`, `progress`, `progressLabel`, `attempt`, `fail`, `dateFailed`, `error`) VALUES
(124, 'queue', 0x4f3a33313a2263726166745c71756575655c6a6f62735c5072756e655265766973696f6e73223a373a7b733a31313a22656c656d656e7454797065223b733a32303a2263726166745c656c656d656e74735c456e747279223b733a383a22736f757263654964223b693a38363b733a363a22736974654964223b693a313b733a31323a226d61785265766973696f6e73223b4e3b733a31313a226465736372697074696f6e223b4e3b733a33303a220063726166745c71756575655c426173654a6f62005f70726f6772657373223b693a303b733a33353a220063726166745c71756575655c426173654a6f62005f70726f67726573734c6162656c223b4e3b7d, 'Pruning extra revisions', 1647517885, 300, 0, 2049, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL),
(125, 'queue', 0x4f3a33343a2263726166745c71756575655c6a6f62735c557064617465536561726368496e646578223a373a7b733a31313a22656c656d656e7454797065223b733a32303a2263726166745c656c656d656e74735c456e747279223b733a393a22656c656d656e744964223b693a38363b733a363a22736974654964223b693a313b733a31323a226669656c6448616e646c6573223b613a313a7b693a303b733a343a2274657874223b7d733a31313a226465736372697074696f6e223b4e3b733a33303a220063726166745c71756575655c426173654a6f62005f70726f6772657373223b693a303b733a33353a220063726166745c71756575655c426173654a6f62005f70726f67726573734c6162656c223b4e3b7d, 'Updating search indexes', 1647517885, 300, 0, 2048, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

CREATE TABLE `relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resourcepaths`
--

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('1745f04e', '@craft/web/assets/axios/dist'),
('1f450b6a', '@craft/web/assets/garnish/dist'),
('220fce95', '@craft/web/assets/pluginstore/dist'),
('25b27c09', '@craft/web/assets/userpermissions/dist'),
('273c5ca0', '@craft/web/assets/selectize/dist'),
('27ddaa43', '@craft/web/assets/utilities/dist'),
('298f4d73', '@craft/web/assets/focusvisible/dist'),
('2b74fee8', '@craft/web/assets/cp/dist'),
('310a2779', '@craft/web/assets/updateswidget/dist'),
('3141d8a1', '@craft/web/assets/d3/dist'),
('37f73c7d', '@craft/web/assets/fabric/dist'),
('3a20d116', '@craft/web/assets/iframeresizer/dist'),
('3c490420', '@craft/web/assets/fieldsettings/dist'),
('411e9c2f', '@craft/web/assets/axios/dist'),
('491e670b', '@craft/web/assets/garnish/dist'),
('50284f29', '@craft/web/assets/updater/dist'),
('51bedc21', '@craft/web/assets/fields/dist'),
('589024f4', '@craft/web/assets/admintable/dist'),
('59eb0976', '@craft/web/assets/recententries/dist'),
('61ac501c', '@craft/web/assets/fabric/dist'),
('671ab4c0', '@craft/web/assets/d3/dist'),
('67514b18', '@craft/web/assets/updateswidget/dist'),
('6a126841', '@craft/web/assets/fieldsettings/dist'),
('6c7bbd77', '@craft/web/assets/iframeresizer/dist'),
('7053c95f', '@craft/web/assets/installer/dist'),
('716730c1', '@craft/web/assets/selectize/dist'),
('7186c622', '@craft/web/assets/utilities/dist'),
('73e91068', '@craft/web/assets/userpermissions/dist'),
('7454a2f4', '@craft/web/assets/pluginstore/dist'),
('7d2f9289', '@craft/web/assets/cp/dist'),
('7e5b040', '@craft/web/assets/fields/dist'),
('7fd42112', '@craft/web/assets/focusvisible/dist'),
('86aba69e', '@craft/web/assets/dashboard/dist'),
('90084b08', '@craft/web/assets/timepicker/dist'),
('94c206b4', '@craft/web/assets/xregexp/dist'),
('9521223c', '@craft/web/assets/routes/dist'),
('96a6d170', '@craft/web/assets/craftsupport/dist'),
('9daca5ed', '@craft/web/assets/edituser/dist'),
('9f7abbb4', '@craft/web/assets/picturefill/dist'),
('a321616a', '@craft/web/assets/jquerypayment/dist'),
('a372be08', '@craft/web/assets/jquerytouchevents/dist'),
('a3d4a6c3', '@bower/jquery/dist'),
('a60d649e', '@craft/web/assets/editentry/dist'),
('a634b92b', '@craft/web/assets/elementresizedetector/dist'),
('a6b663dd', '@craft/web/assets/velocity/dist'),
('a93336d5', '@craft/web/assets/jqueryui/dist'),
('b296bb86', '@craft/web/assets/vue/dist'),
('b2ce4bd9', '@craft/web/assets/editsection/dist'),
('b748e07e', '@craft/web/assets/fileupload/dist'),
('b9284862', '@craft/web/assets/deprecationerrors/dist'),
('c0fdbd11', '@craft/web/assets/craftsupport/dist'),
('c2996ad5', '@craft/web/assets/xregexp/dist'),
('c6532769', '@craft/web/assets/timepicker/dist'),
('c8fb0adc', '@craft/web/assets/login/dist'),
('c921d7d5', '@craft/web/assets/picturefill/dist'),
('d0f0caff', '@craft/web/assets/dashboard/dist'),
('e1138c1f', '@craft/web/assets/fileupload/dist'),
('e49527b8', '@craft/web/assets/editsection/dist'),
('e4cdd7e7', '@craft/web/assets/vue/dist'),
('ecb4895', '@craft/web/assets/admintable/dist'),
('ef732403', '@craft/web/assets/deprecationerrors/dist'),
('f05608ff', '@craft/web/assets/editentry/dist'),
('f06fd54a', '@craft/web/assets/elementresizedetector/dist'),
('f0ed0fbc', '@craft/web/assets/velocity/dist'),
('f529d269', '@craft/web/assets/jquerytouchevents/dist'),
('f57a0d0b', '@craft/web/assets/jquerypayment/dist'),
('f58fcaa2', '@bower/jquery/dist'),
('fb06517', '@craft/web/assets/recententries/dist'),
('ff685ab4', '@craft/web/assets/jqueryui/dist'),
('ffe88055', '@craft/web/assets/feed/dist');

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `revisions`
--

INSERT INTO `revisions` (`id`, `sourceId`, `creatorId`, `num`, `notes`) VALUES
(1, 2, 1, 1, ''),
(2, 2, 1, 2, ''),
(3, 5, 1, 1, ''),
(4, 23, 1, 1, ''),
(5, 25, 1, 1, ''),
(6, 27, 1, 1, NULL),
(7, 32, 8, 1, NULL),
(8, 34, 8, 1, NULL),
(9, 36, 8, 1, NULL),
(10, 38, 8, 1, NULL),
(11, 40, 8, 1, NULL),
(12, 42, 8, 1, NULL),
(13, 44, 8, 1, NULL),
(14, 44, 1, 2, 'Applied “Draft 1”'),
(15, 48, 8, 1, NULL),
(16, 50, 1, 1, ''),
(17, 48, 1, 2, 'Applied “Draft 1”'),
(18, 54, 8, 1, NULL),
(19, 56, 8, 1, NULL),
(20, 58, 8, 1, NULL),
(21, 60, 8, 1, NULL),
(22, 62, 8, 1, NULL),
(23, 64, 8, 1, NULL),
(24, 66, 8, 1, NULL),
(25, 68, 8, 1, NULL),
(26, 70, 8, 1, NULL),
(27, 72, 8, 1, NULL),
(28, 70, 1, 2, NULL),
(29, 72, 1, 2, NULL),
(30, 76, 8, 1, NULL),
(31, 78, 8, 1, NULL),
(32, 80, 8, 1, NULL),
(33, 82, 8, 1, NULL),
(34, 84, 8, 1, NULL),
(35, 86, 7, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `searchindex`
--

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'slug', 0, 1, ''),
(1, 'fullname', 0, 1, ' jack weston '),
(1, 'email', 0, 1, ' 33kcaj33 gmail com '),
(1, 'username', 0, 1, ' admin '),
(1, 'firstname', 0, 1, ' jack '),
(2, 'slug', 0, 1, ' 1 '),
(2, 'title', 0, 1, ' 1 '),
(5, 'title', 0, 1, ' 2 '),
(5, 'slug', 0, 1, ' 2 '),
(7, 'fullname', 0, 1, ' testie mctest '),
(7, 'lastname', 0, 1, ' mctest '),
(7, 'firstname', 0, 1, ' testie '),
(7, 'username', 0, 1, ' mrtest '),
(7, 'email', 0, 1, ' test testies com '),
(7, 'slug', 0, 1, ''),
(8, 'username', 0, 1, ' lightningmcqueen '),
(8, 'firstname', 0, 1, ' owen '),
(8, 'lastname', 0, 1, ' wilson '),
(8, 'fullname', 0, 1, ' owen wilson '),
(8, 'email', 0, 1, ' i am speed '),
(8, 'slug', 0, 1, ''),
(1, 'lastname', 0, 1, ' weston '),
(9, 'username', 0, 1, ' testsignup '),
(9, 'firstname', 0, 1, ' first '),
(9, 'lastname', 0, 1, ' signup '),
(9, 'fullname', 0, 1, ' first signup '),
(9, 'email', 0, 1, ' first test com '),
(9, 'slug', 0, 1, ''),
(10, 'username', 0, 1, ' nube '),
(10, 'firstname', 0, 1, ' the '),
(10, 'lastname', 0, 1, ' nube '),
(10, 'fullname', 0, 1, ' the nube '),
(10, 'email', 0, 1, ' nube nubes come '),
(10, 'slug', 0, 1, ''),
(11, 'username', 0, 1, ' 1 '),
(11, 'firstname', 0, 1, ' 1 '),
(11, 'lastname', 0, 1, ' 1 '),
(11, 'fullname', 0, 1, ' 1 1 '),
(11, 'email', 0, 1, ' 1 1 com '),
(11, 'slug', 0, 1, ''),
(18, 'username', 0, 1, ' 8 '),
(18, 'firstname', 0, 1, ' 8 '),
(18, 'lastname', 0, 1, ' 8 '),
(18, 'fullname', 0, 1, ' 8 8 '),
(18, 'email', 0, 1, ' 8 8 com '),
(18, 'slug', 0, 1, ''),
(19, 'username', 0, 1, ' 9 '),
(19, 'firstname', 0, 1, ' 9 '),
(19, 'lastname', 0, 1, ' 9 '),
(19, 'fullname', 0, 1, ' 9 9 '),
(19, 'email', 0, 1, ' 9 9 com '),
(19, 'slug', 0, 1, ''),
(20, 'username', 0, 1, ' 1 '),
(20, 'firstname', 0, 1, ' 1 '),
(20, 'lastname', 0, 1, ' 1 '),
(20, 'fullname', 0, 1, ' 1 1 '),
(20, 'email', 0, 1, ' 1 1 com '),
(20, 'slug', 0, 1, ''),
(21, 'username', 0, 1, ' 2 '),
(21, 'firstname', 0, 1, ' 2 '),
(21, 'lastname', 0, 1, ' 2 '),
(21, 'fullname', 0, 1, ' 2 2 '),
(21, 'email', 0, 1, ' 2 2 com '),
(21, 'slug', 0, 1, ''),
(22, 'username', 0, 1, ' 3 '),
(22, 'firstname', 0, 1, ' 3 '),
(22, 'lastname', 0, 1, ' 3 '),
(22, 'fullname', 0, 1, ' 3 3 '),
(22, 'email', 0, 1, ' 3 3 com '),
(22, 'slug', 0, 1, ''),
(23, 'title', 0, 1, ' 1 '),
(23, 'slug', 0, 1, ' 1 '),
(25, 'title', 0, 1, ' 1 '),
(25, 'slug', 0, 1, ' 1 2 '),
(27, 'title', 0, 1, ' dashboard '),
(27, 'slug', 0, 1, ' dashboard '),
(29, 'username', 0, 1, ' mcpotter '),
(29, 'firstname', 0, 1, ' harry '),
(29, 'lastname', 0, 1, ' potter '),
(29, 'fullname', 0, 1, ' harry potter '),
(29, 'email', 0, 1, ' chosen one com '),
(29, 'slug', 0, 1, ''),
(30, 'username', 0, 1, ' mrt '),
(30, 'firstname', 0, 1, ' trevor '),
(30, 'lastname', 0, 1, ' phillips '),
(30, 'fullname', 0, 1, ' trevor phillips '),
(30, 'email', 0, 1, ' the t com '),
(30, 'slug', 0, 1, ''),
(31, 'slug', 0, 1, ' temp ivvskwtigeqakaczticgdqpglnaqydryfrnt '),
(31, 'title', 0, 1, ''),
(32, 'slug', 0, 1, ' owen wilson '),
(32, 'title', 0, 1, ' owen wilson '),
(34, 'slug', 0, 1, ' owen wilson 2 '),
(34, 'title', 0, 1, ' owen wilson '),
(36, 'slug', 0, 1, ' owen wilson 3 '),
(36, 'title', 0, 1, ' owen wilson '),
(38, 'slug', 0, 1, ' owen wilson 4 '),
(38, 'title', 0, 1, ' owen wilson '),
(40, 'slug', 0, 1, ' owen wilson 5 '),
(40, 'title', 0, 1, ' owen wilson '),
(42, 'slug', 0, 1, ' owen wilson 6 '),
(42, 'title', 0, 1, ' owen wilson '),
(44, 'title', 0, 1, ' owen wilson '),
(44, 'slug', 0, 1, ' owen wilson 7 '),
(48, 'title', 0, 1, ' owen wilson '),
(48, 'slug', 0, 1, ' owen wilson 8 '),
(50, 'title', 0, 1, ' jack '),
(50, 'slug', 0, 1, ' jack '),
(54, 'slug', 0, 1, ' owen wilson 4 '),
(54, 'title', 0, 1, ' owen wilson '),
(56, 'slug', 0, 1, ' owen wilson 5 '),
(56, 'title', 0, 1, ' owen wilson '),
(58, 'slug', 0, 1, ' owen wilson 6 '),
(58, 'title', 0, 1, ' owen wilson '),
(60, 'slug', 0, 1, ' owen wilson 7 '),
(60, 'title', 0, 1, ' owen wilson '),
(62, 'slug', 0, 1, ' owen wilson 8 '),
(62, 'title', 0, 1, ' owen wilson '),
(64, 'slug', 0, 1, ' owen wilson 9 '),
(64, 'title', 0, 1, ' owen wilson '),
(66, 'slug', 0, 1, ' owen wilson 10 '),
(66, 'title', 0, 1, ' owen wilson '),
(68, 'slug', 0, 1, ' owen wilson 11 '),
(68, 'title', 0, 1, ' owen wilson '),
(70, 'title', 0, 1, ' owen wilson '),
(70, 'slug', 0, 1, ' owen wilson 12 '),
(72, 'title', 0, 1, ' owen wilson '),
(72, 'slug', 0, 1, ' owen wilson 13 '),
(76, 'slug', 0, 1, ' owen wilson 4 '),
(76, 'title', 0, 1, ' owen wilson '),
(78, 'slug', 0, 1, ' owen wilson 4 '),
(78, 'title', 0, 1, ' owen wilson '),
(80, 'slug', 0, 1, ' owen wilson 5 '),
(80, 'title', 0, 1, ' owen wilson '),
(82, 'slug', 0, 1, ' owen wilson 6 '),
(82, 'title', 0, 1, ' owen wilson '),
(84, 'slug', 0, 1, ' owen wilson 7 '),
(84, 'title', 0, 1, ' owen wilson ');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `defaultPlacement`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'Posts', 'posts', 'channel', 1, 'all', 'end', '[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]', '2022-03-16 10:33:21', '2022-03-16 10:33:21', NULL, '8892c507-d287-4436-b0a3-3f7de93da202'),
(2, NULL, 'Dashboard', 'dashboard', 'single', 1, 'all', 'end', '[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]', '2022-03-17 00:36:00', '2022-03-17 00:36:00', NULL, '3a986760-821f-487f-ab8e-3c383434d6b1');

-- --------------------------------------------------------

--
-- Table structure for table `sections_sites`
--

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sections_sites`
--

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, 'posts/{slug}', 'posts/_entry', 1, '2022-03-16 10:33:21', '2022-03-16 10:33:21', '6043161d-58ed-4fe5-8ed5-4d103030f037'),
(2, 2, 1, 1, 'dashboard', '/', 1, '2022-03-17 00:36:00', '2022-03-17 00:36:00', '67b18e04-d645-4d09-91c8-459b41a9c8b6');

-- --------------------------------------------------------

--
-- Table structure for table `sequences`
--

CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(6, 1, 'QmzrOx_aBzLs896N6_JirlS9G2yeqhqCVjpfNL83iA-YvxSNjHsLFy6dKJ4X8jl-YdHnpjOd1c8UcEKB3-qAQeDE5fh0A7MRyHpv', '2022-03-16 21:04:54', '2022-03-16 21:08:16', '690cf821-f793-4552-a848-c890ca345d33'),
(8, 1, 'QdjnFcbkYTZsmLhUvmOn_ZEQ3jvtk_g1HLxgZcx9g_DhhjlihFOcoAhMgNnbQvbnmzt62CcwGIj1wqgZX-uC8KG9Eg0OtcZgsMv6', '2022-03-16 21:08:52', '2022-03-16 21:09:13', 'eb613258-aadc-44bc-a00e-dfeec6b5a929'),
(31, 1, 'cXDK4h4JmlC7fWOY5NvX8sRAPsKDs4D-fAEst7DLOjTYWXFc0cxSg-2QiF_1pKYTfUL_Mc2KxL8UqaXUtHqtfsc-nUsFI1z9uF_Y', '2022-03-17 08:52:44', '2022-03-17 11:54:30', 'f68f7196-53a8-4d86-82b9-444e4e0db127'),
(32, 8, '9N42APsC3STDFSZgeiaorhZqvDEP7xhPvU113Dv7W4gv0gEEEMjKKxu2DlQVJZspCAJb131YET-1NRZLdXiqdQkgKMTuNPO78dG0', '2022-03-17 09:54:36', '2022-03-17 10:15:22', 'ff5556af-8e5e-4f14-a34f-65b89300d074'),
(35, 7, '4P6HstEWoHQxdAsYkd2eehEeJwM3vy_WPIr9LrrK97DzBF6fx1L0vLcruXnPM866aep4wE4cMRiz7NuTdUS4DCz7rE4b8DFXb6RV', '2022-03-17 11:50:42', '2022-03-17 11:54:31', '179e8538-1c81-414b-849b-753fb6878f80');

-- --------------------------------------------------------

--
-- Table structure for table `shunnedmessages`
--

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sitegroups`
--

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Social Craft', '2022-03-16 10:17:15', '2022-03-16 10:17:15', NULL, 'b038d5dd-7094-4c93-95d6-87ab4372575d');

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 1, 'Social Craft', 'default', 'en-US', 1, '$PRIMARY_SITE_URL', 1, '2022-03-16 10:17:15', '2022-03-16 10:17:15', NULL, 'daf93206-09b9-4fec-838b-ae157efb0b15');

-- --------------------------------------------------------

--
-- Table structure for table `structureelements`
--

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `structures`
--

CREATE TABLE `structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `systemmessages`
--

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taggroups`
--

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templatecacheelements`
--

CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templatecachequeries`
--

CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templatecaches`
--

CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups`
--

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `usergroups`
--

INSERT INTO `usergroups` (`id`, `name`, `handle`, `description`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Front End Users', 'frontEndUsers', '', '2022-03-16 15:17:38', '2022-03-16 15:17:38', 'f536098f-41cc-43fe-bc2b-714fb19d2122');

-- --------------------------------------------------------

--
-- Table structure for table `usergroups_users`
--

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `usergroups_users`
--

INSERT INTO `usergroups_users` (`id`, `groupId`, `userId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 7, '2022-03-16 15:18:15', '2022-03-16 15:18:15', '69ee8d89-bf5f-48fa-ad9c-2ba9dc66881d'),
(2, 1, 8, '2022-03-16 15:20:04', '2022-03-16 15:20:04', '563486d8-f0d6-4b9e-add6-f05b4943387a'),
(17, 1, 29, '2022-03-17 00:48:55', '2022-03-17 00:48:55', '853c208e-12b8-4d94-9f5c-bffc09958b6a'),
(18, 1, 30, '2022-03-17 00:56:53', '2022-03-17 00:56:53', 'ea798a7d-bdaa-424d-befa-6cbf9b24a1e3');

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions`
--

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `userpermissions`
--

INSERT INTO `userpermissions` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'createentries:8892c507-d287-4436-b0a3-3f7de93da202', '2022-03-17 09:38:12', '2022-03-17 09:38:12', 'd4a97e53-1195-4bd6-8f3b-7e1f2efdfab1'),
(2, 'editentries:8892c507-d287-4436-b0a3-3f7de93da202', '2022-03-17 09:38:12', '2022-03-17 09:38:12', '8dc4c9aa-09e2-4ef7-b4de-72487726f14b'),
(3, 'publishentries:8892c507-d287-4436-b0a3-3f7de93da202', '2022-03-17 10:48:31', '2022-03-17 10:48:31', 'cdc98d42-302a-4377-b191-0ba1498bd927'),
(4, 'deleteentries:8892c507-d287-4436-b0a3-3f7de93da202', '2022-03-17 10:48:31', '2022-03-17 10:48:31', '586b23bd-ca5f-4c94-a476-5f3c239ba553');

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_usergroups`
--

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `userpermissions_usergroups`
--

INSERT INTO `userpermissions_usergroups` (`id`, `permissionId`, `groupId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 1, 1, '2022-03-17 10:48:31', '2022-03-17 10:48:31', 'a88f7eb6-0042-4a7a-afaa-a6fcda26294f'),
(4, 3, 1, '2022-03-17 10:48:31', '2022-03-17 10:48:31', 'c1baeef1-d9b7-4cf9-b2db-bc9be3462f82'),
(5, 4, 1, '2022-03-17 10:48:31', '2022-03-17 10:48:31', '3186693a-3f5b-4e3d-8f0e-839355f26e69'),
(6, 2, 1, '2022-03-17 10:48:31', '2022-03-17 10:48:31', 'ed606d9a-2f5a-4b38-b251-477b2c1e2c97');

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_users`
--

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpreferences`
--

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\",\"locale\":null,\"weekStartDay\":\"1\",\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false,\"showFieldHandles\":false,\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}'),
(7, '{\"language\":null,\"locale\":null,\"weekStartDay\":null,\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false}'),
(8, '{\"language\":null,\"locale\":null,\"weekStartDay\":null,\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false}'),
(29, '{\"language\":null,\"locale\":null,\"weekStartDay\":null,\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false}'),
(30, '{\"language\":null,\"locale\":null,\"weekStartDay\":null,\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'admin', NULL, 'Jack', 'Weston', '33kcaj33@gmail.com', '$2y$13$ZGxL7UtjZEAkOYa2aM0bg.wj.FaLnueMoxzwpFSF2yQzaJnbHLd9G', 1, 0, 0, 0, '2022-03-17 08:52:44', NULL, NULL, NULL, '2022-03-17 08:09:20', NULL, 1, NULL, NULL, NULL, 0, '2022-03-16 15:36:05', '2022-03-16 10:17:15', '2022-03-17 08:52:44', 'e049819a-8d87-43c4-a5f9-f7e552a4c0c0'),
(7, 'MrTest', NULL, 'Testie', 'McTest', 'test@testies.com', '$2y$13$ZGxL7UtjZEAkOYa2aM0bg.wj.FaLnueMoxzwpFSF2yQzaJnbHLd9G', 0, 0, 0, 0, '2022-03-17 11:50:42', NULL, NULL, NULL, '2022-03-16 21:25:33', NULL, 0, NULL, NULL, NULL, 0, NULL, '2022-03-16 10:39:29', '2022-03-17 11:50:42', 'a656d2d8-7244-44e8-845c-2e450a3b2a18'),
(8, 'LightningMcQueen', NULL, 'Owen', 'Wilson', 'I@am.SPEED', '$2y$13$ZGxL7UtjZEAkOYa2aM0bg.wj.FaLnueMoxzwpFSF2yQzaJnbHLd9G', 0, 0, 0, 0, '2022-03-17 11:07:17', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, '2022-03-16 15:19:44', '2022-03-17 11:07:17', '14f0a53f-4e5e-4057-86a4-d154a9ebd016'),
(29, 'McPotter', NULL, 'Harry', 'Potter', 'chosen@one.com', '$2y$13$3VnEB1dQWQDTQ5Ek6FiZ7O3ry.H4lsG45AjUIHI4iX4PZkCOVEA5S', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, '2022-03-17 00:48:55', '2022-03-17 00:48:55', '2022-03-17 00:48:55', 'c5b3b8ad-d9aa-4360-b1ee-e6564d53fa67'),
(30, 'MrT', NULL, 'Trevor', 'Phillips', 'The@T.com', '$2y$13$kzjyCNkXAkSvOX/Fr3uqMe7k61QiktFWK2cjTIosqrGoXhRrnEgba', 0, 0, 0, 0, '2022-03-17 00:57:09', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, '2022-03-17 00:56:53', '2022-03-17 00:56:53', '2022-03-17 00:57:09', '76872231-f91d-4f3c-bb20-1b48c71f7430');

-- --------------------------------------------------------

--
-- Table structure for table `volumefolders`
--

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `volumes`
--

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"siteId\":1,\"section\":\"*\",\"limit\":10}', 1, '2022-03-16 10:17:49', '2022-03-16 10:17:49', '223d7930-1473-4c82-b6fe-2978f1034feb'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2022-03-16 10:17:49', '2022-03-16 10:17:49', 'c07c4334-ed6e-4bc1-a378-0f1e8c9016b4'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2022-03-16 10:17:49', '2022-03-16 10:17:49', 'cfe777d7-258e-4edc-8f8d-819116aece83'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2022-03-16 10:17:49', '2022-03-16 10:17:49', 'ac0699b5-f7af-4208-866f-253b1111da88');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vhoiataeyunaubnkyhollqwpjxnwzoycquvt` (`userId`,`unread`,`dateRead`,`dateCreated`),
  ADD KEY `idx_xrqmnzcljsxcdzqcmeihjqbqbhjduazznaba` (`dateRead`),
  ADD KEY `fk_ycivsjpvzneftsijgflioumillrrtmxmttsy` (`pluginId`);

--
-- Indexes for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nrsqjzxdkcgthhcrkhifzmsiwyuvqrflmzaa` (`sessionId`,`volumeId`),
  ADD KEY `idx_efeuaywiljjrnghghlqpvxizaoofuegtqsjk` (`volumeId`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ixsotjlndfylmwbcknrojitgpisdwjrqnmft` (`filename`,`folderId`),
  ADD KEY `idx_kamywjbxcqqrdycacuvvgfchmhuezdrbuyiw` (`folderId`),
  ADD KEY `idx_xhxfjcvxnpodhtvzaorhjdorglftjronxrro` (`volumeId`),
  ADD KEY `fk_oolpnpxbhhtgfgeymbiiqlrenkwzfugrquet` (`uploaderId`);

--
-- Indexes for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qtfmavzcnellcbuskekcbekpdtkffoemlooq` (`volumeId`,`assetId`,`location`),
  ADD KEY `idx_wsztphauoygywkcjermokgikmamuejzaluhz` (`assetId`,`format`,`location`);

--
-- Indexes for table `assettransforms`
--
ALTER TABLE `assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_iywpnkaeevlczpnwrnvjjbqzxntjfhonnrwm` (`name`),
  ADD KEY `idx_kpdxzbvhxnvsdaomrzitcdmtuyeulnjtvmky` (`handle`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_hjbixsdtbjcdmjwnpaqqovazjnuhripmadnc` (`groupId`),
  ADD KEY `fk_vyrvcovjxttdplxmatndbmisnqjslppshhoj` (`parentId`);

--
-- Indexes for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qysookdgaylrpgebrqrhkvwabrdsisnuqqhk` (`name`),
  ADD KEY `idx_sxzsdmayflexxtomiadsxzgnlpuhvsvjxwqm` (`handle`),
  ADD KEY `idx_vbcsjcyygoeweliyqlztvgmthhgdtoxyiimc` (`structureId`),
  ADD KEY `idx_nseichkitzoachvgkqqduxexuofuwpyekaed` (`fieldLayoutId`),
  ADD KEY `idx_wzvuryarhntadojtjzixvdotynglwwnopiye` (`dateDeleted`);

--
-- Indexes for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_tuesxavizehkbvdzqgdmdpldzhpnppckfjmy` (`groupId`,`siteId`),
  ADD KEY `idx_ytzhtjreqcqwpxmpmxzkusulqzvldtsbymqr` (`siteId`);

--
-- Indexes for table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  ADD KEY `idx_vhkdxweiksgmkzoztygqrincdlpqrfrzviqo` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `fk_ysskdiskezpirolznltpslscuxndkodhfaus` (`siteId`),
  ADD KEY `fk_zwllpuouqogjiwjgizruopyzfnssgdytyzzm` (`userId`);

--
-- Indexes for table `changedfields`
--
ALTER TABLE `changedfields`
  ADD PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  ADD KEY `idx_ftqgaqxztncabjjnviqhsmcmtpyehdvkpkbk` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `fk_ihebfytzrrjvgsxqenrinopdsvsamgtrmsqj` (`siteId`),
  ADD KEY `fk_hdfikdiumakqkjwllnmytijituthrlqqsndw` (`fieldId`),
  ADD KEY `fk_xvvdcvxybxmesgmnkxahcgjozapdeaosyzfi` (`userId`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_dzgdlhypexaaxpivebxykbikzheaswhphagq` (`elementId`,`siteId`),
  ADD KEY `idx_nniiizijatqwvvwbyuxvnljfxpbfkkbeeyoz` (`siteId`),
  ADD KEY `idx_bhyqxsbbgdobbktmiyktpvobzpnnvyszsbap` (`title`);

--
-- Indexes for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_leebmcxuinegffdsashfkegybastiwwbxecm` (`userId`);

--
-- Indexes for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_oqvmqzppzcgfmjkomoawmcziuguxwvwkuinv` (`key`,`fingerprint`);

--
-- Indexes for table `drafts`
--
ALTER TABLE `drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_myqzsjnvecdsebpaalxfpgffdqpbegwfefhr` (`creatorId`,`provisional`),
  ADD KEY `idx_fglgcghawrkudfcakfxcnxkffdmtsbgstkfl` (`saved`),
  ADD KEY `fk_vpfdubnmswsfavufnspcwppfqctckvylblde` (`sourceId`);

--
-- Indexes for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_xuukfaxnkvvlcthkkvstlunfhwhwisfmsxxs` (`type`);

--
-- Indexes for table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_zdcztzueiihyrxflyrvxtwrwuynzpconqntm` (`dateDeleted`),
  ADD KEY `idx_jxbijolplrbjpfyriybkmjctoqmqgsvxalbn` (`fieldLayoutId`),
  ADD KEY `idx_hobhauuumrhofwcvqranxmcslivbpsrvjrga` (`type`),
  ADD KEY `idx_jvboykqjpoljmsaiqareyzqphpusxxmkebbf` (`enabled`),
  ADD KEY `idx_gdsgksyrilxqflxhatvvqwcjjccffamnnhwc` (`archived`,`dateCreated`),
  ADD KEY `idx_amhxvpimpkzslxcsyujtzmbfvmmhnoukvbmr` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  ADD KEY `idx_jewgifxvgaukptjvdbqyiokulqfzansyhlmx` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  ADD KEY `fk_ifclhwgmxfbifzzkqffbyvrigayqmsazeujx` (`canonicalId`),
  ADD KEY `fk_zwfckwkfximggjvueegpzmibnjhcpzaoznlx` (`draftId`),
  ADD KEY `fk_nvmdtjmwujlkalgnqhnazqnzflacgwkoctyl` (`revisionId`);

--
-- Indexes for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_tptaiifzzkscjybbmqzsbkvfnerjmlrcfitz` (`elementId`,`siteId`),
  ADD KEY `idx_xmcndnqjudyylwpocjhzccmtvsujmmewbfbk` (`siteId`),
  ADD KEY `idx_hoinksdpsebutcvksuqfrshchuufolxdxwwe` (`slug`,`siteId`),
  ADD KEY `idx_iwsntgkuqkqvbyljtndjxxkzuyssfyeewybb` (`enabled`),
  ADD KEY `idx_dnwmwnhvphwgtkjcwzvejdandbdzpiefwqhf` (`uri`,`siteId`);

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_hyhqsqoutoidcdnavhitofvqvtkzeetafulf` (`postDate`),
  ADD KEY `idx_kmyqgiroikuramyzxymeciqreekwjubzyldp` (`expiryDate`),
  ADD KEY `idx_vjinriouucqxyclaulztctljmttgdmoefknn` (`authorId`),
  ADD KEY `idx_jppbqkclfwaxhyoyzuxhysxulzjmobvgguje` (`sectionId`),
  ADD KEY `idx_wbhujixhwdmgwpvgdurdxyubcymnjjnfmonk` (`typeId`),
  ADD KEY `fk_jlzjnbwfntyxbdhquccbxydeiewhrjbfqcuf` (`parentId`);

--
-- Indexes for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lgvyjiatphoggkbrrmjgbrqprccyfmrvvtuf` (`name`,`sectionId`),
  ADD KEY `idx_kkfpfmlxlzseiuejflbzjijpraqqcvdpkyin` (`handle`,`sectionId`),
  ADD KEY `idx_nfwisnceqxvyigygtiwyzzpgawvbbaortccv` (`sectionId`),
  ADD KEY `idx_uvzbnvvkdxkwaaylfhluwfrexrrshtsjyiuj` (`fieldLayoutId`),
  ADD KEY `idx_erwkzyrzwgrxdwlaabaneuywncmdckrqxmcr` (`dateDeleted`);

--
-- Indexes for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lnhrktpkyztrjsffweewuexgfmwpsmutoqfj` (`name`),
  ADD KEY `idx_yyhxueoocrojoobwfcxyqddircbhcladvhii` (`dateDeleted`,`name`);

--
-- Indexes for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_hajsxwpxobeavdruvvjhoejkftzlsnppnzvl` (`layoutId`,`fieldId`),
  ADD KEY `idx_afszbdtwwyzjlkqagtoeqtytsigedzryjtdr` (`sortOrder`),
  ADD KEY `idx_djzmbgtulggycbnslerlnovfqllfnofqyomw` (`tabId`),
  ADD KEY `idx_tzwdmkmzkwcvnwyycrlbgjsbcyivhsqzdpeo` (`fieldId`);

--
-- Indexes for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_xpmosoilucefkdmacxyicatkxmvkljnecuae` (`dateDeleted`),
  ADD KEY `idx_hjetynrfpuzluxpvkwlayxpeaezpgktbvyzh` (`type`);

--
-- Indexes for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_xtvugmrjlglahropmawwdebnznoozwilulvy` (`sortOrder`),
  ADD KEY `idx_yxxlifjubvwcsoghnkeifhqrgerfdvcqiewa` (`layoutId`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uccswmxhlpxhhiizuzpiutdlklzgvvjccaor` (`handle`,`context`),
  ADD KEY `idx_yhsbnzorivitltpfvwkkyqhnzyvvgqjvehkn` (`groupId`),
  ADD KEY `idx_rjuzxpbwrrfvlabopqrvgcvwtfqixmfcpwbd` (`context`);

--
-- Indexes for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qzhmraurvcvosyhensbcnvpyxjfpvdvpyogy` (`name`),
  ADD KEY `idx_wgmqjlwzurygsexjkctrfyhitepghipiruig` (`handle`),
  ADD KEY `idx_gkizcerlvjnmeqaiddzyyafbrsmmpkuyiomb` (`fieldLayoutId`),
  ADD KEY `idx_eqevssotlcgiscerzopaojdvgvwvdzvnsskj` (`sortOrder`);

--
-- Indexes for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_xrgktvbulnxvknhvegxnvthccchmpsrrplbm` (`accessToken`),
  ADD UNIQUE KEY `idx_zbkmptjqwylrydmnpajkatrgtdknqhdylxbs` (`name`),
  ADD KEY `fk_ejrfdxhknriftmvlbdajousxhplvypgaydcu` (`schemaId`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_namvbwxfzhhpzedqjbzgknrafiznbuqizzfd` (`ownerId`),
  ADD KEY `idx_lxwdmacsifsnckbosvdmuoqsylxxgkwhvtvo` (`fieldId`),
  ADD KEY `idx_hvhgqeagelazqtcrwxtzohmirnydsneymxtd` (`typeId`),
  ADD KEY `idx_cdtbtisbfewijroteurfgfsjmsiwtttfmvkr` (`sortOrder`);

--
-- Indexes for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_anpofulaghdehtboatcqxxjgexgrppbhepqi` (`name`,`fieldId`),
  ADD KEY `idx_yjtykvrxpbisddwifyqqpizpexzivukbpslp` (`handle`,`fieldId`),
  ADD KEY `idx_xzaxcoeuvqqqithqyfxhvrhhvleyrdgnlnll` (`fieldId`),
  ADD KEY `idx_vbadswdlabdbavgnekleenirhsgqxxciupnp` (`fieldLayoutId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_lpbsvajidntbmhhtrcadzpfheshabxmsgqom` (`track`,`name`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_agjvyowkhueggwhblrijahnffwkqbdcamxgx` (`handle`);

--
-- Indexes for table `projectconfig`
--
ALTER TABLE `projectconfig`
  ADD PRIMARY KEY (`path`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_gqnjfsikgatypopnzjmjvxjkgbsojpzzanns` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `idx_kgivbholbaetcevtgounrrbzljifoimafjfw` (`channel`,`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_bdawsfhjegzfvwkawfhojmstsdxrwopuocvp` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `idx_efpzesfrioylcjhzibqjblkzeyqsdwrmumfx` (`sourceId`),
  ADD KEY `idx_mazuiyyzhfowqbzzrmsshrbqjsjwisvtbuqi` (`targetId`),
  ADD KEY `idx_waqbweghfjiyvpjcwwyvdpjfnkggpnusfzkd` (`sourceSiteId`);

--
-- Indexes for table `resourcepaths`
--
ALTER TABLE `resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ewtfjjmbvusiltcejepuwohavtwedofqexdj` (`sourceId`,`num`),
  ADD KEY `fk_biwyhqhsjwokaotwzauwwkkfirubdykdclsu` (`creatorId`);

--
-- Indexes for table `searchindex`
--
ALTER TABLE `searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `idx_creoyqstuworgwovkbyujkbeeeeduholzkna` (`keywords`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_knselocpsdfnommanvtdlwpvlytpsbdakkwd` (`handle`),
  ADD KEY `idx_lymbffvfulrwejcxiaqmwkkzbdaflxwyqpub` (`name`),
  ADD KEY `idx_xpvwkqwyrgazlbjmdbpdgqsxrlsxofkbskgl` (`structureId`),
  ADD KEY `idx_gaewbshpvestpucxgrvasqehqpehsouqfofe` (`dateDeleted`);

--
-- Indexes for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_bcrezlphiutboigoxljjkdlxlosewdobkdxf` (`sectionId`,`siteId`),
  ADD KEY `idx_lugprxiglegvfptzgyrffyohekrwbyhrxkmm` (`siteId`);

--
-- Indexes for table `sequences`
--
ALTER TABLE `sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wnqsnzfjhlgzipudvpzuwuhihhspduupnxdw` (`uid`),
  ADD KEY `idx_sobnmyrhwhauwofkrfgwqbhtchkkqfzxsupl` (`token`),
  ADD KEY `idx_axcysxeadosseewojfrmrecotxinpeoimxkv` (`dateUpdated`),
  ADD KEY `idx_wfrueyyqluyurrobcqygdasbobpotehzzfpz` (`userId`);

--
-- Indexes for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ulikukddebttnufubyuaicioikfypnwvwbpf` (`userId`,`message`);

--
-- Indexes for table `sitegroups`
--
ALTER TABLE `sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uqarytfpygtwhadppkegxcrhwhlzknodcalu` (`name`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_mzuommikrbtrxyduoktydgsauqcwmeoctkle` (`dateDeleted`),
  ADD KEY `idx_kfdssfmxtueppwpijfwriqvllujyluiovdun` (`handle`),
  ADD KEY `idx_ndldxupuhcsefanwgibcbswwdeprqtxfjaqc` (`sortOrder`),
  ADD KEY `fk_cxzvwcjeiwxfrhzrlcmaoctsfbyjtpjgvsvz` (`groupId`);

--
-- Indexes for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_mrsxuckjzjfnrcvtmbvinkmqsmlqzuabflge` (`structureId`,`elementId`),
  ADD KEY `idx_wjjnclicqzabhhfwmacthtbmkekvvknyaspc` (`root`),
  ADD KEY `idx_lpifgzzeilidfwvcaedbhwambxpmjqdetjwn` (`lft`),
  ADD KEY `idx_vufjlcmdvqsdqmhvodelxbrahdbquzkzaebf` (`rgt`),
  ADD KEY `idx_dztgysdrergakehsrrqpuzamvxdsiyhcpnsl` (`level`),
  ADD KEY `idx_yjzyrbduvlcqvzvmzahbodnuwyhxbbbdigxm` (`elementId`);

--
-- Indexes for table `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qimfcgwrqrhxhblxvqvzrbkqlhgddivjiokd` (`dateDeleted`);

--
-- Indexes for table `systemmessages`
--
ALTER TABLE `systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_lixdnfwsxeokxmoxbsylvvswqehmyektlvhk` (`key`,`language`),
  ADD KEY `idx_gnjieoilgmunbssnlbgzzyotvybwtlybimos` (`language`);

--
-- Indexes for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_euwfjgrjwfcaxvgqptwxqyxukvwjafpldvsn` (`name`),
  ADD KEY `idx_bbwrqxkixdapdzjxmfhwwwmjnafgefcpbpsn` (`handle`),
  ADD KEY `idx_dmbvehhsfvfxzcjmwbqkfglctgjicmxuhnyi` (`dateDeleted`),
  ADD KEY `fk_yeplsrbpgjjnvxpwozsxaftmgfeemduyiodl` (`fieldLayoutId`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_slbnnnsaaikcxkfilwmisyhvxewjzmcbjjio` (`groupId`);

--
-- Indexes for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fvwhlxgnhfrcyrnrcrfakyhictjffxkpbawd` (`cacheId`),
  ADD KEY `idx_rlkltrsaayahoclvscjhwhqwxhuxcllsllrm` (`elementId`);

--
-- Indexes for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_boyqnanwnyasazpeelvicygyaanzvmvlbyyw` (`cacheId`),
  ADD KEY `idx_uyripmslgrugcvxgypgerukckqwcljliwfum` (`type`);

--
-- Indexes for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rybeoadqfdcqiguxhavalhdgvpndvqagolox` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `idx_dynhabvkocijbekifqtkibeojyfdbwomhbjs` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `idx_seucwilrfohbkrglamfehgdijqhxomhtfvmd` (`siteId`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_zwjwzwyuxxbbyukwmhwajtgwqhgxepfimoyg` (`token`),
  ADD KEY `idx_ucmikuhevehoayikzxrgtldlcevssnaycmid` (`expiryDate`);

--
-- Indexes for table `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_riftviqrcftsmjbrxiqontnjaekadbluhukq` (`handle`),
  ADD KEY `idx_bpxhnpdinprrdiwjslfiobqxjtpjokkjcqxh` (`name`);

--
-- Indexes for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_hdjwoiwqqxgwqpewafeyexudemittmzuwkoz` (`groupId`,`userId`),
  ADD KEY `idx_lpxjygwxjziqehmqvxhwcqosxaoeqsciwcvf` (`userId`);

--
-- Indexes for table `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ymsqfbbynveccrrvvqufqnmxfrbwzjosjrjx` (`name`);

--
-- Indexes for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_evohredrvflvqzrwtafhiapygosrtswysivc` (`permissionId`,`groupId`),
  ADD KEY `idx_glszakadxfkgnbyyzbhtuuqklhojherkkhpb` (`groupId`);

--
-- Indexes for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_aclmwecvumqmzedkzwcwkoznxwxtttamzygf` (`permissionId`,`userId`),
  ADD KEY `idx_repugdynhybwihzeveerzpglnexcyswicviw` (`userId`);

--
-- Indexes for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_kxekmvfzaeueugjmongqbfdufqndwstsbtdp` (`uid`),
  ADD KEY `idx_rhkovtutuestyhesveogbcnizdsvzskksgun` (`verificationCode`),
  ADD KEY `idx_bceyfrsntgkchcozczwfuilaghhacrtmjrwe` (`email`),
  ADD KEY `idx_pmasmtkkqufgjejoaizfoimlreglmenzpnct` (`username`),
  ADD KEY `fk_pefyqgidtxgjijdicdspirrodjtltlsyclnt` (`photoId`);

--
-- Indexes for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_emofpbicdvrohxklwrbxfsdlwtcxsxkafzfr` (`name`,`parentId`,`volumeId`),
  ADD KEY `idx_lwgasqxmmbxyysabtwghkmmpcksidmzcfitp` (`parentId`),
  ADD KEY `idx_vcymjvduwunlitvqhkxakklyyvjnbyoxzpmk` (`volumeId`);

--
-- Indexes for table `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_furddnqztitvzciozlzxafcjxnrkzpkirvdf` (`name`),
  ADD KEY `idx_uwslnpqnqzbnwpfwgcobgdxuovvzvgnokwiu` (`handle`),
  ADD KEY `idx_afbbahznioxeskhqpkagjpvbuoicbxbemhud` (`fieldLayoutId`),
  ADD KEY `idx_tneacncdvwawcjtqbwvoobqouoxltjhxpgia` (`dateDeleted`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wfichluwjmynknujlyojpdyarexmezewwgnj` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransforms`
--
ALTER TABLE `assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups`
--
ALTER TABLE `categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=831;

--
-- AUTO_INCREMENT for table `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gqltokens`
--
ALTER TABLE `gqltokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitegroups`
--
ALTER TABLE `sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `structureelements`
--
ALTER TABLE `structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `systemmessages`
--
ALTER TABLE `systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taggroups`
--
ALTER TABLE `taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecaches`
--
ALTER TABLE `templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpreferences`
--
ALTER TABLE `userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `volumefolders`
--
ALTER TABLE `volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `volumes`
--
ALTER TABLE `volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `fk_jlkrxfmqvicwbkibnsrhracnhlzrdbyobtrs` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ycivsjpvzneftsijgflioumillrrtmxmttsy` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `fk_kjmdtijxrzntkifqxwxxyidxjkvsmyraogar` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `fk_ehguevzixpvimgcjuenutfbpwuozwrhmfhlm` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_oolpnpxbhhtgfgeymbiiqlrenkwzfugrquet` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_skddrvmxqwfvaoaiahykrptvmumakqdfajnz` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vytquovoktqlgoewghfvrlowuojdnlkczqev` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_iyxhcartfgglcmdlwqjlmuggenxkyfwmxiuh` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_msxekcpobxwikxihwvvgqitneiqbvfwhucie` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vyrvcovjxttdplxmatndbmisnqjslppshhoj` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `fk_uzfkkxezmwrdaufnpwtflgcsmqwgkbgjivit` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vpdumxnwfdyigvfmqiuaqmtjgrmczgxbvpin` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `fk_eekxulosnbkigepcsdmjjprzkbadpxzfmnva` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tusidwizhythsysaquvxxxyubbacwlezigiv` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD CONSTRAINT `fk_phwshhhvcsflytwaonykvnkirxspkkxduiuz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ysskdiskezpirolznltpslscuxndkodhfaus` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_zwllpuouqogjiwjgizruopyzfnssgdytyzzm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `changedfields`
--
ALTER TABLE `changedfields`
  ADD CONSTRAINT `fk_hdfikdiumakqkjwllnmytijituthrlqqsndw` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ihebfytzrrjvgsxqenrinopdsvsamgtrmsqj` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jnonefakshsikmlyyvqvpvilyyztbuxlljrk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_xvvdcvxybxmesgmnkxahcgjozapdeaosyzfi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `fk_aqznkakgghfjywlqedmqgglehcdndbndxsem` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ujynoytbinnoogkqyjjrrvpdzyaeipnbfpvp` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `fk_leebmcxuinegffdsashfkegybastiwwbxecm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drafts`
--
ALTER TABLE `drafts`
  ADD CONSTRAINT `fk_cwynczywytdznaenoqvfdauvenbjphnkpuqx` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_vpfdubnmswsfavufnspcwppfqctckvylblde` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `fk_czwojmgwbmlmbltvwbfdwivvbgdlnbupdwfc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_ifclhwgmxfbifzzkqffbyvrigayqmsazeujx` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_nvmdtjmwujlkalgnqhnazqnzflacgwkoctyl` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zwfckwkfximggjvueegpzmibnjhcpzaoznlx` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `fk_acbqnyxpgattnnkglxwdqbnbhlnqdplykvzo` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_dxtwrgukpgyslkaoxvtudpzopxoumwbqbdlo` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `fk_jlzjnbwfntyxbdhquccbxydeiewhrjbfqcuf` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_paagnglicdrcqqpujnjkjfrqnvolzztpgjgh` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pzmhebiohwfnhdtephxtrodypsaphwkbdxnc` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_sihugqbsprvztfpdpmmwyohwhzopabfyrwjl` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_wbxwkacqnflxdjdrlnfgpxhgjydayqdyiwle` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `fk_hejcobhtjgdcalrqlanluaiautjsilpjjmeq` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_socsqwetqeseczrbwuugpxuodkasrkwwcxyv` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD CONSTRAINT `fk_chzqevysawtaiepnpykmfrulilqwkkkmsyab` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_thfrzdpdetofwqcaysdyqksoavvlomfedebo` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_uzxiaihebfnucobdegtlmjrphcrpvgbbjnyb` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD CONSTRAINT `fk_rbzblkpqftoailolprovirfwuqtuaiogflqc` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fk_pgssffrrsrusxqyqhtghfbdadmnprbrmohuz` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `fk_kzpfscvvaocfyfizukthpvlznezbjxzcfwww` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_vtaesjzmdznkpoqtpboslakhcedzqrmcnmgk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD CONSTRAINT `fk_ejrfdxhknriftmvlbdajousxhplvypgaydcu` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD CONSTRAINT `fk_bzrpnxxwjikbvqesorgoxthscdcumorpueve` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pzhpcojwmlbznnldzjzkjogrhhzunvlwjhdk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_whwmmdqrhizlxggydxwsihkeqnqjtioegkyn` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_wpqemwxpzbzedwrqaxcovirnqhtkropsdtkz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD CONSTRAINT `fk_caxprznjnsbmvpteqlrhigqfjvmcsobnblsu` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_fmxevrjsrlbqqeejzoukahelkpoxzbpvbxlv` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `fk_osttvmeebogwlhcdigmiligyijvlerjatgmj` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vgxfshnqiofrzscfpqwntmqizwpcilkxiywi` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_wjczcfbzjmpshzprtcfwoqvyldrdwwqmczkz` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ygdhdanlfokxcnebsckaaztpqbjnxttuvwpr` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `revisions`
--
ALTER TABLE `revisions`
  ADD CONSTRAINT `fk_biwyhqhsjwokaotwzauwwkkfirubdykdclsu` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_umxvtmkaocmnyddnqlcojualpuoggzznwzmx` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `fk_oslxjtecxryhmaptvebppaydcqtsufvypjid` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `fk_qpcftcnebrrysbiyyelgkscwdyloawvofhin` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_robpemdxkhagegddbmnfcjswoydxgzqrnnpw` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `fk_wluzttkvsgyxzbrcflxgnidtjippnbgrqbod` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `fk_vkbriczkvjcioxerifsivjglzpliikpcpadc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `fk_cxzvwcjeiwxfrhzrlcmaoctsfbyjtpjgvsvz` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `fk_bioupqnyjdqmzvnvtlfmhxkgaccgppkuskmn` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_nhpxummjpwfphdxbkheqdosxavymbmnqskbl` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `fk_yeplsrbpgjjnvxpwozsxaftmgfeemduyiodl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `fk_dnbtqseybcdaepqvlcxijtzordhjxzccoggr` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hktgbzasdgqkpjpidjpyfvzmmwdgligwxgad` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD CONSTRAINT `fk_iprlemhoyboiaegdxfhrtnmmjwbavjjqluje` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_jybszwlyructeqttguiztipscpdtpymdaqwk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD CONSTRAINT `fk_zrzuucpmgsituqxhmeuxfrhxqhctjlpmgqxx` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD CONSTRAINT `fk_uggusnxpluiyexpdpnwgaeebkiwhprhqcqbc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `fk_tmxabymybpsgtkcpjjmfsklbzzcjrxniuyqa` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ttyjykshudsnomphxucprjgfakzqoukyzcbf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `fk_ecsewqcyihvtyjpmoihbbmgjhodcqpxdjeaf` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_mhliyjyekntghunzzzyaorirajrozniwuyer` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `fk_kqlwapkufnlgknswthvcskwixdamcozzggrs` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tqachwixmfbixbalkljnzbddftctleeyzuni` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `fk_kpwdbpunrpbyptzefhedhllqutuxcyahazdg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_pefyqgidtxgjijdicdspirrodjtltlsyclnt` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_tffyulrbpynbengumngohtzlygrchqeyvgls` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `fk_ghjcrmglzupqjukvjtpxnqqlpqevzswolnjh` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ywwhudycuksztchrigrpzaupkqzprzhmrbcy` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `fk_tmtfuqjdkqpxvybylkncwpvzxriqmbrocfyg` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `fk_tqfcxdaozelacgdpvnddkuughunibsxfwxbx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

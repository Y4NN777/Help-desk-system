-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2025 at 11:55 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helpdesk`
--

-- --------------------------------------------------------

--
-- Table structure for table `canned_replies`
--

CREATE TABLE `canned_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `shared` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `all_agents` tinyint(1) NOT NULL DEFAULT 0,
  `public` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `all_agents`, `public`, `created_at`, `updated_at`) VALUES
(1, 'IT Department', 0, 1, '2025-03-11 19:52:13', '2025-03-11 19:52:13');

-- --------------------------------------------------------

--
-- Table structure for table `email_verifiers`
--

CREATE TABLE `email_verifiers` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `server_name` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  `mime` varchar(255) NOT NULL,
  `extension` varchar(255) NOT NULL,
  `disk` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `labels`
--

CREATE TABLE `labels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `labels`
--

INSERT INTO `labels` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Information System Issue', '#2196F3', '2025-03-11 19:53:55', '2025-03-11 19:53:55');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `locale`, `name`) VALUES
(1, 'en', 'English');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2020_06_01_000001_create_user_roles_table', 1),
(3, '2020_06_01_000002_create_users_table', 1),
(4, '2020_06_01_000004_create_password_resets_table', 1),
(5, '2020_06_01_000005_create_failed_jobs_table', 1),
(6, '2020_06_01_000006_create_settings_table', 1),
(7, '2020_06_01_000007_create_email_verifiers_table', 1),
(8, '2020_06_01_000008_create_languages_table', 1),
(9, '2020_06_01_000009_create_notifications_table', 1),
(10, '2020_10_16_193905_create_labels_table', 1),
(11, '2020_10_28_180001_create_files_table', 1),
(12, '2020_10_28_180002_create_statuses_table', 1),
(13, '2020_10_28_180003_create_priorities_table', 1),
(14, '2020_10_28_180004_create_departments_table', 1),
(15, '2020_10_28_180005_create_canned_replies_table', 1),
(16, '2020_10_28_185714_create_tickets_table', 1),
(17, '2020_10_28_185745_create_ticket_replies_table', 1),
(18, '2020_10_28_185924_create_ticket_attachments_table', 1),
(19, '2020_10_28_190949_create_ticket_labels_table', 1),
(20, '2020_10_28_191259_create_user_departments_table', 1),
(21, '2020_10_28_194213_add_dashboard_column_to_user_roles_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\User', 1, 'smart_desk_auth_token', '2aa7dbe46ab224a3e5cf4cbdeca81f216e6657ad9005565e69dcf1517fe0d308', '[\"*\"]', '2025-03-10 14:53:54', '2025-03-10 14:53:52', '2025-03-10 14:53:54'),
(3, 'App\\Models\\User', 1, 'smart_desk_auth_token', '98898c5db7c8b014d4807b7ac599a641c58544b66df102871f7478886850a374', '[\"*\"]', '2025-03-10 14:57:12', '2025-03-10 14:57:11', '2025-03-10 14:57:12'),
(4, 'App\\Models\\User', 1, 'smart_desk_auth_token', '7cf2a5d508a159f0ad5f05abd66bd2f17157d23638fe385b51975080c450c35c', '[\"*\"]', '2025-03-10 16:18:33', '2025-03-10 15:17:16', '2025-03-10 16:18:33'),
(6, 'App\\Models\\User', 1, 'smart_desk_auth_token', '3924063999afe05dbf4bf2d7dbf38e0b0b514bf82b20a30a35d352d7e2af3086', '[\"*\"]', '2025-03-11 16:59:06', '2025-03-11 16:37:14', '2025-03-11 16:59:06'),
(7, 'App\\Models\\User', 1, 'smart_desk_auth_token', '3a2757de6dce5a990e5804652665f4041838092afdecd964be609ab08df53b88', '[\"*\"]', '2025-03-11 17:04:48', '2025-03-11 17:02:10', '2025-03-11 17:04:48'),
(8, 'App\\Models\\User', 3, 'smart_desk_auth_token', '533915eeb936a8cd31cea74143a18f18048d13ee117ed386b78fbb22ed91c716', '[\"*\"]', NULL, '2025-03-11 17:06:21', '2025-03-11 17:06:21'),
(9, 'App\\Models\\User', 1, 'smart_desk_auth_token', 'ff8e65fa84c82c862f07397ef4996c78a0e4626226f78bd803eb871e53b9fa8a', '[\"*\"]', '2025-03-11 17:09:15', '2025-03-11 17:07:34', '2025-03-11 17:09:15'),
(10, 'App\\Models\\User', 3, 'smart_desk_auth_token', '71c47d7b4bebd130f4737ed175252d618c71072cb20425c56f7e4a9106f0770a', '[\"*\"]', '2025-03-11 19:39:43', '2025-03-11 17:09:58', '2025-03-11 19:39:43'),
(11, 'App\\Models\\User', 1, 'smart_desk_auth_token', '569148099af72993d1aa3738b39c0494ce78c9bc81f71a4f171cac628f64bcbb', '[\"*\"]', '2025-03-11 19:56:37', '2025-03-11 19:40:17', '2025-03-11 19:56:37'),
(12, 'App\\Models\\User', 1, 'smart_desk_auth_token', '714547aac4f83678596e74c462ebc514c61120f0726ae0910d2ca8112578ebb9', '[\"*\"]', '2025-03-11 20:13:08', '2025-03-11 19:48:37', '2025-03-11 20:13:08'),
(13, 'App\\Models\\User', 4, 'smart_desk_auth_token', 'a864c6f2bcd506a65dd149d1fdfafa02c99cedef8b8fe9cb3df4d17f059c3ab7', '[\"*\"]', '2025-03-11 20:01:34', '2025-03-11 19:57:10', '2025-03-11 20:01:34'),
(14, 'App\\Models\\User', 4, 'smart_desk_auth_token', '6be20d9dd8dc131ebe88be6d2701bc9f59de00901b652e448d11a1057305ac7f', '[\"*\"]', '2025-03-11 20:03:23', '2025-03-11 20:01:48', '2025-03-11 20:03:23'),
(15, 'App\\Models\\User', 1, 'smart_desk_auth_token', 'fe4ae6958c177ff634d46dc2ab1c58fd0296dbc6a40f4d2e61a10ffe9f56a866', '[\"*\"]', '2025-03-11 20:04:33', '2025-03-11 20:03:37', '2025-03-11 20:04:33'),
(16, 'App\\Models\\User', 4, 'smart_desk_auth_token', 'eb6569168f148e305491deaaffde819f6786aca750d300e8752f272ed8b6cac2', '[\"*\"]', '2025-03-11 20:05:09', '2025-03-11 20:04:55', '2025-03-11 20:05:09'),
(17, 'App\\Models\\User', 1, 'smart_desk_auth_token', 'c5a48a47da1b9eb37f5110d3e3101e14614992f18c29c8202c82b36cc8896892', '[\"*\"]', '2025-03-11 20:12:51', '2025-03-11 20:06:59', '2025-03-11 20:12:51'),
(18, 'App\\Models\\User', 5, 'smart_desk_auth_token', 'a399508ac270c1dca991ee19b354163d7133af36e6a55a3aebdc8aea6906ce54', '[\"*\"]', NULL, '2025-03-11 20:13:35', '2025-03-11 20:13:35'),
(19, 'App\\Models\\User', 1, 'smart_desk_auth_token', '79193ba1ff5f653c37ce72fcd7ca103e1b16cb906489552c74217f525d480d26', '[\"*\"]', '2025-03-11 20:18:10', '2025-03-11 20:15:16', '2025-03-11 20:18:10'),
(20, 'App\\Models\\User', 1, 'smart_desk_auth_token', 'b8521d4d7a5d5b6676fee8aed98604cbc77a3f4de952c8bd33e4be158d96039d', '[\"*\"]', '2025-03-11 20:18:30', '2025-03-11 20:18:23', '2025-03-11 20:18:30'),
(21, 'App\\Models\\User', 1, 'smart_desk_auth_token', '815ab8adccec2ba80168c45f0f47aabdbcbb1ee0f7c7159e802152f5fdd325ac', '[\"*\"]', '2025-03-11 20:18:55', '2025-03-11 20:18:52', '2025-03-11 20:18:55'),
(22, 'App\\Models\\User', 1, 'smart_desk_auth_token', '8f53fdae6eca9cf37684420907bc4dd210838a7366230e0a0c048880aebd1e9a', '[\"*\"]', '2025-03-11 20:26:37', '2025-03-11 20:20:39', '2025-03-11 20:26:37');

-- --------------------------------------------------------

--
-- Table structure for table `priorities`  
--

CREATE TABLE `priorities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `value` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `priorities`
--

INSERT INTO `priorities` (`id`, `value`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Low', '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
(2, 2, 'Medium', '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
(3, 3, 'High', '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
(4, 4, 'Urgent', '2025-03-10 14:45:59', '2025-03-10 14:45:59');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `key` varchar(255) NOT NULL,
  `value` longtext DEFAULT NULL,
  `is_env` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`key`, `value`, `is_env`, `created_at`, `updated_at`) VALUES
('app_background', 'default', 0, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('app_date_format', 'L', 0, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('app_date_locale', 'en', 0, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('app_default_role', '3', 0, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('app_https', '0', 1, '2025-03-10 14:45:59', '2025-03-10 14:47:13'),
('app_icon', 'appearance/icon/ztlxERX7tRwJlcoiUrnAyLqIbOPuvqCOgtC8lgtw.png', 0, '2025-03-10 14:45:59', '2025-03-10 15:17:43'),
('app_locale', 'en', 1, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('app_name', 'Smart Desk', 1, '2025-03-10 14:45:59', '2025-03-10 14:47:13'),
('app_timezone', 'UTC', 1, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('app_url', 'http://localhost', 1, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('app_user_registration', '0', 0, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('mail_encryption', NULL, 1, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('mail_from_address', NULL, 1, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('mail_from_name', 'Laradesk', 1, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('mail_host', 'smtp.mailtrap.io', 1, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('mail_mailer', 'smtp', 1, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('mail_password', NULL, 1, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('mail_port', '2525', 1, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('mail_username', NULL, 1, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('mailgun_domain', NULL, 1, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('mailgun_endpoint', NULL, 1, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('mailgun_secret', NULL, 1, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('meta_description', 'A simple and clean platform that allows users to create tickets and get support from your staff', 0, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('meta_home_title', 'Laradesk - Helpdesk ticketing system', 0, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('meta_keywords', 'dashboard,laravel,vue,tailwindcss,spa', 0, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('recaptcha_enabled', '0', 0, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('recaptcha_private', NULL, 0, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('recaptcha_public', NULL, 0, '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
('sentry_dsn', NULL, 1, '2025-03-10 14:45:59', '2025-03-10 14:45:59');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Open', '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
(2, 'Pending', '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
(3, 'Resolved', '2025-03-10 14:45:59', '2025-03-10 14:45:59'),
(4, 'Closed', '2025-03-10 14:45:59', '2025-03-10 14:45:59');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `priority_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `agent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `closed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `closed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_attachments`
--

CREATE TABLE `ticket_attachments` (
  `ticket_reply_id` bigint(20) UNSIGNED NOT NULL,
  `file_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_labels`
--

CREATE TABLE `ticket_labels` (
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `label_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_labels`
--

INSERT INTO `ticket_labels` (`ticket_id`, `label_id`) VALUES
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `body` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_replies`
--

INSERT INTO `ticket_replies` (`id`, `ticket_id`, `user_id`, `body`, `created_at`, `updated_at`) VALUES
(6, 3, 1, 'Please fix the section 7 business mail server', '2025-03-11 20:01:09', '2025-03-11 20:01:09'),
(7, NULL, 1, 'fgjhdtjtrjtr', '2025-03-11 20:12:06', '2025-03-11 20:12:06'),
(8, NULL, 5, 'afawgwgaeggawgaw', '2025-03-11 20:14:25', '2025-03-11 20:14:25'),
(9, NULL, 1, 'ssgwsgsgsxgsv', '2025-03-11 20:16:01', '2025-03-11 20:16:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `avatar`, `role_id`, `status`, `password`, `remember_token`, `created_at`, `updated_at`, `email_verified_at`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, 1, 1, '$2y$10$qxNDZdJinJD/LEwPg4G8mOFNkTfkQvxLhJzsM06Jnt0igo49FqICm', NULL, '2025-03-10 14:45:59', '2025-03-10 14:45:59', NULL),
(5, 'NIKIEMA Ramzi', 'ramzi@gmail.com', NULL, 2, 1, '$2y$10$1bXncpcj.5/I1fgq6BnOEuPUv0PTgG1qecKq09JO20iXD258HXM9W', NULL, '2025-03-11 20:09:54', '2025-03-11 20:09:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_departments`
--

CREATE TABLE `user_departments` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_departments`
--

INSERT INTO `user_departments` (`user_id`, `department_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 2,
  `permissions` longtext DEFAULT NULL,
  `dashboard_access` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `name`, `type`, `permissions`, `dashboard_access`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 1, '\"[]\"', 1, '2025-03-10 14:45:58', '2025-03-10 14:45:58'),
(2, 'User', 1, '\"[\\\"App.Http.Controllers.Api.Dashboard.StatsController\\\"]\"', 0, '2025-03-10 14:45:58', '2025-03-10 14:45:58'),
(3, 'Customer', 1, '\"[]\"', 0, '2025-03-10 14:45:58', '2025-03-10 14:45:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `canned_replies`
--
ALTER TABLE `canned_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `canned_replies_user_id_foreign` (`user_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_verifiers`
--
ALTER TABLE `email_verifiers`
  ADD KEY `email_verifiers_email_index` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_user_id_foreign` (`user_id`),
  ADD KEY `files_uuid_index` (`uuid`);

--
-- Indexes for table `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `priorities`
--
ALTER TABLE `priorities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_status_id_foreign` (`status_id`),
  ADD KEY `tickets_priority_id_foreign` (`priority_id`),
  ADD KEY `tickets_department_id_foreign` (`department_id`),
  ADD KEY `tickets_user_id_foreign` (`user_id`),
  ADD KEY `tickets_agent_id_foreign` (`agent_id`),
  ADD KEY `tickets_closed_by_foreign` (`closed_by`),
  ADD KEY `tickets_uuid_index` (`uuid`);

--
-- Indexes for table `ticket_attachments`
--
ALTER TABLE `ticket_attachments`
  ADD PRIMARY KEY (`ticket_reply_id`,`file_id`),
  ADD KEY `ticket_attachments_file_id_foreign` (`file_id`);

--
-- Indexes for table `ticket_labels`
--
ALTER TABLE `ticket_labels`
  ADD PRIMARY KEY (`ticket_id`,`label_id`),
  ADD KEY `ticket_labels_label_id_foreign` (`label_id`);

--
-- Indexes for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_replies_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ticket_replies_user_id_foreign` (`user_id`);

  
--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_departments`
--
ALTER TABLE `user_departments`
  ADD PRIMARY KEY (`user_id`,`department_id`),
  ADD KEY `user_departments_department_id_foreign` (`department_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `canned_replies`
--
ALTER TABLE `canned_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `labels`
--
ALTER TABLE `labels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `priorities`
--
ALTER TABLE `priorities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `canned_replies`
--
ALTER TABLE `canned_replies`
  ADD CONSTRAINT `canned_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tickets_closed_by_foreign` FOREIGN KEY (`closed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tickets_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tickets_priority_id_foreign` FOREIGN KEY (`priority_id`) REFERENCES `priorities` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tickets_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ticket_attachments`
--
ALTER TABLE `ticket_attachments`
  ADD CONSTRAINT `ticket_attachments_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`),
  ADD CONSTRAINT `ticket_attachments_ticket_reply_id_foreign` FOREIGN KEY (`ticket_reply_id`) REFERENCES `ticket_replies` (`id`);

--
-- Constraints for table `ticket_labels`
--
ALTER TABLE `ticket_labels`
  ADD CONSTRAINT `ticket_labels_label_id_foreign` FOREIGN KEY (`label_id`) REFERENCES `labels` (`id`),
  ADD CONSTRAINT `ticket_labels_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`);

--
-- Constraints for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD CONSTRAINT `ticket_replies_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ticket_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`id`);

--
-- Constraints for table `user_departments`
--
ALTER TABLE `user_departments`
  ADD CONSTRAINT `user_departments_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `user_departments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

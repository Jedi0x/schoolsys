-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 19, 2021 at 06:39 PM
-- Server version: 10.2.36-MariaDB-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `logicsfort_ram`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `balance` double(18,2) NOT NULL DEFAULT 0.00,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `advance_salary`
--

CREATE TABLE `advance_salary` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `deduct_month` varchar(20) DEFAULT NULL,
  `year` varchar(20) NOT NULL,
  `reason` text CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL,
  `request_date` datetime DEFAULT NULL,
  `paid_date` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=pending,2=paid,3=rejected',
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `issued_by` varchar(200) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `branch_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `remarks` text NOT NULL,
  `type_id` int(11) NOT NULL,
  `uploader_id` varchar(20) NOT NULL,
  `class_id` varchar(20) DEFAULT 'unfiltered',
  `file_name` varchar(255) NOT NULL,
  `enc_name` varchar(255) NOT NULL,
  `subject_id` varchar(200) DEFAULT 'unfiltered',
  `session_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attachments_type`
--

CREATE TABLE `attachments_type` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `award`
--

CREATE TABLE `award` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `gift_item` varchar(255) NOT NULL,
  `award_amount` decimal(18,2) NOT NULL,
  `award_reason` text NOT NULL,
  `given_date` date NOT NULL,
  `session_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `author` varchar(255) NOT NULL,
  `isbn_no` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `edition` varchar(255) NOT NULL,
  `purchase_date` date NOT NULL,
  `description` text NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `total_stock` varchar(20) NOT NULL,
  `issued_copies` varchar(20) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `book_category`
--

CREATE TABLE `book_category` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `book_issues`
--

CREATE TABLE `book_issues` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `date_of_issue` date DEFAULT NULL,
  `date_of_expiry` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `fine_amount` decimal(18,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = pending, 1 = accepted, 2 = rejected, 3 = returned',
  `issued_by` varchar(255) DEFAULT NULL,
  `return_by` int(11) DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `school_name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobileno` varchar(100) NOT NULL,
  `currency` varchar(100) NOT NULL,
  `symbol` varchar(25) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `stu_generate` tinyint(3) DEFAULT 0,
  `stu_username_prefix` varchar(255) NOT NULL,
  `stu_default_password` varchar(255) NOT NULL,
  `grd_generate` tinyint(3) DEFAULT 0,
  `grd_username_prefix` varchar(255) NOT NULL,
  `grd_default_password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id`, `name`, `school_name`, `email`, `mobileno`, `currency`, `symbol`, `city`, `state`, `address`, `stu_generate`, `stu_username_prefix`, `stu_default_password`, `grd_generate`, `grd_username_prefix`, `grd_default_password`, `created_at`, `updated_at`) VALUES
(1, 'Ibn e Isa', 'East', 'isa@test.com', '12345678', 'PKR', 'PKR', 'Lahore', 'Punjab', 'test.', 0, '', '', 0, '', '', '2020-11-20 19:07:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bulk_msg_category`
--

CREATE TABLE `bulk_msg_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT 'sms=1, email=2',
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bulk_sms_email`
--

CREATE TABLE `bulk_sms_email` (
  `id` int(11) NOT NULL,
  `campaign_name` varchar(255) DEFAULT NULL,
  `sms_gateway` varchar(55) DEFAULT '0',
  `message` text DEFAULT NULL,
  `email_subject` varchar(255) DEFAULT NULL,
  `message_type` tinyint(3) DEFAULT 0 COMMENT 'sms=1, email=2',
  `recipient_type` tinyint(3) NOT NULL COMMENT 'group=1, individual=2, class=3',
  `recipients_details` longtext DEFAULT NULL,
  `additional` longtext DEFAULT NULL,
  `schedule_time` datetime DEFAULT NULL,
  `posting_status` tinyint(3) NOT NULL COMMENT 'schedule=1,competed=2',
  `total_thread` int(11) NOT NULL,
  `successfully_sent` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `card_templete`
--

CREATE TABLE `card_templete` (
  `id` int(11) NOT NULL,
  `card_type` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `user_type` tinyint(1) NOT NULL,
  `background` varchar(355) DEFAULT NULL,
  `logo` varchar(355) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `layout_width` varchar(11) NOT NULL DEFAULT '54',
  `layout_height` varchar(11) NOT NULL DEFAULT '86',
  `photo_style` tinyint(1) NOT NULL,
  `photo_size` varchar(25) NOT NULL,
  `top_space` varchar(25) NOT NULL,
  `bottom_space` varchar(25) NOT NULL,
  `right_space` varchar(25) NOT NULL,
  `left_space` varchar(25) NOT NULL,
  `qr_code` varchar(25) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `certificates_templete`
--

CREATE TABLE `certificates_templete` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_type` tinyint(1) NOT NULL,
  `background` varchar(355) DEFAULT NULL,
  `logo` varchar(355) DEFAULT NULL,
  `signature` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `page_layout` tinyint(1) NOT NULL,
  `photo_style` tinyint(1) NOT NULL,
  `photo_size` varchar(25) NOT NULL,
  `top_space` varchar(25) NOT NULL,
  `bottom_space` varchar(25) NOT NULL,
  `right_space` varchar(25) NOT NULL,
  `left_space` varchar(25) NOT NULL,
  `qr_code` varchar(25) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_numeric` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `name`, `name_numeric`, `created_at`, `updated_at`, `branch_id`) VALUES
(1, 'One', '1', '2020-11-23 21:37:09', NULL, 1),
(2, 'Two', '2', '2020-11-23 21:37:28', NULL, 1),
(3, 'One - B', '1', '2020-11-23 21:38:01', NULL, 1),
(4, '9th', '9', '2021-03-01 22:44:06', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `custom_field`
--

CREATE TABLE `custom_field` (
  `id` int(11) NOT NULL,
  `form_to` varchar(50) DEFAULT NULL,
  `field_label` varchar(100) NOT NULL,
  `default_value` text DEFAULT NULL,
  `field_type` enum('text','textarea','dropdown','date','checkbox','number','url','email') NOT NULL,
  `required` varchar(5) NOT NULL DEFAULT 'false',
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `show_on_table` varchar(5) DEFAULT NULL,
  `field_order` int(11) NOT NULL,
  `bs_column` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_values`
--

CREATE TABLE `custom_fields_values` (
  `id` int(11) NOT NULL,
  `relid` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_config`
--

CREATE TABLE `email_config` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `protocol` varchar(255) NOT NULL,
  `smtp_host` varchar(255) DEFAULT NULL,
  `smtp_user` varchar(255) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(100) DEFAULT NULL,
  `smtp_encryption` varchar(10) DEFAULT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `tags` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `tags`) VALUES
(1, 'account_registered', '{institute_name}, {name}, {login_username}, {password}, {user_role}, {login_url}'),
(2, 'forgot_password', '{institute_name}, {username}, {email}, {reset_url}'),
(3, 'change_password', '{institute_name}, {username}, {email}, {password}'),
(4, 'new_message_received', '{institute_name}, {recipient}, {message}, {message_url}'),
(5, 'payslip_generated', '{institute_name}, {username}, {month_year}, {payslip_url}'),
(6, 'award', '{institute_name}, {winner_name}, {award_name}, {gift_item}, {award_reason}, {given_date}'),
(7, 'leave_approve', '{institute_name}, {applicant_name}, {start_date}, {end_date}, {comments}'),
(8, 'leave_reject', '{institute_name}, {applicant_name}, {start_date}, {end_date}, {comments}'),
(9, 'advance_salary_approve', '{institute_name}, {applicant_name}, {deduct_motnh}, {amount}, {comments}'),
(10, 'advance_salary_reject', '{institute_name}, {applicant_name}, {deduct_motnh}, {amount}, {comments}');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates_details`
--

CREATE TABLE `email_templates_details` (
  `id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `template_body` text NOT NULL,
  `notified` tinyint(1) NOT NULL DEFAULT 1,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `enroll`
--

CREATE TABLE `enroll` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `roll` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `branch_id` tinyint(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enroll`
--

INSERT INTO `enroll` (`id`, `student_id`, `class_id`, `section_id`, `roll`, `session_id`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 0, 3, 1, '2020-11-23 21:40:27', NULL),
(2, 2, 1, 1, 2, 3, 1, '2020-11-28 17:19:25', NULL),
(3, 3, 1, 1, 1, 3, 1, '2020-11-29 12:25:17', NULL),
(4, 4, 1, 1, 44, 3, 1, '2020-11-29 12:27:31', NULL),
(5, 5, 1, 1, 33, 3, 1, '2020-11-29 12:27:31', NULL),
(6, 6, 4, 1, 1, 3, 1, '2021-03-01 22:48:49', NULL),
(7, 7, 4, 1, 2, 3, 1, '2021-03-01 22:48:49', NULL),
(8, 8, 4, 1, 3, 3, 1, '2021-03-01 22:48:49', NULL),
(9, 9, 4, 1, 4, 3, 1, '2021-03-01 22:48:49', NULL),
(10, 10, 4, 1, 5, 3, 1, '2021-03-01 22:48:49', NULL),
(11, 11, 1, 1, 12, 3, 1, '2021-03-18 19:27:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `remark` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `type` text NOT NULL,
  `audition` longtext NOT NULL,
  `selected_list` longtext NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `created_by` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `show_web` tinyint(3) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `title`, `remark`, `status`, `type`, `audition`, `selected_list`, `start_date`, `end_date`, `image`, `created_by`, `created_at`, `updated_at`, `branch_id`, `show_web`) VALUES
(1, 'Surprise Day', '<p>Surprise of PAF to INdia</p>', 1, '1', '1', 'null', '2021-02-27', '2021-02-27', 'event.png', '1', '2021-03-02 00:15:24', NULL, 1, 0),
(2, 'Resolution Day', '<p>Resolution of Pakistan, 23 March 1940</p>', 1, '1', '1', 'null', '2021-03-23', '2021-03-23', 'event_2.jpg', '1', '2021-03-02 00:17:05', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `event_types`
--

CREATE TABLE `event_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(200) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `event_types`
--

INSERT INTO `event_types` (`id`, `name`, `icon`, `branch_id`) VALUES
(1, 'Celebration', 'concierge-bell', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `term_id` int(11) DEFAULT NULL,
  `type_id` tinyint(4) NOT NULL COMMENT '1=mark,2=gpa,3=both',
  `session_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `remark` text NOT NULL,
  `mark_distribution` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`id`, `name`, `term_id`, `type_id`, `session_id`, `branch_id`, `remark`, `mark_distribution`, `created_at`, `updated_at`) VALUES
(1, 'Monthly Test', 1, 1, 3, 1, '40 marks are passing criteria', '[\"1\"]', '2021-03-01 23:19:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exam_attendance`
--

CREATE TABLE `exam_attendance` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `status` varchar(4) DEFAULT NULL COMMENT 'P=Present, A=Absent, L=Late',
  `remark` varchar(255) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exam_hall`
--

CREATE TABLE `exam_hall` (
  `id` int(11) NOT NULL,
  `hall_no` longtext NOT NULL,
  `seats` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exam_hall`
--

INSERT INTO `exam_hall` (`id`, `hall_no`, `seats`, `branch_id`) VALUES
(1, 'Main Hall', 250, 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam_mark_distribution`
--

CREATE TABLE `exam_mark_distribution` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exam_mark_distribution`
--

INSERT INTO `exam_mark_distribution` (`id`, `name`, `branch_id`) VALUES
(1, '100', 1),
(2, '50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam_term`
--

CREATE TABLE `exam_term` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `session_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exam_term`
--

INSERT INTO `exam_term` (`id`, `name`, `branch_id`, `session_id`) VALUES
(1, '1st Term', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `fees_reminder`
--

CREATE TABLE `fees_reminder` (
  `id` int(11) NOT NULL,
  `frequency` varchar(255) NOT NULL,
  `days` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `student` tinyint(3) NOT NULL,
  `guardian` tinyint(3) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fees_reminder`
--

INSERT INTO `fees_reminder` (`id`, `frequency`, `days`, `message`, `student`, `guardian`, `branch_id`, `created_at`) VALUES
(1, 'before', '2', 'Your son/daughter fees due date is 10 Mar 2021', 0, 1, 1, '2021-03-08 00:24:48');

-- --------------------------------------------------------

--
-- Table structure for table `fees_type`
--

CREATE TABLE `fees_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `fee_code` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fees_type`
--

INSERT INTO `fees_type` (`id`, `name`, `fee_code`, `description`, `branch_id`, `created_at`) VALUES
(1, 'Paper Fee', 'paper-fee', 'Quarterly ', 1, '2020-11-29 13:02:34'),
(2, 'Tuition Fee', 'tuition-fee', 'Monthly', 1, '2021-03-01 23:57:26'),
(3, 'Admission Fees', 'admission-fees', 'Once only', 1, '2021-03-01 23:58:49'),
(4, 'Security Fees', 'security-fees', 'Returnable', 1, '2021-03-01 23:59:13'),
(5, 'Late Fee Fine', 'late-fee-fine', '', 1, '2021-03-15 19:26:17');

-- --------------------------------------------------------

--
-- Table structure for table `fee_allocation`
--

CREATE TABLE `fee_allocation` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fee_allocation`
--

INSERT INTO `fee_allocation` (`id`, `student_id`, `group_id`, `branch_id`, `session_id`, `created_at`) VALUES
(1, 6, 1, 1, 3, '2021-03-02 00:02:36'),
(2, 7, 1, 1, 3, '2021-03-02 00:02:36'),
(3, 8, 1, 1, 3, '2021-03-02 00:02:36'),
(4, 9, 1, 1, 3, '2021-03-02 00:02:36'),
(5, 10, 1, 1, 3, '2021-03-02 00:02:36'),
(6, 6, 2, 1, 3, '2021-03-08 00:27:57'),
(7, 7, 2, 1, 3, '2021-03-08 00:27:57'),
(8, 8, 2, 1, 3, '2021-03-08 00:27:57'),
(9, 9, 2, 1, 3, '2021-03-08 00:27:57'),
(10, 10, 2, 1, 3, '2021-03-08 00:27:57');

-- --------------------------------------------------------

--
-- Table structure for table `fee_fine`
--

CREATE TABLE `fee_fine` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `fine_value` varchar(20) NOT NULL,
  `fine_type` varchar(20) NOT NULL,
  `fee_frequency` varchar(20) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fee_fine`
--

INSERT INTO `fee_fine` (`id`, `group_id`, `type_id`, `fine_value`, `fine_type`, `fee_frequency`, `branch_id`, `session_id`) VALUES
(1, 1, 2, '10', '1', '1', 1, 3),
(2, 2, 5, '10', '1', '1', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `fee_groups`
--

CREATE TABLE `fee_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fee_groups`
--

INSERT INTO `fee_groups` (`id`, `name`, `description`, `session_id`, `branch_id`, `created_at`) VALUES
(1, 'Genral', '', 3, 1, '2021-03-02 00:00:32'),
(2, 'April Fee', 'for 9thScience ', 3, 1, '2021-03-08 00:11:05');

-- --------------------------------------------------------

--
-- Table structure for table `fee_groups_details`
--

CREATE TABLE `fee_groups_details` (
  `id` int(11) NOT NULL,
  `fee_groups_id` int(11) NOT NULL,
  `fee_type_id` int(11) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `due_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fee_groups_details`
--

INSERT INTO `fee_groups_details` (`id`, `fee_groups_id`, `fee_type_id`, `amount`, `due_date`, `created_at`) VALUES
(1, 1, 1, 500.00, '2021-03-02', '2021-03-02 00:00:32'),
(2, 1, 2, 1500.00, '2021-03-02', '2021-03-02 00:00:32'),
(3, 1, 3, 1000.00, '2021-03-02', '2021-03-02 00:00:32'),
(4, 1, 4, 2000.00, '2021-03-02', '2021-03-02 00:00:32'),
(5, 2, 1, 1000.00, '2021-04-03', '2021-03-08 00:11:05'),
(6, 2, 2, 2500.00, '2021-04-03', '2021-03-08 00:11:05'),
(7, 2, 5, 10.00, '2021-04-10', '2021-03-15 19:27:33');

-- --------------------------------------------------------

--
-- Table structure for table `fee_payment_history`
--

CREATE TABLE `fee_payment_history` (
  `id` int(11) NOT NULL,
  `allocation_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `collect_by` varchar(20) DEFAULT NULL,
  `amount` decimal(18,2) NOT NULL,
  `discount` decimal(18,2) NOT NULL,
  `fine` decimal(18,2) NOT NULL,
  `pay_via` varchar(20) NOT NULL,
  `remarks` longtext NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fee_payment_history`
--

INSERT INTO `fee_payment_history` (`id`, `allocation_id`, `type_id`, `collect_by`, `amount`, `discount`, `fine`, `pay_via`, `remarks`, `date`) VALUES
(1, 1, 1, '1', 500.00, 0.00, 0.00, '1', '', '2021-03-01'),
(2, 1, 2, '1', 1500.00, 0.00, 0.00, '1', '', '2021-03-01'),
(3, 1, 3, '1', 1000.00, 0.00, 0.00, '1', '', '2021-03-01'),
(4, 1, 4, '1', 2000.00, 0.00, 0.00, '1', '', '2021-03-01'),
(5, 2, 1, '1', 500.00, 0.00, 0.00, '1', '', '2021-03-01'),
(6, 2, 3, '1', 1000.00, 0.00, 0.00, '1', '', '2021-03-01'),
(7, 3, 1, '1', 500.00, 0.00, 0.00, '1', '', '2021-03-01'),
(8, 3, 2, '1', 1500.00, 0.00, 0.00, '1', '', '2021-03-01'),
(9, 3, 4, '1', 2000.00, 0.00, 0.00, '1', '', '2021-03-01'),
(10, 3, 3, '1', 1000.00, 0.00, 0.00, '1', '', '2021-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_about`
--

CREATE TABLE `front_cms_about` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `page_title` varchar(255) NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `about_image` varchar(255) NOT NULL,
  `elements` mediumtext NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_about`
--

INSERT INTO `front_cms_about` (`id`, `title`, `subtitle`, `page_title`, `content`, `banner_image`, `about_image`, `elements`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'Welcome to School', 'Best Education Mangment Systems', 'About Us', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut volutpat rutrum eros amet sollicitudin interdum. Suspendisse pulvinar, velit nec pharetra interdum, ante tellus ornare mi, et mollis tellus neque vitae elit. Mauris adipiscing mauris fringilla turpis interdum sed pulvinar nisi malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\r\n                        </p>\r\n                        <p>\r\n                            Donec sed odio dui. Nulla vitae elit libero, a pharetra augue. Nullam id dolor id nibh ultricies vehicula ut id elit. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Duis mollis, est non commodo luctus, nisi erat porttitor ligula. Mauris sit amet neque nec nunc gravida. \r\n                        </p>\r\n                        <div class=\"row\">\r\n                            <div class=\"col-sm-6 col-12\">\r\n                                <ul class=\"list-unstyled list-style-3\">\r\n                                    <li><a href=\"#\">Cardiothoracic Surgery</a></li>\r\n                                    <li><a href=\"#\">Cardiovascular Diseases</a></li>\r\n                                    <li><a href=\"#\">Ophthalmology</a></li>\r\n                                    <li><a href=\"#\">Dermitology</a></li>\r\n                                </ul>\r\n                            </div>\r\n                            <div class=\"col-sm-6 col-12\">\r\n                                <ul class=\"list-unstyled list-style-3\">\r\n                                    <li><a href=\"#\">Cardiothoracic Surgery</a></li>\r\n                                    <li><a href=\"#\">Cardiovascular Diseases</a></li>\r\n                                    <li><a href=\"#\">Ophthalmology</a></li>\r\n                                </ul>\r\n                            </div>\r\n                        </div>', 'about1.jpg', 'about1.png', '{\"cta_title\":\"Get in touch to join our community\",\"button_text\":\"Contact Our Office\",\"button_url\":\"contact\"}', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_admission`
--

CREATE TABLE `front_cms_admission` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_admission`
--

INSERT INTO `front_cms_admission` (`id`, `title`, `description`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'Make An Admission', '<p>Lorem ipsum dolor sit amet, eum illum dolore concludaturque ex, ius latine adipisci no. Pro at nullam laboramus definitiones. Mandamusconceptam omittantur cu cum. Brute appetere it scriptorem ei eam, ne vim velit novum nominati. Causae volutpat percipitur at sed ne.</p>\r\n', 'Admission', 'admission1.jpg', 'Ramom - School Management System With CMS', 'Ramom  Admission Page', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_contact`
--

CREATE TABLE `front_cms_contact` (
  `id` int(11) NOT NULL,
  `box_title` varchar(255) DEFAULT NULL,
  `box_description` varchar(500) DEFAULT NULL,
  `box_image` varchar(255) DEFAULT NULL,
  `form_title` varchar(355) DEFAULT NULL,
  `address` varchar(355) DEFAULT NULL,
  `phone` varchar(355) DEFAULT NULL,
  `email` varchar(355) DEFAULT NULL,
  `submit_text` varchar(355) NOT NULL,
  `map_iframe` text DEFAULT NULL,
  `page_title` varchar(255) NOT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_contact`
--

INSERT INTO `front_cms_contact` (`id`, `box_title`, `box_description`, `box_image`, `form_title`, `address`, `phone`, `email`, `submit_text`, `map_iframe`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'WE\'D LOVE TO HEAR FROM YOU', 'Fusce convallis diam vitae velit tempus rutrum. Donec nisl nisl, vulputate eu sapien sed, adipiscing vehicula massa. Mauris eget commodo neque, id molestie enim.', 'contact-info-box1.png', 'Get in touch by filling the form below', '4896  Romrog Way, LOS ANGELES,\r\nCalifornia', '123-456-7890, \r\n123-456-7890', 'info@example.com\r\nsupport@example.com', 'Send', NULL, 'Contact Us', 'contact1.jpg', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_events`
--

CREATE TABLE `front_cms_events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_events`
--

INSERT INTO `front_cms_events` (`id`, `title`, `description`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'Upcoming Events', '<p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.</p><p>Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.</p>', 'Events', 'events1.jpg', 'Ramom - School Management System With CMS', 'Ramom Events Page', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_faq`
--

CREATE TABLE `front_cms_faq` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_faq`
--

INSERT INTO `front_cms_faq` (`id`, `title`, `description`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'Frequently Asked Questions', '<p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.</p>\r\n\r\n<p>Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven&#39;t heard of them accusamus labore sustainable VHS.</p>', 'Faq', 'faq1.jpg', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_faq_list`
--

CREATE TABLE `front_cms_faq_list` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_faq_list`
--

INSERT INTO `front_cms_faq_list` (`id`, `title`, `description`, `branch_id`) VALUES
(1, 'Any Information you provide on applications for disability, life or accidental insurance ?', '<p>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco quat. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\r\n</p>\r\n<ul>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</li>\r\n<li>Sed do eiusmod tempor incididunt ut labore et dolore magna aliq.</li>\r\n<li>Ut enim ad minim veniam, quis nostrud exercitation ullamco quat. It is a long established fact.</li>\r\n<li>That a reader will be distracted by the readable content of a page when looking at its layout.</li>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</li>\r\n<li>Eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</li>\r\n<li>Quis nostrud exercitation ullamco quat. It is a long established fact that a reader will be distracted.</li>\r\n<li>Readable content of a page when looking at its layout.</li>\r\n<li>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.</li>\r\n<li>Opposed to using \'Content here, content here\', making it look like readable English.</li>\r\n</ul>', 1),
(2, 'Readable content of a page when looking at its layout ?', '<p>\r\n                                Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.\r\n                            </p>\r\n                            <ol>\r\n                                <li>Quis nostrud exercitation ullamco quat. It is a long established fact that a reader will be distracted.</li>\r\n                                <li>Readable content of a page when looking at its layout.</li>\r\n                                <li>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.</li>\r\n                                <li>Opposed to using \'Content here, content here\', making it look like readable English.</li>\r\n                            </ol>\r\n                            <p>\r\n                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.\r\n                            </p>', 1),
(3, 'Opposed to using \'Content here, content here\', making it look like readable English ?', '<p>\r\n                                Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.\r\n                            </p>\r\n                            <ol>\r\n                                <li>Quis nostrud exercitation ullamco quat. It is a long established fact that a reader will be distracted.</li>\r\n                                <li>Readable content of a page when looking at its layout.</li>\r\n                                <li>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.</li>\r\n                                <li>Opposed to using \'Content here, content here\', making it look like readable English.</li>\r\n                            </ol>\r\n                            <p>\r\n                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.\r\n                            </p>', 1),
(4, 'Readable content of a page when looking at its layout ?', '<p>\r\n                                Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.\r\n                            </p>\r\n                            <ol>\r\n                                <li>Quis nostrud exercitation ullamco quat. It is a long established fact that a reader will be distracted.</li>\r\n                                <li>Readable content of a page when looking at its layout.</li>\r\n                                <li>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.</li>\r\n                                <li>Opposed to using \'Content here, content here\', making it look like readable English.</li>\r\n                            </ol>\r\n                            <p>\r\n                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.\r\n                            </p>', 1),
(5, 'What types of documents are required to travel?', '<p><strong>Lorem ipsum</strong> dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, at usu eius eligendi singulis. Sea ocurreret principes ne. At nonumy aperiri pri, nam quodsi copiosae intellegebat et, ex deserunt euripidis usu. Per ad ullum lobortis. Duo volutpat imperdiet ut, postea salutatus imperdiet ut per, ad utinam debitis invenire has.</p>\r\n\r\n<ol>\r\n	<li>labores explicari qui</li>\r\n	<li>labores explicari qui</li>\r\n	<li>labores explicari quilabores explicari qui</li>\r\n	<li>labores explicari qui</li>\r\n</ol>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_home`
--

CREATE TABLE `front_cms_home` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `item_type` varchar(20) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `elements` mediumtext NOT NULL,
  `branch_id` int(11) NOT NULL,
  `active` tinyint(3) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_home`
--

INSERT INTO `front_cms_home` (`id`, `title`, `subtitle`, `item_type`, `description`, `elements`, `branch_id`, `active`) VALUES
(1, 'Welcome To Education', 'We will give you future', 'wellcome', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using content.\r\n\r\nMaking it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '{\"image\":\"wellcome1.jpg\"}', 1, 0),
(2, 'Experience Teachers Team', NULL, 'teachers', 'Making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident.', '{\"teacher_start\":\"0\",\"image\":\"featured-parallax1.jpg\"}', 1, 0),
(3, 'WHY CHOOSE US', NULL, 'services', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '', 1, 0),
(4, 'Request for a free Education Class', NULL, 'cta', '', '{\"mobile_no\":\"+1-12345678\",\"button_text\":\"Request Now\",\"button_url\":\"#\"}', 1, 0),
(5, 'Wellcome To <span>Ramom</span>', NULL, 'slider', 'Lorem Ipsum is simply dummy text printer took a galley of type and scrambled it to make a type specimen book.', '{\"position\":\"c-left\",\"button_text1\":\"View Services\",\"button_url1\":\"#\",\"button_text2\":\"Learn More\",\"button_url2\":\"#\",\"image\":\"home-slider-1592582779.jpg\"}', 1, 0),
(6, 'Online  <span>Live Class</span> Facility', NULL, 'slider', 'Lorem Ipsum is simply dummy text printer took a galley of type and scrambled it to make a type specimen book.', '{\"position\":\"c-left\",\"button_text1\":\"Read More\",\"button_url1\":\"#\",\"button_text2\":\"Get Started\",\"button_url2\":\"#\",\"image\":\"home-slider-1592582805.jpg\"}', 1, 0),
(8, 'Online Classes', NULL, 'features', 'Nulla metus metus ullamcorper vel tincidunt sed euismod nibh Quisque volutpat condimentum velit class aptent taciti sociosqu.', '{\"button_text\":\"Read More\",\"button_url\":\"#\",\"icon\":\"fas fa-video\"}', 1, 0),
(9, 'Scholarship', NULL, 'features', 'Nulla metus metus ullamcorper vel tincidunt sed euismod nibh Quisque volutpat condimentum velit class aptent taciti sociosqu.', '{\"button_text\":\"Read More\",\"button_url\":\"#\",\"icon\":\"fas fa-graduation-cap\"}', 1, 0),
(10, 'Books & Liberary', NULL, 'features', 'Nulla metus metus ullamcorper vel tincidunt sed euismod nibh Quisque volutpat condimentum velit class aptent taciti sociosqu.', '{\"button_text\":\"Read More\",\"button_url\":\"#\",\"icon\":\"fas fa-book-reader\"}', 1, 0),
(11, 'Trending Courses', NULL, 'features', 'Nulla metus metus ullamcorper vel tincidunt sed euismod nibh Quisque volutpat condimentum velit class aptent taciti sociosqu.', '{\"button_text\":\"Read More\",\"button_url\":\"#\",\"icon\":\"fab fa-discourse\"}', 1, 0),
(12, 'WHAT PEOPLE SAYS', NULL, 'testimonial', 'Fusce sem dolor, interdum in efficitur at, faucibus nec lorem. Sed nec molestie justo.', '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_home_seo`
--

CREATE TABLE `front_cms_home_seo` (
  `id` int(11) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `meta_keyword` text NOT NULL,
  `meta_description` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_home_seo`
--

INSERT INTO `front_cms_home_seo` (`id`, `page_title`, `meta_keyword`, `meta_description`, `branch_id`) VALUES
(1, 'Home', 'Ramom  Home Page', 'Ramom - School Management System With CMS', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_menu`
--

CREATE TABLE `front_cms_menu` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `ordering` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT 0,
  `open_new_tab` int(11) NOT NULL DEFAULT 0,
  `ext_url` tinyint(3) NOT NULL DEFAULT 0,
  `ext_url_address` text DEFAULT NULL,
  `publish` tinyint(3) NOT NULL,
  `system` tinyint(3) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_menu`
--

INSERT INTO `front_cms_menu` (`id`, `title`, `alias`, `ordering`, `parent_id`, `open_new_tab`, `ext_url`, `ext_url_address`, `publish`, `system`, `branch_id`, `created_at`) VALUES
(1, 'Home', 'index', 1, 0, 0, 0, '', 1, 1, 0, '2019-08-09 12:18:54'),
(2, 'Events', 'events', 3, 0, 0, 0, '', 1, 1, 0, '2019-08-09 12:18:54'),
(3, 'Teachers', 'teachers', 2, 0, 0, 0, '', 1, 1, 0, '2019-08-09 12:18:54'),
(4, 'About Us', 'about', 4, 0, 0, 0, '', 1, 1, 0, '2019-08-09 12:18:54'),
(5, 'FAQ', 'faq', 5, 0, 0, 0, '', 1, 1, 0, '2019-08-09 12:18:54'),
(6, 'Online Admission', 'admission', 6, 0, 0, 0, '', 1, 1, 0, '2019-08-09 12:18:54'),
(7, 'Contact Us', 'contact', 7, 0, 0, 0, '', 1, 1, 0, '2019-08-09 12:18:54');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_pages`
--

CREATE TABLE `front_cms_pages` (
  `id` int(11) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `menu_id` int(11) NOT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_services`
--

CREATE TABLE `front_cms_services` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `parallax_image` varchar(255) DEFAULT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_services`
--

INSERT INTO `front_cms_services` (`id`, `title`, `subtitle`, `parallax_image`, `branch_id`) VALUES
(1, 'Get Well Soon', 'Our Best <span>Services</span>', 'service_parallax1.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_services_list`
--

CREATE TABLE `front_cms_services_list` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_services_list`
--

INSERT INTO `front_cms_services_list` (`id`, `title`, `description`, `icon`, `branch_id`) VALUES
(1, 'Online Course Facilities', 'Making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.', 'fas fa-headphones', 1),
(2, 'Modern Book Library', 'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover.', 'fas fa-book-open', 1),
(3, 'Be Industrial Leader', 'Making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model.', 'fas fa-industry', 1),
(4, 'Programming Courses', 'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will.', 'fas fa-code', 1),
(5, 'Foreign Languages', 'Making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover.', 'fas fa-language', 1),
(6, 'Alumni Directory', 'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a for \'lorem ipsum\' will uncover.', 'fas fa-user-graduate', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_setting`
--

CREATE TABLE `front_cms_setting` (
  `id` int(11) NOT NULL,
  `application_title` varchar(255) NOT NULL,
  `url_alias` varchar(255) DEFAULT NULL,
  `cms_active` tinyint(4) NOT NULL DEFAULT 0,
  `online_admission` tinyint(4) NOT NULL DEFAULT 0,
  `theme` varchar(255) NOT NULL,
  `captcha_status` varchar(20) NOT NULL,
  `recaptcha_site_key` varchar(255) NOT NULL,
  `recaptcha_secret_key` varchar(255) NOT NULL,
  `address` varchar(350) NOT NULL,
  `mobile_no` varchar(60) NOT NULL,
  `fax` varchar(60) NOT NULL,
  `receive_contact_email` varchar(255) NOT NULL,
  `email` varchar(60) NOT NULL,
  `copyright_text` varchar(255) NOT NULL,
  `fav_icon` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `footer_about_text` varchar(300) NOT NULL,
  `working_hours` varchar(300) NOT NULL,
  `facebook_url` varchar(100) NOT NULL,
  `twitter_url` varchar(100) NOT NULL,
  `youtube_url` varchar(100) NOT NULL,
  `google_plus` varchar(100) NOT NULL,
  `linkedin_url` varchar(100) NOT NULL,
  `pinterest_url` varchar(100) NOT NULL,
  `instagram_url` varchar(100) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_setting`
--

INSERT INTO `front_cms_setting` (`id`, `application_title`, `url_alias`, `cms_active`, `online_admission`, `theme`, `captcha_status`, `recaptcha_site_key`, `recaptcha_secret_key`, `address`, `mobile_no`, `fax`, `receive_contact_email`, `email`, `copyright_text`, `fav_icon`, `logo`, `footer_about_text`, `working_hours`, `facebook_url`, `twitter_url`, `youtube_url`, `google_plus`, `linkedin_url`, `pinterest_url`, `instagram_url`, `branch_id`) VALUES
(1, 'School Management System With CMS', 'myschool', 1, 1, 'blue', 'disable', '', '', 'Your Address', '+12345678', '12345678', 'info@example.com', 'info@demo.com', 'Copyright © 2020 <span>Ramom</span>. All Rights Reserved.', 'fav_icon1.png', 'logo1.png', 'If you are going to use a passage LorIsum, you anythirassing hidden in the middle of text. Lators on the Internet tend to.', '<span>Hours : </span>  Mon To Fri - 10AM - 04PM,  Sunday Closed', 'https://facebook.com', 'https://twitter.com', 'https://youtube.com', 'https://google.com', 'https://linkedin.com', 'https://pinterest.com', 'https://instagram.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_teachers`
--

CREATE TABLE `front_cms_teachers` (
  `id` int(11) NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_teachers`
--

INSERT INTO `front_cms_teachers` (`id`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'Teachers', 'teachers1.jpg', 'Ramom - School Management System With CMS', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_testimonial`
--

CREATE TABLE `front_cms_testimonial` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(355) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `rank` int(5) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_testimonial`
--

INSERT INTO `front_cms_testimonial` (`id`, `name`, `surname`, `image`, `description`, `rank`, `branch_id`, `created_by`, `created_at`) VALUES
(1, 'Gartrell Wright', 'Los Angeles', 'user-1582830398.jpg', 'Intexure have done an excellent job presenting the analysis & insights. I am confident in saying  have helped encounter  is to be welcomed and every pain avoided”.', 1, 1, 1, '2019-08-23 12:26:42'),
(2, 'Clifton Hyde', 'Newyork City', 'defualt.png', '“Owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted always holds”.', 4, 1, 1, '2019-08-23 12:26:42'),
(3, 'Emily Lemus', 'Los Angeles', 'defualt.png', '“Intexure have done an excellent job presenting the analysis & insights. I am confident in saying  have helped encounter  is to be welcomed and every pain avoided”.', 5, 1, 1, '2019-08-23 12:26:42');

-- --------------------------------------------------------

--
-- Table structure for table `global_settings`
--

CREATE TABLE `global_settings` (
  `id` int(11) NOT NULL,
  `institute_name` varchar(255) NOT NULL,
  `institution_code` varchar(255) NOT NULL,
  `reg_prefix` varchar(255) NOT NULL,
  `institute_email` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `mobileno` varchar(100) NOT NULL,
  `currency` varchar(100) NOT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `sms_service_provider` varchar(100) NOT NULL,
  `session_id` int(11) NOT NULL,
  `translation` varchar(100) NOT NULL,
  `footer_text` varchar(255) NOT NULL,
  `animations` varchar(100) NOT NULL,
  `timezone` varchar(100) NOT NULL,
  `date_format` varchar(100) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `facebook_url` varchar(255) NOT NULL,
  `twitter_url` varchar(255) NOT NULL,
  `linkedin_url` varchar(255) NOT NULL,
  `youtube_url` varchar(255) NOT NULL,
  `cron_secret_key` varchar(255) DEFAULT NULL,
  `cms_default_branch` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `global_settings`
--

INSERT INTO `global_settings` (`id`, `institute_name`, `institution_code`, `reg_prefix`, `institute_email`, `address`, `mobileno`, `currency`, `currency_symbol`, `sms_service_provider`, `session_id`, `translation`, `footer_text`, `animations`, `timezone`, `date_format`, `facebook_url`, `twitter_url`, `linkedin_url`, `youtube_url`, `cron_secret_key`, `cms_default_branch`, `created_at`, `updated_at`) VALUES
(1, 'School', 'RSM-', 'on', 'ramom@example.com', '', '', 'PKR', 'Rs. ', 'disabled', 3, 'english', '© 2021 Aant school System - Developed by Aant Tech. ', 'rotateInUpLeft', 'Asia/Karachi', 'd.M.Y', '', '', '', '', '', 1, '2018-10-22 09:07:49', '2020-05-01 22:37:06');

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `grade_point` varchar(255) NOT NULL,
  `lower_mark` int(11) NOT NULL,
  `upper_mark` int(11) NOT NULL,
  `remark` text NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`id`, `name`, `grade_point`, `lower_mark`, `upper_mark`, `remark`, `branch_id`) VALUES
(1, 'A', '1', 85, 100, '', 1),
(2, 'B', '2', 75, 84, '', 1),
(3, 'C', '3', 65, 74, '', 1),
(4, 'D', '4', 41, 64, '', 1),
(5, 'F', '5', 0, 40, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hall_allocation`
--

CREATE TABLE `hall_allocation` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `hall_no` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `homework`
--

CREATE TABLE `homework` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `date_of_homework` date NOT NULL,
  `date_of_submission` date NOT NULL,
  `description` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `create_date` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `sms_notification` tinyint(2) NOT NULL,
  `schedule_date` date DEFAULT NULL,
  `document` varchar(255) NOT NULL,
  `evaluation_date` date DEFAULT NULL,
  `evaluated_by` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `homework`
--

INSERT INTO `homework` (`id`, `class_id`, `section_id`, `session_id`, `subject_id`, `date_of_homework`, `date_of_submission`, `description`, `created_by`, `create_date`, `status`, `sms_notification`, `schedule_date`, `document`, `evaluation_date`, `evaluated_by`, `branch_id`) VALUES
(1, 1, 1, 3, 1, '2021-03-01', '2021-03-02', '<p>Chapter 1 exercise complete</p>', 1, '2021-02-28', '0', 1, NULL, 'image1-14.png', NULL, 0, 1),
(2, 4, 1, 3, 1, '2021-03-01', '2021-03-10', '<p>Chapter 1 complete exercise </p>', 1, '2021-03-01', '0', 1, NULL, 'sehar2.jpg', NULL, 0, 1),
(3, 4, 1, 3, 2, '2021-03-01', '2021-03-10', '<p>Chapter 1 & 1.2 complete</p>', 1, '2021-03-01', '0', 1, NULL, 'sehar.png', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `homework_evaluation`
--

CREATE TABLE `homework_evaluation` (
  `id` int(11) NOT NULL,
  `homework_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `remark` text NOT NULL,
  `rank` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hostel`
--

CREATE TABLE `hostel` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `category_id` int(11) NOT NULL,
  `address` longtext NOT NULL,
  `watchman` longtext NOT NULL,
  `remarks` longtext DEFAULT NULL,
  `branch_id` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hostel_category`
--

CREATE TABLE `hostel_category` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `description` longtext DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `type` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hostel_room`
--

CREATE TABLE `hostel_room` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `hostel_id` int(11) NOT NULL,
  `no_beds` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `bed_fee` decimal(18,2) NOT NULL,
  `remarks` longtext NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inquiry`
--

CREATE TABLE `inquiry` (
  `id` int(11) NOT NULL,
  `inquiry_no` varchar(255) DEFAULT NULL,
  `year_id` varchar(100) DEFAULT NULL,
  `inq_type` varchar(100) DEFAULT NULL,
  `visited_date` varchar(100) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `grd_name` varchar(100) DEFAULT NULL,
  `grd_relation` varchar(100) DEFAULT NULL,
  `gdr_office_no` varchar(100) DEFAULT NULL,
  `grd_mobileno` varchar(100) DEFAULT NULL,
  `grd_email` varchar(100) DEFAULT NULL,
  `previous_remarks` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inquiry`
--

INSERT INTO `inquiry` (`id`, `inquiry_no`, `year_id`, `inq_type`, `visited_date`, `branch_id`, `class_id`, `section_id`, `category_id`, `first_name`, `last_name`, `gender`, `grd_name`, `grd_relation`, `gdr_office_no`, `grd_mobileno`, `grd_email`, `previous_remarks`, `created_at`, `updated_at`) VALUES
(2, 'RSM-00001', '3', 'admission', '2020-11-25', 1, 1, 1, 1, 'Muhammad', 'Omer', 'male', '', '', '', '+443054348474', 'iamomerbhutta@gmail.com', '', '2020-11-25 23:55:56', '2020-11-25 23:55:56'),
(5, 'RSM-00005', '3', 'admission', '2020-11-25', 1, 2, 1, 2, 'Omer', 'Bhutta', 'male', 'Mr Faiz', 'Father', '1231231123', '+443054348474', 'iamomerbhutta@gmail.com', 'hello world.', '2020-11-26 01:20:18', '2020-11-26 01:20:18'),
(10, 'RSM-00006', '3', 'admission', '2020-11-25', 1, 1, 1, 0, 'Test', 'test', 'male', '', '', '', '3333333333', 'test@test.com', '', '2020-11-26 02:03:15', '2020-11-26 02:03:15');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `word` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `english` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bengali` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `arabic` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `french` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hindi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `indonesian` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `italian` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `japanese` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `korean` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dutch` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `portuguese` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thai` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `turkish` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `urdu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `chinese` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `afrikaans` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `german` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `greek` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `spanish` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nepali` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `russian` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `danish` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `armenian` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `georgian` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `marathi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `malay` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `punjabi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tamil` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telugu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `swedish` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filipino` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `word`, `english`, `bengali`, `arabic`, `french`, `hindi`, `indonesian`, `italian`, `japanese`, `korean`, `dutch`, `portuguese`, `thai`, `turkish`, `urdu`, `chinese`, `afrikaans`, `german`, `greek`, `spanish`, `nepali`, `russian`, `danish`, `armenian`, `georgian`, `marathi`, `malay`, `punjabi`, `tamil`, `telugu`, `swedish`, `filipino`) VALUES
(1, 'language', 'Language', 'ভাষা', 'لغة', 'La langue', 'भाषा', 'Bahasa', 'Lingua', '言語', '언어', 'Taal', 'Língua', 'ภาษา', 'Dil', 'زبان', '语言', 'Taal', 'Sprache', 'Γλώσσα', 'Idioma', 'भाषा', 'язык', 'Sprog', 'Լեզու', 'Ენა', 'इंग्रजी', 'Bahasa', 'ਭਾਸ਼ਾ', 'மொழி', 'భాషా', 'Språk', 'Wika'),
(2, 'attendance_overview', 'Attendance Overview', 'উপস্থিতি পরিদর্শন', 'نظرة عامة على الحضور', 'Aperçu de la fréquentation', 'उपस्थिति अवलोकन', 'Ikhtisar Kehadiran', 'Panoramica delle presenze', '出席の概要', '출석 개요', 'Aanwezigheid Overzicht', 'Visão geral de participação', 'ภาพรวมการเข้าร่วม', 'Seyirci Genel Bakış', 'حاضری جائزہ', '出勤概览', 'Bywoning Oorsig', 'Anwesenheitsübersicht', 'Επισκόπηση παρακολούθησης', 'Resumen de asistencia', 'उपस्थिति अवलोकन', 'Обзор посещаемости', 'Deltagelsesoversigt', 'Մասնակցության ակնարկ', 'დასწრების მიმოხილვა', 'उपस्थिती विहंगावलोकन', 'Tinjauan Kehadiran', 'ਹਾਜ਼ਰੀ ਬਾਰੇ ਸੰਖੇਪ ਜਾਣਕਾਰੀ', 'வருகை கண்ணோட்டம்', 'హాజరు అవలోకనం', 'Översikt över närvaro', 'Pangkalahatang Pangkalahatang-ideya'),
(3, 'annual_fee_summary', 'Annual Fee Summary', 'বার্ষিক ফি সংক্ষিপ্ত বিবরণ', 'ملخص الرسوم السنوية', 'Résumé des frais annuels', 'वार्षिक शुल्क सारांश', 'Ringkasan Biaya Tahunan', 'Riepilogo della tariffa annuale', '年会費サマリー', '연회비 요약', 'Annual Fee Summary', 'Resumo da taxa anual', 'สรุปค่าธรรมเนียมรายปี', 'Yıllık Ücret Özeti', 'سالانہ فیس خلاصہ', '年费摘要', 'Jaarlikse fooiopsomming', 'Jährliche Gebührenübersicht', 'Περίληψη ετήσιων χρεώσεων', 'Resumen anual de tarifas', 'वार्षिक शुल्क सारांश', 'Ежегодный сбор', 'Årlig gebyroversigt', 'Տարեկան վճարների ամփոփում', 'წლიური საფასურის შეჯამება', 'वार्षिक फी सारांश', 'Ringkasan Yuran Tahunan', 'ਸਾਲਾਨਾ ਫੀਸ ਦਾ ਸਾਰ', 'ஆண்டு கட்டண சுருக்கம்', 'వార్షిక రుసుము సారాంశం', 'Årlig avgiftsöversikt', 'Pangkalahatang Buod ng Bayad'),
(4, 'my_annual_attendance_overview', 'My Annual Attendance Overview', 'আমার বার্ষিক উপস্থিতি পরিদর্শন', 'حضري السنوي نظرة عامة', 'Mon assiduité annuelle', 'मेरी वार्षिक उपस्थिति अवलोकन', 'Ikhtisar Kehadiran Tahunan Saya', 'La mia panoramica sulla partecipazione annuale', '私の年次出席者の概要', '내 연간 출석 개요', 'Mijn jaarlijkse aanwezigheidsoverzicht', 'Minha visão geral de comparecimento anual', 'ภาพรวมการเข้าร่วมประชุมประจำปีของฉัน', 'Yıllık Katılıma Genel Bakış', 'میرا سالانہ حاضری جائزہ', '我的年度出勤情况概述', 'My oorsig oor die jaarlikse bywoning', 'Meine jährliche Anwesenheitsübersicht', 'Επισκόπηση της ετήσιας παρουσίας μου', 'Resumen de mi asistencia anual', 'मेरो वार्षिक उपस्थिति अवलोकन', 'Мой ежегодный обзор посещаемости', 'Min årlige fremmøde-oversigt', 'Իմ տարեկան մասնակցության ակնարկը', 'ჩემი წლიური დასწრების მიმოხილვა', 'माझे वार्षिक उपस्थिती विहंगावलोकन', 'Gambaran Keseluruhan Kehadiran Tahunan Saya', 'ਮੇਰੀ ਸਲਾਨਾ ਹਾਜ਼ਰੀ ਬਾਰੇ ਸੰਖੇਪ ਜਾਣਕਾਰੀ', 'எனது வருடாந்திர வருகை கண்ணோட்டம்', 'నా వార్షిక హాజరు అవలోకనం', 'Min årliga närvaroöversikt', 'Aking Pangkalahatang Pangkalahatang Pangkalahatang-ideya'),
(5, 'schedule', 'Schedule', 'সময়সূচী', 'جداول', 'des horaires', 'कार्यक्रम', 'jadwal', 'orari', 'スケジュール', '일정', 'schema', 'horários', 'ตารางเวลา', 'programları', 'شیڈولز', '时间表', 'skedule', 'Zeitplan', 'Πρόγραμμα', 'Calendario', 'तालिका', 'График', 'Tidsplan', 'Ժամանակացույց', 'გრაფიკი', 'वेळापत्रक', 'Jadual', 'ਸਮਾਸੂਚੀ, ਕਾਰਜ - ਕ੍ਰਮ', 'அட்டவணை', 'షెడ్యూల్', 'Schema', 'Iskedyul'),
(6, 'student_admission', 'Student Admission', 'ছাত্র ভর্তি', 'قبول الطلاب', 'Admission des étudiants', 'छात्र प्रवेश', 'Penerimaan Mahasiswa', 'Ammissione degli studenti', '学生の入場', '학생 입장', 'Studenten toelating', 'Admissão de estudantes', 'การรับนักศึกษา', 'Öğrenci Kabulü', 'طالب علم داخلہ', '学生入学', 'Studentetoelating', 'Studentenzulassung', 'Εισαγωγή φοιτητών', 'Admisión de estudiantes', 'विद्यार्थी प्रवेश', 'Прием студентов', 'Studentoptagelse', 'Ուսանողների ընդունելություն', 'სტუდენტთა დაშვება', 'विद्यार्थी प्रवेश', 'Kemasukan Pelajar', 'ਵਿਦਿਆਰਥੀ ਦਾਖਲਾ', 'மாணவர் சேர்க்கை', 'విద్యార్థుల ప్రవేశం', 'Student antagning', 'Pag-aaral ng Mag-aaral'),
(7, 'returned', 'Returned', 'ফেরৎ', 'عاد', 'Revenu', 'लौटा हुआ', 'Kembali', 'tornati', '戻ってきた', '반품 됨', 'teruggekeerd', 'Devolvida', 'กลับ', 'İade', 'واپسی', '回', 'Teruggekeer', 'Ist zurückgekommen', 'Επέστρεψαν', 'Devuelto', 'फिर्ता', 'возвращенный', 'Vendt tilbage', 'Վերադարձավ', 'დაბრუნდა', 'परत आले', 'Dikembalikan', 'ਵਾਪਸ ਆ', 'திரும்பினார்', 'రిటర్న్డ్', 'Returnerad', 'Ibinalik'),
(8, 'user_name', 'User Name', 'ব্যবহারকারীর নাম', 'اسم المستخدم', 'Nom d\'utilisateur', 'उपयोगकर्ता नाम', 'Nama pengguna', 'Nome utente', 'ユーザー名', '사용자 이름', 'Gebruikersnaam', 'Nome de usuário', 'ชื่อผู้ใช้', 'Kullanıcı adı', 'صارف کا نام', '用户名', 'Gebruikersnaam', 'Nutzername', 'Ονομα χρήστη', 'Nombre de usuario', 'प्रयोगकर्ता नाम', 'Имя пользователя', 'Brugernavn', 'Օգտագործողի անունը', 'მომხმარებლის სახელი', 'वापरकर्त्याचे नाव', 'Nama Pengguna', 'ਉਪਭੋਗਤਾ ਨਾਮ', 'பயனர் பெயர்', 'వినియోగదారు పేరు', 'Användarnamn', 'Pangalan ng Gumagamit'),
(9, 'rejected', 'Rejected', 'প্রত্যাখ্যাত', 'مرفوض', 'Rejeté', 'अस्वीकृत', 'Ditolak', 'Respinto', '拒否された', '거부 됨', 'Verworpen', 'Rejeitado', 'ปฏิเสธ', 'Reddedilen', 'مسترد', '拒绝', 'verwerp', 'Abgelehnt', 'Απορρίφθηκε', 'Rechazado', 'अस्वीकृत', 'Отклонено', 'afvist', 'Մերժվեց', 'უარყო', 'नाकारले', 'Ditolak', 'ਅਸਵੀਕਾਰ ਕਰ ਦਿੱਤਾ', 'நிராகரிக்கப்பட்டது', 'తిరస్కరించబడిన', 'avvisade', 'Tinanggihan'),
(10, 'route_name', 'Route Name', 'রুট নাম', 'اسم المسار', 'Nom de l\'itinéraire', 'रूट नाम', 'Nama rute', 'Nome della rotta', 'ルート名', '경로 이름', 'Route Name', 'Nome da rota', 'ชื่อเส้นทาง', 'Rota Adı', 'روٹ کا نام', '路线名称', 'Roete Naam', 'Routenname', 'Όνομα διαδρομής', 'Nombre de ruta', 'मार्ग नाम', 'Название маршрута', 'Rute Navn', 'Երթուղու անուն', 'მარშრუტის სახელი', 'मार्ग नाव', 'Nama Laluan', 'ਮਾਰਗ ਦਾ ਨਾਮ', 'பாதை பெயர்', 'మార్గం పేరు', 'Ruttnamn', 'Pangalan ng Ruta'),
(11, 'route_fare', 'Route Fare', 'রুট ভাড়া', 'الطريق الأجرة', 'Tarif d\'itinéraire', 'रूट किराया', 'Tarif rute', 'Route Fare', 'ルート運賃', '노선 요금', 'Route Tarief', 'Tarifa da rota', 'ค่าโดยสารเส้นทาง', 'Yol Ücreti', 'راستے کی قسم', '路线票价', 'Roete tarief', 'Routentarif', 'Ναύλος διαδρομής', 'Tarifa de ruta', 'मार्ग भाडा', 'Маршрут Тариф', 'Rute Fare', 'Երթուղայինի ուղեվարձ', 'მარშრუტი', 'मार्ग भाडे', 'Tambang Laluan', 'ਰਸਤਾ ਕਿਰਾਇਆ', 'பாதை கட்டணம்', 'రూట్ ఛార్జీలు', 'Ruttavgift', 'Bayad na Bayad'),
(12, 'edit_route', 'Edit Route', 'সম্পাদন করা রুট', 'تحرير المسار', 'Modifier la route', 'मार्ग संपादित करें', 'Edit rute', 'Modifica la rotta', '経路を編集する', '경로 편집', 'Route bewerken', 'Editar rota', 'แก้ไขเส้นทาง', 'Rotayı düzenle', 'راستے میں ترمیم کریں', '编辑路线', 'Wysig roete', 'Route bearbeiten', 'Επεξεργασία διαδρομής', 'Editar ruta', 'मार्ग सम्पादन गर्नुहोस्', 'Изменить маршрут', 'Rediger rute', 'Խմբագրել երթուղին', 'შეცვალეთ მარშრუტი', 'मार्ग संपादित करा', 'Edit Laluan', 'ਮਾਰਗ ਸੰਪਾਦਿਤ ਕਰੋ', 'வழியைத் திருத்து', 'మార్గాన్ని సవరించండి', 'Redigera rutt', 'I-edit ang Ruta'),
(13, 'this_value_is_required', 'This value is required.', 'এই মান প্রয়োজন', 'هذه القيمة مطلوبة', 'Cette valeur est requise', 'यह मान आवश्यक है', 'Nilai ini diperlukan', 'Questo valore è richiesto', 'この値は必須です', '이 값은 필수 항목입니다.', 'Deze waarde is vereist', 'Este valor é obrigatório', 'จำเป็นต้องใช้ค่านี้', 'Bu değer gerekli', 'یہ قیمت کی ضرورت ہے', '该值是必需的', 'Hierdie waarde word benodig.', 'Dieser Wert ist erforderlich.', 'Αυτή η τιμή απαιτείται.', 'Este valor es obligatorio.', 'यो मान आवश्यक छ।', 'Это значение обязательно.', 'Denne værdi er påkrævet.', 'Այս արժեքը պահանջվում է:', 'ეს მნიშვნელობა საჭიროა.', 'हे मूल्य आवश्यक आहे.', 'Nilai ini diperlukan.', 'ਇਹ ਮੁੱਲ ਲੋੜੀਂਦਾ ਹੈ.', 'இந்த மதிப்பு தேவை.', 'ఈ విలువ అవసరం.', 'Detta värde krävs.', 'Kinakailangan ang halagang ito.'),
(14, 'vehicle_no', 'Vehicle No', 'যানবাহন নং', 'السيارة لا', 'Numéro de véhicule', 'वाहन नंबर', 'Kendaraan No', 'N', '車両番号', '차량 번호', 'Voertuignummer', 'Veículo não', 'หมายเลขยานพาหนะ', 'Araç Hayır', 'گاڑی نمبر', '车号', 'Voertuig no', 'Fahrzeug Nr', 'Όχημα αριθ', 'No vehiculo', 'सवारी संख्या', 'Автомобиль №', 'Køretøjsnr', 'Տրանսպորտային միջոցը ոչ', 'მანქანა არა', 'वाहन क्रमांक', 'Kenderaan No.', 'ਵਾਹਨ ਨੰ', 'வாகன எண்', 'వాహన సంఖ్య', 'Fordon nr', 'Sasakyan Hindi'),
(15, 'insurance_renewal_date', 'Insurance Renewal Date', 'বীমা নবায়ন তারিখ', 'تاريخ تجديد التأمين', 'Date de renouvellement de l&#39;assurance', 'बीमा नवीकरण तिथि', 'Tanggal perpanjangan asuransi', 'Data di rinnovo dell\'assicurazione', '保険更新日', '보험 갱신일', 'Verzekering Vernieuwingsdatum', 'Data de renovação do seguro', 'วันที่ต่ออายุการประกัน', 'Sigorta Yenileme Tarihi', 'انشورنس کی بحالی کی تاریخ', '保险续期', 'Datum van verlenging van versekering', 'Verlängerungsdatum der Versicherung', 'Ημερομηνία ανανέωσης ασφάλισης', 'Fecha de renovación del seguro', 'बीमा नवीकरण मिति', 'Дата обновления страховки', 'Fornyelsesdato for forsikring', 'Ապահովագրության նորացման ամսաթիվ', 'დაზღვევის განახლების თარიღი', 'विमा नूतनीकरण तारीख', 'Tarikh Pembaharuan Insurans', 'ਬੀਮਾ ਨਵੀਨੀਕਰਨ ਦੀ ਮਿਤੀ', 'காப்பீட்டு புதுப்பித்தல் தேதி', 'భీమా పునరుద్ధరణ తేదీ', 'Försäkringsdatum', 'Petsa ng Pagbabago ng Seguro'),
(16, 'driver_name', 'Driver Name', 'ড্রাইভারের নাম', 'اسم السائق', 'Nom du conducteur', 'चालक का नाम', 'Nama Driver', 'Nome del driver', 'ドライバ名', '드라이버 이름', 'Naam van de bestuurder', 'Nome do motorista', 'ชื่อไดร์เวอร์', 'Sürücü Adı', 'ڈرائیور کا نام', '驱动程序名称', 'Bestuurder se naam', 'Fahrername', 'Όνομα προγράμματος οδήγησης', 'Nombre del conductor', 'ड्राइभरको नाम', 'Имя водителя', 'Drivernavn', 'Վարորդի անուն', 'მძღოლის სახელი', 'ड्रायव्हरचे नाव', 'Nama Pemandu', 'ਡਰਾਈਵਰ ਦਾ ਨਾਮ', 'இயக்கி பெயர்', 'డ్రైవర్ పేరు', 'Förarens namn', 'Pangalan ng driver'),
(17, 'driver_license', 'Driver License', 'চালকের অনুমোদন', 'رخصة قيادة', 'Permis de conduire', 'चालक लाइसेंस', 'SIM', 'Patente di guida', '運転免許証', '운전 면허증', 'Rijbewijs', 'Carteira de motorista', 'ใบอนุญาตขับรถ', 'Ehliyet', 'ڈرائیور لائسنس', '驾照', 'Bestuurslisensie', 'Führerschein', 'Αδεια οδήγησης', 'Licencia de conducir', 'ड्राइभर इजाजतपत्र', 'Водительское удостоверение', 'Kørekort', 'Վարորդի լիցենզիա', 'მართვის მოწმობა', 'चालक परवाना', 'Lesen memandu', 'ਡਰਾਈਵਰ ਲਾਇਸੈਂਸ', 'வாகன ஒட்டி உரிமம்', 'డ్రైవర్ లైసెన్స్', 'Körkort', 'Lisensiya sa pagmamaneho'),
(18, 'select_route', 'Select Route', 'রুট নির্বাচন করুন', 'حدد الطريق', 'Sélectionnez l\'itinéraire', 'मार्ग चुनें', 'Pilih Rute', 'Seleziona Route', 'ルートを選択', '경로 선택', 'Selecteer Route', 'Selecione a rota', 'เลือกเส้นทาง', 'Rotayı seçin', 'راستہ منتخب کریں', '选择路线', 'Kies roete', 'Wählen Sie Route', 'Επιλέξτε Διαδρομή', 'Seleccionar ruta', 'मार्ग चयन गर्नुहोस्', 'Выберите маршрут', 'Vælg rute', 'Ընտրեք երթուղին', 'აირჩიეთ მარშრუტი', 'मार्ग निवडा', 'Pilih Laluan', 'ਰਸਤਾ ਚੁਣੋ', 'வழியைத் தேர்ந்தெடுக்கவும்', 'మార్గం ఎంచుకోండి', 'Välj rutt', 'Piliin ang Ruta'),
(19, 'edit_vehicle', 'Edit Vehicle', 'যানবাহন সম্পাদনা করুন', 'تحرير السيارة', 'Modifier le véhicule', 'वाहन संपादित करें', 'Edit Kendaraan', 'Modifica il veicolo', '車両の編集', '차량 편집', 'Bewerk voertuig', 'Editar veículo', 'แก้ไขยานพาหนะ', 'Aracı Düzenle', 'گاڑیاں ترمیم کریں', '编辑车辆', 'Wysig voertuig', 'Fahrzeug bearbeiten', 'Επεξεργασία οχήματος', 'Editar vehículo', 'वाहन सम्पादन गर्नुहोस्', 'Изменить автомобиль', 'Rediger køretøj', 'Խմբագրել մեքենան', 'შეცვალეთ მანქანა', 'वाहन संपादित करा', 'Edit Kenderaan', 'ਵਾਹਨ ਸੋਧੋ', 'வாகனத்தைத் திருத்து', 'వాహనాన్ని సవరించండి', 'Redigera fordon', 'I-edit ang Sasakyan'),
(20, 'add_students', 'Add Students', 'ছাত্রদের যোগ করুন', ' إضافة الطلاب', 'Ajouter des étudiants', 'छात्र जोड़ें', 'Tambahkan Siswa', 'Aggiungere gli studenti', '学生を追加する', '학생 추가', 'Voeg studenten toe', 'Adicionar alunos', 'เพิ่มนักเรียน', 'Öğrenci ekle', 'طالب علموں کو شامل کریں', '添加学生', 'Voeg studente by', 'Schüler hinzufügen', 'Προσθήκη μαθητών', 'Agregar alumnos', 'विद्यार्थीहरू थप्नुहोस्', 'Добавить студентов', 'Tilføj studerende', 'Ավելացնել ուսանողներին', 'დაამატეთ სტუდენტები', 'विद्यार्थी जोडा', 'Tambah Pelajar', 'ਵਿਦਿਆਰਥੀ ਸ਼ਾਮਲ ਕਰੋ', 'மாணவர்களைச் சேர்க்கவும்', 'విద్యార్థులను జోడించండి', 'Lägg till studenter', 'Idagdag ang mga Mag-aaral'),
(21, 'vehicle_number', 'Vehicle Number', 'যানবাহন সংখ্যা', 'عدد المركبات', 'Numéro de véhicule', 'वाहन संख्या', 'Nomor kendaraan', 'Numero di veicolo', '車両番号', '차량 번호', 'Voertuignummer', 'Número do veículo', 'หมายเลขยานพาหนะ', 'Araç Numarası', 'گاڑی نمبر', '车号', 'Voertuig nommer', 'Fahrzeugnummer', 'Αριθμός οχήματος', 'Número de vehículo', 'सवारी संख्या', 'Номер автомобиля', 'Køretøjsnummer', 'Տրանսպորտային միջոցների համարը', 'ავტომობილის ნომერი', 'वाहन क्रमांक', 'Nombor Kenderaan', 'ਵਾਹਨ ਨੰਬਰ', 'வாகன எண்', 'వాహన సంఖ్య', 'Fordonsnummer', 'Numero ng Sasakyan'),
(22, 'select_route_first', 'Select Route First', 'রুট প্রথম নির্বাচন করুন', 'حدد الطريق أولا', 'Sélectionnez l\'itinéraire d\'abord', 'मार्ग पहले चुनें', 'Pilih Rute Pertama', 'Seleziona Route First', '最初にルートを選択', '경로 우선 선택', 'Selecteer Route First', 'Selecione a rota primeiro', 'เลือกเส้นทางแรก', 'Önce Güzergahı seçin', 'راستہ منتخب کریں', '选择路由优先', 'Kies eers roete', 'Wählen Sie Route zuerst', 'Επιλέξτε πρώτα διαδρομή', 'Seleccione la ruta primero', 'पहिलो मार्ग चयन गर्नुहोस्', 'Сначала выберите маршрут', 'Vælg rute først', 'Ընտրեք երթուղին նախ', 'აირჩიეთ მარშრუტი პირველი', 'प्रथम मार्ग निवडा', 'Pilih Laluan Pertama', 'ਪਹਿਲਾਂ ਰਸਤਾ ਚੁਣੋ', 'முதலில் பாதையைத் தேர்ந்தெடுக்கவும்', 'మొదట మార్గం ఎంచుకోండి', 'Välj rutt först', 'Piliin muna ang Ruta'),
(23, 'transport_fee', 'Transport Fee', 'পরিবহন ফি', 'مصاريف الشحن', 'Frais de transport', 'परिवहन शुल्क', 'Biaya transportasi', 'Tassa di trasporto', '運賃', '운송비', 'Transportkosten', 'Tarifa de transporte', 'ค่าธรรมเนียมการขนส่ง', 'Taşıma ücreti', 'ٹرانسپورٹ فیس', '运费', 'Vervoerfooi', 'Transportkosten', 'Τέλος μεταφοράς', 'Tarifa de transporte', 'यातायात शुल्क', 'Транспортный сбор', 'Transportgebyr', 'Տրանսպորտի վճար', 'ტრანსპორტის საფასური', 'परिवहन शुल्क', 'Bayaran Pengangkutan', 'ਟਰਾਂਸਪੋਰਟ ਫੀਸ', 'போக்குவரத்து கட்டணம்', 'రవాణా రుసుము', 'Transport avgift', 'Pamasahe'),
(24, 'control', 'Control', 'নিয়ন্ত্রণ', 'مراقبة', 'contrôle', 'नियंत्रण', 'kontrol', 'controllo', 'コントロール', '제어', 'controle', 'ao controle', 'ควบคุม', 'kontrol', 'قابو', '控制', 'beheer', 'Steuerung', 'Ελεγχος', 'Control', 'नियन्त्रण', 'контроль', 'Styring', 'Հսկողություն', 'კონტროლი', 'नियंत्रण', 'Kawal', 'ਨਿਯੰਤਰਣ', 'கட்டுப்பாடு', 'కంట్రోల్', 'Kontrollera', 'Kontrol'),
(25, 'set_students', 'Set Students', 'ছাত্রদের সেট করুন', 'تعيين الطلاب', 'Mettre les élèves', 'छात्रों को सेट करें', 'Set siswa', 'Impostare gli studenti', '生徒を設定する', '학생 배치', 'Studenten stellen', 'Definir estudantes', 'ตั้งนักเรียน', 'Öğrencileri ayarla', 'طلبا قائم کریں', '设置学生', 'Stel studente', 'Schüler einstellen', 'Ορίστε μαθητές', 'Establecer estudiantes', 'विद्यार्थी सेट गर्नुहोस्', 'Набор студентов', 'Sæt studerende', 'Սահմանել ուսանողներին', 'მითითებული სტუდენტები', 'विद्यार्थी सेट करा', 'Tetapkan Pelajar', 'ਵਿਦਿਆਰਥੀ ਸੈੱਟ ਕਰੋ', 'மாணவர்களை அமைக்கவும்', 'విద్యార్థులను సెట్ చేయండి', 'Ställ in studenter', 'Itakda ang mga Mag-aaral'),
(26, 'hostel_list', 'Hostel List', 'হোস্টেল তালিকা', 'قائمة نزل', 'Liste d\'auberges', 'छात्रावास सूची', 'Daftar hostel', 'Lista degli ostelli', 'ホステルリスト', '호스텔리스트', 'Hostel lijst', 'Lista de albergue', 'รายการที่พัก', 'Hostel listesi', 'ہاسٹل فہرست', '旅馆列表', 'Koshuislys', 'Hostel List', 'Λίστα ξενώνων', 'Lista de albergues', 'छात्रावास सूची', 'Список хостелов', 'Hostel List', 'Հանրակացարանի ցուցակ', 'ჰოსტელის სია', 'वसतिगृहाची यादी', 'Senarai Asrama', 'ਹੋਸਟਲ ਦੀ ਸੂਚੀ', 'விடுதி பட்டியல்', 'హాస్టల్ జాబితా', 'Vandrarhemslista', 'Listahan ng Hostel'),
(27, 'watchman_name', 'Watchman Name', 'ওয়াচম্যান নাম', 'اسم الحارس', 'Nom du gardien', 'वॉचमेन का नाम', 'Nama Watchman', 'Nome guardiano', 'ウォッチマン名', '경비원 이름', 'Watchman Naam', 'Nome do Vigilante', 'ชื่อผู้ดูแล', 'Bekçi adını', 'واچ مین کا نام', '守望者姓名', 'Wagman Naam', 'Name des Wächters', 'Όνομα φύλακα', 'Nombre del vigilante', 'प्रहरीको नाम', 'Имя сторожа', 'Vagtmandens navn', 'Պահակախմբի անուն', 'გუშაგის სახელი', 'वॉचमन नाव', 'Nama Pengawas', 'ਚੌਕੀਦਾਰ ਦਾ ਨਾਮ', 'காவலாளி பெயர்', 'కాపలాదారు పేరు', 'Watchman Name', 'Pangalan ng Watchman'),
(28, 'hostel_address', 'Hostel Address', 'হোস্টেল ঠিকানা', 'عنوان الفندق', 'Adresse de l\'auberge', 'छात्रावास का पता', 'Alamat hostel', 'Indirizzo dell\'ostello', 'ホステルアドレス', '호스텔 주소', 'Hostel adres', 'Endereço do albergue', 'ที่อยู่หอพัก', 'Hostel adresi', 'ہاسٹل ایڈریس', '宿舍地址', 'Koshuisadres', 'Hostel Adresse', 'Διεύθυνση ξενώνα', 'Dirección del albergue', 'होस्टल ठेगाना', 'Адрес хостела', 'Vandrerhjem Adresse', 'Հանրակացարանի հասցե', 'ჰოსტელის მისამართი', 'वसतिगृहाचा पत्ता', 'Alamat Asrama', 'ਹੋਸਟਲ ਦਾ ਪਤਾ', 'விடுதி முகவரி', 'హాస్టల్ చిరునామా', 'Vandrarhem Adress', 'Address ng Hostel'),
(29, 'edit_hostel', 'Edit Hostel', 'হোস্টেল সম্পাদনা করুন', 'تحرير نزل', 'Modifier hostel', 'होस्टल संपादित करें', 'edit hostel', 'Modifica ostello', 'ホステルを編集', '호스텔을 편집하다', 'Wijzig hostel', 'Editar albergue', 'แก้ไขหอพัก', 'Hostel düzenlemek', 'ہاسٹلز میں ترمیم کریں', '编辑宿舍', 'Bewys koshuis', 'Edit Hostel', 'Επεξεργασία ξενώνα', 'Editar albergue', 'होस्टल सम्पादन गर्नुहोस्', 'Редактировать Хостел', 'Rediger Hostel', 'Խմբագրել հանրակացարանը', 'ჰოსტელის რედაქტირება', 'वसतिगृह संपादित करा', 'Edit Hostel', 'ਹੋਸਟਲ ਸੋਧੋ', 'விடுதி திருத்து', 'హాస్టల్‌ను సవరించండి', 'Redigera vandrarhem', 'I-edit ang Hostel'),
(30, 'room_name', 'Room Name', 'রুমের নাম', 'اسم الغرفة', 'Nom de la salle', 'कमरे का नाम', 'Nama ruangan', 'Nome della stanza', 'ルーム名', '방 이름', 'Kamer naam', 'Nome da sala', 'ชื่อห้อง', 'Oda ismi', 'کمرہ کا نام', '房间名称', 'Kamer Naam', 'Raumname', 'Ονομα δωματίου', 'Nombre de la habitación', 'कोठाको नाम', 'Название комнаты', 'Værelsesnavn', 'Սենյակի անվանումը', 'ოთახის სახელი', 'खोलीचे नाव', 'Nama Bilik', 'ਕਮਰੇ ਦਾ ਨਾਮ', 'அறை பெயர்', 'గది పేరు', 'Rumsnamn', 'Pangalan ng Silid'),
(31, 'no_of_beds', 'No Of Beds', 'শয্যা সংখ্যা', 'عدد الأسرة', 'Nombre de lits', 'बेड की संख्या', 'Jumlah tempat tidur', 'Numero di letti', 'ベッド数', '침대 수', 'Aantal bedden', 'Número de leitos', 'จำนวนเตียง', 'Yatak sayısı', 'بستروں کی تعداد', '床数', 'Aantal beddens', 'Anzahl der Betten', 'Αριθμός κρεβατιών', 'No de camas', 'बेडहरूको संख्या छैन', 'Количество кроватей', 'Antal senge', 'Ոչ մահճակալներ', 'არა საწოლები', 'बेडांची संख्या', 'Tanpa Katil', 'ਬਿਸਤਰੇ ਦੀ ਕੋਈ', 'படுக்கைகள் இல்லை', 'పడకల సంఖ్య', 'Antal sängar', 'Walang Ng Beds'),
(32, 'select_hostel_first', 'Select Hostel First', 'হোস্টেল প্রথম নির্বাচন করুন', 'حدد نزل أولا', 'Sélectionnez l\'auberge en premier', 'हॉस्टल का पहला चयन करें', 'Pilih hostel dulu', 'Selezionare l\'ostello prima', '最初にホステルを選択', '호스텔을 먼저 선택하십시오.', 'Selecteer eerst hostel', 'Selecione albergue primeiro', 'เลือกโฮสเทลก่อน', 'Önce pansiyon seç', 'سب سے پہلے ہاسٹل منتخب کریں', '先选择宿舍', 'Kies Hostel eerste', 'Wählen Sie zuerst Hostel', 'Επιλέξτε πρώτα το Hostel', 'Seleccione el albergue primero', 'छात्रावास प्रथम चयन गर्नुहोस्', 'Сначала выберите Хостел', 'Vælg Hostel First', 'Առաջին ընտրեք հանրակացարան', 'აირჩიეთ ჰოსტელი პირველი', 'प्रथम वसतिगृह निवडा', 'Pilih Asrama Pertama', 'ਹੋਸਟਲ ਫਸਟ ਦੀ ਚੋਣ ਕਰੋ', 'முதலில் ஹாஸ்டலைத் தேர்ந்தெடுக்கவும்', 'మొదట హాస్టల్ ఎంచుకోండి', 'Välj vandrarhem först', 'Piliin ang Hostel Una'),
(33, 'remaining', 'Remaining', 'অবশিষ্ট', 'متبق', 'Restant', 'शेष', 'Tersisa', 'Rimanente', '残り', '남은', 'resterende', 'Restante', 'ที่เหลืออยู่', 'Kalan', 'باقی', '剩余', 'oorblywende', 'Verbleibend', 'Παραμένων', 'Restante', 'शेष', 'осталось', 'Resterende', 'Մնաց', 'დარჩენილი', 'शिल्लक आहे', 'Kekal', 'ਬਾਕੀ', 'மீதமுள்ள', 'మిగిలిన', 'Återstående', 'Nananatili'),
(34, 'hostel_fee', 'Hostel Fee', 'হোস্টেল ফি', 'رسوم النزل', 'Tarif de l\'auberge', 'छात्रावास शुल्क', 'Biaya hostel', 'Tariffa ostello', 'ホステル料金', '호스텔 요금', 'Hostel kosten', 'Taxa de albergue', 'ค่าหอพัก', 'Hostel ücreti', 'میزبان فیس', '宿舍费', 'Koshuisgeld', 'Hostel Fee', 'Χρέωση ξενώνα', 'Tarifa de albergue', 'छात्रावास शुल्क', 'Плата за хостел', 'Vandrehjemgebyr', 'Հոսթելային վճար', 'ჰოსტელის საფასური', 'वसतिगृह फी', 'Bayaran Asrama', 'ਹੋਸਟਲ ਫੀਸ', 'விடுதி கட்டணம்', 'హాస్టల్ ఫీజు', 'Vandrarhem avgift', 'Bayad sa Hostel'),
(35, 'accountant_list', 'Accountant List', 'অ্যাকাউন্টেন্ট তালিকা', 'قائمة المحاسبين', 'Liste comptable', 'लेखाकार सूची', 'Daftar akuntan', 'Elenco dei contabili', '会計士リスト', '회계사 목록', 'Accountant lijst', 'Lista de contadores', 'บัญชีรายชื่อ', 'Muhasebeci listesi', 'اکاؤنٹنٹ کی فہرست', '会计清单', 'Rekenmeesterslys', 'Buchhalterliste', 'Λίστα λογιστών', 'Lista de contadores', 'लेखाकार सूची', 'Список бухгалтера', 'Revisorliste', 'Հաշվապահների ցուցակ', 'ბუღალტრის სია', 'अकाउंटंट यादी', 'Senarai Akauntan', 'ਲੇਖਾਕਾਰ ਸੂਚੀ', 'கணக்காளர் பட்டியல்', 'అకౌంటెంట్ జాబితా', 'Bokföringslista', 'Listahan ng Accountant'),
(36, 'students_fees', 'Students Fees', 'ছাত্র ফি', 'رسوم الطلاب', 'Frais d\'étudiants', 'छात्रों की फीस', 'Biaya siswa', 'Le tasse degli studenti', '学生手数料', '학생 비용', 'Studentenkosten', 'Taxas de estudantes', 'ค่าธรรมเนียมนักศึกษา', 'Öğrenci ücretleri', 'طالب علموں کی فیس', '学费', 'Studiegelde', 'Studentengebühren', 'Τέλη μαθητών', 'Tarifas de estudiantes', 'विद्यार्थी शुल्क', 'Студенческие сборы', 'Studerendes gebyrer', 'Ուսանողների վարձավճարները', 'სტუდენტების საფასური', 'विद्यार्थ्यांची फी', 'Yuran Pelajar', 'ਵਿਦਿਆਰਥੀਆਂ ਦੀਆਂ ਫੀਸਾਂ', 'மாணவர்களின் கட்டணம்', 'విద్యార్థుల ఫీజు', 'Studentavgifter', 'Mga Bayad sa Mag-aaral'),
(37, 'fees_status', 'Fees Status', 'ফি স্থিতি', 'حالة الرسوم', 'Statut des frais', 'फीस की स्थिति', 'Status biaya', 'Status dei diritti', '手数料ステータス', '수수료 상태', 'Tarieven status', 'Status de tarifas', 'สถานะค่าธรรมเนียม', 'Ücret durumu', 'فیس کی حیثیت', '费用状况', 'Gelde status', 'Gebührenstatus', 'Κατάσταση τελών', 'Estado de tarifas', 'शुल्क स्थिति', 'Статус сборов', 'Gebyrer Status', 'Վճարների կարգավիճակը', 'საფასურის სტატუსი', 'शुल्काची स्थिती', 'Status Yuran', 'ਫੀਸ ਸਥਿਤੀ', 'கட்டணம் நிலை', 'ఫీజు స్థితి', 'Avgiftsstatus', 'Katayuan ng Bayad'),
(38, 'books', 'Books', 'বই', 'الكتب', 'livres', 'पुस्तकें', 'Buku', 'libri', '本', '서적', 'boeken', 'Livros', 'หนังสือ', 'kitaplar', 'کتابیں', '图书', 'boeke', 'Bücher', 'Βιβλία', 'Libros', 'पुस्तकहरु', 'книги', 'Bøger', 'Գրքեր', 'წიგნები', 'पुस्तके', 'Buku', 'ਕਿਤਾਬਾਂ', 'புத்தகங்கள்', 'పుస్తకాలు', 'Böcker', 'Mga Libro'),
(39, 'home_page', 'Home Page', 'হোম পেজ', 'الصفحة الرئيسية', 'Page d\'accueil', 'मुख पृष्ठ', 'Halaman rumah', 'Home page', 'ホームページ', '홈페이지', 'Startpagina', 'pagina inicial', 'หน้าแรก', 'Ana sayfa', 'ہوم پیج', '主页', 'Tuisblad', 'Startseite', 'Αρχική σελίδα', 'Página de inicio', 'गृह पृष्ठ', 'Домашняя страница', 'Hjemmeside', 'Գլխավոր էջ', 'საწყისი გვერდი', 'मुख्यपृष्ठ', 'Laman Utama', 'ਮੁੱਖ ਪੰਨਾ', 'முகப்பு பக்கம்', 'హోమ్ పేజీ', 'Hemsida', 'Pahina ng Bahay'),
(40, 'collected', 'Collected', 'সংগৃহীত', 'جمع', 'collecté', 'जुटाया हुआ', 'dikumpulkan', 'raccolto', '集めました', '모은', 'verzamelde', 'coletado', 'เก็บรวบรวม', 'toplanmış', 'جمع', '集', 'ingesamel', 'Gesammelt', 'Συγκεντρωμένος', 'Recogido', 'संकलित', 'собранный', 'Indsamlet', 'Հավաքվել է', 'შეაგროვა', 'संग्रहित', 'Dikumpulkan', 'ਇਕੱਤਰ ਕੀਤਾ', 'சேகரிக்கப்பட்டது', 'కలెక్టెడ్', 'Samlade in', 'Nakolekta'),
(41, 'student_mark', 'Student Mark', 'ছাত্র মার্ক', 'علامة الطالب', 'Marque étudiante', 'छात्र निशान', 'Tanda siswa', 'Marchio studente', '学生証', '학생 표', 'Studentenmerk', 'Marca estudantil', 'เครื่องหมายนักเรียน', 'Öğrenci işareti', 'طالب علم کا نشان', '学生标记', 'Studentemark', 'Student Mark', 'Φοιτητής Mark', 'Marca de estudiante', 'विद्यार्थी मार्क', 'Студенческая марка', 'Student Mark', 'Ուսանողական նշան', 'სტუდენტური მარკა', 'विद्यार्थी चिन्ह', 'Markah Pelajar', 'ਵਿਦਿਆਰਥੀ ਮਾਰਕ', 'மாணவர் குறி', 'స్టూడెంట్ మార్క్', 'Student Mark', 'Mag-aaral na Markahan'),
(42, 'select_exam_first', 'Select Exam First', 'নির্বাচন প্রথম নির্বাচন করুন', 'حدد الامتحان أولا', 'Sélectionnez l\'examen en premier', 'परीक्षा पहले चुनें', 'Pilih ujian dulu', 'Selezionare l\'esame per primo', '最初に試験を選択', '먼저 시험을 선택하십시오.', 'Selecteer eerst examen', 'Selecione o exame primeiro', 'เลือกการสอบก่อน', 'Önce sınavı seç', 'سب سے پہلے امتحان منتخب کریں', '先选择考试', 'Kies eers eksamen', 'Wählen Sie zuerst Prüfung', 'Επιλέξτε πρώτα την εξέταση', 'Seleccione el examen primero', 'पहिले परीक्षा चयन गर्नुहोस्', 'Сначала выберите экзамен', 'Vælg eksamen først', 'Ընտրեք առաջին քննությունը', 'აირჩიეთ პირველი გამოცდა', 'प्रथम परीक्षा निवडा', 'Pilih Peperiksaan Pertama', 'ਪਹਿਲਾਂ ਪ੍ਰੀਖਿਆ ਦੀ ਚੋਣ ਕਰੋ', 'முதலில் தேர்வு என்பதைத் தேர்ந்தெடுக்கவும்', 'మొదట పరీక్షను ఎంచుకోండి', 'Välj Exam First', 'Piliin muna ang Exam'),
(43, 'transport_details', 'Transport Details', 'পরিবহন বিবরণ', 'تفاصيل النقل', 'Détails de transport', 'परिवहन विवरण', 'Rincian transportasi', 'Dettagli di trasporto', '運送の詳細', '운송 세부 정보', 'Transport details', 'Detalhes do transporte', 'รายละเอียดการขนส่ง', 'Ulaşım bilgileri', 'نقل و حمل کی تفصیلات', '运输细节', 'Vervoerbesonderhede', 'Transport Details', 'Λεπτομέρειες μεταφοράς', 'Detalles de transporte', 'यातायात विवरण', 'Детали транспорта', 'Transportoplysninger', 'Տրանսպորտի մանրամասները', 'ტრანსპორტის დეტალები', 'परिवहन तपशील', 'Butiran Pengangkutan', 'ਆਵਾਜਾਈ ਦੇ ਵੇਰਵੇ', 'போக்குவரத்து விவரங்கள்', 'రవాణా వివరాలు', 'Transportdetaljer', 'Mga Detalye ng Transport'),
(44, 'no_of_teacher', 'No of Teacher', 'শিক্ষকের সংখ্যা', 'لا المعلم', 'Nombre de professeurs', 'शिक्षक की संख्या', 'Tidak ada guru', 'Nemo autem magister', '先生のいいえ', '교사 수', 'Nee van leraar', 'Não professor', 'ไม่มีครู', 'Öğretmenin numarası', 'استاد کی کوئی بھی نہیں', '不是老师', 'Geen onderwyser nie', 'Nein des Lehrers', 'Αριθμός δασκάλου', 'No de profesor', 'शिक्षकको संख्या', 'Нет учителя', 'Nej af lærer', 'Ուսուցչի ոչ մեկը', 'მასწავლებლის არა', 'शिक्षकांची संख्या', 'Bilangan Guru', 'ਅਧਿਆਪਕ ਦੀ ਗਿਣਤੀ', 'ஆசிரியர் இல்லை', 'గురువు సంఖ్య', 'Inget av lärare', 'Hindi ng Guro'),
(45, 'basic_details', 'Basic Details', 'মৌলিক বিবরণ', 'تفاصيل أساسية', 'Détails de base', 'मूल विवरण', 'Detail Dasar', 'Dettagli di base', '基本的な詳細', '기본 세부 사항', 'Basisgegevens', 'Detalhes Básicos', 'รายละเอียดพื้นฐาน', 'Temel Detaylar', 'بنیادی تفصیلات', '基本细节', 'Basiese besonderhede', 'Grundlegende Details', 'Βασικές λεπτομέρειες', 'Detalles básicos', 'आधारभूत विवरणहरू', 'Основные детали', 'Grundlæggende detaljer', 'Հիմնական մանրամասները', 'ძირითადი დეტალები', 'मूलभूत तपशील', 'Perincian Asas', 'ਮੁ Detailsਲੇ ਵੇਰਵੇ', 'அடிப்படை விவரங்கள்', 'ప్రాథమిక వివరాలు', 'Grundläggande detaljer', 'Pangunahing Mga Detalye'),
(46, 'fee_progress', 'Fee Progress', 'ফি অগ্রগতি', 'رسوم التقدم', 'Progression des frais', 'शुल्क प्रगति', 'Kemajuan Biaya', 'Avanzamento della tassa', '料金の進捗', '요금 진행 상황', 'Progress Progress', 'Progresso de taxas', 'ความคืบหน้าค่าธรรมเนียม', 'Ücret İlerlemesi', 'فیس پیش رفت', '费用进度', 'Fooi vorder', 'Gebührenfortschritt', 'Πρόοδος προμήθειας', 'Progreso de tarifas', 'शुल्क प्रगति', 'Плата за прогресс', 'Gebyrets fremskridt', 'Վճարների առաջընթաց', 'საფასური', 'फी प्रगती', 'Kemajuan Yuran', 'ਫੀਸ ਤਰੱਕੀ', 'கட்டணம் முன்னேற்றம்', 'ఫీజు పురోగతి', 'Avgiftsframsteg', 'Pag-unlad ng Bayad'),
(47, 'word', 'Word', 'শব্দ', 'كلمة', 'mot', 'शब्द', 'kata', 'parola', 'ワード', '워드', 'word', 'palavra', 'คำ', 'sözcük', 'لفظ', '字', 'Word', 'Wort', 'Λέξη', 'Palabra', 'शब्द', 'слово', 'Ord', 'Բառ', 'სიტყვა', 'शब्द', 'Perkataan', 'ਸ਼ਬਦ', 'சொல்', 'పద', 'Ord', 'Salita'),
(48, 'book_category', 'Book Category', 'বই বিভাগ', 'فئة الكتاب', 'Catégorie livre', 'पुस्तक श्रेणी', 'Kategori buku', 'Categoria di libri', '本カテゴリ', '도서 카테고리', 'Boek categorie', 'Categoria de livro', 'book หมวดหมู่', 'Kitap kategorisi', 'کتاب کی قسم', '书类', 'Boekkategorie', 'Buchkategorie', 'Κατηγορία βιβλίου', 'Categoría de libro', 'पुस्तक कोटि', 'Категория книги', 'Bogkategori', 'Գրքերի կատեգորիա', 'წიგნების კატეგორია', 'पुस्तकाचे वर्ग', 'Kategori Buku', 'ਕਿਤਾਬ ਸ਼੍ਰੇਣੀ', 'புத்தக வகை', 'పుస్తక వర్గం', 'Bokkategori', 'Category ng Book'),
(49, 'driver_phone', 'Driver Phone', 'ড্রাইভার ফোন', 'سائق الهاتف', 'Driver Phone', 'चालक फोन', 'Driver Telepon', 'Telefono del conducente', 'ドライバーフォン', '운전자 전화 번호', 'Driver Telefoon', 'Driver Phone', 'โทรศัพท์ไดร์เวอร์', 'Sürücü Telefon', 'ڈرائیور فون', '司机电话', 'Bestuurdersfoon', 'Fahrertelefon', 'Τηλέφωνο προγράμματος οδήγησης', 'Teléfono del conductor', 'ड्राइभर फोन', 'Телефон водителя', 'Driver-telefon', 'Վարորդի հեռախոս', 'მძღოლის ტელეფონი', 'ड्रायव्हर फोन', 'Telefon Pemandu', 'ਡਰਾਈਵਰ ਫੋਨ', 'டிரைவர் தொலைபேசி', 'డ్రైవర్ ఫోన్', 'Förarstelefon', 'Telepono ng driver'),
(50, 'invalid_csv_file', 'Invalid / Corrupted CSV File', 'অবৈধ / দূষিত CSV ফাইল', 'ملف كسف غير صالح / معطل', 'fichier CSV invalide / corrompu', 'अमान्य / भ्रष्ट CSV फ़ाइल', 'file CSV yang tidak benar / rusak', 'file CSV non valido / danneggiato', '無効/破損したCSVファイル', '유효하지 않은 / 손상된 CSV 파일', 'ongeldig / beschadigd CSV-bestand', 'arquivo CSV inválido / corrompido', 'ไฟล์ CSV ที่ไม่ถูกต้อง / เสียหาย', 'geçersiz / bozuk CSV dosyası', 'غلط / خراب CSV فائل', '无效/损坏的CSV文件', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(51, 'requested_book_list', 'Requested Book List', 'অনুরোধকৃত বইয়ের তালিকা', 'طلب قائمة الكتب', 'Liste de livres demandée', 'अनुरोधित पुस्तक सूची', 'Daftar buku yang diminta', 'L\'elenco dei libri richiesti', '要求された本のリスト', '요청 된 도서 목록', 'Gevraagde boekenlijst', 'Lista de livros solicitada', 'รายการหนังสือที่ขอ', 'Talep edilen kitap listesi', 'درخواست کی کتاب کی فہرست', '要求书目录', 'Gevra Boekelys', 'Angeforderte Buchliste', 'Ζητούμενη λίστα βιβλίων', 'Lista de libros solicitados', 'अनुरोध गरिएको पुस्तक सूची', 'Список запрашиваемых книг', 'Anmodet om bogliste', 'Հայցվող գրքերի ցուցակ', 'მოითხოვა წიგნების სია', 'विनंती केलेली पुस्तक यादी', 'Senarai Buku yang Diminta', 'ਬੇਨਤੀ ਕੀਤੀ ਕਿਤਾਬ ਸੂਚੀ', 'கோரப்பட்ட புத்தக பட்டியல்', 'అభ్యర్థించిన పుస్తక జాబితా', 'Begärd boklista', 'Hiniling na Listahan ng Aklat'),
(52, 'request_status', 'Request Status', 'অনুরোধ স্থিতি', 'حالة الطلب', 'Statut de demande', 'अनुरोध की स्थिति', 'Status permintaan', 'Stato di richiesta', '要求ステータス', '요청 상태', 'Status aanvragen', 'Status de solicitação', 'สถานะคำขอ', 'Istek durumu', 'درخواست کی حیثیت', '请求状态', 'Versoek status', 'Anforderungsstatus', 'Αίτηση κατάστασης', 'Estado de la solicitud', 'अनुरोध स्थिति', 'Статус запроса', 'Anmod om status', 'Հայցել կարգավիճակը', 'სტატუსის მოთხოვნა', 'विनंती स्थिती', 'Status Permintaan', 'ਬੇਨਤੀ ਸਥਿਤੀ', 'கோரிக்கை நிலை', 'అభ్యర్థన స్థితి', 'Begär status', 'Katayuan ng Humiling'),
(53, 'book_request', 'Book Request', 'বইয়ের অনুরোধ', 'طلب الكتاب', 'Demande de livre', 'पुस्तक अनुरोध', 'Permintaan buku', 'Richiesta di libro', '本のリクエスト', '도서 요청', 'Boekverzoek', 'Pedido de livro', 'หนังสือขอ', 'Kitap isteği', 'کتاب کی درخواست', '书籍要求', 'Boekversoek', 'Buchanfrage', 'Αίτηση βιβλίου', 'Solicitud de libro', 'पुस्तक अनुरोध', 'Запрос книги', 'Boganmodning', 'Գրքի հարցում', 'წიგნის მოთხოვნა', 'पुस्तक विनंती', 'Permintaan Buku', 'ਕਿਤਾਬ ਬੇਨਤੀ', 'புத்தக கோரிக்கை', 'పుస్తక అభ్యర్థన', 'Bokförfrågan', 'Kahilingan sa Aklat'),
(54, 'logout', 'Logout', 'প্রস্থান', 'الخروج', 'Connectez - Out', 'लोग आउट', 'keluar', 'logout', 'ログアウト', '로그 아웃', 'uitloggen', 'sair', 'ออกจากระบบ', 'çıkış Yap', 'لاگ آوٹ', '登出', 'Teken uit', 'Ausloggen', 'Αποσύνδεση', 'Cerrar sesión', 'बाहिर निस्कनु', 'Выйти', 'Log ud', 'Արգելափակում', 'გამოსვლა', 'बाहेर पडणे', 'Log keluar', 'ਲਾੱਗ ਆਊਟ, ਬਾਹਰ ਆਉਣਾ', 'வெளியேறு', 'లాగౌట్', 'Logga ut', 'Pag-logout'),
(55, 'select_payment_method', 'Select Payment Method', 'পেমেন্ট পদ্ধতি নির্বাচন করুন', 'اختار طريقة الدفع', 'Sélectionnez le mode de paiement', 'भुगतान का तरीका चुनें', 'Pilih metode pembayaran', 'scegli il metodo di pagamento', 'お支払い方法を選択', '지불 방법 선택', 'Selecteer betaalmethode', 'Selecione o método de pagamento', 'เลือกวิธีการชำระเงิน', 'ödeme türünü seçin', 'ادائیگی کا طریقہ منتخب کریں', '选择付款方式', 'Kies betaalmetode', 'Wählen Sie die Zahlungsmethode', 'Επιλέξτε Τρόπος πληρωμής', 'Seleccionar forma de pago', 'भुक्तानी विधि चयन गर्नुहोस्', 'Выберите способ оплаты', 'Vælg betalingsmetode', 'Ընտրեք վճարման եղանակը', 'აირჩიეთ გადახდის მეთოდი', 'देय द्यायची पद्धत निवडा', 'Pilih Kaedah Pembayaran', 'ਭੁਗਤਾਨ ਵਿਧੀ ਦੀ ਚੋਣ ਕਰੋ', 'கட்டண முறையைத் தேர்ந்தெடுக்கவும்', 'చెల్లింపు పద్ధతిని ఎంచుకోండి', 'Välj betalningsmetod', 'Piliin ang Paraan ng Pagbabayad'),
(56, 'select_method', 'Select Method', 'পদ্ধতি নির্বাচন করুন', 'حدد الطريقة', 'Méthode choisie', 'विधि का चयन करें', 'Pilih metode', 'Selezionare il metodo', 'メソッドの選択', '선택 방법', 'Selecteer methode', 'Método selecionado', 'เลือกวิธี', 'Yöntemi seç', 'طریقہ منتخب کریں', '选择方法', 'Kies metode', 'Wählen Sie Methode', 'Επιλέξτε Μέθοδο', 'Seleccionar método', 'विधि चयन गर्नुहोस्', 'Выберите метод', 'Vælg metode', 'Ընտրեք մեթոդը', 'აირჩიეთ მეთოდი', 'पद्धत निवडा', 'Pilih Kaedah', 'Selectੰਗ ਦੀ ਚੋਣ ਕਰੋ', 'முறையைத் தேர்ந்தெடுக்கவும்', 'పద్ధతిని ఎంచుకోండి', 'Välj metod', 'Piliin ang Paraan'),
(57, 'payment', 'Payment', 'প্রদান', 'دفع', 'Paiement', 'भुगतान', 'Pembayaran', 'Pagamento', '支払い', '지불', 'Betaling', 'Pagamento', 'การชำระเงิน', 'Ödeme', 'ادائیگی', '付款', 'betaling', 'Zahlung', 'Πληρωμή', 'Pago', 'भुक्तानी', 'Оплата', 'Betaling', 'Վճարում', 'გადახდა', 'देय', 'Pembayaran', 'ਭੁਗਤਾਨ', 'கட்டணம்', 'చెల్లింపు', 'Betalning', 'Pagbabayad'),
(58, 'filter', 'Filter', 'ছাঁকনি', 'منقي', 'Filtre', 'फ़िल्टर', 'Filter', 'Filtro', 'フィルタ', '필터', 'Filter', 'Filtro', 'กรอง', 'filtre', 'فلٹر', '过滤', 'filter', 'Filter', 'Φίλτρο', 'Filtrar', 'फिल्टर', 'Фильтр', 'Filter', 'Զտիչ', 'ფილტრი', 'फिल्टर करा', 'Tapis', 'ਫਿਲਟਰ', 'வடிகட்டி', 'వడపోత', 'Filtrera', 'Filter'),
(59, 'status', 'Status', 'অবস্থা', 'الحالة', 'statut', 'स्थिति', 'Status', 'Stato', '状態', '지위', 'toestand', 'estado', 'สถานะ', 'durum', 'سٹیٹس', '状态', 'status', 'Status', 'Κατάσταση', 'Estado', 'स्थिति', 'Status', 'status', 'Կարգավիճակը', 'სტატუსი', 'स्थिती', 'Status', 'ਸਥਿਤੀ', 'நிலை', 'స్థితి', 'Status', 'Katayuan'),
(60, 'paid', 'Paid', 'অর্থ প্রদান', 'دفع', 'Payé', 'भुगतान किया है', 'dibayar', 'Pagato', '支払われました', '유료', 'Betaald', 'Pago', 'ต้องจ่าย', 'ücretli', 'ادا کی', '付费', 'betaal', 'Bezahlt', 'επί πληρωμή', 'Pagado', 'भुक्तान गरिएको', 'оплаченный', 'betalt', 'Վճարված', 'გადახდილი', 'पैसे दिले', 'Dibayar', 'ਦਾ ਭੁਗਤਾਨ', 'கட்டணம்', 'చెల్లింపు', 'betald', 'Bayad'),
(61, 'unpaid', 'Unpaid', 'অবৈতনিক', 'غير مدفوع', 'Non payé', 'अवैतनिक', 'Tunggakan', 'non pagato', '未払い', '지불하지 않은', 'onbetaald', 'não remunerado', 'ยังไม่ได้ชำระ', 'ödenmemiş', 'بلا معاوضہ', '未付', 'onbetaalde', 'Unbezahlt', 'Απλήρωτος', 'No pagado', 'भुक्तान गरिएको', 'неоплаченный', 'Ulønnet', 'Չվճարված', 'გადაუხდელი', 'पैसे न दिलेले', 'Tanpa Bayaran', 'ਅਦਾਇਗੀ', 'செலுத்தப்படாதது', 'చెల్లించని', 'Obetald', 'Hindi bayad'),
(62, 'method', 'Method', 'পদ্ধতি', 'طريقة', 'la méthode', 'तरीका', 'Metode', 'metodo', '方法', '방법', 'Methode', 'Método', 'วิธี', 'Yöntem', 'طریقہ', '方法', 'metode', 'Methode', 'Μέθοδος', 'Método', 'विधि', 'метод', 'Metode', 'Մեթոդը', 'მეთოდი', 'पद्धत', 'Kaedah', '.ੰਗ', 'முறை', 'విధానం', 'Metod', 'Pamamaraan'),
(63, 'cash', 'Cash', 'নগদ', 'السيولة النقدية', 'Argent liquide', 'रोकड़', 'Kas', 'Contanti', '現金', '현금', 'geld', 'Dinheiro', 'เงินสด', 'Nakit', 'نقد', '现金', 'kontant', 'Kasse', 'Μετρητά', 'Efectivo', 'नगद', 'Денежные средства', 'Kontanter', 'Կանխիկ', 'ნაღდი ფული', 'रोख', 'Wang Tunai', 'ਨਕਦ', 'பணம்', 'క్యాష్', 'Kontanter', 'Cash'),
(64, 'check', 'Check', 'চেক', 'الاختيار', 'Vérifier', 'चेक', 'Memeriksa', 'Dai un\'occhiata', 'チェック', '검사', 'check', 'Verifica', 'ตรวจสอบ', 'Ara', 'چیک کریں', '检查', 'Tjek', 'Prüfen', 'Ελεγχος', 'Cheque', 'जाँच गर्नुहोस्', 'Проверьте', 'Kontrollere', 'Ստուգեք', 'Ჩეკი', 'तपासा', 'Periksa', 'ਚੈਕ', 'காசோலை', 'తనిఖీ', 'Kontrollera', 'Suriin'),
(65, 'card', 'Card', 'কার্ড', 'بطاقة', 'Carte', 'कार्ड', 'Kartu', 'Carta', 'カード', '카드', 'Kaart', 'Cartão', 'บัตร', 'kart', 'کارڈ', '卡', 'kaart', 'Karte', 'Κάρτα', 'Tarjeta', 'कार्ड', 'Открытка', 'Kort', 'Քարտ', 'ბარათი', 'कार्ड', 'Kad', 'ਕਾਰਡ', 'அட்டை', 'కార్డ్', 'Kort', 'Card'),
(66, 'payment_history', 'Payment History', 'অর্থ প্রদান ইতিহাস', 'تاريخ الدفع', 'historique de paiement', 'भुगतान इतिहास', 'Riwayat Pembayaran', 'Storico dei pagamenti', '支払歴', '지급 내역', 'Betaalgeschiedenis', 'Histórico de pagamento', 'ประวัติการชำระเงิน', 'ödeme geçmişi', 'ادائیگی کی تاریخ', '付款记录', 'Betaalgeskiedenis', 'Zahlungshistorie', 'Ιστορικό πληρωμών', 'historial de pagos', 'भुक्तान ईतिहास', 'История платежей', 'Betalingshistorik', 'Վճարման պատմություն', 'გადახდის ისტორია', 'देय इतिहास', 'sejarah pembayaran', 'ਭੁਗਤਾਨ ਇਤਿਹਾਸ', 'கட்டண வரலாறு', 'చెల్లింపు చరిత్ర', 'Betalningshistorik', 'Kasaysayan ng pagbabayad'),
(67, 'category', 'Category', 'বিভাগ', 'فئة', 'Catégorie', 'वर्ग', 'Kategori', 'Categoria', 'カテゴリー', '범주', 'Categorie', 'Categoria', 'ประเภท', 'Kategori', 'قسم', '类别', 'kategorie', 'Kategorie', 'Κατηγορία', 'Categoría', 'कोटि', 'категория', 'Kategori', 'Կատեգորիա', 'კატეგორია', 'वर्ग', 'Kategori', 'ਸ਼੍ਰੇਣੀ', 'வகை', 'వర్గం', 'Kategori', 'Kategorya'),
(68, 'book_list', 'Book List', 'পাঠ্যতালিকা', 'قائمة الكتب', 'Liste de livres', 'पुस्तक सूची', 'Daftar buku', 'Lista di libri', 'ブックリスト', '도서 목록', 'Book List', 'Lista de livros', 'รายชื่อหนังสือ', 'Kitap listesi', 'کتاب کی فہرست', '图书清单', 'Boekelys', 'Bücherliste', 'Λίστα βιβλίων', 'Lista de libros', 'पुस्तक सूची', 'Список книг', 'Bogliste', 'Գրքերի ցուցակ', 'წიგნების სია', 'पुस्तक यादी', 'Senarai Buku', 'ਕਿਤਾਬ ਸੂਚੀ', 'புத்தக பட்டியல்', 'పుస్తక జాబితా', 'Bok lista', 'Listahan ng Aklat'),
(69, 'author', 'Author', 'লেখক', 'مؤلف', 'Auteur', 'लेखक', 'Penulis', 'Autore', '著者', '저자', 'Auteur', 'Autor', 'ผู้เขียน', 'Yazar', 'مصنف', '作者', 'skrywer', 'Autor', 'Συντάκτης', 'Autor', 'लेखक', 'автор', 'Forfatter', 'Հեղինակ', 'ავტორი', 'लेखक', 'Pengarang', 'ਲੇਖਕ', 'நூலாசிரியர்', 'రచయిత', 'Författare', 'May-akda'),
(70, 'price', 'Price', 'মূল্য', 'السعر', 'Prix', 'मूल्य', 'Harga', 'Prezzo', '価格', '가격', 'Prijs', 'Preço', 'ราคา', 'Fiyat', 'قیمت', '价钱', 'prys', 'Preis', 'Τιμή', 'Precio', 'मूल्य', 'Цена', 'Pris', 'Գինը', 'ფასი', 'किंमत', 'Harga', 'ਮੁੱਲ', 'விலை', 'ధర', 'Pris', 'Presyo'),
(71, 'available', 'Available', 'সহজলভ্য', 'متاح', 'Disponible', 'उपलब्ध', 'Tersedia', 'A disposizione', '利用できます', '유효한', 'Beschikbaar', 'Disponível', 'ที่มีจำหน่าย', 'Mevcut', 'دستیاب', '可用的', 'beskikbaar', 'Verfügbar', 'Διαθέσιμος', 'Disponible', 'उपलब्ध छ', 'Доступный', 'Ledig', 'Առկա է', 'შესაძლებელია', 'उपलब्ध', 'Ada', 'ਉਪਲੱਬਧ', 'கிடைக்கிறது', 'అందుబాటులో', 'Tillgängliga', 'Magagamit na'),
(72, 'unavailable', 'Unavailable', 'অপ্রাপ্য', 'غير متوفره', 'Indisponible', 'अनुपलब्ध', 'tidak tersedia', 'non disponibile', '利用できません', '없는', 'Niet beschikbaar', 'Indisponível', 'ใช้งานไม่ได้', 'yok', 'دستیاب نہیں', '不可用', 'beskikbaar', 'Verfügbar', 'Διαθέσιμος', 'Disponible', 'उपलब्ध छ', 'Доступный', 'Ledig', 'Առկա է', 'შესაძლებელია', 'उपलब्ध', 'Ada', 'ਉਪਲੱਬਧ', 'கிடைக்கிறது', 'అందుబాటులో', 'Tillgängliga', 'Magagamit na'),
(73, 'transport_list', 'Transport List', 'পরিবহন তালিকা', 'قائمة النقل', 'Liste des transports', 'परिवहन सूची', 'Daftar transportasi', 'Lista dei trasporti', 'トランスポート一覧', '전송 목록', 'transport List', 'Lista de transportes', 'รายการขนส่ง', 'Taşıma listesi', 'ٹرانسپورٹ کی فہرست', '交通运输清单', 'Vervoerlys', 'Transportliste', 'Λίστα μεταφορών', 'Lista de transporte', 'यातायात सूची', 'Транспортный список', 'Transportliste', 'Տրանսպորտի ցուցակ', 'ტრანსპორტის სია', 'परिवहन यादी', 'Senarai Pengangkutan', 'ਟ੍ਰਾਂਸਪੋਰਟ ਸੂਚੀ', 'போக்குவரத்து பட்டியல்', 'రవాణా జాబితా', 'Transportlista', 'Listahan ng Transport'),
(74, 'edit_transport', 'Edit Transport', 'পরিবহন সম্পাদনা', 'تحرير النقل', 'Modifier Transport', 'परिवहन संपादित करें', 'mengedit Transportasi', 'Modifica Trasporti', '編集交通', '편집 전송', 'Transport bewerken', 'Editar Transportes', 'แก้ไขขนส่ง', 'Düzenleme Ulaşım', 'ٹرانسپورٹ میں ترمیم کریں', '编辑传输', 'Redigeer vervoer', 'Transport bearbeiten', 'Επεξεργασία μεταφοράς', 'Editar transporte', 'यातायात सम्पादन गर्नुहोस्', 'Изменить транспорт', 'Rediger transport', 'Փոփոխեք տրանսպորտը', 'ტრანსპორტის შეცვლა', 'परिवहन संपादित करा', 'Edit Pengangkutan', 'ਆਵਾਜਾਈ ਸੋਧੋ', 'போக்குவரத்தைத் திருத்து', 'రవాణాను సవరించండి', 'Redigera transport', 'I-edit ang Transport'),
(75, 'hostel_name', 'Hostel Name', 'হোস্টেল নাম', 'اسم المهجع', 'Nom Dortoir', 'छात्रावास का नाम', 'Nama asrama', 'Nome dormitorio', '寮の名前', '기숙사 이름', 'slaapzaal Naam', 'Nome dormitório', 'ชื่อหอพัก', 'yatakhane Ad', 'شیناگار نام', '宿舍名称', 'Koshuisnaam', 'Hostel Name', 'Όνομα ξενώνα', 'Nombre del albergue', 'छात्रावास नाम', 'Название хостела', 'Vandrerhjemets navn', 'Հանրակացարանի անուն', 'ჰოსტელის სახელი', 'वसतिगृहाचे नाव', 'Nama Asrama', 'ਹੋਸਟਲ ਦਾ ਨਾਮ', 'விடுதி பெயர்', 'హాస్టల్ పేరు', 'Vandrarhem Namn', 'Pangalan ng Hostel'),
(76, 'number_of_room', 'Hostel Of Room', 'রুম নম্বর', 'عدد الغرف', 'Nombre de chambres', 'कमरे की संख्या', 'Jumlah Kamar', 'Il numero di stanze', '部屋の数', '룸의 수', 'Aantal kamers', 'Número de salas', 'จำนวนห้องพัก', 'Oda Sayısı', 'کمرہ کی تعداد', '数种客房', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(77, 'yes', 'Yes', 'হাঁ', 'نعم فعلا', 'Oui', 'हाँ', 'iya nih', 'sì', 'はい', '예', 'Ja', 'sim', 'ใช่', 'Evet', 'جی ہاں', '是', 'Ja', 'Ja', 'Ναί', 'si', 'हो', 'да', 'Ja', 'Այո', 'დიახ', 'होय', 'Ya', 'ਹਾਂ', 'ஆம்', 'అవును', 'Ja', 'Oo'),
(78, 'no', 'No', 'না', 'لا', 'Non', 'नहीं', 'Tidak', 'No', 'いいえ', '아니', 'Nee', 'Não', 'ไม่', 'hayır', 'نہیں', '没有', 'Geen', 'Nein', 'Οχι', 'No', 'होईन', 'нет', 'Ingen', 'Ոչ', 'არა', 'नाही', 'Tidak', 'ਨਹੀਂ', 'இல்லை', 'తోబుట్టువుల', 'Nej', 'Hindi'),
(79, 'messages', 'Messages', 'বার্তা', 'رسائل', 'messages', 'संदेश', 'pesan', 'messaggi', 'メッセージ', '메시지', 'berichten', 'mensagens', 'ข้อความ', 'Mesajlar', 'پیغامات', '消息', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(80, 'compose', 'Compose', 'নতুন বার্তা লিখতে', 'إرسال رسالة جديدة', 'Ecrire un nouveau message', 'नया संदेश लिखें', 'Tulis baru Pesan', 'Scrivi nuovo messaggio', '新しいメッセージを書きます', '새 메시지 쓰기', 'Schrijf New Message', 'Escrever Nova Mensagem', 'เขียนข้อความใหม่', 'Yeni Mesaj Yaz', 'نیا پیغام لکھیں', '我要留言', 'Komponeer', 'Komponieren', 'Συνθέτω', 'Componer', 'रचना', 'Compose', 'Compose', 'Կազմել', 'შედგენა', 'लिहा', 'Karang', 'ਲਿਖੋ', 'எழுது', 'జాబు', 'Komponera', 'Sumulat'),
(81, 'recipient', 'Recipient', 'প্রাপক', 'مستلم', 'Bénéficiaire', 'प्राप्तकर्ता', 'Penerima', 'Destinatario', '受信者', '받는 사람', 'Ontvanger', 'beneficiário', 'ผู้รับ', 'alıcı', 'وصول کنندہ', '接受者', 'ontvanger', 'Empfänger', 'Παραλήπτης', 'Recipiente', 'प्रापक', 'Получатель', 'Modtager', 'Ստացող', 'მიმღები', 'प्राप्तकर्ता', 'Penerima', 'ਪ੍ਰਾਪਤ ਕਰਨ ਵਾਲਾ', 'பெறுநர்', 'గ్రహీత', 'Mottagare', 'Tagatanggap'),
(82, 'select_a_user', 'Select A User', 'নির্বাচন একটি ব্যবহারকারী', 'تحديد مستخدم', 'Sélectionnez un utilisateur', 'चयन एक उपयोगकर्ता', 'Pilih User', 'Selezionare un utente', 'ユーザーを選択します', '사용자를 선택', 'Kies een gebruiker', 'Selecione um usuário', 'เลือกผู้ใช้', 'Bir kullanıcı seçin', 'A یوزر کریں', '选择一个用户', 'Kies &#39;n gebruiker', 'Wählen Sie einen Benutzer', 'Επιλέξτε έναν χρήστη', 'Seleccione un usuario', 'एक प्रयोगकर्ता चयन गर्नुहोस्', 'Выберите пользователя', 'Vælg En bruger', 'Ընտրեք Օգտագործող', 'აირჩიეთ მომხმარებელი', 'एक वापरकर्ता निवडा', 'Pilih Pengguna', 'ਇੱਕ ਯੂਜ਼ਰ ਚੁਣੋ', 'ஒரு பயனரைத் தேர்ந்தெடுக்கவும்', 'వినియోగదారుని ఎంచుకోండి', 'Välj en användare', 'Pumili ng Isang Gumagamit'),
(83, 'send', 'Send', 'পাঠান', 'إرسال', 'Envoyer', 'भेजना', 'Kirim', 'Inviare', '送信', '보내다', 'sturen', 'Enviar', 'ส่ง', 'göndermek', 'حساب', '发送', 'Stuur', 'Senden', 'Στείλετε', 'Enviar', 'पठाउनुहोस्', 'послать', 'Send', 'Ուղարկել', 'გაგზავნა', 'पाठवा', 'Hantar', 'ਭੇਜੋ', 'அனுப்பு', 'పంపు', 'Skicka', 'Ipadala'),
(84, 'global_settings', 'Global Settings', 'সার্বজনীন নির্ধারণ', 'اعدادات النظام', 'Les paramètres du système', 'प्रणाली व्यवस्था', 'Pengaturan sistem', 'Impostazioni di sistema', 'システム設定', '시스템 설정', 'Systeem instellingen', 'Configurações de sistema', 'การตั้งค่าระบบ', 'Sistem ayarları', 'نظام کی ترتیبات', '系统设置', 'Globale instellings', 'Globale Einstellungen', 'Γενικές ρυθμίσεις', 'Ajustes globales', 'ग्लोबल सेटिंग्स', 'Глобальные настройки', 'Globale indstillinger', 'Համաշխարհային պարամետրեր', 'გლობალური პარამეტრები', 'जागतिक संरचना', 'Tetapan global', 'ਗਲੋਬਲ ਸੈਟਿੰਗਜ਼', 'உலகளாவிய அமைப்புகள்', 'గ్లోబల్ సెట్టింగులు', 'Globala inställningar', 'Mga setting ng Pandaigdig'),
(85, 'currency', 'Currency', 'মুদ্রা', 'عملة', 'Devise', 'मुद्रा', 'Mata uang', 'Moneta', '通貨', '통화', 'Valuta', 'Moeda', 'เงินตรา', 'para', 'کرنسی', '货币', 'geldeenheid', 'Währung', 'Νόμισμα', 'Moneda', 'मुद्रा', 'валюта', 'betalingsmiddel', 'Արժույթ', 'ვალუტა', 'चलन', 'Mata Wang', 'ਮੁਦਰਾ', 'நாணய', 'కరెన్సీ', 'Valuta', 'Pera'),
(86, 'system_email', 'System Email', 'সিস্টেম ইমেইল', 'نظام البريد الإلكتروني', 'système Email', 'प्रणाली ईमेल', 'sistem Email', 'sistema di posta elettronica', 'システムメール', 'System 전자 메일', 'System E-mail', 'sistema de E-mail', 'ระบบอีเมล', 'sistem E-posta', 'سسٹم کی ای میل', '电子邮件系统', 'Stelsel e-pos', 'System-E-Mail', 'Ηλεκτρονικό ταχυδρομείο συστήματος', 'Correo electrónico del sistema', 'प्रणाली ईमेल', 'Система электронной почты', 'System e-mail', 'Համակարգի էլ', 'სისტემის ელ', 'सिस्टम ईमेल', 'E-mel Sistem', 'ਸਿਸਟਮ ਈਮੇਲ', 'கணினி மின்னஞ்சல்', 'సిస్టమ్ ఇమెయిల్', 'System e-post', 'System Email'),
(87, 'create', 'Create', 'সৃষ্টি', 'خلق', 'créer', 'सर्जन करना', 'membuat', 'creare', '作成する', '몹시 떠들어 대다', 'creëren', 'crio', 'สร้าง', 'yaratmak', 'بنانا', '创建', 'Skep', 'Erstellen', 'Δημιουργώ', 'Crear', 'सिर्जना गर्नुहोस्', 'Создайте', 'skab', 'Ստեղծել', 'Შექმნა', 'तयार करा', 'Buat', 'ਬਣਾਓ', 'உருவாக்கு', 'సృష్టించు', 'Skapa', 'Lumikha'),
(88, 'save', 'Save', 'সংরক্ষণ করুন', 'حفظ', 'sauvegarder', 'बचाना', 'Menyimpan', 'Salvare', 'セーブ', '구하다', 'Save', 'Salvar', 'บันทึก', 'Kaydet', 'محفوظ کریں', '保存', 'Save', 'speichern', 'Σώσει', 'Salvar', 'बचत गर्नुहोस्', 'Сохранить', 'Gemme', 'Խնայել', 'Გადარჩენა', 'जतन करा', 'Jimat', 'ਸੇਵ', 'சேமி', 'సేవ్', 'Spara', 'I-save'),
(89, 'file', 'File', 'ফাইল', 'ملف', 'Fichier', 'फ़ाइल', 'Mengajukan', 'File', 'ファイル', '파일', 'file', 'Arquivo', 'ไฟล์', 'Dosya', 'فائل', '文件', 'lêer', 'Datei', 'Αρχείο', 'Expediente', 'फाईल', 'файл', 'Fil', 'Ֆայլ', 'ფაილი', 'फाईल', 'Fail', 'ਫਾਈਲ', 'கோப்பு', 'ఫైలు', 'Fil', 'File'),
(90, 'theme_settings', 'Theme Settings', 'থিম সেটিংস', 'إعدادات موضوع', 'Réglage des thèmes', 'विषय सेटिंग', 'Pengaturan tema', 'Impostazioni tema', 'テーマ設定', '테마 설정', 'Thema instellingen', 'Configurações de tema', 'การตั้งค่าธีม', 'Tema ayarları', 'تھیم ترتیبات', '主题设置', 'Tema-instellings', 'Themen Einstellungen', 'Ρυθμίσεις θέματος', 'Configuración de temas', 'थिम सेटिंग्स', 'Настройки темы', 'Temaindstillinger', 'Թեման կարգավորումներ', 'თემის პარამეტრები', 'थीम सेटिंग्ज', 'Tetapan Tema', 'ਥੀਮ ਸੈਟਿੰਗਜ਼', 'தீம் அமைப்புகள்', 'థీమ్ సెట్టింగులు', 'Temainställningar', 'Mga setting ng tema'),
(91, 'default', 'Default', 'ডিফল্ট', 'افتراضي', 'Défaut', 'चूक', 'kegagalan', 'Predefinito', 'デフォルト', '태만', 'Standaard', 'Padrão', 'ค่าเริ่มต้น', 'Varsayılan', 'پہلے سے طے شدہ', '默认', 'verstek', 'Standard', 'Προκαθορισμένο', 'Defecto', 'पूर्वनिर्धारित', 'По умолчанию', 'Standard', 'Կանխադրված', 'ნაგულისხმევი', 'डीफॉल्ट', 'Lalai', 'ਮੂਲ', 'இயல்புநிலை', 'డిఫాల్ట్', 'Standard', 'Default'),
(92, 'select_theme', 'Select Theme', 'থিম নির্বাচন কর', 'اختر الموضوع', 'Sélectionne un thème', 'विषय का चयन करें', 'Pilih tema', 'Seleziona il tema', 'テーマを選択', '선택 테마', 'Selecteer thema', 'Escolha um tema', 'เลือกธีม', 'seç Tema', 'تھیم منتخب کریں', '选择主题', 'Kies Tema', 'Thema wählen', 'Επέλεξε θέμα', 'Seleccione el tema', 'विषयवस्तु चयन गर्नुहोस्', 'Выберите тему', 'Vælg tema', 'Ընտրեք թեմա', 'აირჩიეთ თემა', 'थीम निवडा', 'Pilih Tema', 'ਥੀਮ ਚੁਣੋ', 'தீம் என்பதைத் தேர்ந்தெடுக்கவும்', 'థీమ్ ఎంచుకోండి', 'Välj tema', 'Piliin ang TEMA'),
(93, 'upload_logo', 'Upload Logo', 'লোগো আপলোড করুন', 'تحميل الشعار', 'Télécharger Logo', 'अपलोड लोगो', 'Upload Logo', 'Carica Logo', 'ロゴをアップロード', '업로드 로고', 'Upload Logo', 'Carregar Logo', 'อัปโหลดโลโก้', 'yükleme Logo', 'اپ لوڈ کی علامت', '上传徽标', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(94, 'upload', 'Upload', 'আপলোড', 'تحميل', 'Télécharger', 'अपलोड', 'Upload', 'Caricare', 'アップロード', '업로드', 'Uploaden', 'Envio', 'อัปโหลด', 'yükleme', 'اپ لوڈ کریں', '上传', 'oplaai', 'Hochladen', 'Μεταφόρτωση', 'Subir', 'अपलोड गर्नुहोस्', 'Загрузить', 'Upload', 'Վերբեռնել', 'ატვირთვა', 'अपलोड करा', 'Muat naik', 'ਅਪਲੋਡ ਕਰੋ', 'பதிவேற்றவும்', 'అప్లోడ్', 'Ladda upp', 'Mag-upload'),
(95, 'remember', 'Remember', 'স্মরণ করা', 'تذكر', 'Rappelles toi', 'याद है', 'Ingat', 'Ricorda', '覚えている', '생각해 내다', 'Onthouden', 'Lembrar', 'จำ', 'Hatırlamak', 'یاد رکھیں', '记得', 'onthou', 'Merken', 'Θυμάμαι', 'Recuerda', 'सम्झनु', 'Помните', 'Husk', 'Հիշիր', 'დაიმახსოვრე', 'लक्षात ठेवा', 'Ingatlah', 'ਯਾਦ ਰੱਖਣਾ', 'நினைவில் கொள்ளுங்கள்', 'గుర్తుంచుకో', 'Kom ihåg', 'Tandaan'),
(96, 'not_selected', 'Not Selected', 'অনির্বাচিত', 'لم يتم اختياره', 'Non séléctionné', 'नहीं चुने गए', 'Tidak terpilih', 'Non selezionato', '選択されていません', '선택되지 않음', 'Niet geselecteerd', 'Não selecionado', 'ไม่ได้เลือก', 'Seçilmedi', 'منتخب نہیں', '未选择', 'Nie gekies nie', 'Nicht ausgewählt', 'Μη επιλεγμένο', 'No seleccionado', 'चयन गरिएको छैन', 'Не выбран', 'Ikke valgt', 'Ընտրված չէ', 'Არ არის მონიშნული', 'निवडलेले नाही', 'Tidak terpilih', 'ਚੁਣਿਆ ਨਹੀਂ ਗਿਆ', 'தேர்ந்தெடுக்கப்படவில்லை', 'ఎంచుకోబడలేదు', 'Ej valt', 'Hindi Pinili'),
(97, 'disabled', 'Disabled', 'অক্ষম', 'معاق', 'désactivé', 'विकलांग', 'Cacat', 'Disabilitato', '使用禁止', '장애인', 'invalide', 'Desativado', 'พิการ', 'engelli', 'معذور', '残', 'gestremde', 'Behindert', 'άτομα με ειδικές ανάγκες', 'Discapacitado', 'अक्षम', 'Отключено', 'handicappet', 'Անաշխատունակ', 'გამორთულია', 'अक्षम', 'Kurang Upaya', 'ਅਯੋਗ', 'முடக்கப்பட்டது', 'డిసేబుల్', 'Inaktiverad', 'Hindi pinagana'),
(98, 'inactive_account', 'Inactive Account', 'নিষ্ক্রিয় অ্যাকাউন্ট', 'حساب غير نشط', 'Compte inactif', 'निष्क्रिय खाता', 'Akun tidak aktif', 'Account inattivo', '非アクティブアカウント', '비활성 계정', 'Inactief account', 'Conta inativa', 'บัญชีที่ไม่ใช้งาน', 'Pasif hesap', 'غیر فعال اکاؤنٹ', '非活动帐户', 'Onaktiewe rekening', 'Inaktives Benutzerkonto', 'Ανενεργός λογαριασμός', 'Cuenta inactiva', 'निष्क्रिय खाता', 'Неактивный аккаунт', 'Inaktiv konto', 'Ոչ ակտիվ հաշիվ', 'არააქტიური ანგარიში', 'निष्क्रिय खाते', 'Akaun Tidak Aktif', 'ਅਕਿਰਿਆਸ਼ੀਲ ਖਾਤਾ', 'செயலற்ற கணக்கு', 'నిష్క్రియాత్మక ఖాతా', 'Inaktivt konto', 'Hindi Aktibo Account');
INSERT INTO `languages` (`id`, `word`, `english`, `bengali`, `arabic`, `french`, `hindi`, `indonesian`, `italian`, `japanese`, `korean`, `dutch`, `portuguese`, `thai`, `turkish`, `urdu`, `chinese`, `afrikaans`, `german`, `greek`, `spanish`, `nepali`, `russian`, `danish`, `armenian`, `georgian`, `marathi`, `malay`, `punjabi`, `tamil`, `telugu`, `swedish`, `filipino`) VALUES
(99, 'update_translations', 'Update Translations', 'আপডেট অনুবাদ', 'تحديث الترجمات', 'actualiser les traductions', 'अनुवाद अपडेट करें', 'update terjemahan', 'aggiornare le traduzioni', '翻訳を更新する', '번역 업데이트', 'vertalingen bijwerken', 'atualizar traduções', 'อัปเดตการแปล', 'çevirileri güncelle', 'ترجمہ اپ ڈیٹ کریں', '更新翻译', 'Dateer vertalings op', 'Übersetzungen aktualisieren', 'Ενημέρωση μεταφράσεων', 'Actualizar traducciones', 'अनुवाद अनुवाद गर्नुहोस्', 'Обновить переводы', 'Opdater oversættelser', 'Թարմացրեք թարգմանությունները', 'თარგმანეთ თარგმანები', 'भाषांतर अद्यतनित करा', 'Kemas kini Terjemahan', 'ਅਨੁਵਾਦ ਨੂੰ ਅਪਡੇਟ ਕਰੋ', 'மொழிபெயர்ப்புகளைப் புதுப்பிக்கவும்', 'అనువాదాలను నవీకరించండి', 'Uppdatera översättningar', 'I-update ang Pagsasalin'),
(100, 'language_list', 'Language List', 'নতুন ভাষাটি তালিকায় আগে', 'قائمة لغة', 'Liste des langues', 'भाषा सूची', 'Daftar bahasa', 'Elenco lingue', '言語の一覧', '언어 목록', 'taal List', 'Lista idioma', 'รายการภาษา', 'Dil listesi', 'زبان کی فہرست', '语言列表', 'Taallys', 'Sprachliste', 'Λίστα γλωσσών', 'Lista de idiomas', 'भाषा सूची', 'Список языков', 'Sprogliste', 'Լեզուների ցուցակ', 'ენის სია', 'भाषा यादी', 'Senarai Bahasa', 'ਭਾਸ਼ਾ ਸੂਚੀ', 'மொழி பட்டியல்', 'భాషా జాబితా', 'Språklista', 'Listahan ng Wika'),
(101, 'option', 'Option', 'পছন্দ', 'خيار', 'Option', 'देखिये', 'Pilihan', 'Opzione', 'オプション', '선택권', 'Keuze', 'Opção', 'ตัวเลือก', 'seçenek', 'آپشن', '选项', 'Opsie', 'Option', 'Επιλογή', 'Opción', 'विकल्प', 'вариант', 'Mulighed', 'Ընտրանք', 'ვარიანტი', 'पर्याय', 'Pilihan', 'ਵਿਕਲਪ', 'விருப்பம்', 'ఎంపిక', 'Alternativ', 'Pagpipilian'),
(102, 'edit_word', 'Edit Word', 'শব্দ সম্পাদনা করুন', 'تحرير الكلمة', 'modifier le mot', 'शब्द को संपादित करें', 'edit kata', 'modifica parola', '単語を編集する', '단어 편집', 'bewerk woord', 'editar palavra', 'แก้ไขคำ', 'kelimeyi düzenle', 'لفظ میں ترمیم کریں', '编辑单词', 'Edit Word', 'Wort bearbeiten', 'Επεξεργασία Word', 'Editar palabra', 'शब्द सम्पादन गर्नुहोस्', 'Редактировать слово', 'Rediger Word', 'Խմբագրել բառը', 'Word- ის რედაქტირება', 'शब्द संपादित करा', 'Edit Kata', 'ਸ਼ਬਦ ਸੋਧੋ', 'வார்த்தையைத் திருத்து', 'పదాన్ని సవరించండి', 'Redigera Word', 'I-edit ang Salita'),
(103, 'update_profile', 'Update Profile', 'প্রফাইল হালনাগাদ', 'تحديث الملف', 'Mettre à jour le profil', 'प्रोफ़ाइल अपडेट करें', 'Memperbaharui profil', 'Aggiorna il profilo', 'プロフィールを更新', '프로필 업데이트', 'Profiel bijwerken', 'Atualizar perfil', 'ปรับปรุงรายละเอียดของ', 'Profili güncelle', 'اپ ڈیٹ پروفائل', '更新个人信息', 'Dateer profiel op', 'Profil aktualisieren', 'Ανανέωση προφίλ', 'Actualización del perfil', 'प्रोफाइल अपडेट गर्नुहोस्', 'Обновить профиль', 'Opdater profil', 'Թարմացրեք պրոֆիլը', 'პროფილის განახლება', 'प्रोफाइल अद्यतनित करा', 'Kemas kini Profil', 'ਪ੍ਰੋਫਾਈਲ ਅਪਡੇਟ ਕਰੋ', 'சுயவிவரத்தைப் புதுப்பிக்கவும்', 'ప్రొఫైల్‌ను నవీకరించండి', 'Uppdatera profil', 'I-update ang Profile'),
(104, 'current_password', 'Current Password', 'বর্তমান পাসওয়ার্ড', 'كلمة السر الحالية', 'Mot de passe actuel', 'वर्तमान पासवर्ड', 'kata sandi saat ini', 'Password attuale', '現在のパスワード', '현재 비밀번호', 'huidig ​​wachtwoord', 'senha atual', 'รหัสผ่านปัจจุบัน', 'Şimdiki Şifre', 'موجودہ خفیہ لفظ', '当前密码', 'huidige Sleutelwoord', 'derzeitiges Passwort', 'Τρέχων κωδικός πρόσβασης', 'contraseña actual', 'वर्तमान पासवर्ड', 'текущий пароль', 'Nuværende kodeord', 'Ընթացիկ գաղտնաբառ', 'მიმდინარე პაროლი', 'सध्याचा गुप्त शब्द', 'Kata Laluan Semasa', 'ਵਰਤਮਾਨ ਪਾਸਵਰਡ', 'தற்போதைய கடவுச்சொல்', 'ప్రస్తుత పాస్వర్డ్', 'Nuvarande lösenord', 'Kasalukuyang Password'),
(105, 'new_password', 'New Password', 'নতুন পাসওয়ার্ড', 'كلمة السر الجديدة', 'nouveau mot de passe', 'नया पासवर्ड', 'kata sandi baru', 'nuova password', '新しいパスワード', '새 비밀번호', 'nieuw paswoord', 'Nova senha', 'รหัสผ่านใหม่', 'Yeni Şifre', 'نیا پاس ورڈ', '新密码', 'Nuwe Wagwoord', 'Neues Kennwort', 'Νέος Κωδικός', 'Nueva contraseña', 'नया पासवर्ड', 'Новый пароль', 'nyt kodeord', 'նոր ծածկագիր', 'ახალი პაროლი', 'नवीन संकेतशब्द', 'Kata laluan baharu', 'ਨਵਾਂ ਪਾਸਵਰਡ', 'புதிய கடவுச்சொல்', 'కొత్త పాస్వర్డ్', 'nytt lösenord', 'Bagong Password'),
(106, 'login', 'Login', 'লগইন', 'تسجيل الدخول', 'S\'identifier', 'लॉगिन', 'Masuk', 'Accesso', 'ログイン', '로그인', 'Log in', 'Entrar', 'เข้าสู่ระบบ', 'Oturum aç', 'لاگ ان', '登录', 'Teken aan', 'Anmeldung', 'Σύνδεση', 'Iniciar sesión', 'लग - इन', 'Авторизоваться', 'Log på', 'Մուտք', 'Შესვლა', 'लॉगिन', 'Log masuk', 'ਲਾਗਿਨ', 'உள்நுழைய', 'ప్రవేశించండి', 'Logga in', 'Mag log in'),
(107, 'reset_password', 'Reset Password', 'পাসওয়ার্ড রিসেট করুন', 'اعادة تعيين كلمة السر', 'réinitialiser le mot de passe', 'पासवर्ड रीसेट', 'Reset password', 'Resetta la password', 'パスワードを再設定する', '암호를 재설정', 'Reset Password', 'Trocar a senha', 'รีเซ็ตรหัสผ่าน', 'Şifreyi yenile', 'پاس ورڈ ری سیٹ', '重设密码', 'Herstel wagwoord', 'Passwort zurücksetzen', 'Επαναφέρετε τον κωδικό πρόσβασης', 'Restablecer la contraseña', 'पासवर्ड रिसेट', 'Сброс пароля', 'Nulstille kodeord', 'Վերականգնել գաղտնաբառը', 'პაროლის გადატვირთვა', 'संकेतशब्द रीसेट करा', 'Menetapkan semula kata laluan', 'ਪਾਸਵਰਡ ਰੀਸੈਟ ਕਰੋ', 'கடவுச்சொல்லை மீட்டமைக்க', 'రహస్యపదాన్ని మార్చుకోండి', 'Återställ lösenord', 'I-reset ang Password'),
(108, 'present', 'Present', 'হাজির', 'حاضر', 'Présent', 'वर्तमान', 'Menyajikan', 'Presente', '現在', '선물', 'aanwezig', 'Presente', 'นำเสนอ', 'mevcut', 'پیش', '当下', 'teenwoordig', 'Vorhanden', 'Παρόν', 'Presente', 'प्रस्तुत', 'настоящее время', 'Til stede', 'Ներկայ', 'აწმყო', 'उपस्थित', 'Hadir', 'ਪੇਸ਼', 'தற்போது', 'ప్రస్తుతం', 'Närvarande', 'Kasalukuyan'),
(109, 'absent', 'Absent', 'অনুপস্থিত', 'غائب', 'Absent', 'अनुपस्थित', 'Tidak hadir', 'Assente', 'ありません', '없는', 'Afwezig', 'Ausente', 'ไม่อยู่', 'Yok', 'غائب', '缺席', 'afwesig', 'Abwesend', 'Απών', 'Ausente', 'अनुपस्थित', 'Отсутствует', 'Fraværende', 'Բացակա', 'Არდამსწრე', 'अनुपस्थित', 'Tidak hadir', 'ਗੈਰਹਾਜ਼ਰ', 'இல்லாதது', 'ఆబ్సెంట్', 'Frånvarande', 'Absent'),
(110, 'update_attendance', 'Update Attendance', 'আপডেট এ্যাটেনডেন্স', 'تحديث الحضور', 'Mise à jour de présence', 'अद्यतन उपस्थिति', 'Update Kehadiran', 'Aggiornamento presenze', '出席を更新', '업데이트 출석', 'Attendance bijwerken', 'Presença atualização', 'ปรับปรุงการเข้าร่วมประชุม', 'güncelleme Seyirci', 'اپ ڈیٹ حاضری', '更新考勤', 'Bywoning van bywerkings', 'Teilnahme aktualisieren', 'Ενημέρωση συμμετοχής', 'Actualización de asistencia', 'उपस्थिति अपडेट गर्नुहोस्', 'Обновление посещаемости', 'Opdater deltagelse', 'Թարմացրեք մասնակցությունը', 'დასწრება დასწრება', 'उपस्थिती अद्यतनित करा', 'Kemas kini Kehadiran', 'ਹਾਜ਼ਰੀ ਅਪਡੇਟ ਕਰੋ', 'வருகை புதுப்பிக்கவும்', 'హాజరును నవీకరించండి', 'Uppdatera närvaro', 'I-update ang Dumalo'),
(111, 'undefined', 'Undefined', 'অনির্দিষ্ট', 'غير محدد', 'Indéfini', 'अपरिभाषित', 'Tidak terdefinisi', 'Non definito', '未定義', '정의되지 않은', 'onbepaald', 'Indefinido', 'ไม่ได้กำหนด', 'tanımlanmamış', 'جانچ', '未定义', 'ongedefinieerde', 'Nicht definiert', 'Απροσδιόριστος', 'Indefinido', 'अपरिभाषित', 'Неопределенный', 'Udefineret', 'Չսահմանված', 'Განუსაზღვრელი', 'अपरिभाषित', 'Tidak ditentukan', 'ਪਰਿਭਾਸ਼ਤ', 'வரையறுக்கப்படவில்லை', 'వివరించలేని', 'Odefinierad', 'Hindi natukoy'),
(112, 'back', 'Back', 'পিছনে', 'الى الخلف', 'Arrière', 'वापस', 'Kembali', 'Indietro', 'バック', '뒤로', 'Terug', 'Costas', 'กลับ', 'Geri', 'واپس', '背部', 'terug', 'Zurück', 'Πίσω', 'atrás', 'पछाडि', 'назад', 'Tilbage', 'Ետ', 'უკან', 'मागे', 'Belakang', 'ਵਾਪਸ', 'மீண்டும்', 'తిరిగి', 'Tillbaka', 'Balik'),
(113, 'save_changes', 'Save Changes', 'পরিবর্তনগুলোর সংরক্ষন', 'حفظ التغيرات', 'Sauvegarder les modifications', 'परिवर्तनों को सुरक्षित करें', 'Simpan perubahan', 'Salva I Cambiamenti', '変更内容を保存', '변경 사항을 저장하다', 'Wijzigingen opslaan', 'Salvar alterações', 'บันทึกการเปลี่ยนแปลง', 'Değişiklikleri Kaydet', 'تبدیلیاں محفوظ کرو', '保存更改', 'Stoor veranderinge', 'Änderungen speichern', 'Αποθήκευσε τις αλλαγές', 'Guardar cambios', 'परिवर्तनहरू सुरक्षित गर्नुहोस', 'Сохранить изменения', 'Gem ændringer', 'Պահպանել փոփոխությունները', 'Ცვლილებების შენახვა', 'बदल जतन करा', 'Simpan Perubahan', 'ਕੀਤੇ ਗਏ ਬਦਲਾਅ ਸੁਰੱਖਿਅਤ ਕਰੋ', 'மாற்றங்களை சேமியுங்கள்', 'మార్పులను ఊంచు', 'Spara ändringar', 'I-save ang mga pagbabago'),
(114, 'uploader', 'Uploader', 'আপলোডার', 'رافع', 'Uploader', 'अपलोडर', 'pengunggah', 'Uploader', 'アップローダー', '업 로더', 'Uploader', 'Uploader', 'อัพโหลด', 'Yükleyici', 'اپ لوڈر', '上传', 'Uploader', 'Uploader', 'Μεταφορτωτής', 'Cargador', 'अपलोडर', 'загрузчик', 'Uploader', 'Վերբեռնող', 'ატვირთა', 'अपलोडर', 'Pemuat naik', 'ਅਪਲੋਡਰ', 'பதிவேற்றியவர்', 'అప్లోడర్', 'Uploader', 'Uploader'),
(115, 'download', 'Download', 'ডাউনলোড', 'تحميل', 'Télécharger', 'डाउनलोड', 'Download', 'Scaricare', 'ダウンロード', '다운로드', 'Download', 'baixar', 'ดาวน์โหลด', 'indir', 'لوڈ', '下载', 'Aflaai', 'Herunterladen', 'Κατεβάστε', 'Descargar', 'डाउनलोड गर्नुहोस्', 'Скачать', 'Hent', 'Ներբեռնեք', 'გადმოწერა', 'डाउनलोड करा', 'Muat turun', 'ਡਾ .ਨਲੋਡ', 'பதிவிறக்க Tamil', 'డౌన్లోడ్', 'Ladda ner', 'Pag-download'),
(116, 'remove', 'Remove', 'অপসারণ', 'إزالة', 'Retirer', 'हटाना', 'Menghapus', 'Cancella', '削除します', '없애다', 'Verwijderen', 'Remover', 'เอาออก', 'Kaldır', 'دور', '去掉', 'Verwyder', 'Entfernen', 'Αφαιρώ', 'Eliminar', 'हटाउनुहोस्', 'Удалить', 'Fjerne', 'Հեռացրեք', 'ამოიღეთ', 'काढा', 'Keluarkan', 'ਹਟਾਓ', 'அகற்று', 'తొలగించు', 'Avlägsna', 'Alisin'),
(117, 'print', 'Print', 'ছাপানো', 'طباعة', 'Impression', 'छाप', 'Mencetak', 'Stampare', '印刷', '인쇄', 'Afdrukken', 'Impressão', 'พิมพ์', 'baskı', 'پرنٹ', '打印', 'Print', 'Drucken', 'Τυπώνω', 'Impresión', 'प्रिन्ट गर्नुहोस्', 'Распечатать', 'Print', 'Տպել', 'დაბეჭდვა', 'प्रिंट', 'Cetak', 'ਛਾਪੋ', 'அச்சிடுக', 'ముద్రణ', 'Skriva ut', 'I-print'),
(118, 'select_file_type', 'Select File Type', 'নির্বাচন ফাইল টাইপ', 'حدد نوع الملف', 'Sélectionner le type de fichier', 'चुनें फ़ाइल प्रकार', 'Pilih File Type', 'Selezionare il tipo di file', 'ファイルタイプを選択します', '선택 파일 형식', 'Select File Type', 'Selecionar Tipo de Arquivo', 'เลือกประเภทไฟล์', 'Seçin Dosya Türü', 'منتخب فائل کی قسم', '选择文件类型', 'Kies lêertipe', 'Wählen Sie Dateityp', 'Επιλέξτε Τύπος αρχείου', 'Seleccionar tipo de archivo', 'फाइल प्रकार चयन गर्नुहोस्', 'Выберите тип файла', 'Vælg Filtype', 'Ընտրեք ֆայլի տեսակը', 'აირჩიეთ ფაილის ტიპი', 'फाइल प्रकार निवडा', 'Pilih Jenis Fail', 'ਫਾਈਲ ਕਿਸਮ ਚੁਣੋ', 'கோப்பு வகையைத் தேர்ந்தெடுக்கவும்', 'ఫైల్ రకాన్ని ఎంచుకోండి', 'Välj filtyp', 'Piliin ang Uri ng File'),
(119, 'excel', 'Excel', 'সীমা অতিক্রম করা', 'تفوق', 'Exceller', 'एक्सेल', 'Unggul', 'Eccellere', 'エクセル', '뛰어나다', 'uitmunten', 'sobressair', 'Excel', 'Excel', 'ایکسل', '高强', 'Excel', 'Excel', 'Υπερτερώ', 'Excel', 'एक्सेल', 'превосходить', 'Excel', 'Excel- ը', 'Excel', 'एक्सेल', 'Excel', 'ਐਕਸਲ', 'எக்செல்', 'Excel', 'Excel', 'Excel'),
(120, 'other', 'Other', 'অন্যান্য', 'آخر', 'Autre', 'अन्य', 'Lain', 'Altro', '他の', '다른', 'anders', 'De outros', 'อื่น ๆ', 'Diğer', 'دیگر', '其他', 'ander', 'Andere', 'Αλλα', 'Otro', 'अन्य', 'Другой', 'Andet', 'Այլ', 'სხვა', 'इतर', 'Yang lain', 'ਹੋਰ', 'மற்றவை', 'ఇతర', 'Övrig', 'Iba pa'),
(121, 'students_of_class', 'Students Of Class', 'ক্লাস ছাত্রদের', 'طلبة الدرجة', 'Les élèves de la classe', 'कक्षा के छात्र', 'Siswa Kelas', 'Gli studenti della classe', 'クラスの生徒', '클래스의 학생', 'Studenten van de klasse', 'Os alunos da classe', 'นักเรียนชั้น', 'Sınıfının Öğrenciler', 'کلاس کے طالب علموں', '学生类中', 'Studente van die klas', 'Schüler der Klasse', 'Μαθητές της τάξης', 'Estudiantes de clase', 'कक्षाका विद्यार्थीहरू', 'Студенты класса', 'Studerende i klassen', 'Դասարանի ուսանողներ', 'კლასის მოსწავლეები', 'क्लासचे विद्यार्थी', 'Pelajar Kelas', 'ਕਲਾਸ ਦੇ ਵਿਦਿਆਰਥੀ', 'வகுப்பு மாணவர்கள்', 'తరగతి విద్యార్థులు', 'Studenter i klass', 'Mga Mag-aaral Ng Klase'),
(122, 'marks_obtained', 'Marks Obtained', 'প্রাপ্ত নম্বর', 'العلامات التي يحصل', 'Notes obtenues', 'प्राप्तांक', 'Marks Diperoleh', 'Voti Ottenuti', '得られたマークス', '마크 획득', 'Marks verkregen', 'notas obtidas', 'ที่ได้รับเครื่องหมาย', 'Marks elde', 'مارکس حاصل', '获得商标', 'Punte gekry', 'Erhaltene Noten', 'Λήφθηκαν σήματα', 'marcas obtenidas', 'अंक प्राप्त', 'Оценки получены', 'Mærker opnået', 'Նշանները ձեռք են բերել', 'ნიშნები მიღებულია', 'गुण प्राप्त झाले', 'Tanda Diperolehi', 'ਅੰਕ ਪ੍ਰਾਪਤ ਕੀਤੇ', 'பெற்ற மதிப்பெண்கள்', 'వచ్చిన మార్కులు', 'Märken erhållna', 'Nakuha ang mga Marks'),
(123, 'attendance_for_class', 'Attendance For Class', 'এ্যাটেনডেন্স বর্গ জন্য', 'الحضور لفئة', 'Participation Pour la classe', 'उपस्थिति कक्षा के लिए', 'Kehadiran Untuk Kelas', 'Partecipazione Per la Classe', 'クラスの出席', '클래스에 대한 출석', 'Attendance Voor klasse', 'Presença Para a Classe', 'การเข้าร่วมประชุมสำหรับ Class', 'Sınıfı Seyirci', 'کلاس کے لئے حاضری', '考勤类', 'Bywoning vir klas', 'Teilnahme am Unterricht', 'Συμμετοχή στην τάξη', 'Asistencia a clase', 'कक्षाको लागि उपस्थिति', 'Посещаемость для класса', 'Deltagelse i klasse', 'Մասնակցություն դասի համար', 'დასწრება კლასში', 'वर्गासाठी उपस्थिती', 'Kehadiran Untuk Kelas', 'ਕਲਾਸ ਲਈ ਹਾਜ਼ਰੀ', 'வகுப்புக்கு வருகை', 'తరగతికి హాజరు', 'Närvaro för klass', 'Pagdalo Para sa Klase'),
(124, 'receiver', 'Receiver', 'গ্রাহক', 'المتلقي', 'Récepteur', 'रिसीवर', 'Penerima', 'Ricevitore', '受信機', '리시버', 'Ontvanger', 'recebedor', 'ผู้รับ', 'alıcı', 'وصول', '接收器', 'ontvanger', 'Empfänger', 'Δέκτης', 'Receptor', 'रिसीभर', 'Получатель', 'Modtager', 'Ստացող', 'მიმღები', 'प्राप्तकर्ता', 'Penerima', 'ਪ੍ਰਾਪਤ ਕਰਨ ਵਾਲਾ', 'பெறுநர்', 'స్వీకర్త', 'Mottagare', 'Tagatanggap'),
(125, 'please_select_receiver', 'Please Select Receiver', 'দয়া করে রিসিভার নির্বাচন', 'الرجاء الإختيار استقبال', 'S\'il vous plaît Sélectionnez Receiver', 'कृपया रिसीवर का चयन करें', 'Silakan Pilih Receiver', 'Selezionare Ricevitore', 'Receiverを選択してください', '수신기를 선택하세요', 'Selecteer Receiver', 'Selecione Receiver', 'กรุณาเลือกรับสัญญาณ', 'Alıcısı Seçiniz', 'وصول براہ مہربانی منتخب کریں', '请选择接收器', 'Kies ontvanger', 'Bitte wählen Sie Empfänger', 'Επιλέξτε παραλήπτη', 'Por favor seleccione receptor', 'कृपया रिसीभर चयन गर्नुहोस्', 'Пожалуйста, выберите получателя', 'Vælg modtager', 'Խնդրում ենք ընտրել ստացողը', 'გთხოვთ აირჩიოთ მიმღები', 'कृपया प्राप्तकर्ता निवडा', 'Sila Pilih Penerima', 'ਕਿਰਪਾ ਕਰਕੇ ਪ੍ਰਾਪਤਕਰਤਾ ਦੀ ਚੋਣ ਕਰੋ', 'பெறுநரைத் தேர்ந்தெடுக்கவும்', 'దయచేసి స్వీకర్తను ఎంచుకోండి', 'Välj mottagare', 'Mangyaring Piliin ang Tatanggap'),
(126, 'session_changed', 'Session Changed', 'সেশন পরিবর্তিত', 'جلسة تغيير', 'session Changed', 'सत्र बदली गई', 'sesi Berubah', 'sessione cambiato', 'セッションが変更します', '세션 변경', 'Session Changed', 'sessão Changed', 'เซสชั่นเปลี่ยน', 'Oturum Değişti', 'سیشن تبدیل کر دیا گیا', '会议改', 'Sessie verander', 'Sitzung geändert', 'Η περίοδος σύνδεσης άλλαξε', 'Sesión cambiada', 'सत्र परिवर्तन गरियो', 'Сессия изменена', 'Session ændret', 'Նիստը փոխվեց', 'სხდომა შეიცვალა', 'सत्र बदलले', 'Sesi Berubah', 'ਸੈਸ਼ਨ ਬਦਲਿਆ', 'அமர்வு மாற்றப்பட்டது', 'సెషన్ మార్చబడింది', 'Sessionen har ändrats', 'Nabago ang Session'),
(127, 'exam_marks', 'Exam Marks', 'পরীক্ষার মার্কস', 'علامات الامتحان', 'Marques d\'examen', 'परीक्षा मार्क्स', 'Marks ujian', 'Marks esame', '試験マークス', '시험 마크', 'examen Marks', 'Marcas de exame', 'Marks สอบ', 'sınav Marks', 'امتحان مارکس', '考试马克斯', 'Eksamenmerke', 'Prüfungsnoten', 'Σήματα εξετάσεων', 'Marcas de examen', 'परीक्षा मार्कहरू', 'Экзаменационные Знаки', 'Eksamen Marks', 'Քննության նշաններ', 'საგამოცდო ნიშნები', 'परीक्षा गुण', 'Markah Peperiksaan', 'ਪ੍ਰੀਖਿਆ ਦੇ ਅੰਕ', 'தேர்வு மதிப்பெண்கள்', 'పరీక్షా మార్కులు', 'Examensmärken', 'Exam Marks'),
(128, 'total_mark', 'Total Mark', 'মোট মার্ক', 'عدد الأقسام', 'total Mark', 'कुल मार्क', 'total Mark', 'Mark totale', '合計マーク', '총 마크', 'Totaal Mark', 'total de Mark', 'มาร์ครวม', 'Toplam Mark', 'کل مارک', '积分', 'Totale punt', 'Gesamtnote', 'Συνολικό σήμα', 'Marca total', 'कुल मार्क', 'Общая оценка', 'Samlet mærke', 'Ընդհանուր նշան', 'სულ მარკა', 'एकूण चिन्ह', 'Jumlah Markah', 'ਕੁੱਲ ਮਾਰਕ', 'மொத்த குறி', 'మొత్తం మార్క్', 'Totalt antal', 'Kabuuang Markahan'),
(129, 'mark_obtained', 'Mark Obtained', 'মার্ক প্রাপ্ত', 'علامة حصل', 'Mark Obtenu', 'चिह्न प्राप्त', 'Mark Diperoleh', 'Mark Ottenuto', 'マーク取得', '마크 획득', 'Mark verkregen', 'Mark Obtido', 'มาร์คได้รับ', 'Mark elde', 'مارک حاصل', '标记所获得', 'Mark verwerf', 'Mark erhalten', 'Ο Μαρκ αποκτήθηκε', 'Marca obtenida', 'मार्क प्राप्त भयो', 'Получено', 'Mark opnået', 'Մարկը ձեռք է բերել', 'მარკი მიიღო', 'मार्क प्राप्त', 'Markah Diperolehi', 'ਮਾਰਕ ਪ੍ਰਾਪਤ ਕੀਤਾ', 'மார்க் பெறப்பட்டது', 'మార్క్ పొందబడింది', 'Mark erhölls', 'Nakuha si Mark'),
(130, 'invoice/payment_list', 'Invoice / Payment List', 'ইনভয়েস / পেমেন্ট তালিকা', 'فاتورة / قائمة دفع', 'Facture / Liste de paiement', 'चालान / भुगतान सूची', 'Faktur / Daftar pembayaran', 'Fattura / Lista pagamento', '請求書/支払一覧', '송장 / 지불 목록', 'Factuur / betaling List', 'Invoice / Lista de pagamento', 'ใบแจ้งหนี้ / รายการชำระเงิน', 'Fatura / ödeme listesi', 'انوائس / ادائیگی کی فہرست', '发票/付款清单', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(131, 'obtained_marks', 'Obtained Marks', 'প্রাপ্ত মার্কস', 'العلامات التي تم الحصول عليها', 'Les notes obtenues', 'प्राप्त अंकों', 'Marks diperoleh', 'punteggi ottenuti', '得られマークス', '획득 마크', 'verkregen Marks', 'notas obtidas', 'เครื่องหมายที่ได้รับ', 'elde edilen Marks', 'حاصل مارکس', '获得商标', 'Punte verwerf', 'Erhaltene Noten', 'Λήφθηκαν σήματα', 'Marcas obtenidas', 'प्राप्त अंक', 'Полученные знаки', 'Opnået Marks', 'Ձեռք բերեց նշաններ', 'მიღებული ნიშნები', 'गुण प्राप्त केले', 'Tanda Mendapat', 'ਅੰਕ ਪ੍ਰਾਪਤ ਕੀਤੇ', 'பெறப்பட்ட மதிப்பெண்கள்', 'పొందిన మార్కులు', 'Erhölls märken', 'Nakuha Marks'),
(132, 'highest_mark', 'Highest Mark', 'সর্বোচ্চ মার্ক', 'أعلى الأقسام', 'le plus élevé Mark', 'उच्चतम निशान', 'Mark tertinggi', 'Massima Mark', '最高点', '최고 마크', 'hoogste Mark', 'maior Mark', 'มาร์คสูงสุด', 'En yüksek işaretle', 'سب سے زیادہ نشان', '最高分', 'Hoogste punt', 'Höchste Note', 'Υψηλότερη βαθμολογία', 'Marca más alta', 'उच्चतम मार्क', 'Высшая оценка', 'Højeste mark', 'Ամենաբարձր Մարկը', 'ყველაზე მაღალი მარკა', 'सर्वोच्च चिन्ह', 'Tanda Tertinggi', 'ਉੱਚ ਮਾਰਕ', 'உயர்ந்த குறி', 'అత్యధిక మార్క్', 'Högsta märket', 'Pinakamataas na Markahan'),
(133, 'grade', 'Grade (GPA)', 'শ্রেণী', 'درجة', 'Qualité', 'ग्रेड', 'Kelas', 'Grado', 'グレード', '학년', 'Rang', 'Grau', 'เกรด', 'sınıf', 'گریڈ', '年级', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(134, 'dashboard', 'Dashboard', 'ড্যাশবোর্ড', 'لوحة القيادة', 'Tableau de bord', 'डैशबोर्ड', 'Dasbor', 'Cruscotto', 'ダッシュボード', '계기반', 'Dashboard', 'painel de instrumentos', 'แผงควบคุม', 'gösterge paneli', 'ڈیش بورڈ', '仪表板', 'Dashboard', 'Instrumententafel', 'Ταμπλό', 'Tablero', 'ड्यासबोर्ड', 'Приборная панель', 'instrumentbræt', 'Գրասեղան', 'დაფა', 'डॅशबोर्ड', 'Papan Pemuka', 'ਡੈਸ਼ਬੋਰਡ', 'டாஷ்போர்டு', 'డాష్బోర్డ్', 'instrumentbräda', 'Dashboard'),
(135, 'student', 'Student', 'ছাত্র', 'طالب علم', 'Élève', 'छात्र', 'Mahasiswa', 'Alunno', '学生', '학생', 'Student', 'Aluna', 'นักเรียน', 'öğrenci', 'طالب علم', '学生', 'student', 'Schüler', 'Μαθητης σχολειου', 'Estudiante', 'विद्यार्थी', 'Студент', 'Studerende', 'Ուսանող', 'Სტუდენტი', 'विद्यार्थी', 'Pelajar', 'ਵਿਦਿਆਰਥੀ', 'மாணவர்', 'విద్యార్థి', 'Studerande', 'Mag-aaral'),
(136, 'rename', 'Rename', 'নামান্তর', 'إعادة تسمية', 'rebaptiser', 'नाम बदलने', 'ganti nama', 'rinominare', '名前を変更する', '이름 바꾸기', 'andere naam geven', 'renomear', 'ตั้งชื่อใหม่', 'adını değiştirmek', 'تبدیل کریں', '改名', 'Naam verander', 'Umbenennen', 'Μετονομάζω', 'Rebautizar', 'नाम बदल्नुहोस्', 'Rename', 'Omdøb', 'Անվանափոխել', 'გადარქმევა', 'नाव बदला', 'Namakan semula', 'ਨਾਮ ਬਦਲੋ', 'மறுபெயரிடு', 'పేరు మార్చు', 'Döp om', 'Palitan ang pangalan'),
(137, 'class', 'Class', 'শ্রেণী', 'صف مدرسي', 'Classe', 'कक्षा', 'Kelas', 'Classe', 'クラス', '수업', 'Klasse', 'Classe', 'ชั้น', 'sınıf', 'کلاس', '类', 'klas', 'Klasse', 'Τάξη', 'Clase', 'कक्षा', 'Учебный класс', 'klasse', 'Դաս', 'Კლასი', 'वर्ग', 'Kelas', 'ਕਲਾਸ', 'வர்க்கம்', 'క్లాస్', 'Klass', 'Klase'),
(138, 'teacher', 'Teacher', 'শিক্ষক', 'مدرس', 'Professeur', 'अध्यापक', 'Guru', 'Insegnante', '先生', '선생', 'Leraar', 'Professor', 'ครู', 'öğretmen', 'ٹیچر', '老师', 'onderwyser', 'Lehrer', 'Δάσκαλος', 'Profesor', 'शिक्षक', 'учитель', 'Lærer', 'Ուսուցիչ', 'მასწავლებელს', 'शिक्षक', 'Cikgu', 'ਅਧਿਆਪਕ', 'ஆசிரியர்', 'టీచర్', 'Lärare', 'Guro'),
(139, 'parents', 'Parents', 'মাতাপিতা', 'الآباء', 'Des parents', 'माता-पिता', 'Orangtua', 'genitori', '親', '부모님', 'Ouders', 'Pais', 'พ่อแม่', 'ebeveyn', 'والدین', '父母', 'Ouers', 'Eltern', 'Γονείς', 'Padres', 'अभिभावक', 'Родители', 'Forældre', 'Ծնողներ', 'მშობლები', 'पालक', 'Ibu bapa', 'ਮਾਪੇ', 'பெற்றோர்', 'తల్లిదండ్రులు', 'Föräldrar', 'Mga magulang'),
(140, 'subject', 'Subject', 'বিষয়', 'موضوع', 'Assujettir', 'विषय', 'Subyek', 'Soggetto', 'テーマ', '제목', 'Onderwerpen', 'Sujeito', 'เรื่อง', 'konu', 'موضوع', '学科', 'Onderwerp', 'Gegenstand', 'Θέμα', 'Tema', 'बिषय', 'Тема', 'Emne', 'Առարկա', 'საგანი', 'विषय', 'Subjek', 'ਵਿਸ਼ਾ', 'பொருள்', 'Subject', 'Ämne', 'Paksa'),
(141, 'student_attendance', 'Student Attendance', 'ছাত্র উপস্থিতি', 'حضور الطالب', 'Participation des étudiants', 'छात्र उपस्थिति', 'Kehadiran siswa', 'Frequenza degli studenti', '学生の出席', '학생 출석', 'Studentenbijwonen', 'Freqüência de estudantes', 'การเข้าเรียนของนักเรียน', 'Öğrenci yurdu', 'طلبا کی حاضری', '出席学生', 'Studente-bywoning', 'Teilnahme von Studenten', 'Φοιτητική φοίτηση', 'Asistencia estudiantil', 'विद्यार्थी उपस्थिति', 'Посещаемость студентов', 'Studerendes deltagelse', 'Ուսանողների հաճախում', 'სტუდენტური დასწრება', 'विद्यार्थ्यांची उपस्थिती', 'Kehadiran Pelajar', 'ਵਿਦਿਆਰਥੀਆਂ ਦੀ ਹਾਜ਼ਰੀ', 'மாணவர் வருகை', 'విద్యార్థుల హాజరు', 'Studentdeltagande', 'Pag-aaral ng Mag-aaral'),
(142, 'exam_list', 'Exam List', 'পরীক্ষার তালিকা', 'قائمة الامتحان', 'Liste d\'examen', 'परीक्षा सूची', 'Daftar ujian', 'Lista esame', '試験のリスト', '시험 목록', 'examen Lijst', 'Lista de exame', 'รายการสอบ', 'sınav listesi', 'امتحان کی فہرست', '考试名单', 'Eksamenlys', 'Prüfungsliste', 'Λίστα εξετάσεων', 'Lista de examen', 'परीक्षा सूची', 'Список экзаменов', 'Eksamen liste', 'Քննությունների ցուցակ', 'გამოცდების სია', 'परीक्षा यादी', 'Senarai Peperiksaan', 'ਪ੍ਰੀਖਿਆ ਸੂਚੀ', 'தேர்வு பட்டியல்', 'పరీక్షా జాబితా', 'Examellista', 'Listahan ng Exam'),
(143, 'grades_range', 'Grades Range', 'গ্রেড পরিসীমা', 'مجموعة الدرجات', 'Gamme de notes', 'ग्रेड श्रेणी', 'Kisaran nilai', 'Gamma di gradi', 'グレードの範囲', '성적 범위', 'Rangen bereik', 'Escala de notas', 'ช่วงคะแนน', 'Derece aralığı', 'گریڈ کی حد', '等级范围', 'Graadreeks', 'Notenbereich', 'Εύρος βαθμών', 'Rango de Grados', 'ग्रेड्स दायरा', 'Диапазон оценок', 'Karakterinterval', 'Դասարանների միջակայք', 'კლასების დიაპაზონი', 'ग्रेड श्रेणी', 'Julat Gred', 'ਗ੍ਰੇਡ ਰੇਂਜ', 'தர வரம்பு', 'తరగతుల పరిధి', 'Betygsnivå', 'Saklaw ng Grades'),
(144, 'loading', 'Loading', 'বোঝাই', 'جار التحميل', 'chargement', 'लोड हो रहा है', 'pemuatan', 'Caricamento in corso', 'ローディング', '로딩', 'bezig met laden', 'Carregando', 'โหลด', 'Yükleniyor', 'لوڈنگ', '装载', 'laai', 'Wird geladen', 'Φόρτωση', 'Cargando', 'लोड हुँदै', 'загрузка', 'Indlæser', 'Բեռնվում է', 'Ჩატვირთვა', 'लोड करीत आहे', 'Memuatkan', 'ਲੋਡ ਹੋ ਰਿਹਾ ਹੈ', 'ஏற்றுகிறது', 'లోడ్', 'Läser in', 'Naglo-load'),
(145, 'library', 'Library', 'লাইব্রেরি', 'مكتبة', 'Bibliothèque', 'पुस्तकालय', 'Perpustakaan', 'Biblioteca', 'ライブラリ', '도서관', 'Bibliotheek', 'Biblioteca', 'ห้องสมุด', 'kütüphane', 'لائبریری', '图书馆', 'biblioteek', 'Bibliothek', 'Βιβλιοθήκη', 'Biblioteca', 'पुस्तकालय', 'Библиотека', 'Bibliotek', 'Գրադարան', 'ბიბლიოთეკა', 'ग्रंथालय', 'Perpustakaan', 'ਲਾਇਬ੍ਰੇਰੀ', 'நூலகம்', 'గ్రంధాలయం', 'Bibliotek', 'Library'),
(146, 'hostel', 'Hostel', 'ছাত্রাবাস', 'المهجع', 'Dortoir', 'छात्रावास', 'asrama mahasiswa', 'Dormitorio', '寮', '기숙사', 'Slaapzaal', 'Dormitório', 'หอพัก', 'Yurt', 'شیناگار', '宿舍', 'Koshuis', 'Hostel', 'Ξενοδοχείο', 'Hostal', 'छात्रावास', 'Общежитие', 'Vandrerhjem', 'Հոսթել', 'Ჰოსტელი', 'वसतिगृहात', 'Asrama', 'ਹੋਸਟਲ', 'தங்கும் விடுதி', 'వసతిగృహం', 'Vandrarhem', 'Hostel'),
(147, 'events', 'Events', 'সূচনাফলক', 'اللافتة', 'Tableau d\'affichage', 'सूचना पट्ट', 'Papan peringatan', 'Bacheca', '掲示板', '공지 사항 게시판', 'Notitiebord', 'Quadro de notícias', 'กระดานป้ายติดประกาศ', 'noticeboard', 'نوٹس بورڈ', '布告栏', 'gebeure', 'Veranstaltungen', 'Εκδηλώσεις', 'Eventos', 'घटनाहरू', 'Мероприятия', 'Begivenheder', 'Իրադարձություններ', 'Ივენთი', 'कार्यक्रम', 'Acara', 'ਸਮਾਗਮ', 'நிகழ்வுகள்', 'ఈవెంట్స్', 'evenemang', 'Mga Kaganapan'),
(148, 'message', 'Message', 'বার্তা', 'الرسالة', 'Message', 'संदेश', 'Pesan', 'Messaggio', 'メッセージ', '메시지', 'Bericht', 'Mensagem', 'ข่าวสาร', 'Mesaj', 'پیغام', '信息', 'boodskap', 'Botschaft', 'Μήνυμα', 'Mensaje', 'सन्देश', 'Сообщение', 'Besked', 'Հաղորդագրություն', 'მესიჯი', 'संदेश', 'Mesej', 'ਸੁਨੇਹਾ', 'செய்தி', 'సందేశం', 'Meddelande', 'Mensahe'),
(149, 'translations', 'Translations', 'অনুবাদের', 'ترجمة', 'traductions', 'अनुवाद', 'terjemahan', 'traduzioni', '翻訳', '번역', 'vertaalwerk', 'traduções', 'แปล', 'çeviriler', 'ترجمہ', '译文', 'vertalings', 'Übersetzungen', 'Μεταφράσεις', 'Traducciones', 'अनुवाद', 'Переводы', 'Oversættelser', 'Թարգմանություններ', 'თარგმანები', 'भाषांतर', 'Terjemahan', 'ਅਨੁਵਾਦ', 'மொழிபெயர்ப்புகள்', 'అనువాదాలు', 'översättningar', 'Pagsasalin'),
(150, 'account', 'Account', 'হিসাব', 'حساب', 'Compte', 'लेखा', 'Rekening', 'account', 'アカウント', '계정', 'Account', 'Conta', 'บัญชี', 'hesap', 'اکاؤنٹ', '帐户', 'rekening', 'Konto', 'λογαριασμός', 'Cuenta', 'खाता', 'Счет', 'Konto', 'Հաշիվ', 'ანგარიში', 'खाते', 'Akaun', 'ਖਾਤਾ', 'கணக்கு', 'ఖాతా', 'konto', 'Account'),
(151, 'selected_session', 'Selected Session', 'নির্বাচিত সেশন', 'جلسة مختارة', 'session sélectionnée', 'चयनित सत्र', 'sesi terpilih', 'sessione selezionata', '選択されたセッション', '선택된 세션', 'geselecteerde sessie', 'sessão selecionada', 'เซสชันที่เลือก', 'seçilen oturum', 'منتخب کردہ سیشن', '选定的会话', 'Geselekteerde sessie', 'Ausgewählte Sitzung', 'Επιλεγμένη περίοδος σύνδεσης', 'Sesión Seleccionada', 'चयनित सत्र', 'Выбранная сессия', 'Valgt session', 'Ընտրված նիստ', 'არჩეული სესია', 'निवडलेले सत्र', 'Sesi Terpilih', 'ਚੁਣਿਆ ਸੈਸ਼ਨ', 'தேர்ந்தெடுக்கப்பட்ட அமர்வு', 'ఎంచుకున్న సెషన్', 'Vald session', 'Napiling Session'),
(152, 'change_password', 'Change Password', 'পাসওয়ার্ড পরিবর্তন করুন', 'تغيير كلمة السر', 'Changer le mot de passe', 'पासवर्ड बदलें', 'Ganti kata sandi', 'Cambia la password', 'パスワードを変更する', '암호 변경', 'Verander wachtwoord', 'Mudar senha', 'เปลี่ยนรหัสผ่าน', 'Şifre değiştir', 'پاس ورڈ تبدیل کریں', '更改密码', 'Geselekteerde sessie', 'Ausgewählte Sitzung', 'Επιλεγμένη περίοδος σύνδεσης', 'Sesión Seleccionada', 'चयनित सत्र', 'Выбранная сессия', 'Valgt session', 'Ընտրված նիստ', 'არჩეული სესია', 'निवडलेले सत्र', 'Sesi Terpilih', 'ਚੁਣਿਆ ਸੈਸ਼ਨ', 'தேர்ந்தெடுக்கப்பட்ட அமர்வு', 'ఎంచుకున్న సెషన్', 'Vald session', 'Napiling Session'),
(153, 'section', 'Section', 'অধ্যায়', 'قسم', 'Section', 'अनुभाग', 'Bagian', 'Sezione', 'セクション', '섹션', 'sectie', 'Seção', 'มาตรา', 'Bölüm', 'سیکشن', '部分', 'artikel', 'Sektion', 'Ενότητα', 'Sección', 'खण्ड', 'Раздел', 'Afsnit', 'Բաժին', 'განყოფილება', 'विभाग', 'Bahagian', 'ਅਨੁਭਾਗ', 'பிரிவு', 'విభాగం', 'Sektion', 'Seksyon'),
(154, 'edit', 'Edit', 'সম্পাদন করা', 'تحرير', 'modifier', 'संपादित करें', 'mengedit', 'Modifica', '編集', '편집하다', 'Bewerk', 'Editar', 'แก้ไข', 'Düzenleme', 'تصیح', '编辑', 'wysig', 'Bearbeiten', 'Επεξεργασία', 'Editar', 'सम्पादन गर्नुहोस्', 'редактировать', 'Redigere', 'Խմբագրել', 'რედაქტირება', 'सुधारणे', 'Edit', 'ਸੰਪਾਦਿਤ ਕਰੋ', 'தொகு', 'మార్చు', 'Redigera', 'I-edit'),
(155, 'delete', 'Delete', 'মুছে ফেলা', 'حذف', 'Effacer', 'मिटाना', 'Menghapus', 'cancellare', '削除', '지우다', 'Verwijder', 'Excluir', 'ลบ', 'silmek', 'حذف کریں', '删除', 'Delete', 'Löschen', 'Διαγράφω', 'Eliminar', 'मेटाउन', 'удалять', 'Slet', 'Նջել', 'წაშლა', 'हटवा', 'Padam', 'ਮਿਟਾਓ', 'அழி', 'తొలగించు', 'Radera', 'Tanggalin'),
(156, 'cancel', 'Cancel', 'বাতিল', 'إلغاء', 'Annuler', 'रद्द करना', 'Membatalkan', 'Annulla', 'キャンセル', '취소', 'Annuleer', 'Cancelar', 'ยกเลิก', 'İptal', 'منسوخ کریں', '取消', 'kanselleer', 'Stornieren', 'Ματαίωση', 'Cancelar', 'रद्द गर्नुहोस्', 'Отмена', 'Afbestille', 'Չեղարկել', 'გაუქმება', 'रद्द करा', 'Batal', 'ਰੱਦ ਕਰੋ', 'ரத்துசெய்', 'రద్దు చేయండి', 'Avbryt', 'Pagkansela'),
(157, 'parent', 'Parent', 'মাতা', 'أصل', 'Parent', 'माता-पिता', 'Induk', 'Genitore', '親', '부모의', 'Ouder', 'parente', 'ผู้ปกครอง', 'ebeveyn', 'والدین', '亲', 'ouer', 'Elternteil', 'Μητρική εταιρεία', 'Padre', 'अभिभावक', 'родитель', 'Forældre', 'Ծնող', 'მშობელი', 'पालक', 'Ibu bapa', 'ਮਾਪੇ', 'பெற்றோர்', 'మాతృ', 'Förälder', 'Magulang'),
(158, 'attendance', 'Attendance', 'উপস্থিতি', 'الحضور', 'Présence', 'उपस्थिति', 'Kehadiran', 'partecipazione', '出席', '출석', 'opkomst', 'Comparecimento', 'การดูแลรักษา', 'katılım', 'حاضری', '护理', 'Bywoning', 'Teilnahme', 'Παρουσία', 'Asistencia', 'उपस्थित', 'посещаемость', 'Tilstedeværelse', 'Հաճախում', 'დასწრება', 'उपस्थिती', 'Kehadiran', 'ਹਾਜ਼ਰੀ', 'வருகை', 'హాజరు', 'Närvaro', 'Pagdalo'),
(159, 'addmission_form', 'Admission Form', 'ভর্তির ফর্ম', 'شكل القبول', 'Formulaire d\'admission', 'प्रवेश फार्म', 'Formulir Pendaftaran', 'Modulo di ammissione', '入学式', '입학 허가서', 'Toelatingsformulier', 'Formulário de admissão', 'แบบฟอร์มการรับสมัคร', 'Kabul Formu', 'داخلہ فارم', '入学表格', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(160, 'name', 'Name', 'নাম', 'اسم', 'prénom', 'नाम', 'Nama', 'Nome', '名', '이름', 'Naam', 'Nome', 'ชื่อ', 'isim', 'نام', '名称', 'naam', 'Name', 'Ονομα', 'Nombre', 'नाम', 'имя', 'Navn', 'Անուն', 'სახელი', 'नाव', 'Nama', 'ਨਾਮ', 'பெயர்', 'పేరు', 'namn', 'Pangalan'),
(161, 'select', 'Select', 'নির্বাচন করা', 'اختار', 'Sélectionner', 'चुनते हैं', 'Memilih', 'Selezionare', '選択します', '고르다', 'kiezen', 'selecionar', 'เลือก', 'seçmek', 'منتخب کریں', '选择', 'Kies', 'Wählen', 'Επιλέγω', 'Seleccione', 'चयन गर्नुहोस्', 'Выбрать', 'Vælg', 'Ընտրեք', 'შეარჩიეთ', 'निवडा', 'Pilih', 'ਚੁਣੋ', 'தேர்ந்தெடு', 'ఎంచుకోండి', 'Välj', 'Piliin'),
(162, 'roll', 'Roll', 'রোল', 'لفة', 'Roulent', 'रोल', 'Gulungan', 'Rotolo', 'ロール', '롤', 'Rollen', 'Rolo', 'ม้วน', 'Rulo', 'رول', '滚', 'roll', 'Rollen', 'Ρολό', 'Rodar', 'रोल', 'Рулон', 'Rulle', 'Գլորել', 'გააფართოვოს', 'रोल', 'Gulung', 'ਰੋਲ', 'ரோல்', 'రోల్', 'Roll', 'Gumulong'),
(163, 'birthday', 'Date Of Birth', 'জন্ম তারিখ', 'تاريخ الميلاد', 'Anniversaire', 'जन्मदिन', 'Ulang tahun', 'Compleanno', 'お誕生日', '생일', 'Verjaardag', 'Aniversário', 'วันเกิด', 'Doğum günü', 'سالگرہ', '生日', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(164, 'gender', 'Gender', 'লিঙ্গ', 'جنس', 'Le genre', 'लिंग', 'Jenis kelamin', 'Genere', '性別', '성별', 'Geslacht', 'Gênero', 'เพศ', 'Cinsiyet', 'صنف', '性别', 'geslag', 'Geschlecht', 'Γένος', 'Género', 'लि .्ग', 'Пол', 'Køn', 'Գենդեր', 'გენდერი', 'लिंग', 'Jantina', 'ਲਿੰਗ', 'பாலினம்', 'జెండర్', 'Kön', 'Kasarian'),
(165, 'male', 'Male', 'পুরুষ', 'ذكر', 'Mâle', 'नर', 'Pria', 'Maschio', '男性', '남성', 'Mannetje', 'Masculino', 'ชาย', 'Erkek', 'مرد', '男', 'Manlik', 'Männlich', 'Αρσενικός', 'Masculino', 'नर', 'мужчина', 'Han', 'Արական', 'მამაკაცი', 'नर', 'Lelaki', 'ਮਰਦ', 'ஆண்', 'పురుషుడు', 'Manlig', 'Lalaki'),
(166, 'female', 'Female', 'মহিলা', 'أنثى', 'Femelle', 'महिला', 'Wanita', 'Femmina', '女性', '여자', 'Vrouw', 'Fêmea', 'หญิง', 'Kadın', 'خواتین', '女', 'vroulike', 'Weiblich', 'Θηλυκός', 'Hembra', 'महिला', 'женский', 'Kvinde', 'իգական', 'ქალი', 'स्त्री', 'Perempuan', 'Femaleਰਤ', 'பெண்', 'స్త్రీ', 'Kvinna', 'Babae'),
(167, 'address', 'Address', 'ঠিকানা', 'عنوان', 'Adresse', 'पता', 'Alamat', 'Indirizzo', '住所', '주소', 'Adres', 'Endereço', 'ที่อยู่', 'adres', 'ایڈریس', '地址', 'adres', 'Adresse', 'Διεύθυνση', 'Habla a', 'ठेगाना', 'Адрес', 'Adresse', 'Հասցե', 'მისამართი', 'पत्ता', 'Alamat', 'ਪਤਾ', 'முகவரி', 'చిరునామా', 'Adress', 'Address'),
(168, 'phone', 'Phone', 'ফোন', 'هاتف', 'Téléphone', 'फ़ोन', 'Telepon', 'Telefono', '電話', '전화', 'Telefoon', 'Telefone', 'โทรศัพท์', 'Telefon', 'فون', '电话', 'Foon', 'Telefon', 'Τηλέφωνο', 'Teléfono', 'फोन', 'Телефон', 'telefon', 'Հեռախոս', 'ტელეფონი', 'फोन', 'Telefon', 'ਫੋਨ', 'தொலைபேசி', 'ఫోన్', 'Telefon', 'Telepono'),
(169, 'email', 'Email', 'ই-মেইল', 'البريد الإلكتروني', 'Email', 'ईमेल', 'E-mail', 'E-mail', 'Eメール', '이메일', 'E-mail', 'O email', 'อีเมล์', 'E-posta', 'دوستوں کوارسال کریں', '电子邮件', 'e-pos', 'Email', 'ΗΛΕΚΤΡΟΝΙΚΗ ΔΙΕΥΘΥΝΣΗ', 'Correo electrónico', 'ईमेल', 'Электронное письмо', 'E-mail', 'Էլ', 'ელ.ფოსტა', 'ईमेल', 'E-mel', 'ਈ - ਮੇਲ', 'மின்னஞ்சல்', 'ఇమెయిల్', 'E-post', 'Email'),
(170, 'password', 'Password', 'পাসওয়ার্ড', 'كلمه السر', 'Mot de passe', 'पासवर्ड', 'Kata sandi', 'parola d\'ordine', 'パスワード', '암호', 'Wachtwoord', 'Senha', 'รหัสผ่าน', 'Parola', 'پاس ورڈ', '密码', 'wagwoord', 'Passwort', 'Κωδικός πρόσβασης', 'Contraseña', 'पासवर्ड', 'пароль', 'Adgangskode', 'Գաղտնաբառ', 'პაროლი', 'संकेतशब्द', 'Kata Laluan', 'ਪਾਸਵਰਡ', 'கடவுச்சொல்', 'పాస్వర్డ్', 'Lösenord', 'Password'),
(171, 'transport_route', 'Transport Route', 'পরিবহন রুট', 'النقل الطريق', 'Transport Route', 'परिवहन मार्ग', 'Transportasi Route', 'Transport Route', '交通ルート', '운송 경로', 'transport Route', 'Itinerários', 'เส้นทางขนส่ง', 'Ulaştırma Rota', 'ٹرانسپورٹ روٹ', '运输路线', 'Padvervoer', 'Straßentransport', 'Οδικές μεταφορές', 'Transporte por carretera', 'सडक यातायात', 'Транспортный маршрут', 'Vejtransport', 'Ճանապարհային տրանսպորտ', 'საგზაო ტრანსპორტი', 'रस्ता वाहतूक', 'Pengangkutan Jalan', 'ਸੜਕ ਆਵਾਜਾਈ', 'சாலை போக்குவரத்து', 'రహదారి రవాణా', 'Vägtransport', 'Transportasyon sa Daan'),
(172, 'photo', 'Photo', 'ছবি', 'صورة فوتوغرافية', 'photo', 'तस्वीर', 'Foto', 'Foto', '写真', '사진', 'Foto', 'foto', 'ภาพถ่าย', 'fotoğraf', 'تصویر', '照片', 'foto', 'Foto', 'φωτογραφία', 'Foto', 'फोटो', 'Фото', 'Foto', 'Լուսանկար', 'ფოტო', 'छायाचित्र', 'Foto', 'ਤਸਵੀਰ', 'புகைப்படம்', 'ఫోటో', 'Foto', 'Larawan'),
(173, 'select_class', 'Select Class', 'ক্লাস নির্বাচন', 'حدد فئة', 'Sélectionnez la classe', 'वर्ग का चयन', 'Pilih Kelas', 'Seleziona classe', 'クラスを選択します', '선택 클래스', 'Select Class', 'Selecionar classe', 'เลือกชั้นเรียน', 'seçin Sınıf', 'کلاس منتخب', '选择类别', 'Kies klas', 'Wählen Sie Klasse', 'Επιλέξτε τάξη', 'Seleccione clase', 'कक्षा चयन गर्नुहोस्', 'Выберите класс', 'Vælg klasse', 'Ընտրեք դաս', 'აირჩიეთ კლასი', 'वर्ग निवडा', 'Pilih Kelas', 'ਕਲਾਸ ਚੁਣੋ', 'வகுப்பைத் தேர்ந்தெடுக்கவும்', 'తరగతి ఎంచుకోండి', 'Välj klass', 'Piliin ang Klase'),
(174, 'username_password_incorrect', 'Username Or Password Is Incorrect', 'ব্যাবহারকারীর নাম অথবা গোপন নাম্বারটি ভুল', 'اسم المستخدم أو كلمة المرور غير صحيحة', 'L\'identifiant ou le mot de passe est incorrect', 'उपयोगकर्ता नाम या पासवर्ड गलत है', 'Nama pengguna atau kata sandi salah', 'Nome utente o password non sono corretti', 'ユーザー名かパスワードが間違っています', '사용자 이름 또는 암호가 올바르지 않습니다', 'Gebruikersnaam of wachtwoord is onjuist', 'Nome de usuário ou senha está incorreta', 'ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง', 'Kullanıcı adı veya şifre yanlış', 'صارف کا نام یا پاس ورڈ غلط ہے', '用户名或密码不正确', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(175, 'select_section', 'Select Section', 'অনুচ্ছেদ নির্বাচন', 'حدد القسم', 'Sélectionnez Section', 'अनुभाग का चयन', 'Pilih Bagian', 'Seleziona sezione', 'セクションを選択します', '선택 섹션', 'Select Section', 'Select Section', 'เลือกส่วน', 'seç Bölüm', 'سیکشن منتخب', '选择部分', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(176, 'options', 'Options', 'বিকল্প', 'خيارات', 'options de', 'विकल्प', 'Pilihan', 'Opzioni', 'オプション', '옵션', 'opties', 'opções', 'ตัวเลือก', 'Seçenekler', 'اختیارات', '选项', 'opsies', 'Optionen', 'Επιλογές', 'Opciones', 'विकल्पहरू', 'Опции', 'Muligheder', 'Ընտրանքներ', 'Პარამეტრები', 'पर्याय', 'Pilihan', 'ਚੋਣਾਂ', 'விருப்பங்கள்', 'ఎంపికలు', 'alternativ', 'Mga Pagpipilian'),
(177, 'mark_sheet', 'Mark Sheet', 'নাম্বার শিট', 'ورقة علامة', 'Mark Sheet', 'अंक तालिका', 'Lembar penilaian', 'Libretto universitario', 'マークシート', '마크 시트', 'Mark Sheet', 'Mark Sheet', 'มาร์คแผ่น', 'İşareti levha', 'مارک شیٹ', '标记表', 'Merkblad', 'Markierungsblatt', 'Φυλλάδιο απαντήσεων', 'Marcar hoja', 'मार्क पाना', 'Марк Шит', 'Mark Sheet', 'Մարկ Թերթիկը', 'Ნიშნის ფურცელი', 'गुणपत्रिका', 'Helaian Tandakan', 'ਮਾਰਕ ਸ਼ੀਟ', 'மதிப்பீட்டு தாள்', 'గణాంకాల పట్టి', 'Mark Sheet', 'Markahang papel'),
(178, 'profile', 'Profile', 'প্রোফাইলে', 'الملف الشخصي', 'Profil', 'प्रोफाइल', 'profil', 'Profilo', 'プロフィール', '윤곽', 'Profiel', 'Perfil', 'ข้อมูลส่วนตัว', 'Profil', 'پروفائل', '轮廓', 'profiel', 'Profil', 'Προφίλ', 'Perfil', 'प्रोफाइल', 'Профиль', 'Profil', 'Անձնագիր', 'პროფილი', 'प्रोफाइल', 'Profil', 'ਪ੍ਰੋਫਾਈਲ', 'சுயவிவரம்', 'ప్రొఫైల్', 'Profil', 'Profile'),
(179, 'select_all', 'Select All', 'সবগুলো নির্বাচন করা', 'اختر الكل', 'Sélectionner tout', 'सभी का चयन करे', 'Pilih Semua', 'Seleziona tutto', 'すべて選択', '모두 선택', 'Selecteer alles', 'Selecionar tudo', 'เลือกทั้งหมด', 'Hepsini seç', 'تمام منتخب کریں', '全选', 'Kies alles', 'Wählen Sie Alle', 'Επιλογή όλων', 'Seleccionar todo', 'सबै छान्नु', 'Выбрать все', 'Vælg alle', 'Ընտրել բոլորը', 'Მონიშნე ყველა', 'सर्व निवडा', 'Pilih semua', 'ਸਾਰਿਆ ਨੂੰ ਚੁਣੋ', 'அனைத்தையும் தெரிவுசெய்', 'అన్ని ఎంచుకోండి', 'Välj alla', 'Piliin lahat'),
(180, 'select_none', 'Select None', 'কিছুই না', 'حدد بلا', 'Ne rien sélectionner', 'किसी का चयन न करें', 'Pilih Tidak', 'Non selezionare niente', '何も選択しません', '선택 없음', 'Niets selecteren', 'Selecione nenhum', 'เลือกไม่มี', 'Hiçbir şey seçilmedi', 'کوئی بھی منتخب', '选择无', 'Kies Geen', 'Nichts ausgewählt', 'Επιλέξτε Κανένα', 'No seleccionar ninguno', 'कुनै पनि चयन नगर्नुहोस्', 'Выберите Нет', 'Vælg Ingen', 'Ընտրեք ոչ մեկը', 'აირჩიეთ არცერთი', 'काहीही निवडा', 'Pilih Tiada', 'ਕੋਈ ਨਹੀਂ ਚੁਣੋ', 'எதுவுமில்லை என்பதைத் தேர்ந்தெடுக்கவும்', 'ఏది కాదు', 'Välj ingen', 'Piliin ang Wala'),
(181, 'average', 'Average', 'গড়', 'متوسط', 'Moyenne', 'औसत', 'rata-rata', 'Media', '平均', '평균', 'Gemiddelde', 'Média', 'เฉลี่ย', 'Ortalama', 'اوسط', '平均', 'Gemiddeld', 'Durchschnittlich', 'Μέση τιμή', 'Promedio', 'औसत', 'Средний', 'Gennemsnit', 'Միջին', 'საშუალო', 'सरासरी', 'Rata-rata', '.ਸਤ', 'சராசரி', 'సగటు', 'Medel', 'Karaniwan'),
(182, 'transfer', 'Transfer', 'হস্তান্তর', 'تحويل', 'transfert', 'स्थानांतरण', 'transfer', 'trasferimento', '転送', '이전', 'overdracht', 'transferir', 'โอน', 'aktarma', 'منتقلی', '转让', 'oordrag', 'Transfer', 'ΜΕΤΑΦΟΡΑ', 'Transferir', 'स्थानान्तरण', 'Перечислить', 'Overførsel', 'Փոխանցում', 'Გადაცემა', 'हस्तांतरण', 'Pindah', 'ਟ੍ਰਾਂਸਫਰ', 'இடமாற்றம்', 'ట్రాన్స్ఫర్', 'Överföra', 'Transfer'),
(183, 'edit_teacher', 'Edit Teacher', 'গুরু সম্পাদনা', 'تحرير المعلم', 'Modifier enseignant', 'शिक्षक संपादित करें', 'mengedit Guru', 'Modifica Maestro', '編集教師', '편집 교사', 'Leraar bewerken', 'Editar professor', 'แก้ไขครู', 'Düzenleme Öğretmen', 'ٹیچر ترمیم کریں', '编辑老师', 'Wysig onderwyser', 'Lehrer bearbeiten', 'Επεξεργασία καθηγητή', 'Editar profesor', 'शिक्षक सम्पादन गर्नुहोस्', 'Редактировать Учителя', 'Rediger lærer', 'Խմբագրել ուսուցիչը', 'მასწავლებლის რედაქტირება', 'शिक्षक संपादित करा', 'Guru Sunting', 'ਸੋਧ ਅਧਿਆਪਕ', 'ஆசிரியரைத் திருத்து', 'గురువును సవరించండి', 'Redigera lärare', 'I-edit ang Guro'),
(184, 'sex', 'Sex', 'লিঙ্গ', 'جنس', 'Sexe', 'लिंग', 'Seks', 'Sesso', 'セックス', '섹스', 'Seks', 'Sexo', 'เพศ', 'Seks', 'جنس', '性别', 'seks', 'Sex', 'Φύλο', 'Sexo', 'सेक्स', 'секс', 'Køn', 'Սեռը', 'სექსი', 'लिंग', 'Seks', 'ਸੈਕਸ', 'செக்ஸ்', 'సెక్స్', 'Sex', 'Kasarian'),
(185, 'marksheet_for', 'Marksheet For', 'মার্ক শীট', 'ورقة علامة ل', 'Marquer les feuilles pour', 'Marksheet For', 'Mark lembar untuk', 'fogli marchio per', '用マークシート', '에 대한 마크 시트', 'Mark platen voor', 'Marcar folhas para', 'แผ่นมาร์คสำหรับ', 'Mark levhalar', 'Marksheet For', '马克薄板', 'Merkblad vir', 'Markenblatt für', 'Φύλλο σήματος για', 'Hoja de cálculo para', 'मार्कसिटका लागि', 'Marksheet для', 'Mærketegn for', 'Marksheet համար', 'Marksheet for', 'साठी मार्कशीट', 'Lembaran markah untuk', 'ਲਈ ਮਾਰਕਸ਼ੀਟ', 'க்கான மார்க்ஷீட்', 'కోసం మార్క్‌షీట్', 'Märkeark för', 'Marksheet para sa'),
(186, 'total_marks', 'Total Marks', 'মোট মার্কস', 'مجموع الدرجات', 'total de points', 'कुल मार्क', 'total Marks', 'Marks totali', '総マークス', '총 마크', 'Totaal Marks', 'total de Marcas', 'Marks รวม', 'Toplam Marks', 'کل مارکس', '总分', 'Totale punte', 'Gesamtnoten', 'Σύνολο σημείων', 'Notas totales', 'कुल मार्कहरू', 'Всего знаков', 'Samlede mærker', 'Ընդհանուր նշաններ', 'სულ ნიშნები', 'एकूण गुण', 'Jumlah Markah', 'ਕੁੱਲ ਅੰਕ', 'மொத்த மதிப்பெண்கள்', 'మొత్తం మార్కులు', 'Totalt betyg', 'Kabuuang Mga Marko'),
(187, 'parent_phone', 'Parent Phone', 'পেরেন্ট ফোন', 'الأم الهاتف', 'Parent téléphone', 'माता पिता के फोन', 'induk Telepon', 'Parent Phone', '親の携帯電話', '부모 전화', 'Parent Phone', 'pais Telefone', 'ผู้ปกครองโทรศัพท์', 'Veli Telefon', 'والدین فون', '家长电话', 'Ouerfoon', 'Übergeordnetes Telefon', 'Μητρικό τηλέφωνο', 'Teléfono de los padres', 'अभिभावक फोन', 'Родительский телефон', 'Overordnet telefon', 'Ծնողների հեռախոս', 'მშობლის ტელეფონი', 'मूळ फोन', 'Telefon Ibu Bapa', 'ਮੁੱ Phoneਲਾ ਫੋਨ', 'பெற்றோர் தொலைபேசி', 'తల్లిదండ్రుల ఫోన్', 'Föräldertelefon', 'Telepono ng Magulang'),
(188, 'subject_author', 'Subject Author', 'বিষয় লেখক', 'الموضوع المؤلف', 'Sujet Auteur', 'विषय लेखक', 'Subjek Penulis', 'Autore del soggetto', 'テーマ作成者', '제목 작성자', 'Onderwerp Auteur', 'Assunto Autor', 'ผู้แต่งเรื่อง', 'Konu Yazar', 'موضوع مصنف', '主题作者', 'Vakskrywer', 'Betreff Autor', 'Θέμα Συγγραφέας', 'Autor sujeto', 'विषय लेखक', 'Автор темы', 'Emne forfatter', 'Առարկայի հեղինակ', 'საგნის ავტორი', 'विषय लेखक', 'Pengarang Subjek', 'ਵਿਸ਼ਾ ਲੇਖਕ', 'பொருள் ஆசிரியர்', 'విషయం రచయిత', 'Ämnesförfattare', 'May-akda ng Paksa'),
(189, 'update', 'Update', 'হালনাগাদ', 'تحديث', 'Mettre à jour', 'अपडेट', 'Memperbarui', 'Aggiornare', '更新', '최신 정보', 'Bijwerken', 'Atualizar', 'ปรับปรุง', 'Güncelleştirme', 'اپ ڈیٹ', '更新', 'Opdateer', 'Aktualisieren', 'Εκσυγχρονίζω', 'Actualizar', 'अद्यावधिक गर्नुहोस्', 'Обновить', 'Opdatering', 'Թարմացում', 'განახლება', 'अद्यतनित करा', 'Kemas kini', 'ਅਪਡੇਟ', 'புதுப்பிப்பு', 'నవీకరణ', 'Uppdatering', 'I-update'),
(190, 'class_list', 'Class List', 'ক্লাস তালিকা', 'قائمة الطبقة', 'Liste des classes', 'कक्षा सूची', 'Daftar kelas', 'Lista Class', 'クラス一覧', '클래스 목록', 'class List', 'Lista de Classes', 'รายการระดับ', 'sınıf listesi', 'کلاس کی فہرست', '班级列表', 'Klaslys', 'Klassenliste', 'Λίστα τάξεων', 'Lista de clase', 'वर्ग सूची', 'Список классов', 'Klasseliste', 'Դասերի ցուցակ', 'კლასების სია', 'वर्ग यादी', 'Senarai Kelas', 'ਕਲਾਸ ਲਿਸਟ', 'வகுப்பு பட்டியல்', 'తరగతి జాబితా', 'Klasslista', 'Listahan ng Klase'),
(191, 'class_name', 'Class Name', 'শ্রেণির নাম', 'اسم الطبقة', 'Nom du cours', 'कक्षा का नाम', 'Nama kelas', 'Nome della classe', 'クラス名', '클래스 이름', 'Naam van de klasse', 'Nome da classe', 'ชื่อชั้น', 'Sınıf adı', 'کلاس نام', '类名', 'Klasnaam', 'Klassenname', 'Ονομα τάξης', 'Nombre de la clase', 'कक्षाको नाम', 'Имя класса', 'Klasse Navn', 'Դասի անվանումը', 'კლასის სახელი', 'वर्गाचे नाव', 'Nama Kelas', 'ਕਲਾਸ ਦਾ ਨਾਮ', 'வகுப்பு பெயர்', 'తరగతి పేరు', 'Klassnamn', 'Pangalan ng klase'),
(192, 'name_numeric', 'Name Numeric', 'নাম সংখ্যাসূচক', 'اسم الرقمية', 'Nom numérique', 'नाम संख्यात्मक', 'nama Numeric', 'nome numerico', '名前数値', '이름 숫자', 'naam Numeriek', 'nome numérico', 'ชื่อตัวเลข', 'isim Sayısal', 'نام نمبری', '名称数字', 'Noem numeries', 'Name Numerisch', 'Όνομα αριθμητικό', 'Nombre numérico', 'नाम संख्यात्मक', 'Имя Числовое', 'Navn Numerisk', 'Անվան թվանշան', 'სახელი რიცხვითი', 'नाव सांख्यिक', 'Namakan Numerik', 'ਨਾਮ ਸੰਖਿਆਤਮਕ', 'பெயர் எண்', 'పేరు సంఖ్యా', 'Namn numeriskt', 'Pangalan ng Numeric'),
(193, 'select_teacher', 'Select Teacher', 'গুরু নির্বাচন', 'حدد المعلم', 'Sélectionnez ce professeur', 'शिक्षक का चयन', 'Pilih Guru', 'Seleziona insegnante', '教師を選択', '선택 교사', 'Selecteer Teacher', 'Escolha um professor', 'เลือกครู', 'seçin Öğretmen', 'ٹیچر منتخب', '选择教师', 'Kies Onderwyser', 'Wählen Sie Lehrer', 'Επιλέξτε Δάσκαλος', 'Seleccionar profesor', 'शिक्षक चयन गर्नुहोस्', 'Выберите учителя', 'Vælg Lærer', 'Ընտրեք Ուսուցիչ', 'შეარჩიეთ მასწავლებელი', 'शिक्षक निवडा', 'Pilih Guru', 'ਅਧਿਆਪਕ ਦੀ ਚੋਣ ਕਰੋ', 'ஆசிரியரைத் தேர்ந்தெடுக்கவும்', 'గురువును ఎంచుకోండి', 'Välj lärare', 'Piliin ang Guro'),
(194, 'edit_class', 'Edit Class', 'ক্লাস সম্পাদনা', 'تحرير الفئة', 'Modifier la classe', 'कक्षा संपादित करें', 'mengedit Kelas', 'Modifica Class', '編集クラス', '편집 클래스', 'klasse bewerken', 'Editar Classe', 'แก้ไขชั้น', 'Düzenleme Sınıfı', 'تصیح کلاس', '编辑类', 'Klas wysig', 'Klasse bearbeiten', 'Επεξεργασία τάξης', 'Editar clase', 'कक्षा सम्पादन गर्नुहोस्', 'Редактировать класс', 'Rediger klasse', 'Խմբագրել դասը', 'რედაქტირების კლასი', 'वर्ग संपादित करा', 'Edit Kelas', 'ਕਲਾਸ ਸੰਪਾਦਿਤ ਕਰੋ', 'வகுப்பைத் திருத்து', 'తరగతిని సవరించండి', 'Redigera klass', 'I-edit ang Klase'),
(195, 'section_name', 'Section Name', 'অনুচ্ছেদ নাম', 'اسم القسم', 'Nom de la section', 'अनुभाग का नाम', 'bagian Nama', 'Nome sezione', 'セクション名', '섹션 이름', 'sectie Naam', 'Nome da seção', 'ส่วนชื่อ', 'bölüm Adı', 'حصے کا نام', '部分名称', 'Afdelingsnaam', 'Abteilungsname', 'Όνομα ενότητας', 'Nombre de la sección', 'सेक्सन नाम', 'Название раздела', 'Sektionsnavn', 'Բաժնի անվանումը', 'განყოფილების სახელი', 'विभाग नाव', 'Nama Bahagian', 'ਭਾਗ ਦਾ ਨਾਮ', 'பிரிவு பெயர்', 'విభాగం పేరు', 'Avdelningsnamn', 'Pangalan ng Seksyon'),
(196, 'add_section', 'Add Section', 'অনুচ্ছেদ যোগ', 'إضافة مقطع', 'Ajouter Section', 'धारा जोड़े', 'Tambahkan Bagian', 'Aggiungere Sezione', 'セクションを追加します。', '섹션 추가', 'Sectie toevoegen', 'Adicionar Seção', 'เพิ่มส่วน', 'Bölüm ekle', 'سیکشن کا اضافہ کریں', '添加章节', 'Voeg afdeling by', 'Abschnitt hinzufügen', 'Προσθήκη ενότητας', 'Agregar sección', 'सेक्सन जोड्नुहोस्', 'Добавить раздел', 'Tilføj sektion', 'Ավելացնել բաժին', 'სექციის დამატება', 'विभाग जोडा', 'Tambah Bahagian', 'ਭਾਗ ਸ਼ਾਮਲ ਕਰੋ', 'பிரிவைச் சேர்க்கவும்', 'విభాగాన్ని జోడించండి', 'Lägg till avsnitt', 'Magdagdag ng Seksyon'),
(197, 'subject_list', 'Subject List', 'বিষয় তালিকা', 'قائمة الموضوع', 'Liste Sujet', 'विषय सूची', 'Daftar subjek', 'soggetto List', '件名一覧', '주제 목록', 'subject List', 'Assunto Lista', 'รายการหัวเรื่อง', 'Konu listesi', 'موضوع لسٹ', '主题列表', 'Vaklys', 'Betreffliste', 'Λίστα θεμάτων', 'Lista de temas', 'विषय सूची', 'Список тем', 'Emneliste', 'Առարկաների ցուցակը', 'საგნების სია', 'विषय यादी', 'Senarai Subjek', 'ਵਿਸ਼ਾ ਸੂਚੀ', 'பொருள் பட்டியல்', 'విషయ జాబితా', 'Ämneslista', 'Listahan ng Paksa'),
(198, 'subject_name', 'Subject Name', 'বিষয় নাম', 'اسم الموضوع', 'Nom Sujet', 'विषय नाम', 'Nama subjek', 'soggetto Nome', 'サブジェクト名', '주체 이름', 'onderwerp Naam', 'Nome Assunto', 'ชื่อเรื่อง', 'Konu Adı', 'موضوع کا نام', '主题名称', 'Onderwerpnaam', 'Subjekt Name', 'Όνομα θέματος', 'Nombre del tema', 'बिषय नाम', 'Имя субъекта', 'Emne navn', 'Առարկայի անունը', 'საგნის სახელი', 'विषयाचे नाव', 'Nama Subjek', 'ਵਿਸ਼ਾ ਨਾਮ', 'பொருள் பெயர்', 'విషయం పేరు', 'Ämnesnamn', 'Pangalan ng Paksa'),
(199, 'edit_subject', 'Edit Subject', 'বিষয় সম্পাদনা', 'تحرير الموضوع', 'Modifier Objet', 'विषय संपादित करें', 'Edit Perihal', 'Modifica oggetto', '編集件名', '편집 주제', 'Onderwerp bewerken', 'Editar assunto', 'แก้ไขเรื่อง', 'Konu Düzenle', 'موضوع میں ترمیم کریں', '编辑主题', 'Wysig onderwerp', 'Betreff bearbeiten', 'Επεξεργασία θέματος', 'Editar asunto', 'विषय सम्पादन गर्नुहोस्', 'Изменить тему', 'Rediger emne', 'Խմբագրել առարկան', 'საგნის რედაქტირება', 'विषय संपादित करा', 'Edit Subjek', 'ਵਿਸ਼ਾ ਸੋਧੋ', 'பொருளைத் திருத்து', 'విషయాన్ని సవరించండి', 'Redigera ämne', 'I-edit ang Paksa'),
(200, 'day', 'Day', 'দিন', 'يوم', 'journée', 'दिन', 'Hari', 'Giorno', '日', '일', 'Dag', 'Dia', 'วัน', 'Gün', 'ڈے', '天', 'dag', 'Tag', 'Ημέρα', 'Día', 'दिन', 'День', 'Dag', 'Օր', 'Დღეს', 'दिवस', 'Hari', 'ਦਿਨ', 'நாள்', 'డే', 'Dag', 'Araw'),
(201, 'starting_time', 'Starting Time', 'সময় শুরু', 'ابتداء من الوقت', 'Heure de départ', 'प्रारम्भ का समय', 'Waktu mulai', 'Tempo di partenza', '起動時間', '시간 시작', 'Starttijd', 'Tempo de partida', 'เวลาเริ่มต้น', 'Başlangıç ​​zamanı', 'وقت پر شروع', '开始时间', 'Aanvangstyd', 'Anfangszeit', 'Ωρα έναρξης', 'Tiempo de empezar', 'सुरु हुने समय', 'Время начала', 'Starttidspunkt', 'Մեկնարկի ժամանակը', 'დაწყების დრო', 'प्रारंभ वेळ', 'Masa Bermula', 'ਅਰੰਭ ਕਰਨ ਦਾ ਸਮਾਂ', 'தொடக்க நேரம்', 'ప్రారంభ సమయం', 'Starttid', 'Panimulang Panahon'),
(202, 'hour', 'Hour', 'ঘন্টা', 'ساعة', 'Heure', 'समय', 'Jam', 'Ora', '時間', '시간', 'Uur', 'Hora', 'ชั่วโมง', 'Saat', 'قیامت', '小时', 'Uur', 'Stunde', 'Ωρα', 'Hora', 'घण्टा', 'Час', 'Time', 'Ժամ', 'საათში', 'तास', 'Jam', 'ਘੰਟਾ', 'மணி', 'అవర్', 'Timme', 'Oras'),
(203, 'minutes', 'Minutes', 'মিনিট', 'دقيقة', 'Minutes', 'मिनट', 'Menit', 'Minuti', '分', '의사록', 'Notulen', 'Minutos', 'รายงานการประชุม', 'dakika', 'منٹس', '纪要', 'Minute', 'Protokoll', 'Λεπτά', 'Minutos', 'मिनेट', 'минут', 'minutter', 'Րոպեներ', 'წუთები', 'मिनिटे', 'Minit', 'ਮਿੰਟ', 'நிமிடங்கள்', 'నిమిషాలు', 'Minuter', 'Mga Minuto'),
(204, 'ending_time', 'Ending Time', 'সময় শেষ', 'إنهاء الوقت', 'Fin Temps', 'अंतिम समय', 'akhir Waktu', 'Fine Tempo', '終了時刻', '시간 종료', 'Ending Time', 'Tempo Final', 'เวลาสิ้นสุด', 'Zaman Bitiş', 'وقت ختم', '结束时间', 'Eindtyd', 'Endzeit', 'Ώρα λήξης', 'Tiempo final', 'अन्त हुने समय', 'Время окончания', 'Slutter tid', 'Ավարտելու ժամանակը', 'დასრულების დრო', 'समाप्ती वेळ', 'Masa Berakhir', 'ਖ਼ਤਮ ਹੋਣ ਦਾ ਸਮਾਂ', 'முடிவடையும் நேரம்', 'సమయం ముగిసింది', 'Avslutande tid', 'Pagtatapos ng Oras'),
(205, 'select_subject', 'Select Subject', 'বিষয় নির্বাচন করুন', 'حدد الموضوع', 'Sélectionnez Objet', 'विषय का चयन', 'Pilih Jurusan', 'Selezionare Oggetto', '件名を選択', '선택 주제', 'Selecteer Onderwerp', 'Selecione Assunto', 'เลือกสาขาวิชา', 'Konu seçin', 'موضوع منتخب', '选择主题', 'Kies onderwerp', 'Wählen Sie Betreff', 'Επιλέξτε Θέμα', 'Seleccione Asunto', 'विषय चयन गर्नुहोस्', 'Выберите тему', 'Vælg emne', 'Ընտրեք Առարկան', 'აირჩიეთ თემა', 'विषय निवडा', 'Pilih Subjek', 'ਵਿਸ਼ਾ ਚੁਣੋ', 'பொருள் தேர்ந்தெடுக்கவும்', 'విషయం ఎంచుకోండి', 'Välj ämne', 'Piliin ang Paksa'),
(206, 'select_date', 'Select Date', 'তারিখ নির্বাচন করুন', 'حدد التاريخ', 'Sélectionnez date', 'तारीख़ चुनें', 'Pilih Tanggal', 'Selezionare Data', '日付を選択', '날짜 선택', 'Datum selecteren', 'Selecione Data', 'เลือกวันที่', 'seçin tarihi', 'تاریخ منتخب', '选择日期', 'Kies Datum', 'Datum auswählen', 'Επιλέξτε Ημερομηνία', 'Seleccione fecha', 'मिति चयन गर्नुहोस्', 'Выберите дату', 'Vælg dato', 'Ընտրեք Ամսաթիվ', 'აირჩიეთ თარიღი', 'तारीख निवडा', 'Pilih Tarikh', 'ਮਿਤੀ ਦੀ ਚੋਣ ਕਰੋ', 'தேதி தேர்ந்தெடுக்கவும்', 'తేదీని ఎంచుకోండి', 'Välj datum', 'Piliin ang Petsa');
INSERT INTO `languages` (`id`, `word`, `english`, `bengali`, `arabic`, `french`, `hindi`, `indonesian`, `italian`, `japanese`, `korean`, `dutch`, `portuguese`, `thai`, `turkish`, `urdu`, `chinese`, `afrikaans`, `german`, `greek`, `spanish`, `nepali`, `russian`, `danish`, `armenian`, `georgian`, `marathi`, `malay`, `punjabi`, `tamil`, `telugu`, `swedish`, `filipino`) VALUES
(207, 'select_month', 'Select Month', 'মাস নির্বাচন করুন', 'اختر الشهر', 'Sélectionnez un mois', 'महीना चुनिए', 'Pilih Bulan', 'Selezionare il mese', '月を選択', '월을 선택', 'Selecteer maand', 'Selecione o mês', 'เลือกเดือน', 'Ay seç', 'مہینہ منتخب کریں', '选择月份', 'Kies maand', 'Wähle einen Monat', 'Επιλέξτε μήνα', 'Seleccione mes', 'महिना चयन गर्नुहोस्', 'Выберите месяц', 'Vælg måned', 'Ընտրեք ամիս', 'აირჩიეთ თვე', 'महिना निवडा', 'Pilih Bulan', 'ਮਹੀਨਾ ਚੁਣੋ', 'மாதத்தைத் தேர்ந்தெடுக்கவும்', 'నెల ఎంచుకోండి', 'Välj månad', 'Piliin ang Buwan'),
(208, 'select_year', 'Select Year', 'নির্বাচন বছর', 'اختر السنة', 'Sélectionnez Année', 'चयन वर्ष', 'pilih Tahun', 'Seleziona Anno', '年を選択', '년도 선택', 'Selecteer Jaar', 'Selecione o ano', 'เลือกปี', 'Yıl seçin', 'چھانٹیں کریں', '选择年份', 'Kies jaar', 'Wählen Sie Jahr', 'Επιλέξτε Έτος', 'Seleccione año', 'वर्ष चयन गर्नुहोस्', 'Выберите год', 'Vælg år', 'Ընտրեք տարին', 'აირჩიეთ წელი', 'वर्ष निवडा', 'Pilih Tahun', 'ਸਾਲ ਚੁਣੋ', 'ஆண்டு தேர்ந்தெடுக்கவும்', 'సంవత్సరాన్ని ఎంచుకోండి', 'Välj år', 'Piliin ang Taon'),
(209, 'add_language', 'Add Language', 'ভাষা যোগ করুন', 'إضافة لغة', 'ajouter une langue', 'भाषा जोड़ें', 'tambahkan bahasa', 'aggiungere la lingua', '言語を追加する', '언어 추가', 'taal toevoegen', 'adicionar linguagem', 'เพิ่มภาษา', 'dil ekle', 'زبان شامل کریں', '添加语言', 'Voeg taal by', 'Sprache hinzufügen', 'Προσθήκη γλώσσας', 'Agregar idioma', 'भाषा थप्नुहोस्', 'Добавить язык', 'Tilføj sprog', 'Լեզուն ավելացնել', 'ენის დამატება', 'भाषा जोडा', 'Tambah Bahasa', 'ਭਾਸ਼ਾ ਸ਼ਾਮਲ ਕਰੋ', 'மொழி சேர்க்கவும்', 'భాషను జోడించండి', 'Lägg till språk', 'Magdagdag ng Wika'),
(210, 'exam_name', 'Exam Name', 'পরীক্ষার নাম', 'اسم الامتحان', 'Nom d\'examen', 'परीक्षा का नाम', 'ujian Nama', 'Nome esame', '試験名', '시험 이름', 'examen Naam', 'exame Nome', 'ชื่อสอบ', 'sınav Adı', 'امتحان نام', '考试名称', 'Eksamennaam', 'Prüfungsname', 'Όνομα εξέτασης', 'Nombre del examen', 'परीक्षा नाम', 'Имя экзамена', 'Eksamen Navn', 'Քննության անվանումը', 'გამოცდის სახელი', 'परीक्षेचे नाव', 'Nama Peperiksaan', 'ਪ੍ਰੀਖਿਆ ਦਾ ਨਾਮ', 'தேர்வு பெயர்', 'పరీక్ష పేరు', 'Examensnamn', 'Pangalan ng Exam'),
(211, 'date', 'Date', 'তারিখ', 'تاريخ', 'date', 'तारीख', 'Tanggal', 'Data', '日付', '날짜', 'Datum', 'Encontro', 'วันที่', 'tarih', 'تاریخ', '日期', 'datum', 'Datum', 'Ημερομηνία', 'Fecha', 'मिति', 'Свидание', 'Dato', 'Ամսաթիվ', 'თარიღი', 'तारीख', 'Tarikh', 'ਤਾਰੀਖ਼', 'தேதி', 'తేదీ', 'Datum', 'Petsa'),
(212, 'comment', 'Comment', 'মন্তব্য', 'التعليق', 'Commentaire', 'टिप्पणी', 'Komentar', 'Commento', 'コメント', '논평', 'Commentaar', 'Comente', 'คิดเห็น', 'Yorum', 'تبصرہ', '评论', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(213, 'edit_exam', 'Edit Exam', 'পরীক্ষার সম্পাদনা', 'تحرير امتحان', 'Modifier examen', 'परीक्षा संपादित करें', 'mengedit Ujian', 'Modifica esame', '編集試験', '편집 시험', 'Examen bewerken', 'Editar Exame', 'แก้ไขการสอบ', 'Düzenleme Sınavı', 'امتحان میں ترمیم کریں', '编辑考试', 'Redigeer eksamen', 'Prüfung bearbeiten', 'Επεξεργασία εξέτασης', 'Editar examen', 'परीक्षा सम्पादन गर्नुहोस्', 'Редактировать экзамен', 'Rediger eksamen', 'Խմբագրել քննությունը', 'გამოცდის რედაქტირება', 'परीक्षा संपादित करा', 'Edit Peperiksaan', 'ਪ੍ਰੀਖਿਆ ਸੋਧੋ', 'தேர்வைத் திருத்து', 'పరీక్షను సవరించండి', 'Redigera tentamen', 'I-edit ang Exam'),
(214, 'grade_list', 'Grade List', 'গ্রেড তালিকা', 'قائمة الصف', 'Liste de grade', 'ग्रेड सूची', 'Daftar kelas', 'Lista grado', 'グレード一覧', '학년 목록', 'Grade List', 'Lista Grade', 'รายการเกรด', 'sınıf listesi', 'گریڈ کی فہرست', '等级名单', 'Graadlys', 'Notenliste', 'Λίστα βαθμού', 'Lista de calificaciones', 'ग्रेड सूची', 'Список оценок', 'Karakterliste', 'Դասարանների ցուցակ', 'კლასების სია', 'ग्रेड यादी', 'Senarai Gred', 'ਗ੍ਰੇਡ ਸੂਚੀ', 'தர பட்டியல்', 'గ్రేడ్ జాబితా', 'Betygslista', 'Listahan ng Baitang'),
(215, 'grade_name', 'Grade Name', 'গ্রেড নাম', 'اسم الصف', 'Nom de grade', 'ग्रेड नाम', 'Nama kelas', 'Nome grado', 'グレード名', '학년 이름', 'Grade Naam', 'Nome grau', 'ชื่อชั้นประถมศึกษา', 'Sınıf Adı', 'گریڈ نام', '牌号名称', 'Graadnaam', 'Notenname', 'Όνομα βαθμού', 'Nombre de grado', 'ग्रेड नाम', 'Название класса', 'Karakternavn', 'Դասարանի անուն', 'კლასის სახელწოდება', 'ग्रेड नाव', 'Nama Gred', 'ਗ੍ਰੇਡ ਦਾ ਨਾਮ', 'தரத்தின் பெயர்', 'గ్రేడ్ పేరు', 'Betygsnamn', 'Pangalan ng grado'),
(216, 'grade_point', 'Grade Point', 'গ্রেড পয়েন্ট', 'الصف نقطة', 'grade point', 'ग्रेड बिंदु', 'Indeks Prestasi', 'Grade Point', 'グレードポイント', '학점', 'Grade Point', 'Ponto de classificação', 'เกรด', 'not', 'گریڈ نقطہ', '绩点', 'Graadpunt', 'Notenpunkt', 'Βαθμός βαθμού', 'Punto de grado', 'ग्रेड पोइन्ट', 'Grade Point', 'Grad Point', 'Դասարանի կետ', 'Grade Point', 'ग्रेड पॉईंट', 'Titik Gred', 'ਗ੍ਰੇਡ ਪੁਆਇੰਟ', 'கிரேடு பாயிண்ட்', 'గ్రేడ్ పాయింట్', 'Betygspoäng', 'Baitang ng Baitang'),
(217, 'select_exam', 'Select Exam', 'পরীক্ষার নির্বাচন', 'حدد الامتحان', 'Sélectionnez Exam', 'परीक्षा का चयन', 'Pilih Ujian', 'Selezionare esame', '試験を選択', '선택의 시험', 'Selecteer Examen', 'Select Exam', 'เลือกสอบ', 'seç Sınav', 'امتحان منتخب', '选择考试', 'Kies eksamen', 'Wählen Sie Prüfung', 'Επιλέξτε Εξέταση', 'Seleccionar examen', 'परीक्षा चयन गर्नुहोस्', 'Выберите экзамен', 'Vælg eksamen', 'Ընտրեք քննություն', 'შეარჩიე გამოცდა', 'परीक्षा निवडा', 'Pilih Peperiksaan', 'ਇਮਤਿਹਾਨ ਦੀ ਚੋਣ ਕਰੋ', 'தேர்வு என்பதைத் தேர்ந்தெடுக்கவும்', 'పరీక్షను ఎంచుకోండి', 'Välj tentamen', 'Piliin ang Exam'),
(218, 'students', 'Students', 'শিক্ষার্থীরা', 'الطلاب', 'Élèves', 'छात्र', 'siswa', 'Alunni', '学生の', '재학생', 'leerlingen', 'estudantes', 'นักเรียน', 'Öğrenciler', 'طلباء', '学生们', 'Studente', 'Studenten', 'Φοιτητές', 'Estudiantes', 'विद्यार्थी', 'Студенты', 'Studerende', 'Ուսանողները', 'სტუდენტებს', 'विद्यार्थीच्या', 'Pelajar', 'ਵਿਦਿਆਰਥੀ', 'மாணவர்கள்', 'స్టూడెంట్స్', 'studenter', 'Mga mag-aaral'),
(219, 'subjects', 'Subjects', 'প্রজাদের', 'المواضيع', 'Sujets', 'विषयों', 'subyek', 'Soggetti', '科目', '주제', 'vakken', 'assuntos', 'อาสาสมัคร', 'Konular', 'مضامین', '主题', 'vakke', 'Themen', 'μαθήματα', 'Asignaturas', 'विषयहरु', 'Предметы', 'emner', 'Առարկաներ', 'საგნები', 'विषय', 'Mata pelajaran', 'ਵਿਸ਼ੇ', 'பாடங்கள்', 'విషయము', 'ämnen', 'Mga Paksa'),
(220, 'total', 'Total', 'মোট', 'مجموع', 'Total', 'कुल', 'Total', 'Totale', '合計', '합계', 'Totaal', 'Total', 'ทั้งหมด', 'Toplam', 'کل', '总', 'totale', 'Gesamt', 'Σύνολο', 'Total', 'कुल', 'Всего', 'Total', 'Ընդհանուր', 'სულ', 'एकूण', 'Jumlah', 'ਕੁੱਲ', 'மொத்தம்', 'మొత్తం', 'Total', 'Kabuuan'),
(221, 'select_academic_session', 'Select Academic Session', 'একাডেমিক সেশন নির্বাচন', 'حدد الدورة الأكاديمية', 'Séance scolaire sélectionnée', 'अकादमिक सत्र का चयन करें', 'Pilih sesi akademik', 'Selezionare sessione accademica', '学会を選択する', '학술회의 선택', 'Selecteer een academische sessie', 'Selecione a sessão acadêmica', 'เลือกเซสชันการศึกษา', 'Akademik oturumu seç', 'تعلیمی سیشن کا انتخاب کریں', '选择学术会议', 'Kies Akademiese Sessie', 'Wählen Sie Akademische Sitzung', 'Επιλέξτε Ακαδημαϊκή συνεδρία', 'Seleccione sesión académica', 'शैक्षिक सत्र चयन गर्नुहोस्', 'Выберите академическую сессию', 'Vælg akademisk session', 'Ընտրեք գիտական ​​նստաշրջան', 'აირჩიეთ აკადემიური სესია', 'शैक्षणिक सत्र निवडा', 'Pilih Sesi Akademik', 'ਅਕਾਦਮਿਕ ਸੈਸ਼ਨ ਦੀ ਚੋਣ ਕਰੋ', 'கல்வி அமர்வைத் தேர்ந்தெடுக்கவும்', 'అకడమిక్ సెషన్ ఎంచుకోండి', 'Välj akademisk session', 'Piliin ang Pang-akademikong Session'),
(222, 'invoice_informations', 'Invoice Informations', 'চালান ইনফরমেশন', 'معلومات الفاتورة', 'Informations de facturation', 'चालान जानकारी', 'Informasi faktur', 'Informazioni fattura', '請求書情報', '송장 정보', 'factuur Informations', 'Informações factura', 'ข้อมูลใบแจ้งหนี้', 'fatura Bilgileri', 'انوائس کی معلومات', '发票信息', 'Faktuurinligting', 'Rechnungsinformationen', 'Πληροφορίες τιμολογίου', 'Informaciones de factura', 'इनभ्वाइस सूचनाहरू', 'Информация о счете', 'Fakturainformation', 'Տեղեկատվություն հաշիվ-ապրանքագրի մասին', 'ინვოისის შესახებ ინფორმაცია', 'चलन माहिती', 'Maklumat Invois', 'ਇਨਵੌਇਸ ਜਾਣਕਾਰੀ', 'விலைப்பட்டியல் தகவல்கள்', 'ఇన్వాయిస్ సమాచారం', 'Fakturainformation', 'Mga Impormasyon sa Invoice'),
(223, 'title', 'Title', 'খেতাব', 'عنوان', 'Titre', 'शीर्षक', 'Judul', 'Titolo', 'タイトル', '표제', 'Titel', 'Título', 'หัวข้อ', 'başlık', 'عنوان', '标题', 'Titel', 'Titel', 'Τίτλος', 'Título', 'शीर्षक', 'заглавие', 'Titel', 'Կոչում', 'სათაური', 'शीर्षक', 'Tajuk', 'ਸਿਰਲੇਖ', 'தலைப்பு', 'శీర్షిక', 'Titel', 'Pamagat'),
(224, 'description', 'Description', 'বিবরণ', 'وصف', 'La description', 'विवरण', 'Deskripsi', 'Descrizione', '説明', '기술', 'Beschrijving', 'Descrição', 'ลักษณะ', 'tanım', 'تفصیل', '描述', 'beskrywing', 'Beschreibung', 'Περιγραφή', 'Descripción', 'वर्णन', 'Описание', 'Beskrivelse', 'Նկարագրություն', 'აღწერა', 'वर्णन', 'Penerangan', 'ਵੇਰਵਾ', 'விளக்கம்', 'వివరణ', 'Beskrivning', 'Paglalarawan'),
(225, 'payment_informations', 'Payment Informations', 'পেমেন্ট তথ্য', 'معلومات الدفع', 'Informations de paiement', 'भुगतान जानकारी', 'Informasi Pembayaran', 'Informazioni di pagamento', '支払情報', '결제 정보', 'Payment Informations', 'Informações de pagamento', 'ข้อมูลการชำระเงิน', 'Ödeme Bilgileri', 'ادائیگی کی معلومات', '付款信息', 'Betalingsinligting', 'Zahlungsinformationen', 'Πληροφορίες πληρωμής', 'Informacion de pago', 'भुक्तान जानकारी', 'Информация об оплате', 'Betalingsoplysninger', 'Վճարման մասին տեղեկություն', 'ინფორმაცია გადახდის შესახებ', 'देय माहिती', 'Maklumat Pembayaran', 'ਭੁਗਤਾਨ ਦੀ ਜਾਣਕਾਰੀ', 'கட்டண தகவல்', 'చెల్లింపు సమాచారం', 'Betalningsinformation', 'Impormasyon sa Pagbabayad'),
(226, 'view_invoice', 'View Invoice', 'দেখুন চালান', 'عرض الفاتورة', 'Voir la facture', 'चालान देखें', 'Lihat Faktur', 'Visualizza fattura', '請求書を見ます', '보기 송장', 'Bekijk Factuur', 'Ver Invoice', 'ดูใบแจ้งหนี้', 'Görünüm Fatura', 'لنک انوائس', '查看发票', 'Bekyk faktuur', 'Rechnung anzeigen', 'Προβολή τιμολογίου', 'Mirar la factura', 'चलानी हेर्नुहोस्', 'Посмотреть счет', 'Se faktura', 'Դիտեք հաշիվ-ապրանքագիր', 'ინვოისის ნახვა', 'बीजक पहा', 'Lihat Invois', 'ਚਲਾਨ ਵੇਖੋ', 'விலைப்பட்டியல் காண்க', 'ఇన్వాయిస్ చూడండి', 'Visa faktura', 'Tingnan ang Invoice'),
(227, 'payment_to', 'Payment To', 'পরিশোদ করা', 'دفع ل', 'Paiement à', 'को भुगतान', 'pembayaran untuk', 'pagamento a', 'への支払い', '로 지불', 'Betaling aan', 'Pagamento para', 'การชำระเงิน', 'Için ödeme', 'کرنے کے لئے ادائیگی', '支付', 'Betaling aan', 'Zahlung an', 'Πληρωμή σε', 'Pago Para', 'भुक्तानी गर्न', 'Оплата Для', 'betaling til', 'Վճարը', 'გადახდა', 'रक्कम अदा', 'bayaran kepada', 'ਨੂੰ ਭੁਗਤਾਨ', 'கட்டணம் கட்ட', 'చెల్లింపు', 'Betalning till', 'bayad sa'),
(228, 'bill_to', 'Bill To', 'বিল করতে', 'فاتورة الى', 'Facturer', 'बिल प्राप्तकर्ता', 'Pembayaran kepada', 'Fatturare a', '請求書送付先', '빌로', 'Rekening naar', 'Projeto de lei para', 'ส่งเบิกไปที่', 'Ya fatura edilecek', 'کا بل', '记账到', 'Rekening aan', 'Gesetzesentwurf für', 'Μπιλ', 'Cobrar a', 'यसमा बिल चढाउँनु', 'Плательщик', 'Regning til', 'Bill To', 'Კანონპროექტი', 'बिल करा', 'Bil Kepada', 'ਬਿਲ ਕਰੋ', 'பில் டு', 'బిల్ టు', 'Bill till', 'Bill To'),
(229, 'total_amount', 'Total Amount', 'সর্বমোট পরিমাণ', 'المبلغ الإجمالي', 'Montant total', 'कुल रकम', 'Jumlah total', 'Importo totale', '合計金額', '총액', 'Totaalbedrag', 'Valor total', 'จำนวนเงินรวม', 'Toplam tutar', 'کل رقم', '总金额', 'Rekening aan', 'Gesetzesentwurf für', 'Μπιλ', 'Cobrar a', 'यसमा बिल चढाउँनु', 'Плательщик', 'Regning til', 'Bill To', 'Კანონპროექტი', 'बिल करा', 'Bil Kepada', 'ਬਿਲ ਕਰੋ', 'பில் டு', 'బిల్ టు', 'Bill till', 'Bill To'),
(230, 'paid_amount', 'Paid Amount', 'দেওয়া পরিমাণ', 'المبلغ المدفوع', 'Montant payé', 'भरी गई राशि', 'Jumlah pembayaran', 'Importo pagato', '支払金額', '지불 금액', 'Betaalde hoeveelheid', 'Quantidade paga', 'จำนวนเงินที่ชำระ', 'Ödenen miktar', 'ادا کی گئی رقم', '已付金额', 'Betaalde bedrag', 'Bezahlte Menge', 'Πληρωμένο ποσό', 'Monto de pago', 'भुक्तानी गरिएको रकम', 'Выплаченная сумма', 'Betalt beløb', 'Վճարված գումարը', 'Გადახდილი თანხა', 'देय रक्कम', 'Jumlah bayaran', 'ਭੁਗਤਾਨ ਕੀਤੀ ਰਕਮ', 'செலுத்திய தொகை', 'చెల్లించిన మొత్తం', 'Betalt belopp', 'Bayad na Halaga'),
(231, 'due', 'Due', 'দরুন', 'بسبب', 'Dû', 'देय', 'karena', 'Dovuto', '原因', '정당한', 'verschuldigd', 'Devido', 'ครบกำหนด', 'gereken', 'وجہ', '应有', 'weens', 'Fällig', 'Λόγω', 'Debido', 'कारण', 'В связи', 'På grund', 'Պատճառ', 'Გამო', 'देय', 'Kerana', 'ਕਾਰਨ', 'காரணமாக', 'కారణంగా', 'På grund av', 'Dahil'),
(232, 'amount_paid', 'Amount Paid', 'পরিমাণ অর্থ প্রদান করা', 'المبلغ المدفوع', 'Le montant payé', 'राशि का भुगतान', 'Jumlah yang dibayarkan', 'Importo pagato', '払込金額', '금액 지급', 'Betaald bedrag', 'Quantia paga', 'จำนวนเงินที่จ่าย', 'Ödenen miktar', 'رقم ادا کر دی', '支付的金额', 'Bedrag betaal', 'Bezahlter Betrag', 'Ποσό που καταβάλλεται', 'Cantidad pagada', 'तिरीएको रकम', 'Оплаченная сумма', 'Betalt beløb', 'Վճարված գումարը', 'Გადახდილი თანხა', 'देय रक्कम', 'Amaun yang dibayar', 'ਭੁਗਤਾਨ ਕੀਤੀ ਰਕਮ', 'பணம் செலுத்தப்பட்டது', 'డబ్బులు చెల్లించబడినవి', 'Betalt belopp', 'Halagang ibinayad'),
(233, 'payment_successfull', 'Payment has been successful', 'পেমেন্ট সফল হয়েছে', 'دفع النجاح', 'Paiement Successfull', 'भुगतान सफल', 'Successfull pembayaran', 'Successfull pagamento', '支払成功し', '결제 성공적인', 'betaling Succesvolle', 'Successfull pagamento', 'ที่ประสบความสำเร็จการชำระเงิน', 'Ödeme Başarılı', 'ادائیگی کامیاب', '支付全成', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(234, 'add_invoice/payment', 'Add Invoice/payment', 'ইনভয়েস / পেমেন্ট যোগ', 'إضافة فاتورة / دفع', 'Ajouter Facture / paiement', 'चालान / भुगतान जोड़े', 'Tambahkan Faktur / pembayaran', 'Aggiungere fattura / pagamento', '請求書/支払いを追加', '송장 / 지불 추가', 'Voeg Factuur / betaling', 'Adicionar fatura / pagamento', 'เพิ่มใบแจ้งหนี้ / การชำระเงิน', 'Fatura / ödeme ekle', 'شامل کریں انوائس / ادائیگی', '添加发票/付款', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(235, 'invoices', 'Invoices', 'ইনভয়েস বা চালান', 'الفواتير', 'factures', 'चालान', 'faktur', 'Fatture', '請求書', '송장', 'facturen', 'facturas', 'ใบแจ้งหนี้', 'faturalar', 'انوائس', '发票', 'fakture', 'Rechnungen', 'Τιμολόγια', 'Facturas', 'चलानी', 'Счета-фактуры', 'Fakturaer', 'Հաշիվ-ապրանքագրեր', 'ინვოისები', 'पावत्या', 'Invois', 'ਚਲਾਨ', 'விலைப்பட்டியல்', 'రసీదులు', 'fakturor', 'Mga Invoice'),
(236, 'action', 'Action', 'কর্ম', 'عمل', 'action', 'कार्य', 'Tindakan', 'Azione', 'アクション', '동작', 'Actie', 'Açao', 'การกระทำ', 'Aksiyon', 'عمل', '行动', 'aksie', 'Aktion', 'Δράση', 'Acción', 'कार्य', 'действие', 'Handling', 'Գործողություն', 'მოქმედება', 'कृती', 'Tindakan', 'ਐਕਸ਼ਨ', 'செயல்', 'యాక్షన్', 'Verkan', 'Pagkilos'),
(237, 'required', 'Required', 'প্রয়োজনীয়', 'مطلوب', 'Obligatoire', 'अपेक्षित', 'Wajib', 'richiesto', '必須', '필수', 'nodig', 'Requeridos', 'จำเป็นต้องใช้', 'gereken', 'مطلوب', '需要', 'vereis', 'Erforderlich', 'Απαιτείται', 'Necesario', 'आवाश्यक', 'необходимые', 'Nødvendig', 'Պահանջվում է', 'საჭირო', 'आवश्यक', 'Dikehendaki', 'ਲੋੜੀਂਦਾ', 'தேவை', 'అవసరం', 'Nödvändig', 'Kailangan'),
(238, 'info', 'Info', 'তথ্য', 'معلومات', 'Info', 'जानकारी', 'Info', 'Informazioni', 'インフォ', '정보', 'info', 'informações', 'ข้อมูล', 'Bilgi', 'انفارمیشن', '信息', 'info', 'Die Info', 'Πληροφορίες', 'Informacion', 'जानकारी', 'Информация', 'Info', 'Տեղեկատվություն', 'ინფორმაცია', 'माहिती', 'Maklumat', 'ਜਾਣਕਾਰੀ', 'தகவல்', 'సమాచారం', 'Info', 'Impormasyon'),
(239, 'month', 'Month', 'মাস', '\r\nشهر', 'mois', 'महीना', 'bulan', 'mese', '月', '달', 'maand', 'mês', 'เดือน', 'ay', 'مہینہ', '月', 'maand', 'Monat', 'Μήνας', 'Mes', 'महिना', 'Месяц', 'Måned', 'Ամիս', 'თვე', 'महिना', 'Sebulan', 'ਮਹੀਨਾ', 'மாதம்', 'నెల', 'Månad', 'Buwan'),
(240, 'details', 'Details', 'বিস্তারিত', 'تفاصيل', 'Détails', 'विवरण', 'rincian', 'Dettagli', '詳細', '세부', 'Details', 'Detalhes', 'รายละเอียด', 'Ayrıntılar', 'تفصیلات دیکھیں', '细节', 'besonderhede', 'Details', 'Λεπτομέριες', 'Detalles', 'विवरण', 'подробности', 'detaljer', 'Մանրամասները', 'დეტალები', 'तपशील', 'Perincian', 'ਵੇਰਵਾ', 'விவரங்கள்', 'వివరాలు', 'detaljer', 'Mga Detalye'),
(241, 'new', 'New', 'নতুন', 'الجديد', 'Nouveau', 'नया', 'Baru', 'Nuovo', '新しい', '새로운', 'nieuwe', 'Novo', 'ใหม่', 'Yeni', 'نئی', '新', 'nuwe', 'Neu', 'Νέος', 'Nuevo', 'नयाँ', 'новый', 'Ny', 'Նոր', 'ახალი', 'नवीन', 'Baru', 'ਨਵਾਂ', 'புதியது', 'న్యూ', 'Ny', 'Bago'),
(242, 'reply_message', 'Reply Message', 'বার্তা উত্তর', 'رسالة الرد', 'Réponse au message', 'संदेश का जवाब', 'pesan balasan', 'messaggio di risposta', 'メッセージ返信', '메시지 회신', 'berichtantwoord', 'Resposta da mensagem', 'ตอบกลับข้อความ', 'Mesaj cevabı', 'پیغام کا جواب', '消息回复', 'Antwoord boodskap', 'Nachricht beantworten', 'Απάντηση μηνύματος', 'Mensaje de respuesta', 'सन्देशलाई जवाफ दिनुहोस्', 'Ответное сообщение', 'Besvar meddelelse', 'Պատասխան հաղորդագրություն', 'პასუხის გაგზავნა', 'उत्तर द्या संदेश', 'Balas Mesej', 'ਜਵਾਬ ਸੁਨੇਹਾ', 'பதில் செய்தி', 'ప్రత్యుత్తరం సందేశం', 'Svara meddelande', 'Sagot ng Mensahe'),
(243, 'message_sent', 'Message Sent', 'বার্তা পাঠানো', 'تم الارسال', '', 'मैसेज बेजा गया', 'Pesan terkirim', 'Messaggio inviato', 'メッセージが送信されました', '메시지 전송 됨', 'Bericht verzonden', 'Mensagem enviada', 'ส่งข้อความ', 'Mesajı gönderildi', 'پیغام چلا گیا', '留言已发送', 'Boodskap gestuur', 'Nachricht gesendet', 'Το μήνυμα στάλθηκε', 'Mensaje enviado', 'सन्देश पठाइयो', 'Сообщение отправлено', 'Besked sendt', 'Նամակը ուղարկված է', 'Შეტყობინება გაგზავნილია', 'संदेश पाठवला', 'Pesanan dihantar', 'ਸੁਨੇਹਾ ਭੇਜਿਆ', 'செய்தி அனுப்பப்பட்டது', 'సందేశం పంపబడింది', 'Meddelande skickat', 'Ipinadala ang Mensahe'),
(244, 'search', 'Search', 'অনুসন্ধান', 'بحث', 'chercher', 'खोज', 'pencarian', 'ricerca', 'サーチ', '수색', 'zoeken', 'pesquisa', 'ค้นหา', 'arama', 'کی تلاش', '搜索', 'Soek', 'Suche', 'Αναζήτηση', 'Buscar', 'खोज्नुहोस्', 'Поиск', 'Søg', 'Որոնել', 'ძებნა', 'शोधा', 'Cari', 'ਖੋਜ', 'தேடல்', 'వెతకండి', 'Sök', 'Paghahanap'),
(245, 'religion', 'Religion', 'ধর্ম', 'دين', 'Religion', 'धर्म', 'Agama', 'Religione', '宗教', '종교', 'Godsdienst', 'Religião', 'ศาสนา', 'Din', 'مذہب', '宗教', 'Geloof', 'Religion', 'Θρησκεία', 'Religión', 'धर्म', 'религия', 'Religion', 'Կրոն', 'რელიგია', 'धर्म', 'Agama', 'ਧਰਮ', 'மதம்', 'మతం', 'Religion', 'Relihiyon'),
(246, 'blood_group', 'Blood group', 'রক্তের গ্রুপ', 'فصيلة الدم', 'groupe sanguin', 'रक्त समूह', 'golongan darah', 'gruppo sanguigno', '血液型', '혈액형', 'bloedgroep', 'grupo sanguíneo', 'กรุ๊ปเลือด', 'kan grubu', 'خون کے گروپ', '血型', 'Bloedgroep', 'Blutgruppe', 'Ομάδα αίματος', 'Grupo sanguíneo', 'रक्त समूह', 'Группа крови', 'Blodgruppe', 'Արյան խումբ', 'Სისხლის ჯგუფი', 'रक्त गट', 'Kumpulan darah', 'ਬਲੱਡ ਗਰੁੱਪ', 'இரத்த வகை', 'రక్తపు గ్రూపు', 'Blodgrupp', 'Pangkat ng dugo'),
(247, 'database_backup', 'Database Backup', 'ডাটাবেজ ব্যাকআপ', 'قاعدة بيانات النسخ الاحتياطي', 'Sauvegarde de base de données', 'डाटाबेस बैकअप', 'database Backup', 'Database Backup', 'データベースバックアップ', '데이터베이스 백업', 'Database Backup', 'Backup de banco de dados', 'การสำรองฐานข้อมูล', 'Veritabanı Yedekleme', 'ڈیٹا بیس بیک اپ', '数据库备份', 'Databasis-rugsteun', 'Datenbanksicherung', 'Δημιουργία αντιγράφων ασφαλείας βάσης δεδομένων', 'Copia de seguridad de la base de datos', 'डाटाबेस बैकअप', 'Резервное копирование базы данных', 'Database backup', 'Տվյալների բազայի կրկնօրինակում', 'მონაცემთა ბაზის სარეზერვო საშუალება', 'डेटाबेस बॅकअप', 'Sandaran Pangkalan Data', 'ਡਾਟਾਬੇਸ ਬੈਕਅਪ', 'தரவுத்தள காப்புப்பிரதி', 'డేటాబేస్ బ్యాకప్', 'Databasbackup', 'Pag-backup ng Database'),
(248, 'search', 'Search', 'অনুসন্ধান', 'بحث', 'chercher', 'खोज', 'pencarian', 'ricerca', 'サーチ', '수색', 'zoeken', 'pesquisa', 'ค้นหา', 'arama', 'کی تلاش', '搜索', 'Soek', 'Suche', 'Αναζήτηση', 'Buscar', 'खोज्नुहोस्', 'Поиск', 'Søg', 'Որոնել', 'ძებნა', 'शोधा', 'Cari', 'ਖੋਜ', 'தேடல்', 'వెతకండి', 'Sök', 'Paghahanap'),
(249, 'payments_history', 'Fees Pay / Invoice', 'ফি পরিশোধ / চালান', 'رسوم الدفع / الفاتورة', 'honoraires payer / facture', 'फीस का भुगतान / चालान', 'biaya bayar / faktur', 'tasse di pagamento / fattura', '手数料/請求書', '수수료 지불 / 송장', 'honoraria betalen / facturen', 'taxas de pagamento / fatura', 'ค่าธรรมเนียมการชำระเงิน / ใบแจ้งหนี้', 'ücret ödemesi / fatura', 'فیس ادا / انوائس', '收费/发票', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(250, 'message_restore', 'Message Restore', 'বার্তা পুনরুদ্ধার', 'استعادة الرسائل', 'Restauration de message', 'संदेश पुनर्स्थापना', 'Pesan dikembalikan', 'Messaggio di ripristino', 'メッセージの復元', '메시지 복원', 'bericht herstellen', 'Restaurar mensagem', 'กู้คืนข้อความ', 'Mesajın geri yüklenmesi', 'پیغام بحال', '留言恢复', 'Fooie betaal / faktuur', 'Gebühren bezahlen / Rechnung', 'Πληρωμή / Τιμολόγιο', 'Tasas de pago / factura', 'शुल्क भुक्तानी / इनभ्वाइस', 'Тарифы Оплата / Счет', 'Gebyrer / faktura', 'Վճարներ / հաշիվ ապրանքագիր', 'საფასურის გადახდა / ინვოისი', 'फी वेतन / बीजक', 'Bayaran Yuran / Invois', 'ਫੀਸ ਦਾ ਭੁਗਤਾਨ / ਇਨਵੌਇਸ', 'கட்டணம் செலுத்துதல் / விலைப்பட்டியல்', 'ఫీజు చెల్లింపు / ఇన్వాయిస్', 'Avgifter betala / faktura', 'Bayad na Bayad / Invoice'),
(251, 'write_new_message', 'Write New Message', 'নতুন বার্তা লিখতে', 'إرسال رسالة جديدة', 'Ecrire un nouveau message', 'नया संदेश लिखें', 'Tulis baru Pesan', 'Scrivi nuovo messaggio', '新しいメッセージを書きます', '새 메시지 쓰기', 'Schrijf New Message', 'Escrever Nova Mensagem', 'เขียนข้อความใหม่', 'Yeni Mesaj Yaz', 'نیا پیغام لکھیں', '我要留言', 'Skryf \'n nuwe boodskap', 'Neue Nachricht schreiben', 'Γράψτε νέο μήνυμα', 'Escribir nuevo mensaje', 'नयाँ सन्देश लेख्नुहोस्', 'Написать новое сообщение', 'Skriv ny besked', 'Գրեք նոր հաղորդագրություն', 'დაწერეთ ახალი შეტყობინება', 'नवीन संदेश लिहा', 'Tulis Mesej Baru', 'ਨਵਾਂ ਸੁਨੇਹਾ ਲਿਖੋ', 'புதிய செய்தியை எழுதுங்கள்', 'క్రొత్త సందేశం రాయండి', 'Skriv nytt meddelande', 'Sumulat ng Bagong Mensahe'),
(252, 'attendance_sheet', 'Attendance Sheet', 'এ্যাটেনডেন্স শীট', 'ورقة الحضور', 'Feuille de présence', 'उपस्थिति पत्रक', 'Absensi', 'Foglio presenze', '出席シート', '출석 시트', 'Presentielijst', 'Folha de Atendimento', 'แผ่นการเข้าร่วม', 'Yoklama kağıdı', 'حاضری شیٹ', '考勤表', 'Bywoningsblad', 'Anwesenheitsliste', 'Φύλλο παρακολούθησης', 'Hoja de asistencia', 'उपस्थिति पाना', 'Посещаемости лист', 'Deltagelsesark', 'Ներկայացման թերթ', 'დასწრების ფურცელი', 'हजेरी पत्रक', 'Helaian Kehadiran', 'ਹਾਜ਼ਰੀ ਸ਼ੀਟ', 'வருகை தாள்', 'హాజరు షీట్', 'Närvarolista', 'Papel ng pagdalo'),
(253, 'holiday', 'Holiday', 'ছুটির দিন', 'يوم الاجازة', 'Vacances', 'छुट्टी का दिन', 'Liburan', 'Vacanza', '休日', '휴일', 'Vakantie', 'Feriado', 'วันหยุด', 'Tatil', 'چھٹیوں کا', '假日', 'Vakansie', 'Urlaub', 'Αργία', 'Fiesta', 'छुट्टी', 'Праздничный день', 'Ferie', 'Արձակուրդ', 'დღესასწაული', 'सुट्टी', 'Percutian', 'ਛੁੱਟੀ', 'விடுமுறை', 'హాలిడే', 'Semester', 'Holiday'),
(254, 'exam', 'Exam', 'পরীক্ষা', 'امتحان', 'Examen', 'परीक्षा', 'Ujian', 'Esame', '試験', '시험', 'Examen', 'Exame', 'การสอบ', 'Sınav', 'امتحان', '考试', 'eksamen', 'Prüfung', 'Εξέταση', 'Examen', 'परीक्षा', 'Экзамен', 'Eksamen', 'Քննություն', 'გამოცდა', 'परीक्षा', 'Peperiksaan', 'ਪ੍ਰੀਖਿਆ', 'தேர்வு', 'పరీక్షా', 'Examen', 'Exam'),
(255, 'successfully', 'Successfully', 'সফলভাবে', 'بنجاح', 'Avec succès', 'सफलतापूर्वक', 'Berhasil', 'Con successo', '成功', '성공적으로', 'Met succes', 'Com sucesso', 'ประสบความสำเร็จ', 'Başarıyla', 'کامیابی سے', '成功了', 'suksesvol', 'Erfolgreich', 'Επιτυχώς', 'Exitosamente', 'सफलतापूर्वक', 'Успешно', 'Succesfuldt', 'Հաջողությամբ', 'Წარმატებით', 'यशस्वीरित्या', 'Berjaya', 'ਸਫਲਤਾ ਨਾਲ', 'வெற்றிகரமாக', 'విజయవంతంగా', 'Framgångsrikt', 'Matagumpay'),
(256, 'admin', 'Admin', 'অ্যাডমিন', 'مشرف', 'Admin', 'व्यवस्थापक', 'Admin', 'Admin', '管理者', '관리자', 'beheerder', 'Admin', 'ผู้ดูแลระบบ', 'Admin', 'ایڈمن', '管理员', 'admin', 'Administrator', 'διαχειριστής', 'Administración', 'प्रशासन', 'Администратор', 'Admin', 'Ադմինիստրատոր', 'ადმინ', 'प्रशासन', 'Pentadbir', 'ਐਡਮਿਨ', 'நிர்வாகம்', 'అడ్మిన్', 'Administration', 'Admin'),
(257, 'inbox', 'Inbox', 'ইনবক্স', 'صندوق الوارد', 'Boîte de réception', 'इनबॉक्स', 'Kotak masuk', 'Posta in arrivo', '受信トレイ', '받은 편지함', 'Inbox', 'Caixa de entrada', 'กล่องจดหมาย', 'Gelen kutusu', 'ان باکس', '收件箱', 'posbus', 'Posteingang', 'Inbox', 'Bandeja de entrada', 'इनबक्स', 'входящие', 'Indbakke', 'Ներարկղ', 'Შემომავალი', 'इनबॉक्स', 'Peti Masuk', 'ਇਨਬਾਕਸ', 'உட்பெட்டி', 'ఇన్బాక్స్', 'Inkorg', 'Inbox'),
(258, 'sent', 'Sent', 'প্রেরিত', 'أرسلت', 'Envoyé', 'भेज दिया', 'Dikirim', 'Inviato', '送信済み', '전송 됨', 'Verzonden', 'Enviei', 'ส่งแล้ว', 'Gönderildi', 'مرسلہ', '发了', 'gestuur', 'Geschickt', 'Απεσταλμένα', 'Expedido', 'पठाइयो', 'Отправлено', 'Sendt', 'Ուղարկվել է', 'Გაგზავნილი', 'पाठविला', 'Dihantar', 'ਭੇਜਿਆ', 'அனுப்பப்பட்டது', 'పంపిన', 'sände', 'Ipinadala'),
(259, 'important', 'Important', 'গুরুত্বপূর্ণ', 'مهم', 'Important', 'जरूरी', 'Penting', 'Importante', '重要', '중대한', 'Belangrijk', 'Importante', 'สำคัญ', 'Önemli', 'اہم', '重要', 'Belangrik', 'Wichtig', 'Σπουδαίος', 'Importante', 'महत्वपूर्ण', 'Важный', 'Vigtig', 'Կարևոր է', 'Მნიშვნელოვანი', 'महत्वाचे', 'Penting', 'ਮਹੱਤਵਪੂਰਨ', 'முக்கியமான', 'ముఖ్యమైన', 'Viktig', 'Mahalaga'),
(260, 'trash', 'Trash', 'আবর্জনা', 'قمامة، يدمر، يهدم', 'Poubelle', 'कचरा', 'Sampah', 'Spazzatura', 'ごみ', '폐물', 'Prullenbak', 'Lixo', 'ถังขยะ', 'Çöp', 'ردی کی ٹوکری', '垃圾', 'asblik', 'Müll', 'Σκουπίδια', 'Basura', 'रद्दी टोकरी', 'дрянь', 'Affald', 'Աղբարկղ', 'ნაგავი', 'कचरा', 'Sampah', 'ਰੱਦੀ', 'குப்பை', 'ట్రాష్', 'Skräp', 'Basura'),
(261, 'error', 'Unsuccessful', 'ব্যার্থ', 'غير ناجحة', 'Infructueux', 'असफल', 'Gagal', 'Senza esito', '失敗', '실패', 'Mislukt', 'Mal sucedido', 'ไม่สำเร็จ', 'Başarısız', 'ناکام', '不成功', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(262, 'sessions_list', 'Sessions List', 'সেশন তালিকা', 'قائمة الجلسات', 'Liste des sessions', 'सत्र सूची', 'Daftar Sesi', 'Elenco Sessioni', 'セッションリスト', '세션 목록', 'Sessieslijst', 'Lista de Sessões', 'รายการเซสชั่น', 'Oturumlar Listesi', 'سیشن کی فہرست', '会议列表', 'Sessieslys', 'Sitzungsliste', 'Λίστα συνεδριών', 'Lista de sesiones', 'सत्र सूची', 'Список сессий', 'Sessioner liste', 'Նիստերի ցուցակ', 'სესიების სია', 'सत्रांची यादी', 'Senarai Sesi', 'ਸੈਸ਼ਨ ਸੂਚੀ', 'அமர்வுகள் பட்டியல்', 'సెషన్ల జాబితా', 'Sessionions List', 'Listahan ng Session'),
(263, 'session_settings', 'Session Settings', 'সেশন সেটিংস', 'إعدادات الجلسة', 'Paramètres de la session', 'सत्र सेटिंग', 'Pengaturan Sesi', 'Impostazioni sessione', 'セッション設定', '세션 설정', 'Sessie instellingen', 'Configurações da Sessão', 'การตั้งค่าเซสชัน', 'Oturum Ayarları', 'سیشن ترتیبات', '会话设置', 'Sessie-instellings', 'Sitzungseinstellungen', 'Ρυθμίσεις περιόδου σύνδεσης', 'Configuraciones de sesión', 'सत्र सेटिंग्स', 'Настройки сеанса', 'Sessionindstillinger', 'Նիստի կարգավորումները', 'სესიის პარამეტრები', 'सत्र सेटिंग्ज', 'Tetapan Sesi', 'ਸ਼ੈਸ਼ਨ ਸੈਟਿੰਗਜ਼', 'அமர்வு அமைப்புகள்', 'సెషన్ సెట్టింగులు', 'Sessioninställningar', 'Mga Setting ng Session'),
(264, 'add_designation', 'Add Designation', 'পদবী যোগ করুন', 'إضافة تسمية', 'Ajouter une désignation', 'पदनाम जोड़ें', 'Tambahkan Penunjukan', 'Aggiungi designazione', '指定を追加する', '지정 추가', 'Aanwijzing toevoegen', 'Adicionar Designação', 'เพิ่มการกำหนด', 'İsmi Ekle', 'عہدہ شامل کریں', '添加名称', 'Voeg aanwysing by', 'Bezeichnung hinzufügen', 'Προσθήκη ονομασίας', 'Agregar designación', 'पद थप्नुहोस्', 'Добавить обозначение', 'Tilføj betegnelse', 'Ավելացնել նշանակումը', 'დაამატეთ აღნიშვნა', 'पदनाम जोडा', 'Tambah Penetapan', 'ਅਹੁਦਾ ਸ਼ਾਮਲ ਕਰੋ', 'பதவி சேர்க்கவும்', 'హోదా జోడించండి', 'Lägg till beteckning', 'Magdagdag ng Pagtatalaga'),
(265, 'users', 'Users', 'ব্যবহারকারীরা', 'المستخدمين', 'Utilisateurs', 'उपयोगकर्ता', 'Pengguna', 'utenti', 'ユーザー', '사용자', 'gebruikers', 'Comercial', 'ผู้ใช้', 'Kullanıcılar', 'صارفین', '用户', 'gebruikers', 'Benutzer', 'Χρήστες', 'Los usuarios', 'प्रयोगकर्ताहरू', 'пользователей', 'Brugere', 'Օգտագործողներ', 'მომხმარებლები', 'वापरकर्ते', 'Pengguna', 'ਉਪਭੋਗਤਾ', 'பயனர்கள்', 'వినియోగదారులు', 'användare', 'Mga gumagamit'),
(266, 'librarian', 'Librarian', 'গ্রন্থাগারিক', 'أمين المكتبة', 'Bibliothécaire', 'पुस्तकालय अध्यक्ष', 'Pustakawan', 'Bibliotecario', '図書館員', '사서', 'Bibliothecaris', 'Bibliotecário', 'บรรณารักษ์', 'kütüphaneci', 'لائبریرین', '图书管理员', 'bibliotekaris', 'Bibliothekar', 'Βιβλιοθηκάριος', 'bibliotecario', 'लाइब्रेरियन', 'библиотекарь', 'Bibliotekar', 'Գրադարանավար', 'Ბიბლიოთეკარი', 'ग्रंथपाल', 'Pustakawan', 'ਲਾਇਬ੍ਰੇਰੀਅਨ', 'நூலகர்', 'లైబ్రేరియన్', 'Bibliotekarie', 'Librarian'),
(267, 'accountant', 'Accountant', 'হিসাবরক্ষক', 'محاسب', 'Comptable', 'मुनीम', 'Akuntan', 'Contabile', '会計士', '회계사', 'Accountant', 'Contador', 'นักบัญชี', 'Muhasebeci', 'اکاؤنٹنٹ', '会计', 'rekenmeester', 'Buchhalter', 'Λογιστής', 'Contador', 'लेखापाल', 'бухгалтер', 'Revisor', 'Հաշվապահ', 'ბუღალტერი', 'लेखापाल', 'Akauntan', 'ਲੇਖਾਕਾਰ', 'கணக்காளர்', 'అకౌంటెంట్', 'Revisor', 'Accountant'),
(268, 'academics', 'Academics', 'বিদ্যালয় সংক্রান্ত', 'مؤسسيا', 'institutionnellement', 'संस्थागत', 'secara institusional', 'istituzionalmente', '制度的に', '제도적으로', 'institutioneel', 'institucionalmente', 'institutionally', 'kurumsal olarak', 'ادارہ', '体制', 'akademici', 'Akademiker', 'Ακαδημαϊκοί', 'Académica', 'शिक्षाविद्', 'Академики', 'akademikere', 'Գիտնականներ', 'აკადემიკოსები', 'शैक्षणिक', 'Akademik', 'ਵਿਦਿਅਕ', 'கல்வியாளர்கள்', 'విద్యావేత్తలు', 'akademiker', 'Akademikong'),
(269, 'employees_attendance', 'Employees Attendance', 'কর্মচারী উপস্থিতি', 'حضور الموظفين', 'Participation des employés', 'कर्मचारी उपस्थिति', 'Kehadiran karyawan', 'La presenza dei dipendenti', '従業員の出席', '직원 출석', 'Medewerkers aanwezigheid', 'Atendimento dos funcionários', 'การเข้าร่วมงานของพนักงาน', 'Çalışanlara katılım', 'ملازمین کی حاضری', '员工出勤', 'Bywoning van werknemers', 'Anwesenheit der Mitarbeiter', 'Συμμετοχή εργαζομένων', 'Asistencia de empleados', 'कर्मचारी उपस्थिति', 'Посещаемость сотрудников', 'Deltagelse i medarbejdere', 'Աշխատակիցների հաճախում', 'თანამშრომლების დასწრება', 'कर्मचार्‍यांची उपस्थिती', 'Kehadiran Pekerja', 'ਕਰਮਚਾਰੀ ਹਾਜ਼ਰੀ', 'பணியாளர்கள் வருகை', 'ఉద్యోగుల హాజరు', 'Anställdas närvaro', 'Pagdalo ng mga empleyado'),
(270, 'set_exam_term', 'Set Exam Term', 'টার্ম সেট করুন', 'تعيين مدة الامتحان', 'Terminer l\'examen', 'परीक्षा अवधि सेट करें', 'Tetapkan Ujian Term', 'Imposta il termine dell\'esame', '試験期間を設定する', '시험 기간 설정', 'Stel examentermijn in', 'Definir Termo de Exame', 'กำหนดระยะเวลาการสอบ', 'Sınav Süresini Ayarlayın', 'امتحان کی مدت مقرر کریں', '设置考试期限', 'Stel eksamentermyn in', 'Prüfungsdauer festlegen', 'Ορίστε όρο εξετάσεων', 'Establecer plazo de examen', 'परीक्षा अवधि सेट गर्नुहोस्', 'Установить срок экзамена', 'Indstil eksamensperiode', 'Սահմանել քննության ժամկետը', 'დაადგინეთ გამოცდის ვადა', 'परीक्षेची मुदत सेट करा', 'Tetapkan Tempoh Peperiksaan', 'ਪ੍ਰੀਖਿਆ ਦੀ ਮਿਆਦ ਨਿਰਧਾਰਤ ਕਰੋ', 'தேர்வு காலத்தை அமைக்கவும்', 'పరీక్షా వ్యవధిని సెట్ చేయండి', 'Ställ in tentamen', 'Itakda ang Kataga ng Exam'),
(271, 'set_attendance', 'Set Attendance', 'উপস্থিতি সেট করুন', 'تعيين الحضور', 'Assurer la fréquentation', 'उपस्थिति सेट करें', 'Tetapkan Kehadiran', 'Impostare la frequenza', '出席を設定する', '출석 설정', 'Set Attendance', 'Definir atendimento', 'ตั้งผู้เข้าร่วม', 'Katılımı ayarla', 'حاضری مقرر کریں', '设置考勤', 'Stel bywoning', 'Anwesenheit einstellen', 'Ορίστε την παρακολούθηση', 'Establecer asistencia', 'उपस्थिति सेट गर्नुहोस्', 'Установить посещаемость', 'Indstil deltagelse', 'Ներկայացրեք մասնակցությունը', 'დასწრება', 'उपस्थिती निश्चित करा', 'Tetapkan Kehadiran', 'ਹਾਜ਼ਰੀ ਨਿਰਧਾਰਤ ਕਰੋ', 'வருகையை அமைக்கவும்', 'హాజరును సెట్ చేయండి', 'Ställ upp närvaro', 'Itakda ang Pagdalo'),
(272, 'marks', 'Marks', 'মার্কস', 'علامات', 'Des notes', 'निशान', 'Tanda', 'votazione', 'マーク', '점수', 'Marks', 'Marcas', 'เครื่องหมาย', 'izler', 'نشانات', '分数', 'punte', 'Markierungen', 'Σημάδια', 'Marcas', 'अंक', 'Метки', 'Marks', 'Նշում է', 'ნიშნები', 'गुण', 'Tanda', 'ਨਿਸ਼ਾਨ', 'மதிப்பெண்கள்', 'మార్క్స్', 'Marks', 'Mga Marks'),
(273, 'books_category', 'Books Category', 'বই বিভাগ', 'فئة الكتاب', 'Catégorie de livres', 'पुस्तक श्रेणी', 'Kategori buku', 'Categoria di libri', 'ブックカテゴリ', '도서 카테고리', 'Boek categorie', 'Categoria de livro', 'หมวดหนังสือ', 'Kitap Kategorisi', 'کتاب کی قسم', '书类', 'Boeke-kategorie', 'Buchkategorie', 'Κατηγορία βιβλίων', 'Categoría de libros', 'पुस्तक कोटि', 'Категория книг', 'Bøger kategori', 'Գրքերի կատեգորիա', 'წიგნების კატეგორია', 'पुस्तके श्रेणी', 'Kategori Buku', 'ਕਿਤਾਬਾਂ ਦੀ ਸ਼੍ਰੇਣੀ', 'புத்தகங்கள் வகை', 'పుస్తకాల వర్గం', 'Böcker kategori', 'Mga kategorya ng Mga Libro'),
(274, 'transport', 'Transport', 'পরিবহন', 'المواصلات', 'Transport', 'ट्रांसपोर्ट', 'Mengangkut', 'Trasporto', '輸送', '수송', 'Vervoer', 'Transporte', 'ขนส่ง', 'taşıma', 'نقل و حمل', '运输', 'vervoer', 'Transport', 'Μεταφορά', 'Transporte', 'यातायात', 'Transport', 'Transportere', 'Տրանսպորտ', 'ტრანსპორტი', 'वाहतूक', 'Pengangkutan', 'ਆਵਾਜਾਈ', 'போக்குவரத்து', 'రవాణా', 'Transport', 'Transport'),
(275, 'fees', 'Fees', 'ফি', 'رسوم', 'honoraires', 'फीस', 'Biaya', 'tasse', '手数料', '수수료', 'fees', 'honorários', 'ค่าธรรมเนียม', 'harç', 'فیس', '费用', 'fooie', 'Gebühren', 'Αμοιβές', 'Tarifa', 'शुल्क', 'сборы', 'Gebyrer', 'Վճարներ', 'საფასური', 'शुल्क', 'Bayaran', 'ਫੀਸ', 'கட்டணம்', 'ఫీజు', 'avgifter', 'Bayarin'),
(276, 'fees_allocation', 'Fees Allocation', 'ফি বরাদ্দকরণ', 'توزيع الرسوم', 'répartition des frais', 'शुल्क आवंटन', 'alokasi biaya', 'assegnazione dei diritti', '手数料の割り当て', '수수료 할당', 'verdeling van de vergoedingen', 'alocação de tarifas', 'การจัดสรรค่าธรรมเนียม', 'ücret tahsisi', 'فیس مختص', '费用分配', 'Toekenning van gelde', 'Gebührenverteilung', 'Κατανομή τελών', 'Asignación de tarifas', 'शुल्क छुट', 'Распределение сборов', 'Gebyrer tildeling', 'Վճարների տեղաբաշխում', 'გადასახადების განაწილება', 'शुल्क वाटप', 'Peruntukan Yuran', 'ਫੀਸਾਂ ਦੀ ਅਲਾਟਮੈਂਟ', 'கட்டணம் ஒதுக்கீடு', 'ఫీజుల కేటాయింపు', 'Avgiftsfördelning', 'Alokasyon sa Bayad'),
(277, 'fee_category', 'Fee Category', 'ফি বিভাগ', 'فئة الرسوم', 'Catégorie tarifaire', 'शुल्क श्रेणी', 'Kategori biaya', 'Categoria di tassa', '手数料カテゴリ', '수수료 카테고리', 'Tariefcategorie', 'Categoria de taxa', 'ประเภทค่าธรรมเนียม', 'Ücret kategorisi', 'فیس کی قسم', '费用类别', 'Fooi-kategorie', 'Gebührenkategorie', 'Κατηγορία χρεώσεων', 'Categoría de tarifa', 'शुल्क श्रेणी', 'Плата Категория', 'Gebyrkategori', 'Վճարների կատեգորիա', 'საფასურის კატეგორია', 'फी श्रेणी', 'Kategori Yuran', 'ਫੀਸ ਸ਼੍ਰੇਣੀ', 'கட்டணம் வகை', 'ఫీజు వర్గం', 'Avgiftskategori', 'Uri ng Bayad'),
(278, 'report', 'Report', 'প্রতিবেদন', 'أبلغ عن', 'rapport', 'रिपोर्ट', 'melaporkan', 'rapporto', '報告する', '보고서', 'rapport', 'relatório', 'รายงาน', 'rapor', 'رپورٹ', '报告', 'verslag', 'Bericht', 'Κανω ΑΝΑΦΟΡΑ', 'Reporte', 'रिपोर्ट', 'отчет', 'Rapport', 'Հաղորդել', 'მოხსენება', 'अहवाल द्या', 'Lapor', 'ਰਿਪੋਰਟ', 'அறிக்கை', 'నివేదిక', 'Rapportera', 'Mag-ulat'),
(279, 'employee', 'Employee', 'কর্মচারী', 'الموظفين', 'employés', 'कर्मचारियों', 'para karyawan', 'dipendenti', '従業員', '직원', 'werknemers', 'Funcionários', 'พนักงาน', 'çalışanlar', 'ملازمین', 'ملازمین', 'werknemer', 'Mitarbeiter', 'Υπάλληλος', 'Empleado', 'कर्मचारी', 'Работник', 'medarbejder', 'Աշխատող', 'თანამშრომელი', 'कर्मचारी', 'Pekerja', 'ਕਰਮਚਾਰੀ', 'ஊழியர்', 'ఉద్యోగి', 'Anställd', 'Empleado'),
(280, 'invoice', 'Invoice', 'চালান', 'فاتورة', 'facture d\'achat', 'बीजक', 'faktur', 'fattura', '請求書', '송장', 'factuur', 'fatura', 'ใบแจ้งหนี้', 'fatura', 'انوائس', '发票', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(281, 'event_catalogue', 'Event Catalogue', 'ইভেন্ট ক্যাটালগ', 'كتالوج الأحداث', 'Catalogue des événements', 'इवेंट कैटलॉग', 'Katalog acara', 'Catalogo eventi', 'イベントカタログ', '이벤트 카탈로그', 'Event Catalogus', 'Catálogo de Eventos', 'แค็ตตาล็อกกิจกรรม', 'Etkinlik Kataloğu', 'واقعہ کی فہرست', '活动目录', 'Gebeurtenis katalogus', 'Veranstaltungskatalog', 'Κατάλογος εκδηλώσεων', 'Catálogo de eventos', 'कार्यक्रम क्याटलग', 'Каталог событий', 'Begivenhedskatalog', 'Իրադարձությունների կատալոգ', 'ღონისძიების კატალოგი', 'कार्यक्रम कॅटलॉग', 'Katalog Acara', 'ਇਵੈਂਟ ਕੈਟਾਲਾਗ', 'நிகழ்வு பட்டியல்', 'ఈవెంట్ కాటలాగ్', 'Eventkatalog', 'Catalog ng Kaganapan'),
(282, 'total_paid', 'Total Paid', 'মোট দেওয়া', 'مجموع المبالغ المدفوعة', 'Total payé', 'कुल भुगतान हो गया', 'Total Dibayar', 'Totale pagato', '支払総額', '총 지불액', 'Totaal betaald', 'Total pago', 'ทั้งหมดที่จ่าย', 'Toplam Ücretli', 'کل ادا شدہ', '总支付', 'Totale betaal', 'Ganz bezahlt', 'Σύνολο πληρωμένων', 'Total pagado', 'कुल सशुल्क', 'Итого', 'I alt betalt', 'Ընդհանուր վճարված', 'სულ გადახდილი', 'एकूण सशुल्क', 'Jumlah bayaran', 'ਕੁੱਲ ਭੁਗਤਾਨ', 'மொத்தம் செலுத்தியது', 'మొత్తం చెల్లించబడింది', 'Totala belopp som betalats', 'Kabuuang Bayad'),
(283, 'total_due', 'Total Due', 'মোট বাকি', 'الاجمالي المستحق', 'Total dû', 'कुल देय', 'Total Jatuh Tempo', 'Totale dovuto', '総額', '총 만기일', 'Totaal verschuldigd', 'Total Due', 'รวมครบกำหนด', 'Toplam Vade', 'کل کی وجہ سے', '总到期', 'Totale betaal', 'Ganz bezahlt', 'Σύνολο πληρωμένων', 'Total pagado', 'कुल सशुल्क', 'Итого', 'I alt betalt', 'Ընդհանուր վճարված', 'სულ გადახდილი', 'एकूण सशुल्क', 'Jumlah bayaran', 'ਕੁੱਲ ਭੁਗਤਾਨ', 'மொத்தம் செலுத்தியது', 'మొత్తం చెల్లించబడింది', 'Totala belopp som betalats', 'Kabuuang Bayad'),
(284, 'fees_collect', 'Fees Collect', 'ফি সংগ্রহ', 'تحصيل الرسوم', 'Frais collectés', 'फीस जमा करें', 'Biaya mengumpulkan', 'Le tasse si raccolgono', '手数料徴収', '수수료 징수', 'Vergoedingen verzamelen', 'Taxas cobradas', 'เก็บค่าธรรมเนียม', 'Ücret toplama', 'فیس جمع', '收费', 'Fooie versamel', 'Gebühren sammeln', 'Συλλογή τελών', 'Tasas por cobrar', 'शुल्क स .्कलन', 'Сборы', 'Gebyrer indsamles', 'Վճարները հավաքում', 'მოსაკრებლების შეგროვება', 'शुल्क गोळा', 'Bayaran dikumpulkan', 'ਫੀਸ ਇਕੱਠੀ', 'கட்டணம் வசூலிக்கவும்', 'ఫీజు వసూలు', 'Avgifter Samla', 'Mga Kolektahin'),
(285, 'total_school_students_attendance', 'Total School Students Attendance', 'মোট স্কুলের ছাত্র উপস্থিতি', 'مجموع طلاب المدارس الحضور', 'Participation totale des étudiants', 'कुल विद्यालय के छात्रों की उपस्थिति', 'Total kehadiran siswa sekolah', 'La frequenza totale degli studenti delle scuole', '総学生就学', '총 학생 수강생', 'Totale schoolstudenten aanwezigheid', 'Total de frequência escolar', 'การเข้าเรียนของนักเรียนในโรงเรียนทั้งหมด', 'Toplam okul öğrencileri devam ediyor', 'کل اسکول کے طلباء حاضری', '全校学生出席', 'Totale bywoning van skoolstudente', 'Gesamtzahl der Schüler', 'Συνολική παρακολούθηση μαθητών', 'Asistencia total de estudiantes de la escuela', 'कुल स्कूल विद्यार्थी उपस्थिति', 'Общая посещаемость школьников', 'Deltagelse i alt skoleelever', 'Ընդհանուր դպրոցի աշակերտների հաճախում', 'სულ მოსწავლეთა დასწრება', 'एकूण शालेय विद्यार्थ्यांची उपस्थिती', 'Jumlah Kehadiran Pelajar Sekolah', 'ਸਕੂਲ ਦੇ ਕੁੱਲ ਵਿਦਿਆਰਥੀਆਂ ਦੀ ਹਾਜ਼ਰੀ', 'மொத்த பள்ளி மாணவர்கள் வருகை', 'మొత్తం పాఠశాల విద్యార్థుల హాజరు', 'Totalt deltagande i skolstudenter', 'Kabuuan ng Mga Mag-aaral sa Pag-aaral'),
(286, 'overview', 'Overview', 'সংক্ষিপ্ত বিবরণ', 'نظرة عامة', 'Aperçu', 'अवलोकन', 'Ikhtisar', 'Panoramica', '概要', '개요', 'Overzicht', 'Visão geral', 'ภาพรวม', 'genel bakış', 'جائزہ', '概观', 'oorsig', 'Überblick', 'ΣΦΑΙΡΙΚΗ ΕΙΚΟΝΑ', 'Visión general', 'अवलोकन', 'обзор', 'Oversigt', 'Ակնարկ', 'მიმოხილვა', 'आढावा', 'Gambaran keseluruhan', 'ਸੰਖੇਪ ਜਾਣਕਾਰੀ', 'கண்ணோட்டம்', 'అవలోకనం', 'Översikt', 'Pangkalahatang-ideya'),
(287, 'currency_symbol', 'Currency Symbol', 'মুদ্রা প্রতীক', 'رمز العملة', 'symbole de la monnaie', 'मुद्रा प्रतीक', 'Simbol mata uang', 'Simbolo di valuta', '通貨記号', '통화 기호', 'symbool van munteenheid', 'Símbolo monetário', 'สัญลักษณ์สกุลเงิน', 'Para birimi sembolü', 'کرنسی علامت', '货币符号', 'Valutasimbool', 'Währungszeichen', 'Σύμβολο νομίσματος', 'Símbolo de moneda', 'मुद्रा प्रतीक', 'Символ валюты', 'Valutasymbol', 'Արտարժույթի խորհրդանիշ', 'ვალუტის სიმბოლო', 'चलन प्रतीक', 'Simbol Mata Wang', 'ਕਰੰਸੀ ਪ੍ਰਤੀਕ', 'நாணய சின்னம்', 'కరెన్సీ చిహ్నం', 'Valutasymbol', 'Simbolo ng Salapi'),
(288, 'enable', 'Enable', 'সক্ষম করা', 'مكن', 'Activer', 'सक्षम करें', 'Memungkinkan', 'Abilitare', '有効にする', '사용', 'in staat stellen', 'Habilitar', 'ทำให้สามารถ', 'etkinleştirme', 'فعال', '启用', 'in staat te stel', 'Aktivieren', 'επιτρέπω', 'Habilitar', 'सक्षम गर्नुहोस्', 'включить', 'Aktiver', 'Միացնել', 'ჩართვა', 'सक्षम करा', 'Aktifkan', 'ਯੋਗ', 'இயக்கு', 'ప్రారంభించు', 'Gör det möjligt', 'Paganahin'),
(289, 'disable', 'Disable', 'অক্ষম', 'تعطيل', 'Désactiver', 'अक्षम', 'Nonaktifkan', 'disattivare', '無効にする', '사용 안함', 'onbruikbaar maken', 'Desativar', 'ปิดการใช้งาน', 'Devre dışı', 'غیر فعال', '禁用', 'Skakel', 'Deaktivieren', 'Καθιστώ ανίκανο', 'Inhabilitar', 'असक्षम गर्नुहोस्', 'Отключить', 'Deaktiver', 'Անջատել', 'გამორთეთ', 'अक्षम करा', 'Lumpuhkan', 'ਅਯੋਗ', 'முடக்கு', 'డిసేబుల్', 'Inaktivera', 'Hindi paganahin'),
(290, 'payment_settings', 'Payment Settings', 'পেমেন্ট সেটিংস', 'إعدادات الدفع', 'Paramètres de paiement', 'भुगतान सेटिंग', 'Setelan Pembayaran', 'Impostazioni di pagamento', '支払い設定', '지불 설정', 'Betaalinstellingen', 'Configurações de pagamento', 'การตั้งค่าการชำระเงิน', 'Ödeme Ayarları', 'ادائیگی کی ترتیبات', '付款设置', 'Betaalinstellings', 'Zahlungseinstellungen', 'Ρυθμίσεις πληρωμής', 'Configuraciones de pago', 'भुक्तानी सेटिंग्स', 'Настройки оплаты', 'Betalingsindstillinger', 'Վճարման կարգաբերումներ', 'გადახდის პარამეტრები', 'देय सेटिंग्ज', 'Tetapan Pembayaran', 'ਭੁਗਤਾਨ ਸੈਟਿੰਗਜ਼', 'கட்டண அமைப்புகள்', 'చెల్లింపు సెట్టింగులు', 'Betalningsinställningar', 'Mga Setting ng Pagbabayad'),
(291, 'student_attendance_report', 'Student Attendance Report', 'ছাত্র উপস্থিতি রিপোর্ট', 'تقرير حضور الطالب', 'Rapport de présence étudiante', 'छात्र उपस्थिति रिपोर्ट', 'Laporan kehadiran siswa', 'Rapporto di frequenza degli studenti', '学生出席報告', '학생 출석 보고서', 'Studentenbijwoningsverslag', 'Relatório de atendimento ao aluno', 'รายงานการเข้าเรียนของนักเรียน', 'Öğrenci katılım raporu', 'طالب علم حاضری کی رپورٹ', '学生出勤报告', 'Studente-bywoningsverslag', 'Anwesenheitsbericht für Studenten', 'Έκθεση παρακολούθησης φοιτητών', 'Informe de asistencia estudiantil', 'विद्यार्थी उपस्थिति रिपोर्ट', 'Отчет о посещаемости студентов', 'Student Deltagelsesrapport', 'Ուսանողների մասնակցության զեկույց', 'სტუდენტთა დასწრების ანგარიში', 'विद्यार्थ्यांची उपस्थिती अहवाल', 'Laporan Kehadiran Pelajar', 'ਵਿਦਿਆਰਥੀ ਹਾਜ਼ਰੀ ਰਿਪੋਰਟ', 'மாணவர் வருகை அறிக்கை', 'విద్యార్థుల హాజరు నివేదిక', 'Studentbesöksrapport', 'Ulat sa Pag-aaral ng Mag-aaral'),
(292, 'attendance_type', 'Attendance Type', 'উপস্থিতি প্রকার', 'نوع الحضور', 'Type de présence', 'उपस्थिति प्रकार', 'Tipe kehadiran', 'Tipo di partecipazione', '出席タイプ', '출석 유형', 'Aanwezigheidstype', 'Tipo de atendimento', 'ประเภทการเข้างาน', 'Devam türü', 'حاضری کی قسم', '考勤类型', 'Bywoningstipe', 'Anwesenheitsart', 'Τύπος συμμετοχής', 'Tipo de asistencia', 'उपस्थिति प्रकार', 'Тип посещаемости', 'Deltagelsestype', 'Մասնակցության տեսակ', 'დასწრების ტიპი', 'उपस्थिती प्रकार', 'Jenis Kehadiran', 'ਹਾਜ਼ਰੀ ਦੀ ਕਿਸਮ', 'வருகை வகை', 'హాజరు రకం', 'Närvarotyp', 'Uri ng Pagdalo'),
(293, 'late', 'Late', 'বিলম্বে', 'متأخر', 'En retard', 'देर से', 'Terlambat', 'in ritardo', '後期', '늦은', 'Laat', 'Atrasado', 'สาย', 'Geç', 'دیر', '晚了', 'laat', 'Spät', 'αργά', 'Tarde', 'ढिलो', 'поздно', 'Sent', 'Ուշ', 'გვიან', 'कै', 'Lewat', 'ਸਵ', 'தாமதமாக', 'ఆలస్యం', 'Sent', 'Late'),
(294, 'employees_attendance_report', 'Employees Attendance Report', 'কর্মচারী উপস্থিতি রিপোর্ট', 'الموظفين تقرير الحضور', 'Rapport de présence des employés', 'कर्मचारियों की उपस्थिति रिपोर्ट', 'Laporan kehadiran karyawan', 'Rapporto di presenza dei dipendenti', '従業員の出席レポート', '직원 출석 보고서', 'Medewerkers aanwezigheidsrapport', 'Relatório de comparecimento de funcionários', 'รายงานการเข้างานของพนักงาน', 'Çalışanlar katılım raporu', 'ملازمین کی حاضری کی رپورٹ', '员工出勤报告', 'Werknemersverslag', 'Anwesenheitsbericht der Mitarbeiter', 'Έκθεση παρακολούθησης εργαζομένων', 'Informe de asistencia de empleados', 'कर्मचारी उपस्थिति रिपोर्ट', 'Отчет о посещаемости сотрудников', 'Medarbejdernes deltagelsesrapport', 'Աշխատակիցների հաճախումների մասին զեկույց', 'თანამშრომელთა დასწრების ანგარიში', 'कर्मचार्‍यांची उपस्थिती अहवाल', 'Laporan Kehadiran Pekerja', 'ਕਰਮਚਾਰੀਆਂ ਦੀ ਹਾਜ਼ਰੀ ਦੀ ਰਿਪੋਰਟ', 'பணியாளர்கள் வருகை அறிக்கை', 'ఉద్యోగుల హాజరు నివేదిక', 'Anställdas närvarorapport', 'Ulat sa Pagdalo ng mga empleyado'),
(295, 'attendance_report_of', 'Attendance Report Of', 'উপস্থিতি রিপোর্ট', 'تقرير الحضور من', 'Rapport de présence de', 'उपस्थिति की रिपोर्ट', 'Laporan kehadiran', 'Relazione di partecipazione di', 'の出席報告書', '출석 보고서', 'Aanwezigheidsverslag van', 'Relatório de atendimento de', 'รายงานการเข้างานของ', 'Devam raporu', 'حاضری کی رپورٹ', '出席报告', 'Bywoningsverslag van', 'Anwesenheitsbericht von', 'Έκθεση παρακολούθησης της', 'Informe de asistencia de', 'उपस्थिति रिपोर्ट', 'Отчет о посещаемости', 'Deltagelsesrapport af', 'Մասնակցության զեկույց', 'დასწრების ანგარიში', 'उपस्थिती अहवाल', 'Laporan Kehadiran Dari', 'ਦੀ ਹਾਜ਼ਰੀ ਰਿਪੋਰਟ', 'வருகை அறிக்கை', 'హాజరు నివేదిక', 'Närvaro rapport av', 'Pag-uulat ng Ulat Ng'),
(296, 'fee_paid_report', 'Fee Paid Report', 'ফি প্রদান প্রতিবেদন', 'الرسوم المدفوعة التقرير', 'Rapport payé payé', 'शुल्क भुगतान रिपोर्ट', 'Laporan biaya dibayar', 'Pagamento pagato rapporto', '報酬支払報告書', '유료 보고서', 'Betaald rapport', 'Relatório remunerado', 'รายงานค่าใช้จ่าย', 'Ücretli Ödenen Rapor', 'فیس ادا کی رپورٹ', '付费报酬', 'Fooi betaal verslag', 'Gebührenpflichtiger Bericht', 'Αναφορά πληρωμένης χρέωσης', 'Informe de tarifa pagada', 'शुल्क तिरेको रिपोर्ट', 'Отчет об оплате', 'Betalt gebyrrapport', 'Վճարների վճարման մասին հաշվետվություն', 'საფასურის ანაზღაურებადი ანგარიში', 'फी भरलेला अहवाल', 'Laporan Bayaran Bayaran', 'ਫੀਸ ਦੀ ਅਦਾਇਗੀ ਦੀ ਰਿਪੋਰਟ', 'கட்டணம் செலுத்திய அறிக்கை', 'ఫీజు చెల్లింపు నివేదిక', 'Betald avgift', 'Ulat sa Bayad na Bayad'),
(297, 'invoice_no', 'Invoice No', 'চালান নং', 'رقم الفاتورة', 'Facture non', 'चालान नंबर', 'nomor faktur', 'fattura n', '請求書番号', '송장 번호', 'factuur nr', 'Factura não', 'หมายเลขใบแจ้งหนี้', 'Fatura no', 'انوائس نمبر', '发票号码', 'Kwitansie No', 'Rechnung Nr', 'Αριθμός τιμολογίου', 'Factura no', 'बिल संख्या', 'Счет №', 'Fakturanr', 'Ոչ հաշիվ ապրանքագիր', 'Ინვოისის ნომერი', 'बीजक क्र', 'No Invois', 'ਚਲਾਨ ਨੰ', 'விலைப்பட்டியல் எண்', 'ఇన్వాయిస్ నం', 'Faktura nr', 'Invoice Hindi'),
(298, 'payment_mode', 'Payment Mode', 'পরিশোধের মাধ্যম', 'طريقة الدفع', 'mode de paiement', 'भुगतान का प्रकार', 'Mode pembayaran', 'metodo di pagamento', '支払いモード', '지불 모드', 'betaalmethode', 'modo de pagamento', 'โหมดการชำระเงิน', 'ödeme şekli', 'ادائیگی کا طریقہ کار', '付款方式', 'Betaalmodus', 'Zahlungsart', 'Τρόπος πληρωμής', 'Modo de pago', 'भुक्तानी मोड', 'Режим оплаты', 'Betalingstilstand', 'Վճարման ռեժիմ', 'გადახდის რეჟიმი', 'देय मोड', 'Kaedah Pembayaran', 'ਭੁਗਤਾਨ ਮੋਡ', 'கட்டண முறை', 'చెల్లింపు మోడ్', 'Betalnings sätt', 'Paraan ng pagbabayad'),
(299, 'payment_type', 'Payment Type', 'পেমেন্ট টাইপ', 'نوع الدفع', 'type de paiement', 'भुगतान के प्रकार', 'tipe pembayaran', 'modalità di pagamento', '払いの種類', '지불 유형', 'betalingswijze', 'tipo de pagamento', 'ประเภทการชำระเงิน', 'ödeme türü', 'ادائیگی کی قسم', '付款方式', 'Tipe van betaling', 'Zahlungsart', 'Τρόπος πληρωμής', 'Tipo de pago', 'भुक्तानी प्रकार', 'Способ оплаты', 'Betalings type', 'Վճարման տեսակ', 'Გადახდის ტიპი', 'पैसे भरण्याची पध्दत', 'Jenis pembayaran', 'ਭੁਗਤਾਨ ਦੀ ਕਿਸਮ', 'கட்டணம் வகை', 'చెల్లించు విధానము', 'Betalnings typ', 'Uri ng Pagbabayad'),
(300, 'done', 'Done', 'সম্পন্ন', 'فعله', 'terminé', 'किया हुआ', 'Selesai', 'fatto', '完了', '끝난', 'gedaan', 'feito', 'เสร็จแล้ว', 'tamam', 'کیا ہوا', '完成', 'gedoen', 'Erledigt', 'Ολοκληρώθηκε', 'Hecho', 'भयो', 'Выполнено', 'Færdig', 'Կատարած', 'შესრულებულია', 'पूर्ण झाले', 'Selesai', 'ਹੋ ਗਿਆ', 'முடிந்தது', 'పూర్తి', 'Gjort', 'Tapos na'),
(301, 'select_fee_category', 'Select Fee Category', 'ফি বিভাগ নির্বাচন করুন', 'حدد فئة الرسوم', 'Sélectionner la catégorie tarifaire', 'शुल्क श्रेणी का चयन करें', 'Pilih kategori biaya', 'Selezionare la categoria dei diritti', '選択料金カテゴリ', '요금 카테고리 선택', 'Selecteer de tariefcategorie', 'Categoria de taxa selecionada', 'เลือกหมวดค่าธรรมเนียม', 'Ücret kategorisini seçin', 'فیس کی قسم منتخب کریں', '选择费用类别', 'Kies fooi-kategorie', 'Wählen Sie die Gebührenkategorie', 'Επιλέξτε Κατηγορία χρεώσεων', 'Seleccionar categoría de tarifa', 'शुल्क कोटी चयन गर्नुहोस्', 'Выберите категорию оплаты', 'Vælg gebyrkategori', 'Ընտրեք վճարների կատեգորիա', 'შეარჩიეთ საფასურის კატეგორია', 'फी श्रेणी निवडा', 'Pilih Kategori Yuran', 'ਫੀਸ ਸ਼੍ਰੇਣੀ ਦੀ ਚੋਣ ਕਰੋ', 'கட்டணம் வகையைத் தேர்ந்தெடுக்கவும்', 'ఫీజు వర్గాన్ని ఎంచుకోండి', 'Välj Avgiftskategori', 'Piliin ang Uri ng Bayad'),
(302, 'discount', 'Discount', 'ডিসকাউন্ট', 'خصم', 'remise', 'छूट', 'diskon', 'sconto', 'ディスカウント', '할인', 'korting', 'desconto', 'ส่วนลด', 'indirim', 'ڈسکاؤنٹ', '折扣', 'afslag', 'Rabatt', 'Εκπτωση', 'Descuento', 'छुट', 'скидка', 'Rabat', 'Զեղչ', 'ფასდაკლებით', 'सवलत', 'Diskaun', 'ਛੂਟ', 'தள்ளுபடி', 'డిస్కౌంట్', 'Rabatt', 'Diskwento'),
(303, 'enter_discount_amount', 'Enter Discount Amount', 'ছাড়ের পরিমাণ লিখুন', 'أدخل مبلغ الخصم', 'Saisir un montant d\'escompte', 'डिस्काउंट राशि दर्ज करें', 'Masukkan jumlah diskon', 'Inserire l\'importo del sconto', '割引額を入力', '할인 금액을 입력하십시오.', 'Vul kortingsbedrag in', 'Insira valor de desconto', 'ป้อนจำนวนเงินส่วนลด', 'Indirim tutarını gir', 'ڈسکاؤنٹ رقم درج کریں', '输入折扣金额', 'Voer kortingsbedrag in', 'Geben Sie den Rabattbetrag ein', 'Εισαγάγετε ποσό έκπτωσης', 'Ingrese el monto del descuento', 'छुट रकम प्रविष्ट गर्नुहोस्', 'Введите сумму скидки', 'Indtast rabatbeløb', 'Մուտքագրեք զեղչի գումար', 'შეიყვანეთ ფასდაკლების თანხა', 'सवलत रक्कम प्रविष्ट करा', 'Masukkan Amaun Diskaun', 'ਛੂਟ ਦੀ ਰਕਮ ਦਰਜ ਕਰੋ', 'தள்ளுபடி தொகையை உள்ளிடவும்', 'డిస్కౌంట్ మొత్తాన్ని నమోదు చేయండి', 'Ange rabattbelopp', 'Ipasok ang Halaga ng Diskwento'),
(304, 'online_payment', 'Online Payment', 'দূরবর্তী অর্থ প্রদান', 'الدفع عن بعد', 'Paiement à distance', 'रिमोट भुगतान', 'Pembayaran Jarak Jauh', 'Pagamento remoto', '遠隔支払い', '원격 지불', 'Afhankelijk van de betaling', 'Pagamento Remoto', 'การชำระเงินระยะไกล', 'Uzaktan Ödeme', 'ریموٹ ادائیگی', '远程付款', 'Aanlynbetaling', 'Onlinebezahlung', 'Διαδικτυακή πληρωμή', 'Pago en línea', 'अनलाइन भुक्तानी', 'Онлайн платеж', 'Online betaling', 'Առցանց վճարում', 'ონლაინ გადახდა', 'ऑनलाईन पेमेंट', 'Pembayaran Dalam Talian', 'Payਨਲਾਈਨ ਭੁਗਤਾਨ', 'ஆன்லைன் கட்டணம்', 'ఆన్లైన్ చెల్లింపు', 'Online betalning', 'Pagbabayad sa Online');
INSERT INTO `languages` (`id`, `word`, `english`, `bengali`, `arabic`, `french`, `hindi`, `indonesian`, `italian`, `japanese`, `korean`, `dutch`, `portuguese`, `thai`, `turkish`, `urdu`, `chinese`, `afrikaans`, `german`, `greek`, `spanish`, `nepali`, `russian`, `danish`, `armenian`, `georgian`, `marathi`, `malay`, `punjabi`, `tamil`, `telugu`, `swedish`, `filipino`) VALUES
(305, 'student_name', 'Student Name', 'শিক্ষার্থীর নাম', 'أسم الطالب', 'nom d\'étudiant', 'छात्र का नाम', 'nama siswa', 'nome dello studente', '学生の名前', '학생 이름', 'studenten naam', 'nome do aluno', 'ชื่อนักเรียน', 'Öğrenci adı', 'طالب علم کا نام', '学生姓名', 'Studente naam', 'Name des Studenten', 'Ονομα μαθητή', 'Nombre del estudiante', 'विद्यार्थीको नाम', 'Имя студента', 'Elevnavn', 'Ուսանողի անունը', 'Სტუდენტის სახელი', 'विद्यार्थ्याचे नाव', 'Nama pelajar', 'ਵਿਦਿਆਰਥੀ ਦਾ ਨਾਮ', 'மாணவன் பெயர்', 'విద్యార్థి పేరు', 'Elevs namn', 'Pangalan ng estudyante'),
(306, 'invoice_history', 'Invoice History', 'চালান ইতিহাস', 'تاريخ الفاتورة', 'Historique des factures', 'चालान का इतिहास', 'Riwayat faktur', 'La cronologia delle fatture', '請求書履歴', '송장 내역', 'Factuurgeschiedenis', 'Histórico de faturamento', 'ประวัติใบแจ้งหนี้', 'Fatura geçmişi', 'انوائس کی تاریخ', '发票历史记录', 'Faktuurgeskiedenis', 'Rechnungsverlauf', 'Ιστορικό τιμολογίων', 'Historial de facturas', 'इनभ्वाइस ईतिहास', 'История счетов', 'Fakturahistorie', 'Պարտատոմսերի պատմություն', 'ინვოისის ისტორია', 'बीजक इतिहास', 'Sejarah Invois', 'ਚਲਾਨ ਦਾ ਇਤਿਹਾਸ', 'விலைப்பட்டியல் வரலாறு', 'ఇన్వాయిస్ చరిత్ర', 'Fakturahistorik', 'Kasaysayan ng Invoice'),
(307, 'discount_amount', 'Discount Amount', 'হ্রাসকৃত মুল্য', 'مقدار الخصم', 'Montant de l\'escompte', 'छूट राशि', 'jumlah diskon', 'totale sconto', '割引額', '할인 금액', 'korting hoeveelheid', 'Valor do desconto', 'จำนวนส่วนลด', 'indirim tutarı', 'ڈسکاؤنٹ رقم', '折扣金额', 'Afslagbedrag', 'Rabattbetrag', 'Ποσό έκπτωσης', 'Importe de descuento', 'छुट रकम', 'Сумма скидки', 'Rabatbeløb', 'Զեղչի գումարը', 'Ფასდაკლების რაოდენობა', 'सवलत रक्कम', 'Jumlah diskaun', 'ਛੂਟ ਦੀ ਰਕਮ', 'தள்ளுபடி தொகை', 'డిస్కౌంట్ మొత్తం', 'Rabattbelopp', 'Halaga ng Diskwento'),
(308, 'invoice_list', 'Invoice List', 'চালান তালিকা', 'قائمة الفاتورة', 'Liste des factures', 'चालान सूची', 'Daftar faktur', 'Elenco delle fatture', '請求書一覧', '송장 목록', 'Factuurlijst', 'Lista de faturamento', 'รายการใบแจ้งหนี้', 'Fatura listesi', 'رسید کی فہرست', '发票清单', 'Faktuurlys', 'Rechnungsliste', 'Λίστα τιμολογίων', 'Lista de facturas', 'चलानी सूची', 'Список счетов', 'Fakturaliste', 'Պարտատոմսերի ցուցակ', 'ინვოისის სია', 'बीजक यादी', 'Senarai Invois', 'ਚਲਾਨ ਸੂਚੀ', 'விலைப்பட்டியல் பட்டியல்', 'ఇన్వాయిస్ జాబితా', 'Fakturalista', 'Listahan ng Invoice'),
(309, 'partly_paid', 'Partly Paid', 'আংশিক পরিশোধিত', 'تدفع جزئيا', 'En partie payé', 'आंशिक रूप से भुगतान किया', 'Sebagian dibayar', 'Parzialmente pagato', '部分的に支払われた', '부분적으로 지불 된', 'Gedeeltelijk betaald', 'Parcialmente pago', 'จ่ายบางส่วน', 'Kısmen ödenmiş', 'جزوی طور پر ادا کیا', '部分支付', 'Gedeeltelik betaal', 'Teilweise bezahlt', 'Εν μέρει πληρωμένος', 'Parcialmente pagado', 'आंशिक भुक्तानी', 'Частично оплаченный', 'Delvist betalt', 'Մասամբ վճարված', 'ნაწილობრივ გადახდილი', 'अर्धवट दिले', 'Dibayar Sebahagian', 'ਅੰਸ਼ਕ ਤੌਰ ਤੇ ਅਦਾ ਕੀਤੀ', 'ஓரளவு பணம்', 'పాక్షికంగా చెల్లించబడుతుంది', 'Delvis betald', 'Bahagyang Bayad'),
(310, 'fees_list', 'Fees List', 'ফি তালিকা', 'قائمة الرسوم', 'Liste des frais', 'शुल्क सूची', 'Daftar biaya', 'Lista dei diritti', '手数料リスト', '수수료 목록', 'Kostenlijst', 'Lista de tarifas', 'รายการค่าธรรมเนียม', 'Ücret listesi', 'فیس کی فہرست', '费用清单', 'Gelde lys', 'Gebührenliste', 'Λίστα χρεώσεων', 'Lista de tarifas', 'शुल्क सूची', 'Список сборов', 'Gebyreliste', 'Վճարների ցուցակ', 'მოსაკრებლების სია', 'शुल्काची यादी', 'Senarai Yuran', 'ਫੀਸ ਸੂਚੀ', 'கட்டணம் பட்டியல்', 'ఫీజు జాబితా', 'Avgiftslista', 'Listahan ng Mga Bayad'),
(311, 'voucher_id', 'Voucher ID', 'ভউচার আইডি', 'معرف القسيمة', 'Id de bon', 'वाउचर आईडी', 'voucher Id', 'Voucher Id', 'バウチャーID', '쿠폰 ID', 'Voucher id', 'Id do vale', 'รหัสบัตรกำนัล', 'Kupon kimliği', 'واؤچر کی شناخت', '凭证ID', 'Koopbewys-ID', 'Gutschein-ID', 'Αναγνωριστικό κουπονιού', 'ID de comprobante', 'भौचर आईडी', 'ID ваучера', 'Voucher ID', 'Վաուչերի ID', 'ვაუჩერის პირადობის მოწმობა', 'व्हाउचर आयडी', 'ID baucar', 'ਵਾouਚਰ ਆਈਡੀ', 'வவுச்சர் ஐடி', 'వోచర్ ఐడి', 'Voucher-ID', 'Voucher ID'),
(312, 'transaction_date', 'Transaction Date', 'লেনদেন তারিখ', 'تاريخ الصفقة', 'transaction date', 'लेन - देन की तारीख', 'tanggal transaksi', 'Data di transazione', '取引日取引日', '거래 날짜', 'transactie datum', 'Data da transação', 'วันที่ทำรายการ', 'İşlem Tarihi', 'ٹرانزیکشن کی تاریخ', '交易日期', 'Transaksie datum', 'Transaktionsdatum', 'Ημερομηνία Συναλλαγής', 'Fecha de Transacción', 'लेनदेन मिति', 'Дата сделки', 'Overførselsdato', 'Գործարքի ամսաթիվը', 'გარიგების თარიღი', 'व्यवहाराची तारीख', 'tarikh transaksi', 'ਲੈਣ-ਦੇਣ ਦੀ ਮਿਤੀ', 'பரிவர்த்தனை தேதி', 'లావాదేవీ తేదీ', 'Transaktions Datum', 'Petsa ng transaksyon'),
(313, 'admission_date', 'Admission Date', 'ভর্তির তারিখ', 'تاريخ القبول', 'admission date', 'प्रवेश तिथि', 'Tanggal masuk', 'data di ammissione', '入学日', '입학시기', 'toelatingsdatum', 'data de admissão', 'วันที่เข้าเรียน', 'Kabul tarihi', 'داخلہ کی تاریخ', '入学日期', 'Toelatingsdatum', 'Aufnahmedatum', 'Ημερομηνία εισαγωγής', 'Fecha de admisión', 'प्रवेश मिति', 'Дата поступления', 'Optagelsesdato', 'Ընդունման ամսաթիվը', 'დაშვების თარიღი', 'प्रवेश तारीख', 'Tarikh Kemasukan', 'ਦਾਖਲਾ ਮਿਤੀ', 'சேர்க்கை தேதி', 'ప్రవేశ తేదీ', 'Antaget datum', 'Petsa ng Pagpasok'),
(314, 'user_status', 'User Status', 'ব্যবহারকারীর স্থিতি', 'حالة المستخدم', 'Statut de l\'utilisateur', 'उपयोगकर्ता की स्थिति', 'User Status', 'Stato dell\'utente', 'ユーザーステータス', '사용자 상태', 'Gebruikers status', 'Status do usuário', 'สถานะผู้ใช้', 'Kullanıcı durumu', 'صارف کی حیثیت', '用户状态', 'Gebruikerstatus', 'Benutzerstatus', 'Κατάσταση χρήστη', 'Estatus de usuario', 'प्रयोगकर्ता स्थिति', 'Статус пользователя', 'Brugerstatus', 'Օգտագործողի կարգավիճակը', 'მომხმარებლის სტატუსი', 'वापरकर्त्याची स्थिती', 'Status Pengguna', 'ਉਪਭੋਗਤਾ ਸਥਿਤੀ', 'பயனர் நிலை', 'వినియోగదారు స్థితి', 'Användarstatus', 'Katayuan ng Gumagamit'),
(315, 'nationality', 'Nationality', 'জাতীয়তা', 'جنسية', 'nationalité', 'राष्ट्रीयता', 'kebangsaan', 'nazionalità', '国籍', '국적', 'nationaliteit', 'nacionalidade', 'สัญชาติ', 'milliyet', 'قومیت', '国籍', 'nasionaliteit', 'Staatsangehörigkeit', 'Ιθαγένεια', 'Nacionalidad', 'राष्ट्रीयता', 'Национальность', 'Nationalitet', 'Ազգություն', 'ეროვნება', 'राष्ट्रीयत्व', 'Kewarganegaraan', 'ਕੌਮੀਅਤ', 'தேசியம்', 'జాతీయత', 'Nationalitet', 'Nasyonalidad'),
(316, 'register_no', 'Register No', 'রেজিস্টার নং', 'سجل رقم', 'Inscrivez-vous non', 'रजिस्टर नं', 'Daftar no', 'Registrare n', '登録番号', '등록 번호', 'Registratienummer', 'Não registre', 'ลงทะเบียนไม่', 'Kayıt yok', 'رجسٹر نمبر', '注册号', 'Registrasienommer', 'Register Nr', 'Μητρώο αριθ', 'Registrarse No', 'नं', 'Регистрация №', 'Registreringsnummer', 'Գրանցվել ոչ', 'რეგისტრაცია არა', 'नोंदणी क्रमांक', 'Daftar No.', 'ਰਜਿਸਟਰ ਨੰ', 'பதிவு எண்', 'రిజిస్టర్ నెం', 'Registrera nr', 'Magrehistro Hindi'),
(317, 'first_name', 'First Name', 'প্রথম নাম', 'الاسم الاول', 'Prénom', 'पहला नाम', 'nama depan', 'nome di battesimo', 'ファーストネーム', '이름', 'Voornaam', 'primeiro nome', 'ชื่อจริง', 'İsim', 'پہلا نام', '名字', 'Eerste naam', 'Vorname', 'Ονομα', 'Nombre de pila', 'पहिलो नाम', 'Имя', 'Fornavn', 'Անուն', 'Სახელი', 'पहिले नाव', 'Nama pertama', 'ਪਹਿਲਾ ਨਾਂ', 'முதல் பெயர்', 'మొదటి పేరు', 'Förnamn', 'Pangalan'),
(318, 'last_name', 'Last Name', 'নামের শেষাংশ', 'الكنية', 'nom de famille', 'अंतिम नाम', 'nama keluarga', 'cognome', '苗字', '성', 'achternaam', 'último nome', 'นามสกุล', 'soyadı', 'آخری نام', '姓', 'Van', 'Nachname', 'Επίθετο', 'Apellido', 'थर', 'Фамилия', 'Efternavn', 'Ազգանուն', 'Გვარი', 'आडनाव', 'Nama terakhir', 'ਆਖੀਰਲਾ ਨਾਂਮ', 'கடைசி பெயர்', 'చివరి పేరు', 'Efternamn', 'Huling pangalan'),
(319, 'state', 'State', 'রাষ্ট্র', 'حالة', 'Etat', 'राज्य', 'negara', 'stato', '状態', '상태', 'staat', 'Estado', 'สถานะ', 'belirtmek, bildirmek', 'حالت', '州', 'staat', 'Zustand', 'κατάσταση', 'Estado', 'राज्य', 'государственный', 'Stat', 'Պետություն', 'სახელმწიფო', 'राज्य', 'Nyatakan', 'ਰਾਜ', 'நிலை', 'రాష్ట్రం', 'stat', 'Estado'),
(320, 'transport_vehicle_no', 'Transport Vehicle No', 'পরিবহন যানবাহন নং', 'رقم مركبة النقل', 'Véhicule de transport no', 'ट्रांसपोर्ट व्हीकल नं', 'Kendaraan Transportasi No', 'Veicolo di trasporto n', '輸送車両', '운송 차량 번호', 'Transportvoertuig Nr', 'Transport Vehicle No', 'ยานพาหนะขนส่ง', 'Taşıma Aracı No', 'ٹرانسپورٹ گاڑیاں نمبر', '运输车辆号', 'staat', 'Zustand', 'κατάσταση', 'Estado', 'राज्य', 'государственный', 'Stat', 'Պետություն', 'სახელმწიფო', 'राज्य', 'Nyatakan', 'ਰਾਜ', 'நிலை', 'రాష్ట్రం', 'stat', 'Estado'),
(321, 'percent', 'Percent', 'শতাংশ', 'نسبه مئويه', 'pour cent', 'प्रतिशत', 'persen', 'per cento', 'パーセント', '퍼센트', 'procent', 'por cento', 'เปอร์เซ็นต์', 'yüzde', 'فیصد', '百分', 'persent', 'Prozent', 'Τοις εκατό', 'Por ciento', 'प्रतिशत', 'Процент', 'procent', 'Տոկոսը', 'პროცენტი', 'टक्के', 'Peratus', 'ਪ੍ਰਤੀਸ਼ਤ', 'சதவீதம்', 'శాతం', 'Procent', 'Porsyento'),
(322, 'average_result', 'Average Result', 'গড় ফলাফল', 'متوسط ​​النتيجة', 'Résultat moyen', 'औसत परिणाम', 'Hasil rata-rata', 'Risultato medio', '平均結果', '평균 결과', 'Gemiddeld resultaat', 'Resultado médio', 'ผลเฉลี่ย', 'Ortalama sonuç', 'اوسط نتیجہ', '平均结果', 'Gemiddelde resultaat', 'Durchschnittliches Ergebnis', 'Μέσο αποτέλεσμα', 'Resultado promedio', 'औसत परिणाम', 'Средний результат', 'Gennemsnitligt resultat', 'Միջին արդյունքը', 'საშუალო შედეგი', 'सरासरी निकाल', 'Hasil Purata', 'Resਸਤਨ ਨਤੀਜਾ', 'சராசரி முடிவு', 'సగటు ఫలితం', 'Genomsnittligt resultat', 'Average na Resulta'),
(323, 'student_category', 'Student Category', 'ছাত্র বিভাগ', 'طالب', 'Catégorie étudiante', 'छात्र श्रेणी', 'Kategori siswa', 'Categoria studente', '学生カテゴリ', '학생 분류', 'Studentencategorie', 'Categoria de estudante', 'หมวดหมู่นักศึกษา', 'Öğrenci kategorisi', 'طالب علم کی قسم', '学生类别', 'Studentekategorie', 'Studentenkategorie', 'Κατηγορία Φοιτητών', 'Categoría de estudiante', 'विद्यार्थी वर्ग', 'Студенческая категория', 'Studerende kategori', 'Ուսանողների կատեգորիա', 'სტუდენტური კატეგორია', 'विद्यार्थी श्रेणी', 'Kategori Pelajar', 'ਵਿਦਿਆਰਥੀ ਸ਼੍ਰੇਣੀ', 'மாணவர் வகை', 'విద్యార్థి వర్గం', 'Studentkategori', 'Kategorya ng mag-aaral'),
(324, 'category_name', 'Category Name', 'বিভাগ নাম', 'اسم التصنيف', 'Nom de catégorie', 'श्रेणी नाम', 'Nama kategori', 'Nome della categoria', '種別名', '카테고리 이름', 'categorie naam', 'Nome da Categoria', 'ชื่อหมวดหมู่', 'Kategori adı', 'زمرہ کا نام', '分类名称', 'Kategorie Naam', 'Kategoriename', 'όνομα κατηγορίας', 'nombre de la categoría', 'कोटी नाम', 'Название категории', 'Kategorienavn', 'Կատեգորիայի անվանումը', 'კატეგორიის სახელი', 'श्रेणी नाव', 'Nama kategori', 'ਸ਼੍ਰੇਣੀ ਦਾ ਨਾਮ', 'வகை பெயர்', 'వర్గం పేరు', 'kategori namn', 'Pangalan ng kategorya'),
(325, 'category_list', 'Category List', 'বিভাগ তালিকা', 'قائمة الفئات', 'Liste des catégories', 'श्रेणी सूची', 'Daftar kategori', 'Elenco categorie', 'カテゴリリスト', '카테고리 목록', 'Categorie lijst', 'Lista de categorias', 'รายการหมวดหมู่', 'Kategori listesi', 'زمرہ کی فہرست', '类别列表', 'Kategorie lys', 'Kategorieliste', 'Λίστα κατηγοριών', 'Lista de categoría', 'कोटी सूची', 'Список категорий', 'Kategoriliste', 'Կատեգորիայի ցուցակ', 'კატეგორიების სია', 'श्रेणी यादी', 'Senarai Kategori', 'ਸ਼੍ਰੇਣੀ ਸੂਚੀ', 'வகை பட்டியல்', 'వర్గం జాబితా', 'Kategorilista', 'Listahan ng kategorya'),
(326, 'please_select_student_first', 'Please Select Students First', 'প্রথমে ছাত্রদের দয়া করে নির্বাচন করুন', 'يرجى اختيار الطلاب أولا', 'S\'il vous plaît sélectionner les étudiants de première', ' कृपया पहले छात्रों का चयन करें', 'Kérjük, először válassza ki a diákokat', 'Per favore seleziona gli studenti prima', '最初に生徒を選択してください', '먼저 학생을 선택하십시오.', 'Kies alsjeblieft eerst de leerlingen', 'Selecione os alunos primeiro', 'โปรดเลือกนักเรียนก่อน', 'Lütfen önce öğrencileri seç', 'سب سے پہلے طالب علموں کو منتخب کریں', '请先选择学生', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(327, 'designation', 'Designation', 'উপাধি', 'تعيين', 'La désignation', 'पद', 'Penunjukan', 'Designazione', '指定', '지정', 'Aanwijzing', 'Designação', 'การแต่งตั้ง', 'tayin', 'عہدہ', '指定', 'aanwysing', 'Bezeichnung', 'Ονομασία', 'Designacion', 'पदनाम', 'обозначение', 'Betegnelse', 'Նշանակում', 'Დანიშნულება', 'पदनाम', 'Penetapan', 'ਅਹੁਦਾ', 'பதவி', 'హోదా', 'Beteckning', 'Pagtatalaga'),
(328, 'qualification', 'Qualification', 'যোগ্যতা', 'المؤهل', 'Qualification', 'योग्यता', 'Kualifikasi', 'Qualificazione', '資格', '자격', 'Kwalificatie', 'Qualificação', 'คุณสมบัติ', 'Vasıf', 'اہلیت', '合格', 'kwalifikasie', 'Qualifikation', 'Προσόν', 'Calificación', 'योग्यता', 'Квалификация', 'Kvalifikation', 'Որակավորում', 'კვალიფიკაცია', 'पात्रता', 'Kelayakan', 'ਯੋਗਤਾ', 'தகுதி', 'అర్హతలు', 'Kompetens', 'Kwalipikasyon'),
(329, 'account_deactivated', 'Account Deactivated', 'অ্যাকাউন্ট নিষ্ক্রিয়', 'تم إلغاء تنشيط الحساب', 'Compte désactivé', 'खाता निष्क्रिय', 'Akun dinonaktifkan', 'Account disattivato', 'アカウントが無効になった', '계정이 비활성화되었습니다.', 'Account gedeactiveerd', 'Conta desativada', 'ปิดใช้งานบัญชีแล้ว', 'Hesap devre dışı', 'اکاؤنٹ غیر فعال ہے', '帐户已停用', 'Rekening gedeaktiveer', 'Konto deaktiviert', 'Ο λογαριασμός απενεργοποιήθηκε', 'Cuenta desactivada', 'खाता निष्क्रिय गरियो', 'Аккаунт деактивирован', 'Konto deaktiveret', 'Հաշիվն անջատված է', 'ანგარიშის გათიშვა', 'खाते निष्क्रिय केले', 'Akaun Dinyahaktifkan', 'ਖਾਤਾ ਅਯੋਗ', 'கணக்கு செயலிழக்கப்பட்டது', 'ఖాతా నిష్క్రియం చేయబడింది', 'Konto avaktiverat', 'Na-deactivate ang Account'),
(330, 'account_activated', 'Account Activated', 'অ্যাকাউন্ট সক্রিয়', 'تم تنشيط الحساب', 'Compte activé', 'खाते सक्रिय', 'Akun diaktifkan', 'Account attivato', 'Account attivato', '계정 활성화 됨', 'Account geactiveerd', 'Conta ativada', 'เปิดใช้งานบัญชีแล้ว', 'Hesap etkinleştirildi', 'اکاؤنٹ چالو', '帐户已激活', 'Rekening geaktiveer', 'Konto aktiviert', 'Ο λογαριασμός ενεργοποιήθηκε', 'Cuenta activada', 'खाता सक्रिय भयो', 'Аккаунт активирован', 'Konto aktiveret', 'Հաշիվն ակտիվացված է', 'ანგარიში გააქტიურებულია', 'खाते सक्रिय केले', 'Akaun Diaktifkan', 'ਖਾਤਾ ਚਾਲੂ', 'கணக்கு செயல்படுத்தப்பட்டது', 'ఖాతా సక్రియం చేయబడింది', 'Konto aktiverat', 'Aktibo ang Account'),
(331, 'designation_list', 'Designation List', 'পদবী তালিকা', 'قائمة التعيين', 'Liste de désignation', 'पदनाम सूची', 'Daftar Penunjukan', 'Elenco descrizioni', '指定リスト', '지정 명부', 'Benaming', 'Lista de designação', 'รายชื่อ', 'Belirleme Listesi', 'عہدہ کی فہرست', '名单', 'Aanwysingslys', 'Bezeichnungsliste', 'Λίστα προσδιορισμού', 'Lista de designaciones', 'पदनाम सूची', 'Список назначений', 'Betegnelsesliste', 'Նշանակման ցուցակ', 'დანიშნულების ჩამონათვალი', 'पदनाम यादी', 'Senarai Jawatan', 'ਅਹੁਦਾ ਸੂਚੀ', 'பதவி பட்டியல்', 'హోదా జాబితా', 'Beteckningslista', 'Listahan ng pagtatalaga'),
(332, 'joining_date', 'Joining Date', 'যোগদান তারিখ', 'تاريخ الانضمام', 'Date d\'inscription', 'कार्यग्रहण तिथि', 'Tanggal Bergabung', 'Data di adesione', '参加日', '가입 날짜', 'Aansluitingsdatum', 'Data de ingresso', 'วันที่เข้าร่วม', 'Birleştirme Tarihi', 'تاریخ میں شمولیت', '入职日期', 'Sluitingsdatum', 'Beitrittsdatum', 'Ημερομηνία συμμετοχής', 'Dia de ingreso', 'सम्मिलित मिति', 'Дата вступления', 'Deltagelsesdato', 'Միանալու ամսաթիվը', 'გაწევრიანების თარიღი', 'सामील होण्याची तारीख', 'Tarikh Penyertaan', 'ਸ਼ਾਮਲ ਹੋਣ ਦੀ ਮਿਤੀ', 'சேரும் தேதி', 'చేరిన తేది', 'Inträdesdatum', 'Sumali sa Petsa'),
(333, 'relation', 'Relation', 'সম্পর্ক', 'علاقة', 'Relation', 'रिश्ता', 'Hubungan', 'Relazione', '関係', '관계', 'Relatie', 'Relação', 'ความสัมพันธ์', 'ilişki', 'تعلقات', '关系', 'verhouding', 'Beziehung', 'Σχέση', 'Relación', 'सम्बन्ध', 'Связь', 'relation', 'Հարաբերություն', 'ურთიერთობა', 'संबंध', 'Perhubungan', 'ਸਬੰਧ', 'உறவு', 'రిలేషన్', 'Relation', 'Kaugnayan'),
(334, 'father_name', 'Father Name', 'বাবার নাম', 'اسم الأب', 'nom du père', 'पिता का नाम', 'nama ayah', 'nome del padre', '父の名前', '아버지의 이름', 'Vader naam', 'nome do pai', 'ชื่อบิดา', 'baba adı', 'والد کا نام', '父亲姓名', 'Vader se naam', 'Der Name des Vaters', 'Ονομα πατρός', 'Nombre del Padre', 'पिता नाम', 'Имя Отца', 'Far&#39;s navn', 'Հոր անուն', 'Მამის სახელი', 'वडीलांचे नावं', 'Nama bapa', 'ਪਿਤਾ ਦਾ ਨਾਮ', 'தந்தையின் பெயர்', 'తండ్రి పేరు', 'Fadernamn', 'Pangalan ng Ama'),
(335, 'librarian_list', 'Librarian List', 'গ্রন্থাগারিক তালিকা', 'قائمة أمين المكتبة', 'Liste des bibliothécaires', 'लाइब्रेरियन लिस्ट', 'Daftar Pustakawan', 'Lista bibliotecaria', '図書館員リスト', '사서 목록', 'Bibliothecarislijst', 'Lista de bibliotecários', 'รายชื่อบรรณารักษ์', 'Kütüphaneci listesi', 'لائبریری کی فہرست', '图书馆员名单', 'Bibliotekarislys', 'Bibliothekar Liste', 'Λίστα βιβλιοθηκών', 'Lista de bibliotecarios', 'लाइब्रेरियन सूची', 'Список библиотекарей', 'Bibliotekarliste', 'Գրադարանային ցուցակ', 'ბიბლიოთეკის სია', 'ग्रंथपाल यादी', 'Senarai Pustakawan', 'ਲਾਇਬ੍ਰੇਰੀਅਨ ਸੂਚੀ', 'நூலகர் பட்டியல்', 'లైబ్రేరియన్ జాబితా', 'Bibliotekarlista', 'Listahan ng Librarian'),
(336, 'class_numeric', 'Class Numeric', 'ক্লাস সাংখ্যিক', 'فئة رقمية', 'Classe Numérique', 'कक्षा संख्यात्मक', 'Kelas Numerik', 'Class Numerico', 'クラス数値', '클래스 숫자', 'Class Numeric', 'Classe Numérica', 'Class Numeric', 'Sayısal Sınıf', 'کلاس نمبر', '类数字', 'Klasnommer', 'Klasse Numerisch', 'Αριθμητική τάξη', 'Clase numérica', 'वर्ग संख्यात्मक', 'Числовой класс', 'Klasse Numerisk', 'Դասական թվային', 'კლასი რიცხვითი', 'वर्ग संख्या', 'Numerik Kelas', 'ਕਲਾਸ ਨੰਬਰ', 'வகுப்பு எண்', 'తరగతి సంఖ్యా', 'Klassnummer', 'Numeric ng Klase'),
(337, 'maximum_students', 'Maximum Students', 'সর্বোচ্চ ছাত্র', 'الحد الأقصى للطلاب', 'Maximum d\'étudiants', 'अधिकतम छात्र', 'Siswa Maksimal', 'Studenti massimi', '最大生徒数', '최대 학생수', 'Maximale Studenten', 'Alunos máximos', 'นักเรียนสูงสุด', 'Maksimum Öğrenci', 'زیادہ سے زیادہ طلباء', '最大学生', 'Maksimum Studente', 'Maximale Schülerzahl', 'Μέγιστος μαθητής', 'Máximo de estudiantes', 'अधिकतम विद्यार्थी', 'Максимум студентов', 'Maksimum studerende', 'Առավելագույն ուսանողներ', 'მაქსიმალური სტუდენტები', 'जास्तीत जास्त विद्यार्थी', 'Pelajar Maksimum', 'ਵੱਧ ਤੋਂ ਵੱਧ ਵਿਦਿਆਰਥੀ', 'அதிகபட்ச மாணவர்கள்', 'గరిష్ట విద్యార్థులు', 'Maximum studenter', 'Pinakamataas na Mag-aaral'),
(338, 'class_room', 'Class Room', 'ক্লাস রুমে', 'قاعة الدراسة', 'Salle de classe', 'कक्षा के कमरे', 'kelas', 'aula', 'クラスルーム', '교실', 'Klaslokaal', 'Sala de aula', 'ห้องเรียน', 'Sınıf oda', 'کلاس روم', '课室', 'Klas kamer', 'Klassenzimmer', 'ΣΧΟΛΙΚΗ ΑΙΘΟΥΣΑ', 'Aula', 'कक्षा कोठा', 'Класс', 'Klasseværelse', 'Դասասենյակ', 'კლასის ოთახი', 'वर्ग कक्ष', 'Bilik Kelas', 'ਕਲਾਸ ਰੂਮ', 'வகுப்பறை', 'తరగతి గది', 'Klassrum', 'Silid ng Klase'),
(339, 'pass_mark', 'Pass Mark', 'পাশ নম্বর', 'علامة المرور', 'moyenne', 'उतीर्णांक', 'kelulusan', 'punteggio minimo', 'パスマーク', '통과 표시', 'Pass markeren', 'Marca de aprovação', 'เครื่องหมายผ่าน', 'Geçme notu', 'کامیابی کے نمبر', '合格标志', 'Slaagsyfer', 'Mindestpunktzahl', 'Περάστε το σήμα', 'Aprobado', 'पास मार्क', 'Проходной балл', 'Beståelseskarakter', 'Անցեք Մարկ', 'გაივლის მარკი', 'पास मार्क', 'Tanda Lulus', 'ਪਾਸ ਮਾਰਕ', 'தேர்ச்சி மதிப்பெண்', 'పాస్ మార్క్', 'Godkänt', 'Pasadong marka'),
(340, 'exam_time', 'Exam Time (Min)', 'পরীক্ষার সময় (মিনিট)', 'وقت الامتحان', 'Temps d\'examen (min)', 'परीक्षा का समय', 'waktu ujian', 'Tempo di esame', '試験時間', '시험 시간', 'examentijd', 'hora da prova', 'เวลาสอบ', 'sınav zamanı', 'امتحان کا وقت', '考试时间', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(341, 'time', 'Time', 'সময়', 'زمن', 'temps', 'पहर', 'waktu', 'tempo', '時間', '시각', 'tijd', 'Tempo', 'เวลา', 'zaman', 'وقت', '时间', 'tyd', 'Zeit', 'χρόνος', 'Hora', 'समय', 'Время', 'Tid', 'Ժամանակը', 'დრო', 'वेळ', 'Masa', 'ਸਮਾਂ', 'நேரம்', 'సమయం', 'Tid', 'Oras'),
(342, 'subject_code', 'Subject Code', 'বিষয় কোড', 'رمز الموضوع', 'Code du sujet', 'विषय संहिता', 'Kode subjek', 'Codice oggetto', 'テーマコード', '제목 코드', 'Vakcode', 'Código do assunto', 'รหัสหัวเรื่อง', 'Konu Kodu', 'موضوع کا کوڈ', '主题代码', 'Vakkode', 'Betreff Code', 'Κωδικός θέματος', 'Código sujeto', 'विषय कोड', 'Код темы', 'Emnekode', 'Առարկայական օրենսգիրք', 'საგნების კოდექსი', 'विषय कोड', 'Kod Mata Pelajaran', 'ਵਿਸ਼ਾ ਕੋਡ', 'பொருள் குறியீடு', 'విషయం కోడ్', 'Ämneskod', 'Code ng Paksa'),
(343, 'full_mark', 'Full Mark', 'পুরো নম্বর', 'درجة كاملة', 'Pleine marque', 'पूर्ण अंक', 'Tanda penuh', 'Full Mark', '満点', '만점', 'Full Mark', 'Nota máxima', 'เครื่องหมายเต็มรูปแบบ', 'Tam not', 'مکمل نشان', '满分', 'Volpunte', 'Volle Note', 'Πλήρες σήμα', 'Marca completa', 'पूर्ण मार्क', 'Отметить все', 'Fuld mark', 'Լրիվ Մարկ', 'სრული მარკა', 'पूर्ण गुण', 'Markah Penuh', 'ਪੂਰਾ ਮਾਰਕ', 'முழு மதிப்பெண்', 'పూర్తి మార్కులు', 'Högsta betyg', 'Buong marka'),
(344, 'subject_type', 'Subject Type', 'বিষয় প্রকার', 'نوع الموضوع', 'Type de sujet', 'विषय प्रकार', 'Tipe subjek', 'Tipo di soggetto', 'サブジェクトタイプ', '주제 유형', 'Onderwerp type', 'Tipo de assunto', 'ประเภทของเรื่อง', 'Konu türü', 'موضوع کی قسم', '主题类型', 'Onderwerpstipe', 'Betreff Typ', 'Τύπος θέματος', 'Tipo de Asunto', 'विषय प्रकार', 'Тип предмета', 'Emnetype', 'Առարկայի տեսակը', 'საგნის ტიპი', 'विषय प्रकार', 'Jenis Mata Pelajaran', 'ਵਿਸ਼ਾ ਕਿਸਮ', 'பொருள் வகை', 'విషయం రకం', 'Ämntyp', 'Uri ng Paksa'),
(345, 'date_of_publish', 'Date Of Publish', 'প্রকাশের তারিখ', 'تاريخ النشر', 'Date de publication', 'प्रकाशित की तिथि', 'Tanggal Publikasikan', 'Data di pubblicazione', '出版の日付', '게시 날짜', 'Datum van publicatie', 'Data de publicação', 'วันที่เผยแพร่', 'Yayın Tarihi', 'شائع کی تاریخ', '发布日期', 'Datum van publikasie', 'Datum der Veröffentlichung', 'Ημερομηνία δημοσίευσης', 'Fecha de publicación', 'प्रकाशनको मिति', 'Дата публикации', 'Dato for offentliggørelse', 'Հրապարակման ամսաթիվը', 'გამოქვეყნების თარიღი', 'प्रकाशित होण्याची तारीख', 'Tarikh Terbitan', 'ਪਬਲਿਸ਼ ਦੀ ਮਿਤੀ', 'வெளியிடும் தேதி', 'ప్రచురించిన తేదీ', 'Datum för publicering', 'Petsa ng Pag-publish'),
(346, 'file_name', 'File Name', 'ফাইলের নাম', 'اسم الملف', 'Nom de fichier', 'फ़ाइल का नाम', 'Nama file', 'Nome del file', 'ファイル名', '파일 이름', 'Bestandsnaam', 'Nome do arquivo', 'ชื่อไฟล์', 'Dosya adı', 'فائل کا نام', '文件名', 'Lêernaam', 'Dateiname', 'Ονομα αρχείου', 'Nombre del archivo', 'फाईल नाम', 'Имя файла', 'Filnavn', 'Ֆայլի անուն', 'Ფაილის სახელი', 'फाईलचे नाव', 'Nama fail', 'ਫਾਈਲ ਦਾ ਨਾਮ', 'கோப்பு பெயர்', 'ఫైల్ పేరు', 'Filnamn', 'Pangalan ng File'),
(347, 'students_list', 'Students List', 'ছাত্র তালিকা', 'قائمة الطلاب', 'Liste des étudiants', 'छात्र सूची', 'Daftar siswa', 'Lista degli studenti', '学生リスト', '학생 목록', 'Studentenlijst', 'Lista de Estudantes', 'รายชื่อนักเรียน', 'Öğrenci Listesi', 'طلباء کی فہرست', '学生名单', 'Studente lys', 'Studentenliste', 'Λίστα μαθητών', 'Lista de estudiantes', 'विद्यार्थीहरूको सूची', 'Список студентов', 'Studerendes liste', 'Ուսանողների ցուցակ', 'სტუდენტთა სია', 'विद्यार्थ्यांची यादी', 'Senarai Pelajar', 'ਵਿਦਿਆਰਥੀਆਂ ਦੀ ਸੂਚੀ', 'மாணவர்கள் பட்டியல்', 'విద్యార్థుల జాబితా', 'Studentlista', 'Listahan ng mga Mag-aaral'),
(348, 'start_date', 'Start Date', 'শুরুর তারিখ', 'تاريخ البدء', 'Date de début', 'आरंभ करने की तिथि', 'Mulai tanggal', 'Data d\'inizio', '開始日', '시작 날짜', 'Begin datum', 'Data de início', 'วันที่เริ่มต้น', 'Başlangıç ​​tarihi', 'شروع کرنے کی تاریخ', '开始日期', 'Begindatum', 'Anfangsdatum', 'Ημερομηνία έναρξης', 'Fecha de inicio', 'सुरू मिति', 'Дата начала', 'Start dato', 'Մեկնարկի ամսաթիվ', 'Დაწყების თარიღი', 'प्रारंभ तारीख', 'Tarikh mula', 'ਤਾਰੀਖ ਸ਼ੁਰੂ', 'தொடக்க தேதி', 'ప్రారంబపు తేది', 'Start datum', 'Panimula ng Petsa'),
(349, 'end_date', 'End Date', 'শেষ তারিখ', 'تاريخ الانتهاء', 'End Date', 'अंतिम तिथि', 'Tanggal akhir', 'Data di fine', '終了日', '종료일', 'Einddatum', 'Data final', 'วันที่สิ้นสุด', 'Bitiş tarihi', 'آخری تاریخ', '结束日期', 'Einddatum', 'Endtermin', 'Ημερομηνία λήξης', 'Fecha final', 'अन्त्य मिति', 'Дата окончания', 'End Date', 'Ավարտի ամսաթիվը', 'Დასრულების თარიღი', 'शेवटची तारीख', 'Tarikh tamat', 'ਅੰਤ ਦੀ ਮਿਤੀ', 'கடைசி தேதி', 'ఆఖరి తేది', 'Slutdatum', 'Pagtatapos ng Petsa'),
(350, 'term_name', 'Term Name', 'টার্ম নাম', 'اسم المدى', 'Nom du terme', 'शब्द का नाम', 'Nama istilah', 'Termine nome', '用語の名前', '학기명', 'Termnaam', 'Nome do termo', 'ชื่อย่อ', 'Dönem adı', 'اصطلاح نام', '术语名称', 'Termynnaam', 'Begriff Name', 'Όνομα όρου', 'Nombre del plazo', 'अवधि नाम', 'Название срока', 'Term navn', 'Տերմինի անուն', 'ტერმინის სახელი', 'टर्म नाव', 'Nama Istilah', 'ਪਦ ਨਾਮ', 'கால பெயர்', 'పదం పేరు', 'Termnamn', 'Pangalan ng Kataga'),
(351, 'grand_total', 'Grand Total', 'সর্বমোট', 'المبلغ الإجمالي', 'Grand Total', 'कुल योग', 'Total keseluruhan', 'Somma totale', '総計', '총 합계', 'Eindtotaal', 'Total geral', 'ผลรวมทั้งสิ้น', 'Genel Toplam', 'مجموعی عدد', '累计', 'Groot totaal', 'Gesamtsumme', 'Σύνολο', 'Gran total', 'कूल जम्मा', 'Общая сумма', 'Grand Total', 'Գրանդ տոտալ', 'გრანდ ტოტალში', 'भव्य एकूण', 'Jumlah keseluruhan', 'ਸਮੁੱਚੀ ਗਿਣਤੀ', 'மொத்தம்', 'సంపూర్ణ మొత్తము', 'Grand Total', 'Grand Kabuuan'),
(352, 'result', 'Result', 'ফল', 'نتيجة', 'Résultat', 'परिणाम', 'Hasil', 'Risultato', '結果', '결과', 'Resultaat', 'Resultado', 'ผล', 'Sonuç', 'نتیجہ', '结果', 'gevolg', 'Ergebnis', 'Αποτέλεσμα', 'Resultado', 'परिणाम', 'Результат', 'Resultat', 'Արդյունք', 'შედეგი', 'निकाल', 'Keputusan', 'ਨਤੀਜਾ', 'விளைவாக', 'ఫలితం', 'Resultat', 'Resulta'),
(353, 'books_list', 'Books List', 'বই তালিকা', 'قائمة الكتب', 'Liste des livres', 'पुस्तकें सूची', 'Daftar Buku', 'Elenco libri', '書籍一覧', '도서 목록', 'Boekenlijst', 'Lista de livros', 'รายการหนังสือ', 'Kitap Listesi', 'کتب کی فہرست', '图书列表', 'Boeke lys', 'Bücherliste', 'Λίστα βιβλίων', 'Lista de libros', 'पुस्तक सूची', 'Список книг', 'Bøger liste', 'Գրքերի ցուցակ', 'წიგნების სია', 'पुस्तकांची यादी', 'Senarai Buku', 'ਕਿਤਾਬਾਂ ਦੀ ਸੂਚੀ', 'புத்தகங்களின் பட்டியல்', 'పుస్తకాల జాబితా', 'Böcker Lista', 'Listahan ng Mga Libro'),
(354, 'book_isbn_no', 'Book ISBN No', 'বই ISBN নং', 'كتاب رقم إيسبن رقم', 'Livre numéro ISBN', 'पुस्तक आईएसबीएन नंबर', 'Buku ISBN no', 'Libro ISBN n', '本ISBN no', 'ISBN no book', 'Boek ISBN nr', 'ISBN do livro', 'หนังสือ ISBN no', 'Kitap ISBN no', 'کتاب ISBN نمبر', '书ISBN号', 'Boek ISBN-nr', 'Buch ISBN Nr', 'Κράτηση ISBN αριθ', 'Libro ISBN No', 'Book ISBN No', 'Книга ISBN Нет', 'Bog ISBN-nr', 'Գիրք ISBN No.', 'წიგნი ISBN No.', 'पुस्तक आयएसबीएन क्र', 'Buku ISBN No.', 'ਬੁੱਕ ISBN ਨੰ', 'புத்தகம் ஐ.எஸ்.பி.என் எண்', 'పుస్తకం ISBN నం', 'Boken ISBN-nr', 'Book ISBN Hindi'),
(355, 'total_stock', 'Total Stock', 'মোট স্টক', 'إجمالي الأسهم', 'Total Stock', 'कुल स्टॉक', 'Jumlah Saham', 'Totale azioni', '総在庫', '총 주식', 'Totaal voorraad', 'Total Stock', 'รวมสต็อค', 'Toplam Stok', 'کل اسٹاک', '总库存', 'Totale voorraad', 'Gesamtbestand', 'Συνολικό απόθεμα', 'Stock total', 'कुल स्टक', 'Общий запас', 'Samlet lager', 'Ընդհանուր բաժնետոմս', 'სულ საფონდო', 'एकूण स्टॉक', 'Jumlah Stok', 'ਕੁਲ ਸਟਾਕ', 'மொத்த பங்கு', 'మొత్తం స్టాక్', 'Totalt lager', 'Kabuuang Stock'),
(356, 'issued_copies', 'Issued Copies', 'ইস্যু করা কপি', 'تم إصدار نسخ', 'Copies émises', 'जारी की गई प्रतियां', 'Salinan yang Diterbitkan', 'Copie emesse', '発行されたコピー', '발행 된 사본', 'Uitgegeven kopieën', 'Cópias Emitidas', 'ออกสำเนา', 'Çıkarılan Kopyalar', 'تاریخ اشاعت شدہ', '发行副本', 'Uitgegee kopieë', 'Ausgestellte Kopien', 'Εκδόθηκαν αντίγραφα', 'Copias emitidas', 'जारी गरिएको प्रतिलिपिहरू', 'Выданные копии', 'Udstedte kopier', 'Թողարկվել է պատճեններ', 'გაცემული ასლები', 'जारी केलेल्या प्रती', 'Salinan yang Dikeluarkan', 'ਜਾਰੀ ਕੀਤੀਆਂ ਕਾਪੀਆਂ', 'வழங்கப்பட்ட பிரதிகள்', 'జారీ చేసిన కాపీలు', 'Utgivna kopior', 'Inisyu ng mga Kopya'),
(357, 'publisher', 'Publisher', 'প্রকাশক', 'الناشر', 'éditeur', 'प्रकाशक', 'penerbit', 'editore', '出版社', '발행자', 'uitgever', 'editor', 'สำนักพิมพ์', 'Yayımcı', 'پبلیشر', '出版者', 'uitgewer', 'Verleger', 'Εκδότης', 'Editor', 'प्रकाशक', 'издатель', 'Forlægger', 'Հրատարակիչ', 'გამომცემელი', 'प्रकाशक', 'Penerbit', 'ਪ੍ਰਕਾਸ਼ਕ', 'பதிப்பகத்தார்', 'ప్రచురణ', 'Utgivare', 'Publisher'),
(358, 'books_issue', 'Books Issue', 'বই ইস্যু', 'كتاب المسألة', 'Problème de livre', 'पुस्तक अंक', 'Penerbitan buku', 'Emissione del libro', '書籍の問題', '도서 문제', 'Boekprobleem', 'Problema do livro', 'ฉบับหนังสือ', 'Kitap Numarası', 'کتاب کا مسئلہ', '图书问题', 'Boeke-uitgawe', 'Bücher Ausgabe', 'Έκδοση βιβλίων', 'Edición de libros', 'पुस्तक मुद्दा', 'Выпуск книг', 'Bøgerudgave', 'Գրքերի թողարկում', 'წიგნების გამოცემა', 'पुस्तकांचा मुद्दा', 'Terbitan Buku', 'ਕਿਤਾਬਾਂ ਦਾ ਮੁੱਦਾ', 'புத்தகங்கள் வெளியீடு', 'పుస్తకాల ఇష్యూ', 'Böckerutgåva', 'Isyu ng Mga Libro'),
(359, 'user', 'User', 'ব্যবহারকারী', 'المستعمل', 'Utilisateur', 'उपयोगकर्ता', 'Pengguna', 'Utente', 'ユーザー', '사용자', 'Gebruiker', 'Do utilizador', 'ผู้ใช้งาน', 'kullanıcı', 'صارف', '用户', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(360, 'fine', 'Fine', 'জরিমানা', 'غرامة', 'Bien', 'ठीक', 'Baik', 'Fine', 'ファイン', '벌금', 'denique', 'Bem', 'ละเอียด', 'İnce', 'ٹھیک', '精细', 'fyn', 'Fein', 'Πρόστιμο', 'Multa', 'राम्रो', 'хорошо', 'Bøde', 'Տուգանք', 'ჯარიმა', 'छान', 'Baik', 'ਵਧੀਆ', 'நல்லது', 'ఫైన్', 'Bra', 'Fine'),
(361, 'pending', 'Pending', 'অনিষ্পন্ন', 'قيد الانتظار', 'en attendant', 'अपूर्ण', 'Tertunda', 'in attesa di', '保留中', '계류중인', 'in afwachting', 'pendente', 'อยู่ระหว่างดำเนินการ', 'kadar', 'زیر التواء', '有待', 'hangende', 'steht aus', 'εκκρεμής', 'Pendiente', 'पेन्डि।', 'В ожидании', 'Verserende', 'Սպասում', 'ველოდებით', 'प्रलंबित', 'Yang belum selesai', 'ਬਕਾਇਆ', 'நிலுவையில் உள்ளது', 'పెండింగ్', 'I väntan på', 'Naghihintay'),
(362, 'return_date', 'Return Date', 'প্রত্যাবর্তন তারিখ', 'تاريخ العودة', 'date de retour', 'वापसी की तिथि', 'tanggal pengembalian', 'data di ritorno', '返却日', '반환 기일', 'retourdatum', 'data de retorno', 'วันที่กลับ', 'dönüş tarihi', 'واپسی کی تاریخ', '归期', 'Terugkeer datum', 'Rückflugdatum', 'Ημερομηνία επιστροφής', 'Fecha de regreso', 'फिर्ती मिति', 'Дата возвращения', 'Retur dato', 'Վերադարձի ամսաթիվը', 'Დაბრუნების თარიღი', 'परतीची तारीख', 'Tarikh Pengembalian', 'ਵਾਪਸੀ ਦੀ ਮਿਤੀ', 'திரும்பும் தேதி', 'తిరిగి వచ్చు తేదీ', 'Återlämningsdatum', 'Petsa ng Pagbabalik'),
(363, 'accept', 'Accept', 'গ্রহণ করা', 'قبول', 'Acceptez', 'स्वीकार करना', 'menerima', 'accettare', '受け入れる', '받아 들인다', 'accepteren', 'aceitar', 'ยอมรับ', 'kabul etmek', 'قبول کرو', '接受', 'aanvaar', 'Akzeptieren', 'Αποδέχομαι', 'Aceptar', 'स्वीकार्नुहोस्', 'принимать', 'Acceptere', 'Ընդունել', 'მიიღოს', 'स्वीकारा', 'Terima', 'ਸਵੀਕਾਰ ਕਰੋ', 'ஏற்றுக்கொள்', 'అంగీకరించు', 'Acceptera', 'Tanggapin'),
(364, 'reject', 'Reject', 'প্রত্যাখ্যান', 'رفض', 'rejeter', 'अस्वीकार', 'menolak', 'rifiutare', '拒否する', '받지 않다', 'afwijzen', 'rejeitar', 'ปฏิเสธ', 'reddetmek', 'رد کرنا', '拒绝', 'verwerp', 'Ablehnen', 'Απορρίπτω', 'Rechazar', 'अस्वीकार', 'отклонять', 'Afvise', 'Մերժել', 'Უარყოს', 'नाकारणे', 'Tolak', 'ਰੱਦ ਕਰੋ', 'நிராகரி', 'తిరస్కరించు', 'Avvisa', 'Tanggihan'),
(365, 'issued', 'Issued', 'ইস্যু করা', 'نشر', 'Publié', 'जारी किए गए', 'Dikabarkan', 'Rilasciato', '発行済み', '발행 된', 'Uitgegeven', 'Emitido', 'ออก', 'Veriliş', 'جاری کردیا گیا', '发行', 'Uitgereik', 'Ausgegeben', 'Εκδόθηκε', 'Emitido', 'जारी गरियो', 'Выпущен', 'Udstedt', 'Թողարկված', 'Გამოცემული, მიღებული', 'जारी', 'Dikeluarkan', 'ਜਾਰੀ ਕੀਤਾ', 'வழங்கப்பட்டது', 'జారి చేయబడిన', 'Utfärdad', 'Inisyu'),
(366, 'return', 'Return', 'প্রত্যাবর্তন', 'إرجاع', 'Revenir', 'वापसी', 'Kembali', 'Ritorno', '戻る', '반환', 'terugkeer', 'Retorna', 'กลับ', 'Dönüş', 'واپس لو', '返回', 'terugkeer', 'Rückkehr', 'ΕΠΙΣΤΡΟΦΗ', 'Regreso', 'फर्किनु', 'Возвращение', 'Vend tilbage', 'Վերադարձիր', 'Დაბრუნების', 'परत', 'Kembali', 'ਵਾਪਸ', 'திரும்பவும்', 'రిటర్న్', 'Lämna tillbaka', 'Bumalik'),
(367, 'renewal', 'Renewal', 'পুনরারম্ভ', 'تجديد', 'renouvellement', 'नवीकरण', 'pembaruan', 'rinnovo', '更新', '갱신', 'vernieuwing', 'renovação', 'การฟื้นฟู', 'yenileme', 'تجدید', '复兴', 'vernuwing', 'Erneuerung', 'Ανανέωση', 'Renovación', 'नवीकरण', 'обновление', 'Fornyelse', 'Վերականգնումը', 'განახლება', 'नूतनीकरण', 'Pembaharuan', 'ਨਵੀਨੀਕਰਣ', 'புதுப்பித்தல்', 'పునరుద్ధరణ', 'Förnyelse', 'Pagpapabago'),
(368, 'fine_amount', 'Fine Amount', 'জরিমানা পরিমাণ', 'كمية غرامة', 'Montant fin', 'ठीक राशि', 'Jumlah denda', 'Ammontare fine', '微量', '좋은 금액', 'Fijne hoeveelheid', 'Quantidade fina', 'จำนวนเงินที่เหมาะสม', 'Ince miktar', 'جرمانے کی رقم', '罚款', 'Boete', 'Feiner Betrag', 'Πρόστιμο ποσό', 'Cantidad fina', 'राम्रो रकम', 'Штраф сумма', 'Fint beløb', 'Տուգանքի գումար', 'ჯარიმა', 'उत्तम रक्कम', 'Jumlah Denda', 'ਵਧੀਆ ਰਕਮ', 'சிறந்த தொகை', 'జరిమానా మొత్తం', 'Fint belopp', 'Maayong Halaga'),
(369, 'password_mismatch', 'Password Mismatch', 'পাসওয়ার্ড মেলেনি', 'عدم تطابق كلمة المرور', 'Incompatibilité de mot de passe', 'पासवर्ड बेमेल', 'Sandi ketidakcocokan', 'Mancata corrispondenza delle password', 'パスワードの不一致', '암호 불일치', 'Wachtwoord Mismatch', 'Incompatibilidade de senha', 'รหัสผ่านไม่ตรงกัน', 'Parola uyuşmazlığı', 'پاس ورڈ غیر مشابہ', '密码不匹配', 'Boete', 'Feiner Betrag', 'Πρόστιμο ποσό', 'Cantidad fina', 'राम्रो रकम', 'Штраф сумма', 'Fint beløb', 'Տուգանքի գումար', 'ჯარიმა', 'उत्तम रक्कम', 'Jumlah Denda', 'ਵਧੀਆ ਰਕਮ', 'சிறந்த தொகை', 'జరిమానా మొత్తం', 'Fint belopp', 'Maayong Halaga'),
(370, 'settings_updated', 'Settings Update', 'সেটিংস আপডেট করুন', 'تحديث الإعدادات', 'Mise à jour de paramètres', 'सेटिंग्स अद्यतन', 'Update pengaturan', 'Aggiornamento delle impostazioni di', '設定の更新', '설정 업데이트', 'Instellingen Update', 'Atualização de configurações', 'ปรับปรุงการตั้งค่า', 'Ayarları güncelleştirme', 'سیٹنگیں تازہ کاری کریں', '更新设置', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(371, 'pass', 'Pass', 'পাস', 'البشري', 'passer', 'उत्तीर्ण करना', 'lulus', 'passaggio', 'パス', '패스', 'slagen voor', 'slagen voor', 'ผ่านไป', 'pas', 'پاس', '通过', 'Pass', 'Bestehen', 'Πέρασμα', 'Pasar', 'पास', 'Проходить', 'Passere', 'Անցնել', 'გაივლის', 'पास', 'Lulus', 'ਪਾਸ', 'பாஸ்', 'పాస్', 'Passera', 'Pumasa'),
(372, 'event_to', 'Event To', 'ইভেন্টের জন্য', 'الحدث ل', 'Événement à', 'घटना के लिए', 'Acara ke', 'Evento a', '〜へのイベント', '~에 이벤트', 'Evenement naar', 'Evento para', 'เหตุการณ์ไป', 'Olaya', 'واقعہ', '事件到', 'Geleentheid tot', 'Ereignis zu', 'Εκδήλωση σε', 'Evento a', 'कार्यक्रम गर्न', 'Событие Для', 'Begivenhed til', 'Միջոցառում', 'ღონისძიება', 'इव्हेंट टू', 'Acara Ke', 'ਇਵੈਂਟ ਟੂ', 'நிகழ்வு', 'ఈవెంట్ టు', 'Händelse till', 'Kaganapan To'),
(373, 'all_users', 'All Users', 'সকল ব্যবহারকারী', 'جميع المستخدمين', 'tous les utilisateurs', 'सभी उपयोगकर्ताओं', 'minden felhasználó', 'tutti gli utenti', 'すべてのユーザー', '모든 사용자들', 'alle gebruikers', 'todos os usuários', 'ผู้ใช้ทั้งหมด', 'tüm kullanıcılar', 'تمام صارفین', '全部用户', 'Alle gebruikers', 'Alle Nutzer', 'Ολοι οι χρήστες', 'Todos los usuarios', 'सबै प्रयोगकर्ताहरू', 'Все пользователи', 'Alle brugere', 'Բոլոր օգտատերերը', 'Ყველა მომხმარებელი', 'सर्व वापरकर्ते', 'Semua pengguna', 'ਸਾਰੇ ਉਪਭੋਗਤਾ', 'அனைத்து பயனாளர்கள்', 'వినుయోగాదారులందరూ', 'Alla användare', 'Lahat ng gumagamit'),
(374, 'employees_list', 'Employees List', 'কর্মচারী তালিকা', 'قائمة الموظفين', 'Liste des employés', 'कर्मचारियों की सूची', 'Daftar karyawan', 'Elenco dei dipendenti', '従業員リスト', '직원 목록', 'Werknemers lijst', 'Lista de funcionários', 'รายชื่อพนักงาน', 'Çalışanların listesi', 'ملازمین کی فہرست', '员工名单', 'Werknemerslys', 'Mitarbeiterliste', 'Λίστα υπαλλήλων', 'Lista de empleados', 'कर्मचारी सूची', 'Список сотрудников', 'Medarbejderliste', 'Աշխատակիցների ցուցակ', 'თანამშრომელთა სია', 'कर्मचार्‍यांची यादी', 'Senarai Pekerja', 'ਕਰਮਚਾਰੀਆਂ ਦੀ ਸੂਚੀ', 'பணியாளர்கள் பட்டியல்', 'ఉద్యోగుల జాబితా', 'Medarbetarlista', 'Listahan ng mga empleyado'),
(375, 'on', 'On', 'উপর', 'على', 'sur', 'पर', 'di', 'sopra', 'に', '...에', 'op', 'em', 'บน', 'üzerinde', 'پر', '上', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(376, 'timezone', 'Timezone', 'সময় অঞ্চল', 'وحدة زمنية', 'fuseau horaire', 'समय क्षेत्र', 'zona waktu', 'fuso orario', 'タイムゾーン', '시간대', 'tijdzone', 'fuso horário', 'เขตเวลา', 'saat dilimi', 'ٹائم زون', '时区', 'Tydsone', 'Zeitzone', 'Ζώνη ώρας', 'Zona horaria', 'समय क्षेत्र', 'Часовой пояс', 'Tidszone', 'Ժամային գոտի', 'Დროის სარტყელი', 'वेळ क्षेत्र', 'Zon masa', 'ਸਮਾਂ ਖੇਤਰ', 'நேரம் மண்டலம்', 'సమయమండలం', 'Tidszon', 'Oras ng oras'),
(377, 'get_result', 'Get Result', 'ফলাফল পেতে', 'الحصول على نتيجة', 'Obtenir un résultat', 'परिणाम प्राप्त करें', 'Mendapatkan hasil', 'Ottenere il risultato', '結果を得る', '결과를 얻다', 'Resultaat krijgen', 'Obter resultado', 'ได้ผลลัพธ์', 'Sonuç almak', 'نتائج حاصل کریں', '得到结果', 'Kry resultaat', 'Ergebnis abrufen', 'Αποκτήστε το αποτέλεσμα', 'Obtener resultado', 'नतिजा प्राप्त गर्नुहोस्', 'Получить результат', 'Få resultat', 'Ստացեք արդյունք', 'მიიღეთ შედეგი', 'निकाल मिळवा', 'Dapatkan Hasil', 'ਨਤੀਜਾ ਪ੍ਰਾਪਤ ਕਰੋ', 'முடிவைப் பெறுங்கள்', 'ఫలితం పొందండి', 'Få resultat', 'Kumuha ng Resulta'),
(378, 'apply', 'Apply', 'প্রয়োগ করা', 'تطبيق', 'appliquer', 'लागू करें', 'menerapkan', 'applicare', '適用する', '대다', 'van toepassing zijn', 'Aplique', 'ใช้', 'uygulamak', 'لاگو کریں', '应用', 'aansoek doen', 'Anwenden', 'Ισχύουν', 'Aplicar', 'निवेदन गर्नु', 'Применять', 'ansøge', 'Դիմել', 'მიმართვა', 'अर्ज करा', 'Memohon', 'ਲਾਗੂ ਕਰੋ', 'விண்ணப்பிக்கவும்', 'వర్తించు', 'Tillämpa', 'Mag-apply'),
(379, 'hrm', 'Human Resource', 'মানব সম্পদ', 'الموارد البشرية', 'ressource humaine', 'मानव संसाधन', 'sumber daya manusia', 'risorse umane', '人的資源', '인적 자원', 'menselijke hulpbronnen', 'recursos humanos', 'Hr / payroll', 'ทรัพยากรบุคคล', 'انسانی وسائل', '人力资源', 'Menslike hulpbronne', 'Humanressourcen', 'Ανθρώπινο δυναμικό', 'Recursos humanos', 'मानवीय संसाधन', 'Отдел кадров', 'Menneskelige ressourcer', 'የሰው ሀይል አስተዳደር', 'Ადამიანური რესურსების', 'मानवी संसाधने', 'Sumber Manusia', 'ਮਾਨਵੀ ਸੰਸਾਧਨ', 'மனித வளம்', 'మానవ వనరులు', 'Personalavdelning', 'Mga mapagkukunan ng tao'),
(380, 'payroll', 'Payroll', 'বেতনের', 'كشف رواتب', 'paie', 'पेरोल', 'daftar gaji', 'libro paga', '給与計算', '급여', 'loonlijst', 'folha de pagamento', 'บัญชีเงินเดือน', 'maaş bordrosu', 'تنخواہ', '工资表', 'betaalstaat', 'Lohn-und Gehaltsabrechnung', 'Κατάσταση μισθοδοσίας', 'Nómina de sueldos', 'पेरोल', 'Платежная ведомость', 'Lønningsliste', 'Աշխատավարձ', 'სახელფასო', 'पेरोल', 'Penggajian', 'ਤਨਖਾਹ', 'ஊதியம்', 'పేరోల్', 'Löner', 'Payroll'),
(381, 'salary_assign', 'Salary Assign', 'বেতন বরাদ্দ', 'مراقبة الرواتب', 'Contrôle des salaires', 'वेतन नियंत्रण', 'Kontrol gaji', 'Controllo dello stipendio', '給与管理', '급여 관리', 'Looncontrole', 'Controle salarial', 'การควบคุมเงินเดือน', 'Maaş kontrolü', 'تنخواہ کا کنٹرول', '工资控制', 'Salarisstoekenning', 'Gehaltszuweisung', 'Μισθός ανάθεσης', 'Asignación de salario', 'वेतन तोक्नुहोस्', 'Назначение зарплаты', 'Løn Tildeling', 'Աշխատավարձի նշանակում', 'ხელფასის მინიჭება', 'वेतन असाइन', 'Tugasan Gaji', 'ਤਨਖਾਹ ਨਿਰਧਾਰਤ', 'சம்பள ஒதுக்கு', 'జీతం కేటాయించండి', 'Lönstilldelning', 'Ipagtalaga ng Salary'),
(382, 'employee_salary', 'Payment Salary', 'পেমেন্ট বেতন', 'دفع الراتب', 'Salaire de paiement', 'भुगतान वेतन', 'Gaji gaji', 'Salario del pagamento', '給与給与', '지불 급여', 'Betalingsloon', 'Salário de pagamento', 'เงินเดือน', 'Ödeme maaşı', 'ادائیگی تنخواہ', '支付工资', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(383, 'application', 'Application', 'আবেদন', 'الوضعية', 'application', 'आवेदन', 'aplikasi', 'applicazione', '応用', '신청', 'toepassing', 'aplicação', 'ใบสมัคร', 'uygulama', 'درخواست', '应用', 'aansoek', 'Anwendung', 'Εφαρμογή', 'Solicitud', 'अनुप्रयोग', 'заявка', 'Ansøgning', 'Դիմում', 'განაცხადი', 'अर्ज', 'Permohonan', 'ਐਪਲੀਕੇਸ਼ਨ', 'விண்ணப்பம்', 'అప్లికేషన్', 'Ansökan', 'Application'),
(384, 'award', 'Award', 'পুরস্কার', 'جائزة', 'prix', 'पुरस्कार', 'menghadiahkan', 'premio', '賞', '장학금', 'onderscheiding', 'Prêmio', 'รางวัล', 'ödül', 'ایوارڈ', '奖', 'Toekenning', 'Vergeben', 'Βραβείο', 'Premio', 'पुरस्कार', 'награда', 'Pris', 'Մրցանակ', 'ჯილდო', 'पुरस्कार', 'Anugerah', 'ਅਵਾਰਡ', 'விருது', 'అవార్డు', 'Tilldela', 'Award'),
(385, 'basic_salary', 'Basic Salary', 'মূল বেতন', 'راتب اساسي', 'salaire de base', 'मूल वेतन', 'gaji pokok', 'salario di base', '基本給', '기본 급여', 'basis salaris', 'salário básico', 'เงินเดือนทั่วไป', 'temel maaş', 'بنیادی تنخواہ', '基础工资', 'Basiese salaris', 'Grundgehalt', 'Βασικού μισθού', 'Salario base', 'आधारभूत तलब', 'Основная зарплата', 'Grundløn', 'Բազային աշխատավարձը', 'ძირითადი ხელფასი', 'मूळ वेतन', 'Gaji pokok', 'ਮੁ Salaਲੀ ਤਨਖਾਹ', 'அடிப்படை சம்பளம்', 'మూల వేతనం', 'Grundlön', 'Pangunahing suweldo'),
(386, 'employee_name', 'Employee Name', 'কর্মকর্তার নাম', 'اسم الموظف', 'Nom de l\'employé', 'कर्मचारी का नाम', 'nama karyawan', 'Nome dipendente', '従業員名', '직원 이름', 'Naam werknemer', 'nome do empregado', 'ชื่อพนักงาน', 'Çalışan Adı', 'ملازم کا نام', '员工姓名', 'Naam van werknemer', 'Mitarbeitername', 'όνομα υπαλλήλου', 'Nombre de empleado', 'कर्मचारीको नाम', 'Имя сотрудника', 'Ansattes navn', 'Աշխատողի անունը', 'თანამშრომელთა სახელი', 'कर्मचारी नाव', 'Nama Pekerja', 'ਕਰਮਚਾਰੀ ਦਾ ਨਾਮ', 'பணியாளர் பெயர்', 'ఉద్యోగి పేరు', 'Anställd Namn', 'Pangalan ng empleyado'),
(387, 'name_of_allowance', 'Name Of Allowance', 'ভাতা নাম', 'اسم البدل', 'nom de l\'allocation', 'भत्ता का नाम', 'Nama tunjangan', 'nome dell\'indennità', '手当の名', '수당 명', 'Naam van de toelage', 'Nome do subsídio', 'ชื่อเบี้ยเลี้ยง', 'Ödenek adı', 'الاؤنس کا نام', '津贴名称', 'Naam van toelae', 'Name der Zulage', 'Όνομα επιδόματος', 'Nombre de la asignación', 'भत्ताको नाम', 'Название пособия', 'Navn på godtgørelse', 'Նվիրատվության անուն', 'სახელი Allowance', 'भत्तेचे नाव', 'Nama Elaun', 'ਭੱਤੇ ਦਾ ਨਾਮ', 'கொடுப்பனவின் பெயர்', 'భత్యం పేరు', 'Namn på bidrag', 'Pangalan Ng Allowance'),
(388, 'name_of_deductions', 'Name Of Deductions', 'কর্তনের নাম', 'اسم الاستقطاعات', 'Nom des déductions', 'कटौती का नाम', 'Nama deduksi', 'Nome delle deduzioni', '控除名', '공제 명', 'Naam van aftrek', 'Nome das deduções', 'ชื่อของการหักเงิน', 'Kesintilerin adı', 'کٹوتیوں کا نام', '扣除名称', 'Naam van aftrekkings', 'Name der Abzüge', 'Όνομα εκπτώσεων', 'Nombre de las deducciones', 'कटौती को नाम', 'Наименование вычетов', 'Fradragsnavn', 'Նվազեցումների անվանումը', 'გამოკლების სახელი', 'वजावटीचे नाव', 'Nama Potongan', 'ਕਟੌਤੀਆਂ ਦਾ ਨਾਮ', 'கழிவுகளின் பெயர்', 'తగ్గింపుల పేరు', 'Avdragets namn', 'Pangalan Ng Mga Bawas'),
(389, 'all_employees', 'All Employees', 'সমস্ত কর্মচারী', 'كل الموظفين', 'tous les employés', 'सभी कर्मचारी', 'semua pegawai', 'tutti gli impiegati', '全従業員', '모든 직원', 'alle werknemers', 'todos os empregados', 'พนักงานทั้งหมด', 'tüm çalışanlar', 'تمام ملازمین', '所有员工', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(390, 'total_allowance', 'Total Allowance', 'মোট ভাতা', 'مجموع المخصصات', 'Allocation totale', 'कुल भत्ता', 'Total tunjangan', 'Indennità totale', '合計手当', '총 수당', 'Totale toelage', 'Subsídio total', 'เบี้ยประชุม', 'Toplam ödenek', 'مجموعی الاؤنس', '总额', 'Totale toelaag', 'Gesamtzulage', 'Συνολικό επίδομα', 'Subsidio total', 'कुल भत्ता', 'Общее пособие', 'Samlet tilskud', 'Ընդհանուր նպաստ', 'მთლიანი დახმარება', 'एकूण भत्ता', 'Jumlah Elaun', 'ਕੁੱਲ ਭੱਤਾ', 'மொத்த கொடுப்பனவு', 'మొత్తం భత్యం', 'Total ersättning', 'Kabuuang Allowance'),
(391, 'total_deduction', 'Total Deductions', 'মোট কর্তন', 'مجموع الخصومات', 'le total des déductions', 'कुल कटौती', 'Total deduksi', 'deduzione totale', '総控除額', '총 공제액', 'totale inhoudingen', 'deduções totais', 'การหักเงินทั้งหมด', 'Toplam kesintiler', 'کل کٹوتی', '总扣除额', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(392, 'net_salary', 'Net Salary', 'মোট বেতন', 'صافي الراتب', 'salaire net', 'कुल वेतन', 'gaji bersih', 'Salario netto', '純給与', '순 급여', 'netto salaris', 'salário líquido', 'เงินเดือนสุทธิ', 'net maaş', 'خالص تنخواہ', '净薪水', 'Netto salaris', 'Nettogehalt', 'Καθαρός μισθός', 'Sueldo neto', 'शुद्ध तलब', 'Чистая зарплата', 'Netto løn', 'Զուտ աշխատավարձ', 'წმინდა ანაზღაურება', 'निव्वळ पगार', 'Gaji Bersih', 'ਸ਼ੁੱਧ ਤਨਖਾਹ', 'நிகர சம்பளம்', 'నికర జీతం', 'Nettolön', 'Net Salary'),
(393, 'payslip', 'Payslip', 'স্লিপে', 'قسيمة الدفع', 'Payslip', 'payslip', 'Payslip', 'busta paga', 'ペイプルップ', 'Payslip', 'loonstrook', 'Pague basculante', 'payslip', 'maaş bordrosu', 'پیرسپ', '工资单', 'betaalstrokie', 'Gehaltsabrechnung', 'Απόδειξη', 'Recibo de sueldo', 'Payslip', 'расчетные ведомости', 'lønseddel', 'Payslip', 'Payslip', 'पेस्लिप', 'Payslip', 'ਪੇਸਲਿੱਪ', 'பேஸ்லிப்', 'payslip', 'lönebesked', 'Payslip'),
(394, 'days', 'Days', 'দিন', 'أيام', 'journées', 'दिन', 'Hari', 'giorni', '日々', '일', ' dagen', 'dias', 'วัน', 'günler', 'دن', '天', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(395, 'category_name_already_used', 'Category Name Already Used', 'বিভাগের নাম ইতিমধ্যে ব্যবহৃত', 'اسم الفئة المستخدمة من قبل', 'Nom de la catégorie déjà utilisé', 'श्रेणी का नाम पहले से उपयोग किया गया', 'Nama kategori sudah digunakan', 'Nome di categoria già utilizzato', 'すでに使用されているカテゴリ名', '이미 사용 된 카테고리 이름', 'categorie naam al in gebruik', 'Nome da categoria já utilizado', 'ชื่อหมวดหมู่ที่ใช้อยู่แล้ว', 'Kategori adı zaten kullanılmış', 'قسم کا نام پہلے سے ہی استعمال کیا جاتا ہے', '类别名称已被使用', 'Kategorie Naam reeds gebruik', 'Kategoriename bereits verwendet', 'Το όνομα της κατηγορίας έχει ήδη χρησιμοποιηθεί', 'Nombre de categoría ya utilizado', 'कोटी नाम पहिले नै प्रयोग गरीएको छ', 'Название категории уже используется', 'Kategorienavn er allerede brugt', 'Կատեգորիայի անվանումը արդեն օգտագործվել է', 'კატეგორიის სახელი უკვე გამოიყენება', 'श्रेणी नाव आधीपासून वापरलेले आहे', 'Nama Kategori Sudah Digunakan', 'ਸ਼੍ਰੇਣੀ ਦਾ ਨਾਮ ਪਹਿਲਾਂ ਹੀ ਵਰਤਿਆ ਗਿਆ ਹੈ', 'வகை பெயர் ஏற்கனவே பயன்படுத்தப்பட்டது', 'వర్గం పేరు ఇప్పటికే ఉపయోగించబడింది', 'Kategorinamn som redan används', 'Pangalan ng kategorya Nagamit na'),
(396, 'leave_list', 'Leave List', 'তালিকা ছেড়ে', 'قائمة الإجازات', 'Laisser liste', 'छुट्टी सूची', 'lasciare l\'elenco', 'lasciare l\'elenco', 'リストを残す', '휴가 목록', 'Verlof lijst', 'Sair da lista', 'ออกจากรายการ', 'Izin listesi', 'چھوڑ دو', '离开列表', 'Verlaatlys', 'Liste verlassen', 'Αποχώρηση λίστας', 'Dejar lista', 'छोड्नुहोस् सूची', 'Оставить список', 'Forlad liste', 'Թողնել ցուցակ', 'დატოვე სია', 'सोडा यादी', 'Tinggalkan Senarai', 'ਛੱਡੋ ਸੂਚੀ', 'பட்டியலை விடுங்கள்', 'జాబితా వదిలి', 'Lämna lista', 'Mag-iwan ng Listahan'),
(397, 'leave_category', 'Leave Category', 'বিভাগ ছেড়ে', 'ترك الفئة', 'Laisser la catégorie', 'श्रेणी छोड़ें', 'Meninggalkan kategori', 'Lasciare la categoria', 'カテゴリーを離れる', '카테고리를 떠나다', 'Categorie achterlaten', 'Sair da categoria', 'ออกจากหมวด', 'Ayrıl kategori', 'زمرے چھوڑ دو', '离开类别', 'Verlaat kategorie', 'Kategorie verlassen', 'Αποχώρηση κατηγορίας', 'Dejar categoría', 'श्रेणी छोड्नुहोस्', 'Покинуть категорию', 'Forlad kategori', 'Թողեք Կատեգորիա', 'დატოვე კატეგორია', 'श्रेणी सोडा', 'Tinggalkan Kategori', 'ਸ਼੍ਰੇਣੀ ਛੱਡੋ', 'வகையை விடுங்கள்', 'వర్గాన్ని వదిలివేయండి', 'Lämna kategori', 'Iwanan ang kategorya'),
(398, 'applied_on', 'Applied On', 'প্রয়োগ করা', 'تطبيق على', 'appliqué sur', 'पर लागू', 'Diterapkan pada', 'Applicato', 'に適用される', '에 적용된', 'Toegepast op', 'Aplicado em', 'นำมาใช้', 'Üzerine uygulanmış', 'پر لاگو', '应用于', 'Toegepas op', 'Aufgetragen auf', 'Εφαρμόστηκε στις', 'Aplicado en', 'लागू गरिएको', 'Применяется', 'Anvendt på', 'Կիրառվեց', 'გამოყენებულია', 'वर अर्ज केला', 'Digunakan Pada', 'ਤੇ ਲਾਗੂ ਕੀਤਾ', 'பயன்படுத்தப்பட்டது', 'వర్తించబడింది', 'Tillämpad på', 'Inilapat Sa'),
(399, 'accepted', 'Accepted', 'গৃহীত', 'قبلت', 'accepté', 'स्वीकार किए जाते हैं', 'Diterima', 'accettato', '受け入れられた', '받아 들인', 'aanvaard', 'aceitaram', 'ได้รับการยอมรับ', 'kabul edilmiş', 'قبول', '公认', 'Aanvaarde', 'Akzeptiert', 'Δεκτός', 'Aceptado', 'स्वीकार गरियो', 'Принятый', 'Accepteret', 'Ընդունված է', 'მიღებულია', 'स्वीकारले', 'Diterima', 'ਸਵੀਕਾਰਿਆ', 'ஏற்றுக்கொள்ளப்பட்டது', 'ఆమోదించబడిన', 'Accepterad', 'Tinanggap'),
(400, 'leave_statistics', 'Leave Statistics', 'ছুটি পরিসংখ্যান', 'وترك الإحصاءات', 'Quitter les statistiques', 'सांख्यिकी छोड़ें', 'Meninggalkan statistik', 'Lasciare le statistiche', '統計を残す', '통계를 남겨 두다', 'Laat statistieken achter', 'Deixar estatísticas', 'ออกจากสถิติ', 'Istatistiği bırak', 'اعداد و شمار چھوڑ دو', '离开统计', 'Laat statistieke', 'Statistik verlassen', 'Αφήστε Στατιστικά', 'Dejar estadísticas', 'तथ्या .्क छोड्नुहोस्', 'Оставить статистику', 'Forlad statistik', 'Թողեք վիճակագրությունը', 'დატოვე სტატისტიკა', 'सांख्यिकी सोडा', 'Tinggalkan Statistik', 'ਅੰਕੜੇ ਛੱਡੋ', 'புள்ளிவிவரங்களை விடுங்கள்', 'గణాంకాలను వదిలివేయండి', 'Lämna statistik', 'Iwanan ang Mga Istatistika'),
(401, 'leave_type', 'Leave Type', 'ছুটি টাইপ', 'نوع الإجازة', 'Type de permission', 'प्रकार छोड़ें', 'Tipe kiri', 'Lasciare il tipo', '離脱型', '탈퇴 유형', 'Verlaat type', 'Deixe o tipo', 'ออกจากประเภท', 'Terk türü', 'قسم چھوڑ دو', '离开类型', 'Verlaat tipe', 'Typ verlassen', 'Αποχώρηση τύπου', 'Dejar tipo', 'प्रकार छोड्नुहोस्', 'Тип отпуска', 'Forlad Type', 'Թողնել տեսակը', 'დატოვე ტიპი', 'रजा प्रकार', 'Jenis Cuti', 'ਛੱਡਣ ਦੀ ਕਿਸਮ', 'வகை விடுங்கள்', 'రకాన్ని వదిలివేయండి', 'Lämna typ', 'Mag-iwan ng Uri'),
(402, 'reason', 'Reason', 'কারণ', 'السبب', 'raison', 'कारण', 'alasan', 'ragionare', '理由', '이유', 'reden', 'razão', 'เหตุผล', 'neden', 'وجہ', '原因', 'rede', 'Grund', 'Λόγος', 'Razón', 'कारण', 'причина', 'Grund', 'Պատճառ', 'მიზეზი', 'कारण', 'Sebab', 'ਕਾਰਨ', 'காரணம்', 'కారణము', 'Anledning', 'Pangangatwiran'),
(403, 'close', 'Close', 'বন্ধ', 'أغلق', 'Fermer', 'बंद करे', 'dekat', 'vicino', '閉じる', '닫기', 'dichtbij', 'fechar', 'ปิด', 'kapat', 'بند', '关', 'Naby', 'Schließen', 'Κλείσε', 'Cerca', 'बन्द', 'близко', 'Tæt', 'փակել', 'დახურვა', 'बंद', 'Tutup', 'ਬੰਦ ਕਰੋ', 'நெருக்கமான', 'దగ్గరగా', 'Stänga', 'Isara'),
(404, 'give_award', 'Give Award', 'পুরস্কার দাও', 'إعطاء الجائزة', 'Donner un prix', 'पुरस्कार दें', 'Berikan penghargaan', 'Dare un premio', '賞を与える', '상을 주다', 'Prijs geven', 'Dar prêmio', 'ให้รางวัล', 'Ödül vermek', 'ایوارڈ دینا', '给予奖励', 'Gee toekenning', 'Preis geben', 'Δώστε το βραβείο', 'Dar premio', 'पुरस्कार दिनुहोस्', 'Дать награду', 'Give Award', 'Տվեք մրցանակ', 'მიეცით ჯილდო', 'पुरस्कार द्या', 'Beri Anugerah', 'ਐਵਾਰਡ ਦਿਓ', 'விருது கொடுங்கள்', 'అవార్డు ఇవ్వండి', 'Ge utmärkelsen', 'Bigyan ng Award'),
(405, 'list', 'List', 'তালিকা', 'قائمة', 'liste', 'सूची', 'daftar', 'elenco', 'リスト', '명부', 'lijst', 'Lista', 'รายการ', 'liste', 'فہرست', '名单', 'lys', 'Liste', 'Λίστα', 'Lista', 'सूची', 'Список', 'Liste', 'Ցուցակ', 'ჩამოთვლა', 'यादी', 'Senaraikan', 'ਸੂਚੀ', 'பட்டியல்', 'జాబితా', 'Lista', 'Listahan'),
(406, 'award_name', 'Award Name', 'পুরস্কারের নাম', 'اسم الجائزة', 'nom de l\'attribution', 'पुरस्कार नाम', 'Nama penghargaan', 'Nome del premio', '賞品名', '보너스 이름', 'Toekenning naam', 'Nome do prêmio', 'ชื่อรางวัล', 'Ödül adı', 'ایوارڈ کا نام', '奖名', 'Toekenningsnaam', 'Award Name', 'Όνομα βραβείου', 'Nombre del premio', 'पुरस्कार नाम', 'Название награды', 'Prisenavn', 'Մրցանակաբաշխության անուն', 'ჯილდოს სახელი', 'पुरस्कार नाव', 'Nama Anugerah', 'ਪੁਰਸਕਾਰ ਦਾ ਨਾਮ', 'விருது பெயர்', 'అవార్డు పేరు', 'Prisnamn', 'Pangalan ng Award');
INSERT INTO `languages` (`id`, `word`, `english`, `bengali`, `arabic`, `french`, `hindi`, `indonesian`, `italian`, `japanese`, `korean`, `dutch`, `portuguese`, `thai`, `turkish`, `urdu`, `chinese`, `afrikaans`, `german`, `greek`, `spanish`, `nepali`, `russian`, `danish`, `armenian`, `georgian`, `marathi`, `malay`, `punjabi`, `tamil`, `telugu`, `swedish`, `filipino`) VALUES
(407, 'gift_item', 'Gift Item', 'উপহার আইটেম', 'هدية البند', 'Objet cadeau', 'उपहार आइटम', 'Barang hadiah', 'Elemento regalo', 'ギフトアイテム', '선물 품목', 'Geschenkartikel', 'Item de presente', 'รายการของขวัญ', 'Hediye kalemi', 'تحفہ شے', '礼品', 'Geskenkitem', 'Geschenkartikel', 'Στοιχείο δώρου', 'Artículo de regalo', 'उपहार वस्तु', 'Подарочный товар', 'Gave vare', 'Նվերների առարկա', 'საჩუქრის ნივთი', 'भेट वस्तू', 'Item Hadiah', 'ਉਪਹਾਰ ਵਸਤੂ', 'பரிசு பொருள்', 'బహుమతి అంశం', 'Presentföremål', 'Item ng Regalo'),
(408, 'cash_price', 'Cash Price', 'নগদ মূল্য', 'سعر الصرف', 'Prix ​​en espèces', 'नकद मूल्य', 'Harga tunai', 'Prezzo in contanti', '現金価格', '현금 가격', 'Contante prijs', 'Preço em dinheiro', 'ราคาเงินสด', 'Nakit fiyatı', 'نقد قیمت', '现金价格', 'Kontantprys', 'Barpreis', 'Τιμή μετρητών', 'Precio en efectivo', 'नगद मूल्य', 'Цена наличными', 'Kontantpris', 'Կանխիկի գինը', 'ფულადი ფასი', 'रोख किंमत', 'Harga Tunai', 'ਨਕਦ ਕੀਮਤ', 'பண விலை', 'నగదు ధర', 'Kontantpris', 'Presyo ng Cash'),
(409, 'award_reason', 'Award Reason', 'পুরস্কার কারণ', 'جائزة السبب', 'Raison de récompense', 'पुरस्कार कारण', 'Alasan penghargaan', 'Ragione del premio', '授与理由', '수상 이유', 'Prijs reden', 'Motivo de adjudicação', 'เหตุผลรางวัล', 'Ödül sebebi', 'ایوارڈ کی وجہ', '奖励理由', 'Toekenningsrede', 'Auszeichnungsgrund', 'Λόγος ανάθεσης', 'Razón del premio', 'पुरस्कार कारण', 'Награда Причина', 'Prisgrund', 'Մրցանակի պատճառը', 'ჯილდოს მიზეზი', 'पुरस्कार कारण', 'Sebab Anugerah', 'ਪੁਰਸਕਾਰ ਦਾ ਕਾਰਨ', 'விருது காரணம்', 'అవార్డు కారణం', 'Motivering anledning', 'Dahilan ng Award'),
(410, 'given_date', 'Given Date', 'প্রদত্ত তারিখ', 'تاريخ معين', 'Date donnée', 'दी गई तिथि', 'Tanggal tertentu', 'Data data', '与えられた日付', '주어진 날짜', 'Gegeven datum', 'Data dada', 'วันที่ระบุ', 'Verilen tarih', 'دی گئی تاریخ', '给定日期', 'Gegewe datum', 'Gegebenes Datum', 'Δεδομένη ημερομηνία', 'Fecha dada', 'दिईएको मिति', 'Данная дата', 'Givet dato', 'Տրված ամսաթիվը', 'მოცემული თარიღი', 'दिलेली तारीख', 'Tarikh Diberi', 'ਦਿੱਤੀ ਗਈ ਤਾਰੀਖ', 'கொடுக்கப்பட்ட தேதி', 'ఇచ్చిన తేదీ', 'Givet datum', 'Naibigay na Petsa'),
(411, 'apply_leave', 'Apply Leave', 'ছুটি প্রয়োগ করুন', 'تطبيق الإجازة', 'Postuler', 'छुट्टी लागू करें', 'Berlaku cuti', 'Applicare il permesso', '休暇を取る', '휴가를 남기다', 'Verlof verlenen', 'Aplicar licença', 'ลาออก', 'Izin başvurusu yapmak', 'چھوڑ دو', '申请休假', 'Wend verlof aan', 'Bewerben Sie sich', 'Εφαρμόστε άδεια', 'Aplicar licencia', 'छुट्टी लागू गर्नुहोस्', 'Применить Оставить', 'Anvend orlov', 'Դիմեք արձակուրդը', 'მიმართვა დატოვე', 'रजा लागू करा', 'Memohon Cuti', 'ਛੁੱਟੀ ਲਾਗੂ ਕਰੋ', 'விடுப்பு விண்ணப்பிக்கவும்', 'సెలవు వర్తించు', 'Applicera Permission', 'Ilapat ang Iwanan'),
(412, 'leave_application', 'Leave Application', 'ছুটি আবেদন', 'اترك التطبيق', 'laisser l\'application', 'छुट्टी की अर्जी', 'Meninggalkan aplikasi', 'Meninggalkan aplikasi', '申請を残す', '신청을 떠나다', 'Aanvraag verlaten', 'Deixar o aplicativo', 'ออกจากโปรแกรม', 'uygulamayı terket', 'چھٹی کی درخواست', '离开应用程序', 'Laat aansoek', 'Verlassen Anwendung', 'Αφήστε την αίτηση', 'Deje la aplicación', 'अनुप्रयोग छोड्नुहोस्', 'Оставить заявку', 'Forlad ansøgning', 'Թողեք դիմումը', 'Დატოვე აპლიკაცია', 'अर्ज सोडा', 'Permohonan cuti', 'ਐਪਲੀਕੇਸ਼ਨ ਛੱਡੋ', 'விடுமுறை விண்ணப்பம்', 'దరఖాస్తును వదిలివేయండి', 'Lämna ansökan', 'Mag-iwan ng Application'),
(413, 'allowances', 'Allowances', 'তৃপ্তি', 'البدلات', 'Allocations', 'भत्ते', 'Tunjangan', 'indennità', '手当', '참작', 'toelagen', 'Subsídios', 'ค่าเบี้ยเลี้ยง', 'ödenekleri', 'الاؤنس', '津贴', 'toelaes', 'Zulagen', 'Αποζημιώσεις', 'Subsidios', 'भत्ता', 'довольствие', 'Kvoter', 'Նպաստներ', 'დახმარებები', 'भत्ते', 'Elaun', 'ਭੱਤੇ', 'கொடுப்பனவுகள்', 'అనుమతులు', 'ersättningar', 'Mga allowance'),
(414, 'add_more', 'Add More', 'আরো যোগ করো', 'أضف المزيد', 'ajouter plus', 'अधिक जोड़ें', 'Tambahkan lagi', 'aggiungere altro', 'さらに追加', '더 추가', 'Voeg meer toe', 'Adicione mais', 'เพิ่มมากขึ้น', 'daha ekle', 'مزید شامل کریں', '添加更多', 'Voeg nog by', 'Mehr hinzufügen', 'Πρόσθεσε περισσότερα', 'Añadir más', 'अझै थप', 'Добавить больше', 'Tilføj mere', 'Ավելացնել ավելին', 'Მეტის დამატება', 'अधिक जोडा', 'Tambah Lagi', 'ਹੋਰ ਸ਼ਾਮਲ ਕਰੋ', 'மேலும் சேர்க்கவும்', 'మరిన్ని జోడించండి', 'Lägga till mer', 'Magdagdag pa'),
(415, 'deductions', 'Deductions', 'কর্তন', 'الخصومات', 'Déductions', 'कटौती', 'Deduksi', 'deduzioni', '控除', '공제', 'inhoudingen', 'Deduções', 'การหักเงิน', 'kesintiler', 'کٹوتی', '扣除', 'aftrekkings', 'Abzüge', 'Κρατήσεις', 'Deducciones', 'कटौती', 'вычеты', 'Fradrag', 'Նվազեցումներ', 'გამოქვითვები', 'वजा', 'Potongan', 'ਕਟੌਤੀ', 'கழிவுகள்', 'తగ్గింపులకు', 'avdrag', 'Mga pagbabawas'),
(416, 'salary_details', 'Salary Details', 'বেতন বিবরণ', 'تفاصيل الراتب', 'Détails de salaire', 'वेतन विवरण', 'Rincian gaji', 'I dettagli delle retribuzioni', '給料の詳細', '급여 세부 정보', 'Salaris details', 'Detalhes salariais', 'รายละเอียดเงินเดือน', 'Maaş ayrıntıları', 'تنخواہ کی تفصیلات', '工资细节', 'Salarisbesonderhede', 'Gehaltsangaben', 'Λεπτομέρειες μισθού', 'Detalles salariales', 'तलब विवरण', 'Детали зарплаты', 'Løndetaljer', 'Աշխատավարձի մանրամասները', 'ხელფასის დეტალები', 'पगाराचा तपशील', 'Butiran Gaji', 'ਤਨਖਾਹ ਦਾ ਵੇਰਵਾ', 'சம்பள விவரங்கள்', 'జీతం వివరాలు', 'Lönedetaljer', 'Mga Detalye ng Salary'),
(417, 'salary_month', 'Salary Month', 'বেতন মাস', 'راتب شهر', 'Mois de salaire', 'वेतन महीने', 'Bulan gaji', 'Mese di salario', '給料月', '월급', 'Salaris maand', 'Mês de salário', 'เดือนเงินเดือน', 'Maaş ayı', 'تنخواہ مہینہ', '工资月', 'Salarismaand', 'Gehaltsmonat', 'Μισθός Μήνας', 'Mes de salario', 'तलब महिना', 'Зарплата Месяц', 'Lønmåned', 'Աշխատավարձի ամիս', 'ხელფასის თვე', 'पगाराचा महिना', 'Bulan Gaji', 'ਤਨਖਾਹ ਦਾ ਮਹੀਨਾ', 'சம்பள மாதம்', 'జీతం నెల', 'Lön månad', 'Buwan ng Salary'),
(418, 'leave_data_update_successfully', 'Leave Data Updated Successfully', 'ছুটি ডেটা সফলভাবে আপডেট করা হয়েছে', 'ترك البيانات تحديثها بنجاح', 'Laisser les données mises à jour avec succès', 'छोड़ें डेटा सफलतापूर्वक अपडेट किया गया', 'Biarkan data berhasil diperbarui', 'Lasciare i dati aggiornati correttamente', 'データを正常に更新したままにする', '데이터가 성공적으로 업데이트 된 상태로 유지', 'Laat de gegevens succesvol doorgeven', 'Deixe os dados atualizados com sucesso', 'ปล่อยให้ข้อมูลอัปเดตเรียบร้อยแล้ว', 'Verileri başarıyla güncelledi bırak', 'اعداد و شمار کو کامیابی سے اپ ڈیٹ کر دیں', '离开数据更新成功', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(419, 'fees_history', 'Fees History', 'ফি ইতিহাস', 'تاريخ الرسوم', 'Historique des frais', 'शुल्क इतिहास', 'Sejarah biaya', 'La storia dei costi', '手数料履歴', '수수료 내역', 'Vergoedingen geschiedenis', 'Histórico de taxas', 'ค่าธรรมเนียมประวัติ', 'Ücret geçmişi', 'فیس کی تاریخ', '收费历史', 'Gelde Geskiedenis', 'Gebühren Geschichte', 'Ιστορικό χρεώσεων', 'Honorarios Historia', 'शुल्क ईतिहास', 'История сборов', 'Gebyrer historie', 'Վճարների պատմություն', 'საფასურის ისტორია', 'फी इतिहास', 'Sejarah Yuran', 'ਫੀਸ ਦਾ ਇਤਿਹਾਸ', 'கட்டணம் வரலாறு', 'ఫీజు చరిత్ర', 'Avgifter Historik', 'Kasaysayan ng Bayad'),
(420, 'bank_name', 'Bank Name', 'ব্যাংকের নাম', 'اسم البنك', 'Nom de banque', 'बैंक का नाम', 'nama Bank', 'nome della banca', '銀行名', '은행 이름', 'banknaam', 'nome do banco', 'ชื่อธนาคาร', 'banka adı', 'بینک کا نام', '银行名', 'Bank Naam', 'Bank Name', 'Ονομα τράπεζας', 'Nombre del banco', 'बैंक नाम', 'Название банка', 'Bank-navn', 'Բանկի անվանումը', 'Ბანკის სახელი', 'बँकेचे नाव', 'Nama bank', 'ਬੈਂਕ ਦਾ ਨਾਮ', 'வங்கி பெயர்', 'బ్యాంక్ పేరు', 'Bank namn', 'Pangalan ng bangko'),
(421, 'branch', 'Branch', 'শাখা', 'فرع شجرة', 'branche', 'डाली', 'cabang', 'ramo', 'ブランチ', '분기', 'tak', 'ramo', 'สาขา', 'şube', 'شاخ', '科', 'tak', 'Ast', 'Κλαδί', 'Rama', 'साखा', 'Филиал', 'Afdeling', 'Մասնաճյուղ', 'ფილიალი', 'शाखा', 'Cawangan', 'ਸ਼ਾਖਾ', 'கிளை', 'బ్రాంచ్', 'Gren', 'Sangay'),
(422, 'bank_address', 'Bank Address', 'ব্যাংকের ঠিকানা', 'عنوان البنك', 'adresse de la banque', 'बैंक का पता', 'Alamat bank', 'indirizzo bancario', '銀行の住所', '계좌 번호', 'bank adres', 'endereço do banco', 'ที่อยู่ธนาคาร', 'banka adresi', 'بینک کا پتہ', '银行地址', 'Bankadres', 'Bankadresse', 'Διεύθυνση τράπεζας', 'Dirección del banco', 'बैंक ठेगाना', 'Адрес банка', 'Bank adresse', 'Բանկի հասցե', 'Ბანკის მისამართი', 'बँकेचा पत्ता', 'Alamat bank', 'ਬੈਂਕ ਦਾ ਪਤਾ', 'வங்கி முகவரி', 'బ్యాంకు చిరునామా', 'Bankadress', 'Address ng Bangko'),
(423, 'ifsc_code', 'IFSC Code', 'আইএফসিসি কোড', 'رمز إفسك', 'IFSC code', 'आईएफएससी कोड', 'Kode IFSC', 'Codice IFSC', 'IFSCコード', 'IFSC 코드', 'IFSC-code', 'Código IFSC', 'รหัส IFSC', 'IFSC kodu', 'IFSC کوڈ', 'IFSC代码', 'Bankadres', 'Bankadresse', 'Διεύθυνση τράπεζας', 'Dirección del banco', 'बैंक ठेगाना', 'Адрес банка', 'Bank adresse', 'Բանկի հասցե', 'Ბანკის მისამართი', 'बँकेचा पत्ता', 'Alamat bank', 'ਬੈਂਕ ਦਾ ਪਤਾ', 'வங்கி முகவரி', 'బ్యాంకు చిరునామా', 'Bankadress', 'Address ng Bangko'),
(424, 'account_no', 'Account No', 'হিসাব নাম্বার', 'رقم الحساب', 'n ° de compte', 'खाता क्रमांक', 'No rekening', 'Conto n', 'アカウントなし', '계정 없음', 'account nummer', 'Conta não', 'หมายเลขบัญชี', 'Hesap numarası', 'اکاؤنٹ کا نمبر', '户口号码', 'Rekening nommer', 'Konto Nr', 'Αριθμός λογαριασμού', 'Cuenta no', 'खाता नम्बर', 'Номер счета', 'Kontonr', 'Հաշիվը ոչ', 'ანგარიში არა', 'खाते क्रमांक', 'Nombor akaun', 'ਖਾਤਾ ਨੰ', 'கணக்கு எண்', 'ఖాతా సంఖ్య', 'Konto Nej', 'Account Hindi'),
(425, 'add_bank', 'Add Bank', 'ব্যাংক জুড়ুন', 'إضافة بنك', 'Ajouter une banque', 'बैंक जोड़ें', 'Tambahkan bank', ' Aggiungi la banca', '銀行を追加する', '은행 추가', 'Bank toevoegen', 'Adicionar banco', 'เพิ่มธนาคาร', 'Banka ekle', 'بینک شامل کریں', '加银行', 'Voeg bank by', 'Bank hinzufügen', 'Προσθήκη τράπεζας', 'Agregar banco', 'बैंक थप्नुहोस्', 'Добавить банк', 'Tilføj bank', 'Ավելացնել բանկ', 'ბანკის დამატება', 'बँक जोडा', 'Tambah Bank', 'ਬੈਂਕ ਸ਼ਾਮਲ ਕਰੋ', 'வங்கியைச் சேர்க்கவும்', 'బ్యాంకును జోడించండి', 'Lägg till bank', 'Magdagdag ng Bank'),
(426, 'account_name', 'Account Holder', 'হিসাবের নাম', 'أسم الحساب', 'nom du compte', 'खाते का नाम', 'nama akun', 'nome utente', 'アカウント名', '계좌 이름', 'accountnaam', 'nome da conta', 'ชื่อบัญชี', 'hesap adı', 'کھاتے کا نام', '用户名', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(427, 'database_backup_completed', 'Database Backup Completed', 'ডাটাবেস ব্যাকআপ সম্পন্ন', 'اكتمل قاعدة بيانات النسخ الاحتياطي', 'Sauvegarde de base de données terminée', 'डेटाबेस बैकअप पूर्ण', 'Backup database selesai', 'Backup del database completato', 'データベースのバックアップが完了しました', '데이터베이스 백업 완료', 'Database backup voltooid', 'Backup do banco de dados concluído', 'การสำรองฐานข้อมูลเสร็จสมบูรณ์', 'Veritabanı yedeklemesi tamamlandı', 'ڈیٹا بیک اپ مکمل', '数据库备份完成', 'Databasis-rugsteun is voltooi', 'Datenbanksicherung abgeschlossen', 'Ολοκληρώθηκε η δημιουργία αντιγράφων ασφαλείας βάσης δεδομένων', 'Copia de seguridad de la base de datos completada', 'डाटाबेस बैकअप पूरा भयो', 'Резервное копирование базы данных завершено', 'Database backup er afsluttet', 'Տվյալների բազայի կրկնօրինակումն ավարտված է', 'მონაცემთა ბაზის სარეზერვო პროგრამა დასრულებულია', 'डेटाबेस बॅकअप पूर्ण', 'Sandaran Pangkalan Data Selesai', 'ਡਾਟਾਬੇਸ ਬੈਕਅਪ ਪੂਰਾ ਹੋਇਆ', 'தரவுத்தள காப்புப்பிரதி முடிந்தது', 'డేటాబేస్ బ్యాకప్ పూర్తయింది', 'Säkerhetskopiering av databas slutförd', 'Nakumpleto ang Pag-backup ng Database'),
(428, 'restore_database', 'Restore Database', 'ডাটাবেস পুনঃস্থাপন', 'استعادة قاعدة البيانات', 'Restaurer la base de données', 'डेटाबेस पुनर्स्थापित करें', 'restore database', 'Ripristinare il database', 'データベースの復元', '데이터베이스 복원', 'Database herstellen', 'Restaurar o banco de dados', 'เรียกคืนฐานข้อมูล', 'Veritabanı geri yükle', 'ڈیٹا بیس بحال کریں', '恢复数据库', 'Herstel databasis', 'Datenbank wiederherstellen', 'Επαναφορά βάσης δεδομένων', 'Restaurar base de datos', 'डाटाबेस पुनर्स्थापित गर्नुहोस्', 'Восстановить базу данных', 'Gendan databasen', 'Վերականգնել տվյալների բազան', 'მონაცემთა ბაზის აღდგენა', 'डेटाबेस पुनर्संचयित करा', 'Pulihkan Pangkalan Data', 'ਡਾਟਾਬੇਸ ਮੁੜ - ਪ੍ਰਾਪਤ ਕਰੋ', 'தரவுத்தளத்தை மீட்டமை', 'డేటాబేస్ను పునరుద్ధరించండి', 'Återställ databasen', 'Ibalik ang Database'),
(429, 'template', 'Template', 'টেমপ্লেট', 'قالب', 'modèle', 'टेम्पलेट', 'template', 'modello', 'テンプレート', '주형', 'sjabloon', 'modelo', 'แบบ', 'şablon', 'سانچے', '模板', 'sjabloon', 'Vorlage', 'Πρότυπο', 'Modelo', 'टेम्पलेट', 'шаблон', 'Skabelon', 'Ձևանմուշ', 'შაბლონი', 'टेम्पलेट', 'Templat', 'ਫਰਮਾ', 'வார்ப்புரு', 'మూస', 'Mall', 'Template'),
(430, 'time_and_date', 'Time And Date', 'সময় এবং তারিখ', 'الوقت و التاريخ', 'heure et date', 'समय और तारीख', 'waktu dan tanggal', 'ora e data', '日時', '시간과 날짜', 'tijd en datum', 'hora e data', 'เวลาและวันที่', 'zaman ve tarih', 'وقت اور تاریخ', '时间和日期', 'Tyd en Datum', 'Zeit und Datum', 'Ωρα και ημερομηνία', 'Hora y fecha', 'समय र मिति', 'Время и дата', 'Tid og dato', 'Ժամանակը և ամսաթիվը', 'დრო და თარიღი', 'वेळ आणि तारीख', 'Masa dan tarikh', 'ਸਮਾਂ ਅਤੇ ਤਾਰੀਖ', 'நேரம் மற்றும் தேதி', 'సమయం మరియు తేదీ', 'Tid och datum', 'Oras at Petsa'),
(431, 'everyone', 'Everyone', 'সবাই', 'كل واحد', 'toutes les personnes', 'हर कोई', 'semua orang', 'tutti', 'みんな', '각자 모두', 'iedereen', 'todos', 'ทุกคน', 'herkes', 'سب', '大家', 'almal', 'Jeder', 'Ολοι', 'Todos', 'सबैजना', 'Все', 'Alle sammen', 'Բոլորը', 'ყველას', 'प्रत्येकजण', 'Semua orang', 'ਹਰ ਕੋਈ', 'எல்லோரும்', 'ప్రతి ఒక్కరూ', 'Alla', 'Lahat'),
(432, 'invalid_amount', 'Invalid Amount', 'অকার্যকর পরিমাণ', 'مبلغ غير صحيح', 'montant invalide', 'अवैध राशि', 'jumlah tidak valid', 'importo non valido', '無効額', '무효 금액', 'ongeldige hoeveelheid', 'Montante inválido', 'จำนวนที่ไม่ถูกต้อง', 'geçersiz miktar', 'غلط رقم', '无效数量', 'Ongeldige bedrag', 'Ungültige Menge', 'Μη έγκυρο ποσό', 'Monto invalido', 'अवैध रकम', 'Недопустимая сумма', 'Ugyldigt beløb', 'Անվավեր գումար', 'არასწორი თანხა', 'अवैध रक्कम', 'Jumlah Tidak Sah', 'ਗਲਤ ਰਕਮ', 'தவறான தொகை', 'చెల్లని మొత్తం', 'Ogiltigt belopp', 'Di-wastong Halaga'),
(433, 'leaving_date_is_not_available_for_you', 'Leaving Date Is Not Available For You', 'তারিখ রেখে আপনার জন্য উপলব্ধ নয়', 'ترك التاريخ غير متاح لك', 'la date de sortie n\'est pas disponible pour vous', 'छोड़ने की तिथि आपके लिए उपलब्ध नहीं है', 'tanggal berangkat tidak tersedia untuk Anda', 'la data di partenza non è disponibile per te', 'あなたの日付を残すことはできません', '출발일을 사용할 수 없습니다.', 'vertrekdatum is niet voor u beschikbaar', 'A data de saída não está disponível para você', 'วันที่ออกเดินทางไม่สามารถใช้ได้สำหรับคุณ', 'bırakma tarihi sizin için mevcut değil', 'چھوڑنے کی تاریخ آپ کے لئے دستیاب نہیں ہے', '离开日期不适合您', 'Die vertrekdatum is nie vir u beskikbaar nie', 'Das Abreisedatum ist für Sie nicht verfügbar', 'Η ημερομηνία αποχώρησης δεν είναι διαθέσιμη για εσάς', 'La fecha de salida no está disponible para usted', 'छोड्ने मिति तपाईको लागि उपलब्ध छैन', 'Дата отъезда недоступна для вас', 'Fortrædelsesdato er ikke tilgængelig for dig', 'Ամսաթիվ թողնելը ձեզ համար մատչելի չէ', 'თარიღის დატოვება თქვენთვის მიუწვდომელია', 'सोडण्याची तारीख आपल्यासाठी उपलब्ध नाही', 'Tarikh Meninggalkan Tidak Ada Untuk Anda', 'ਤਾਰੀਖ ਛੱਡਣਾ ਤੁਹਾਡੇ ਲਈ ਉਪਲਬਧ ਨਹੀਂ ਹੈ', 'தேதியை விட்டு வெளியேறுவது உங்களுக்கு கிடைக்கவில்லை', 'తేదీ వదిలివేయడం మీ కోసం అందుబాటులో లేదు', 'Återlämningsdatum är inte tillgängligt för dig', 'Ang Mag-iwan ng Petsa ay Hindi Magagamit Para sa Iyo'),
(434, 'animations', 'Animations', 'অ্যানিমেশন', 'الرسوم المتحركة', 'animations', 'एनिमेशन', 'animasi', 'animazioni', 'アニメーション', '애니메이션', 'animaties', 'animações', 'ภาพเคลื่อนไหว', 'animasyonlar', 'متحرک تصاویر', '动画', 'animasies', 'Animationen', 'Κινούμενα σχέδια', 'Animaciones', 'एनिमेसनहरू', 'Анимации', 'Animationer', 'Շարժապատկերներ', 'ანიმაციები', 'अ‍ॅनिमेशन', 'Animasi', 'ਐਨੀਮੇਸ਼ਨ', 'அனிமேஷன்கள்', 'యానిమేషన్లు', 'animationer', 'Mga Animasyon'),
(435, 'email_settings', 'Email Settings', 'ইমেল সেটিংস', 'إعدادات البريد الإلكتروني', 'Paramètres de messagerie', 'ईमेल सेटिंग्स', 'pengaturan email', 'impostazioni di posta elettronica', 'メール設定', '이메일 설정', 'Email instellingen', 'configurações de e-mail', 'การตั้งค่าอีเมล', 'e-posta ayarları', 'ای میل کی ترتیبات', '电子邮件设置', 'E-posinstellings', 'Email Einstellungen', 'Ρυθμίσεις email', 'Ajustes del correo electrónico', 'ईमेल सेटिंग्स', 'Настройки электронной почты', 'E-mail-indstillinger', 'Էլ. Փոստի կարգավորումներ', 'ელ.ფოსტის პარამეტრები', 'ईमेल सेटिंग्ज', 'Tetapan E-mel', 'ਈਮੇਲ ਸੈਟਿੰਗਜ਼', 'மின்னஞ்சல் அமைப்புகள்', 'ఇమెయిల్ సెట్టింగులు', 'E-postinställningar', 'Mga Setting ng Email'),
(436, 'deduct_month', 'Deduct Month', 'কেটে মাস', 'خصم الشهر', 'déduire le mois', 'कटौती महीने', 'deduksi bulan', 'detrarre il mese', '控除月', '달을 공제하다', 'aftrek maand', 'deduz o mês', 'หักเดือน', 'ay düşülmek', 'کٹوتی مہینے', '扣除月', 'Trek maand af', 'Monat abziehen', 'Μήνας έκπτωσης', 'Deducir mes', 'कटौती महिना', 'Вычитать месяц', 'Fradragsmåned', 'Նվազեցման ամիս', 'გამოქვითვის თვე', 'वजा महिना', 'Potongan Bulan', 'ਕਟੌਤੀ ਮਹੀਨਾ', 'கழித்தல் மாதம்', 'నెలను తగ్గించండి', 'Avdragsmånad', 'Buwan ng Bawas'),
(437, 'no_employee_available', 'No Employee Available', 'কোন কর্মচারী প্রাপ্তিসাধ্য', 'لا يتوفر موظف', 'Aucun employé disponible', 'कोई कर्मचारी उपलब्ध नहीं है', 'Tidak ada karyawan yang tersedia', 'Nessun dipendente disponibile', '従業員はいません', '직원이 없습니다', 'Geen medewerker beschikbaar', 'Nenhum funcionário disponível', 'ไม่มีพนักงาน', 'Çalışan yok', 'کوئی ملازم دستیاب نہیں ہے', '没有员工可用', 'Geen werknemer beskikbaar nie', 'Kein Mitarbeiter verfügbar', 'Δεν υπάρχει διαθέσιμος υπάλληλος', 'Ningún empleado disponible', 'कुनै कर्मचारी उपलब्ध छैन', 'Сотрудник недоступен', 'Ingen medarbejdere til rådighed', 'Ոչ մի աշխատող չկա', 'თანამშრომელი არ არის ხელმისაწვდომი', 'कोणताही कर्मचारी उपलब्ध नाही', 'Tidak Ada Pekerja', 'ਕੋਈ ਕਰਮਚਾਰੀ ਉਪਲਬਧ ਨਹੀਂ ਹੈ', 'பணியாளர் இல்லை', 'ఉద్యోగి అందుబాటులో లేరు', 'Ingen anställd tillgänglig', 'Walang magagamit na empleyado'),
(438, 'advance_salary_application_submitted', 'Advance Salary Application Submitted', 'অগ্রিম বেতন আবেদন জমা', 'تم تقديم طلب الراتب المتقدم', 'Demande de salaire anticipé soumise', 'अग्रिम वेतन अर्ज सबमिट किया गया', 'Aplikasi Gaji Muka Submitted', 'Applicazione anticipata salariale presentata', 'アドバンス給与申請書が提出されました', '사전 연봉 신청서가 제출되었습니다.', 'Voorschot Salarisaanvraag ingediend', 'Solicitação de Salário Avançado Enviado', 'ส่งใบสมัครล่วงหน้า', 'Maaş Başvurusu Gönderildi', 'پیشگی تنخواہ کی درخواست پیش کی گئی', '提前申请工资申请', 'Aansoek om vooraf salaris ingedien', 'Vorab-Gehaltsantrag eingereicht', 'Υποβλήθηκε αίτηση προκαταβολής μισθού', 'Solicitud de salario anticipado presentada', 'अग्रिम तलब आवेदन सबमिट गरियो', 'Подана предварительная заявка на зарплату', 'Ansøgning om forskudsløn indsendt', 'Ներկայացվեց նախնական աշխատավարձի դիմում', 'წინასწარი სახელფასო განაცხადი წარმოდგენილია', 'अ‍ॅडव्हान्स पगार अर्ज सबमिट केला', 'Permohonan Gaji Pendahuluan Dihantar', 'ਪੇਸ਼ਗੀ ਤਨਖਾਹ ਅਰਜ਼ੀ ਜਮ੍ਹਾ', 'அட்வான்ஸ் சம்பள விண்ணப்பம் சமர்ப்பிக்கப்பட்டது', 'అడ్వాన్స్ జీతం దరఖాస్తు సమర్పించబడింది', 'Ansökan om förskottslön skickas in', 'Pagsumite ng Salary Application isinumite'),
(439, 'date_format', 'Date Format', 'তারিখ বিন্যাস', 'صيغة التاريخ', 'date format', 'डेटा प्रारूप', 'format tanggal', 'formato data', '日付形式', '날짜 형식', 'datumnotatie', 'Formato de data', 'รูปแบบวันที่', 'tarih formatı', 'تاریخ کی شکل', '日期格式', 'Datum formaat', 'Date Format', 'Μορφή ημερομηνίας', 'Formato de fecha', 'मिति ढाँचा', 'Формат даты', 'Datoformat', 'Ամսաթվի ձևաչափը', 'Თარიღის ფორმატი', 'दिनांक प्रारुप', 'Format tarikh', 'ਤਾਰੀਖ ਦਾ ਫਾਰਮੈਟ', 'தேதி வடிவமைப்பு', 'తేదీ ఫార్మాట్', 'Datumformat', 'Format ng Petsa'),
(440, 'id_card_generate', 'ID Card Generate', 'আইডি কার্ড তৈরি করুন', 'بطاقة الهوية تولد', 'Carte d\'identité générer', 'आईडी कार्ड उत्पन्न', 'KTP menghasilkan', 'La carta d\'identità genera', 'IDカード生成', 'ID 카드 생성', 'ID-kaart genereert', 'O cartão de identificação gera', 'สร้างบัตรประจำตัว', 'Kimlik kartı üret', 'شناختی کارڈ پیدا', '身份证生成', 'ID-kaart genereer', 'ID-Karte generieren', 'Δημιουργία ταυτότητας', 'Generar tarjeta de identificación', 'आईडी कार्ड उत्पन्न', 'Генерация идентификационной карты', 'ID-kortgenerering', 'ID քարտի առաջացում', 'პირადობის მოწმობის შექმნა', 'आयडी कार्ड व्युत्पन्न', 'Jana Kad Pengenalan', 'ਆਈਡੀ ਕਾਰਡ ਬਣਾਉਣਾ', 'அடையாள அட்டை உருவாக்கு', 'ID కార్డ్ సృష్టించండి', 'ID-kort generera', 'Bumuo ng ID Card'),
(441, 'issue_salary', 'Issue Salary', 'বেতন ইস্যু', 'إصدار الراتب', 'question salariale', 'मुद्दा वेतन', 'mengeluarkan gaji', 'emettere stipendio', '発行報酬', '이슈 급여', 'loon uitgeven', 'emitir salário', 'ออกเงินเดือน', 'maaş çıkarmak', 'مسئلہ تنخواہ', '发放工资', 'Uitreik salaris', 'Gehalt ausgeben', 'Θέμα Μισθός', 'Emitir salario', 'तलब जारी गर्नुहोस्', 'Выпуск Зарплата', 'Udstedelsesløn', 'Թողարկել աշխատավարձ', 'გაიცემა ხელფასი', 'पगार देणे', 'Mengeluarkan Gaji', 'ਤਨਖਾਹ ਜਾਰੀ ਕਰੋ', 'சம்பளம் வழங்குதல்', 'ఇష్యూ జీతం', 'Utgivningslön', 'Isyu ang Salary'),
(442, 'advance_salary', 'Advance Salary', 'বেতন অগ্রিম', 'راتب مقدما', 'avance sur salaire', 'पूर्व वेतन', 'uang muka gaji', 'salario anticipo', '前給', '연봉', 'vooruitbetaling', 'Salário adiantado', 'เงินเดือนล่วงหน้า', 'avans maaşı', 'پیشگی تنخواہ', '提前工资', 'Voorskot salaris', 'Vorschuss', 'Προκαταβολή μισθού', 'Salario por adelantado', 'अग्रिम वेतन', 'Аванс Зарплата', 'Forskudsløn', 'Նախկին աշխատավարձ', 'წინასწარი ხელფასი', 'अ‍ॅडव्हान्स पगार', 'Gaji Pendahuluan', 'ਪੇਸ਼ਗੀ ਤਨਖਾਹ', 'அட்வான்ஸ் சம்பளம்', 'ముందస్తు జీతం', 'Förskottlön', 'Advance Salary'),
(443, 'logo', 'Logo', 'লোগো', 'شعار', 'logo', 'प्रतीक चिन्ह', 'logo', 'logo', 'ロゴ', '심벌 마크', 'logo', 'logo', 'เครื่องหมาย', 'logo', 'علامت (لوگو)', '商标', 'logo', 'Logo', 'Logo', 'Logo', 'लोगो', 'логотип', 'Logo', 'Լոգոն', 'ლოგო', 'लोगो', 'Logo', 'ਲੋਗੋ', 'லோகோ', 'లోగో', 'Logotyp', 'Logo'),
(444, 'book_request', 'Book Request', 'বই অনুরোধ', 'طلب الكتاب', 'demande de livre', 'पुस्तक अनुरोध', 'permintaan buku', 'richiesta di libro', '本のリクエスト', '도서 요청', 'boekverzoek', 'pedido de livro', 'book คำขอ', 'kitap isteği', 'کتاب کی درخواست', '书籍要求', 'Boekversoek', 'Buchanfrage', 'Αίτηση βιβλίου', 'Solicitud de libro', 'पुस्तक अनुरोध', 'Запрос книги', 'Boganmodning', 'Գրքի հարցում', 'წიგნის მოთხოვნა', 'पुस्तक विनंती', 'Permintaan Buku', 'ਕਿਤਾਬ ਬੇਨਤੀ', 'புத்தக கோரிக்கை', 'పుస్తక అభ్యర్థన', 'Bokförfrågan', 'Kahilingan sa Aklat'),
(445, 'reporting', 'Reporting', 'প্রতিবেদন', 'التقارير', 'rapport', 'रिपोर्टिंग', 'pelaporan', 'segnalazione', '報告', '보고', 'rapportage', 'relatórios', 'การรายงาน', 'raporlama', 'رپورٹنگ', '报告', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(446, 'paid_salary', 'Paid Salary', 'বেতন দেওয়া', 'الراتب المدفوع', 'salaire payé', 'भुगतान वेतन', 'gaji dibayar', 'stipendio retribuito', '給料', '급여', 'betaald salaris', 'salário pago', 'จ่ายเงินเดือน', 'ücretli maaş', 'تنخواہ تنخواہ', '有薪工资', 'Betaalde salaris', 'Bezahltes Gehalt', 'Πληρωμένος μισθός', 'Salario pagado', 'भुक्तान गरिएको तलब', 'Оплачиваемая зарплата', 'Betalt løn', 'Վճարված աշխատավարձ', 'გადახდილი ხელფასი', 'सशुल्क वेतन', 'Gaji Berbayar', 'ਅਦਾ ਕੀਤੀ ਤਨਖਾਹ', 'கட்டண சம்பளம்', 'చెల్లించిన జీతం', 'Betald lön', 'Bayad na Salary'),
(447, 'due_salary', 'Due Salary', 'বাকি বেতন', 'الراتب', 'salaire dû', 'उचित वेतन', 'karena gaji', 'salario dovuto', '支払った給料', '만기 임금', 'verschuldigd salaris', 'salário devedor', 'เงินเดือนที่ครบกำหนด', 'maaş', 'تنخواہ', '应付工资', 'Verskuldigde salaris', 'Fälliges Gehalt', 'Οφειλόμενος μισθός', 'Salario adeudado', 'बाँकी तलब', 'Должная зарплата', 'Grundløn', 'Ժամկետային աշխատավարձ', 'ხელფასის გამო', 'देय पगार', 'Gaji Bercukai', 'ਤਨਖਾਹ', 'உரிய சம்பளம்', 'చెల్లించాల్సిన జీతం', 'Skyldig lön', 'Dahil sa Salary'),
(448, 'route', 'Route', 'রুট', 'طريق', 'Route', 'मार्ग', 'Rute', 'Itinerario', 'ルート', '노선', 'Route', 'Rota', 'เส้นทาง', 'rota', 'راستہ', '路线', 'roete', 'Route', 'Διαδρομή', 'Ruta', 'मार्ग', 'маршрут', 'Rute', 'Երթուղին', 'მარშრუტი', 'मार्ग', 'Laluan', 'ਰਸਤਾ', 'பாதை', 'రూట్', 'Rutt', 'Ruta'),
(449, 'academic_details', 'Academic Details', 'একাডেমিক বিবরণ', 'التفاصيل الأكاديمية', 'détails académiques', 'अकादमिक विवरण', 'rincian akademis', 'dettagli accademici', '学問の詳細', '학업 내용', 'academische details', 'detalhes acadêmicos', 'รายละเอียดทางวิชาการ', 'akademik ayrıntılar', 'تعلیمی تفصیلات', '学术细节', 'Akademiese besonderhede', 'Akademische Details', 'Ακαδημαϊκές λεπτομέρειες', 'Detalles académicos', 'शैक्षिक विवरण', 'Академические детали', 'Akademiske detaljer', 'Ակադեմիական մանրամասներ', 'აკადემიური დეტალები', 'शैक्षणिक तपशील', 'Perincian Akademik', 'ਅਕਾਦਮਿਕ ਵੇਰਵੇ', 'கல்வி விவரங்கள்', 'విద్యా వివరాలు', 'Akademiska detaljer', 'Mga Detalye ng Akademikong'),
(450, 'guardian_details', 'Guardian Details', 'অভিভাবক বিস্তারিত', 'التفاصيل الأكاديمية', 'détails académiques', 'अकादमिक विवरण', 'rincian akademis', 'dettagli accademici', '学問の詳細', '학업 내용', 'academische details', 'detalhes acadêmicos', 'รายละเอียดทางวิชาการ', 'akademik ayrıntılar', 'تعلیمی تفصیلات', '学术细节', 'Beskermbesonderhede', 'Wächter Details', 'Λεπτομέρειες φύλακα', 'Detalles del guardián', 'अभिभावक विवरणहरू', 'Хранитель Подробности', 'Guardian detaljer', 'Խնամակալության մանրամասները', 'მეურვის დეტალები', 'पालक तपशील', 'Perincian Penjaga', 'ਸਰਪ੍ਰਸਤ ਦਾ ਵੇਰਵਾ', 'கார்டியன் விவரங்கள்', 'గార్డియన్ వివరాలు', 'Guardian Detaljer', 'Mga Detalye ng Tagapangalaga'),
(451, 'due_amount', 'Due Amount', 'বাকি টাকা', 'مبلغ مستحق', 'montant dû', 'देय राशि', 'karena jumlah', 'importo dovuto', '金額', '만기 금액', 'debita moles', 'debita moles', 'надлежащей суммы', 'ödenecek meblağ', 'باقی رقم', '到期金额', 'Verskuldigde bedrag', 'Fälliger Betrag', 'Οφειλόμενο ποσό', 'Cantidad debida', 'बाँकी रकम', 'Надлежащей суммы', 'Forfaldent beløb', 'Գումարը', 'თანხის ოდენობა', 'देय रक्कम', 'Jumlah Hutang', 'ਬਕਾਇਆ ਰਕਮ', 'நிலுவை தொகை', 'చెల్లించాల్సిన మొత్తం', 'Skyldigt belopp', 'Dahil sa Halaga'),
(452, 'fee_due_report', 'Fee Due Report', 'ফি প্রতিবেদনের রিপোর্ট', 'تقرير الرسوم المستحقة', 'rapport dû', 'शुल्क के कारण रिपोर्ट', 'laporan biaya', 'fee due report', '手数料報告書', '수수료 납부 보고서', 'vergoeding verschuldigd', 'relatório pago', 'รายงานการเสียค่าธรรมเนียม', 'due due due report', 'فیس کی اطلاع کی رپورٹ', '应收费用报告', 'Fooi verskuldig verslag', 'Gebührenpflichtiger Bericht', 'Αναφορά οφειλόμενης προμήθειας', 'Informe de tarifa adeudada', 'शुल्क बाँकी रिपोर्ट', 'Отчет об оплате', 'Gebyrrapport', 'Վճարների մասին հաշվետվություն', 'საფასურის გადახდის ანგარიში', 'फी देय अहवाल', 'Laporan Hutang Yuran', 'ਫੀਸ ਦੀ ਬਕਾਇਆ ਰਿਪੋਰਟ', 'கட்டணம் செலுத்த வேண்டிய அறிக்கை', 'ఫీజు డ్యూ రిపోర్ట్', 'Avgiftsrapport', 'Ulat sa Bayad na Bayad'),
(453, 'other_details', 'Other Details', 'অন্যান্য বিস্তারিত', 'تفاصيل أخرى', 'Autres détails', 'अन्य जानकारी', 'Rincian lainnya', 'altri dettagli', 'その他の情報', '기타 세부 정보', 'andere details', 'Outros detalhes', 'รายละเอียดอื่น ๆ', 'diğer detaylar', 'دیگر تفصیلات', '其他详情', 'Ander besonderhede', 'Andere Details', 'Αλλες πληροφορίες', 'Otros detalles', 'अन्य विवरणहरू', 'Другие детали', 'Andre detaljer', 'Այլ մանրամասներ', 'Სხვა დეტალები', 'इतर तपशील', 'Butiran yang lain', 'ਹੋਰ ਵੇਰਵਾ', 'வேறு தகவல்கள்', 'ఇతర వివరాలు', 'Andra detaljer', 'Ibang detalye'),
(454, 'last_exam_report', 'Last Exam Report', 'শেষ পরীক্ষার রিপোর্ট', 'تقرير الاختبار الأخير', 'Dernier rapport d&#39;examen', 'अंतिम परीक्षा रिपोर्ट', 'Laporan Ujian Terakhir', 'Rapporto sull\'ultimo esame', '前回の試験レポート', '마지막 시험 보고서', 'Laatste examenrapport', 'Relatório do último exame', 'รายงานการสอบครั้งสุดท้าย', 'Son Sınav Raporu', 'آخری امتحان کی رپورٹ', '上次考试报告', 'Laaste eksamenverslag', 'Letzter Prüfungsbericht', 'Έκθεση τελευταίας εξέτασης', 'Informe del último examen', 'अन्तिम परीक्षा रिपोर्ट', 'Отчет о последнем экзамене', 'Sidste eksamensrapport', 'Վերջին քննության զեկույցը', 'ბოლო გამოცდის დასკვნა', 'शेवटचा परीक्षा अहवाल', 'Laporan Peperiksaan Terakhir', 'ਆਖਰੀ ਪਰੀਖਿਆ ਰਿਪੋਰਟ', 'கடைசி தேர்வு அறிக்கை', 'చివరి పరీక్ష నివేదిక', 'Förra examineringsrapporten', 'Huling Exam Report'),
(455, 'book_issued', 'Book Issued', 'বই ইস্যু করা', ' كتاب صدر', 'Livre publié', 'पुस्तक जारी की', 'Buku Diterbitkan', 'Libro emesso', '発行された本', '도서 발행', 'Uitgegeven boek', 'Livro emitido', 'หนังสือออก', 'Yayınlanan Kitap', 'کتاب جاری', '出版书籍', 'Boek uitgegee', 'Buch herausgegeben', 'Έκδοση βιβλίου', 'Libro emitido', 'पुस्तक जारी गरियो', 'Книга выпущена', 'Bog udstedt', 'Հրապարակված է', 'გამოიცა წიგნი', 'पुस्तक जारी केले', 'Buku Dikeluarkan', 'ਕਿਤਾਬ ਜਾਰੀ ਕੀਤੀ ਗਈ', 'புத்தகம் வெளியிடப்பட்டது', 'పుస్తకం జారీ చేయబడింది', 'Bok utfärdad', 'Inilabas ang Aklat'),
(456, 'interval_month', 'Interval 30 Days', 'অন্তর 30 দিন', 'الفاصل الزمني 30 يومًا', 'Intervalle 30 jours', 'अंतराल 30 दिन', 'Interval 30 Hari', 'Intervallo 30 giorni', '間隔30日', '간격 30 일', 'Interval 30 dagen', 'Intervalo 30 dias', 'ช่วงเวลา 30 วัน', 'Aralık 30 Gün', 'انٹرویو 30 دن', '间隔30天', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(457, 'attachments', 'Attachments', 'সংযুক্তিসমূহ', 'مرفقات', 'Les pièces jointes', 'संलग्नक', 'Lampiran', 'allegati', '添付ファイル', '첨부 파일', 'Bijlagen', 'Anexos', 'สิ่งที่แนบมา', 'Ekler', 'منسلکات', '附件', 'aanhegsels', 'Anhänge', 'Συνημμένα', 'Archivos adjuntos', 'संलग्नकहरू', 'Вложения', 'Vedhæftede filer', 'Կցորդներ', 'დანართები', 'जोड', 'Lampiran', 'ਨੱਥੀ', 'இணைப்புகள்', 'అటాచ్మెంట్లు', 'bilagor', 'Mga Attachment'),
(458, 'fees_payment', 'Fees Payment', 'ফি প্রদান', 'دفع الرسوم', 'Paiement des frais', 'शुल्क भुगतान', 'Pembayaran Biaya', 'Pagamento', 'お支払い', '수수료 지불', 'Vergoedingen Betaling', 'Pagamento de taxas', 'การชำระค่าธรรมเนียม', 'Ücret Ödeme', 'فیس ادائیگی', '费用付款', 'Fooi betaling', 'Gebühren Zahlung', 'Πληρωμή τελών', 'Pago de honorarios', 'शुल्क भुक्तानी', 'Оплата сборов', 'Gebyrer for betaling', 'Վճարներ', 'გადასახადი', 'फी भरणे', 'Bayaran Yuran', 'ਫੀਸ ਦਾ ਭੁਗਤਾਨ', 'கட்டணம் செலுத்துதல்', 'ఫీజు చెల్లింపు', 'Avgift betalning', 'Bayad sa Bayad'),
(459, 'fees_summary', 'Fees Summary', 'ফি সংক্ষিপ্ত বিবরণ', 'ملخص الرسوم', 'Résumé des frais', 'फीस सारांश', 'Ringkasan Biaya', 'Riepilogo tasse', '料金のまとめ', '요금 요약', 'Kostenoverzicht', 'Resumo de taxas', 'สรุปค่าธรรมเนียม', 'Ücret Özeti', 'فیس خلاصہ', '费用摘要', 'Fooie opsomming', 'Gebührenübersicht', 'Περίληψη χρεώσεων', 'Resumen de tarifas', 'शुल्क सारांश', 'Сводка сборов', 'Gebyrsammendrag', 'Վճարների ամփոփում', 'მოსაკრებლების შეჯამება', 'फी सारांश', 'Ringkasan Yuran', 'ਫੀਸ ਦਾ ਸਾਰ', 'கட்டணம் சுருக்கம்', 'ఫీజు సారాంశం', 'Avgiftsöversikt', 'Buod ng Mga Pagbabayad'),
(460, 'total_fees', 'Total Fees', 'মোট ফি', 'الرسوم الكلية', 'Total des frais', 'कुल फीस', 'Total Biaya', 'Commissioni totali', '合計料金', '총 비용', 'Totale kosten', 'Taxas totais', 'ค่าธรรมเนียมทั้งหมด', 'Toplam ücretler', 'کل فیس', '总费用', 'Totale fooie', 'Gesamtkosten', 'Συνολικά τέλη', 'Tarifas totales', 'कुल शुल्क', 'Всего сборов', 'Samlede gebyrer', 'Ընդհանուր վճարներ', 'მთლიანი საფასური', 'एकूण फी', 'Jumlah Yuran', 'ਕੁੱਲ ਫੀਸ', 'மொத்த கட்டணம்', 'మొత్తం ఫీజు', 'Totala avgifter', 'Kabuuang Mga Bayad'),
(461, 'weekend_attendance_inspection', 'Weekend Attendance Inspection', 'সপ্তাহান্তে উপস্থিতি পরিদর্শন', 'فحص الحضور في عطلة نهاية الاسبوع', 'Weekend Attendance Inspection', 'सप्ताहांत उपस्थिति निरीक्षण', 'Inspeksi Kehadiran Akhir Pekan', 'Ispezione presenze weekend', '週末出席検査', '주말 출석 검사', 'Weekend-aanwezigheidsinspectie', 'Inspeção de Presença no Fim de Semana', 'การตรวจสอบการเข้าร่วมวันหยุดสุดสัปดาห์', 'Hafta Sonu Katılım Denetimi', 'اختتام ہفتہ حاضری معائنہ', '周末出勤检查', 'Naweekbywoning inspeksie', 'Inspektion der Wochenendteilnahme', 'Επιθεώρηση παρακολούθησης Σαββατοκύριακου', 'Inspección de asistencia de fin de semana', 'सप्ताहन्त उपस्थिति निरीक्षण', 'Инспекция посещаемости выходного дня', 'Weekendfremmødsinspektion', 'Հանգստյան օրերի հաճախման ստուգում', 'შაბათ-კვირის დასწრების ინსპექცია', 'शनिवार व रविवार उपस्थिती तपासणी', 'Pemeriksaan Kehadiran Hujung Minggu', 'ਵੀਕੈਂਡ ਹਾਜ਼ਰੀ ਨਿਰੀਖਣ', 'வார இறுதி வருகை ஆய்வு', 'వీకెండ్ హాజరు తనిఖీ', 'Helgskyddskontroll', 'Pag-inspeksyon sa Pagdalo sa Linggo'),
(462, 'book_issued_list', 'Book Issued List', 'বুক ইস্যু তালিকা', 'كتاب صدر قائمة', 'Liste des livres publiés', 'पुस्तक की सूची जारी की', 'Daftar Buku Terbitan', 'Elenco pubblicato', '書籍発行リスト', '도서 목록', 'Uitgevoerde lijst van boeken', 'Lista de livros emitidos', 'รายการหนังสือที่ออก', 'Kitap Çıkarılmış Listesi', 'کتاب جاری کی فہرست', '图书发行清单', 'Boek uitgereikte lys', 'Buchausgabeliste', 'Λίστα εκδόσεων βιβλίου', 'Lista de libros emitidos', 'पुस्तक जारी गरिएको सूची', 'Список изданных книг', 'Bog udstedt liste', 'Գրքի թողարկված ցուցակ', 'წიგნის გამოცემა', 'पुस्तक जारी केलेली यादी', 'Senarai Buku yang Dikeluarkan', 'ਬੁੱਕ ਜਾਰੀ ਕੀਤੀ ਸੂਚੀ', 'புத்தகம் வெளியிடப்பட்ட பட்டியல்', 'పుస్తక జారీ జాబితా', 'Bok utfärdad lista', 'Listahan ng Inilabas ng Aklat'),
(463, 'lose_your_password', 'Lose Your Password?', 'আপনার পাসওয়ার্ড হারান?', '?تفقد كلمة المرور الخاصة بك', 'Perdre votre mot de passe?', 'अपना पासवर्ड खो दें?', 'Kalah Kata Sandi Anda?', 'Perdere la tua password?', 'パスワードを忘れました?', '패스워드 분실?', 'Verlies uw wachtwoord?', 'Perca sua senha?', 'สูญเสียรหัสผ่านของคุณ?', 'Şifrenizi kaybedin?', '?اپنا پاس ورڈ کھو', '丢失密码?', 'Verloor u wagwoord?', 'Passwort verlieren?', 'Χάσατε τον κωδικό πρόσβασής σας;', '¿Perdió su contraseña?', 'तपाईको पासवर्ड हराउनु भयो?', 'Потерять пароль?', 'Mister din adgangskode?', 'Կորցնե՞լ եք ձեր գաղտնաբառը:', 'დაგავიწყდათ პაროლი?', 'आपला संकेतशब्द हरवला?', 'Kehilangan Kata Laluan Anda?', 'ਆਪਣਾ ਪਾਸਵਰਡ ਗੁਆ ਦਿਓ?', 'உங்கள் கடவுச்சொல்லை இழக்கிறீர்களா?', 'మీ పాస్‌వర్డ్‌ను కోల్పోతున్నారా?', 'Förlora ditt lösenord?', 'Nawala ang Iyong Password?'),
(464, 'all_branch_dashboard', 'All Branch Dashboard', 'সমস্ত শাখা ড্যাশবোর্ড', 'كل لوحة فرع', 'Tableau de bord de toutes les branches', 'सभी शाखा डैशबोर्ड', 'Semua Dashboard Cabang', 'All Branch Dashboard', '全支店ダッシュボード', '모든 지점 대시 보드', 'Alles Branch Dashboard', 'All Branch Dashboard', 'แดชบอร์ดสาขาทั้งหมด', 'Tüm Şube Panosu', 'تمام برانچ ڈیش بورڈ', '所有分支仪表板', 'Alle takpaneel', 'Alle Zweig Dashboard', 'Πίνακας ελέγχου όλων των κλάδων', 'Tablero de todas las sucursales', 'सबै शाखा ड्यासबोर्ड', 'Панель инструментов всех филиалов', 'All Branch Dashboard', 'Մասնաճյուղի ամբողջ սեղան', 'ყველა ფილიალი დაფა', 'सर्व शाखा डॅशबोर्ड', 'Semua Papan Pemuka Cawangan', 'ਸਾਰੇ ਸ਼ਾਖਾ ਡੈਸ਼ਬੋਰਡ', 'அனைத்து கிளை டாஷ்போர்டு', 'అన్ని బ్రాంచ్ డాష్‌బోర్డ్', 'All Branch Dashboard', 'Lahat ng Branch Dashboard'),
(465, 'academic_session', 'Academic Session', 'একাডেমিক সেশন', 'الدورة الأكاديمية', 'Session académique', 'शैक्षणिक सत्र', 'Sesi Akademik', 'Sessione accademica', '学術セッション', '학술 세션', 'Academische sessie', 'Sessão Acadêmica', 'วาระการศึกษา', 'Akademik Oturum', 'تعلیمی اجلاس', '学术会议', 'Akademiese Sessie', 'Akademische Sitzung', 'Ακαδημαϊκή συνεδρία', 'Sesión Académica', 'शैक्षिक सत्र', 'Академическая сессия', 'Akademisk session', 'Գիտական ​​նստաշրջան', 'აკადემიური სესია', 'शैक्षणिक सत्र', 'Sesi Akademik', 'ਅਕਾਦਮਿਕ ਸੈਸ਼ਨ', 'கல்வி அமர்வு', 'అకడమిక్ సెషన్', 'Akademisk session', 'Session sa Akademikong'),
(466, 'all_branches', 'All Branches', 'সমস্ত শাখা', 'كل الفروع', 'Heures supplémentaires', 'सभी शाखाओं', 'Semua Cabang', 'Tutte le filiali', 'すべての枝', '모든 지점', 'Alle takken', 'Todas as filiais', 'ทุกสาขา', 'Tüm Şubeler', 'تمام شاخیں', '所有分支机构', 'Alle takke', 'Alle Zweige', 'Όλα τα καταστήματα', 'Todas las ramas', 'सबै शाखा', 'Все филиалы', 'Alle grene', 'Բոլոր մասնաճյուղերը', 'ყველა ფილიალი', 'सर्व शाखा', 'Semua Cawangan', 'ਸਾਰੀਆਂ ਸ਼ਾਖਾਵਾਂ', 'அனைத்து கிளைகளும்', 'అన్ని శాఖలు', 'Alla grenar', 'Lahat ng Mga Sangay'),
(467, 'admission', 'Admission', 'ভর্তি', 'قبول', 'admission', 'दाखिला', 'penerimaan', 'ammissione', '入場', '입장', ' toelating', 'admissão', 'การรับเข้า', 'kabul', 'داخلہ', '入场', 'Toegang', 'Eintritt', 'Αδεια', 'Admisión', 'प्रवेश', 'вход', 'Adgang', 'Ընդունելություն', 'დაშვება', 'प्रवेश', 'Kemasukan', 'ਦਾਖਲਾ', 'சேர்க்கை', 'ప్రవేశ o', 'Antagning', 'Pagpasok'),
(468, 'create_admission', 'Create Admission', 'ভর্তি তৈরি করুন', 'إنشاء القبول', 'Créer une entrée', 'प्रवेश बनाएँ', 'Buat Penerimaan', 'Crea l\'ammissione', '入場許可を作成する', '입장 제작', 'Maak toegang', 'Criar admissão', 'สร้างการรับสมัคร', 'Giriş Oluştur', 'داخلہ بنائیں', '创建入学', 'Skep Toelating', 'Zulassung erstellen', 'Δημιουργία εισδοχής', 'Crear admisión', 'प्रवेश सिर्जना गर्नुहोस्', 'Создать прием', 'Opret optagelse', 'Ստեղծեք ընդունելություն', 'დაშვების შექმნა', 'प्रवेश तयार करा', 'Buat Kemasukan', 'ਦਾਖਲਾ ਬਣਾਓ', 'சேர்க்கை உருவாக்கவும்', 'ప్రవేశాన్ని సృష్టించండి', 'Skapa antagning', 'Lumikha ng Admission'),
(469, 'multiple_import', 'Multiple Import', 'একাধিক আমদানি', 'استيراد متعدد', 'Importation multiple', 'एकाधिक आयात', 'Impor Berganda', 'Importazione multipla', '複数インポート', '복수 가져 오기', 'Meerdere import', 'Múltiplo Import', 'นำเข้าหลายรายการ', 'Birden çok içe aktarma', 'ایک سے زیادہ درآمد', '多次导入', 'Meervoudige invoer', 'Mehrfachimport', 'Πολλαπλή εισαγωγή', 'Importación múltiple', 'बहु आयात', 'Многократный импорт', 'Flere importer', 'Բազմակի ներմուծում', 'მრავალჯერადი იმპორტი', 'एकाधिक आयात', 'Pelbagai Import', 'ਬਹੁ ਆਯਾਤ', 'பல இறக்குமதி', 'బహుళ దిగుమతి', 'Flera import', 'Maramihang Pag-import'),
(470, 'student_details', 'Student Details', 'ছাত্র বিস্তারিত', 'تفاصيل الطالب', 'Détails de l\'étudiant', 'छात्र का विवरण', 'Detail Siswa', 'Dettagli dello studente', '学生の詳細', '학생 세부 사항', 'Studentendetails', 'Detalhes do aluno', 'รายละเอียดนักศึกษา', 'Öğrenci Detayları', 'طالب علم کی تفصیلات', '学生详情', 'Student besonderhede', 'Studentendetails', 'Λεπτομέρειες μαθητή', 'Detalles del estudiante', 'विद्यार्थी विवरणहरू', 'Подробности студента', 'Studerendes detaljer', 'Ուսանողի մանրամասները', 'სტუდენტის დეტალები', 'विद्यार्थ्यांचा तपशील', 'Maklumat Pelajar', 'ਵਿਦਿਆਰਥੀ ਵੇਰਵਾ', 'மாணவர் விவரங்கள்', 'విద్యార్థుల వివరాలు', 'Studentinformation', 'Mga Detalye ng Mag-aaral'),
(471, 'student_list', 'Student List', 'ছাত্র তালিকা', 'قائمة الطلاب', 'Liste des étudiants', 'छात्र सूची', 'Daftar Siswa', 'Elenco degli studenti', '学生リスト', '학생 목록', 'Studentenlijst', 'Lista de estudantes', 'รายชื่อนักศึกษา', 'Öğrenci Listesi', 'طالب علم کی فہرست', '学生名单', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(472, 'login_deactivate', 'Login Deactivate', 'লগইন নিষ্ক্রিয় করুন', 'تسجيل الدخول', 'Login Désactiver', 'लॉगिन निष्क्रिय करें', 'Login Nonaktifkan', 'Login Disattiva', 'ログイン無効化', '로그인 비활성화', 'Inloggen Deactiveren', 'Login Desativar', 'เข้าสู่ระบบปิดการใช้งาน', 'Giriş Devre Dışı Bırak', 'لاگ ان غیر فعال', '登录停用', 'Aanmelding deaktiveer', 'Login Deaktivieren', 'Απενεργοποίηση σύνδεσης', 'Iniciar sesión Desactivar', 'लगइन निष्क्रिय गर्नुहोस्', 'Войти Деактивировать', 'Login Deaktiver', 'Մուտք գործեք', 'გამორთეთ', 'लॉगिन निष्क्रिय करा', 'Log Masuk Nyahaktifkan', 'ਲਾਗਇਨ ਅਯੋਗ', 'உள்நுழைவு செயலிழக்க', 'లాగిన్ నిష్క్రియం చేయండి', 'Logga in Deaktivera', 'Mag-login Deactivate'),
(473, 'parents_list', 'Parents List', 'পিতামাতার তালিকা', 'قائمة الوالدين', 'Liste de parents', 'माता-पिता की सूची', 'Daftar Orang Tua', 'Lista dei genitori', '親リスト', '학부모 목록', 'Ouderslijst', 'Lista de pais', 'รายการผู้ปกครอง', 'Ebeveyn Listesi', 'والدین کی فہرست', '父母名单', 'Ouerslys', 'Elternliste', 'Λίστα γονέων', 'Lista de padres', 'अभिभावकहरूको सूची', 'Список родителей', 'Forældre liste', 'Ծնողների ցուցակ', 'მშობელთა სია', 'पालकांची यादी', 'Senarai Ibu Bapa', 'ਮਾਪਿਆਂ ਦੀ ਸੂਚੀ', 'பெற்றோர் பட்டியல்', 'తల్లిదండ్రుల జాబితా', 'Föräldrar lista', 'Listahan ng Mga Magulang'),
(474, 'add_parent', 'Add Parent', 'মূল যোগ করুন', 'أضف الوالد', 'Ajouter un parent', 'जनक जोड़ें', 'Tambahkan Induk', 'Aggiungi genitore', '親を追加', '부모 추가', 'Voeg ouder toe', 'Adicionar pai', 'เพิ่มผู้ปกครอง', 'Üst ekle', 'والدین شامل کریں', '添加父级', 'Voeg ouer by', 'Eltern hinzufügen', 'Προσθήκη γονέα', 'Agregar padre', 'अभिभावक थप्नुहोस्', 'Добавить родителя', 'Tilføj overordnet', 'Ավելացնել ծնող', 'დაამატე მშობელი', 'पालक जोडा', 'Tambah Ibu Bapa', 'ਪੇਰੈਂਟ ਸ਼ਾਮਲ ਕਰੋ', 'பெற்றோரைச் சேர்க்கவும்', 'తల్లిదండ్రులను జోడించండి', 'Lägg till förälder', 'Magdagdag ng Magulang'),
(475, 'employee_list', 'Employee List', 'কর্মচারী তালিকা', 'قائمة موظف', 'Liste des employés', 'कर्मचारी सूची', 'Daftar Karyawan', 'Elenco dei dipendenti', '従業員リスト', '직원 목록', 'Werknemerslijst', 'Lista de empregados', 'รายชื่อพนักงาน', 'İşçi listesi', 'ملازم کی فہرست', '员工名单', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(476, 'add_department', 'Add Department', 'বিভাগ যোগ করুন', 'أضف قسم', 'Ajouter un département', 'विभाग जोड़ें', 'Tambahkan Departemen', 'Aggiungi dipartimento', '部署を追加', '부서 추가', 'Afdeling toevoegen', 'Adicionar Departamento', 'เพิ่มแผนก', 'Bölüm ekle', 'محکمہ شامل کریں', '添加部门', 'Voeg departement by', 'Abteilung hinzufügen', 'Προσθήκη τμήματος', 'Agregar departamento', 'विभाग थप्नुहोस्', 'Добавить отдел', 'Tilføj afdeling', 'Ավելացնել բաժին', 'დეპარტამენტის დამატება', 'विभाग जोडा', 'Tambah Jabatan', 'ਵਿਭਾਗ ਸ਼ਾਮਲ ਕਰੋ', 'திணைக்களத்தைச் சேர்க்கவும்', 'విభాగాన్ని జోడించండి', 'Lägg till avdelning', 'Magdagdag ng Kagawaran'),
(477, 'add_employee', 'Add Employee', 'কর্মচারী যোগ করুন', 'إضافة موظف', 'Ajouter un employé', 'कर्मचारी जोड़ें', 'Tambahkan Karyawan', 'Aggiungi dipendente', '従業員を追加', '직원 추가', 'Voeg werknemer toe', 'Adicionar funcionário', 'เพิ่มพนักงาน', 'Çalışan ekle', 'ملازم شامل کریں', '添加员工', 'Voeg werknemer by', 'Mitarbeiter hinzufügen', 'Προσθήκη υπαλλήλου', 'Agregar empleado', 'कर्मचारी थप्नुहोस्', 'Добавить сотрудника', 'Tilføj medarbejder', 'Ավելացնել աշխատողին', 'დაამატეთ თანამშრომელი', 'कर्मचारी जोडा', 'Tambah Pekerja', 'ਕਰਮਚਾਰੀ ਸ਼ਾਮਲ ਕਰੋ', 'பணியாளரைச் சேர்க்கவும்', 'ఉద్యోగిని జోడించండి', 'Lägg till anställd', 'Magdagdag ng Empleyado'),
(478, 'salary_template', 'Salary Template', 'বেতন টেমপ্লেট', 'قالب الراتب', 'Modèle de salaire', 'वेतन का खाका', 'Templat Gaji', 'Modello di stipendio', '給与テンプレート', '급여 템플릿', 'Salaris sjabloon', 'Modelo de salário', 'เทมเพลตเงินเดือน', 'Maaş Şablonu', 'تنخواہ سانچہ', '薪资模板', 'Salarismal', 'Gehaltsvorlage', 'Πρότυπο μισθού', 'Plantilla de salario', 'तलब टेम्पलेट', 'Шаблон зарплаты', 'Lønnsskabelon', 'Աշխատավարձի ձևանմուշ', 'სახელფასო შაბლონი', 'पगार टेम्पलेट', 'Templat Gaji', 'ਤਨਖਾਹ ਦਾ ਫਰਮਾ', 'சம்பள வார்ப்புரு', 'జీతం మూస', 'Lön mall', 'Template ng suweldo'),
(479, 'salary_payment', 'Salary Payment', 'বেতন পেমেন্ট', 'دفع المرتبات', 'Paiement du salaire', 'तनख्वाह का भुगतान', 'Pembayaran Gaji', 'Salario', '給与支払い', '급여 지불', 'Salaris betalingo', 'Pagamento de Salário', 'การจ่ายเงินเดือน', 'Maaş ödemesi', 'تنخواہ ادائیگی', '工资支付', 'Salarisbetaling', 'Lohnauszahlung', 'Πληρωμή μισθού', 'Pago de salario', 'तलब भुक्तान', 'Выплата зарплаты', 'Løn betaling', 'Աշխատավարձի վճարում', 'ხელფასის გადახდა', 'वेतन देय', 'Bayaran Gaji', 'ਤਨਖਾਹ ਅਦਾਇਗੀ', 'சம்பள கட்டணம்', 'జీతం చెల్లింపు', 'Lön betalning', 'Bayad na Bayad'),
(480, 'payroll_summary', 'Payroll Summary', 'বেতন সারসংক্ষেপ', 'ملخص الرواتب', 'Résumé de la paie', 'पेरोल सारांश', 'Ringkasan Penggajian', 'Riepilogo del libro paga', '給与サマリー', '급여 요약', 'Payroll-samenvatting', 'Resumo da folha de pagamento', 'สรุปเงินเดือน', 'Bordro Özeti', 'ادائیگی کا خلاصہ', '工资总结', 'Salarisopsomming', 'Zusammenfassung der Gehaltsabrechnung', 'Περίληψη μισθοδοσίας', 'Resumen de nómina', 'पेरोल सारांश', 'Сводка заработной платы', 'Lønoversigt', 'Աշխատավարձի ամփոփագիր', 'სახელფასო რეზიუმე', 'पेरोल सारांश', 'Ringkasan Gaji', 'ਤਨਖਾਹ ਦਾ ਸਾਰ', 'ஊதிய சுருக்கம்', 'పేరోల్ సారాంశం', 'Lönsammanfattning', 'Buod ng Payroll'),
(481, 'academic', 'Academic', 'বিদ্যালয় সংক্রান্ত', 'أكاديمي', 'Académique', 'अकादमिक', 'Akademik', 'Accademico', '学術', '학생', 'Academic', 'Acadêmico', 'วิชาการ', 'Akademik', 'تعلیمی', '学术的', 'akademiese', 'Akademisch', 'Ακαδημαϊκός', 'Académico', 'शैक्षिक', 'академический', 'Akademisk', 'Գիտական', 'აკადემიური', 'शैक्षणिक', 'Akademik', 'ਅਕਾਦਮਿਕ', 'கல்வி', 'అకడమిక్', 'Akademisk', 'Akademikong'),
(482, 'control_classes', 'Control Classes', 'নিয়ন্ত্রণ ক্লাস', 'فئات التحكم', 'Control Classes', 'नियंत्रण कक्षाएं', 'Kelas Kontrol', 'Classi di controllo', '制御クラス', '컨트롤 클래스', 'Controleklassen', 'Classes de Controle', 'คลาสควบคุม', 'Kontrol Sınıfları', 'کنٹرول کلاس', '控制类', 'Beheer klasse', 'Kontrollklassen', 'Μαθήματα ελέγχου', 'Clases de control', 'कक्षा नियन्त्रण गर्नुहोस्', 'Контрольные классы', 'Kontrolklasser', 'Կառավարման դասեր', 'საკონტროლო კლასები', 'नियंत्रण कक्षा', 'Kelas Kawalan', 'ਕੰਟਰੋਲ ਕਲਾਸਾਂ', 'கட்டுப்பாட்டு வகுப்புகள்', 'నియంత్రణ తరగతులు', 'Kontrollklasser', 'Mga Klase sa Kontrol'),
(483, 'assign_class_teacher', 'Assign Class Teacher', 'ক্লাস শিক্ষক নিয়োগ\n\n', 'تعيين معلم الصف', 'Attribuer un enseignant de classe', 'कक्षा शिक्षक का कार्यभार सौंपें', 'Tugaskan Guru Kelas', 'Assegna un insegnante di classe', 'クラスの先生を割り当てる', '클래스 교사 지정', 'Ken klasleraar toe', 'Atribuir professor de turma', 'มอบหมายครูประจำชั้น', 'Sınıf Öğretmeni Ata', 'کلاس ٹیچر کو تفویض کریں', '分配班主任', 'Ken klasonderwyser toe', 'Klassenlehrer zuweisen', 'Ανάθεση καθηγητή τάξης', 'Asignar maestro de clase', 'कक्षा शिक्षक नियुक्त गर्नुहोस्', 'Назначить учителя класса', 'Tildel klasselærer', 'Հանձնարարեք դասի ուսուցչին', 'დაავალეთ კლასის მასწავლებელი', 'वर्ग शिक्षक नियुक्त करा', 'Tugaskan Guru Kelas', 'ਕਲਾਸ ਅਧਿਆਪਕ ਨਿਰਧਾਰਤ ਕਰੋ', 'வகுப்பு ஆசிரியரை நியமிக்கவும்', 'క్లాస్ టీచర్‌ను కేటాయించండి', 'Tilldela klasslärare', 'Magtalaga ng Guro sa Klase'),
(484, 'class_assign', 'Class Assign', 'ক্লাস বরাদ্দ', 'تعيين فئة', 'Affectation de classe', 'वर्ग निरुपित', 'Penugasan Kelas', 'Assegnazione di classe', 'クラス割り当て', '클래스 지정', 'Klasse toewijzen', 'Atribuição de classe', 'กำหนดระดับ', 'Sınıf Ataması', 'کلاس کا تعین', '班级分配', 'Klasopdrag', 'Klassenzuweisung', 'Εκχώρηση τάξης', 'Asignación de clase', 'कक्षा तोक्नुहोस्', 'Назначить класс', 'Klassetildeling', 'Դասի հանձնարարություն', 'კლასის დავალება', 'वर्ग असाइन', 'Tugasan Kelas', 'ਕਲਾਸ ਨਿਰਧਾਰਤ', 'வகுப்பு ஒதுக்கு', 'క్లాస్ అసైన్', 'Klasstilldelning', 'Takdang-aralin sa Klase'),
(485, 'assign', 'Assign', 'দায়িত্ব অর্পণ করা', 'تعيين', 'Attribuer', 'सौंपना', 'Menetapkan', 'Assegnare', '割り当てます', '양수인', 'Toewijzen', 'Atribuir', 'กำหนด', 'Atamak', 'تفویض', '分配', 'Toewys', 'Zuordnen', 'Αναθέτω', 'Asignar', 'तोक्नुहोस्', 'Присвоить', 'Tildel', 'Նշանակել', 'მიანიჭე', 'नियुक्त करा', 'Tugaskan', 'ਨਿਰਧਾਰਤ ਕਰੋ', 'ஒதுக்க', 'కేటాయించవచ్చు', 'Tilldela', 'Magtalaga'),
(486, 'promotion', 'Promotion', 'পদোন্নতি', 'ترقية وظيفية', 'Promotion', 'पदोन्नति', 'Promosi', 'Promozione', '昇進', '승진', 'Bevordering', 'Promoção', 'การส่งเสริม', ' tanıtım', 'فروغ', '提升', 'bevordering', 'Beförderung', 'Προβολή', 'Promoción', 'पदोन्नति', 'Продвижение', 'Forfremmelse', 'Առաջխաղացում', 'დაწინაურება', 'जाहिरात', 'Promosi', 'ਪ੍ਰਚਾਰ', 'பதவி உயர்வு', 'ప్రమోషన్', 'Befordran', 'Promosyon'),
(487, 'attachments_book', 'Attachments Book', 'সংযুক্তি বই', 'كتاب المرفقات', 'Livre des pièces jointes', 'अटैचमेंट बुक', 'Buku Lampiran', 'Libro degli allegati', '添付ファイル', '첨부 파일 도서', 'Bijlagen Boek', 'Livro de Anexos', 'หนังสือแนบ', 'Ekler Kitabı', 'منسلک کتاب', '附件书', 'Aanhangselboek', 'Anhang Buch', 'Βιβλίο Συνημμένων', 'Libro de adjuntos', 'संलग्नक पुस्तक', 'Книга вложений', 'Vedhæftede bog', 'Հավելվածների գիրք', 'Attachments Book', 'संलग्नक पुस्तक', 'Buku Lampiran', 'ਅਟੈਚਮੈਂਟ ਬੁੱਕ', 'இணைப்புகள் புத்தகம்', 'జోడింపుల పుస్తకం', 'Bilagor Bok', 'Book of Attachments'),
(488, 'upload_content', 'Upload Content', 'আপলোড কন্টেন্ট', 'تحميل المحتوى', 'Télécharger le contenu', 'सामग्री अपलोड करें', 'Unggah Konten', 'Carica contenuto', 'コンテンツをアップロードする', '콘텐츠 업로드', 'Upload inhoud', 'Upload de conteúdo', 'อัพโหลดเนื้อหา', 'İçerik Yükle', 'مواد اپ لوڈ کریں', '上传内容', 'Laai inhoud op', 'Inhalt hochladen', 'Μεταφόρτωση περιεχομένου', 'Subir contenido', 'सामग्री अपलोड गर्नुहोस्', 'Загрузить контент', 'Upload indhold', 'Վերբեռնեք բովանդակությունը', 'შინაარსის ატვირთვა', 'सामग्री अपलोड करा', 'Muat Naik Kandungan', 'ਸਮੱਗਰੀ ਅਪਲੋਡ ਕਰੋ', 'உள்ளடக்கத்தைப் பதிவேற்றுக', 'కంటెంట్‌ను అప్‌లోడ్ చేయండి', 'Ladda upp innehåll', 'Mag-upload ng Nilalaman'),
(489, 'attachment_type', 'Attachment Type', 'সংযুক্তি প্রকার', 'نوع المرفق', 'Type de pièce jointe', 'आसक्ति का प्रकार', 'Jenis Lampiran', 'Tipo di allegato', 'アタッチメントタイプ', 'アタッチメントタイプ', 'Aanhangertype', 'Tipo de Anexo', 'ประเภทเอกสารแนบ', 'Ek tipi', 'منسلک کی قسم', '附件类型', 'Aanhegsel tipe', 'Art des Anhangs', 'Τύπος συνημμένου', 'Tipo de adjunto', 'अनुलग्नक प्रकार', 'Тип вложения', 'Vedhæftetype', 'Կցորդի տեսակը', 'დანართის ტიპი', 'संलग्नक प्रकार', 'Jenis Lampiran', 'ਅਟੈਚਮੈਂਟ ਦੀ ਕਿਸਮ', 'இணைப்பு வகை', 'అటాచ్మెంట్ రకం', 'Tillbehörstyp', 'Uri ng Lakip'),
(490, 'exam_master', 'Exam Master', 'পরীক্ষা মাস্টার', 'الامتحان ماجستير', 'Maître d\'examen', 'परीक्षा मास्टर', 'Master ujian', 'Maestro dell\'esame', '試験マスター', '시험 마스터', 'Examenmeester', 'Mestre do Exame', 'ปริญญาโทการสอบ', 'Sınav Masterı', 'امتحان ماسٹر', '考试大师', 'Eksamenmeester', 'Prüfungsmeister', 'Δάσκαλος εξετάσεων', 'Examen maestro', 'परीक्षा मास्टर', 'Экзамен Мастер', 'Eksamen Master', 'Քննության վարպետ', 'გამოცდის ოსტატი', 'परीक्षा मास्टर', 'Tuan Peperiksaan', 'ਪ੍ਰੀਖਿਆ ਮਾਸਟਰ', 'தேர்வு மாஸ்டர்', 'పరీక్షా మాస్టర్', 'Examen Master', 'Exam Master'),
(491, 'exam_hall', 'Exam Hall', 'পরীক্ষা হল', 'قاعة الامتحان', 'Salle d\'examen', 'परीक्षा हॉल', 'Aula ujian', 'Exam Hall', '試験会場', '시험 홀', 'Examenzaal', 'Sala de exames', 'ห้องสอบ', 'Sınav salonu', 'امتحان ہال', '考试大厅', 'Eksamen-saal', 'Prüfungsraum', 'Αίθουσα εξετάσεων', 'Sala de examen', 'परीक्षा हल', 'Экзаменационный зал', 'Eksamen Hall', 'Քննության դահլիճ', 'საგამოცდო დარბაზი', 'परीक्षा हॉल', 'Dewan Peperiksaan', 'ਪ੍ਰੀਖਿਆ ਹਾਲ', 'தேர்வு மண்டபம்', 'పరీక్షా హాల్', 'Examenshall', 'Exam Hall'),
(492, 'mark_entries', 'Mark Entries', 'মার্ক এন্ট্রি', 'إدخالات مارك', 'Marquer les entrées', 'मार्क एंट्रीज', 'Tandai Entri', 'Mark Entries', 'エントリーをマーク', '마크 항목', 'Invoer markeren', 'Marcar Entradas', 'ทำเครื่องหมายรายการ', 'Mark Girdileri', 'مارک اندراج', '标记条目', 'Merk inskrywings', 'Einträge markieren', 'Σημειώστε καταχωρήσεις', 'Entradas de marca', 'मार्क प्रविष्टिहरू', 'Отметить записи', 'Markér poster', 'Նշել գրառումները', 'მონიშნეთ ჩანაწერები', 'नोंदी चिन्हांकित करा', 'Tandakan Penyertaan', 'ਮਾਰਕ ਐਂਟਰੀਆਂ', 'குறி உள்ளீடுகள்', 'ఎంట్రీలను గుర్తించండి', 'Markera poster', 'Markahan ang Mga Entries');
INSERT INTO `languages` (`id`, `word`, `english`, `bengali`, `arabic`, `french`, `hindi`, `indonesian`, `italian`, `japanese`, `korean`, `dutch`, `portuguese`, `thai`, `turkish`, `urdu`, `chinese`, `afrikaans`, `german`, `greek`, `spanish`, `nepali`, `russian`, `danish`, `armenian`, `georgian`, `marathi`, `malay`, `punjabi`, `tamil`, `telugu`, `swedish`, `filipino`) VALUES
(493, 'tabulation_sheet', 'Tabulation Sheet', 'ট্যাবলেট শীট', 'ورقة الجدولة', 'Feuille de tabulation', 'टेबुलेशन शीट', 'Lembar Tabulasi', 'Foglio di tabulazione', '集計シート', '도표화 시트', 'Tabuleringsblad', 'Folha de tabulação', 'แผ่นตาราง', 'Tablolama Sayfası', 'ٹیبلولینٹ شیٹ', '制表表', 'Tabuleringsblad', 'Tabellenblatt', 'Φύλλο πίνακα', 'Hoja de tabulación', 'तालिका पाना', 'Таблицы', 'Tabuleringsark', 'Պլանշետային թերթիկ', 'პლანშეტის ფურცელი', 'टॅब्युलेशन शीट', 'Lembaran Tabulasi', 'ਟੈਬਲੇਸ਼ਨ ਸ਼ੀਟ', 'அட்டவணை தாள்', 'పట్టిక షీట్', 'Tabuleringsark', 'Sheet ng Tabulation'),
(494, 'supervision', 'Supervision', 'রক্ষণাবেক্ষণ', 'إشراف', 'Supervision', 'पर्यवेक्षण', 'Pengawasan', 'supervisione', '監督', '감독', 'Toezicht', 'Supervisão', 'การดูแล', 'Nezaret', 'نگرانی', '监督', 'toesig', 'Aufsicht', 'Εποπτεία', 'Supervisión', 'पर्यवेक्षण', 'надзор', 'Overvågning', 'Վերստուգում', 'ზედამხედველობა', 'पर्यवेक्षण', 'Penyeliaan', 'ਨਿਗਰਾਨੀ', 'மேற்பார்வை', 'సూపర్విజన్', 'Övervakning', 'Pangangasiwa'),
(495, 'hostel_master', 'Hostel Master', 'হোস্টেল মাস্টার', 'نزل ماستر', 'Hostel Master', 'हॉस्टल मास्टर', 'Master Hostel', 'Ostello Maestro', 'ホステルマスター', '호스텔 마스터', 'Hostel Master', 'Mestre do Hostel', 'โฮสเทลมาสเตอร์', 'Hostel Master', 'ہاسٹل ماسٹر', '宿舍大师', 'Koshuismeester', 'Hostel Master', 'Ξενώνας Μάστερ', 'Hostel Master', 'छात्रावास मास्टर', 'Хостел Мастер', 'Hostel Master', 'Հոստել վարպետ', 'ჰოსტელის ოსტატი', 'वसतिगृह मास्टर', 'Tuan Asrama', 'ਹੋਸਟਲ ਮਾਸਟਰ', 'ஹாஸ்டல் மாஸ்டர்', 'హాస్టల్ మాస్టర్', 'Hostel Master', 'Hostel Master'),
(496, 'hostel_room', 'Hostel Room', 'হোস্টেল রুম', 'غرفة نزل', 'Chambre d\'auberge', 'छात्रावास का कमरा', 'Kamar Hostel', 'Camera dell\'ostello', 'ホステルルーム', '호스텔 룸', 'Hostelkamer', 'Quarto Hostel', 'ห้องโฮสเทล', 'Hostel Odası', 'ہالینڈ کا کمرہ', '宿舍间', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(497, 'allocation_report', 'Allocation Report', 'বরাদ্দ রিপোর্ট', 'تقرير التخصيص', 'Rapport d\'allocation', 'आवंटन रिपोर्ट', 'Laporan Alokasi', 'Rapporto di assegnazione', '配分レポート', '배당 보고서', 'Toewijzingsverslag', 'Relatório de alocação', 'รายงานการจัดสรร', 'Tahsis Raporu', 'تخصیص کی رپورٹ', '分配报告', 'Toekenningsverslag', 'Zuteilungsbericht', 'Αναφορά κατανομής', 'Informe de asignación', 'आवंटन रिपोर्ट', 'Отчет о распределении', 'Tildelingsrapport', 'Տեղաբաշխման հաշվետվություն', 'განაწილების ანგარიში', 'वाटप अहवाल', 'Laporan Peruntukan', 'ਅਲਾਟਮੈਂਟ ਰਿਪੋਰਟ', 'ஒதுக்கீடு அறிக்கை', 'కేటాయింపు నివేదిక', 'Tilldelningsrapport', 'Paglalaan ng Alokasyon'),
(498, 'route_master', 'Route Master', 'রুট মাস্টার', 'سيد الطريق', 'Route Master', 'रूट मास्टर', 'Rute Master', 'Route Master', 'ルートマスター', '루트 마스터', 'Route Master', 'Mestre da rota', 'เส้นทางการเดินทาง', 'Rota ustası', 'راستہ ماسٹر', '路线大师', 'Roete Meester', 'Routenmaster', 'Δρομολόγος πλοίαρχος', 'Maestro de ruta', 'मार्ग मास्टर', 'Мастер маршрута', 'Rute Master', 'Ուղու վարպետ', 'მარშრუტი', 'मार्ग मास्टर', 'Guru Laluan', 'ਰੂਟ ਮਾਸਟਰ', 'பாதை மாஸ்டர்', 'రూట్ మాస్టర్', 'Route Master', 'Master ng Ruta'),
(499, 'vehicle_master', 'Vehicle Master', 'যানবাহন মাস্টার', 'سيد السيارة', 'Véhicule maître', 'वाहन मास्टर', 'Master Kendaraan', 'Maestro del veicolo', '車両マスター', '차량 마스터', 'Voertuig Master', 'Mestre do Veículo', 'ยานพาหนะต้นแบบ', 'Araç Ustası', 'گاڑیاں ماسٹر', '车辆大师', 'Voertuigmeester', 'Fahrzeugmeister', 'Κύριος οχήματος', 'Vehículo maestro', 'सवारी साधन', 'Мастер автомобиля', 'Køretøjsfører', 'Մեքենայի վարպետ', 'მანქანების ოსტატი', 'वाहन मास्टर', 'Tuan Kenderaan', 'ਵਾਹਨ ਮਾਸਟਰ', 'வாகன மாஸ்டர்', 'వెహికల్ మాస్టర్', 'Fordonsmästare', 'Master ng Sasakyan'),
(500, 'stoppage', 'Stoppage', 'বিরতি', 'إضراب', 'Arrêt', 'ठहरना', 'Penghentian', 'Arresto', '停止', '중지', 'stopzetting', 'Parada', 'การหยุด', 'peklik', 'روکنا', '停工', 'oponthoud', 'Stillstand', 'Παύση', 'Paro', 'स्टपपेज', 'Приостановка', 'afbrydelse', 'Կանգառ', 'გაჩერება', 'थांबा', 'Berhenti', 'ਰੁਕਣਾ', 'நிறுத்தம்', 'ఆట ముగిసే', 'stopp', 'Paghahinto'),
(501, 'assign_vehicle', 'Assign Vehicle', 'যানবাহন বরাদ্দ করুন', 'تخصيص مركبة', 'Assigner un véhicule', 'वाहन सौंप दें', 'Tetapkan Kendaraan', 'Assegna veicolo', '車両を割り当て', '차량 지정', 'Voertuig toewijzen', 'Atribuir Veículo', 'มอบหมายยานพาหนะ', 'Araç Ata', 'گاڑیاں تفویض کریں', '分配车辆', 'Ken voertuig toe', 'Fahrzeug zuweisen', 'Εκχώρηση οχήματος', 'Asignar vehículo', 'वाहन तोक्नुहोस्', 'Назначить автомобиль', 'Tildel køretøjet', 'Հանձնարարեք մեքենային', 'დაავალეთ მანქანა', 'वाहन नियुक्त करा', 'Tugaskan Kenderaan', 'ਵਾਹਨ ਨਿਰਧਾਰਤ ਕਰੋ', 'வாகனத்தை ஒதுக்குங்கள்', 'వాహనాన్ని కేటాయించండి', 'Tilldela fordon', 'Magtalaga ng Sasakyan'),
(502, 'reports', 'Reports', 'প্রতিবেদন', 'تقارير', 'Rapports', 'रिपोर्ट', 'Laporan', 'Rapporti', 'レポート', '보고서', 'rapporten', 'Relatórios', 'รายงาน', 'Raporlar', 'رپورٹیں', '报告', 'Verslae', 'Berichte', 'Αναφορές', 'Informes', 'रिपोर्टहरू', 'Отчеты', 'Rapporter', 'Զեկույցներ', 'ცნობები', 'अहवाल', 'Laporan', 'ਰਿਪੋਰਟ', 'அறிக்கைகள்', 'నివేదికలు', 'rapporter', 'Mga Ulat'),
(503, 'books_entry', 'Books Entry', 'বই এন্ট্রি', 'دخول الكتب', 'Entrée de livres', 'पुस्तकें प्रवेश', 'Entri Buku', 'Ingresso dei libri', '図書エントリー', '도서 항목', 'Invoer van boeken', 'Entrada de livros', 'รายการหนังสือ', 'Kitaplar Girişi', 'کتابیں انٹری', '书籍入门', 'Inskrywings vir boeke', 'Bucheintrag', 'Εισαγωγή βιβλίων', 'Entrada de libros', 'पुस्तक प्रविष्टि', 'Вход книг', 'Bogindtastning', 'Գրքերի մուտք', 'წიგნების შესვლა', 'पुस्तके प्रवेश', 'Kemasukan Buku', 'ਕਿਤਾਬਾਂ ਦੀ ਐਂਟਰੀ', 'புத்தகங்கள் நுழைவு', 'పుస్తకాల ప్రవేశం', 'Böcker post', 'Pagpasok ng Mga Libro'),
(504, 'event_type', 'Event Type', 'ইভেন্টের ধরণ', 'نوع الحدث', 'Event Type', 'Event Type', 'Jenis Peristiwa', 'Tipo di evento', 'イベントタイプ', '이벤트 유형', 'Type evenement', 'Tipo de evento', 'ประเภทกิจกรรม', 'Etkinlik tipi', 'واقعہ کی قسم', '事件类型', 'Gebeurtenistipe', 'Ereignistyp', 'Τύπος συμβάντος', 'Tipo de evento', 'घटना प्रकार', 'Тип события', 'Begivenhedstype', 'Իրադարձության տեսակը', 'ღონისძიების ტიპი', 'कार्यक्रमाचा प्रकार', 'Jenis acara', 'ਘਟਨਾ ਦੀ ਕਿਸਮ', 'நிகழ்வு வகை', 'ఈవెంట్ రకం', 'Event typ', 'Uri ng kaganapan'),
(505, 'add_events', 'Add Events', 'ইভেন্ট যোগ করুন', 'إضافة أحداث', 'Ajouter des événements', 'ईवेंट जोड़ें', 'Tambahkan Acara', 'Aggiungi eventi', 'イベントを追加', '이벤트 추가', 'Voeg evenementen toe', 'Adicionar eventos', 'เพิ่มกิจกรรม', 'Etkinlik ekle', 'واقعات شامل کریں', '添加活动', 'Voeg geleenthede by', 'Ereignisse hinzufügen', 'Προσθήκη εκδηλώσεων', 'Agregar eventos', 'घटनाहरू थप्नुहोस्', 'Добавить события', 'Tilføj begivenheder', 'Ավելացնել իրադարձություններ', 'ღონისძიებების დამატება', 'कार्यक्रम जोडा', 'Tambah Acara', 'ਸਮਾਗਮ ਸ਼ਾਮਲ ਕਰੋ', 'நிகழ்வுகளைச் சேர்க்கவும்', 'ఈవెంట్‌లను జోడించండి', 'Lägg till händelser', 'Magdagdag ng Mga Kaganapan'),
(506, 'student_accounting', 'Student Accounting', 'ছাত্র অ্যাকাউন্টিং', 'محاسبة الطلاب', 'Comptabilité des étudiants', 'छात्र लेखा', 'Akuntansi Mahasiswa', 'Contabilità degli studenti', '学生会計', '학생 회계', 'Accounting discipulus', 'Contabilidade Estudantil', 'บัญชีนักศึกษา', 'Öğrenci Muhasebesi', 'طالب علم اکاؤنٹنگ', '学生会计', 'Studenterekeningkunde', 'Studentenbuchhaltung', 'Φοιτητική Λογιστική', 'Contabilidad estudiantil', 'विद्यार्थी लेखा', 'Студенческий учет', 'Studenterregnskab', 'Ուսանողների հաշվապահություն', 'სტუდენტთა აღრიცხვა', 'विद्यार्थी लेखा', 'Perakaunan Pelajar', 'ਵਿਦਿਆਰਥੀ ਲੇਖਾ', 'மாணவர் கணக்கியல்', 'స్టూడెంట్ అకౌంటింగ్', 'Studentbokföring', 'Accounting ng Mag-aaral'),
(507, 'create_single_invoice', 'Create Single Invoice', 'একক চালান মোট রুট তৈরি করুন', 'إنشاء فاتورة واحدة', 'Créer une facture unique', 'एकल चालान बनाएँ', 'Buat Faktur Tunggal', 'Crea una singola fattura', '単一の請求書を作成する', '단일 송장 생성', 'Maak een enkele factuur', 'Criar uma única fatura', 'สร้างใบแจ้งหนี้เดียว', 'Tek Fatura Yaratın', 'سنگل انوائس بنائیں', '创建单一发票', 'Skep enkel faktuur', 'Einzelrechnung erstellen', 'Δημιουργία μεμονωμένου τιμολογίου', 'Crear factura única', 'एकल इनभ्वाइस सिर्जना गर्नुहोस्', 'Создать единый счет', 'Opret enkelt faktura', 'Ստեղծեք միայնակ հաշիվ ապրանքագիր', 'შექმენით ერთი ინვოისი', 'एकल बीजक तयार करा', 'Buat Invois Tunggal', 'ਸਿੰਗਲ ਇਨਵੌਇਸ ਬਣਾਓ', 'ஒற்றை விலைப்பட்டியல் உருவாக்கவும்', 'ఒకే ఇన్వాయిస్ సృష్టించండి', 'Skapa en enda faktura', 'Lumikha ng Single Invoice'),
(508, 'create_multi_invoice', 'Create Multi Invoice', 'মাল্টি চালান তৈরি করুন', 'إنشاء متعدد الفاتورة', 'Créer une facture multiple', 'मल्टी चालान बनाएँ', 'Buat Multi Faktur', 'Crea una fattura multipla', 'マルチインボイスを作成', '다중 송장 생성', 'Creëer meerdere facturen', 'Criar fatura múltipla', 'สร้างใบแจ้งหนี้หลายใบ', 'Çok Fatura Oluştur', 'ملٹی انوائس بنائیں', '创建多个发票', 'Skep &#39;n multifaktuur', 'Erstellen Sie eine Mehrfachrechnung', 'Δημιουργία πολλαπλών τιμολογίων', 'Crear factura múltiple', 'बहु इनभ्वाइस सिर्जना गर्नुहोस्', 'Создать мульти-счет', 'Opret multifaktura', 'Ստեղծեք բազմակի հաշիվ ապրանքագիր', 'შექმენით მრავალ ინვოისი', 'मल्टी इनव्हॉइस तयार करा', 'Buat Multi Invois', 'ਮਲਟੀ ਇਨਵੌਇਸ ਬਣਾਓ', 'பல விலைப்பட்டியல் உருவாக்கவும்', 'బహుళ ఇన్వాయిస్ సృష్టించండి', 'Skapa flerfaktura', 'Lumikha ng Multi Invoice'),
(509, 'summary_report', 'Summary Report', 'সারসংক্ষেপ প্রতিবেদন', 'تقرير ملخص', 'Rapport sommaire', 'संक्षिप्त रिपोर्ट', 'Rangkuman laporan', 'Relazione di sintesi', '概略報告', '요약 보고서', 'Samenvattingsverslag', 'Relatório resumido', 'รายงานสรุป', 'Özet raporu', 'سمری رپورٹ', '总结报告', 'Opsommingsverslag', 'Kurzbericht', 'Συνοπτική αναφορά', 'Informe resumido', 'सारांश रिपोर्ट', 'Сводный отчет', 'Opsummerende rapport', 'Ամփոփ հաշվետվություն', 'Შემაჯამებელი ანგარიში', 'सारांश अहवाल', 'Ringkasan laporan', 'ਸੰਖੇਪ ਰਿਪੋਰਟ', 'சுருக்கம் அறிக்கை', 'సారాంశం నివేదిక', 'Sammanfattande rapport', 'Pag-uulat ng Buod'),
(510, 'office_accounting', 'Office Accounting', 'অফিস একাউন্টিং', 'محاسبة المكتب', 'Comptabilité de bureau', 'कार्यालय लेखा', 'Akuntansi Kantor', 'officium Accounting', 'オフィス会計', '회계', 'Office Accounting', 'Contabilidade de Escritórios', 'สำนักงานบัญชี', 'Ofis Muhasebesi', 'آفس اکاؤنٹنگ', '办公室会计', 'Kantoorrekeningkunde', 'Bürobuchhaltung', 'Λογιστική γραφείου', 'Contabilidad de oficina', 'कार्यालय लेखा', 'Офисный учет', 'Kontorregnskab', 'Գրասենյակային հաշվապահություն', 'ოფისის ბუღალტრული აღრიცხვა', 'कार्यालयीन लेखा', 'Perakaunan Pejabat', 'ਦਫਤਰ ਲੇਖਾ', 'அலுவலக கணக்கியல்', 'ఆఫీస్ అకౌంటింగ్', 'Kontorsredovisning', 'Accounting ng Opisina'),
(511, 'under_group', 'Under Group', 'দলের অধীনে', 'تحت المجموعة', 'Sous groupe', 'Sous groupe', 'Di bawah Grup', 'Sotto gruppo', 'グループ下', '그룹', 'Onder groep', 'Em grupo', 'ภายใต้กลุ่ม', 'Grup altında', 'گروپ کے تحت', '在集团下', 'Onder Groep', 'Unter Gruppe', 'Στην ομάδα', 'Bajo grupo', 'समूह अन्तर्गत', 'В группе', 'Under Group', 'Խմբի ներքո', 'ჯგუფის ქვეშ', 'गट अंतर्गत', 'Di bawah Kumpulan', 'ਗਰੁੱਪ ਅਧੀਨ', 'குழுவின் கீழ்', 'గ్రూప్ కింద', 'Under Group', 'Sa ilalim ng Pangkat'),
(512, 'bank_account', 'Bank Account', 'ব্যাংক হিসাব', 'حساب البنك', 'Compte bancaire', 'बैंक खाता', 'Akun bank', 'Conto bancario', '銀行口座', '은행 계좌', 'Bankrekening', 'Conta bancária', 'บัญชีธนาคาร', 'Banka hesabı', '', 'بینک اکاؤنٹ', 'Bankrekening', 'Bankkonto', 'Τραπεζικός λογαριασμός', 'Cuenta bancaria', 'बैंक खाता', 'Банковский счет', 'Bankkonto', 'Բանկային հաշիվ', 'Საბანკო ანგარიში', 'बँक खाते', 'Akaun bank', 'ਬੈੰਕ ਖਾਤਾ', 'வங்கி கணக்கு', 'బ్యాంకు ఖాతా', 'Bankkonto', 'Bank account'),
(513, 'ledger_account', 'Ledger Account', 'লেজার অ্যাকাউন্ট', 'حساب دفتر الأستاذ', 'Compte général', 'बही खाता', 'Akun Buku Besar', 'Account di contabilità generale', '元帳アカウント', '원장 계정', 'Grootboekrekening', 'Conta contábil', 'บัญชีแยกประเภท', 'Muhasebe Hesabı', 'لیجر اکاؤنٹ', '分类帐', 'Grootboekrekening', 'Sachkonto', 'Λογαριασμός καθολικού', 'Cuenta contable', 'खाता खाता', 'Лицевой счет', 'Hovedbokskonto', 'Ledger հաշիվ', 'ლეჯერის ანგარიში', 'खाती खाते', 'Akaun lejar', 'ਲੇਜ਼ਰ ਖਾਤਾ', 'லெட்ஜர் கணக்கு', 'లెడ్జర్ ఖాతా', 'Ledbokskonto', 'Ledger Account'),
(514, 'create_voucher', 'Create Voucher', 'ভাউচার তৈরি করুন', 'إنشاء قسيمة', 'Créer votre bon', 'वाउचर बनाएं', 'Buat Voucher', 'Crea un voucher', 'バウチャーを作成', '바우처 만들기', 'Maak een voucher aan', 'Criar comprovante', 'Создать ваучер', '', 'واؤچر بنائیں', '创建凭证', 'Skep koopbewys', 'Gutschein erstellen', 'Δημιουργήστε κουπόνι', 'Crear cupón', 'भौचर सिर्जना गर्नुहोस्', 'Создать ваучер', 'Opret voucher', 'Ստեղծեք վաուչեր', 'ვაუჩერის შექმნა', 'व्हाउचर तयार करा', 'Buat Baucar', 'ਵਾouਚਰ ਬਣਾਓ', 'வவுச்சரை உருவாக்கவும்', 'వోచర్ సృష్టించండి', 'Skapa kupong', 'Lumikha ng Voucher'),
(515, 'day_book', 'Day Book', 'জাবেদা', 'كتاب اليوم', 'Livre de jour', 'डे बुक', 'Buku Harian', 'Libro del giorno', 'デイブック', '데이 북', 'Dagboek', 'Livro do dia', 'หนังสือรายวัน', ' Gün Kitabı', 'دن کی کتاب', '日记', 'Dagboek', 'Tagebuch', 'Βιβλίο ημέρας', 'Libro del dia', 'दिन पुस्तक', 'Дневная книга', 'Dagsbog', 'Օրվա գիրք', 'დღის წიგნი', 'डे बुक', 'Buku Hari', 'ਦਿਨ ਦੀ ਕਿਤਾਬ', 'நாள் புத்தகம்', 'డే బుక్', 'Dagbok', 'Book Book'),
(516, 'cash_book', 'Cash Book', 'নগদ বই', 'كتاب النقدية', 'Livre de caisse', 'नकद खाता', 'Buku Tunai', 'Buku Tunai', 'Buku Tunai', '현금 도서', 'Buy Books', 'Livro caixa', 'หนังสือเล่มเงินสด', 'Kasa defteri', 'نقد کتاب', '现金簿', 'Kontantboek', 'Kassenbuch', 'Βιβλίο μετρητών', 'Libro de pago', 'नगद पुस्तक', 'Кассовая книга', 'Kontantbog', 'Կանխիկ գիրք', 'ფულადი წიგნი', 'रोख पुस्तक', 'Buku tunai', 'ਕੈਸ਼ ਬੁੱਕ', 'பண புத்தகம்', 'నగదు పుస్తకం', 'Kassaböckerna', 'Book ng Cash'),
(517, 'bank_book', 'Bank Book', 'ব্যাংক বই', 'كتاب البنك', 'Livret de banque', 'बैंक की किताब', 'Buku bank', 'Libro bancario', '預金通帳', '은행 통장', 'Bankboek', 'Caderneta bancária', 'สมุดบัญชีธนาคาร', 'Banka defteri', 'بینک کتاب', '存折', 'Bankboek', 'Bank Buch', 'Τράπεζα βιβλίο', 'Banco de libros', 'बैंक पुस्तक', 'Банковская книжка', 'Bankbog', 'Բանկային գիրք', 'საბანკო წიგნი', 'बँक बुक', 'Buku bank', 'ਬੈਂਕ ਬੁੱਕ', 'வங்கி புத்தகம்', 'బ్యాంక్ బుక్', 'Bank bok', 'Aklat ng Bangko'),
(518, 'ledger_book', 'Ledger Book', 'খতিয়ান বই', 'دفتر الأستاذ', 'Livre de grand livre', 'लेजर बुक', 'Buku Besar', 'Libro mastro', '元帳ブック', '레저 도서', 'Grootboek', 'Livro contábil', 'สมุดบัญชีแยกประเภท', 'Defter Defteri', 'لیڈر بک', 'Ledger Book', 'Grootboek', 'Hauptbuch', 'Βιβλίο καθολικών', 'Libro mayor', 'खाता पुस्तक', 'Книга ГК', 'Hovedbog', 'Ledger Book', 'ლეჯერის წიგნი', 'लेजर बुक', 'Buku lejar', 'ਲੇਜ਼ਰ ਬੁੱਕ', 'லெட்ஜர் புத்தகம்', 'లెడ్జర్ బుక్', 'Ledbok', 'Aklat ng Ledger'),
(519, 'trial_balance', 'Trial Balance', 'ট্রায়াল ব্যালেন্স', 'ميزان المراجعة', 'Balance de vérification', 'संतुलन परीक्षण', 'Neraca saldo', 'Bilancio di verifica', '試算表', '시산표', 'Proefbalans', 'Balancete', 'งบทดลอง', 'Mizan', 'آزمائشی بیلنس', ' 试算平衡', 'Proefbalans', 'Probebilanz', 'Ισοζύγιο', 'Balance de prueba', 'परीक्षण शेष', 'Пробный баланс', 'Prøvebalance', 'Դատավարության մնացորդ', 'საცდელი ბალანსი', 'चाचणी शिल्लक', 'Imbangan duga', 'ਅਜ਼ਮਾਇਸ਼ ਸੰਤੁਲਨ', 'சோதனை இருப்பு', 'ట్రయల్ బ్యాలెన్స్', 'Råbalans', 'Balanse sa Pagsubok'),
(520, 'settings', 'Settings', 'স্থাপন', 'الإعدادات', 'Réglages', 'सेटिंग्स', 'Pengaturan', 'impostazioni', '設定', '설정', 'instellingen', 'Definições', 'การตั้งค่า', 'Ayarlar', 'ترتیبات', 'ترتیبات', 'instellings', 'die Einstellungen', 'Ρυθμίσεις', 'Configuraciones', 'सेटिंग्स', 'настройки', 'Indstillinger', 'Կարգավորումներ', 'პარამეტრები', 'सेटिंग्ज', 'Tetapan', 'ਸੈਟਿੰਗਜ਼', 'அமைப்புகள்', 'సెట్టింగులు', 'inställningar', 'Mga setting'),
(521, 'sms_settings', 'Sms Settings', 'এসএমএস সেটিংস', 'إعدادات الرسائل القصيرة', 'Paramètres Sms', 'एसएमएस सेटिंग्स', 'Pengaturan Sms', 'Sms Settings', 'SMS設定', 'SMS 설정', 'Sms Settings', 'Configurações de SMS', 'การตั้งค่า Sms', 'Sms Ayarları', 'ایس ایم ایس کی ترتیبات', '短信设置', 'SMS-instellings', 'SMS-Einstellungen', 'Ρυθμίσεις Sms', 'Configuraciones de SMS', 'एसएमएस सेटिंग्स', 'Настройки смс', 'SMS-indstillinger', 'Sms- ի պարամետրերը', 'Sms პარამეტრები', 'एसएमएस सेटिंग्ज', 'Tetapan Sms', 'ਐਸਐਮਐਸ ਸੈਟਿੰਗਜ਼', 'எஸ்எம்எஸ் அமைப்புகள்', 'Sms సెట్టింగులు', 'Sms Settings', 'Mga Setting ng Sms'),
(522, 'cash_book_of', 'Cash Book Of', 'ক্যাশ বুক', 'كتاب النقدية من', 'Livre de caisse de', 'की कैश बुक', 'Buku Tunai Dari', 'Libro cassa di', 'キャッシュブック', '현금 도서 중', 'Kasboek van', 'Livro De Dinheiro De', 'บัญชีเงินสดของ', 'Nakit Çek Defteri', 'کیش کی کتاب', '现金簿', 'Kontantboek van', 'Kassenbuch von', 'Βιβλίο μετρητών', 'Libro de caja de', 'नगद पुस्तक', 'Кассовая книга', 'Kontant bog af', 'Կանխիկ գիրք', 'ფულადი წიგნი', 'रोख पुस्तक', 'Buku Tunai Daripada', 'ਦੀ ਨਕਦ ਬੁੱਕ', 'பண புத்தகம்', 'నగదు పుస్తకం', 'Kontantbok av', 'Cash Book Ng'),
(523, 'by_cash', 'By Cash', 'নগদে', 'نقدا', 'En espèces', 'नकद द्वारा', 'Dengan uang tunai', 'In contanti', '現金で', '현금으로', 'Contant', 'Em dinheiro', 'โดยเงินสด', 'Nakit', 'نقد کی طرف سے', '用现金', 'Met kontant', 'Bar', 'Με μετρητά', 'En efectivo', 'नगद द्वारा', 'Наличными', 'Med kontanter', 'Ըստ կանխիկի', 'ნაღდი ფულით', 'रोख द्वारा', 'Dengan Wang Tunai', 'ਨਕਦ ਦੁਆਰਾ', 'பணத்தால்', 'నగదు ద్వారా', 'Med kontanter', 'Sa pamamagitan ng cash'),
(524, 'by_bank', 'By Bank', 'ব্যাংক দ্বারা', 'عن طريق البنك', 'Par banque', 'बैंक द्वारा', 'Oleh Bank', 'Dalla banca', '銀行による', '은행 별', 'Per bank', 'Por banco', 'โดยธนาคาร', 'Banka Tarafından', 'بینک کی طرف سے', '由银行', 'Met kontant', 'Bar', 'Με μετρητά', 'En efectivo', 'नगद द्वारा', 'Наличными', 'Med kontanter', 'Ըստ կանխիկի', 'ნაღდი ფულით', 'रोख द्वारा', 'Dengan Wang Tunai', 'ਨਕਦ ਦੁਆਰਾ', 'பணத்தால்', 'నగదు ద్వారా', 'Med kontanter', 'Sa pamamagitan ng cash'),
(525, 'total_strength', 'Total Strength', 'মোট শক্তি', 'القوة الكلية', 'Force totale', 'कुल ताकत', 'Total Kekuatan', 'Forza totale', '総強度', '총 강도', 'Totale sterkte', 'Força total', 'ความแข็งแรงโดยรวม', 'Toplam gücü', 'کل طاقت', '总强度', 'Totale sterkte', 'Gesamtstärke', 'Συνολική αντοχή', 'Fuerza total', 'कुल शक्ति', 'Общая сила', 'Total styrke', 'Ընդհանուր ուժ', 'სულ ძალა', 'एकूण सामर्थ्य', 'Kekuatan Total', 'ਪੂਰੀ ਤਾਕਤ', 'மொத்த வலிமை', 'మొత్తం బలం', 'Total styrka', 'Kabuuang Lakas'),
(526, 'teachers', 'Teachers', 'শিক্ষক', 'معلمون', 'Enseignants', 'शिक्षकों की', 'Guru', 'Insegnanti', '先生', '교사들', 'leerkrachten', 'Professores', 'ครูผู้สอน', 'Öğretmenler', 'اساتذہ', '老师', 'onderwysers', 'Lehrer', 'Καθηγητές', 'Maestros', 'शिक्षकहरू', 'Учителя', 'Lærere', 'Ուսուցիչներ', 'Მასწავლებლები', 'शिक्षक', 'Guru', 'ਅਧਿਆਪਕ', 'ஆசிரியர்கள்', 'టీచర్స్', 'lärare', 'Mga guro'),
(527, 'student_quantity', 'Student Quantity', 'ছাত্র পরিমাণ', 'كمية الطالب', 'Quantité d\'étudiant', 'छात्र मात्रा', 'Jumlah Mahasiswa', 'Quantità di studenti', '学生数', '학생 수', 'Student Aantal', 'Quantidade de estudantes', 'Количество учеников', 'Öğrenci Miktarı', 'طالب علم کی مقدار', '学生数量', 'Studente Hoeveelheid', 'Studentenmenge', 'Ποσότητα μαθητών', 'Cantidad de estudiantes', 'विद्यार्थी संख्या', 'Количество учеников', 'Studentmængde', 'Ուսանողների քանակը', 'სტუდენტის რაოდენობა', 'विद्यार्थ्यांची संख्या', 'Kuantiti Pelajar', 'ਵਿਦਿਆਰਥੀ ਦੀ ਮਾਤਰਾ', 'மாணவர் அளவு', 'విద్యార్థుల పరిమాణం', 'Studentkvantitet', 'Dami ng Mag-aaral'),
(528, 'voucher', 'Voucher', 'রসিদ', 'قسيمة', 'Bon', 'वाउचर', 'Voucher', 'Voucher; tagliando', 'バウチャー', '보증인', 'bon', 'Comprovante', 'คูปอง', 'fiş', 'واؤچر', 'واؤچر', 'koopbewys', 'Gutschein', 'Απόδειξη πληρωμής', 'Vale', 'भौचर', 'Ваучер', 'Rabatkupon', 'Վաուչեր', 'ვაუჩერი', 'व्हाउचर', 'Baucar', 'ਵਾouਚਰ', 'வவுச்சர்', 'ఓచర్', 'Voucher', 'Voucher'),
(529, 'total_number', 'Total Number', 'মোট সংখ্যা', 'মোট সংখ্যা', 'Nombre total', 'कुल संख्या', 'Jumlah total', 'Numero totale', '総数', '総数', 'Número total', 'Número total', 'จำนวนรวม', 'Toplam sayısı', 'کل تعداد', '总数', 'Totale getal', 'Gesamtzahl', 'Συνολικός αριθμός', 'Numero total', 'कुल संख्या', 'Общее число', 'Samlet antal', 'Ընդհանուր թիվը', 'მთლიანი ნომერი', 'एकूण संख्या', 'Jumlah nombor', 'ਕੁੱਲ ਸੰਖਿਆ', 'மொத்த எண்ணிக்கை', 'మొత్తం సంఖ్య', 'Totala numret', 'Kabuuang Bilang'),
(530, 'total_route', 'Total Route', 'মোট রুট', 'الطريق الإجمالي', 'Total Route', 'कुल रूट', 'Rute Total', 'Percorso totale', 'トータルルート', '총 경로', 'Total Route', 'Total Route', 'เส้นทางทั้งหมด', 'Toplam Güzergah', 'کل روٹ', '总路线', 'Totale roete', 'Gesamtroute', 'Συνολική διαδρομή', 'Ruta total', 'कुल मार्ग', 'Общий маршрут', 'Total rute', 'Ընդհանուր երթուղի', 'მთლიანი მარშრუტი', 'एकूण मार्ग', 'Jumlah Laluan', 'ਕੁੱਲ ਰਸਤਾ', 'மொத்த பாதை', 'మొత్తం మార్గం', 'Total rutt', 'Kabuuang Ruta'),
(531, 'total_room', 'Total Room', 'মোট কক্ষ', 'مجموع الغرفة', 'Chambre totale', 'कुल कमरा', 'Total Kamar', 'Stanza totale', 'トータルルーム', '총 방', 'Totaal kamer', 'Quarto total', 'รวมห้องพัก', 'Toplam oda', 'کل کمرہ', '总房间', 'Totale kamer', 'Gesamtraum', 'Σύνολο δωματίων', 'Habitación total', 'कुल कोठा', 'Общая комната', 'Samlet værelse', 'Ընդհանուր սենյակ', 'სულ ოთახი', 'एकूण खोली', 'Jumlah Bilik', 'ਕੁੱਲ ਕਮਰਾ', 'மொத்த அறை', 'మొత్తం గది', 'Totalt rum', 'Kabuuan ng Kwarto'),
(532, 'amount', 'Amount', 'পরিমাণ', 'كمية', 'Montant', 'रकम', 'Jumlah', 'Jumlah', '量', '양', 'Bedrag', 'Montante', 'จำนวน', 'Miktar', 'Miktar', '量', 'bedrag', 'Menge', 'Ποσό', 'Cantidad', 'रकम', 'Количество', 'Beløb', 'Գումարը', 'თანხა', 'रक्कम', 'Jumlah', 'ਦੀ ਰਕਮ', 'தொகை', 'మొత్తం', 'Belopp', 'Halaga'),
(533, 'branch_dashboard', 'Branch Dashboard', 'শাখা ড্যাশবোর্ড', 'لوحة تحكم الفرع', 'Tableau de bord de branche', 'शाखा डैशबोर्ड', 'Dashboard Cabang', 'Dashboard del ramo', 'ブランチダッシュボード', '지점 대시 보드', 'Branch Dashboard', 'Painel de filiais', 'สาขาแดชบอร์ด', 'Şube Panosu', 'برانچ ڈیش بورڈ', '分支仪表板', 'Takpaneelbord', 'Zweig-Dashboard', 'Πίνακας ελέγχου κλάδου', 'Tablero de rama', 'शाखा ड्यासबोर्ड', 'Панель инструментов филиала', 'Branch Dashboard', 'Մասնաճյուղի սեղան', 'ფილიალის დაფა', 'शाखा डॅशबोर्ड', 'Papan Pemuka Cawangan', 'ਸ਼ਾਖਾ ਡੈਸ਼ਬੋਰਡ', 'கிளை டாஷ்போர்டு', 'బ్రాంచ్ డాష్‌బోర్డ్', 'Branch Dashboard', 'Branch Dashboard'),
(534, 'branch_list', 'Branch List', 'শাখা তালিকা', 'قائمة الفرع', 'Liste de branche', 'शाखा सूची', 'Daftar Cabang', 'Elenco delle filiali', '支店リスト', '지점 목록', 'Branchelijst', 'Lista de Filial', 'รายชื่อสาขา', 'รายชื่อสาขา', 'รายชื่อสาขา', '分行名单', 'Taklys', 'Branchenliste', 'Λίστα καταστημάτων', 'Lista de sucursales', 'शाखा सूची', 'Список филиалов', 'Filialiste', 'Մասնաճյուղերի ցուցակ', 'ფილიალების სია', 'शाखा यादी', 'Senarai Cawangan', 'ਸ਼ਾਖਾ ਸੂਚੀ', 'கிளை பட்டியல்', 'బ్రాంచ్ జాబితా', 'Grenlista', 'Listahan ng Sanga'),
(535, 'create_branch', 'Create Branch', 'শাখা তৈরি করুন', 'إنشاء فرع', 'Créer une branche', 'शाखा बनाएँ', 'Buat Cabang', 'Crea un ramo', 'ブランチを作成', '지점 만들기', 'Maak filiaal', 'Criar Filial', 'สร้างสาขา', 'Şube Yarat', 'برانچ بنائیں', '创建分支', 'Skep tak', 'Zweig erstellen', 'Δημιουργία υποκαταστήματος', 'Crear rama', 'शाखा सिर्जना गर्नुहोस्', 'Создать ветку', 'Opret gren', 'Ստեղծեք մասնաճյուղ', 'ფილიალის შექმნა', 'शाखा तयार करा', 'Buat Cawangan', 'ਬ੍ਰਾਂਚ ਬਣਾਓ', 'கிளை உருவாக்கவும்', 'బ్రాంచ్ సృష్టించండి', 'Skapa gren', 'Lumikha ng Sangay'),
(536, 'branch_name', 'Branch Name', 'শাখার নাম', 'اسم الفرع', 'Nom de la filiale', 'शाखा का नाम', 'Nama cabang', 'Nome del ramo', '支店名', '지점명', 'Filiaalnaam', 'Nome da Filial', 'ชื่อสาขา', 'Şube Adı', 'برانچ کا نام', '分店名称', 'Tak Naam', 'Zweigname', 'Όνομα υποκαταστήματος', 'Nombre de la sucursal', 'शाखाको नाम', 'Название филиала', 'Afdelingsnavn', 'Մասնաճյուղի անուն', 'ფილიალის სახელი', 'शाखेचे नाव', 'Nama cawangan', 'ਸ਼ਾਖਾ ਦਾ ਨਾਮ', 'கிளை பெயர்', 'శాఖ పేరు', 'Grennamn', 'Pangalan ng Sangay'),
(537, 'school_name', 'School Name', 'স্কুল নাম', 'اسم المدرسة', 'Nom de l\'école', 'विद्यालय का नाम', 'Nama sekolah', 'Nome della scuola', '学校名', '학교 이름', 'Schoolnaam', 'Nome da escola', 'ชื่อโรงเรียน', 'Okul Adı', 'سکول کا نام', '学校名称', 'Skool naam', 'Schulname', 'Ονομα σχολείου', 'Nombre de la escuela', 'स्कूल नाम', 'Название школы', 'Skole navn', 'Դպրոցի անունը', 'Სკოლის სახელი', 'शाळेचे नाव', 'Nama sekolah', 'ਸਕੂਲ ਦਾ ਨਾਮ', 'பள்ளி பெயர்', 'పాఠశాల పేరు', 'Skolnamn', 'Pangalan ng paaralan'),
(538, 'mobile_no', 'Mobile No', 'মোবাইল নাম্বার', 'رقم الموبايل', 'Mobile No', 'मोबाइल नहीं है', 'Nomor telepon seluler', 'Cellulare n', '携帯電話番号', '모바일 아니요', 'Mobiel Nee', 'Mobile No', 'หมายเลขโทรศัพท์มือถือ', 'Telefon numarası', 'موبائل نمبر', '手机号码', 'Selfoon nommer', 'Handynummer', 'Οχι κινητό', 'No móviles', 'मोबाइल नम्बर', 'Номер мобильного', 'Mobil nummer', 'Բջջային ոչ', 'Მობილურის ნომერი', 'मोबाईल क्रमांक', 'Nombor telefon bimbit', 'ਮੋਬਾਈਲ ਨੰ', 'அலைபேசி எண்', 'మొబైల్ నం', 'Mobilnummer', 'Mobile Hindi'),
(539, 'symbol', 'Symbol', 'পরিমাণ', 'رمز', 'symbole', 'प्रतीक', 'Simbol', 'Simbolo', 'シンボル', '상징', 'Symbool', 'Símbolo', 'สัญลักษณ์', 'sembol', 'علامت', '符号', 'simbool', 'Symbol', 'Σύμβολο', 'Símbolo', 'प्रतीक', 'Символ', 'Symbol', 'Խորհրդանիշ', 'სიმბოლო', 'चिन्ह', 'Simbol', 'ਚਿੰਨ੍ਹ', 'சின்னம்', 'చిహ్నం', 'Symbol', 'Simbolo'),
(540, 'city', 'City', 'শহর', 'مدينة', 'Ville', 'शहर', 'Kota', 'città', '市', '도시', 'City', 'Cidade', 'เมือง', 'şehir', 'شہر', '城市', 'Stad', 'Stadt', 'Πόλη', 'Ciudad', 'शहर', 'город', 'by', 'Քաղաք', 'ქალაქი', 'शहर', 'Bandar', 'ਸ਼ਹਿਰ', 'நகரம்', 'నగరం', 'Stad', 'Lungsod'),
(541, 'academic_year', 'Academic Year', 'একাডেমিক বছর', 'السنة الأكاديمية', 'Année académique', 'शैक्षणिक वर्ष', 'Tahun akademik', 'Anno accademico', '学年', '학년', 'Academiejaar', 'Ano acadêmico', 'ปีการศึกษา', 'Akademik yıl', 'تعلیمی سال', '学年', 'Akademiese jaar', 'Akademisches Jahr', 'Ακαδημαϊκό έτος', 'Año académico', 'शैक्षिक वर्ष', 'Академический год', 'Akademi år', 'Ուսումնական տարին', 'Სასწავლო წლის', 'शैक्षणिक वर्ष', 'Tahun akademik', 'ਅਕਾਦਮਿਕ ਸਾਲ', 'கல்வி ஆண்டில்', 'విద్యా సంవత్సరం', 'Akademiskt år', 'Taong panuruan'),
(542, 'select_branch_first', 'First Select The Branch', 'প্রথমে শাখা নির্বাচন করুন', 'أولا اختر الفرع', 'D\'abord, sélectionnez la branche', 'सबसे पहले शाखा का चयन करें', 'Pertama Pilih Cabang', 'Prima seleziona il ramo', '最初に支店を選択', '먼저 지점 선택', 'Selecteer eerst de vestiging', 'Primeiro selecione o ramo', 'ก่อนอื่นเลือกสาขา', 'İlk Şube Seç', 'سب سے پہلے برانچ منتخب کریں', '首先选择分支', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(543, 'select_class_first', 'Select Class First', 'ক্লাস প্রথম নির্বাচন করুন', 'اختر الفئة الأولى', 'Sélectionnez la classe d&#39;abord', 'कक्षा प्रथम का चयन करें', 'Pilih Kelas Pertama', 'Seleziona prima la classe', '最初にクラスを選択', '클래스 우선 선택', 'Selecteer eerst klasse', 'Selecione a primeira classe', 'เลือก Class First', 'Önce sınıfı seç', 'سب سے پہلے منتخب کریں کلاس', '选择Class First', 'Kies eerste klas', 'Wählen Sie zuerst Klasse', 'Επιλέξτε First Class', 'Seleccionar clase primero', 'कक्षा पहिलो चयन गर्नुहोस्', 'Сначала выберите класс', 'Vælg klasse først', 'Ընտրեք առաջին դասը', 'აირჩიეთ პირველი კლასი', 'प्रथम श्रेणी निवडा', 'Pilih Kelas Pertama', 'ਕਲਾਸ ਫਸਟ ਦੀ ਚੋਣ ਕਰੋ', 'முதல் வகுப்பைத் தேர்ந்தெடுக்கவும்', 'మొదటి తరగతి ఎంచుకోండి', 'Välj klass först', 'Piliin muna ang Klase'),
(544, 'select_country', 'Select Country', 'দেশ নির্বাচন করুন', 'حدد الدولة', 'Choisissez le pays', 'देश चुनिए', 'Pilih negara', 'Pilih negara', '国を選択', '国を選択', '国を選択', 'Selecione o pais', 'เลือกประเทศ', 'Ülke Seç', 'ملک کا انتخاب کیجئے', '选择国家', 'Kies land', 'Land auswählen', 'Επιλέξτε Χώρα', 'Seleccionar país', 'देश चयन गर्नुहोस्', 'Выберите страну', 'Vælg land', 'Ընտրեք Երկիր', 'აირჩიეთ ქვეყანა', 'देश निवडा', 'Pilih negara', 'ਦੇਸ਼ ਚੁਣੋ', 'நாட்டினை தேர்வுசெய்', 'దేశాన్ని ఎంచుకోండి', 'Välj land', 'Piliin ang bansa'),
(545, 'mother_tongue', 'Mother Tongue', 'মাতৃভাষা', 'اللغة الأم', 'Langue maternelle', 'मातृ भाषा', 'Bahasa ibu', 'Madrelingua', '母国語', '母国語', 'Moedertaal', 'Língua nativa', 'ภาษาหลัก', 'Ana dil', 'مادری زبان', '母语', 'Moedertaal', 'Muttersprache', 'Μητρική γλώσσα', 'Lengua materna', 'मातृभाषा', 'Родной язык', 'Modersmål', 'Մայրենի լեզու', 'Მშობლიური ენა', 'मातृभाषा', 'Bahasa ibunda', 'ਮਾਤਾ - ਭਾਸ਼ਾ', 'தாய் மொழி', 'మాతృ భాష', 'Modersmål', 'Sariling wika'),
(546, 'caste', 'Caste', 'বর্ণ', 'الطائفة', 'Caste', 'जाति', 'Kasta', 'Casta', 'カースト', '카스트', 'Kaste', 'Casta', 'วรรณะ', 'Kast', 'ذات', '种姓', 'kaste', 'Kaste', 'Κοινωνική τάξη', 'Casta', 'जाति', 'каста', 'Caste', 'Կաստա', 'კასტა', 'जाती', 'Kasta', 'ਜਾਤ', 'சாதி', 'కులం', 'Kast', 'Caste'),
(547, 'present_address', 'Present Address', 'বর্তমান ঠিকানা', 'العنوان الحالي', 'Adresse actuelle', 'वर्तमान पता', 'Alamat sekarang', 'Indirizzo attuale', '現住所', '현재 주소', 'Huidig ​​adres', 'Endereço presente', 'ที่อยู่ปัจจุบัน', 'ที่อยู่ปัจจุบัน', 'موجودہ پتہ', '现在的住址', 'Huidige adres', 'Aktuelle Adresse', 'Παρούσα διεύθυνση', 'La dirección actual', 'वर्तमान ठेगाना', 'Текущий адрес', 'Nuværende adresse', 'Ներկա Հասցե', 'Ამჟამინდელი მისამართი', 'सध्याचा पत्ता', 'Alamat terkini', 'ਮੌਜੂਦਾ ਪਤਾ', 'தற்போதைய முகவரியில்', 'ప్రస్తుత చిరునామా', 'Nuvarande adress', 'Kasalukuyang tirahan'),
(548, 'permanent_address', 'Permanent Address', 'স্থায়ী ঠিকানা', 'العنوان الثابت', 'Permanent Address', 'स्थाई पता', 'alamat tetap', 'Residenza', 'Residenza', '영구 주소', 'Oratio permanent', 'Oratio permanent', 'Постоянный адрес', 'daimi Adres', 'مستقل پتہ', '永久地址', 'Permanente adres', 'fester Wohnsitz', 'Μόνιμη διεύθυνση', 'dirección permanente', 'स्थाई ठेगाना', 'адрес постоянного проживания', 'Fast adresse', 'մշտական ​​հասցե', 'მუდმივი მისამართი', 'कायमचा पत्ता', 'Alamat tetap', 'ਪੱਕਾ ਪਤਾ', 'நிரந்தர முகவரி', 'శాశ్వత చిరునామా', 'Permanent adress', 'Permanenteng Address'),
(549, 'profile_picture', 'Profile Picture', 'প্রোফাইল ছবি', 'الصوره الشخصيه', 'Image de profil', 'प्रोफ़ाइल फोटो', 'Gambar profil', 'Immagine del profilo', 'プロフィールの写真', '프로필 사진', 'Profielfoto', 'Foto do perfil', 'รูปประวัติ', 'Profil fotoğrafı', 'پروفائل تصویر', '个人资料图片', 'Profiel foto', 'Profilbild', 'Εικόνα προφίλ', 'Foto de perfil', 'प्रोफाइल तस्वीर', 'Изображение профиля', 'Profilbillede', 'Պրոֆիլի նկարը', 'პროფილის სურათი', 'परिचय चित्र', 'Gambar profil', 'ਪ੍ਰੋਫਾਈਲ ਤਸਵੀਰ', 'சுயவிவர படம்', 'ప్రొఫైల్ చిత్రం', 'Profilbild', 'Larawan ng Larawan'),
(550, 'login_details', 'Login Details', 'লগ ইন তথ্য', 'تفاصيل تسجيل الدخول', 'détails de connexion', 'लॉगइन विवरण', 'rincian masuk', 'dettagli del login', 'ログインの詳細', 'ログインの詳細', 'inloggegevens', 'detalhes de login', 'เข้าสู่ระบบรายละเอียด', 'เข้าสู่ระบบรายละเอียด', 'เข้าสู่ระบบรายละเอียด', '登录详细信息', 'Aanmeldingsbesonderhede', 'Login-Daten', 'Λεπτομέρειες Σύνδεσης', 'detalles de registro', 'लगईन विवरणहरू', 'Данные для входа', 'Login detaljer', 'Մուտքի մանրամասները', 'შესვლის დეტალები', 'लॉगिन तपशील', 'Butiran Masuk', 'ਲਾਗਇਨ ਵੇਰਵਾ', 'உள்நுழைவு விவரங்கள்', 'లాగిన్ వివరాలు', 'inloggningsdetaljer', 'Mga Detalye ng Pag-login'),
(551, 'retype_password', 'Retype Password', 'পাসওয়ার্ড আবার টাইপ', 'أعد إدخال كلمة السر', 'Retaper le mot de passe', 'Retaper le mot de passe', 'Ketik ulang kata sandi', 'Ripeti password', 'Ripeti password', '암호 다시 입력', 'Geef nogmaals het wachtwoord', 'Redigite a senha', 'พิมพ์รหัสผ่านอีกครั้ง', 'Şifrenizi yeniden yazın', 'Şifrenizi yeniden yazın', '重新输入密码', 'Tik wagwoord weer in', 'Passwort erneut eingeben', 'Πληκτρολογήστε ξανά τον κωδικό πρόσβασης', 'Vuelva a escribir la contraseña', 'पासवर्ड पुन: लेख्नुहोस', 'Повторите ввод пароля', 'Genindtast kodeord', 'Վերանայել գաղտնաբառ', 'Გაიმეორე პაროლი', 'पासवर्ड पुन्हा टाईप करा', 'Tulis semula kata laluan', 'ਮੁੜ ਪਾਸਵਰਡ ਲਿਖੋ', 'கடவுச்சொல்லை மீண்டும் தட்டச்சு செய்க', 'పాస్వర్డ్ తిరిగి టైప్ చెయ్యండి', 'Skriv in lösenordet igen', 'I-type muli ang Password'),
(552, 'occupation', 'Occupation', 'পেশা', 'الاحتلال', 'Ocupación', 'व्यवसाय', 'Pendudukan', 'Occupazione', '職業', '직업', 'Bezetting', 'Ocupação', 'อาชีพ', 'Meslek', 'Meslek', '占用', 'Beroep', 'Besetzung', 'Κατοχή', 'Ocupación', 'पेशा', 'оккупация', 'Beskæftigelse', 'Զբաղմունք', 'ოკუპაცია', 'व्यवसाय', 'Pekerjaan', 'ਕਿੱਤਾ', 'தொழில்', 'వృత్తి', 'Ockupation', 'Trabaho'),
(553, 'income', 'Income', 'আয়', 'الإيرادات', 'Ingresos', 'आय', 'Pendapatan', 'Reddito', '所得', '수입', 'Inkomen', 'Renda', 'доход', 'Gelir', 'آمدنی', '收入', 'Inkomste', 'Einkommen', 'Εισόδημα', 'Ingresos', 'आय', 'доход', 'Indkomst', 'Եկամուտ', 'შემოსავალი', 'उत्पन्न', 'Pendapatan', 'ਆਮਦਨੀ', 'வருமானம்', 'ఆదాయపు', 'Inkomst', 'Kita'),
(554, 'education', 'Education', 'শিক্ষা', 'التعليم', 'Éducation', 'शिक्षा', 'pendidikan', 'Formazione scolastica', '教育', '교육', 'Opleiding', 'Educação', 'การศึกษา', 'Eğitim', 'تعلیم', 'تعلیم', 'onderwys', 'Bildung', 'Εκπαίδευση', 'Educación', 'शिक्षा', 'образование', 'Uddannelse', 'Կրթություն', 'Განათლება', 'शिक्षण', 'Pendidikan', 'ਸਿੱਖਿਆ', 'கல்வி', 'చదువు', 'Utbildning', 'Edukasyon'),
(555, 'first_select_the_route', 'First Select The Route', 'প্রথম রুট নির্বাচন করুন', 'أولا اختر الطريق', 'Sélectionnez d\'abord l\'itinéraire', 'पहले मार्ग का चयन करें', 'Pertama Pilih Rute', 'Prima selezionare la rotta', '最初にルートを選択', '먼저 경로 선택', 'Selecteer eerst de route', 'Primeiro selecione a rota', 'ก่อนอื่นเลือกเส้นทาง', 'İlk önce Rotayı Seçin', 'پہلا راستہ منتخب کریں', '首先选择路线', 'Kies eers die roete', 'Wählen Sie zuerst die Route aus', 'Πρώτα επιλέξτε τη διαδρομή', 'Primero seleccione la ruta', 'पहिले मार्ग चयन गर्नुहोस्', 'Сначала выберите маршрут', 'Vælg først ruten', 'Նախ ընտրեք երթուղին', 'პირველი შეარჩიეთ მარშრუტი', 'प्रथम मार्ग निवडा', 'Pertama Pilih Laluan', 'ਪਹਿਲਾਂ ਰਸਤਾ ਚੁਣੋ', 'முதலில் வழியைத் தேர்ந்தெடுக்கவும்', 'మొదట మార్గాన్ని ఎంచుకోండి', 'Välj först rutten', 'Una Piliin ang Ruta'),
(556, 'hostel_details', 'Hostel Details', 'হোটেল বিবরণ', 'تفاصيل النزل', 'Détails de l\'hôtel', 'छात्रावास का विवरण', 'Detail Hostel', 'Dettagli dell\'hotel', 'ホステルの詳細', '호스텔 상세 정보', 'Hostel details', 'Detalhes do Hostel', 'รายละเอียดโฮสเทล', 'Hostel Detayları', 'ہاؤس کی تفصیلات', '旅舍详情', 'Koshuisinligting', 'Hostel Details', 'Λεπτομέρειες ξενώνα', 'Detalles del albergue', 'छात्रावास विवरणहरू', 'Детали хостела', 'Hostel detaljer', 'Հանրակացարանի մանրամասները', 'ჰოსტელის დეტალები', 'वसतिगृह तपशील', 'Maklumat Asrama', 'ਹੋਸਟਲ ਦਾ ਵੇਰਵਾ', 'விடுதி விவரங்கள்', 'హాస్టల్ వివరాలు', 'Vandrarhem Detaljer', 'Mga Detalye ng Hostel'),
(557, 'first_select_the_hostel', 'First Select The Hostel', 'প্রথম ছাত্রাবাস নির্বাচন', 'প্রথম ছাত্রাবাস নির্বাচন', 'd\'abord sélectionner l\'hôtel', 'पहले छात्रावास का चयन करें', 'pertama-tama pilih hostel', 'Prima seleziona l\'ostello', '最初にホステルを選ぶ', '먼저 호스텔을 선택하십시오.', 'selecteer eerst het hostel', 'primeiro selecione o albergue', 'ก่อนอื่นเลือกโฮสเทล', 'önce hosteli seç', 'سب سے پہلے ہاسٹل کا انتخاب کریں', '首先选择宿舍', 'Kies eers die koshuis', 'Wählen Sie zuerst das Hostel aus', 'Πρώτα επιλέξτε τον ξενώνα', 'Primero seleccione el albergue', 'पहिले होस्टल चयन गर्नुहोस्', 'Сначала выберите Хостел', 'Vælg først vandrerhjemmet', 'Նախ ընտրեք հանրակացարանը', 'პირველი აირჩიეთ ჰოსტელი', 'प्रथम वसतिगृह निवडा', 'Pertama Pilih Asrama', 'ਪਹਿਲਾਂ ਹੋਸਟਲ ਦੀ ਚੋਣ ਕਰੋ', 'முதலில் ஹாஸ்டலைத் தேர்ந்தெடுக்கவும்', 'మొదట హాస్టల్ ఎంచుకోండి', 'Välj först vandrarhemmet', 'Una Piliin ang Hostel'),
(558, 'previous_school_details', 'Previous School Details', 'পূর্ববর্তী স্কুল বিবরণ', 'تفاصيل المدرسة السابقة', 'Privilege School Détails', 'पिछला स्कूल विवरण', 'Detail Sekolah Sebelumnya', 'Dettagli della scuola precedente', '前の学校の詳細', '이전 학교 세부 사항', 'Vorige schoolgegevens', 'Detalhes da escola anterior', 'รายละเอียดโรงเรียนก่อนหน้า', 'Önceki Okul Detayları', 'Önceki Okul Detayları', '以前的学校细节', 'Vorige skoolbesonderhede', 'Details zur vorherigen Schule', 'Προηγούμενες λεπτομέρειες σχολείου', 'Detalles de la escuela anterior', 'अघिल्लो स्कूल विवरणहरू', 'Детали предыдущей школы', 'Tidligere skoleoplysninger', 'Նախորդ դպրոցի մանրամասները', 'წინა სკოლის დეტალები', 'मागील शाळेचा तपशील', 'Perincian Sekolah Terdahulu', 'ਸਕੂਲ ਦੇ ਪਿਛਲੇ ਵੇਰਵੇ', 'முந்தைய பள்ளி விவரங்கள்', 'మునుపటి పాఠశాల వివరాలు', 'Tidigare skoldetaljer', 'Nakaraang Mga Detalye ng Paaralan'),
(559, 'book_name', 'Book Name', 'বইয়ের নাম', 'اسم الكتاب', 'Nom du livre', 'पुस्तक का नाम', 'Nama Buku', 'Nome del libro', '本の名前', '도서 이름', 'Boeknaam', 'Boeknaam', 'ชื่อหนังสือ', 'ชื่อหนังสือ', 'کتاب کا نام', '书名', 'Boeknaam', 'Buchname', 'Όνομα βιβλίου', 'Nombre del libro', 'पुस्तकको नाम', 'Название книги', 'Bognavn', 'Գրքի անվանումը', 'წიგნის სახელი', 'पुस्तकाचे नाव', 'Nama Buku', 'ਕਿਤਾਬ ਦਾ ਨਾਮ', 'புத்தகத்தின் பெயர்', 'పుస్తక పేరు', 'Boknamn', 'Pangalan ng Aklat'),
(560, 'select_ground', 'Select Ground', 'গ্রাউন্ড নির্বাচন করুন', 'اختر الأرض', 'sélectionnez Ground', 'ग्राउंड का चयन करें', 'pilih Ground', 'seleziona Terra', 'グラウンドを選択', '접지 선택', 'selecteer Ground', 'selecione Ground', 'เลือกกราวด์', 'Zemin seç', 'گراؤنڈ منتخب کریں', '选择地面', 'Kies grond', 'Wählen Sie Masse', 'Επιλέξτε Γείωση', 'Seleccione tierra', 'मैदान छान्नुहोस्', 'Выберите Землю', 'Vælg jorden', 'Ընտրեք հիմքը', 'აირჩიეთ Ground', 'मैदान निवडा', 'Pilih Tanah', 'ਜ਼ਮੀਨ ਚੁਣੋ', 'மைதானத்தைத் தேர்ந்தெடுக்கவும்', 'గ్రౌండ్ ఎంచుకోండి', 'Välj mark', 'Piliin ang Ground'),
(561, 'import', 'Import', 'আমদানি', 'استيراد', 'Importation', 'आयात', 'Impor', 'Importare', 'インポート', '수입', 'Importeren', 'Importar', 'นำเข้า', 'İthalat', 'درآمد کریں', '进口', 'invoer', 'Importieren', 'Εισαγωγή', 'Importar', 'आयात गर्नुहोस्', 'Импортировать', 'Importere', 'Ներմուծում', 'იმპორტი', 'आयात करा', 'Import', 'ਆਯਾਤ', 'இறக்குமதி', 'దిగుమతి', 'Importera', 'Angkat'),
(562, 'add_student_category', 'Add Student Category', 'ছাত্র বিভাগ যোগ করুন', 'إضافة فئة الطالب', 'Ajouter une catégorie d\'étudiant', 'छात्र श्रेणी जोड़ें', 'Tambahkan Kategori Siswa', 'Aggiungi categoria studente', '学生カテゴリを追加', '학생 카테고리 추가', 'Voeg categorie toe', 'Adicionar categoria de aluno', 'เพิ่มหมวดหมู่นักศึกษา', 'Öğrenci Kategorisi Ekle', 'طالب علم کا زمرہ شامل کریں', '添加学生类别', 'Voeg studentekategorie by', 'Schülerkategorie hinzufügen', 'Προσθήκη κατηγορίας μαθητή', 'Agregar categoría de estudiante', 'विद्यार्थी कोटी थप्नुहोस्', 'Добавить студенческую категорию', 'Tilføj elevkategori', 'Ավելացնել ուսանողների կատեգորիա', 'დაამატეთ სტუდენტური კატეგორია', 'विद्यार्थी श्रेणी जोडा', 'Tambah Kategori Pelajar', 'ਵਿਦਿਆਰਥੀ ਸ਼੍ਰੇਣੀ ਸ਼ਾਮਲ ਕਰੋ', 'மாணவர் வகையைச் சேர்க்கவும்', 'విద్యార్థి వర్గాన్ని జోడించండి', 'Lägg till studentkategori', 'Magdagdag ng kategorya ng Mag-aaral'),
(563, 'id', 'Id', 'আইডি', '', 'Id', 'ईद', 'Id', 'Id', 'Id', '신분증', 'ID kaart', 'Identidade', 'Id', 'İD', 'آئی ڈی', 'ID', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(564, 'edit_category', 'Edit Category', 'বিভাগ সম্পাদনা করুন', 'تحرير الفئة', 'Modifier la catégorie', 'श्रेणी संपादित करें', 'Edit Kategori', 'Modifica categoria', 'カテゴリを編集', '카테고리 편집', 'Categorie bewerken', 'Editar categoria', 'แก้ไขหมวดหมู่', 'Kategoriyi Düzenle', 'زمرہ میں ترمیم کریں', '编辑类别', 'Wysig kategorie', 'Kategorie bearbeiten', 'Επεξεργασία κατηγορίας', 'Editar categoria', 'कोटी सम्पादन गर्नुहोस्', 'Изменить категорию', 'Rediger kategori', 'Խմբագրել կարգը', 'რედაქტირების კატეგორია', 'वर्ग संपादित करा', 'Edit Kategori', 'ਸ਼੍ਰੇਣੀ ਸੋਧੋ', 'வகையைத் திருத்து', 'వర్గాన్ని సవరించండి', 'Redigera kategori', 'I-edit ang kategorya'),
(565, 'deactivate_account', 'Deactivate Account', 'অ্যাকাউন্ট নিষ্ক্রিয় করুন', 'تعطيل الحساب', 'Désactiver le compte', 'खाता निष्क्रिय करें', 'Nonaktifkan Akun', 'Disattiva Account', 'アカウントを無効化し', '계정 비활성화', 'account deactiveren', 'Desativar conta', 'ปิดใช้งานบัญชี', 'Aktif edilmemiş hesap', 'اکاؤنٹ کو غیر فعال کریں', '关闭户口', 'Deaktiveer Rekening', 'Konto deaktivieren', 'Απενεργοποίηση λογαριασμού', 'desactivar cuenta', 'खाता निष्क्रिय गर्नुहोस्', 'Деактивировать аккаунт', 'Deaktiver konto', 'Ապաակտիվացնել հաշիվը', 'ანგარიშის გაუქმება', 'खाते निष्क्रिय करा', 'Nyahaktifkan Akaun', 'ਖਾਤਾ ਅਯੋਗ ਕਰੋ', 'கணக்கை செயலிழக்கச் செய்யுங்கள்', 'ఖాతాను నిష్క్రియం చేయండి', 'Inaktivera konto', 'I-deactivate ang Account'),
(566, 'all_sections', 'All Sections', 'সব বিভাগ', 'كل الأقسام', 'toutes les sections', 'सभी वर्गों', 'semua bagian', 'tutte le sezioni', '全セクション', '모든 섹션', 'alle secties', 'todas as seções', 'ทุกส่วน', 'tüm bölümler', 'تمام حصوں', '所有部分', 'Alle afdelings', 'Alle Abschnitte', 'Όλες οι ενότητες', 'Todas las secciones', 'सबै सेक्सनहरू', 'Все разделы', 'Alle sektioner', 'Բոլոր բաժինները', 'ყველა განყოფილება', 'सर्व विभाग', 'Semua Bahagian', 'ਸਾਰੇ ਭਾਗ', 'அனைத்து பிரிவுகளும்', 'అన్ని విభాగాలు', 'Alla avsnitt', 'Lahat ng Mga Seksyon'),
(567, 'authentication_activate', 'Authentication Activate', 'প্রমাণীকরণ সক্রিয় করুন', 'تفعيل المصادقة', 'Authentification Activer', 'प्रमाणीकरण सक्रिय करें', 'Aktifkan Otentikasi', 'Autenticazione Attivare', '認証を有効にする', '인증 활성화', 'Authenticatie Activeren', 'Autenticação Ativar', 'การตรวจสอบสิทธิ์เปิดใช้งาน', 'Kimlik Doğrulama Etkinleştir', 'توثیقی چالو', '身份验证激活', 'Verifikasie Aktiveer', 'Authentifizierung aktivieren', 'Ενεργοποίηση ελέγχου ταυτότητας', 'Activar autenticación', 'प्रमाणीकरण सक्रिय', 'Активация аутентификации', 'Autentificering Aktiver', 'Նույնականացման ակտիվացում', 'ავთენტიფიკაცია გააქტიურეთ', 'प्रमाणीकरण सक्रिय', 'Pengesahan Aktifkan', 'ਪ੍ਰਮਾਣਿਕਤਾ ਸਰਗਰਮ', 'அங்கீகாரம் செயல்படுத்து', 'ప్రామాణీకరణ సక్రియం', 'Autentisering Aktivera', 'Aktibo ang pagpapatunay'),
(568, 'department', 'Department', 'বিভাগ', ' قسم، أقسام', 'département', 'विभाग', 'Departemen', 'Dipartimento', '部門', '학과', 'afdeling', 'Departamento', 'แผนก', 'Bölüm', 'شعبہ', '部门', 'Departement', 'Abteilung', 'Τμήμα', 'Departamento', 'विभाग', 'отдел', 'Afdeling', 'Վարչություն', 'განყოფილება', 'विभाग', 'Jabatan', 'ਵਿਭਾਗ', 'துறை', 'శాఖ', 'Avdelning', 'Kagawaran'),
(569, 'salary_grades', 'Salary Grades', 'বেতন গ্রেড', 'راتب', 'Note salariale', 'वेतन ग्रेड', 'Tingkat Gaji', 'Grado di stipendio', '給与グレード', '급여 등급', 'Salarisrang', 'Grau Salarial', 'ระดับเงินเดือน', 'Maaş notu', 'تنخواہ گریڈ', '薪资等级', 'Salarisgraad', 'Gehaltsstufen', 'Βαθμοί μισθών', 'Grados salariales', 'तलब ग्रेड', 'Заработная плата', 'Lønkarakterer', 'Աշխատավարձի դասարաններ', 'სახელფასო შეფასებები', 'पगार श्रेणी', 'Gred Gaji', 'ਤਨਖਾਹ ਗ੍ਰੇਡ', 'சம்பள தரங்கள்', 'జీతం తరగతులు', 'Lönegrader', 'Mga Paggastos sa Salary'),
(570, 'overtime', 'Overtime Rate (Per Hour)', 'ওভারটাইম হার (প্রতি ঘন্টা)', 'معدل العمل الإضافي (لكل ساعة)', 'taux des heures supplémentaires (à l\'heure)', 'ओवरटाइम दर (प्रति घंटे)', 'tingkat lembur (Per Jam)', 'tasso di straordinario (per ora)', '超過勤務率（1時間あたり）', '초과 근무 요율 (시간당)', 'overwerk tarief (Per uur)', 'taxa de horas extras (por hora)', 'อัตราการทำงานล่วงเวลา (ต่อชั่วโมง)', 'fazla mesai ücreti (Saat Başı)', 'اضافی شرح (فی گھنٹہ)', '加班费（每小时）', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(571, 'salary_grade', 'Salary Grade', 'বেতন গ্রেড', 'راتب', 'Note salariale', 'वेतन ग्रेड', 'Tingkat Gaji', 'Grado di stipendio', '給与グレード', '급여 등급', 'Salarisrang', 'Grau Salarial', 'ระดับเงินเดือน', 'Maaş notu', 'تنخواہ گریڈ', '薪资等级', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(572, 'payable_type', 'Payable Type', 'প্রদেয় প্রকার', 'نوع الدفع', 'Payable Type', 'देय प्रकार', 'Jenis Hutang', 'Tipo pagabile', '支払タイプ', '지불 유형', 'Betaalbaar type', 'Tipo pagável', 'ประเภทเจ้าหนี้', 'Ödenecek Tür', 'پائیدار قسم', '应付款式', 'Betaalbare Typec', 'Zahlbare Artec', 'Πληρωτέα Typec', 'Pagadero Typec', 'भुक्तानयोग्य टाइप', 'Тип оплаты', 'Betalbar typec', 'Վճարովի մուտքագրում', 'გადასახადი typec', 'देय टायपेक', 'Jenis Bayaran', 'ਭੁਗਤਾਨਯੋਗ ਟਾਈਪਿਕ', 'செலுத்த வேண்டிய தட்டச்சு', 'చెల్లించవలసిన టైప్', 'Betalningsbar typec', 'Mapagbabayad na Typec'),
(573, 'edit_type', 'Edit Type', 'টাইপ সম্পাদনা করুন', 'تحرير النوع', 'Τύπος επεξεργασίας', 'प्रकार संपादित करें', 'Edit Jenis', 'Modifica il tipo', 'タイプを編集', '유형 편집', 'Bewerk type', 'Editar tipo', 'แก้ไขประเภท', 'Türü Düzenle', 'قسم میں ترمیم کریں', '编辑类型', 'Wysig tipe', 'Typ bearbeiten', 'Επεξεργασία τύπου', 'Editar tipo', 'प्रकार सम्पादन गर्नुहोस्', 'Изменить тип', 'Rediger type', 'Խմբագրել տեսակը', 'შეცვალეთ ტიპი', 'प्रकार संपादित करा', 'Jenis Edit', 'ਸੋਧ ਕਿਸਮ', 'திருத்து வகை', 'రకాన్ని సవరించండి', 'Redigera typ', 'I-edit ang Uri'),
(574, 'role', 'Role', 'ভূমিকা', 'وظيفة', 'Rôle', 'भूमिका', 'Peran', 'Peran', '役割', '役割', '役割', 'Função', 'บทบาท', 'rol', 'کردار', '角色', 'Rol', 'Rolle', 'Ρόλος', 'Papel', 'भूमिका', 'Роль', 'rolle', 'Դերը', 'როლი', 'भूमिका', 'Peranan', 'ਭੂਮਿਕਾ', 'பங்கு', 'పాత్ర', 'Roll', 'Papel'),
(575, 'remuneration_info_for', 'Remuneration Info For', 'বেতন জন্য তথ্য', 'الأجور معلومات عن', 'Information de rémunération pour', 'पारिश्रमिक जानकारी के लिए', 'Info Remunerasi Untuk', 'Informazioni sulla remunerazione per', 'の報酬情報', '보수 정보', 'Remuneratie-info voor', 'Informações sobre Remuneração Para', 'Информация о вознаграждении за', 'Ücret Bilgisi', 'یاد دہانی کے لئے معلومات', '薪酬信息', 'Besoldigingsinligting vir', 'Vergütungsinfo für', 'Πληροφορίες αποδοχών για', 'Información de remuneración para', 'पारिश्रमिक जानकारी को लागी', 'Информация о вознаграждении за', 'Vederlagsinfo for', 'Վարձատրության մասին տեղեկություն', 'ანაზღაურება ინფორმაცია', 'यासाठी मोबदला माहिती', 'Maklumat Imbuhan Untuk', 'ਲਈ ਮਿਹਨਤਾਨੇ ਦੀ ਜਾਣਕਾਰੀ', 'ஊதிய தகவல்', 'రెమ్యునరేషన్ సమాచారం', 'Ersättningsinformation för', 'Impormasyon sa Pagbabayad Para sa'),
(576, 'salary_paid', 'Salary Paid', 'বেতন দেওয়া', 'الراتب المدفوع', 'Salaire payé', 'वेतन भुगतान', 'Gaji Dibayar', 'Stipendio pagato', '給与を支払った', '유급 급여', 'Salaris betaald', 'Salário Pago', 'เงินเดือนจ่าย', 'Ücretli', 'تنخواہ ادا کی', '工资支付', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(577, 'salary_unpaid', 'Salary Unpaid', 'বেতন পরিশোধ না', 'الراتب غير مدفوع', 'Salaire impayé', 'वेतन अवैतनिक', 'Gaji Tidak Dibayar', 'Salario non retribuito', '給与未払い', '무급 급여', 'Salaris onbetaald', 'Salário não remunerado', 'เงินเดือนค้างชำระ', 'Ödenmemiş Maaş', 'تنخواہ غیر حاضر', '工资未付', 'Salaris Onbetaal', 'Gehalt unbezahlt', 'Μισθός χωρίς καταβολή', 'Salario no pagado', 'तलब भत्ता', 'Заработная плата не выплачивается', 'Løn Ubetalt', 'Աշխատավարձը չվճարված', 'ხელფასის გადახდა', 'वेतन न दिलेले', 'Gaji Tidak Dibayar', 'ਤਨਖਾਹ ਅਦਾ ਕੀਤੀ', 'சம்பளம் செலுத்தப்படாதது', 'జీతం చెల్లించబడదు', 'Lön obetald', 'Utang na Walang bayad'),
(578, 'pay_now', 'Pay Now', 'এখন পরিশোধ করুন', 'ادفع الآن', 'Payez maintenant', 'अब भुगतान करें', 'Bayar sekarang', 'Paga ora', '今払う', '지금 지불하세요', 'Nu betalen', 'Pague agora', 'จ่ายตอนนี้', 'Şimdi öde', 'اب ادا', '现在付款', 'Betaal nou', 'Zahlen Sie jetzt', 'Πλήρωσε τώρα', 'Pagar ahora', 'अब भुक्तान गर्नुहोस्', 'Заплатить сейчас', 'Betal nu', 'Վճարեք հիմա', 'Გადაიხადე ახლა', 'आता द्या', 'Bayar sekarang', 'ਹੁਣੇ ਭੁਗਤਾਨ ਕਰੋ', 'இப்போது செலுத்த', 'ఇప్పుడు చెల్లించండి', 'Betala nu', 'Magbayad Ngayon'),
(579, 'employee_role', 'Employee Role', 'কর্মচারী ভূমিকা', 'دور الموظف', 'Rôle de l\'employé', 'कर्मचारी की भूमिका', 'Peran Karyawan', 'Ruolo dei dipendenti', '従業員の役割', '직원 역할', 'Medewerkersrol', 'Função do Empregado', 'บทบาทของพนักงาน', 'Çalışan Rolü', 'ملازم کردار', '员工角色', 'Werknemer Rol', 'Mitarbeiterrolle', 'Ρόλος υπαλλήλων', 'Rol del empleado', 'कर्मचारी भूमिका', 'Роль сотрудника', 'Medarbejdernes rolle', 'Աշխատակիցների դերը', 'თანამშრომელთა როლი', 'कर्मचार्यांची भूमिका', 'Peranan Pekerja', 'ਕਰਮਚਾਰੀ ਦੀ ਭੂਮਿਕਾ', 'பணியாளர் பங்கு', 'ఉద్యోగుల పాత్ర', 'Anställdes roll', 'Role ng empleyado'),
(580, 'create_at', 'Create At', 'এ তৈরি করুন', 'خلق في', 'Créer à', 'पर बनाएँ', 'Buat Di', 'Crea At', 'で作成', '에서 생성', 'Maak At', 'Criar em', 'สร้างที่', 'At oluştur', 'بنائیں', '创建于', 'Skep by', 'Erstellen um', 'Δημιουργία στο', 'Crear en', 'सिर्जना गर्नुहोस्', 'Создать в', 'Opret kl', 'Ստեղծեք At', 'შექმენით At', 'तयार करा', 'Buat Pada', 'ਬਣਾਓ', 'இல் உருவாக்கவும்', 'వద్ద సృష్టించండి', 'Skapa på', 'Lumikha ng At'),
(581, 'select_employee', 'Select Employee', 'কর্মচারী নির্বাচন করুন', 'اختر الموظف', 'Sélectionnez un employé', 'कर्मचारी का चयन करें', 'Pilih Karyawan', 'Pilih Karyawan', '従業員を選択', '직원 선택', 'Aliquam selecta', 'Selecione Empregado', 'Выберите сотрудника', 'Выберите сотрудника', 'ملازم کا انتخاب کریں', '选择员工', 'Kies Werknemer', 'Wählen Sie Mitarbeiter', 'Επιλέξτε Υπάλληλος', 'Seleccionar empleado', 'कर्मचारी चयन गर्नुहोस्', 'Выберите сотрудника', 'Vælg Medarbejder', 'Ընտրեք աշխատող', 'აირჩიეთ თანამშრომელი', 'कर्मचारी निवडा', 'Pilih Pekerja', 'ਕਰਮਚਾਰੀ ਦੀ ਚੋਣ ਕਰੋ', 'பணியாளரைத் தேர்ந்தெடுக்கவும்', 'ఉద్యోగిని ఎంచుకోండి', 'Välj anställd', 'Piliin ang Empleyado'),
(582, 'review', 'Review', 'পর্যালোচনা', 'إعادة النظر', 'revisión', 'समीक्षा', 'समीक्षा', 'Revisione', '見直し', '리뷰', 'Beoordeling', 'Reveja', 'ทบทวน', 'gözden geçirmek', 'جائزہ لیں', '评论', 'Resensie', 'Rezension', 'Ανασκόπηση', 'revisión', 'समीक्षा', 'Рассмотрение', 'Anmeldelse', 'Վերանայում', 'Მიმოხილვა', 'पुनरावलोकन', 'Kaji semula', 'ਸਮੀਖਿਆ', 'விமர்சனம்', 'సమీక్ష', 'Recension', 'Pagsusuri'),
(583, 'reviewed_by', 'Reviewed By', 'দ্বারা পর্যালোচনা', 'تمت مراجعته من قبل', 'Revu par', 'द्वारा समीक्षित', 'Diperiksa oleh', 'Recensito da', 'によってレビューされた', '검토 자', 'Beoordeeld door', 'Revisados ​​pela', 'สอบทานโดย', 'Tarafından gözden geçirildi', 'کی طرف سے جائزہ لیا گیا', '评论人', 'Nagesien deur', 'Rezensiert von', 'Κριτική από', 'Revisado por', 'द्वारा समीक्षा गरिएको', 'Рассмотрено', 'Anmeldt af', 'Վերանայվել է', 'Განიხილა', 'यांनी पुनरावलोकन केले', 'Diulas oleh', 'ਦੁਆਰਾ ਸਮੀਖਿਆ ਕੀਤੀ ਗਈ', 'மதிப்பாய்வு செய்தது', 'ద్వారా సమీక్షించబడింది', 'Granskats av', 'Sinuri Ni'),
(584, 'submitted_by', 'Submitted By', 'দ্বারা জমা দেওয়া', 'المقدمة من قبل', 'Proposé par', 'द्वारा प्रस्तुत', 'Disampaikan oleh', 'Inviato da', 'Inviato da', '에 의해 제출 된', 'Ingediend door', 'Enviado por', 'ส่งมาโดย', 'Tarafından gönderilmiştir', 'کی طرف سے پیش', '由...所提交', 'Voorgelê deur', 'Eingereicht von', 'Που υποβάλλονται από', 'Presentado por', 'बुझाउने', 'Представленный', 'Indsendt af', 'Ներկայացվել է', 'Მიერ წარმოდგენილი', 'सादर करणारा', 'Dikemukakan oleh', 'ਦੁਆਰਾ ਭੇਜਿਆ', 'சமர்ப்பித்தது', 'సమర్పించిన వారు', 'Insänd av', 'Isinumite ni'),
(585, 'employee_type', 'Employee Type', 'কর্মচারী টাইপ', 'نوع موظف', 'Type d\'employé', 'कर्मचारी का प्रकार', 'Jenis Karyawan', 'Tipo di dipendente', '従業員の種類', '종업원 유형', 'Werknemerstype', 'Tipo de Empregado', 'ประเภทพนักงาน', 'Çalışan tipi', 'ملازم کی قسم', '员工类型', 'Tipe werknemer', 'Mitarbeitertyp', 'Τύπος υπαλλήλου', 'Tipo de empleado', 'कर्मचारी प्रकार', 'Тип сотрудника', 'Medarbejder Type', 'Աշխատակիցների տեսակ', 'თანამშრომლის ტიპი', 'कर्मचार्‍यांचा प्रकार', 'Jenis Pekerja', 'ਕਰਮਚਾਰੀ ਦੀ ਕਿਸਮ', 'பணியாளர் வகை', 'ఉద్యోగుల రకం', 'Arbetstagartyp', 'Uri ng empleyado');
INSERT INTO `languages` (`id`, `word`, `english`, `bengali`, `arabic`, `french`, `hindi`, `indonesian`, `italian`, `japanese`, `korean`, `dutch`, `portuguese`, `thai`, `turkish`, `urdu`, `chinese`, `afrikaans`, `german`, `greek`, `spanish`, `nepali`, `russian`, `danish`, `armenian`, `georgian`, `marathi`, `malay`, `punjabi`, `tamil`, `telugu`, `swedish`, `filipino`) VALUES
(586, 'approved', 'Approved', 'অনুমোদিত', 'وافق', 'Approuvé', 'मंजूर की', 'Disetujui', 'Approvato', '承認済み', '승인 됨', 'aangenomen', 'Aprovado', 'ได้รับการอนุมัติ', 'onaylı', 'منظورشدہ', 'منظورشدہ', 'goedgekeur', 'Genehmigt', 'Εγκρίθηκε', 'Aprobado', 'स्वीकृत', 'Одобренный', 'godkendt', 'Հաստատվել է', 'დამტკიცებულია', 'मंजूर', 'Diluluskan', 'ਮਨਜ਼ੂਰ', 'அங்கீகரிக்கப்பட்டது', 'ఆమోదించబడింది', 'Godkänd', 'Inaprubahan'),
(587, 'unreviewed', 'Unreviewed', 'পর্যালোচনা না করা', 'غير مراجع', 'Non revu', 'समीक्षा नहीं की गई', 'Belum ditinjau', 'unreviewed', '未審査', '검토되지 않은', 'Niet-beoordeelde', 'Não revisado', 'ก่อนสอบทาน', 'İncelenmeyenler', 'ناظر', '未经审核', 'Nie nagegaan nie', 'Nicht überprüft', 'Χωρίς έλεγχο', 'No revisado', 'समीक्षा नगरिएको', 'Непроверенные', 'Ikke gennemgået', 'Չվերանայել', 'დაუოკებელი', 'न पाहिलेले', 'Tidak diulas', 'ਵਿਚਾਰਿਆ ਨਹੀਂ ਗਿਆ', 'மதிப்பாய்வு செய்யப்படவில்லை', 'సమీక్షించించనవి', 'ogranskade', 'Hindi Nasuri'),
(588, 'creation_date', 'Creation Date', 'তৈরির তারিখ', 'تاريخ الإنشاء', 'Creation Date', 'रचना तिथि', 'Tanggal Pembuatan', 'Data di creazione', '作成日', '제작 일', 'Aanmaakdatum', 'Data de criação', 'วันที่สร้าง', 'Oluşturulma tarihi', 'بنانے کی تاریخ', 'بنانے کی تاریخ', 'Skepping Datum', 'Erstellungsdatum', 'Ημερομηνία δημιουργίας', 'Fecha de creación', 'बनाएको मिति', 'Дата создания', 'Oprettelsesdato', 'Ստեղծման ամսաթիվը', 'Შექმნის თარიღი', 'निर्मितीची तारीख', 'Tarikh Penciptaan', 'ਬਣਾਉਣ ਦੀ ਮਿਤੀ', 'உருவாக்கும் தேதி', 'సృష్టి తేదీ', 'Skapelsedagen', 'Petsa ng Paglikha'),
(589, 'no_information_available', 'No Information Available', 'কোন তথ্য নেই', 'لا توجد معلومات متاحة', 'Pas d\'information disponible', 'कोई जानकारी उपलब्ध नहीं', 'Tidak ada informasi tersedia', 'Nessuna informazione disponibile', '情報なし', '정보 없음', 'Geen informatie beschikbaar', 'Nenhuma informação disponível', 'ไม่มีข้อมูล', 'Bilgi bulunmamaktadır', 'کوئی معلومات دستیاب نہیں ہے', '无资料', 'Geen inligting beskikbaar nie', 'Keine Information verfügbar', 'Δεν υπάρχουν διαθέσιμες πληροφορίες', 'No hay información disponible', 'कुनै जानकारी उपलब्ध छैन', 'Нет информации', 'Ingen information tilgængelig', 'Ոչ մի տեղեկություն չկա', 'ინფორმაცია არ არის ხელმისაწვდომი', 'कोणतीही माहिती उपलब्ध नाही', 'Tiada Maklumat', 'ਕੋਈ ਜਾਣਕਾਰੀ ਉਪਲਬਧ ਨਹੀਂ', 'எந்த தகவலும் கிடைக்கவில்லை', 'సమాచారం అందుబాటులో లేదు', 'Ingen information tillgänglig', 'Walang magagamit na impormasyon'),
(590, 'continue_to_payment', 'Continue To Payment', 'পেমেন্ট অবিরত', 'مواصلة الدفع', 'Continuer au paiement', 'भुगतान जारी रखें', 'Fizetés folytatása', 'Continua a pagamento', '支払いを続ける', '계속 지불하기', 'Doorgaan naar betaling', 'Continuar para pagamento', 'ดำเนินการต่อเพื่อชำระเงิน', 'Ödeme devam', 'ادائیگی پر جاری رکھیں', '继续付款', 'Gaan voort na betaling', 'Weiter zur Zahlung', 'Συνέχεια στην πληρωμή', 'Continuar al pago', 'भुक्तान गर्न जारी राख्नुहोस्', 'Продолжить к оплате', 'Fortsæt til betaling', 'Շարունակեք վճարել', 'განაგრძეთ გადახდა', 'देय देणे सुरू ठेवा', 'Terus Ke Pembayaran', 'ਭੁਗਤਾਨ ਕਰਨਾ ਜਾਰੀ ਰੱਖੋ', 'பணம் செலுத்துவதைத் தொடரவும்', 'చెల్లింపు కొనసాగించండి', 'Fortsätt till betalning', 'Magpatuloy Sa Pagbabayad'),
(591, 'overtime_total_hour', 'Overtime Total Hour', 'ওভারটাইম মোট ঘন্টা', 'الساعة الاجمالية', 'Heures totales supplémentaires', 'ओवरटाइम कुल घंटे', 'Túlóra Teljes óra', 'Ora totale straordinario', '残業総時間', '초과 근무 시간', 'Overuren Totaal uur', 'Horas Totais de Horas Extras', 'ชั่วโมงทำงานทั้งหมด', 'Fazla Mesai Toplam Saati', 'عموما کل وقت', '加班总时数', 'Oortyd totale uur', 'Überstunden Gesamtstunde', 'Συνολική ώρα υπερωρίας', 'Horas extra horas totales', 'ओभरटाइम कुल घण्टा', 'Сверхурочные всего часа', 'Overtid i alt time', 'Արտաժամյա ընդհանուր ժամ', 'ზეგანაკვეთური სულ საათი', 'ओव्हरटाइम एकूण तास', 'Jumlah Jam Lebih Masa', 'ਓਵਰਟਾਈਮ ਕੁੱਲ ਘੰਟਾ', 'கூடுதல் நேரம் மொத்த நேரம்', 'ఓవర్ టైం మొత్తం గంట', 'Övertid total timme', 'Overtime Total Oras'),
(592, 'overtime_amount', 'Overtime Amount', 'ওভারটাইম পরিমাণ', 'مبلغ العمل الإضافي', 'Heures supplémentaires', 'ओवरटाइम राशि', 'Jumlah Lembur', 'Quantità Overtime', '残業金額', '초과 근무 시간', 'Overwerkbedrag', 'Overwerkbedrag', 'ปริมาณการทำงานล่วงเวลา', 'Fazla Mesai Tutarı', 'عموما رقم', '加班金额', 'Oortydbedrag', 'Überstundenbetrag', 'Ποσό υπερωριών', 'Cantidad de horas extras', 'ओभरटाइम रकम', 'Сумма сверхурочных', 'Overtidsbeløb', 'Արտաժամյա գումարը', 'ზეგანაკვეთური თანხა', 'ओव्हरटाइम रक्कम', 'Jumlah Lebih Masa', 'ਓਵਰਟਾਈਮ ਰਕਮ', 'மேலதிக நேரம்', 'ఓవర్ టైం మొత్తం', 'Övertidsbelopp', 'Halaga ng Panahon'),
(593, 'remarks', 'Remarks', 'মন্তব্য', 'تعليق', 'Remarque', 'टिप्पणी', 'Ucapan', 'Ucapan', 'Ucapan', '말', 'Opmerking', 'Opmerking', 'Opmerking', 'Opmerking', 'تبصرہ', '备注', 'opmerkings', 'Bemerkungen', 'Παρατηρήσεις', 'Observaciones', 'टिप्पणीहरू', 'замечания', 'Bemærkninger', 'Նկատառումներ', 'შენიშვნები', 'टीका', 'Kenyataan', 'ਟਿੱਪਣੀਆਂ', 'குறிப்புகள்', 'వ్యాఖ్యలు', 'Anmärkningar', 'Mga Pangungusap'),
(594, 'view', 'View', 'দৃশ্য', 'رأي', 'Vue', 'राय', 'Melihat', 'vista', '見る', '전망', 'Uitzicht', 'Visão', 'ดู', 'Görünüm', 'دیکھیں', '视图', 'Beskou', 'Aussicht', 'Θέα', 'Ver', 'हेर्नुहोस्', 'Посмотреть', 'Udsigt', 'Տեսարան', 'ხედი', 'पहा', 'Pandangan', 'ਵੇਖੋ', 'காண்க', 'చూడండి', 'Se', 'Tingnan'),
(595, 'leave_appeal', 'Leave Appeal', 'আবেদন ছেড়ে', 'اترك الاستئناف', 'Laisser appel', 'अपील छोड़ दो', 'Tinggalkan Banding', 'Invia Appello', 'アピールを残す', '상소를 떠나다', 'Verlaat Appeal', 'Deixar recurso', 'ออกจากการอุทธรณ์', 'Temyizden Ayrılmak', 'اپیل چھوڑ دو', '离开上诉', 'Laat appèl', 'Berufung einlegen', 'Αφήστε την ένσταση', 'Dejar apelación', 'अपील छोड्नुहोस्', 'Оставьте Обращение', 'Forlad appel', 'Թողեք բողոքարկումը', 'დატოვე საჩივარი', 'अपील सोडा', 'Tinggalkan Rayuan', 'ਅਪੀਲ ਛੱਡੋ', 'மேல்முறையீட்டை விடுங்கள்', 'అప్పీల్ వదిలి', 'Lämna överklagandet', 'Iwanan ang Pag-apela'),
(596, 'create_leave', 'Create Leave', 'ছুটি তৈরি করুন', 'خلق إجازة', 'Créer un congé', 'छुट्टी बनाएँ', 'Buat Cuti', 'Crea permesso', '休暇を作成', '떠나기 만들기', 'Maak verlof', 'Criar licença', 'สร้างการลา', 'İzin Oluştur', 'چھوڑ دو', '创造假', 'Skep verlof', 'Urlaub erstellen', 'Δημιουργία άδειας', 'Crear licencia', 'छोड्नुहोस् सिर्जना गर्नुहोस्', 'Создать отпуск', 'Opret orlov', 'Ստեղծեք Թողնել', 'Leave Leave', 'रजा तयार करा', 'Buat Cuti', 'ਛੁੱਟੀ ਬਣਾਓ', 'விடுப்பு உருவாக்கவும்', 'సెలవు సృష్టించండి', 'Skapa ledighet', 'Lumikha ng Iwanan'),
(597, 'user_role', 'User Role', 'ব্যবহারকারী ভূমিকা', 'دور المستخدم', 'Rôle de l\'utilisateur', 'उपयोगकर्ता भूमिका', 'Peran pengguna', 'Ruolo utente', 'ユーザー役割', '사용자 역할', 'Gebruikersrol', 'Papel do usuário', 'บทบาทของผู้ใช้', 'Kullanıcı rolü', 'صارف کردار', '用户角色', 'Gebruikersrol', 'Benutzer-Rolle', 'Ρόλος χρήστη', 'Rol del usuario', 'प्रयोगकर्ताको भूमिका', 'Роль пользователя', 'Brugerrolle', 'Օգտագործողի դերը', 'მომხმარებლის როლი', 'वापरकर्त्याची भूमिका', 'Peranan Pengguna', 'ਉਪਭੋਗਤਾ ਦੀ ਭੂਮਿਕਾ', 'பயனர் பங்கு', 'వినియోగదారు పాత్ర', 'Användarroll', 'Role ng Gumagamit'),
(598, 'date_of_start', 'Date Of Start', 'শুরু তারিখ', 'تاريخ البدء', 'Date de début', 'प्रारंभ की तिथि', 'Tanggal Mulai', 'Data di inizio', '開始日', '시작 날짜', 'Startdatum', 'Data de início', 'วันที่เริ่ม', 'Başlangıç ​​tarihi', 'آغاز کی تاریخ', '开始日期', 'Datum van begin', 'Datum des Starts', 'Ημερομηνία έναρξης', 'Fecha de inicio', 'सुरुको मिति', 'Дата начала', 'Dato for start', 'Սկսման ամսաթիվը', 'დაწყების თარიღი', 'प्रारंभ तारीख', 'Tarikh Mula', 'ਸ਼ੁਰੂ ਹੋਣ ਦੀ ਮਿਤੀ', 'தொடக்க தேதி', 'ప్రారంభ తేదీ', 'Startdatum', 'Petsa ng Simula'),
(599, 'date_of_end', 'Date Of End', 'শেষ তারিখ', 'تاريخ النهاية', 'Date de fin', 'समाप्ति की तारीख', 'Tanggal Berakhir', 'Data della fine', '終了日', '끝 날짜', 'Datum van einde', 'Data do fim', 'วันที่สิ้นสุด', 'Bitiş Tarihi', 'اختتام کی تاریخ', '结束日期', 'Datum van einde', 'Datum des Endes', 'Ημερομηνία λήξης', 'Fecha de finalización', 'अन्त्य मिति', 'Дата окончания', 'Date Of End', 'Վերջի ամսաթիվը', 'დასრულების თარიღი', 'समाप्तीची तारीख', 'Tarikh Tamat', 'ਅੰਤ ਦੀ ਮਿਤੀ', 'முடிவு தேதி', 'ముగింపు తేదీ', 'Datum för slut', 'Petsa ng Pagtatapos'),
(600, 'winner', 'Winner', 'বিজয়ী', 'الفائز', 'Gagnantविजेता', 'विजेता', 'Pemenang', 'Vincitore', '勝者', '우승자', 'Winnaar', 'Vencedora', 'ผู้ชนะ', 'kazanan', 'فاتح', '优胜者', 'wenner', 'Gewinner', 'Νικητής', 'Ganador', 'विजेता', 'победитель', 'Vinder', 'Հաղթող', 'გამარჯვებული', 'विजेता', 'Pemenang', 'ਜੇਤੂ', 'வெற்றி', 'విజేత', 'Vinnare', 'Nagwagi'),
(601, 'select_user', 'Select User', 'ব্যবহারকারী নির্বাচন করুন', 'اختر المستخدم', 'Sélectionnez un utilisateur', 'उपयोगकर्ता का चयन करें', 'Pilih Pengguna', 'Seleziona utente', 'ユーザーを選択', '사용자 선택', 'selecteer gebruiker', 'Selecione o usuário', 'เลือกผู้ใช้', 'Kullanıcı seç', 'صارف منتخب کریں', '选择用户', 'Kies Gebruiker', 'Wähle den Benutzer', 'Επιλέξτε Χρήστη', 'Seleccionar usuario', 'प्रयोगकर्ता चयन गर्नुहोस्', 'Выберите пользователя', 'Vælg Bruger', 'Ընտրեք Օգտագործողը', 'აირჩიეთ მომხმარებელი', 'वापरकर्ता निवडा', 'Pilih Pengguna', 'ਉਪਯੋਗਕਰਤਾ ਚੁਣੋ', 'பயனரைத் தேர்ந்தெடுக்கவும்', 'వినియోగదారుని ఎంచుకోండి', 'Välj Användare', 'Piliin ang Gumagamit'),
(602, 'create_class', 'Create Class', 'ক্লাস তৈরি করুন', 'إنشاء فصل دراسي', 'Créer une classe', 'क्लास बनाएं', 'Buat Kelas', 'Crea classe', 'クラスを作成', '수업 만들기', 'Klasse maken', 'Criar classe', 'สร้างคลาส', 'Sınıf Oluştur', 'کلاس بنائیں', '建立课程', 'Skep klas', 'Klasse erstellen', 'Δημιουργία τάξης', 'Crear clase', 'कक्षा सिर्जना गर्नुहोस्', 'Создать класс', 'Opret klasse', 'Ստեղծեք դաս', 'შექმნა კლასი', 'वर्ग तयार करा', 'Buat Kelas', 'ਕਲਾਸ ਬਣਾਓ', 'வகுப்பை உருவாக்கவும்', 'తరగతి సృష్టించండి', 'Skapa klass', 'Lumikha ng Klase'),
(603, 'class_teacher_allocation', 'Class Teacher Allocation', 'ক্লাস শিক্ষক বরাদ্দ', 'تخصيص معلم الصف', 'Affectation des enseignants de classe', 'कक्षा शिक्षक आवंटन', 'Alokasi Guru Kelas', 'Allocazione degli insegnanti di classe', 'クラス教師の割り当て', '수업 교사 할당', 'Toewijzing van klassenleraren', 'Alocação de professores de turma', 'การจัดสรรครูประจำชั้น', 'Sınıf Öğretmeni Tahsisi', 'کلاس ٹیچر الاٹ', '班主任分配', 'Toekenning van klasonderwysers', 'Zuweisung von Klassenlehrern', 'Κατανομή καθηγητών τάξης', 'Asignación de maestro de clase', 'कक्षा शिक्षक विनियोजन', 'Класс Учитель Распределение', 'Klassetildeling', 'Դասարանի ուսուցիչների հատկացում', 'კლასის მასწავლებელი გამოყოფა', 'वर्ग शिक्षक वाटप', 'Peruntukan Guru Kelas', 'ਕਲਾਸ ਅਧਿਆਪਕ ਅਲਾਟਮੈਂਟ', 'வகுப்பு ஆசிரியர் ஒதுக்கீடு', 'తరగతి ఉపాధ్యాయ కేటాయింపు', 'Klasslärarallokering', 'Paglalaan ng Guro sa Klase'),
(604, 'class_teacher', 'Class Teacher', 'শ্রেণী শিক্ষক', 'معلم الصف', 'Professeur de classe', 'कक्षा अध्यापक', 'Guru kelas', 'Insegnante', 'クラスの先生', '수업 교사', 'Klassen leraar', 'Professor da classe', 'ครูประจำชั้น', 'Sınıf öğretmeni', 'کلاس ٹیچر', '班主任', 'Klasonderwyser', 'Klassenlehrer', 'Δάσκαλος τάξης', 'Profesor de la clase', 'कक्षा शिक्षक', 'Учитель класса', 'Klasselærer', 'Դասարանի ուսուցիչ', 'Კლასის მასწავლებელი', 'वर्ग शिक्षक', 'Guru kelas', 'ਕਲਾਸ ਅਧਿਆਪਕ', 'வகுப்பாசிரியர்', 'తరగతి ఉపాధ్యాయుడు', 'Klasslärare', 'Guro sa Klase'),
(605, 'create_subject', 'Create Subject', 'সাবজেক্ট তৈরি করুন', 'إنشاء موضوع', 'Créer un sujet', 'विषय बनाएँ', 'Buat Subjek', 'Crea soggetto', '件名を作成', '주제 만들기', 'Onderwerp maken', 'Criar assunto', 'สร้างหัวเรื่อง', 'Konu Oluştur', 'سبجیکٹ بنائیں', '创建主题', 'Skep onderwerp', 'Betreff erstellen', 'Δημιουργία θέματος', 'Crear asunto', 'विषय सिर्जना गर्नुहोस्', 'Создать тему', 'Opret emne', 'Ստեղծել առարկա', 'შექმენით თემატიკა', 'विषय तयार करा', 'Buat Subjek', 'ਵਿਸ਼ਾ ਬਣਾਓ', 'பொருள் உருவாக்க', 'విషయాన్ని సృష్టించండి', 'Skapa ämne', 'Lumikha ng Paksa'),
(606, 'select_multiple_subject', 'Select Multiple Subject', 'একাধিক বিষয় নির্বাচন করুন', 'حدد موضوعًا متعددًا', 'Sélectionnez plusieurs sujets', 'एकाधिक विषय का चयन करें', 'Pilih Banyak Subjek', 'Seleziona soggetto multiplo', '複数の主題を選択', '여러 주제 선택', 'Selecteer Meerdere onderwerpen', 'Выберите несколько объектов', 'เลือกหลายวิชา', 'Birden Çok Konu Seçin', 'ایک سے زیادہ مضمون منتخب کریں', '选择多个主题', 'Kies meervoudige onderwerp', 'Wählen Sie Mehrere Betreffs', 'Επιλέξτε Πολλαπλά Θέματα', 'Seleccionar tema múltiple', 'बहु विषय चयन गर्नुहोस्', 'Выберите несколько объектов', 'Vælg Flere emner', 'Ընտրեք բազմակի առարկա', 'აირჩიეთ მრავალჯერადი საგანი', 'एकाधिक विषय निवडा', 'Pilih Pelbagai Subjek', 'ਮਲਟੀਪਲ ਵਿਸ਼ਾ ਚੁਣੋ', 'பல விஷயங்களைத் தேர்ந்தெடுக்கவும்', 'బహుళ విషయాన్ని ఎంచుకోండి', 'Välj flera ämnen', 'Piliin ang Maramihang Paksa'),
(607, 'teacher_assign', 'Teacher Assign', 'শিক্ষক নিয়োগ', 'تعيين المعلم', 'Affectation des enseignants', 'शिक्षक का पदभार', 'Tugas Guru', 'Insegnante Assegna', '教師の割り当て', '교사 할당', 'Leraar toewijzen', 'Atribuição de professor', 'ครูมอบหมาย', 'Öğretmen Atama', 'ٹیچر تفویض کریں', '老师分配', 'Onderwyseropdrag', 'Lehrer zuweisen', 'Δάσκαλος ανάθεση', 'Asignación de maestro', 'शिक्षक तोक्नुहोस्', 'Назначить учителя', 'Lærertildeling', 'Ուսուցիչ', 'მასწავლებლის დავალება', 'शिक्षक नियुक्त', 'Tugasan Guru', 'ਅਧਿਆਪਕ ਨਿਰਧਾਰਤ', 'ஆசிரியர் ஒதுக்கு', 'టీచర్ అసైన్', 'Läraruppdrag', 'Takdang Guro'),
(608, 'teacher_assign_list', 'Teacher Assign List', 'শিক্ষক নিয়োগ তালিকা', 'قائمة تعيين المعلم', 'Liste d\'affectation des enseignants', 'शिक्षक असाइनमेंट सूची', 'Daftar Tugas Guru', 'Elenco di assegnazione dell&#39;insegnante', '教師割り当てリスト', '교사 과제 목록', 'Lijst met toegewezen docenten', 'Lista de Atribuições do Professor', 'รายการมอบหมายของครู', 'Öğretmen Atama Listesi', 'اساتذہ کی تفویض کی فہرست', '教师分配清单', 'Onderwyser-toewysingslys', 'Lehrerzuweisungsliste', 'Λίστα ανάθεσης καθηγητών', 'Lista de asignación de maestros', 'शिक्षक नियुक्ति सूची', 'Список назначенных учителей', 'Liste over lærertildeling', 'Ուսուցիչների հանձնման ցուցակ', 'მასწავლებელთა დავალებების სია', 'शिक्षक नियुक्त यादी', 'Senarai Tugasan Guru', 'ਅਧਿਆਪਕ ਨਿਰਧਾਰਤ ਸੂਚੀ', 'ஆசிரியர் ஒதுக்கீட்டு பட்டியல்', 'టీచర్ అసైన్ లిస్ట్', 'Lista över lärare', 'Listahan ng Magturo ng Guro'),
(609, 'select_department_first', 'Select Department First', 'প্রথম বিভাগ নির্বাচন করুন', 'حدد القسم أولاً', 'Sélectionnez d\'abord le département', 'पहले विभाग का चयन करें', 'Pilih Departemen Pertama', 'Seleziona prima il dipartimento', '最初に部門を選択', '부서를 먼저 선택하십시오', 'Selecteer eerst Afdeling', 'Selecione o departamento primeiro', 'เลือกแผนกก่อน', 'Önce Bölüm Seçin', 'سب سے پہلے محکمہ منتخب کریں', '选择部门优先', 'Kies Departement eerste', 'Wählen Sie zuerst Abteilung', 'Επιλέξτε πρώτα τμήμα', 'Seleccione el departamento primero', 'विभाग पहिले चयन गर्नुहोस्', 'Сначала выберите отдел', 'Vælg afdeling først', 'Ընտրեք բաժին առաջինը', 'აირჩიეთ დეპარტამენტი პირველი', 'प्रथम विभाग निवडा', 'Pilih Jabatan Pertama', 'ਪਹਿਲਾਂ ਵਿਭਾਗ ਦੀ ਚੋਣ ਕਰੋ', 'முதலில் துறையைத் தேர்ந்தெடுக்கவும்', 'మొదట విభాగాన్ని ఎంచుకోండి', 'Välj avdelning först', 'Piliin muna ang Kagawaran'),
(610, 'create_book', 'Create Book', 'বই তৈরি করুন', 'إنشاء كتاب', 'Créer un livre', 'पुस्तक बनाएँ', 'Buat Buku', 'Crea libro', 'ブックを作成', '책 만들기', 'Boek maken', 'Criar livro', 'สร้างหนังสือ', 'Kitap Oluştur', 'کتاب بنائیں', '建立书籍', 'Skep boek', 'Buch erstellen', 'Δημιουργία βιβλίου', 'Crear libro', 'पुस्तक सिर्जना गर्नुहोस्', 'Создать книгу', 'Opret bog', 'Ստեղծեք գիրք', 'წიგნის შექმნა', 'पुस्तक तयार करा', 'Buat Buku', 'ਕਿਤਾਬ ਬਣਾਓ', 'புத்தகத்தை உருவாக்கவும்', 'పుస్తకాన్ని సృష్టించండి', 'Skapa bok', 'Lumikha ng Aklat'),
(611, 'book_title', 'Book Title', 'বইয়ের শিরোনাম', 'عنوان كتاب', 'Titre de livre', 'पुस्तक का शीर्षक', 'Judul buku', 'Titolo del libro', '書名', '책 제목', 'Boek titel', 'Título do livro', 'ชื่อหนังสือ', 'Kitap başlığı', 'کتاب کا عنوان', '书名', 'Boektitel', 'Buchtitel', 'Τίτλος βιβλίου', 'Titulo del libro', 'पुस्तक शीर्षक', 'Заголовок книги', 'Bogtitel', 'Գրքի վերնագիր', 'Წიგნის სათაური', 'पुस्तकाचे शीर्षक', 'Tajuk buku', 'ਕਿਤਾਬ ਦਾ ਸਿਰਲੇਖ', 'புத்தக தலைப்பு', 'పుస్తకం పేరు', 'Boktitel', 'Pamagat ng Libro'),
(612, 'cover', 'Cover', 'আবরণ', 'التغطية', 'Couverture', 'आवरण', 'Penutup', 'Copertina', 'カバー', '덮개', 'Hoes', 'tampa', 'ปก', 'Örtmek', 'ڈھانپیں', '覆盖', 'Cover', 'Startseite', 'Κάλυμμα', 'Cubrir', 'कभर', 'Обложка', 'Dække over', 'Ծածկոց', 'Საფარი', 'कव्हर', 'Tutup', 'ਕਵਰ', 'கவர்', 'కవర్', 'Omslag', 'Takip'),
(613, 'edition', 'Edition', 'সংস্করণ', 'الإصدار', 'Édition', 'संस्करण', 'Edisi', 'Edizione', '版', '판', 'Editie', 'Edição', 'ฉบับ', 'Baskı', 'ایڈیشن', '版', 'uitgawe', 'Auflage', 'Εκδοση', 'Edición', 'संस्करण', 'Издание', 'Edition', 'Հրատարակություն', 'გამოცემა', 'संस्करण', 'Edisi', 'ਐਡੀਸ਼ਨ', 'பதிப்பு', 'ఎడిషన్', 'Utgåva', 'Edisyon'),
(614, 'isbn_no', 'ISBN No', 'আইএসবিএন নং', 'رقم ISBN', 'ISBN Non', 'आईएसबीएन सं', 'ISBN No', 'Codice ISBN', 'ISBN No', 'ISBN No', 'ISBN nr', 'Isbn No', 'ไอไม่มี', 'ISBN Hayır', 'آئی ایس بی این نمبر', '书号', 'ISBN-nr', 'ISBN-Nr', 'Αριθμός ISBN', 'ISBN no', 'ISBN छैन', 'ISBN Нет', 'ISBN-nr', 'ISBN ոչ', 'ISBN არა', 'आयएसबीएन नं', 'ISBN No.', 'ਆਈਐਸਬੀਐਨ ਨੰ', 'ஐ.எஸ்.பி.என் எண்', 'ISBN నం', 'ISBN-nr', 'ISBN Hindi'),
(615, 'purchase_date', 'Purchase Date', 'ক্রয় তারিখ', 'تاريخ الشراء', 'Purchase Date', 'खरीद की तारीख', 'Tanggal Pembelian', 'Data di acquisto', '購入日', '구입 날짜', 'aankoopdatum', 'data de compra', 'วันที่ซื้อ', 'Satınalma tarihi', 'خریداری کی تاریخ', '购买日期', 'Aankoop datum', 'Kaufdatum', 'Ημερομηνία αγοράς', 'Fecha de compra', 'खरिद मिति', 'Дата покупки', 'Købsdato', 'Գնման ամսաթիվը', 'შეძენის თარიღი', 'खरेदी दिनांक', 'Tarikh Pembelian', 'ਖਰੀਦਣ ਦੀ ਮਿਤੀ', 'கொள்முதல் தேதி', 'కొనిన తేదీ', 'inköpsdatum', 'Petsa ng Pagbili'),
(616, 'cover_image', 'Cover Image', 'চিত্র কভার', 'صورة الغلاف', 'Cover Image', 'कवर छवि', 'Gambar sampul', 'Immagine di copertina', '表紙画像', '표지 이미지', 'Omslagfoto', 'Imagem de capa', 'รูปภาพหน้าปก', 'Kapak resmi', 'تصویر کو ڈھانپیں', '封面图片', 'Voorbladfoto', 'Titelbild', 'Εικόνα εξωφύλλου', 'Imagen de portada', 'आवरण छवि', 'Изображение обложки', 'Forsidebillede', 'Կազմի պատկեր', 'გარეკანის გამოსახულება', 'कव्हर प्रतिमा', 'Gambar Sampul', 'ਚਿੱਤਰ ਨੂੰ Coverੱਕੋ', 'அட்டைப் படம்', 'కవర్ చిత్రం', 'Omslagsbild', 'Takip ng Larawan'),
(617, 'book_issue', 'Book Issue', 'বই ইস্যু', 'إصدار الكتاب', 'Numéro de livre', 'पुस्तक का अंक', 'Masalah Buku', 'Edizione del libro', '本の発行', '도서 발행', 'Boeknummer', 'Edição do livro', 'ปัญหาหนังสือ', 'Kitap Sayısı', 'کتاب کا شمارہ', '图书发行', 'Boekuitgawe', 'Buchausgabe', 'Έκδοση βιβλίου', 'Edición del libro', 'पुस्तक मुद्दा', 'Выпуск книги', 'Bogudgave', 'Գրքի թողարկում', 'წიგნის გამოცემა', 'पुस्तक अंक', 'Isu Buku', 'ਕਿਤਾਬ ਦਾ ਮੁੱਦਾ', 'புத்தக வெளியீடு', 'పుస్తక సంచిక', 'Bokutgåva', 'Isyu ng Aklat'),
(618, 'date_of_issue', 'Date Of Issue', 'প্রদান এর তারিখ', 'تاريخ المسألة', 'Date d&#39;Emission', 'जारी करने की तारिख', 'Tanggal pengeluaran', 'Data di emissione', '発行日', '발행일', 'Uitgavedatum', 'Data de emissão', 'วันที่ออก', 'Veriliş tarihi', 'تاریخ اجراء', '发行日期', 'Datum van uitreiking', 'Ausgabedatum', 'Ημερομηνία έκδοσης', 'Fecha de emisión', 'जारी मिति', 'Дата выдачи', 'Udstedelsesdato', 'Թողարկման ամսաթիվը', 'Გაცემის თარიღი', 'जारी करण्याची तारीख', 'Tarikh dikeluarkan', 'ਜਾਰੀ ਕਰਣ ਦੀ ਤਾਰੀਖ', 'வெளியீட்டு தேதி', 'జారీ చేసిన తేది', 'Utgivningsdatum', 'Petsa ng isyu'),
(619, 'date_of_expiry', 'Date Of Expiry', 'মেয়াদ শেষ হওয়ার তারিখ', 'تاريخ الانتهاء', 'Date d\'expiration', 'समाप्ति तिथि', 'Tanggal Kadaluarsa', 'Data di scadenza', '有効期限', '만료일', 'Vervaldatum', 'Data de validade', 'วันหมดอายุ', 'Son kullanma tarihi', 'خاتمے کی تاریخ', '到期日期', 'Vervaldatum', 'Haltbarkeitsdatum', 'Ημερομηνία Λήξης', 'Fecha de expiración', 'म्याद सकिने दिन', 'Дата истечения срока', 'Udløbsdato', 'Ավարտման ամսաթիվը', 'Ვადა', 'कालबाह्य होण्याची तारीख', 'Tarikh luput', 'ਸਮਾਪਣ ਮਿਤੀ', 'காலாவதி தேதி', 'గడువు తేదీ', 'Utgångsdatum', 'Petsa ng Pag-expire'),
(620, 'select_category_first', 'Select Category First', 'প্রথম বিভাগ নির্বাচন করুন', 'حدد الفئة الأولى', 'Sélectionnez d\'abord la catégorie', 'श्रेणी पहले का चयन करें', 'Pilih Kategori Pertama', 'Seleziona prima la categoria', '最初にカテゴリを選択', '먼저 카테고리를 선택하십시오', 'Selecteer eerst categorie', 'Selecione a categoria primeiro', 'เลือกหมวดหมู่ก่อน', 'Önce Kategori Seçin', 'پہلے زمرہ منتخب کریں', '选择类别优先', 'Kies Kategorie eerstens', 'Wählen Sie zuerst Kategorie', 'Επιλέξτε Πρώτη κατηγορία', 'Seleccione categoría primero', 'कोटी पहिलो चयन गर्नुहोस्', 'Сначала выберите категорию', 'Vælg kategori først', 'Ընտրեք Առաջին կարգը', 'აირჩიეთ კატეგორია პირველი', 'प्रथम श्रेणी निवडा', 'Pilih Kategori Pertama', 'ਸ਼੍ਰੇਣੀ ਪਹਿਲਾਂ ਚੁਣੋ', 'முதலில் வகையைத் தேர்ந்தெடுக்கவும்', 'మొదట వర్గాన్ని ఎంచుకోండి', 'Välj kategori först', 'Piliin muna ang Category'),
(621, 'type_name', 'Type Name', 'নাম টাইপ করুন', 'أكتب اسم', 'Nom du type', 'नाम लिखो', 'Ketik nama', 'Digitare il nome', 'タイプ名', '타입 이름', 'Typ naam', 'Digite o nome', 'พิมพ์ชื่อ', 'Tür Adı', 'ٹائپ کا نام', '类型名称', 'Tik Naam', 'Modellname', 'Πληκτρολογήστε Όνομα', 'Escribe un nombre', 'नाम टाइप गर्नुहोस्', 'Введите имя', 'Type Navn', 'Տեսակը Անունը', 'ტიპის სახელი', 'नाव टाइप करा', 'Taipkan Nama', 'ਕਿਸਮ ਦਾ ਨਾਮ', 'பெயர் தட்டச்சு செய்க', 'పేరు టైప్ చేయండి', 'Skriv namn', 'Uri ng Pangalan'),
(622, 'type_list', 'Type List', 'প্রকারের তালিকা', 'قائمة الأنواع', 'Liste des types', 'सूची टाइप करें', 'Daftar Jenis', 'Elenco dei tipi', 'タイプリスト', '타입리스트', 'Type Lijst', 'Lista de tipos', 'รายการประเภท', 'Tür Listesi', 'ٹائپ لسٹ', '类型清单', 'Tipe lys', 'Typ Liste', 'Τύπος λίστας', 'Lista de tipos', 'प्रकार सूची', 'Тип Список', 'Type liste', 'Տեսակների ցուցակ', 'ტიპის სია', 'प्रकार यादी', 'Senarai Jenis', 'ਕਿਸਮ ਦੀ ਸੂਚੀ', 'வகை பட்டியல்', 'టైప్ జాబితా', 'Typlista', 'Listahan ng Uri'),
(623, 'icon', 'Icon', 'আইকন', 'أيقونة', 'Icône', 'चिह्न', 'Ikon', 'Icona', 'アイコン', '상', 'Icoon', 'Ícone', 'ไอคอน', 'Icon', 'شبیہہ', '图标', 'ikoon', 'Symbol', 'Εικόνισμα', 'Icono', 'आइकन', 'Значок', 'Ikon', 'Պատկերակ', 'Ხატი', 'चिन्ह', 'Ikon', 'ਆਈਕਾਨ', 'ஐகான்', 'ఐకాన్', 'Ikon', 'Icon'),
(624, 'event_list', 'Event List', 'ইভেন্ট তালিকা', 'قائمة الأحداث', 'Liste des événements', 'घटना सूची', 'Daftar Acara', 'Elenco degli eventi', 'イベント一覧', '이벤트리스트', 'Evenementenlijst', 'Lista de evento', 'รายการกิจกรรม', 'Etkinlik Listesi', 'واقعہ کی فہرست', '活动列表', 'Gebeurtenislys', 'Veranstaltungsliste', 'Λίστα εκδηλώσεων', 'Lista de eventos', 'कार्यक्रम सूची', 'Список событий', 'Begivenhedsliste', 'Իրադարձությունների ցուցակ', 'ღონისძიების სია', 'कार्यक्रम यादी', 'Senarai Acara', 'ਘਟਨਾ ਦੀ ਸੂਚੀ', 'நிகழ்வு பட்டியல்', 'ఈవెంట్ జాబితా', 'Händelselista', 'Listahan ng Kaganapan'),
(625, 'create_event', 'Create Event', 'ইভেন্ট তৈরি করা', 'انشاء حدث', 'Créer un évènement', 'कार्यक्रम बनाएँ', 'Membuat acara', 'Crea Evento', 'イベントを作成', '이벤트 만들기', 'Maak evenement aan', 'Criar Evento', 'สร้างกิจกรรม', 'Etkinlik oluşturmak', 'واقعہ بنائیں', '建立活动', 'Skep geleentheid', 'Ereignis erstellen', 'Δημιουργία εκδήλωσης', 'Crear evento', 'घटना सिर्जना गर्नुहोस्', 'Создать событие', 'Opret begivenhed', 'Ստեղծել իրադարձություն', 'ღონისძიების შექმნა', 'कार्यक्रम तयार करा', 'Buat Acara', 'ਈਵੈਂਟ ਬਣਾਓ', 'நிகழ்வை உருவாக்கவும்', 'ఈవెంట్‌ను సృష్టించండి', 'Skapa händelse', 'Lumikha ng Kaganapan'),
(626, 'type', 'Type', 'আদর্শ', 'نوع', 'Type', 'प्रकार', 'Tipe', 'genere', 'タイプ', '유형', 'Type', 'Tipo', 'ชนิด', 'tip', 'ٹائپ کریں', '类型', 'tipe', 'Art', 'Τύπος', 'Tipo', 'प्रकार', 'Тип', 'Type', 'Տիպ', 'ტიპი', 'प्रकार', 'Jenis', 'ਕਿਸਮ', 'வகை', 'రకం', 'Typ', 'Uri'),
(627, 'audience', 'Audience', 'শ্রোতা', 'الجمهور', 'Audience', 'दर्शक', 'Hadirin', 'Pubblico', '観客', '청중', 'Publiek', 'Público', 'ผู้ชม', 'seyirci', 'سامعین', '听众', 'gehoor', 'Publikum', 'Κοινό', 'Audiencia', 'दर्शक', 'Зрительская аудитория', 'Publikum', 'Հանդիսատես', 'აუდიტორია', 'प्रेक्षक', 'Penonton', 'ਹਾਜ਼ਰੀਨ', 'பார்வையாளர்கள்', 'ప్రేక్షకులు', 'Publik', 'audience'),
(628, 'created_by', 'Created By', 'দ্বারা সৃষ্টি', 'انشأ من قبل', 'Créé par', 'के द्वारा बनाई गई', 'Dibuat oleh', 'Creato da', 'によって作成された', '작성자', 'Gemaakt door', 'Criado por', 'สร้างโดย', 'Tarafından yaratıldı', 'بنائی گئی', '由...制作', 'Gemaak deur', 'Erstellt von', 'Δημιουργήθηκε από', 'Creado por', 'द्वारा बनाईएको', 'Создан', 'Lavet af', 'Ստեղծվել է', 'Შექმნილია მიერ', 'ने निर्मित', 'Dicipta oleh', 'ਦੁਆਰਾ ਬਣਾਇਆ ਗਿਆ', 'உருவாக்கியது', 'సృష్టికర్త', 'Skapad av', 'Ginawa ni'),
(629, 'publish', 'Publish', 'প্রকাশ করা', 'ينشر', 'Publier', 'प्रकाशित करना', 'Menerbitkan', 'Pubblicare', '公開する', '게시', 'Publiceren', 'Publicar', 'ประกาศ', 'Yayınla', 'شائع کریں', '发布', 'publiseer', 'Veröffentlichen', 'Δημοσιεύω', 'Publicar', 'प्रकाशित गर्नुहोस्', 'Публиковать', 'Offentliggøre', 'Հրապարակել', 'გამოქვეყნება', 'प्रकाशित करा', 'Menerbitkan', 'ਪਬਲਿਸ਼', 'வெளியிடு', 'ప్రచురించు', 'Publicera', 'I-publish'),
(630, 'everybody', 'Everybody', 'সবাই', 'الجميع', 'Tout le monde', 'हर', 'Semua orang', 'Tutti', 'みんな', '각자 모두', 'Iedereen', 'Todo o mundo', 'ทุกคน', 'herkes', 'ہر ایک', '每个人', 'almal', 'Jeder', 'Ολοι', 'Todos', 'सबैजना', 'все', 'Alle', 'Բոլորը', 'ყველას', 'सगळे', 'Semua orang', 'ਹਰ ਕੋਈ', 'எல்லோரும்', 'అందరూ', 'Alla', 'Lahat ng tao'),
(631, 'selected_class', 'Selected Class', 'নির্বাচিত ক্লাস', 'فئة مختارة', 'Classe sélectionnée', 'चयनित वर्ग', 'Kelas yang Dipilih', 'Classe selezionata', '選択したクラス', '선택된 클래스', 'Geselecteerde klasse', 'Classe Selecionada', 'คลาสที่เลือก', 'Seçilmiş Sınıf', 'منتخب کلاس', '选班', 'Geselekteerde klas', 'Ausgewählte Klasse', 'Επιλεγμένη τάξη', 'Clase seleccionada', 'चयनित वर्ग', 'Выбранный класс', 'Valgt klasse', 'Ընտրված դաս', 'არჩეული კლასი', 'निवडलेला वर्ग', 'Kelas Terpilih', 'ਚੁਣੀ ਕਲਾਸ', 'தேர்ந்தெடுக்கப்பட்ட வகுப்பு', 'ఎంచుకున్న తరగతి', 'Vald klass', 'Napiling Klase'),
(632, 'selected_section', 'Selected Section', 'নির্বাচিত বিভাগ', 'القسم المختار', 'Section sélectionnée', 'चयनित अनुभाग', 'Bagian yang Dipilih', 'Sezione selezionata', '選択されたセクション', '선택된 섹션', 'Geselecteerde sectie', 'Seção Selecionada', 'ส่วนที่เลือก', 'Seçilen Bölüm', 'منتخب کردہ سیکشن', '选定部分', 'Geselekteerde afdeling', 'Ausgewählter Abschnitt', 'Επιλεγμένη ενότητα', 'Sección Seleccionada', 'चयनित सेक्सन', 'Выбранный раздел', 'Valgt afsnit', 'Ընտրված բաժին', 'არჩეული სექცია', 'निवडलेला विभाग', 'Bahagian Terpilih', 'ਚੁਣਿਆ ਭਾਗ', 'தேர்ந்தெடுக்கப்பட்ட பிரிவு', 'ఎంచుకున్న విభాగం', 'Valt avsnitt', 'Napiling Seksyon'),
(633, 'information_has_been_updated_successfully', 'Information Has Been Updated Successfully', 'তথ্য সফলভাবে আপডেট হয়েছে Updated', 'تم تحديث المعلومات بنجاح', 'Les informations ont été mises à jour avec succès', 'जानकारी सफलतापूर्वक अद्यतन की गई है', 'Informasi Telah Diperbarui Berhasil', 'Le informazioni sono state aggiornate con successo', '情報は正常に更新されました', '정보가 성공적으로 업데이트되었습니다', 'Informatie is met succes bijgewerkt', 'Informações foram atualizadas com sucesso', 'อัปเดตข้อมูลเรียบร้อยแล้ว', 'Bilgiler başarıyla güncellendi', 'معلومات کامیابی کے ساتھ اپ ڈیٹ ہوچکی ہیں', '信息已成功更新', 'Inligting is suksesvol opgedateer', 'Informationen wurden erfolgreich aktualisiert', 'Οι πληροφορίες ενημερώθηκαν με επιτυχία', 'La información ha sido actualizada exitosamente', 'सूचना सफलतापूर्वक अपडेट गरिएको छ', 'Информация была успешно обновлена', 'Oplysninger er blevet opdateret med succes', 'Տեղեկատվությունը հաջողությամբ թարմացվել է', 'ინფორმაცია წარმატებით განახლდა', 'माहिती यशस्वीरित्या अद्यतनित केली गेली आहे', 'Maklumat Telah Berjaya Dikemas kini', 'ਜਾਣਕਾਰੀ ਸਫਲਤਾਪੂਰਵਕ ਅਪਡੇਟ ਕੀਤੀ ਗਈ ਹੈ', 'தகவல் வெற்றிகரமாக புதுப்பிக்கப்பட்டுள்ளது', 'సమాచారం విజయవంతంగా నవీకరించబడింది', 'Information har uppdaterats framgångsrikt', 'Matagumpay na na-update ang Impormasyon'),
(634, 'create_invoice', 'Create Invoice', 'চালান তৈরি করুন', 'إنشاء فاتورة', 'Créer une facture', 'इनवॉयस बनाएँ', 'Buat Faktur', 'Crea fattura', '請求書を作成', '송장 생성', 'Factuur maken', 'Criar recibo', 'สร้างใบแจ้งหนี้', 'Fatura oluşturmak', 'انوائس بنائیں', '创建发票', 'Skep faktuur', 'Rechnung erstellen', 'Δημιουργία τιμολογίου', 'Crear factura', 'चलानी सिर्जना गर्नुहोस्', 'Создать счет', 'Opret faktura', 'Ստեղծեք հաշիվ-ապրանքագիր', 'შექმენით ინვოისი', 'बीजक तयार करा', 'Buat Invois', 'ਚਲਾਨ ਬਣਾਓ', 'விலைப்பட்டியல் உருவாக்கவும்', 'ఇన్వాయిస్ సృష్టించండి', 'Skapa faktura', 'Lumikha ng Invoice'),
(635, 'invoice_entry', 'Invoice Entry', 'চালানের এন্ট্রি', 'إدخال الفاتورة', 'Saisie de facture', 'चालान प्रविष्टि', 'Entri Faktur', 'Voce fattura', '請求書入力', '송장 입력', 'Factuurinvoer', 'Entrada de fatura', 'รายการใบแจ้งหนี้', 'Fatura Girişi', 'انوائس انٹری', '发票输入', 'Faktuurinskrywing', 'Rechnungserfassung', 'Καταχώριση τιμολογίου', 'Entrada de factura', 'चलानी प्रविष्टि', 'Ввод счета', 'Fakturaindtastning', 'Պարտատոմսերի մուտքագրում', 'ინვოისის შეტანა', 'बीजक प्रवेश', 'Penyertaan Invois', 'ਚਲਾਨ ਦਾਖਲਾ', 'விலைப்பட்டியல் நுழைவு', 'ఇన్వాయిస్ ఎంట్రీ', 'Fakturainmatning', 'Pagpasok ng Invoice'),
(636, 'quick_payment', 'Quick Payment', 'দ্রুত অর্থ প্রদান', 'دفع سريع', 'Paiement rapide', 'त्वरित भुगतान', 'Pembayaran cepat', 'Pagamento rapido', '迅速な支払い', '빠른 결제', 'Snelle betaling', 'Pagamento Rápido', 'ชำระเงินด่วน', 'Hızlı Ödeme', 'فوری ادائیگی', '快速付款', 'Vinnige betaling', 'Schnelle Zahlung', 'Γρήγορη πληρωμή', 'Pago rápido', 'द्रुत भुक्तान', 'Быстрая оплата', 'Hurtig betaling', 'Արագ վճարում', 'სწრაფი გადახდა', 'द्रुत भरणा', 'Pembayaran Pantas', 'ਤੁਰੰਤ ਭੁਗਤਾਨ', 'விரைவான கட்டணம்', 'త్వరిత చెల్లింపు', 'Snabb betalning', 'Mabilis na Pagbabayad'),
(637, 'write_your_remarks', 'Write Your Remarks', 'আপনার মন্তব্য লিখুন', 'اكتب ملاحظاتك', 'Écrivez vos remarques', 'अपनी टिप्पणी लिखें', 'Tulis Komentar Anda', 'Scrivi i tuoi commenti', '備考を書く', '당신의 의견을 쓰십시오', 'Schrijf uw opmerkingen', 'Escreva suas observações', 'เขียนข้อสังเกตของคุณ', 'Yorumlarınızı Yazın', 'اپنے ریمارکس لکھیں', '写您的评论', 'Skryf u opmerkings', 'Schreiben Sie Ihre Bemerkungen', 'Γράψτε τις παρατηρήσεις σας', 'Escribe tus comentarios', 'तपाईंको टिप्पणी लेख्नुहोस्', 'Напишите ваши замечания', 'Skriv dine bemærkninger', 'Գրեք ձեր մեկնաբանությունը', 'დაწერე შენიშვნები', 'आपले टिपण्णी लिहा', 'Tulis Ucapan Anda', 'ਆਪਣੀ ਟਿੱਪਣੀ ਲਿਖੋ', 'உங்கள் கருத்துக்களை எழுதுங்கள்', 'మీ వ్యాఖ్యలను వ్రాయండి', 'Skriv dina kommentarer', 'Isulat ang Iyong Mga Paalala'),
(638, 'reset', 'Reset', 'রিসেট', 'إعادة تعيين', 'Réinitialiser', 'रीसेट', 'Setel ulang', 'Ripristina', 'リセット', '초기화', 'Reset', 'Restabelecer', 'ตั้งค่าใหม่', 'Sıfırla', 'ری سیٹ کریں', '重启', 'herstel', 'Zurücksetzen', 'Επαναφορά', 'Reiniciar', 'रिसेट गर्नुहोस्', 'Сброс', 'Nulstil', 'Վերակայել', 'გადატვირთვა', 'रीसेट करा', 'Tetapkan semula', 'ਰੀਸੈੱਟ', 'மீட்டமை', 'రీసెట్', 'Återställa', 'I-reset'),
(639, 'fees_payment_history', 'Fees Payment History', 'ফি প্রদানের ইতিহাস', 'تاريخ دفع الرسوم', 'Historique des paiements', 'फीस भुगतान इतिहास', 'Riwayat Pembayaran Biaya', 'Cronologia pagamenti', '料金支払い履歴', '수수료 지불 내역', 'Kosten betalingsgeschiedenis', 'Histórico de pagamento de taxas', 'ประวัติการชำระค่าธรรมเนียม', 'Ücret Ödeme Geçmişi', 'فیس ادائیگی کی تاریخ', '费用支付历史', 'Geskiedenis van die betaling', 'Gebühren Zahlungsverlauf', 'Ιστορικό πληρωμών τελών', 'Honorarios Historial de pagos', 'शुल्क भुक्तान ईतिहास', 'История платежей', 'Gebyrhistorik', 'Վճարների վճարման պատմություն', 'გადასახადების გადახდის ისტორია', 'फी देय इतिहास', 'Sejarah Pembayaran Yuran', 'ਫੀਸ ਅਦਾਇਗੀ ਦਾ ਇਤਿਹਾਸ', 'கட்டணம் செலுத்தும் வரலாறு', 'ఫీజు చెల్లింపు చరిత్ర', 'Avgiftsbetalningshistorik', 'Kasaysayan ng Pagbabayad sa Bayad'),
(640, 'fees_summary_report', 'Fees Summary Report', 'ফি সংক্ষিপ্তসার প্রতিবেদন', 'تقرير ملخص الرسوم', 'Rapport sommaire des frais', 'फीस सारांश रिपोर्ट', 'Laporan Ringkasan Biaya', 'Rapporto di riepilogo commissioni', '料金概要レポート', '수수료 요약 보고서', 'Kostenoverzicht', 'Relatório resumido de taxas', 'รายงานสรุปค่าธรรมเนียม', 'Ücret Özeti Raporu', 'فیس سمری رپورٹ', '费用汇总报告', 'Fooi opsommingsverslag', 'Gebührenübersicht', 'Συνοπτική έκθεση τελών', 'Informe de resumen de tarifas', 'शुल्क सारांश रिपोर्ट', 'Сводный отчет о сборах', 'Gebyrets sammendragsrapport', 'Արժեքների ամփոփ հաշվետվություն', 'შემაჯამებელი ანგარიში', 'फी सारांश अहवाल', 'Laporan Ringkasan Yuran', 'ਫੀਸ ਸੰਖੇਪ ਰਿਪੋਰਟ', 'கட்டணம் சுருக்கம் அறிக்கை', 'ఫీజు సారాంశం నివేదిక', 'Avgiftsöversiktrapport', 'Ulat sa Buod ng Pagbabayad'),
(641, 'add_account_group', 'Add Account Group', 'অ্যাকাউন্ট গ্রুপ যুক্ত করুন', 'إضافة مجموعة حساب', 'Ajouter un groupe de comptes', 'खाता समूह जोड़ें', 'Tambahkan Grup Akun', 'Aggiungi gruppo di account', 'アカウントグループを追加', '계정 그룹 추가', 'Accountgroep toevoegen', 'Adicionar grupo de contas', 'เพิ่มกลุ่มบัญชี', 'Hesap Grubu Ekle', 'اکاؤنٹ گروپ شامل کریں', '添加帐户组', 'Voeg rekeninggroep by', 'Kontogruppe hinzufügen', 'Προσθήκη ομάδας λογαριασμού', 'Agregar grupo de cuentas', 'खाता समूह थप्नुहोस्', 'Добавить группу аккаунтов', 'Tilføj kontogruppe', 'Ավելացնել Հաշիվների խումբ', 'დაამატეთ ანგარიშის ჯგუფი', 'खाते गट जोडा', 'Tambah Kumpulan Akaun', 'ਖਾਤਾ ਸਮੂਹ ਸ਼ਾਮਲ ਕਰੋ', 'கணக்குக் குழுவைச் சேர்க்கவும்', 'ఖాతా సమూహాన్ని జోడించండి', 'Lägg till kontogrupp', 'Magdagdag ng Grupo ng Account'),
(642, 'account_group', 'Account Group', 'অ্যাকাউন্ট গ্রুপ', 'جماعة حساب', 'Compte de groupe', 'खाता समूह', 'Grup Akun', 'Gruppo di account', 'アカウントグループ', '계정 그룹', 'Accountgroep', 'Accountgroep', 'กลุ่มบัญชี', 'Hesap grubu', 'اکاؤنٹ گروپ', '帐户组', 'Rekeninggroep', 'Kontengruppe', 'Ομάδα λογαριασμού', 'Grupo de cuentas', 'खाता समूह', 'Группа счетов', 'Kontogruppe', 'Հաշվի խումբ', 'ანგარიშის ჯგუფი', 'खाते गट', 'Kumpulan Akaun', 'ਖਾਤਾ ਸਮੂਹ', 'கணக்கு குழு', 'ఖాతా సమూహం', 'Kontogrupp', 'Grupo ng Account'),
(643, 'account_group_list', 'Account Group List', 'অ্যাকাউন্ট গ্রুপ তালিকা', 'قائمة مجموعة الحساب', 'Liste des groupes de comptes', 'खाता समूह सूची', 'Daftar Grup Akun', 'Elenco dei gruppi di account', 'アカウントグループリスト', '계정 그룹 목록', 'Lijst met accountgroepen', 'Lista de grupos de contas', 'รายชื่อกลุ่มบัญชี', 'Hesap Grubu Listesi', 'اکاؤنٹ گروپ لسٹ', '帐户组列表', 'Rekeninggroeplys', 'Kontengruppenliste', 'Λίστα ομάδων λογαριασμών', 'Lista de grupos de cuentas', 'खाता समूह सूची', 'Список групп счетов', 'Kontogruppeliste', 'Հաշվի խմբի ցուցակը', 'ანგარიშის ჯგუფის სია', 'खाते गट यादी', 'Senarai Kumpulan Akaun', 'ਖਾਤਾ ਸਮੂਹ ਸੂਚੀ', 'கணக்கு குழு பட்டியல்', 'ఖాతా సమూహ జాబితా', 'Kontogruppslista', 'Listahan ng Pangkat ng Account'),
(644, 'mailbox', 'Mailbox', 'ডাকবাক্স', 'صندوق بريد', 'Boites aux lettres', 'मेलबॉक्स', 'Kotak surat', 'Cassetta postale', 'メールボックス', '사서함', 'Mailbox', 'Caixa de correio', 'ตู้จดหมาย', 'Posta kutusu', 'میل باکس', '邮箱', 'posbus', 'Mailbox', 'Γραμματοκιβώτιο', 'Buzón', 'मेलबक्स', 'почтовый ящик', 'Postkasse', 'Փոստարկղ', 'საფოსტო ყუთი', 'मेलबॉक्स', 'Peti Mel', 'ਮੇਲਬਾਕਸ', 'அஞ்சல் பெட்டி', 'మెయిల్బాక్స్', 'Brevlåda', 'Mailbox'),
(645, 'refresh_mail', 'Refresh Mail', 'রিফ্রেশ মেল', 'تحديث البريد', 'Refresh Mail', 'मेल को रिफ्रेश करें', 'Segarkan Surat', 'Aggiorna posta', 'メールを更新', '메일 새로 고침', 'Mail vernieuwen', 'Refresh Mail', 'รีเฟรชเมล', 'Postayı Yenile', 'ریفریش میل', '刷新邮件', 'Verfris e-pos', 'Refresh Mail', 'Ανανέωση αλληλογραφίας', 'Actualizar correo', 'ताजा मेल', 'Обновить почту', 'Refresh Mail', 'Թարմացրեք փոստը', 'განაახლეთ ფოსტა', 'रीफ्रेश', 'Muat semula Mel', 'ਤਾਜ਼ਾ ਮੇਲ', 'அஞ்சலைப் புதுப்பிக்கவும்', 'మెయిల్ రిఫ్రెష్ చేయండి', 'Uppdatera e-post', 'I-refresh ang Mail'),
(646, 'sender', 'Sender', 'প্রেরকের', 'مرسل', 'expéditeur', 'प्रेषक', 'pengirim', 'mittente', '送信者', '보내는 사람', 'verzender', 'remetente', 'ผู้ส่ง', 'gönderen', 'مرسل', '寄件人', 'sender', 'Sender', 'αποστολέας', 'remitente', 'प्रेषक', 'отправитель', 'Sender', 'հեռագրական', 'Sender', 'प्रेषक', 'Pengguna', 'ਪ੍ਰੇਸ਼ਕ', 'அனுப்புநர்', 'పంపినవారు', 'Avsändare', 'nagpadala'),
(647, 'general_settings', 'General Settings', 'সাধারণ সেটিংস', 'الاعدادات العامة', 'réglages généraux', 'सामान्य सेटिंग्स', 'Pengaturan Umum', 'impostazioni generali', '一般設定', '일반 설정', 'Algemene instellingen', 'Configurações Gerais', 'การตั้งค่าทั่วไป', 'Genel Ayarlar', 'عام ترتیبات', '常规设置', 'Algemene instellings', 'Allgemeine Einstellungen', 'Γενικές Ρυθμίσεις', 'Configuración general', 'सामान्य सेटिंग्स', 'общие настройки', 'Generelle indstillinger', 'Ընդհանուր պարամետրեր', 'ძირითადი პარამეტრები', 'सामान्य सेटिंग्ज', 'Tetapan umum', 'ਆਮ ਸੈਟਿੰਗ', 'பொது அமைப்புகள்', 'సాధారణ సెట్టింగులు', 'Allmänna Inställningar', 'Pangkalahatang mga Setting'),
(648, 'institute_name', 'Institute Name', 'প্রতিষ্ঠানের নাম', 'اسم المعهد', 'Nom de l&#39;Institut', 'संस्थान का नाम', 'nama institusi', 'Nome Istituto', '機関名', '연구소 이름', 'naam van het instituut', 'Nome do Instituto', 'ชื่อสถาบัน', 'Kurum İsmi', 'انسٹی ٹیوٹ کا نام', '研究所名称', 'Instituut Naam', 'Institutsname', 'όνομα Ινστιτούτου', 'nombre del Instituto', 'संस्थानको नाम', 'Название института', 'Institutets navn', 'Ինստիտուտի անվանումը', 'ინსტიტუტის სახელწოდება', 'संस्थेचे नाव', 'Nama Institut', 'ਸੰਸਥਾ ਦਾ ਨਾਮ', 'நிறுவனத்தின் பெயர்', 'సంస్థ పేరు', 'Institutets namn', 'pangalan ng institusyon'),
(649, 'institution_code', 'Institution Code', 'প্রতিষ্ঠান কোড', 'رمز المؤسسة', 'Institution Code', 'संस्था कोड', 'Kode Institusi', 'Codice di istituzione', '機関コード', '기관 코드', 'Instellingscode', 'Código da Instituição', 'รหัสสถาบัน', 'Kurum Kodu', 'ادارہ کوڈ', '机构代码', 'Institusiekode', 'Institutionscode', 'Κωδικός ιδρύματος', 'Código Institucional', 'संस्था कोड', 'Код учреждения', 'Institutionskode', 'Հաստատության օրենսգիրք', 'ინსტიტუტის კოდი', 'संस्था कोड', 'Kod Institusi', 'ਸੰਸਥਾ ਕੋਡ', 'நிறுவன குறியீடு', 'ఇన్స్టిట్యూషన్ కోడ్', 'Institutionskod', 'Institusyon Code'),
(650, 'sms_service_provider', 'Sms Service Provider', 'এসএমএস পরিষেবা সরবরাহকারী', 'مزود خدمة الرسائل القصيرة', 'Fournisseur de services SMS', 'एसएमएस सेवा प्रदाता', 'Penyedia Layanan Sms', 'Sms Service Provider', 'SMSサービスプロバイダー', 'SMS 서비스 제공 업체', 'Sms Service Provider', 'Provedor de serviços de SMS', 'ผู้ให้บริการ SMS', 'Sms Servis Sağlayıcısı', 'ایس ایم ایس سروس فراہم کرنے والا', '短信服务提供商', 'SMS diensverskaffer', 'SMS-Dienstleister', 'Πάροχος υπηρεσιών Sms', 'Proveedor de servicios SMS', 'एसएमएस सेवा प्रदायक', 'СМС Сервис Провайдер', 'SMS-udbyder', 'Sms ծառայության մատակարար', 'Sms მომსახურების მიმწოდებელი', 'एसएमएस सेवा प्रदाता', 'Pembekal Perkhidmatan Sms', 'ਐਸਐਮਐਸ ਸੇਵਾ ਪ੍ਰਦਾਤਾ', 'எஸ்எம்எஸ் சேவை வழங்குநர்', 'ఎస్ఎంఎస్ సర్వీస్ ప్రొవైడర్', 'Sms Service Provider', 'Tagapagbigay ng Serbisyo ng Sms'),
(651, 'footer_text', 'Footer Text', 'পাদচরণ', 'نص التذييل', 'Texte de pied de page', 'फूटर टेक्स्ट', 'Catatan kaki', 'Piè di pagina di testo', 'フッターテキスト', '바닥 글 텍스트', 'Voettekst', 'Texto de rodapé', 'ข้อความส่วนท้าย', 'Altbilgi metni', 'فوٹر ٹیکسٹ', '页脚文字', 'Voetteksteks', 'Fusszeile', 'Κείμενο υποσέλιδου', 'Texto de pie de página', 'फुटर पाठ', 'Текст нижнего колонтитула', 'Sidefodtekst', 'Ոտնահետքերի տեքստ', 'ქვედა ტექსტი', 'तळटीप मजकूर', 'Teks Footer', 'ਫੁੱਟਰ ਟੈਕਸਟ', 'அடிக்குறிப்பு உரை', 'ఫుటరు టెక్స్ట్', 'Footer Text', 'Teksto ng Footer'),
(652, 'payment_control', 'Payment Control', 'পেমেন্ট কন্ট্রোল', 'مراقبة الدفع', 'Contrôle des paiements', 'भुगतान नियंत्रण', 'Kontrol Pembayaran', 'Controllo dei pagamenti', '支払い管理', '결제 관리', 'Betalingscontrole', 'Texto de rodapé', 'ควบคุมการจ่ายเงิน', 'Ödeme Kontrolü', 'ادائیگی کنٹرول', '付款控制', 'Betaalbeheer', 'Zahlungskontrolle', 'Έλεγχος πληρωμών', 'Control de pagos', 'भुक्तानी नियन्त्रण', 'Контроль оплаты', 'Betalingskontrol', 'Վճարման հսկողություն', 'გადახდის კონტროლი', 'देयक नियंत्रण', 'Kawalan Pembayaran', 'ਭੁਗਤਾਨ ਕੰਟਰੋਲ', 'கட்டணக் கட்டுப்பாடு', 'చెల్లింపు నియంత్రణ', 'Betalningskontroll', 'Kontrol ng Pagbabayad'),
(653, 'sms_config', 'Sms Config', 'এসএমএস কনফিগার', 'تكوين الرسائل القصيرة', 'Config Sms', 'एसएमएस कॉन्फ़िगर करें', 'Konfigurasi Sms', 'Config. SMS', 'SMS構成', 'SMS 구성', 'Sms Config', 'Sms Config', 'Sms Config', 'SMS Yapılandırması', 'ایس ایم ایس تشکیل', '短信配置', 'Sms Config', 'SMS-Konfiguration', 'Διαμόρφωση Sms', 'Configuración de SMS', 'एसएमएस कन्फिगरेसन', 'Смс конфиг', 'Sms Config', 'Sms կազմաձևել', 'Sms კონფიგურაცია', 'एसएमएस कॉन्फिगरेशन', 'Konfigurasi Sms', 'ਐਸਐਮਐਸ ਦੀ ਸੰਰਚਨਾ', 'எஸ்எம்எஸ் கட்டமைப்பு', 'Sms కాన్ఫిగర్', 'Sms Config', 'Sms Config'),
(654, 'sms_triggers', 'Sms Triggers', 'এসএমএস ট্রিগার', 'مشغلات الرسائل القصيرة', 'Déclencheurs SMS', 'एसएमएस ट्रिगर', 'Pemicu Sms', 'Trigger Sms', 'SMSトリガー', 'SMS 트리거', 'Sms Triggers', 'Sms Triggers', 'SMS ทริกเกอร์', 'Sms Tetikleyicileri', 'ایس ایم ایس ٹرگرز', '短信触发', 'Sms snellers', 'SMS-Trigger', 'Ενεργοποιήσεις Sms', 'Disparadores de SMS', 'एसएमएस ट्रिगरहरू', 'SMS-триггеры', 'Sms udløsere', 'Sms ձգան', 'Sms Triggers', 'एसएमएस ट्रिगर', 'Pencetus Sms', 'ਐਸਐਮਐਸ ਟਰਿੱਗਰਸ', 'எஸ்எம்எஸ் தூண்டுகிறது', 'Sms ట్రిగ్గర్స్', 'Sms Triggers', 'Sms Trigger'),
(655, 'authentication_token', 'Authentication Token', 'প্রমাণীকরণ টোকেন', 'رمز المصادقة', 'Jeton d\'authentification', 'प्रमाणीकरण टोकन', 'Token Otentikasi', 'Token di autenticazione', '認証トークン', '인증 토큰', 'Verificatietoken', 'Token de Autenticação', 'โทเค็นการรับรองความถูกต้อง', 'Kimlik Doğrulama Simgesi', 'توثیق کا ٹوکن', '认证令牌', 'Autentiseringstoken', 'Authentifizierungstoken', 'Διακριτικό ελέγχου ταυτότητας', 'Token de autenticación', 'प्रमाणीकरण टोकन', 'Токен аутентификации', 'Autentificeringstoken', 'Նույնականացման նշան', 'ავთენტიფიკაცია', 'प्रमाणीकरण टोकन', 'Token Pengesahan', 'ਪ੍ਰਮਾਣਿਕਤਾ ਟੋਕਨ', 'அங்கீகார டோக்கன்', 'ప్రామాణీకరణ టోకెన్', 'Autentiseringstoken', 'Token sa pagpapatunay'),
(656, 'sender_number', 'Sender Number', 'প্রেরকের নম্বর', 'رقم المرسل', 'Numéro d\'expéditeur', 'भेजने वाला नंबर', 'Nomor Pengirim', 'Numero mittente', '送信者番号', '발신자 번호', 'Afzender nummer', 'Número do remetente', 'หมายเลขผู้ส่ง', 'Gönderen Numarası', 'مرسل نمبر', '发件人编号', 'Afzendernommer', 'Sender Number', 'Αριθμός αποστολέα', 'Número de remitente', 'प्रेषक संख्या', 'Номер отправителя', 'Sender Number', 'Ուղարկողի համարը', 'გამგზავნის ნომერი', 'प्रेषक क्रमांक', 'Nombor Penghantar', 'ਭੇਜਣ ਵਾਲਾ ਨੰਬਰ', 'அனுப்புநர் எண்', 'పంపినవారి సంఖ్య', 'Avsändarnummer', 'Numero ng nagpadala'),
(657, 'username', 'Username', 'ব্যবহারকারীর নাম', 'اسم المستخدم', 'Nom d\'utilisateur', 'उपयोगकर्ता नाम', 'Nama pengguna', 'Nome utente', 'ユーザー名', '사용자 이름', 'Gebruikersnaam', 'Nome de usuário', 'ชื่อผู้ใช้', 'Kullanıcı adı', 'صارف نام', '用户名', 'Gebruikersnaam', 'Nutzername', 'Όνομα χρήστη', 'Nombre de usuario', 'प्रयोगकर्ता नाम', 'имя пользователя', 'Brugernavn', 'Օգտագործողի անունը', 'ნიკი', 'वापरकर्तानाव', 'Nama pengguna', 'ਉਪਯੋਗਕਰਤਾ ਨਾਮ', 'பயனர்பெயர்', 'యూజర్ పేరు', 'Användarnamn', 'Username'),
(658, 'api_key', 'Api Key', 'এপি কি', 'مفتاح API', 'Clé API', 'एपीआई कुंजी', 'Api Key', 'Api Key', 'APIキー', 'API 키', 'API sleutel', 'Chave API', 'คีย์ Api', 'API Anahtarı', 'آپی کی', 'api键', 'Api-sleutel', 'API-Schlüssel', 'Κλειδί Api', 'Clave API', 'एपीआई कुञ्जी', 'Api Key', 'Api-nøgle', 'Api Key- ը', 'Api Key', 'आपी की', 'Api Key', 'ਆਪਿ ਕੀ', 'அப்பி கீ', 'అపి కీ', 'Api Key', 'Api Key'),
(659, 'authkey', 'Authkey', 'Authkey', 'Authkey', 'Authkey', 'Authkey', 'Authkey', 'authkey', 'Authkey', 'Authkey', 'Authkey', 'Chave de autenticação', 'Authkey', 'authkey', 'اتھکی', '验证码', 'Authkey', 'Authkey', 'Authkey', 'Authkey', 'Authkey', 'Authkey', 'authkey', 'Հեղինակ', 'ავტორიტეტი', 'औथकी', 'Authkey', 'ਅਥਕੀ', 'ஆத்த்கி', 'Authkey', 'Authkey', 'May-akda'),
(660, 'sender_id', 'Sender Id', 'প্রেরকের আইডি', 'معرف الإرسال', 'Identifiant de l\'expéditeur', 'प्रेषक आईडी', 'ID pengirim', 'Identità del mittente', '送信者ID', '발신자 ID', 'Zender ID', 'ID de envio', 'รหัสผู้ส่ง', 'Gönderen Kimliği', 'بھیجنے والے کی شناخت', '发件人ID', 'Afzender-ID', 'Sender Id', 'Ταυτότητα αποστολέα', 'Identificación del remitente', 'प्रेषक परिचय', 'Удостоверение личности отправителя', 'Sender Id', 'Ուղարկողի Id', 'Გამგზავნის აიდი', 'प्रेषक आयडी', 'ID penghantar', 'ਭੇਜਣ ਵਾਲੇ ਦੀ ਪਛਾਣ', 'அனுப்புநர் ஐடி', 'పంపినవారు ID', 'Avsändar ID', 'Id ng nagpadala'),
(661, 'sender_name', 'Sender Name', 'প্রেরক নাম', 'اسم المرسل', 'Nom de l\'expéditeur', 'भेजने वाले का नाम', 'Nama pengirim', 'Nome del mittente', '送信者名', '발신자 이름', 'Naam afzender', 'Nome do remetente', 'ชื่อผู้ส่ง', 'Gönderenin adı', 'بھیجنے والے کا نام', '发件者姓名', 'Afzender se naam', 'Sender Name', 'Ονομα αποστολέα', 'Nombre del remitente', 'प्रेषक नाम', 'Имя отправителя', 'Sender Name', 'Ուղարկողի անուն', 'Გამგზავნის სახელი', 'प्रेषक नाव', 'Nama pengirim', 'ਭੇਜਣ ਵਾਲੇ ਦਾ ਨਾਮ', 'அனுப்புனர் பெயர்', 'పంపిన వారి పేరు', 'Avsändarens namn', 'Pangalan ng nagpadala'),
(662, 'hash_key', 'Hash Key', 'হ্যাশ কী', 'مفتاح التجزئة', 'Touche dièse', 'हैश कुंजी', 'Kunci Hash', 'Tasto cancelletto', 'ハッシュキー', '해시 키', 'Hash sleutel', 'Chave de hash', 'รหัสแฮช', 'Kare tuşu', 'ہیش کی', '散列键', 'Hash-sleutel', 'Hash-Schlüssel', 'Κλειδί', 'Clave hash', 'ह्याश कुञ्जी', 'Хэш ключ', 'Hash-nøgle', 'Հաշ բանալին', 'ჰაში გასაღები', 'हॅश की', 'Kunci Hash', 'ਹੈਸ਼ ਕੁੰਜੀ', 'ஹாஷ் கீ', 'హాష్ కీ', 'Hash-nyckel', 'Hash Key'),
(663, 'notify_enable', 'Notify Enable', 'সক্ষমকে অবহিত করুন', 'إعلام تمكين', 'Notify Enable', 'सक्षम करें सूचित करें', 'Beritahu Mengaktifkan', 'Notifica Abilita', '通知を有効にする', '활성화 알림', 'Melden inschakelen', 'Notificar Ativar', 'แจ้งเตือนการเปิดใช้งาน', 'Etkinleştir', 'قابل اطلاع دیں', '通知启用', 'Kennisgewing Aktiveer', 'Benachrichtigen aktivieren', 'Ειδοποίηση Ενεργοποίηση', 'Notificar Habilitar', 'सूचित गर्नुहोस् सक्षम गर्नुहोस्', 'Включить уведомление', 'Underret Aktiver', 'Տեղեկացնել միացնել', 'აცნობეთ ჩართეთ', 'सक्षम करा सूचित करा', 'Maklumkan Aktifkan', 'ਯੋਗ ਨੂੰ ਸੂਚਿਤ ਕਰੋ', 'இயக்கு அறிவிக்கவும்', 'ప్రారంభించు తెలియజేయండి', 'Meddela Aktivera', 'Abisuhan Paganahin'),
(664, 'exam_attendance', 'Exam Attendance', 'পরীক্ষার উপস্থিতি', 'حضور الامتحان', 'Participation aux examens', 'परीक्षा में उपस्थिति', 'Kehadiran ujian', 'Partecipazione all\'esame', '試験出席', '시험 출석', 'Aanwezigheid bij het examen', 'Participação no exame', 'เข้าร่วมการสอบ', 'Sınava Katılım', 'امتحان میں حاضری', '参加考试', 'Bywoning van die eksamen', 'Teilnahme an der Prüfung', 'Συμμετοχή στις εξετάσεις', 'Asistencia al examen', 'परीक्षा उपस्थिति', 'Посещаемость экзамена', 'Eksamen deltagelse', 'Քննության հաճախում', 'გამოცდის დასწრება', 'परीक्षेची उपस्थिती', 'Kehadiran Peperiksaan', 'ਪ੍ਰੀਖਿਆ ਹਾਜ਼ਰੀ', 'தேர்வு வருகை', 'పరీక్ష హాజరు', 'Examen närvaro', 'Pagsisimula sa Exam'),
(665, 'exam_results', 'Exam Results', 'পরীক্ষার ফলাফল', 'نتائج الامتحانات', 'Résultats d\'examen', 'परीक्षा के परिणाम', 'Hasil ujian', 'Risultati degli esami', '試験結果', '시험 결과', 'Examenresultaten', 'Resultados dos exames', 'ผลสอบ', 'Sınav sonuçları', 'امتحانی نتائج', '考试成绩', 'Eksamenuitslae', 'Prüfungsergebnisse', 'Αποτελέσματα εξετάσεων', 'Resultados de examen', 'परीक्षा परिणामहरू', 'Результаты экзамена', 'Eksamens resultater', 'Քննության արդյունքներ', 'Გამოცდის შედეგები', 'परीक्षेचा निकाल', 'Keputusan peperiksaan', 'ਪ੍ਰੀਖਿਆ ਨਤੀਜੇ', 'தேர்வு முடிவுகள்', 'పరీక్షా ఫలితాలు', 'Provresultat', 'Mga Resulta ng Pagsusulit'),
(666, 'email_config', 'Email Config', 'ইমেল কনফিগারেশন', 'تكوين البريد الإلكتروني', 'Email Config', 'ईमेल कॉन्फ़िगरेशन', 'Konfigurasi Email', 'Config email', 'メール設定', '이메일 구성', 'E-mailconfiguratie', 'Configuração de email', 'กำหนดค่าอีเมล', 'E-posta Yapılandırması', 'ای میل کی تشکیل', '电子邮件配置', 'E-poskonfig', 'E-Mail-Konfiguration', 'Διαμόρφωση email', 'Configuración de correo electrónico', 'ईमेल कन्फिगर', 'Конфигурация электронной почты', 'E-mail-konfig', 'Էլ. Փոստ կազմաձևել', 'ელფოსტის კონფიგურაცია', 'ईमेल कॉन्फिगरेशन', 'Konfigurasi E-mel', 'ਈਮੇਲ ਸੰਰਚਨਾ', 'மின்னஞ்சல் கட்டமைப்பு', 'ఇమెయిల్ కాన్ఫిగర్', 'E-postkonfig', 'I-configure ang Email'),
(667, 'email_triggers', 'Email Triggers', 'ইমেল ট্রিগার', 'مشغلات البريد الإلكتروني', 'Déclencheurs de messagerie', 'ईमेल ट्रिगर', 'Pemicu Email', 'Trigger e-mail', 'メールトリガー', '이메일 트리거', 'E-mailtriggers', 'Disparadores de email', 'ทริกเกอร์อีเมล', 'E-posta Tetikleyicileri', 'ای میل ٹرگرز', '电子邮件触发器', 'E-pos snellers', 'E-Mail-Trigger', 'Ενεργοποιήσεις email', 'Disparadores de correo electrónico', 'ईमेल ट्रिगरहरू', 'Триггеры электронной почты', 'E-mail-triggere', 'Էլփոստի գործարկումներ', 'ელ.წერილი', 'ईमेल ट्रिगर', 'Pencetus E-mel', 'ਈ-ਮੇਲ ਟਰਿੱਗਰ', 'மின்னஞ்சல் தூண்டுதல்கள்', 'ఇమెయిల్ ట్రిగ్గర్స్', 'E-postutlösare', 'Mga Trigger ng Email'),
(668, 'account_registered', 'Account Registered', 'অ্যাকাউন্ট নিবন্ধিত', 'تم تسجيل الحساب', 'Compte enregistré', 'खाता पंजीकृत', 'Akun Terdaftar', 'Account registrato', '登録されたアカウント', '계정 등록', 'Account geregistreerd', 'Conta Registrada', 'ลงทะเบียนบัญชี', 'Hesap Kaydoldu', 'اکاؤنٹ رجسٹرڈ', '帐号注册', 'Rekening Geregistreer', 'Konto registriert', 'Καταχωρισμένος λογαριασμός', 'Cuenta registrada', 'खाता दर्ता गरियो', 'Аккаунт зарегистрирован', 'Registreret konto', 'Գրանցված հաշիվ', 'რეგისტრირებულია ანგარიში', 'खाते नोंदणीकृत', 'Akaun Berdaftar', 'ਖਾਤਾ ਰਜਿਸਟਰਡ', 'கணக்கு பதிவு செய்யப்பட்டது', 'ఖాతా నమోదు చేయబడింది', 'Registrerat konto', 'Nakarehistro ang Account'),
(669, 'forgot_password', 'Forgot Password', 'পাসওয়ার্ড ভুলে গেছেন', 'هل نسيت كلمة المرور', 'Mot de passe oublié', 'पासवर्ड भूल गए', 'Tidak ingat kata sandi', 'Ha dimenticato la password', 'パスワードをお忘れですか', '비밀번호를 잊으 셨나요', 'Wachtwoord vergeten', 'Esqueceu a senha', 'ลืมรหัสผ่าน', 'Parolanızı mı unuttunuz', 'پاسورڈ بھول گے', '忘记密码', 'Wagwoord vergeet', 'Passwort vergessen', 'Ξεχάσατε τον κωδικό', 'Se te olvidó tu contraseña', 'पासवर्ड भुल्नु भयो', 'Забыл пароль', 'Glemt kodeord', 'Մոռացել եք գաղտնաբառը', 'Პაროლი დაგავიწყდა', 'संकेतशब्द विसरलात?', 'Lupa kata laluan', 'ਪਾਸਵਰਡ ਭੁੱਲ ਗਏ', 'கடவுச்சொல்லை மறந்துவிட்டீர்களா', 'పాస్వర్డ్ మర్చిపోయారా', 'Glömt ditt lösenord', 'Nakalimutan ang password'),
(670, 'new_message_received', 'New Message Received', 'নতুন বার্তা গৃহীত হয়েছে', 'تم تلقي رسالة جديدة', 'Nouveau message reçu', 'नया संदेश प्राप्त हुआ', 'Pesan Baru Diterima', 'Nuovo messaggio ricevuto', '新しいメッセージを受信しました', '새로운 메시지 수신', 'Nieuw bericht ontvangen', 'Nova mensagem recebida', 'ได้รับข้อความใหม่', 'Yeni Mesaj Alındı', 'نیا پیغام موصول ہوا', '收到新讯息', 'Nuwe boodskap ontvang', 'Neue Nachricht empfangen', 'Λήφθηκε νέο μήνυμα', 'Nuevo mensaje recibido', 'नयाँ सन्देश प्राप्त भयो', 'Новое сообщение получено', 'Ny meddelelse modtaget', 'Ստացավ նոր հաղորդագրություն', 'ახალი შეტყობინება მიიღო', 'नवीन संदेश प्राप्त झाला', 'Mesej Baru Diterima', 'ਨਵਾਂ ਸੁਨੇਹਾ ਮਿਲਿਆ', 'புதிய செய்தி பெறப்பட்டது', 'క్రొత్త సందేశం స్వీకరించబడింది', 'Nytt meddelande mottaget', 'Natanggap ang Bagong Mensahe');
INSERT INTO `languages` (`id`, `word`, `english`, `bengali`, `arabic`, `french`, `hindi`, `indonesian`, `italian`, `japanese`, `korean`, `dutch`, `portuguese`, `thai`, `turkish`, `urdu`, `chinese`, `afrikaans`, `german`, `greek`, `spanish`, `nepali`, `russian`, `danish`, `armenian`, `georgian`, `marathi`, `malay`, `punjabi`, `tamil`, `telugu`, `swedish`, `filipino`) VALUES
(671, 'payslip_generated', 'Payslip Generated', 'পেইলিপ জেনারেটেড', 'تم إنشاء Payslip', 'Fiche de paie générée', 'जेनरेट किया गया', 'Payslip Dihasilkan', 'Busta paga generata', '生成された給与明細', '급여 명세서 생성', 'Salarisstrookje gegenereerd', 'Payslip Generated', 'สร้าง Payslip', 'Maaş bordrosu oluşturuldu', 'پیس سلپ تیار', '工资单生成', 'Payslip Gegenereer', 'Gehaltsabrechnung generiert', 'Δημιουργήθηκε δελτίο πληρωμής', 'Boleta de pago generada', 'Payslip उत्पन्न', 'Payslip Generated', 'Payslip Genereret', 'Payslip- ը առաջացավ', 'Payslip გენერირდება', 'पेस्लिप व्युत्पन्न', 'Payslip Dihasilkan', 'ਪੇਸਲਿੱਪ ਤਿਆਰ', 'பேஸ்லிப் உருவாக்கப்பட்டது', 'పేస్‌లిప్ రూపొందించబడింది', 'Payslip Generated', 'Nabuo ang Payslip'),
(672, 'leave_approve', 'Leave Approve', 'ছাড়ুন', 'اترك الموافقة', 'Laisser approuver', 'मंजूर छोड़ो', 'Tinggalkan Menyetujui', 'Lasciare Approva', '承認を残す', '승인을 남겨주세요', 'Goedkeuren verlaten', 'Deixar Aprovar', 'ออกจากการอนุมัติ', 'Onaydan Ayrıl', 'منظور کریں چھوڑیں', '离开批准', 'Laat goedkeur', 'Genehmigen lassen', 'Αφήστε άδεια', 'Dejar aprobar', 'स्वीकृत छोड्नुहोस्', 'Оставить Одобрить', 'Lad godkende', 'Թողեք հաստատել', 'დატოვე დამტკიცება', 'मंजूर सोडा', 'Tinggalkan Lulus', 'ਮਨਜ਼ੂਰੀ ਛੱਡੋ', 'ஒப்புதல் விடுங்கள்', 'అనుమతి ఇవ్వండి', 'Lämna godkännande', 'Iwanan ang Pag-apruba'),
(673, 'leave_reject', 'Leave Reject', 'প্রত্যাখ্যান ছেড়ে দিন', 'اترك رفض', 'Laisser rejeter', 'रिजेक्ट छोड़ दें', 'Tinggalkan Tolak', 'Lascia rifiutare', '却下', '거부하다', 'Weigeren verlaten', 'Deixar Rejeitar', 'ปล่อยให้ปฏิเสธ', 'Reddet', 'چھوڑ دو مسترد', '离开拒绝', 'Laat verwerp', 'Ablehnen lassen', 'Αφήστε την Απόρριψη', 'Dejar rechazar', 'छोड्नुहोस् अस्वीकार', 'Оставить Отклонить', 'Forlad Afvis', 'Թողեք մերժել', 'უარი თქვით', 'सोडा नाकारा', 'Tinggalkan Tolak', 'ਛੱਡੋ ਰੱਦ', 'நிராகரிக்கவும்', 'తిరస్కరించండి వదిలివేయండి', 'Lämna avvisa', 'Iwaksi ang Tanggihan'),
(674, 'advance_salary_approve', 'Leave Reject', 'প্রত্যাখ্যান ছেড়ে দিন', 'اترك رفض', 'Laisser rejeter', 'रिजेक्ट छोड़ दें', 'Tinggalkan Tolak', 'Lascia rifiutare', '却下', '거부하다', 'Weigeren verlaten', 'Deixar Rejeitar', 'ปล่อยให้ปฏิเสธ', 'Reddet', 'چھوڑ دو مسترد', '离开拒绝', 'Laat verwerp', 'Ablehnen lassen', 'Αφήστε την Απόρριψη', 'Dejar rechazar', 'छोड्नुहोस् अस्वीकार', 'Оставить Отклонить', 'Forlad Afvis', 'Թողեք մերժել', 'უარი თქვით', 'सोडा नाकारा', 'Tinggalkan Tolak', 'ਛੱਡੋ ਰੱਦ', 'நிராகரிக்கவும்', 'తిరస్కరించండి వదిలివేయండి', 'Lämna avvisa', 'Iwaksi ang Tanggihan'),
(675, 'advance_salary_reject', 'Advance Salary Reject', 'অগ্রিম বেতন প্রত্যাখ্যান', 'رفض الراتب المسبق', 'Rejet de salaire anticipé', 'अग्रिम वेतन अस्वीकार', 'Tolak Gaji Muka', 'Rifiuto anticipato dello stipendio', '昇給拒否', '사전 급여 거부', 'Vooraf salaris weigeren', 'Rejeição antecipada de salário', 'การปฏิเสธเงินเดือนล่วงหน้า', 'Peşin Maaş Reddi', 'ایڈوانس تنخواہ مسترد', '预支薪金', 'Voorskot salaris verwerp', 'Vorauszahlung ablehnen', 'Απόρριψη προκαταβολής μισθού', 'Rechazo de salario anticipado', 'अग्रिम वेतन अस्वीकृति', 'Аванс Заработная плата Отклонить', 'Forskud på lønafvisning', 'Նախկին աշխատավարձի մերժում', 'წინასწარი ხელფასის უარყოფა', 'अ‍ॅडव्हान्स पगार नाकारणे', 'Tolak Gaji Pendahuluan', 'ਪੇਸ਼ਗੀ ਤਨਖਾਹ ਰੱਦ', 'முன்கூட்டியே சம்பளம் நிராகரிக்கவும்', 'అడ్వాన్స్ జీతం తిరస్కరించండి', 'Förskott Lön Avvisa', 'Advance Salary Reject'),
(676, 'add_session', 'Add Session', 'সেশন যোগ করুন', 'إضافة جلسة', 'Ajouter une session', 'सत्र जोड़ें', 'Tambahkan Sesi', 'Aggiungi sessione', 'セッションを追加', '세션 추가', 'Sessie toevoegen', 'Adicionar sessão', 'เพิ่มเซสชัน', 'Oturum Ekle', 'سیشن شامل کریں', '添加会议', 'Voeg sessie by', 'Sitzung hinzufügen', 'Προσθήκη περιόδου σύνδεσης', 'Agregar sesión', 'सत्र थप्नुहोस्', 'Добавить сессию', 'Tilføj session', 'Ավելացնել նստաշրջան', 'სესიის დამატება', 'सत्र जोडा', 'Tambah Sesi', 'ਸੈਸ਼ਨ ਸ਼ਾਮਲ ਕਰੋ', 'அமர்வைச் சேர்க்கவும்', 'సెషన్‌ను జోడించండి', 'Lägg till session', 'Magdagdag ng Session'),
(677, 'session', 'Session', 'সেশন', 'جلسة', 'Session', 'अधिवेशन', 'Sidang', 'Sessione', 'セッション', '세션', 'Sessie', 'Sessão', 'เซสชั่น', 'Oturum, toplantı, celse', 'اجلاس', '届会', 'sessie', 'Session', 'Συνεδρίαση', 'Sesión', 'सत्र', 'сессия', 'Session', 'Նստաշրջան', 'სხდომა', 'सत्र', 'Sesi', 'ਸੈਸ਼ਨ', 'அமர்வு', 'సెషన్', 'Session', 'Session'),
(678, 'created_at', 'Created At', 'এ নির্মিত', 'أنشئت في', 'Créé à', 'पर बनाया गया', 'Dibuat di', 'Creato a', '作成場所', '에 만든', 'Gemaakt bij', 'Criado em', 'สร้างเมื่อ', 'Oluşturma Tarihi', 'ایٹ تیار کیا گیا', '创建于', 'Geskep by', 'Hergestellt in', 'Δημιουργήθηκε στις', 'Creado en', 'सिर्जना गरिएको', 'Создано на', 'Oprettet kl', 'Ստեղծվել է At', 'შექმნა At', 'येथे तयार केले', 'Dibuat pada', 'ਵਿਖੇ ਬਣਾਇਆ ਗਿਆ', 'இல் உருவாக்கப்பட்டது', 'వద్ద సృష్టించబడింది', 'Skapad vid', 'Nilikha Sa'),
(679, 'sessions', 'Sessions', 'দায়রা', 'الجلسات', 'Sessions', 'सत्र', 'Sesi', 'sessioni', 'セッション', '세션', 'Sessies', 'Sessões', 'การประชุม', 'Oturumlar', 'سیشن', '届会', 'sessies', 'Sitzungen', 'Συνεδρίες', 'Sesiones', 'सत्रहरू', 'сессии', 'Sessions', 'Նիստեր', 'სესიები', 'सत्रे', 'Sesi', 'ਸੈਸ਼ਨ', 'அமர்வுகள்', 'సెషన్స్', 'Sessions', 'Mga Session'),
(680, 'flag', 'Flag', 'পতাকা', 'العلم', 'Drapeau', 'झंडा', 'Bendera', 'Bandiera', '国旗', '깃발', 'Vlag', 'Bandeira', 'ธง', 'bayrak', 'پرچم', '旗', 'vlag', 'Flagge', 'Σημαία', 'Bandera', 'झण्डा', 'Флаг', 'Flag', 'Դրոշ', 'დროშა', 'झेंडा', 'Bendera', 'ਝੰਡਾ', 'கொடி', 'జెండా', 'Flagga', 'Bandila'),
(681, 'stats', 'Stats', 'পরিসংখ্যান', 'احصائيات', 'Statistiques', 'आँकड़े', 'Statistik', 'Statistiche', '統計', '통계', 'Stats', 'Estatísticas', 'สถิติ', 'İstatistikleri', 'اعداد و شمار统计', '统计', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(682, 'updated_at', 'Updated At', 'এ আপডেট', 'تم التحديث في', 'Mis à jour à', 'अपडेट किया गया', 'Diperbarui pada', 'Aggiornato alle', '更新日', '에 업데이트', 'Bijgewerkt op', 'Atualizado em', 'อัปเดตเมื่อ', 'Güncelleme Tarihi:', 'تازہ کاری شدہ', '更新于', 'Opgedateer om', 'Aktualisiert am', 'Ενημερώθηκε στις', 'Actualizado en', 'अद्यावधिक गरिएको', 'Обновлен в', 'Opdateret kl', 'Թարմացվել է At', 'განახლებულია At', 'अद्यतनित', 'Dikemas kini pada', '&#39;ਤੇ ਅਪਡੇਟ ਕੀਤਾ', 'இல் புதுப்பிக்கப்பட்டது', 'వద్ద నవీకరించబడింది', 'Uppdaterad kl', 'Nai-update Sa'),
(683, 'flag_icon', 'Flag Icon', 'পতাকা আইকন', 'رمز العلم', 'Icône de drapeau', 'ध्वज चिह्न', 'Ikon Tandai', 'Icona bandiera', '旗のアイコン', '플래그 아이콘', 'Vlagpictogram', 'Ícone de bandeira', 'ไอคอนธง', 'Bayrak Simgesi', 'پرچم کی علامت', '标记图示', 'Vlagikoon', 'Flaggensymbol', 'Εικονίδιο', 'Icono de la bandera', 'फ्ल्याग प्रतिमा', 'Значок флага', 'Flagikon', 'Դրոշի պատկերակ', 'დროშის ხატი', 'ध्वजांकित करा', 'Ikon Bendera', 'ਫਲੈਗ ਆਈਕਨ', 'கொடி ஐகான்', 'ఫ్లాగ్ ఐకాన్', 'Flaggikonen', 'Icon ng Bandila'),
(684, 'password_restoration', 'Password Restoration', 'পাসওয়ার্ড পুনরুদ্ধার', 'استعادة كلمة المرور', 'Restauration du mot de passe', 'पासवर्ड बहाली', 'Pemulihan Kata Sandi', 'Ripristino password', 'パスワードの復元', '비밀번호 복원', 'Wachtwoordherstel', 'Restauração de senha', 'กู้คืนรหัสผ่าน', 'Şifre Yenileme', 'پاس ورڈ کی بحالی', '密码恢复', 'Wagwoordherstel', 'Passwortwiederherstellung', 'Αποκατάσταση κωδικού πρόσβασης', 'Restauración de contraseña', 'पासवर्ड बहाली', 'Восстановление пароля', 'Gendannelse af adgangskode', 'Գաղտնաբառի վերականգնում', 'პაროლის აღდგენა', 'संकेतशब्द पुनर्संचयित', 'Pemulihan Kata Laluan', 'ਪਾਸਵਰਡ ਮੁੜ', 'கடவுச்சொல் மறுசீரமைப்பு', 'పాస్వర్డ్ పునరుద్ధరణ', 'Återställning av lösenord', 'Pagpapanumbalik ng password'),
(685, 'forgot', 'Forgot', 'ভুলে গেছেন', 'نسيت', 'Oublié', 'भूल गया', 'Lupa', 'dimenticato', '忘れた', '잊었다', 'Vergeten', 'Esqueceu', 'ลืม', 'Unuttun', 'بھول', '忘记', 'vergeet', 'Vergessen', 'Ξέχασα', 'Olvidó', 'बिर्सनुभयो', 'Забыли', 'Glemte', 'Մոռացել է', 'Დაავიწყდა', 'विसरलात', 'Terlupa', 'ਭੁੱਲ ਗਏ', 'மறந்துவிட்டேன்', 'మర్చిపోయారా', 'Glömde', 'Nakalimutan'),
(686, 'back_to_login', 'Back To Login', 'প্রবেশ করতে পেছান', 'العودة لتسجيل الدخول', 'Retour connexion', 'लॉगिन पर वापस जाएं', 'Kembali untuk masuk', 'Torna al login', 'ログインに戻る', '로그인으로 돌아 가기', 'Terug naar Inloggen', 'Volte ao login', 'กลับไปเข้าระบบ', 'Giriş Sayfasına Geri Dön', 'لاگ ان پر واپس جائیں', '回到登入', 'Terug na aanmelding', 'Zurück zur Anmeldung', 'Επιστροφή στην σελίδα εισόδου', 'Atrás para iniciar sesión', 'लगईन गर्न फिर्ता', 'Вернуться на страницу входа', 'Tilbage til login', 'Վերադառնալ Մուտք', 'თავში შესვლა', 'लॉगिन कडे परत', 'Kembali Ke Log Masuk', 'ਲਾਗਇਨ ਕਰਨ ਲਈ ਵਾਪਸ', 'மீண்டும் உள்நுழைக', 'తిరిగి లాగిన్ అవ్వండి', 'Tillbaka till login', 'Bumalik sa pag-login'),
(687, 'database_list', 'Database List', 'ডাটাবেস তালিকা', 'قائمة قاعدة البيانات', 'Liste des bases de données', 'डेटाबेस सूची', 'Daftar Basis Data', 'Elenco database', 'データベースリスト', '데이터베이스 목록', 'Database lijst', 'Lista de banco de dados', 'รายการฐานข้อมูล', 'Veritabanı Listesi', 'ڈیٹا بیس کی فہرست', '数据库清单', 'Databasislys', 'Datenbankliste', 'Λίστα βάσεων δεδομένων', 'Lista de bases de datos', 'डाटाबेस सूची', 'Список базы данных', 'Databaseliste', 'Շտեմարանների ցուցակ', 'მონაცემთა ბაზის სია', 'डेटाबेस यादी', 'Senarai Pangkalan Data', 'ਡਾਟਾਬੇਸ ਸੂਚੀ', 'தரவுத்தள பட்டியல்', 'డేటాబేస్ జాబితా', 'Databaslista', 'Listahan ng Database'),
(688, 'create_backup', 'Create Backup', 'ব্যাকআপ তৈরি', 'انشئ نسخة احتياطية', 'Créer une sauvegarde', 'बैकअप बनाना', 'Membuat backup', 'Creare il backup', 'バックアップを作成する', '백업 생성', 'Een backup maken', 'Criar backup', 'สร้างการสำรองข้อมูล', 'Yedek Oluştur', 'بیک اپ بنائیں', '创建备份', 'Skep rugsteun', 'Ein Backup erstellen', 'Δημιουργία αντιγράφων ασφαλείας', 'Crear copia de seguridad', 'ब्याकअप सिर्जना गर्नुहोस्', 'Создать резервную копию', 'Opret sikkerhedskopi', 'Ստեղծեք կրկնօրինակում', 'შექმენით სარეზერვო საშუალება', 'बॅकअप तयार करा', 'Buat Sandaran', 'ਬੈਕਅਪ ਬਣਾਓ', 'காப்புப்பிரதியை உருவாக்கவும்', 'బ్యాకప్ సృష్టించండి', 'Skapa backup', 'Gumawa ng backup'),
(689, 'backup', 'Backup', 'ব্যাকআপ', 'دعم', 'Sauvegarde', 'बैकअप', 'Cadangkan', 'Backup', 'バックアップ', '지원', 'Back-up', 'Cópia de segurança', 'การสำรองข้อมูล', 'Destek olmak', 'بیک اپ', '后备', 'Ondersteuning', 'Backup', 'Αντιγράφων ασφαλείας', 'Apoyo', 'ब्याकअप', 'Резервный', 'Backup', 'Կրկնօրինակում', 'სარეზერვო', 'बॅकअप', 'Sandaran', 'ਬੈਕਅਪ', 'காப்புப்பிரதி', 'బ్యాకప్', 'Säkerhetskopiering', 'Pag-backup'),
(690, 'backup_size', 'Backup Size', 'ব্যাকআপ আকার', 'حجم النسخ الاحتياطي', 'Taille de sauvegarde', 'बैकअप आकार', 'Ukuran Cadangan', 'Dimensione del backup', 'バックアップサイズ', '백업 크기', 'Grootte van back-up', 'Tamanho do backup', 'ขนาดสำรอง', 'Yedek Boyutu', 'بیک اپ سائز', '备份大小', 'Rugsteungrootte', 'Sicherungsgröße', 'Μέγεθος αντιγράφου ασφαλείας', 'Tamaño de respaldo', 'ब्याकअप आकार', 'Размер резервной копии', 'Sikkerhedskopiestørrelse', 'Պահուստավորման չափը', 'სარეზერვო ზომა', 'बॅकअप आकार', 'Saiz Sandaran', 'ਬੈਕਅਪ ਅਕਾਰ', 'காப்பு அளவு', 'బ్యాకప్ పరిమాణం', 'Säkerhetskopieringsstorlek', 'Laki ng pag-backup'),
(691, 'file_upload', 'File Upload', 'ফাইল আপলোড', 'تحميل الملف', 'Téléchargement de fichiers', 'फाइल अपलोड', 'File Upload', 'File Upload', 'ファイルのアップロード', '파일 업로드', 'Bestand upload', 'Upload de arquivo', 'อัปโหลดไฟล์', 'Dosya yükleme', 'فائل اپ لوڈ', '上传文件', 'Lêeroplaai', 'Datei-Upload', 'Ανέβασμα αρχείου', 'Subir archivo', 'फाइल अपलोड', 'Файл загружен', 'Fil upload', 'Ֆայլերի վերբեռնումը', 'Ფაილის ატვირთვა', 'फाइल अपलोड', 'Fail dimuatnaik', 'ਫਾਈਲ ਅਪਲੋਡ', 'கோப்பு பதிவேற்றம்', 'ఫైల్ ఎక్కించుట', 'Filuppladdning', 'Pag-upload ng File'),
(692, 'parents_details', 'Parents Details', 'পিতামাতার বিশদ', 'تفاصيل الوالدين', 'Détails des parents', 'माता-पिता का विवरण', 'Rincian Orang Tua', 'Dettagli dei genitori', '両親の詳細', '부모 세부 사항', 'Details ouders', 'Detalhes dos pais', 'รายละเอียดผู้ปกครอง', 'Ebeveyn Detayları', 'والدین کی تفصیلات', '家长详情', 'Ouers se besonderhede', 'Eltern Details', 'Λεπτομέρειες γονέων', 'Detalles de los padres', 'अभिभावक विवरण', 'Детали родителей', 'Forældre detaljer', 'Ծնողների մանրամասները', 'მშობლების დეტალები', 'पालक तपशील', 'Maklumat Ibu Bapa', 'ਮਾਪਿਆਂ ਦੇ ਵੇਰਵੇ', 'பெற்றோர் விவரங்கள்', 'తల్లిదండ్రుల వివరాలు', 'Föräldradetaljer', 'Mga Detalye ng Mga magulang'),
(693, 'social_links', 'Social Links', 'সামাজিক বন্ধন', 'روابط اجتماعية', 'Liens sociaux', 'सामाजिक लिंक', 'Tautan Sosial', 'Link sociali', 'ソーシャルリンク', '소셜 링크', 'Social Links', 'Links sociais', 'ลิงค์โซเชียล', 'Sosyal Bağlantılar', 'سماجی روابط', '社交连结', 'Sosiale skakels', 'Soziale Links', 'Κοινωνικοί σύνδεσμοι', 'vínculos sociales', 'सामाजिक लिंकहरू', 'Социальные ссылки', 'Sociale links', 'Սոցիալական հղումներ', 'სოციალური ბმულები', 'सामाजिक दुवे', 'Pautan Sosial', 'ਸੋਸ਼ਲ ਲਿੰਕ', 'சமூக இணைப்புகள்', 'సామాజిక లింకులు', 'Sociala länkar', 'Mga Link sa Panlipunan'),
(694, 'create_hostel', 'Create Hostel', 'হোস্টেল তৈরি করুন', 'إنشاء نزل', 'Créer une auberge', 'हॉस्टल बनाएं', 'Buat Hostel', 'Crea un ostello', 'クリエイトホステル', '호스텔 만들기', 'Maak een hostel', 'Criar Hostel', 'สร้างโฮสเทล', 'Hostel Yarat', 'ہاسٹل بنائیں', '创建旅馆', 'Skep koshuis', 'Hostel erstellen', 'Δημιουργία ξενώνα', 'Crear albergue', 'होस्टल सिर्जना गर्नुहोस्', 'Создать Хостел', 'Opret vandrehjem', 'Ստեղծեք հանրակացարան', 'ჰოსტელის შექმნა', 'वसतिगृह तयार करा', 'Buat Asrama', 'ਹੋਸਟਲ ਬਣਾਓ', 'ஹாஸ்டலை உருவாக்கவும்', 'హాస్టల్ సృష్టించండి', 'Skapa vandrarhem', 'Lumikha ng Hostel'),
(695, 'allocation_list', 'Allocation List', 'বরাদ্দ তালিকা', 'قائمة التخصيص', 'Allocation List', 'आवंटन सूची', 'Daftar Alokasi', 'Elenco di allocazione', '割り当てリスト', '할당 목록', 'Toewijzingslijst', 'Lista de alocação', 'รายการการจัดสรร', 'Tahsis Listesi', 'الاٹمنٹ لسٹ', '分配清单', 'Toekenningslys', 'Zuordnungsliste', 'Λίστα κατανομών', 'Lista de asignaciones', 'आवंटन सूची', 'Список размещения', 'Tildelingsliste', 'Տեղաբաշխման ցուցակ', 'განაწილების სია', 'वाटप यादी', 'Senarai Peruntukan', 'ਵੰਡ ਦੀ ਸੂਚੀ', 'ஒதுக்கீடு பட்டியல்', 'కేటాయింపు జాబితా', 'Tilldelningslista', 'Listahan ng Paglalaan'),
(696, 'payslip_history', 'Payslip History', 'পেইলিপ ইতিহাস', 'سجل الدفع', 'Historique des fiches de paie', 'Payslip History', 'Sejarah Payslip', 'Storia della busta paga', '給与明細履歴', '급여 명세서', 'Salarisstrook geschiedenis', 'Histórico de holerites', 'ประวัติ Payslip', 'Maaş bordrosu Geçmişi', 'پیس سلپ ہسٹری', '工资单历史', 'Payslip-geskiedenis', 'Gehaltsabrechnungsverlauf', 'Ιστορικό Payslip', 'Historial de recibo de sueldo', 'Payslip ईतिहास', 'История платежных ведомостей', 'Payslip-historie', 'Payslip- ի պատմություն', 'Payslip ისტორია', 'पेस्लिप इतिहास', 'Sejarah Payslip', 'ਪੇਸਲਿਪ ਇਤਿਹਾਸ', 'பேஸ்லிப் வரலாறு', 'పేస్‌లిప్ చరిత్ర', 'Payslip History', 'Kasaysayan ng Payslip'),
(697, 'my_attendance_overview', 'My Attendance Overview', 'আমার উপস্থিতি ওভারভিউ', 'نظرة عامة على الحضور', 'Présentation de My Attendance', 'मेरी उपस्थिति अवलोकन', 'Ikhtisar Kehadiran Saya', 'Panoramica delle mie presenze', '出席の概要', '나의 출석 개요', 'Mijn aanwezigheidsoverzicht', 'Visão geral de Minha participação', 'ภาพรวมการเข้าร่วมของฉัน', 'Katılımım Genel Bakış', 'میری حاضری کا جائزہ', '我的出勤概述', 'My oorsig oor die bywoning', 'Meine Anwesenheitsübersicht', 'Επισκόπηση της παρουσίας μου', 'Resumen de mi asistencia', 'मेरो उपस्थिति अवलोकन', 'Обзор моей посещаемости', 'Min oversigt over vores deltagelse', 'Իմ մասնակցության ակնարկը', 'ჩემი დასწრების მიმოხილვა', 'माझे उपस्थिती विहंगावलोकन', 'Gambaran Keseluruhan Kehadiran Saya', 'ਮੇਰੀ ਹਾਜ਼ਰੀ ਬਾਰੇ ਜਾਣਕਾਰੀ', 'எனது வருகை கண்ணோட்டம்', 'నా హాజరు అవలోకనం', 'Min närvaroöversikt', 'Ang Aking Pangkalahatang Pangkalahatang-ideya'),
(698, 'total_present', 'Total Present', 'মোট উপস্থিত', 'المجموع الحالي', 'Total présent', 'कुल वर्तमान', 'Total Hadir', 'Totale presente', '現在の合計', '총 선물', 'Totaal aanwezig', 'Total Present', 'รวมปัจจุบัน', 'Toplam Hediye', 'کل پیش', '总礼物', 'Totaal teenwoordig', 'Gesamtgeschenk', 'Συνολικό παρόν', 'Presente total', 'कुल प्रस्तुत', 'Всего настоящее', 'I alt til stede', 'Ընդհանուր ներկա', 'სულ საჩუქარი', 'एकूण सादर', 'Jumlah Hadir', 'ਕੁਲ ਪੇਸ਼ਕਾਰੀ', 'மொத்த தற்போது', 'మొత్తం వర్తమానం', 'Totalt närvarande', 'Kabuuang Kasalukuyan'),
(699, 'total_absent', 'Total Absent', 'মোট অনুপস্থিত', 'المجموع الكلي', 'Total Absent', 'कुल अनुपस्थित', 'Total Absen', 'Assente totale', '総不在', '결석', 'Totaal afwezig', 'Total Ausente', 'รวมขาด', 'Toplam Yok', 'کل غیر حاضر', '总缺席', 'Totale afwesig', 'Total abwesend', 'Σύνολο απουσία', 'Total ausente', 'कुल अनुपस्थित', 'Полное отсутствие', 'Samlet fravær', 'Ընդհանուր բացակա', 'სულ არ არსებობს', 'एकूण अनुपस्थित', 'Jumlah Tidak hadir', 'ਕੁੱਲ ਗੈਰਹਾਜ਼ਰ', 'மொத்த இல்லாதது', 'మొత్తం లేకపోవడం', 'Totalt frånvarande', 'Kabuuan'),
(700, 'total_late', 'Total Late', 'মোট লেট', 'المجموع المتأخر', 'Total en retard', 'कुल देर', 'Total Terlambat', 'Totale in ritardo', '合計遅延', '총 늦은', 'Totaal laat', 'Total Late', 'รวมล่าช้า', 'Toplam Geç', 'کل مرحوم', '总迟到', 'Totale laat', 'Total spät', 'Σύνολο αργά', 'Total tarde', 'कुल ढिला', 'Всего поздно', 'I alt sent', 'Ընդհանուր ուշ', 'სულ გვიან', 'एकूण कै', 'Jumlah Lewat', 'ਕੁਲ ਸਵ', 'மொத்த தாமத', 'మొత్తం ఆలస్యం', 'Totalt sent', 'Kabuuan ng Huli'),
(701, 'class_teacher_list', 'Class Teacher List', 'শ্রেণি শিক্ষকের তালিকা', 'قائمة مدرس الفصل', 'Liste des enseignants de classe', 'कक्षा शिक्षक सूची', 'Daftar Guru Kelas', 'Elenco degli insegnanti di classe', 'クラス教師リスト', '수업 교사 목록', 'Lijst met klassenleraren', 'Lista de Professores', 'รายชื่อครูประจำชั้น', 'Sınıf Öğretmeni Listesi', 'کلاس ٹیچر لسٹ', '班主任名单', 'Klasonderwyserslys', 'Klassenlehrerliste', 'Λίστα καθηγητών τάξης', 'Lista de maestros de clase', 'कक्षा शिक्षक सूची', 'Список учителей', 'Klasselærerliste', 'Դասարանի ուսուցիչների ցուցակ', 'კლასის მასწავლებელთა სია', 'वर्ग शिक्षक यादी', 'Senarai Guru Kelas', 'ਕਲਾਸ ਅਧਿਆਪਕ ਸੂਚੀ', 'வகுப்பு ஆசிரியர் பட்டியல்', 'తరగతి ఉపాధ్యాయ జాబితా', 'Klasslärarlista', 'Listahan ng Guro sa Klase'),
(702, 'section_control', 'Section Control', 'বিভাগ নিয়ন্ত্রণ', 'التحكم بالقسم', 'Section Control', 'अनुभाग नियंत्रण', 'Kontrol Bagian', 'Controllo sezione', 'セクション管理', '섹션 컨트롤', 'Sectiecontrole', 'Controle de Seção', 'การควบคุมส่วน', 'Bölüm Kontrolü', 'سیکشن کنٹرول', '节控制', 'Afdeling beheer', 'Abschnittskontrolle', 'Ενότητα ελέγχου', 'Control de sección', 'सेक्सन नियन्त्रण', 'Управление секциями', 'Afsnit kontrol', 'Բաժնի վերահսկում', 'განყოფილების კონტროლი', 'विभाग नियंत्रण', 'Bahagian Kawalan', 'ਭਾਗ ਨਿਯੰਤਰਣ', 'பிரிவு கட்டுப்பாடு', 'విభాగం నియంత్రణ', 'Avsnittskontroll', 'Seksyon Control'),
(703, 'capacity ', 'Capacity', 'ধারণক্ষমতা', 'سعة', 'Capacité', 'क्षमता', 'Kapasitas', 'Capacità', '容量', '생산 능력', 'Capaciteit', 'Capacidade', 'ความจุ', 'Kapasite', 'اہلیت', '容量', 'kapasiteit', 'Kapazität', 'Χωρητικότητα', 'Capacidad', 'क्षमता', 'Вместимость', 'Kapacitet', 'Կարողություն', 'შესაძლებლობები', 'क्षमता', 'Kapasiti', 'ਸਮਰੱਥਾ', 'திறன்', 'కెపాసిటీ', 'Kapacitet', 'Kapasidad'),
(704, 'request', 'Request', 'অনুরোধ', 'طلب', 'Demande', 'निवेदन', 'Permintaan', 'Richiesta', 'リクエスト', '의뢰', 'Verzoek', 'Solicitação', 'ขอร้อง', 'İstek', 'درخواست کریں', '请求', 'versoek', 'Anfrage', 'Αίτηση', 'Solicitud', 'अनुरोध', 'Запрос', 'Anmodning', 'Հայցել', 'მოთხოვნა', 'विनंती', 'Permintaan', 'ਬੇਨਤੀ', 'கோரிக்கை', 'అభ్యర్థన', 'Begäran', 'Hiling'),
(705, 'salary_year', 'Salary Year', 'বেতন বছর', 'سنة الراتب', 'Année de salaire', 'वेतन वर्ष', 'Tahun Gaji', 'Anno di stipendio', '給与年', '급여 연도', 'Salarisjaar', 'Salário Ano', 'เงินเดือนปี', 'Maaş Yılı', 'تنخواہ سال', '工资年', 'Salarisjaar', 'Gehaltsjahr', 'Μισθός', 'Año de salario', 'वेतन वर्ष', 'Зарплатный год', 'Lønår', 'Աշխատավարձի տարի', 'სახელფასო წელი', 'पगार वर्ष', 'Tahun Gaji', 'ਤਨਖਾਹ ਦਾ ਸਾਲ', 'சம்பள ஆண்டு', 'జీతం సంవత్సరం', 'Lönår', 'Taon ng suweldo'),
(706, 'create_attachments', 'Create Attachments', 'সংযুক্তি তৈরি করুন', 'إنشاء المرفقات', 'Créer des pièces jointes', 'अनुलग्नक बनाएँ', 'Buat Lampiran', 'Crea allegati', '添付ファイルを作成する', '첨부 파일 만들기', 'Maak bijlagen', 'Criar Anexos', 'สร้างไฟล์แนบ', 'Ek Oluştur', 'اٹیچمنٹ بنائیں', '创建附件', 'Skep aanhegsels', 'Anhänge erstellen', 'Δημιουργία Συνημμένων', 'Crear archivos adjuntos', 'एट्याचमेन्टहरू सिर्जना गर्नुहोस्', 'Создать вложения', 'Opret vedhæftede filer', 'Ստեղծեք հավելվածներ', 'შექმენით დანართები', 'संलग्नक तयार करा', 'Buat Lampiran', 'ਅਟੈਚਮੈਂਟ ਬਣਾਓ', 'இணைப்புகளை உருவாக்கவும்', 'జోడింపులను సృష్టించండి', 'Skapa bilagor', 'Lumikha ng Mga Attachment'),
(707, 'publish_date', 'Publish Date', 'প্রকাশের তারিখ', 'تاريخ النشر', 'Publish Date', 'प्रकाशित तिथि', 'Tanggal Terbit', 'Data di pubblicazione', '公開日', '게시 날짜', 'Publiceer datum', 'Data de publicação', 'วันที่เผยแพร่', 'Yayın tarihi', 'تاریخ شائع کریں', '发布日期', 'Publiseringsdatum', 'Datum der Veröffentlichung', 'Ημερομηνία δημοσίευσης', 'Fecha de publicación', 'मिति प्रकाशित गर्नुहोस्', 'Дата публикации', 'Udgivelsesdato', 'Հրապարակման ամսաթիվը', 'გამოქვეყნების თარიღი', 'प्रकाशित तारीख', 'Tarikh Penerbitan', 'ਪ੍ਰਕਾਸ਼ਤ ਮਿਤੀ', 'தேதி வெளியிடு', 'తేదీ ప్రచురించండి', 'Utgivningsdatum', 'I-publish ang Petsa'),
(708, 'attachment_file', 'Attachment File', 'উচ্চ স্বরে পড়া', 'ملف المرفق', 'Fichier joint', 'अनुलग्नक फ़ाइल', 'File Lampiran', 'File allegato', '添付ファイル', '첨부 파일', 'Bijlage', 'Ficheiro em anexo', 'ไฟล์แนบ', 'Ek dosya', 'اٹیچمنٹ فائل', '附件文件', 'Aanhegsellêer', 'Anhangsdatei', 'Αρχείο επισύναψης', 'Archivo adjunto', 'संलग्न फाईल', 'Прикрепленный файл', 'Vedhæftningsfil', 'Կցորդ ֆայլ', 'Მიმაგრებული ფაილი', 'संलग्नक फाईल', 'Fail lampiran', 'ਅਟੈਚਮੈਂਟ ਫਾਈਲ', 'இணைப்பு கோப்பு', 'జత పరచిన ఫైలు', 'Bifogad fil', 'File ng Attachment'),
(709, 'age', 'Age', 'Age', 'عمر', 'Âge', 'आयु', 'Usia', 'Età', 'Age', '나이', 'Leeftijd', 'Era', 'อายุ', 'Yaş', 'عمر', '年龄', 'ouderdom', 'Alter', 'Ηλικία', 'Años', 'उमेर', 'Возраст', 'Alder', 'Տարիք', 'ასაკი', 'वय', 'Umur', 'ਉਮਰ', 'வயது', 'వయసు', 'Ålder', 'Edad'),
(710, 'student_profile', 'Student Profile', 'ছাত্র প্রোফাইল', 'الملف الشخصي للطالب', 'Profil étudiant', 'छात्र प्रोफाइल', 'Profil Siswa', 'Profilo dello studente', '学生プロフィール', '학생 프로필', 'Profiel student', 'Perfil do aluno', 'ประวัตินักศึกษา', 'Öğrenci profili', 'طالب علم کا پروفائل', '学生简介', 'Studenteprofiel', 'Studenten Profil', 'Προφίλ μαθητή', 'Perfil de estudiante', 'विद्यार्थी प्रोफाइल', 'Профиль студента', 'Studentprofil', 'Ուսանողի պրոֆիլ', 'სტუდენტური პროფილი', 'विद्यार्थी प्रोफाइल', 'Profil Pelajar', 'ਵਿਦਿਆਰਥੀ ਪ੍ਰੋਫਾਈਲ', 'மாணவர் சுயவிவரம்', 'విద్యార్థుల ప్రొఫైల్', 'Studentprofil', 'Profile ng Mag-aaral'),
(711, 'authentication', 'Authentication', 'প্রমাণীকরণ', 'المصادقة', 'Authentification', 'प्रमाणीकरण', 'Autentikasi', 'Autenticazione', '認証', '입증', 'Authenticatie', 'Autenticação', 'การรับรอง', 'Kimlik Doğrulama', 'توثیق', '认证方式', 'verifikasie', 'Authentifizierung', 'Αυθεντικοποίηση', 'Autenticación', 'प्रमाणीकरण', 'Аутентификация', 'Godkendelse', 'Նույնականացում', 'ავთენტიფიკაცია', 'प्रमाणीकरण', 'Pengesahan', 'ਪ੍ਰਮਾਣਿਕਤਾ', 'அங்கீகார', 'ప్రామాణీకరణ', 'autentisering', 'Pagpapatunay'),
(712, 'parent_information', 'Parent Information', 'মূল তথ্য', 'معلومات الوالدين', 'Parent Information', 'जनक जानकारी', 'Informasi Induk', 'Informazioni sui genitori', '親情報', '부모 정보', 'Ouderinformatie', 'Informações aos pais', 'ข้อมูลผู้ปกครอง', 'Veli Bilgileri', 'بنیادی معلومات', '家长信息', 'Ouerinligting', 'Übergeordnete Informationen', 'Πληροφορίες γονέα', 'Información para padres', 'अभिभावक जानकारी', 'Информация для родителей', 'Forældreinformation', 'Ծնողների տեղեկությունները', 'ინფორმაცია მშობლების შესახებ', 'पालकांची माहिती', 'Maklumat Ibu Bapa', 'ਮਾਪਿਆਂ ਦੀ ਜਾਣਕਾਰੀ', 'பெற்றோர் தகவல்', 'తల్లిదండ్రుల సమాచారం', 'Förälderinformation', 'Impormasyon ng Magulang'),
(713, 'full_marks', 'Full Marks', 'পুরোপুরি লক্ষ্য', 'علامات كاملة', 'La totalité des points', 'पूरे अंक', 'Penuh dengan tanda', 'Pieni voti', 'フルマーク', '만점', 'Volle punten', 'Marcas Completas', 'คะแนนเต็ม', 'Tam Notlar', 'پورے نمبر', '满分', 'Volle punte', 'Volle Punktzahl', 'Αριστα', 'La máxima puntuación', 'पूर्ण मार्कहरू', 'Полные марки', 'Fuld markering', 'Լրիվ նշաններ', 'სრული ნიშნები', 'पूर्ण गुण', 'Markah penuh', 'ਪੂਰੇ ਅੰਕ', 'முழு மதிப்பெண்கள்', 'పూర్తి మార్కులు', 'Full poäng', 'Mga Buong Marko'),
(714, 'passing_marks', 'Passing Marks', 'পাসিং মার্কস', 'علامات النجاح', 'Marques de passage', 'पासिंग मार्क्स', 'Passing Marks', 'Segni di passaggio', '合格点', '합격점', 'Passing Marks', 'Marcas de passagem', 'เครื่องหมายการผ่าน', 'Geçme İşaretleri', 'نمبر پاس کرنا', '通过标记', 'Slaagmerke', 'Passing Marks', 'Σημάδια περασμάτων', 'Marcas de paso', 'पासिंग मार्क्स', 'Проходные Знаки', 'Videregående mærker', 'Անցնելով նշաններ', 'ნიშნის გავლა', 'उत्तीर्ण गुण', 'Tanda Lulus', 'ਅੰਕ ਪਾਸ ਕਰਦੇ ਹੋਏ', 'தேர்ச்சி மதிப்பெண்கள்', 'ఉత్తీర్ణత మార్కులు', 'Passing Marks', 'Pagpasa ng Mga Marcos'),
(715, 'highest_marks', 'Highest Marks', 'সর্বোচ্চ নম্বর', 'أعلى العلامات', 'Marques les plus élevées', 'सबसे ऊँचे निशान', 'Nilai Tertinggi', 'I voti più alti', '最高点', '최고 점수', 'Hoogste punten', 'Marcas mais altas', 'เครื่องหมายสูงสุด', 'En Yüksek İşaretler', 'اعلی ترین نمبر', '最高分数', 'Hoogste punte', 'Höchste Punktzahl', 'Υψηλότερες βαθμολογίες', 'Marcas más altas', 'उच्चतम मार्क्स', 'Высшие оценки', 'Højeste mærker', 'Ամենաբարձր նշանները', 'უმაღლესი ნიშნები', 'सर्वोच्च गुण', 'Tanda Tertinggi', 'ਉੱਚੇ ਅੰਕ', 'அதிக மதிப்பெண்கள்', 'అత్యధిక మార్కులు', 'Högsta märken', 'Pinakamataas na Marks'),
(716, 'unknown', 'Unknown', 'অজানা', 'مجهول', 'Inconnue', 'अनजान', 'Tidak dikenal', 'Sconosciuto', 'わからない', '알 수 없는', 'Onbekend', 'Desconhecido', 'ไม่ทราบ', 'Bilinmeyen', 'نامعلوم', '未知', 'onbekend', 'Unbekannt', 'Αγνωστος', 'Desconocido', 'अज्ञात', 'неизвестный', 'Ukendt', 'Անհայտ', 'უცნობია', 'अज्ञात', 'Tidak diketahui', 'ਅਣਜਾਣ', 'தெரியவில்லை', 'తెలియని', 'Okänd', 'Hindi kilala'),
(717, 'unpublish', 'Unpublish', 'অপ্রকাশিত', 'غير منشور', 'Annuler la publication', 'अप्रकाशित', 'Batalkan publikasi', 'Non pubblicato', '非公開', '게시 취소', 'Publicatie ongedaan maken', 'Cancelar publicação', 'ยกเลิกการเผยแพร่', 'Yayından Kaldır', 'اشاعت نہ کریں', '取消发布', 'Depubliseer', 'Nicht veröffentlichen', 'Κατάργηση δημοσίευσης', 'Anular publicación', 'अप्रकाशित गर्नुहोस्', 'Отменить публикацию', 'Afpublicer', 'Չհրապարակել', 'გამოქვეყნება', 'अप्रकाशित', 'Nyahterbitkan', 'ਪ੍ਰਕਾਸ਼ਤ ਨਾ ਕਰੋ', 'வெளியிட வேண்டாம்', 'ప్రచురించని', 'Avpublicera', 'Hindi mai-publish'),
(718, 'login_authentication_deactivate', 'Login Authentication Deactivate', 'লগইন প্রমাণীকরণ নিষ্ক্রিয় করুন', 'إلغاء تنشيط مصادقة تسجيل الدخول', 'Authentification de connexion désactivée', 'लॉगिन प्रमाणीकरण निष्क्रिय करें', 'Otentikasi Login Nonaktifkan', 'Autenticazione di accesso Disattivata', 'ログイン認証の無効化', '로그인 인증 비활성화', 'Aanmeldingsverificatie Deactiveren', 'Autenticação de login desativada', 'การรับรองความถูกต้องเข้าสู่ระบบปิดการใช้งาน', 'Giriş Kimlik Doğrulaması Devre Dışı Bırak', 'لاگ ان کی توثیق غیر فعال کریں', '登录身份验证停用', 'Aanmelding-verifikasie deaktiveer', 'Login-Authentifizierung deaktivieren', 'Απενεργοποίηση ελέγχου ταυτότητας σύνδεσης', 'Autenticación de inicio de sesión Desactivar', 'लग इन प्रमाणीकरण निष्क्रिय', 'Аутентификация входа отключена', 'Login-godkendelse Deaktiver', 'Մուտքագրեք վավերացման անջատումը', 'ავტორიზაციის ავტორიზაცია გამორთეთ', 'लॉगिन प्रमाणीकरण निष्क्रिय करा', 'Log Masuk Pengesahan Nyahaktifkan', 'ਲੌਗਿਨ ਪ੍ਰਮਾਣੀਕਰਣ ਨੂੰ ਅਯੋਗ ਕਰੋ', 'உள்நுழைவு அங்கீகாரம் செயலிழக்க', 'లాగిన్ ప్రామాణీకరణ నిష్క్రియం చేయండి', 'Inloggningsautentisering Inaktivera', 'Pag-aktibo sa Pag-login ng Pag-login'),
(719, 'employee_profile', 'Employee Profile', 'কর্মচারী প্রোফাইল', 'ملف تعريف الموظف', 'Profil d\'employé', 'कर्मचारी प्रोफ़ाइल', 'Profil Karyawan', 'Profilo del dipendente', '従業員プロフィール', '직원 프로필', 'Profiel van de werknemer', 'Perfil do Funcionário', 'รายละเอียดพนักงาน', 'İşçi profili', 'ملازم پروفائل', '员工档案', 'Werknemersprofiel', 'Angestelltenprofil', 'Προφίλ εργαζομένων', 'Perfil de empleado', 'कर्मचारी प्रोफाइल', 'Профиль сотрудника', 'Medarbejderprofil', 'Աշխատակիցների պրոֆիլը', 'თანამშრომელთა პროფილი', 'कर्मचारी प्रोफाइल', 'Profil Pekerja', 'ਕਰਮਚਾਰੀ ਪ੍ਰੋਫਾਈਲ', 'பணியாளர் சுயவிவரம்', 'ఉద్యోగుల ప్రొఫైల్', 'Anställdsprofil', 'Profile ng empleyado'),
(720, 'employee_details', 'Employee Details', 'কর্মচারীর বিবরণ', 'تفاصيل الموظف', 'Détails de l\'employé', 'कर्मचारी विवरण', 'Detail Karyawan', 'Dettagli dei dipendenti', '従業員の詳細', '직원 세부 사항', 'Werknemersdetails', 'Detalhes do Funcionário', 'รายละเอียดพนักงาน', 'Çalışan bilgileri', 'ملازمین کی تفصیلات', '员工明细', 'Besonderhede van werknemers', 'Mitarbeiterdetails', 'Στοιχεία υπαλλήλου', 'Detalles sobre empleados', 'कर्मचारी विवरण', 'Данные сотрудника', 'Medarbejderoplysninger', 'Աշխատակիցների մանրամասները', 'თანამშრომლის დეტალები', 'कर्मचार्‍यांचा तपशील', 'Maklumat Pekerja', 'ਕਰਮਚਾਰੀ ਦਾ ਵੇਰਵਾ', 'பணியாளர் விவரங்கள்', 'ఉద్యోగుల వివరాలు', 'Information om anställda', 'Mga Detalye ng empleyado'),
(721, 'salary_transaction', 'Salary Transaction', 'বেতন লেনদেন', 'معاملة الراتب', 'Transaction salariale', 'वेतन का लेन-देन', 'Transaksi Gaji', 'Transazione salariale', '給与取引', '급여 거래', 'Salaris transactie', 'Transação Salarial', 'การทำธุรกรรมเงินเดือน', 'Maaş İşlemleri', 'تنخواہ کا لین دین', '薪金交易', 'Salaristransaksie', 'Gehaltsabwicklung', 'Συναλλαγή μισθού', 'Transacción Salarial', 'वेतन लेनदेन', 'Зарплатная сделка', 'Lønstransaktion', 'Աշխատավարձի գործարք', 'სახელფასო გარიგება', 'पगार व्यवहार', 'Urus Niaga Gaji', 'ਤਨਖਾਹ ਲੈਣ-ਦੇਣ', 'சம்பள பரிவர்த்தனை', 'జీతం లావాదేవీ', 'Lönstransaktion', 'Transaksyon ng Salary'),
(722, 'documents', 'Documents', 'কাগজপত্র', 'مستندات', 'Documents', 'दस्तावेज़', 'Dokumen', 'Documenti', '書類', '서류', 'Documenten', 'Documentos', 'เอกสาร', 'evraklar', 'دستاویزات', '文件资料', 'dokumente', 'Unterlagen', 'Εγγραφα', 'Documentos', 'कागजात', 'документы', 'Dokumenter', 'Փաստաթղթեր', 'დოკუმენტები', 'कागदपत्रे', 'Dokumen', 'ਦਸਤਾਵੇਜ਼', 'ஆவணங்கள்', 'పత్రాలు', 'Dokument', 'Mga dokumento'),
(723, 'actions', 'Actions', 'ক্রিয়াকলাপ', 'أجراءات', 'Actions', 'क्रिया', 'Tindakan', 'Azioni', '行動', '행위', 'Acties', 'Ações', 'การปฏิบัติ', 'Hareketler', 'عمل', '动作', 'aksies', 'Aktionen', 'Ενέργειες', 'Comportamiento', 'कार्यहरू', 'действия', 'Handlinger', 'Գործողություններ', 'მოქმედებები', 'क्रिया', 'Tindakan', 'ਕਾਰਵਾਈਆਂ', 'செயல்கள்', 'చర్యలు', 'Åtgärder', 'Mga Pagkilos'),
(724, 'activity', 'Activity', 'কার্যকলাপ', 'نشاط', 'Activité', 'गतिविधि', 'Aktivitas', 'Attività', 'アクティビティ', '활동', 'Werkzaamheid', 'Atividade', 'กิจกรรม', 'Aktivite', 'سرگرمی', '活动', 'aktiwiteit', 'Aktivität', 'Δραστηριότητα', 'Actividad', 'गतिविधि', 'Деятельность', 'Aktivitet', 'Գործունեություն', 'აქტივობა', 'क्रियाकलाप', 'Aktiviti', 'ਸਰਗਰਮੀ', 'செயல்பாடு', 'కార్యాచరణ', 'Aktivitet', 'Aktibidad'),
(725, 'department_list', 'Department List', 'বিভাগ তালিকা', 'قائمة الأقسام', 'Liste des départements', 'विभाग की सूची', 'Daftar Departemen', 'Elenco dipartimentale', '部門一覧', '부서리스트', 'Afdelingslijst', 'Lista de departamentos', 'รายชื่อกรม', 'Bölüm Listesi', 'محکمہ کی فہرست', '部门清单', 'Afdelingslys', 'Abteilungsliste', 'Λίστα Τμημάτων', 'Lista de departamentos', 'विभाग सूची', 'Список отделов', 'Afdelingsliste', 'Բաժանմունքի ցուցակ', 'დეპარტამენტის სია', 'विभाग यादी', 'Senarai Jabatan', 'ਵਿਭਾਗ ਸੂਚੀ', 'துறை பட்டியல்', 'విభాగం జాబితా', 'Avdelningslista', 'Listahan ng Kagawaran'),
(726, 'manage_employee_salary', 'Manage Employee Salary', 'কর্মচারীদের বেতন পরিচালনা করুন', 'إدارة راتب الموظف', 'Gérer le salaire des employés', 'कर्मचारी वेतन का प्रबंधन करें', 'Kelola Gaji Karyawan', 'Gestire il salario dei dipendenti', '従業員の給与を管理する', '직원 급여 관리', 'Beheer werknemer salaris', 'Gerenciar salário dos funcionários', 'จัดการเงินเดือนพนักงาน', 'Çalışan Maaşını Yönetin', 'ملازمین کی تنخواہ کا انتظام کریں', '管理员工工资', 'Bestuur werknemerssalaris', 'Mitarbeitergehalt verwalten', 'Διαχείριση μισθού υπαλλήλων', 'Administrar el salario del empleado', 'कर्मचारी वेतन प्रबन्ध गर्नुहोस्', 'Управление зарплатой сотрудников', 'Administrer medarbejderløn', 'Կառավարեք աշխատողների աշխատավարձը', 'მართეთ თანამშრომელთა ხელფასი', 'कर्मचारी पगार व्यवस्थापित करा', 'Urus Gaji Pekerja', 'ਕਰਮਚਾਰੀ ਤਨਖਾਹ ਦਾ ਪ੍ਰਬੰਧ ਕਰੋ', 'பணியாளர் சம்பளத்தை நிர்வகிக்கவும்', 'ఉద్యోగుల జీతం నిర్వహించండి', 'Hantera anställdslön', 'Pamahalaan ang suweldo ng empleyado'),
(727, 'the_configuration_has_been_updated', 'The Configuration Has Been Updated', 'কনফিগারেশন আপডেট হয়েছে', 'تم تحديث التكوين', 'La configuration a été mise à jour', 'कॉन्फ़िगरेशन अद्यतन किया गया है', 'Konfigurasi Telah Diperbarui', 'La configurazione è stata aggiornata', '構成が更新されました', '구성이 업데이트되었습니다', 'De configuratie is bijgewerkt', 'A configuração foi atualizada', 'อัปเดตการกำหนดค่าแล้ว', 'Yapılandırma Güncellendi', 'تشکیل تازہ کاری ہوگئی ہے', '配置已更新', 'Die konfigurasie is opgedateer', 'Die Konfiguration wurde aktualisiert', 'Η διαμόρφωση έχει ενημερωθεί', 'La configuración ha sido actualizada', 'कन्फिगरेसन अपडेट भयो', 'Конфигурация была обновлена', 'Konfigurationen er blevet opdateret', 'Կազմաձևը թարմացվել է', 'კონფიგურაცია განახლდა', 'कॉन्फिगरेशन अद्ययावत झाली आहे', 'Konfigurasi Telah Dikemas kini', 'ਕੌਨਫਿਗਰੇਸ਼ਨ ਅਪਡੇਟ ਹੋ ਗਈ ਹੈ', 'உள்ளமைவு புதுப்பிக்கப்பட்டது', 'కాన్ఫిగరేషన్ నవీకరించబడింది', 'Konfigurationen har uppdaterats', 'Ang Pag-configure Ay Na-update'),
(728, 'add', 'Add', 'যোগ', 'أضف', 'Ajouter', 'जोड़ना', 'Menambahkan', 'Inserisci', '追加', '더하다', 'Toevoegen', 'Adicionar', 'เพิ่ม', 'Ekle', 'شامل کریں', '加', 'Voeg', 'Hinzufügen', 'Προσθήκη', 'Añadir', 'थप्नुहोस्', 'Добавить', 'Tilføje', 'Ավելացնել', 'დამატება', 'जोडा', 'Tambah', 'ਸ਼ਾਮਲ ਕਰੋ', 'கூட்டு', 'చేర్చు', 'Lägg till', 'Idagdag'),
(729, 'create_exam', 'Create Exam', 'পরীক্ষা তৈরি করুন', 'إنشاء امتحان', 'Créer un examen', 'परीक्षा बनाएँ', 'Buat Ujian', 'Crea esame', '試験を作成', '시험 만들기', 'Examen maken', 'Criar exame', 'สร้างการสอบ', 'Sınav Oluştur', 'امتحان بنائیں', '创建考试', 'Skep eksamen', 'Prüfung erstellen', 'Δημιουργία εξέτασης', 'Crear examen', 'परीक्षा सिर्जना गर्नुहोस्', 'Создать экзамен', 'Opret eksamen', 'Ստեղծեք քննություն', 'გამოცდის შექმნა', 'परीक्षा तयार करा', 'Buat Peperiksaan', 'ਪ੍ਰੀਖਿਆ ਬਣਾਓ', 'தேர்வை உருவாக்குங்கள்', 'పరీక్షను సృష్టించండి', 'Skapa examen', 'Lumikha ng Exam'),
(730, 'term', 'Term', 'শব্দ', 'مصطلح', 'Terme', 'अवधि', 'Istilah', 'Termine', '期間', '기간', 'Termijn', 'Prazo', 'วาระ', 'terim', 'اصطلاح', '术语', 'termyn', 'Begriff', 'Ορος', 'Término', 'अवधि', 'Срок', 'Semester', 'Ժամկետ', 'ვადა', 'मुदत', 'Jangka masa', 'ਮਿਆਦ', 'கால', 'టర్మ్', 'Termin', 'Kataga'),
(731, 'add_term', 'Add Term', 'টার্ম যুক্ত করুন', 'إضافة مصطلح', 'Ajouter un terme', 'शब्द जोड़ें', 'Tambahkan Istilah', 'Aggiungi termine', '用語を追加', '용어 추가', 'Term toevoegen', 'Adicionar termo', 'เพิ่มคำ', 'Terim Ekle', 'اصطلاح شامل کریں', '加词', 'Voeg termyn by', 'Begriff hinzufügen', 'Προσθήκη όρου', 'Agregar término', 'अवधि थप्नुहोस्', 'Добавить термин', 'Tilføj term', 'Ավելացնել ժամկետ', 'ვადის დამატება', 'मुदत जोडा', 'Tambah Istilah', 'ਅਵਧੀ ਸ਼ਾਮਲ ਕਰੋ', 'காலத்தைச் சேர்க்கவும்', 'టర్మ్ జోడించండి', 'Lägg till term', 'Magdagdag ng Term'),
(732, 'create_grade', 'Create Grade', 'গ্রেড তৈরি করুন', 'إنشاء تقدير', 'Créer une note', 'ग्रेड बनाएँ', 'Buat Grade', 'Crea grado', 'グレードを作成', '학년 만들기', 'Cijfer maken', 'Criar nota', 'สร้างเกรด', 'Not Oluştur', 'گریڈ بنائیں', '创建成绩', 'Skep graad', 'Note erstellen', 'Δημιουργία βαθμού', 'Crear calificación', 'ग्रेड सिर्जना गर्नुहोस्', 'Создать оценку', 'Opret karakter', 'Ստեղծեք դասարան', 'კლასების შექმნა', 'ग्रेड तयार करा', 'Buat Gred', 'ਗ੍ਰੇਡ ਬਣਾਓ', 'தரத்தை உருவாக்கவும்', 'గ్రేడ్ సృష్టించండి', 'Skapa betyg', 'Lumikha ng Baitang'),
(733, 'mark_starting', 'Mark Starting', 'শুরুর চিহ্ন', 'علامة البداية', 'Mark Starting', 'मार्क स्टार्टिंग', 'Tandai Mulai', 'Segna inizio', '開始をマーク', '마크 시작', 'Mark Start', 'Marcar partida', 'ทำเครื่องหมายว่ากำลังเริ่มต้น', 'Başlangıç ​​Olarak İşaretle', 'مارک اسٹارٹنگ', '马克开始', 'Merk begin', 'Markieren Sie Start', 'Έναρξη έναρξης', 'Marcar inicio', 'मार्क शुरू गर्दै', 'Отметить начало', 'Mark starter', 'Սկսել Mark', 'ნიშნის დაწყება', 'प्रारंभ चिन्हांकित करा', 'Tandakan Bermula', 'ਮਾਰਕ ਸਟਾਰਟਿੰਗ', 'குறி தொடங்குதல்', 'ప్రారంభం గుర్తు', 'Mark Starta', 'Markahan Simula'),
(734, 'mark_until', 'Mark Until', 'অবধি চিহ্নিত করুন', 'ضع علامة حتى', 'Marquer jusqu\'à', 'तब तक मार्क करें', 'Tandai Sampai', 'Mark Until', 'マークするまで', '마크까지', 'Markeren tot', 'Marcar até', 'ทำเครื่องหมายจนถึง', 'Bitiş', 'جب تک نشان زد کریں', '直到', 'Merk tot', 'Markieren Sie bis', 'Μαρκ μέχρι', 'Marcar hasta', 'सम्म मार्क गर्नुहोस्', 'Марк До', 'Markér indtil', 'Նշել մինչև', 'მარკი სანამ', 'पर्यंत चिन्हांकित करा', 'Tandakan Sehingga', 'ਜਦ ਤੱਕ ਮਾਰਕ ਕਰੋ', 'வரை குறிக்கவும்', 'వరకు గుర్తించండి', 'Markera tills', 'Markahan Hanggang'),
(735, 'room_list', 'Room List', 'রুম তালিকা', 'قائمة غرفة', 'Liste des chambres', 'कक्ष सूची', 'Daftar Kamar', 'Elenco camere', '部屋一覧', '방 목록', 'Kamerlijst', 'Lista de quartos', 'รายชื่อห้อง', 'Oda listesi', 'کمرے کی فہرست', '房间清单', 'Kamerlys', 'Zimmerliste', 'Λίστα δωματίων', 'Lista de habitaciones', 'कोठा सूची', 'Список номеров', 'Værelsesliste', 'Սենյակների ցուցակ', 'ოთახების სია', 'खोली यादी', 'Senarai Bilik', 'ਕਮਰੇ ਦੀ ਸੂਚੀ', 'அறை பட்டியல்', 'గది జాబితా', 'Rumslista', 'Listahan ng Silid'),
(736, 'room', 'Room', 'ঘর', 'غرفة', 'Chambre', 'कक्ष', 'Kamar', 'Camera', 'ルーム', '방', 'Kamer', 'Sala', 'ห้อง', 'Oda', 'کمرہ', '房间', 'kamer', 'Zimmer', 'Δωμάτιο', 'Habitación', 'कोठा', 'Номер', 'Værelse', 'Սենյակ', 'ოთახი', 'खोली', 'Bilik', 'ਕਮਰਾ', 'அறை', 'గది', 'Rum', 'Kwarto'),
(737, 'route_list', 'Route List', 'রুটের তালিকা', 'قائمة المسار', 'Liste des itinéraires', 'मार्ग सूची', 'Daftar Rute', 'Elenco rotte', 'ルートリスト', '노선 목록', 'Routelijst', 'Lista de rotas', 'รายการเส้นทาง', 'Güzergah Listesi', 'روٹ کی فہرست', '路线清单', 'Roete Lys', 'Routenliste', 'Λίστα διαδρομών', 'Lista de ruta', 'मार्ग सूची', 'Список маршрутов', 'Ruteliste', 'Երթուղիների ցուցակ', 'მარშრუტების სია', 'मार्ग सूची', 'Senarai Laluan', 'ਰਸਤੇ ਦੀ ਸੂਚੀ', 'பாதை பட்டியல்', 'మార్గం జాబితా', 'Ruttlista', 'Listahan ng Ruta'),
(738, 'create_route', 'Create Route', 'রুট তৈরি করুন', 'إنشاء طريق', 'Créer un itinéraire', 'रूट बनाएं', 'Buat Rute', 'Crea percorso', 'ルートを作成', '경로 만들기', 'Create Route', 'Criar rota', 'สร้างเส้นทาง', 'Rota Oluştur', 'روٹ بنائیں', '建立路线', 'Skep roete', 'Route erstellen', 'Δημιουργία διαδρομής', 'Crear ruta', 'मार्ग सिर्जना गर्नुहोस्', 'Создать маршрут', 'Opret rute', 'Ստեղծեք երթուղի', 'მარშრუტის შექმნა', 'मार्ग तयार करा', 'Buat Laluan', 'ਮਾਰਗ ਬਣਾਓ', 'வழியை உருவாக்கவும்', 'మార్గాన్ని సృష్టించండి', 'Skapa rutt', 'Lumikha ng Ruta'),
(739, 'vehicle_list', 'Vehicle List', 'যানবাহনের তালিকা', 'قائمة المركبات', 'Liste des véhicules', 'वाहन सूची', 'Daftar Kendaraan', 'Elenco dei veicoli', '車両リスト', '차량 목록', 'Voertuiglijst', 'Lista de Veículos', 'รายการยานพาหนะ', 'Araç Listesi', 'گاڑیوں کی فہرست', '车辆清单', 'Voertuiglys', 'Fahrzeugliste', 'Λίστα οχημάτων', 'Lista de vehículos', 'सवारी सूची', 'Список транспортных средств', 'Køretøjsliste', 'Տրանսպորտային միջոցների ցուցակը', 'მანქანების სია', 'वाहनांची यादी', 'Senarai Kenderaan', 'ਵਾਹਨ ਸੂਚੀ', 'வாகன பட்டியல்', 'వాహనాల జాబితా', 'Fordonslista', 'Listahan ng Sasakyan'),
(740, 'create_vehicle', 'Create Vehicle', 'যানবাহন তৈরি করুন', 'إنشاء مركبة', 'Créer un véhicule', 'वाहन बनाएँ', 'Buat Kendaraan', 'Crea veicolo', '車両を作成', '차량 만들기', 'Maak voertuig', 'Criar veículo', 'สร้างยานพาหนะ', 'Araç Yarat', 'گاڑیاں بنائیں', '创建车辆', 'Skep voertuig', 'Fahrzeug erstellen', 'Δημιουργία οχήματος', 'Crear vehículo', 'सवारी बनाउनुहोस्', 'Создать автомобиль', 'Opret køretøj', 'Ստեղծեք մեքենա', 'შექმენით მანქანა', 'वाहन तयार करा', 'Buat Kenderaan', 'ਵਾਹਨ ਬਣਾਓ', 'வாகனம் உருவாக்கவும்', 'వాహనాన్ని సృష్టించండి', 'Skapa fordon', 'Lumikha ng Sasakyan'),
(741, 'stoppage_list', 'Stoppage List', 'স্টপেজ তালিকা', 'قائمة التوقف', 'Liste des arrêts', 'ठहराव सूची', 'Daftar Penghentian', 'Elenco di interruzione', '停止リスト', '파업 목록', 'Lijst met onderbrekingen', 'Lista de interrupções', 'รายการหยุด', 'Durma Listesi', 'اسٹاپ پیج کی فہرست', '停工清单', 'Stoppelys', 'Stoppliste', 'Λίστα διακοπών', 'Lista de paro', 'स्टपपेज सूची', 'Список остановок', 'Stoppeliste', 'Կանգառների ցուցակը', 'გაჩერების სია', 'थांबा यादी', 'Senarai Berhenti', 'ਰੁਕਣ ਦੀ ਸੂਚੀ', 'நிறுத்த பட்டியல்', 'ఆపు జాబితా', 'Stopplista', 'Listahan ng Pagtatakip'),
(742, 'create_stoppage', 'Create Stoppage', 'স্টপেজ তৈরি করুন', 'إنشاء توقف', 'Créer un arrêt', 'स्टॉपेज बनाएं', 'Buat Penghentian', 'Crea interruzione', '停止を作成', '중단 만들기', 'Maak onderbreking', 'Criar parada', 'สร้างการหยุด', 'Duruş Oluştur', 'اسٹاپ پیج بنائیں', '创建停工', 'Skep stopwerk', 'Stopp erstellen', 'Δημιουργία διακοπής', 'Crear paro', 'स्टपपेज सिर्जना गर्नुहोस्', 'Создать остановку', 'Opret stop', 'Ստեղծեք կանգառ', 'შექმენით Stoppage', 'स्टॉपपेज तयार करा', 'Buat Stoppage', 'ਸਟਾਪਪੇਜ ਬਣਾਓ', 'நிறுத்தத்தை உருவாக்கவும்', 'ఆపును సృష్టించండి', 'Skapa stopp', 'Lumikha ng Stoppage'),
(743, 'stop_time', 'Stop Time', 'সময় বন্ধ', 'وقت التوقف', 'Temps d\'arrêt', 'रुकने का समय', 'Hentikan waktu', 'Tempo di stop', '停止時間', '정지 시간', 'Stoptijd', 'Pare o tempo', 'หยุดเวลา', 'Durma zamanı', 'سٹاپ ٹائم', '停止时间', 'Stop tyd', 'Stoppzeit', 'Ώρα διακοπής', 'Para el tiempo', 'समय रोक्नुहोस्', 'Остановить время', 'Stop Time', 'Դադարեցրեք ժամանակը', 'გაჩერდი დრო', 'थांबा वेळ', 'Masa Berhenti', 'ਰੋਕਣ ਦਾ ਸਮਾਂ', 'நேரத்தை நிறுத்துங்கள்', 'సమయం ఆపు', 'Stanna tiden', 'Itigil ang Oras'),
(744, 'employee_attendance', 'Employee Attendance', 'কর্মচারী উপস্থিতি', 'حضور الموظف', 'Présence des employés', 'कर्मचारी की उपस्थिति', 'Kehadiran Karyawan', 'Partecipazione dei dipendenti', '従業員の出席', '직원 출석', 'Aanwezigheid van werknemers', 'Atendimento ao Empregado', 'พนักงานเข้าร่วม', 'Çalışan Seyirci', 'ملازمت کی حاضری', '员工出勤', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(745, 'attendance_report', 'Employee Attendance', 'কর্মচারী উপস্থিতি', 'حضور الموظف', 'Présence des employés', 'कर्मचारी की उपस्थिति', 'Kehadiran Karyawan', 'Partecipazione dei dipendenti', '従業員の出席', '직원 출석', 'Aanwezigheid van werknemers', 'Participação dos funcionários', 'การเข้าร่วมของพนักงาน', 'Çalışan Katılımı', 'ملازمین کی حاضری', '员工出勤', 'Werknemerbywoning', 'Mitarbeiterbetreuung', 'Συμμετοχή εργαζομένων', 'Asistencia de empleados', 'कर्मचारी उपस्थिति', 'Посещаемость сотрудника', 'Medarbejderdeltagelse', 'Աշխատակիցների հաճախում', 'თანამშრომელთა დასწრება', 'कर्मचार्‍यांची उपस्थिती', 'Kehadiran Pekerja', 'ਕਰਮਚਾਰੀ ਦੀ ਹਾਜ਼ਰੀ', 'பணியாளர் வருகை', 'ఉద్యోగుల హాజరు', 'Anställdas närvaro', 'Pagdalo ng empleyado'),
(746, 'opening_balance', 'Opening Balance', 'খোলার ভারসাম্য', 'الرصيد الافتتاحي', 'Solde d\'ouverture', 'प्रारंभिक शेष', 'Saldo awal', 'Saldo di apertura', '期首残高', '기초 잔액', 'Beginsaldo', 'Saldo inicial', 'ยอดคงเหลือต้นงวด', 'Açılış bilançosu', 'بیلنس کھولنا', '期初余额', 'Beginsaldo', 'Anfangsbestand', 'Ισολογισμός έναρξης', 'Saldo de apertura', 'ब्यालेन्स खोल्दै', 'Начальное сальдо', 'Åbnings balance', 'Բացման հաշվեկշիռը', 'Საწყისი ნაშთი', 'प्रारंभिक शिल्लक', 'Baki Pembukaan', 'ਬਕਾਇਆ ਖੁੱਲ੍ਹਣਾ', 'ஆரம்ப இருப்பு', 'ప్రారంభ నిల్వ', 'Öppningsbalans', 'Pagbabalanse ng Pagbubukas'),
(747, 'add_opening_balance', 'Add Opening Balance', 'উদ্বোধনী ব্যালেন্স যুক্ত করুন', 'إضافة رصيد افتتاحي', 'Ajouter un solde d\'ouverture', 'ओपनिंग बैलेंस जोड़ें', 'Tambahkan Saldo Pembukaan', 'Aggiungi saldo iniziale', '期首残高を追加', '기초 잔액 추가', 'Beginsaldo toevoegen', 'Adicionar saldo inicial', 'เพิ่มยอดคงเหลือต้นงวด', 'Açılış Bakiyesi Ekle', 'کھلنے کا توازن شامل کریں', '添加期初余额', 'Voeg openingsaldo by', 'Eröffnungsguthaben hinzufügen', 'Προσθήκη υπολοίπου ανοίγματος', 'Agregar saldo inicial', 'खुला ब्यालेन्स थप्नुहोस्', 'Добавить начальное сальдо', 'Tilføj åbningsbalance', 'Ավելացնել բացման մնացորդ', 'გახსნის ბალანსს', 'उघडण्याचे शिल्लक जोडा', 'Tambah Baki Pembukaan', 'ਉਦਘਾਟਨੀ ਸੰਤੁਲਨ ਸ਼ਾਮਲ ਕਰੋ', 'திறப்பு இருப்பு சேர்க்கவும்', 'ఓపెనింగ్ బ్యాలెన్స్ జోడించండి', 'Lägg till öppningsbalans', 'Magdagdag ng Pagbubukas Balanse'),
(748, 'credit', 'Credit', 'ধার', 'ائتمان', 'Crédit', 'श्रेय', 'Kredit', 'Credito', 'クレジット', '신용', 'Credit', 'Crédito', 'เครดิต', 'Kredi', 'کریڈٹ', '信用', 'krediet', 'Anerkennung', 'Πίστωση', 'Crédito', 'क्रेडिट', 'кредит', 'Kredit', 'Վարկ', 'კრედიტი', 'जमा', 'Kredit', 'ਕ੍ਰੈਡਿਟ', 'கடன்', 'క్రెడిట్', 'Kreditera', 'Kredito'),
(749, 'debit', 'Debit', 'খরচ', 'مدين', 'Débit', 'नामे', 'Debit', 'Addebito', 'デビット', '직불', 'Debiteren', 'Débito', 'หักบัญชี', 'borç', 'ڈیبٹ', '借方', 'debiet-', 'Lastschrift', 'Χρέωση', 'Débito', 'डेबिट', 'Дебет', 'Debit', 'Դեբետ', 'Სადებეტო', 'डेबिट', 'Debit', 'ਡੈਬਿਟ', 'பற்று', 'డెబిట్', 'Debitera', 'Utang'),
(750, 'opening_balance_list', 'Opening Balance List', 'খোলার ভারসাম্য তালিকা', 'قائمة الرصيد الافتتاحي', 'liste des soldes d\'ouverture', 'संतुलन सूची खोलना', 'membuka daftar saldo', 'elenco di bilancio di apertura', '期首残高リスト', '기초 잔액리스트', 'openingsbalanslijst', 'lista de balanços de abertura', 'รายการสมดุลการเปิด', 'bakiye listesini açma', 'افتتاحی توازن کی فہرست', '期初余额清单', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(751, 'voucher_list', 'Voucher List', 'ভাউচার তালিকা', 'قائمة القسائم', 'Liste des bons', 'वाउचर सूची', 'Daftar Voucher', 'Elenco dei buoni', 'バウチャーリスト', '바우처리스트', 'Voucher lijst', 'Lista de Vouchers', 'รายการบัตรกำนัล', 'Kupon Listesi', 'واؤچر لسٹ', '凭证清单', 'Koopbewyslys', 'Gutscheinliste', 'Λίστα κουπονιών', 'Lista de cupones', 'भौचर सूची', 'Список ваучеров', 'Voucher liste', 'Վաուչերի ցուցակ', 'ვაუჩერების სია', 'व्हाउचर यादी', 'Senarai Baucar', 'ਵਾouਚਰ ਲਿਸਟ', 'வவுச்சர் பட்டியல்', 'వోచర్ జాబితా', 'Voucher List', 'Listahan ng Voucher'),
(752, 'voucher_head', 'Voucher Head', 'ভাউচার হেড', 'رئيس قسيمة', 'Tête de bon', 'वाउचर प्रमुख', 'Kepala Voucher', 'Voucher Head', 'バウチャーヘッド', '바우처 헤드', 'Hoofd voucher', 'Chefe de comprovante', 'หัวหน้าบัตรกำนัล', 'Kupon Başlığı', 'واؤچر ہیڈ', '凭证头', 'Koopbewyshoof', 'Gutscheinkopf', 'Κεφάλαιο κουπονιού', 'Cabeza de bono', 'भौचर हेड', 'Ваучер Глава', 'Voucher Head', 'Վաուչերի ղեկավար', 'ვაუჩერის ხელმძღვანელი', 'व्हाउचर प्रमुख', 'Kepala Baucar', 'ਵਾouਚਰ ਹੈੱਡ', 'வவுச்சர் தலை', 'వోచర్ హెడ్', 'Voucher Head', 'Voucher Head'),
(753, 'payment_method', 'Payment Method', 'মূল্যপরিশোধ পদ্ধতি', 'طريقة الدفع او السداد', 'Mode de paiement', 'भुगतान का तरीका', 'Cara Pembayaran', 'Metodo di pagamento', '支払方法', '결제 방법', 'Betalingswijze', 'Forma de pagamento', 'วิธีการชำระเงิน', 'Ödeme şekli', 'ادائیگی کا طریقہ', '付款方法', 'Betalings metode', 'Bezahlverfahren', 'Μέθοδος πληρωμής', 'Método de pago', 'भुक्तानी विधि', 'Способ оплаты', 'Betalingsmetode', 'Վճարման եղանակ', 'Გადახდის საშუალება', 'देय द्यायची पद्धत', 'Kaedah Pembayaran', 'ਭੁਗਤਾਨੇ ਦੇ ਢੰਗ', 'கட்டணம் செலுத்தும் முறை', 'పైకము చెల్లించు విదానం', 'Betalningsmetod', 'Paraan ng Pagbayad'),
(754, 'credit_ledger_account', 'Credit Ledger Account', 'ক্রেডিট লেজার অ্যাকাউন্ট', 'حساب دفتر الأستاذ الائتماني', 'Compte de crédit', 'क्रेडिट लेजर खाता', 'Akun Buku Besar Kredit', 'Conto contabilità', '信用元帳アカウント', '대변 ​​원장 계정', 'Kredietgrootboekrekening', 'Conta do razão de crédito', 'บัญชีแยกประเภทเครดิต', 'Kredi Defteri Hesabı', 'کریڈٹ لیجر اکاؤنٹ', '信用分类帐帐户', 'Kredietboekrekening', 'Kredit-Ledger-Konto', 'Λογαριασμός πιστωτικού βιβλίου', 'Cuenta de libro mayor de crédito', 'क्रेडिट लेजर खाता', 'Счет кредитной книги', 'Kreditkonto', 'Վարկային գծի հաշիվ', 'საკრედიტო ლეჯერის ანგარიში', 'क्रेडिट लेजर खाते', 'Akaun Lejar Kredit', 'ਕ੍ਰੈਡਿਟ ਲੇਜ਼ਰ ਖਾਤਾ', 'கடன் லெட்ஜர் கணக்கு', 'క్రెడిట్ లెడ్జర్ ఖాతా', 'Kreditbokbok', 'Credit Ledger Account'),
(755, 'debit_ledger_account', 'Debit Ledger Account', 'ডেবিট লেজার অ্যাকাউন্ট', 'حساب دفتر الأستاذ المدين', 'Compte du livre de débit', 'डेबिट लेजर खाता', 'Akun Buku Besar Debet', 'Conto contabilità clienti', '借方元帳勘定', '차변 원장 계정', 'Debet Grootboekrekening', 'Conta do razão de débito', 'เดบิตบัญชีแยกประเภท', 'Borç Defteri Hesabı', 'ڈیبٹ لیجر اکاؤنٹ', '借方分类帐帐户', 'Debiet Grootboekrekening', 'Debit-Ledger-Konto', 'Λογαριασμός χρεωστικού καθολικού', 'Cuenta de libro mayor de débito', 'डेबिट लेजर खाता', 'Счет дебетовой книги', 'Debet Ledger-konto', 'Debit Ledger հաշիվ', 'სადებეტო ლეჯერის ანგარიში', 'डेबिट लेजर खाते', 'Akaun Lejar Debit', 'ਡੈਬਿਟ ਲੇਜ਼ਰ ਖਾਤਾ', 'டெபிட் லெட்ஜர் கணக்கு', 'డెబిట్ లెడ్జర్ ఖాతా', 'Debitbokbok', 'Debit Ledger Account'),
(756, 'voucher_no', 'Voucher No', 'ভাউচার নং', 'رقم القسيمة', 'Numéro de bon', 'वाउचर संख्या', 'Voucher No.', 'Buono n', 'バウチャーなし', '바우처 번호', 'Coupon nr', 'Voucher No', 'หมายเลขคูปอง', 'Fiş numarası', 'واؤچر نمبر', '优惠券编号', 'Koopbewys nr', 'Gutschein Nr', 'Κουπόνι Αρ', 'Vale no', 'भाउचर नम्बर', 'Ваучер №', 'Voucher nr', 'Վաուչեր ոչ', 'ვაუჩერი არა', 'व्हाउचर क्र', 'Baucar No.', 'ਵਾouਚਰ ਨੰ', 'வவுச்சர் எண்', 'వోచర్ నం', 'Voucher nr', 'Voucher Hindi'),
(757, 'balance', 'Balance', 'ভারসাম্য', 'توازن', 'Équilibre', 'संतुलन', 'Keseimbangan', 'Equilibrio', '残高', '균형', 'Balans', 'Saldo', 'สมดุล', 'Denge', 'بقیہ', '平衡', 'balans', 'Balance', 'Ισορροπία', 'Balance', 'शेष', 'Баланс', 'Balance', 'Մնացորդը', 'Ბალანსი', 'शिल्लक', 'Seimbang', 'ਸੰਤੁਲਨ', 'இருப்பு', 'సంతులనం', 'Balans', 'Balanse'),
(758, 'event_details', 'Event Details', 'অনুষ্ঠানের বিবরণ', 'تفاصيل الحدث', 'Détails de l\'évènement', 'घटना की जानकारी', 'detail acara', 'dettagli dell\'evento', 'イベントの詳細', '이벤트 상세', 'Evenementdetails', 'detalhes do evento', 'รายละเอียดกิจกรรม', 'etkinlik detayları', 'واقعہ کی تفصیلات', '活动详情', 'Geleentheidbesonderhede', 'Veranstaltungsdetails', 'Λεπτομέρειες εκδήλωσης', 'Detalles del evento', 'घटना विवरण', 'Детали мероприятия', 'Begivenhedsdetaljer', 'Իրադարձության մանրամասները', 'ღონისძიების დეტალები', 'कार्यक्रमाचा तपशील', 'Perincian Acara', 'ਘਟਨਾ ਦੇ ਵੇਰਵੇ', 'நிகழ்வு விவரங்கள்', 'ఈవెంట్ వివరాలు', 'Evenemangsdetaljer', 'Mga Detalye ng Kaganapan'),
(759, 'welcome_to', 'Welcome To', 'স্বাগতম', 'مرحبا بك في', 'Bienvenue à', 'आपका स्वागत है', 'Selamat Datang di', 'Benvenuto a', 'へようこそ', '에 오신 것을 환영합니다', 'Welkom bij', 'Bem-vindo ao', 'ยินดีต้อนรับสู่', 'Hoşgeldiniz', 'میں خوش آمدید', '欢迎来到', 'Welkom by', 'Willkommen zu', 'Καλωσόρισες στο', 'Bienvenido a', 'स्वागत छ', 'Добро пожаловать в', 'Velkommen til', 'Բարի գալուստ', 'Კეთილი იყოს თქვენი მობრძანება', 'आपले स्वागत आहे', 'Selamat datang ke', 'ਸਵਾਗਤ ਹੈ', 'வரவேற்கிறோம்', 'స్వాగతం', 'Välkommen till', 'Maligayang pagdating sa');
INSERT INTO `languages` (`id`, `word`, `english`, `bengali`, `arabic`, `french`, `hindi`, `indonesian`, `italian`, `japanese`, `korean`, `dutch`, `portuguese`, `thai`, `turkish`, `urdu`, `chinese`, `afrikaans`, `german`, `greek`, `spanish`, `nepali`, `russian`, `danish`, `armenian`, `georgian`, `marathi`, `malay`, `punjabi`, `tamil`, `telugu`, `swedish`, `filipino`) VALUES
(760, 'report_card', 'Report Card', 'রিপোর্ট কার্ড', 'بطاقة تقرير', 'Bulletin scolaire', 'प्रगति पत्र', 'Kartu Laporan', 'Pagella', 'レポートカード', '성적표', 'Rapport', 'Boletim', 'บัตรรายงาน', 'Karne', 'رپورٹ کارڈ', '成绩单', 'Rapport', 'Zeugnis', 'Κάρτα αναφοράς', 'Boleta de calificaciones', 'रिपोर्ट कार्ड', 'Табель успеваемости', 'Rapportkort', 'Հաշվետու քարտ', 'Მოსწრების ფურცელი', 'प्रगतिपुस्तक, प्रगतिपत्रक', 'Kad laporan', 'ਰਿਪੋਰਟ ਕਾਰਡ', 'அறிக்கை அட்டை', 'నివేదిక కార్డు', 'Utvärderingsrapport', 'Mag-ulat ng Kard'),
(761, 'online_pay', 'Online Pay', 'অনলাইন পে', 'الدفع عبر الإنترنت', 'Paiement en ligne', 'ऑनलाइन पे', 'Pembayaran Online', 'Paga online', 'オンライン支払い', '온라인 지불', 'Online betalen', 'Pagamento Online', 'จ่ายออนไลน์', 'Online Ödeme', 'آن لائن تنخواہ', '网上支付', 'Aanlyn betaal', 'Online Pay', 'Ηλεκτρονική πληρωμή', 'Pago en línea', 'अनलाइन भुक्तान', 'Онлайн оплата', 'Online-betaling', 'Առցանց վճարում', 'ონლაინ გადახდა', 'ऑनलाईन पे', 'Bayaran Dalam Talian', 'Payਨਲਾਈਨ ਤਨਖਾਹ', 'ஆன்லைன் ஊதியம்', 'ఆన్‌లైన్ పే', 'Online-betalning', 'Bayad sa Online'),
(762, 'annual_fees_summary', 'Annual Fees Summary', 'বার্ষিক ফি সংক্ষিপ্তসার', 'ملخص الرسوم السنوية', 'Résumé des frais annuels', 'वार्षिक शुल्क सारांश', 'Ringkasan Biaya Tahunan', 'Riepilogo tariffe annuali', '年間料金の概要', '연회비 요약', 'Overzicht van jaarlijkse vergoedingen', 'Resumo das taxas anuais', 'สรุปค่าธรรมเนียมรายปี', 'Yıllık Ücret Özeti', 'سالانہ فیس کا خلاصہ', '年费摘要', 'Jaarlikse fooi opsomming', 'Jährliche Gebührenübersicht', 'Σύνοψη ετήσιων τελών', 'Resumen de tarifas anuales', 'वार्षिक शुल्क सारांश', 'Ежегодная сводка сборов', 'Årlig oversigt over gebyrer', 'Տարեկան տուրքերի ամփոփում', 'წლიური საფასურის შეჯამება', 'वार्षिक फी सारांश', 'Ringkasan Yuran Tahunan', 'ਸਾਲਾਨਾ ਫੀਸਾਂ ਦਾ ਸਾਰ', 'ஆண்டு கட்டணம் சுருக்கம்', 'వార్షిక ఫీజు సారాంశం', 'Årlig sammanfattning av avgifter', 'Buod ng Pangkalahatang Mga Bayarin'),
(763, 'my_children', 'My Children', 'আমার শিশু', 'أطفالي', 'Mes enfants', 'मेरे बच्चे', 'Anak-anak saya', 'I miei figli', '私の子供たち', '아이들', 'Mijn kinderen', 'Minhas crianças', 'ลูก ๆ ของฉัน', 'Benim çocuklarım', 'میری اولاد', '我的孩子们', 'My kinders', 'Meine Kinder', 'Τα παιδιά μου', 'Mis hijos', 'मेरा बालबच्चाहरु', 'Мои дети', 'Mine børn', 'Իմ երեխաները', 'Ჩემი შვილები', 'माझी मुले', 'Anak-anak saya', 'ਮੇਰੇ ਬੱਚੇ', 'என் குழந்தைகள்', 'నా పిల్లలు', 'Mina barn', 'Mga anak ko'),
(764, 'assigned', 'Assigned', 'বরাদ্দ', 'تعيين', 'Attribué', 'निरुपित', 'Ditugaskan', 'Assegnato', '割り当てられた', '할당', 'Toegekend', 'Atribuído', 'ที่ได้รับมอบหมาย', 'atanan', 'تفویض', '已分配', 'opgedra', 'Zugewiesen', 'Ανατεθεί', 'Asignado', 'तोकिएको', 'назначенный', 'tildelt', 'Հանձնարարվել է', 'Დანიშნული', 'नियुक्त केले', 'Ditugaskan', 'ਨਿਰਧਾਰਤ', 'ஒதுக்கப்படும்', 'అసైన్డ్', 'Tilldelad', 'Itinalaga'),
(765, 'confirm_password', 'Confirm Password', 'পাসওয়ার্ড নিশ্চিত করুন', 'تأكيد كلمة المرور', 'Confirmez le mot de passe', 'पासवर्ड की पुष्टि कीजिये', 'konfirmasi sandi', 'conferma password', 'パスワードを認証する', '비밀번호 확인', 'bevestig wachtwoord', 'Confirme a Senha', 'ยืนยันรหัสผ่าน', 'Şifreyi Onayla', 'پاس ورڈ کی تصدیق کریں', '确认密码', 'Bevestig Wagwoord', 'Kennwort bestätigen', 'Επιβεβαίωση Κωδικού', 'Confirmar contraseña', 'पासवर्ड सुनिश्चित गर्नुहोस', 'Подтвердите Пароль', 'Bekræft kodeord', 'Հաստատել գաղտնաբառը', 'Პაროლის დადასტურება', 'पासवर्डची पुष्टी करा', 'Sahkan Kata Laluan', 'ਪਾਸਵਰਡ ਪੱਕਾ ਕਰੋ', 'கடவுச்சொல்லை உறுதிப்படுத்தவும்', 'పాస్వర్డ్ను నిర్ధారించండి', 'Bekräfta lösenord', 'Kumpirmahin ang Password'),
(766, 'searching_results', 'Searching Results', 'অনুসন্ধান ফলাফল', 'نتائج البحث', 'Résultats de la recherche', 'खोज परिणाम', 'Hasil Pencarian', 'Ricerca dei risultati', '検索結果', '검색 결과', 'Resultaten zoeken', 'Pesquisando Resultados', 'ผลการค้นหา', 'Arama Sonuçları', 'نتائج تلاش کرنا', '搜索结果', 'Resultate soek', 'Suchergebnisse', 'Αναζήτηση αποτελεσμάτων', 'Resultados de búsqueda', 'परिणामहरू खोज्दै', 'Результаты поиска', 'Søger resultater', 'Որոնման արդյունքներ', 'ძიების შედეგები', 'शोध परिणाम', 'Hasil Pencarian', 'ਖੋਜ ਨਤੀਜੇ', 'முடிவுகளைத் தேடுகிறது', 'ఫలితాలను శోధిస్తోంది', 'Söker resultat', 'Mga Resulta sa Paghahanap'),
(767, 'information_has_been_saved_successfully', 'Information Has Been Saved Successfully', 'তথ্য সাফল্যের সাথে সংরক্ষণ করা হয়েছে', 'تم حفظ المعلومات بنجاح', 'Les informations ont été enregistrées avec succès', 'जानकारी सफलतापूर्वक बच गई है', 'Informasi Telah Berhasil Disimpan', 'Le informazioni sono state salvate correttamente', '情報は正常に保存されました', '정보가 성공적으로 저장되었습니다', 'Informatie is met succes opgeslagen', 'As informações foram salvas com sucesso', 'ข้อมูลถูกบันทึกเรียบร้อยแล้ว', 'Bilgiler Başarıyla Kaydedildi', 'معلومات کو کامیابی کے ساتھ محفوظ کر لیا گیا ہے', '信息已成功保存', 'Inligting is suksesvol gestoor', 'Informationen wurden erfolgreich gespeichert', 'Οι πληροφορίες αποθηκεύτηκαν με επιτυχία', 'La información se ha guardado correctamente', 'जानकारी सफलतापूर्वक बचत गरिएको छ', 'Информация успешно сохранена', 'Oplysninger er blevet gemt med succes', 'Տեղեկատվությունը հաջողությամբ պահպանվել է', 'ინფორმაცია წარმატებით შეინახა', 'माहिती यशस्वीरित्या जतन केली गेली आहे', 'Maklumat berjaya disimpan', 'ਜਾਣਕਾਰੀ ਸਫਲਤਾਪੂਰਵਕ ਸੁਰੱਖਿਅਤ ਕੀਤੀ ਗਈ ਹੈ', 'தகவல் வெற்றிகரமாக சேமிக்கப்பட்டுள்ளது', 'సమాచారం విజయవంతంగా సేవ్ చేయబడింది', 'Information har sparats framgångsrikt', 'Matagumpay na Nai-save ang Impormasyon'),
(768, 'information_deleted', 'The information has been successfully deleted', 'তথ্য সফলভাবে মুছে ফেলা হয়েছে', 'تم حذف المعلومات بنجاح', 'L\'information a été supprimée avec succès', 'जानकारी सफलतापूर्वक हटा दी गई है', 'Informasi telah berhasil dihapus', 'Le informazioni sono state cancellate con successo', '情報は正常に削除されました', '정보가 성공적으로 삭제되었습니다.', 'De informatie is succesvol verwijderd', 'A informação foi apagada com sucesso', 'ลบข้อมูลสำเร็จแล้ว', 'Bilgi başarıyla silindi', 'معلومات کامیابی سے ختم ہوگئی ہے', '该信息已成功删除', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(769, 'deleted_note', '*Note : This data will be permanently deleted', '* দ্রষ্টব্য: এই তথ্য স্থায়ীভাবে মুছে ফেলা হবে', '* ملاحظة: سيتم حذف هذه البيانات نهائيًا', '* Remarque: ces données seront définitivement supprimées.', '* नोट: यह डेटा स्थायी रूप से हटा दिया जाएगा', '* Catatan: Data ini akan dihapus secara permanen', '* Nota: questi dati saranno eliminati in modo permanente', '*注：このデータは完全に削除されます', '* 참고 :이 데이터는 영구적으로 삭제됩니다.', '* Opmerking: deze gegevens worden permanent verwijderd', '* Nota: Estes dados serão permanentemente excluídos', '* หมายเหตุ: ข้อมูลนี้จะถูกลบอย่างถาวร', '* Not: Bu veri kalıcı olarak silinecek', '* نوٹ: یہ ڈیٹا مستقل طور پر ختم ہوجائے گا', '*注意：此数据将被永久删除', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(770, 'are_you_sure', 'Are You Sure?', 'তুমি কি নিশ্চিত?', 'هل أنت واثق؟', 'Êtes-vous sûr?', 'क्या आपको यकीन है?', 'Apakah Anda Yakin?', 'Sei sicuro?', '本気ですか？', '확실해?', 'Weet je het zeker?', 'Você tem certeza?', 'คุณแน่ใจไหม?', 'Emin misiniz?', 'کیا تمہیں یقین ہے؟', '你确定吗？', 'Is jy seker?', 'Bist du sicher?', 'Είσαι σίγουρος?', '¿Estás seguro?', 'के तपाईँ निश्चित हुनुहुन्छ?', 'Ты уверен?', 'Er du sikker?', 'Համոզված ես?', 'Დარწმუნებული ხარ?', 'तुला खात्री आहे?', 'Adakah anda pasti?', 'ਤੁਹਾਨੂੰ ਪੂਰਾ ਵਿਸ਼ਵਾਸ ਹੈ?', 'நீ சொல்வது உறுதியா?', 'మీరు చెప్పేది నిజమా?', 'Är du säker?', 'Sigurado ka ba?'),
(771, 'delete_this_information', 'Do You Want To Delete This Information?', 'আপনি এই তথ্য মুছে ফেলতে চান?', 'هل تريد حذف هذه المعلومات؟', 'Voulez-vous supprimer cette information?', 'क्या आप इस जानकारी को हटाना चाहते हैं?', 'Apakah Anda Ingin Menghapus Informasi Ini?', 'Vuoi eliminare queste informazioni?', 'この情報を削除しますか？', '이 정보를 삭제 하시겠습니까?', 'Wilt u deze informatie verwijderen?', 'Você deseja excluir esta informação?', 'คุณต้องการลบข้อมูลนี้หรือไม่?', 'Bu Bilgiyi Silmek İstiyor musunuz?', 'کیا آپ اس معلومات کو حذف کرنا چاہتے ہیں؟', '你想删除这些信息吗？', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(772, 'yes_continue', 'Yes, Continue', 'হ্যাঁ, চালিয়ে যান', 'نعم ، استمر', 'Oui, continuez', 'हां, जारी रखें', 'Ya, Lanjutkan', 'Sì, continua', 'はい、続行します', '예, 계속', 'Ja, doorgaan', 'Sim, continue', 'ใช่ดำเนินการต่อ', 'Evet devam et', 'ہاں ، جاری رکھیں', '是的，继续', 'Ja, gaan voort', 'Ja, weiter', 'Ναι, συνεχίστε', 'Sí, continuar', 'हो, जारी राख्नुहोस्', 'Да, продолжить', 'Ja, fortsæt', 'Այո, շարունակեք', 'დიახ, განაგრძეთ', 'होय, सुरू ठेवा', 'Ya, Teruskan', 'ਹਾਂ, ਜਾਰੀ ਰੱਖੋ', 'ஆம், தொடரவும்', 'అవును, కొనసాగించండి', 'Ja, fortsätt', 'Oo, Magpatuloy'),
(773, 'deleted', 'Deleted', 'মুছে ফেলা', 'تم الحذف', 'Effacé', 'हटाए गए', 'Dihapus', 'Deleted', '削除しました', '삭제', 'Verwijderd', 'Excluído', 'ลบ', 'silindi', 'حذف ہوگیا', '已删除', 'verwyderde', 'Gelöscht', 'Διαγράφηκε', 'Eliminado', 'मेटाइयो', 'Исключен', 'Slettet', 'Նջված է', 'ამოღებულია', 'हटविले', 'Dipadamkan', 'ਮਿਟਾਇਆ ਗਿਆ', 'நீக்கப்பட்டது', 'తొలగించిన', 'raderade', 'Tinanggal'),
(774, 'collect', 'Collect', 'সংগ্রহ', 'تجميع', 'Collecte', 'कलेक्ट', 'Mengumpulkan', 'Raccogliere', '集める', '수집', 'Verzamelen', 'Coletar', 'เก็บ', 'Toplamak', 'جمع کریں', '收集', 'Versamel', 'Sammeln', 'Συλλέγω', 'Recoger', 'स .्कलन गर्नुहोस्', 'Collect', 'Indsamle', 'Հավաքել', 'Შეგროვება', 'गोळा करा', 'Kumpulkan', 'ਇਕੱਠਾ ਕਰੋ', 'திரட்டுதல்', 'సేకరించండి', 'Samla', 'Kolektahin'),
(775, 'school_setting', 'School Setting', 'স্কুল সেটিং', 'إعداد المدرسة', 'Milieu scolaire', 'स्कूल की स्थापना', 'Pengaturan sekolah', 'Impostazione della scuola', '学校の設定', '학교 환경 설정', 'School instelling', 'Escola, armando', 'สภาพแวดล้อมของโรงเรียน', 'Okul ayarı', 'سکول کی ترتیب', '学校环境', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(776, 'set', 'Set', 'সেট', 'جلس', 'Ensemble', 'सेट', 'Set', 'Impostato', 'セットする', '세트', 'Stel', 'Conjunto', 'ชุด', 'Ayarlamak', 'سیٹ کریں', '组', 'stel', 'einstellen', 'Σειρά', 'Conjunto', 'सेट', 'Набор', 'Sæt', 'Սահմանել', 'მითითებული', 'सेट', 'Tetapkan', 'ਸੈੱਟ ਕਰੋ', 'அமை', 'సెట్', 'Uppsättning', 'Itakda'),
(777, 'quick_view', 'Quick View', 'তারাতারি দেখা', 'نظرة سريعة', 'Aperçu rapide', 'जल्दी देखो', 'Lihat sekilas', 'Occhiata veloce', 'クイックビュー', '퀵뷰', 'Snelle kijk', 'Olhada rápida', 'มุมมองด่วน', 'Hızlı Görünüm', 'فوری نظارہ', '快速浏览', 'Vinnige oorsig', 'Schnellansicht', 'Γρήγορη ματιά', 'Vista rápida', 'द्रुत दृश्य', 'Быстрый просмотр', 'Hurtigt kig', 'Արագ դիտում', 'სწრაფი ხედი', 'द्रुत दृश्य', 'Pandangan Pantas', 'ਤੇਜ਼ ਝਲਕ', 'விரைவான பார்வை', 'శీఘ్ర వీక్షణ', 'Snabbtitt', 'Mabilis na Tingnan'),
(778, 'due_fees_invoice', 'Due Fees Invoice', 'পারিশ্রমিক ফি চালান', 'فاتورة رسوم مستحقة', 'Facture due', 'देय शुल्क चालान', 'Tagihan Biaya karena', 'Fattura dovuta', '納付書', '회비 청구서', 'Factuur verschuldigd', '', 'ใบแจ้งหนี้ค่าธรรมเนียม', 'Ödenmesi Gereken Fatura', 'واجب الادا فیس انوائس', '应付费用发票', 'Faktuur vir verskuldigde gelde', 'Rechnung über fällige Gebühren', 'Τιμολόγιο οφειλόμενων χρεώσεων', 'Factura de cuotas adeudadas', 'शुल्क शुल्क चलानी', 'Счет-фактура', 'Forfaldsfaktura', 'Պարտքերի վճարման հաշիվ', 'საგადასახადო საფასურის ინვოისი', 'देय फी फी', 'Invois Yuran Hutang', 'ਬਕਾਇਆ ਫੀਸ ਇਨਵੌਇਸ', 'செலுத்த வேண்டிய கட்டணம் விலைப்பட்டியல்', 'చెల్లించాల్సిన ఫీజు ఇన్వాయిస్', 'Fakturor om förfallna avgifter', 'Dahil sa Bayad na Bayad'),
(779, 'my_application', 'My Application', 'আমার আবেদন', 'طلبي', 'Mon application', 'मेरा आवेदन', 'Lamaran saya', 'La mia applicazione', '私のアプリケーション', '내 응용 프로그램', 'Mijn aanvraag', '', 'ใบสมัครของฉัน', 'Başvurum', 'میری درخواست', '我的应用程序', 'My aansoek', 'Meine Bewerbung', 'Η αίτησή μου', 'Mi aplicación', 'मेरो अनुप्रयोग', 'Мое приложение', 'Min ansøgning', 'Իմ դիմումը', 'Ჩემი განაცხადი', 'माझा अर्ज', 'Permohonan saya', 'ਮੇਰੀ ਐਪਲੀਕੇਸ਼ਨ', 'எனது விண்ணப்பம்', 'నా దరఖాస్తు', 'Min ansökan', 'Aking Application'),
(780, 'manage_application', 'Manage Application', 'অ্যাপ্লিকেশন পরিচালনা করুন', 'إدارة الطلب', 'Gérer l\'application', 'एप्लिकेशन प्रबंधित करें', 'Kelola Aplikasi', 'Gestisci applicazione', 'アプリケーションを管理', '응용 프로그램 관리', 'Applicatie beheren', '', 'จัดการแอปพลิเคชัน', 'Uygulamayı yönet', 'درخواست کا انتظام کریں', '管理申请', 'Bestuur die toepassing', 'Anwendung verwalten', 'Διαχείριση εφαρμογής', 'Administrar aplicación', 'अनुप्रयोग प्रबन्ध गर्नुहोस्', 'Управление приложением', 'Administrer applikation', 'Կառավարեք դիմումը', 'პროგრამის მართვა', 'अनुप्रयोग व्यवस्थापित करा', 'Urus Permohonan', 'ਐਪਲੀਕੇਸ਼ਨ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰੋ', 'பயன்பாட்டை நிர்வகிக்கவும்', 'అనువర్తనాన్ని నిర్వహించండి', 'Hantera applikation', 'Pamahalaan ang Application'),
(781, 'leave', 'Leave', 'ছুটি', 'غادر', 'Laisser', 'छोड़ना', 'Meninggalkan', 'Partire', '去る', '떠나다', 'Het verlof', '', 'ออกจาก', 'Ayrılmak', 'چھوڑ دو', '离开', 'Verlaat', 'Verlassen', 'Αδεια', 'Salir', 'छोड', 'Оставлять', 'Forlade', 'Հեռացեք', 'დატოვე', 'सोडा', 'Tinggalkan', 'ਛੱਡੋ', 'விடுங்கள்', 'లీవ్', 'Lämna', 'Umalis'),
(782, 'live_class_rooms', 'Live Class Rooms', 'লাইভ ক্লাস রুম', 'غرف الصف المباشر', 'Salles de cours en direct', 'लाइव क्लास रूम', 'Ruang Kelas Langsung', 'Aule dal vivo', 'ライブクラスルーム', '라이브 클래스 룸', 'Live klaslokalen', '', 'ห้องเรียนสด', 'Canlı Ders Odaları', 'لائیو کلاس رومز', '现场教室', 'Live klas kamers', 'Live-Klassenräume', 'Ζωντανά δωμάτια', 'Salas de clase en vivo', 'प्रत्यक्ष कक्षा कोठा', 'Комнаты живого класса', 'Levende klasseværelser', 'Կենդանի դասի սենյակներ', 'ცოცხალი კლასის ოთახები', 'थेट वर्ग खोल्या', 'Bilik Kelas Langsung', 'ਲਾਈਵ ਕਲਾਸ ਰੂਮ', 'லைவ் வகுப்பு அறைகள்', 'లైవ్ క్లాస్ రూములు', 'Levande klassrum', 'Mga Live na Mga silid sa Klase'),
(783, 'homework', 'Homework', 'বাড়ির কাজ', 'واجب منزلي', 'Devoirs', 'घर का पाठ', 'Pekerjaan rumah', 'Compiti a casa', '宿題', '숙제', 'Huiswerk', '', 'การบ้าน', 'Ev ödevi', 'گھر کا کام', '家庭作业', 'Huiswerk', 'Hausaufgaben', 'Εργασία για το σπίτι', 'Deberes', 'गृहकार्य', 'Домашнее задание', 'Lektier', 'Տնային աշխատանք', 'Საშინაო დავალება', 'गृहपाठ', 'Kerja rumah', 'ਘਰ ਦਾ ਕੰਮ', 'வீட்டு பாடம்', 'ఇంటి పని', 'Läxa', 'Takdang aralin'),
(784, 'evaluation_report', 'Evaluation Report', 'মূল্যায়ন প্রতিবেদন', 'تقرير التقييم', 'Rapport d\'évaluation', 'मूल्यांकन रिपोर्ट', 'Laporan evaluasi', 'Rapporto di valutazione', '評価報告書', '평가 보고서', 'Evaluatieverslag', '', 'รายงานการประเมินผล', 'Değerlendirme raporu', 'تشخیصی رپورٹ', '评估报告', 'Evalueringsverslag', 'Bewertungsbericht', 'Έκθεση αξιολόγησης', 'Reporte de evaluacion', 'मूल्यांकन रिपोर्ट', 'Отчет об оценке', 'Evalueringsrapport', 'Գնահատման զեկույց', 'შეფასების ანგარიში', 'मूल्यांकन अहवाल', 'Laporan Penilaian', 'ਮੁਲਾਂਕਣ ਰਿਪੋਰਟ', 'மதிப்பீட்டு அறிக்கை', 'మూల్యాంకన నివేదిక', 'Utvärderingsrapport', 'Pagsusuri ng Ulat'),
(785, 'exam_term', 'Exam Term', 'পরীক্ষার মেয়াদ', 'مصطلح الامتحان', 'Durée de l\'examen', 'परीक्षा शब्द', 'Masa ujian', 'Termine dell\'esame', '試験期間', '시험 기간', 'Examenperiode', '', 'ระยะสอบ', 'Sınav Dönemi', 'امتحان کی مدت', '考试期限', 'Eksamentermyn', 'Prüfungssemester', 'Όρος εξετάσεων', 'Término del examen', 'परीक्षा अवधि', 'Срок сдачи экзамена', 'Eksamenperiode', 'Քննության ժամկետը', 'გამოცდის ვადა', 'परीक्षा कालावधी', 'Tempoh Peperiksaan', 'ਪ੍ਰੀਖਿਆ ਦੀ ਮਿਆਦ', 'தேர்வு காலம்', 'పరీక్షా పదం', 'Examensperiod', 'Exam Term'),
(786, 'distribution', 'Distribution', 'বিতরণ', 'توزيع', 'Distribution', 'वितरण', 'Distribusi', 'Distribuzione', '分布', '분포', 'Distributie', '', 'การกระจาย', 'dağıtım', 'تقسیم', '分配', 'verspreiding', 'Verteilung', 'Κατανομή', 'Distribución', 'वितरण', 'распределение', 'Fordeling', 'Բաշխում', 'განაწილება', 'वितरण', 'Pembahagian', 'ਵੰਡ', 'விநியோகம்', 'పంపిణీ', 'Distribution', 'Pamamahagi'),
(787, 'exam_setup', 'Exam Setup', 'পরীক্ষা সেটআপ', 'إعداد الامتحان', 'Configuration de l\'examen', 'परीक्षा सेटअप', 'Pengaturan ujian', 'Configurazione dell\'esame', '試験のセットアップ', '시험 설정', 'Exameninstellingen', '', 'การตั้งค่าการสอบ', 'Sınav Kurulumu', 'امتحان سیٹ اپ', '考试设置', 'Eksamenopstelling', 'Prüfungsaufbau', 'Ρύθμιση εξετάσεων', 'Configuración de examen', 'परीक्षा सेटअप', 'Настройка экзамена', 'Eksamenopsætning', 'Քննության կարգավորում', 'გამოცდის დაყენება', 'परीक्षा सेटअप', 'Persediaan Peperiksaan', 'ਪ੍ਰੀਖਿਆ ਸੈਟਅਪ', 'தேர்வு அமைப்பு', 'పరీక్ష సెటప్', 'Examinställning', 'Setup ng Exam'),
(788, 'sms', 'Sms', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(789, 'fees_type', 'Fees Head', 'ফি প্রকার', 'نوع الرسوم', 'Type de frais', 'फीस टाइप', 'Jenis Biaya', 'Tipo di commissioni', '料金タイプ', '수수료 유형', 'Type vergoedingen', '', 'ประเภทค่าธรรมเนียม', 'Ücret Türü', 'فیس کی قسم', '收费类型', 'Fooie Tipe', 'Gebührenart', 'Τύπος χρεώσεων', 'Tipo de honorarios', 'शुल्क प्रकार', 'Тип сборов', 'Gebyrer Type', 'Վճարների տեսակը', 'საფასურის ტიპი', 'फी प्रकार', 'Jenis Yuran', 'ਫੀਸ ਦੀ ਕਿਸਮ', 'கட்டணம் வகை', 'ఫీజు రకం', 'Avgiftstyp', 'Uri ng Bayad'),
(790, 'fees_group', 'Fees Group', 'ফি গ্রুপ', 'مجموعة الرسوم', 'Groupe de frais', 'फीस समूह', 'Kelompok Biaya', 'Gruppo di commissioni', '手数料グループ', '요금 그룹', 'Kosten Groep', '', 'กลุ่มค่าธรรมเนียม', 'Ücret Grubu', 'فیس گروپ', '费用组', 'Fooie Groep', 'Gebührengruppe', 'Ομάδα χρεώσεων', 'Grupo de tarifas', 'शुल्क समूह', 'Тарифы группы', 'Gebyrgruppe', 'Վճարների խումբ', 'საფასურის ჯგუფი', 'फी गट', 'Kumpulan Yuran', 'ਫੀਸ ਸਮੂਹ', 'கட்டணம் குழு', 'ఫీజు గ్రూప్', 'Avgiftsgrupp', 'Pangkat ng Pangkat'),
(791, 'fine_setup', 'Fine Setup', 'ফাইন সেটআপ', 'الإعداد الجيد', 'Configuration fine', 'ठीक सेटअप', 'Pengaturan yang Baik', 'Setup fine', '細かい設定', '미세 설정', 'Fijne setup', '', 'การตั้งค่าอย่างละเอียด', 'İnce Kurulum', 'عمدہ سیٹ اپ', '精细设定', 'Fyn opstelling', 'Feines Setup', 'Ωραία ρύθμιση', 'Configuración fina', 'राम्रो सेटअप', 'Точная настройка', 'Fin opsætning', 'Նուրբ կարգավորումը', 'ჯარიმის დაყენება', 'ललित सेटअप', 'Persediaan Baik', 'ਵਧੀਆ ਸੈਟਅਪ', 'சிறந்த அமைப்பு', 'ఫైన్ సెటప్', 'Fin inställning', 'Maayos na Pag-setup'),
(792, 'fees_reminder', 'Fees Reminder', 'ফি অনুস্মারক', 'تذكير بالرسوم', 'Rappel des frais', 'फीस रिमाइंडर', 'Pengingat Biaya', 'Promemoria', '手数料リマインダー', '수수료 알림', 'Kostenherinnering', '', 'ค่าธรรมเนียมการแจ้งเตือน', 'Ücret Hatırlatma', 'فیس یاد دہانی', '费用提醒', 'Fooi herinnering', 'Gebührenerinnerung', 'Υπενθύμιση τελών', 'Recordatorio de tarifas', 'शुल्क रिमाइन्डर', 'Тарифы Напоминание', 'Gebyrpåmindelse', 'Վճարների հիշեցում', 'მოსაკრებლების შეხსენება', 'फी स्मरणपत्र', 'Peringatan Yuran', 'ਫੀਸ ਰੀਮਾਈਂਡਰ', 'கட்டணம் நினைவூட்டல்', 'ఫీజు రిమైండర్', 'Avgiftspåminnelse', 'Paalala'),
(793, 'new_deposit', 'New Deposit', 'নতুন আমানত', 'وديعة جديدة', 'Nouveau dépôt', 'नया जमा', 'Setoran Baru', 'Nuovo deposito', '新しい預金', '새로운 예금', 'Nieuwe storting', '', 'ใหม่ฝาก', 'Yeni Depozito', 'نیا ڈپازٹ', '新存款', 'Nuwe deposito', 'Neue Einzahlung', 'Νέα κατάθεση', 'Nuevo depósito', 'नयाँ जम्मा', 'Новый депозит', 'Nyt depositum', 'Նոր ավանդ', 'ახალი ანაბარი', 'नवीन ठेव', 'Deposit Baru', 'ਨਵਾਂ ਜਮ੍ਹਾ', 'புதிய வைப்பு', 'కొత్త డిపాజిట్', 'Ny insättning', 'Bagong Deposit'),
(794, 'new_expense', 'New Expense', 'নতুন ব্যয়', 'نفقة جديدة', 'Nouvelle dépense', 'नया खर्च', 'Biaya Baru', 'Nuova spesa', '新しい費用', '새로운 경비', 'Nieuwe kosten', '', 'ค่าใช้จ่ายใหม่', 'Yeni Gider', 'نیا خرچ', '新费用', 'Nuwe koste', 'Neue Ausgaben', 'Νέο Έξοδα', 'Nuevo gasto', 'नयाँ खर्च', 'Новый Расход', 'Ny udgift', 'Նոր ծախս', 'ახალი ხარჯი', 'नवीन खर्च', 'Perbelanjaan Baru', 'ਨਵਾਂ ਖਰਚਾ', 'புதிய செலவு', 'కొత్త ఖర్చు', 'Ny kostnad', 'Bagong Gastos'),
(795, 'all_transactions', 'All Transactions', 'সমস্ত লেনদেন', 'كل الحركات المالية', 'toutes transactions', 'सभी लेन - देन', 'Semua Transaksi', 'Tutte le transazioni', '全取引', '모든 거래 창구', 'Alle transacties', '', 'ธุรกรรมทั้งหมด', 'Tüm İşlemler', 'تمام لین دین', '所有交易', 'Alle transaksies', 'Alle Transaktionen', 'Όλες οι συναλλαγές', 'Todas las transacciones', 'सबै लेनदेन', 'Все транзакции', 'Alle transaktioner', 'Բոլոր գործարքները', 'ყველა გარიგება', 'सर्व व्यवहार', 'Semua Urus Niaga', 'ਸਾਰੇ ਸੌਦੇ', 'அனைத்து பரிவர்த்தனைகளும்', 'అన్ని లావాదేవీలు', 'Alla transaktioner', 'Lahat ng Mga Transaksyon'),
(796, 'head', 'Head', 'মাথা', 'رئيس', 'Tête', 'सिर', 'Kepala', 'Testa', '頭', '머리', 'Hoofd', '', 'ศีรษะ', 'baş', 'سر', '头', 'Kop', 'Kopf', 'Κεφάλι', 'Cabeza', 'Head', 'Глава', 'Hoved', 'Գլուխ', 'ხელმძღვანელი', 'डोके', 'Ketua', 'ਮੁਖੀ', 'தலை', 'హెడ్', 'Huvud', 'Ulo'),
(797, 'fees_reports', 'Fees Reports', 'ফি প্রতিবেদন', 'تقارير الرسوم', 'Rapports sur les frais', 'फीस रिपोर्ट', 'Laporan Biaya', 'Commissioni', '料金レポート', '수수료 보고서', 'Vergoedingenrapporten', '', 'รายงานค่าธรรมเนียม', 'Ücret Raporları', 'فیس کی رپورٹیں', '费用报告', 'Gelde verslae', 'Gebührenberichte', 'Αναφορές χρεώσεων', 'Informes de tarifas', 'शुल्क रिपोर्टहरू', 'Отчеты о сборах', 'Gebyrer rapporter', 'Վճարների հաշվետվություններ', 'ანგარიშები', 'शुल्क अहवाल', 'Laporan Yuran', 'ਫੀਸ ਰਿਪੋਰਟ', 'கட்டண அறிக்கைகள்', 'ఫీజు నివేదికలు', 'Avgiftsrapporter', 'Mga Ulat sa Bayad'),
(798, 'fees_report', 'Fees Report', 'ফি রিপোর্ট', 'تقرير الرسوم', 'Rapport sur les frais', 'फीस रिपोर्ट', 'Laporan Biaya', 'Rapporto sulle commissioni', '料金レポート', '수수료 보고서', 'Vergoedingenrapport', '', 'รายงานค่าธรรมเนียม', 'Ücret Raporu', 'فیس رپورٹ', '费用报告', 'Fooieverslag', 'Gebührenbericht', 'Αναφορά χρεώσεων', 'Informe de tarifas', 'शुल्क रिपोर्ट', 'Отчет о сборах', 'Gebyrrapport', 'Վճարների մասին հաշվետվություն', 'საფასურის ანგარიში', 'शुल्क अहवाल', 'Laporan Yuran', 'ਫੀਸ ਦੀ ਰਿਪੋਰਟ', 'கட்டணம் அறிக்கை', 'ఫీజు నివేదిక', 'Avgiftsrapport', 'Ulat sa Bayad'),
(799, 'receipts_report', 'Receipts Report', 'প্রাপ্তি রিপোর্ট', 'تقرير الإيصالات', 'Rapport sur les reçus', 'रिपोर्ट प्राप्त करता है', 'Laporan Penerimaan', 'Rapporto sulle ricevute', '領収書レポート', '영수증 보고서', 'Ontvangstenrapport', '', 'รายงานใบเสร็จรับเงิน', 'Makbuz Raporu', 'رسیدیں رپورٹ', '收据报告', 'Ontvangste verslag', 'Belegbericht', 'Αναφορά Παραλαβών', 'Informe de recibos', 'रसीद रिपोर्ट', 'Отчет о поступлениях', 'Kvitteringsrapport', 'Ստացումների հաշվետվություն', 'ქვითრების ანგარიში', 'पावत्या रिपोर्ट', 'Laporan Terimaan', 'ਰਸੀਦ ਰਿਪੋਰਟ', 'ரசீதுகள் அறிக்கை', 'రసీదుల నివేదిక', 'Kvittorapport', 'Ulat ng Mga Resibo'),
(800, 'due_fees_report', 'Due Fees Report', 'বকেয়া ফি রিপোর্ট', 'تقرير الرسوم المستحقة', 'Rapport sur les frais dus', 'देय शुल्क रिपोर्ट', 'Laporan Biaya Karena', 'Rapporto sulle commissioni dovute', '手数料レポート', '회비 보고서', 'Verschuldigd kostenrapport', '', 'รายงานค่าธรรมเนียมที่ถึงกำหนด', 'Ödenmesi Gereken Ücretler Raporu', 'واجب الادا فیس', '应付费用报告', 'Verslag oor fooie', 'Bericht über fällige Gebühren', 'Αναφορά οφειλών', 'Informe de tarifas adeudadas', 'शुल्क शुल्क रिपोर्ट', 'Отчет об оплате', 'Rapport om forfaldsgebyrer', 'Ժամկետային տուրքերի մասին հաշվետվություն', 'შესაბამისი საფასურის ანგარიში', 'देय शुल्काचा अहवाल', 'Laporan Bayaran Hutang', 'ਬਕਾਇਆ ਫੀਸਾਂ ਦੀ ਰਿਪੋਰਟ', 'உரிய கட்டணம் அறிக்கை', 'చెల్లించాల్సిన ఫీజు నివేదిక', 'Rapport om förfallna avgifter', 'Dahil sa Ulat sa Bayad'),
(801, 'fine_report', 'Fine Report', 'ফাইন রিপোর্ট', 'تقرير جيد', 'Beau rapport', 'फाइन रिपोर्ट', 'Laporan Baik', 'Rapporto eccellente', 'ファインレポート', '좋은 보고서', 'Fijn rapport', '', 'รายงานละเอียด', 'İnce Rapor', 'عمدہ رپورٹ', '精细报告', 'Fyn verslag', '', 'Λεπτή αναφορά', 'Informe fino', 'राम्रो रिपोर्ट', 'Прекрасный отчет', 'Fin rapport', 'Լավ հաշվետվություն', 'ჯარიმის ანგარიში', 'ललित अहवाल', 'Laporan Baik', 'ਵਧੀਆ ਰਿਪੋਰਟ', 'சிறந்த அறிக்கை', 'ఫైన్ రిపోర్ట్', 'Fin rapport', 'Maayong Ulat'),
(802, 'financial_reports', 'Financial Reports', 'আর্থিক প্রতিবেদন', 'تقارير مالية', 'Rapports financiers', 'वित्तीय रिपोर्ट', 'Laporan keuangan', 'Resoconti finanziari', '財務報告', '재무 보고서', 'Financiële rapporten', '', 'รายงานทางการเงิน', 'Finansal raporlar', 'مالی رپورٹیں', '财务报告', 'Finansiële verslae', '', 'Οικονομικές εκθέσεις', 'Reportes financieros', 'वित्तीय रिपोर्ट', 'Финансовые отчеты', 'Finansielle rapporter', 'Ֆինանսական հաշվետվություններ', 'ფინანსური ანგარიშები', 'आर्थिक अहवाल', 'Laporan Kewangan', 'ਵਿੱਤੀ ਰਿਪੋਰਟਾਂ', 'நிதி அறிக்கைகள்', 'ఆర్థిక నివేదికలు', 'Finansiella rapporter', 'Pinansyal na ulat'),
(803, 'statement', 'Statement', 'বিবৃতি', 'بيان', 'Déclaration', 'बयान', 'Pernyataan', 'dichiarazione', 'ステートメント', '성명서', 'Uitspraak', '', 'คำให้การ', 'Beyan', 'بیان', '声明', 'Verklaring', '', 'Δήλωση', 'Declaración', 'वक्तव्य', 'утверждение', 'Udmelding', 'Հայտարարություն', 'განცხადება', 'विधान', 'Penyataan', 'ਬਿਆਨ', 'அறிக்கை', 'ప్రకటన', 'Påstående', 'Pahayag'),
(804, 'repots', 'Repots', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(805, 'expense', 'Expense', 'ব্যয়', 'مصروف', 'Frais', 'व्यय', 'Biaya', 'Spese', '費用', '비용', 'Kosten', '', 'ค่าใช้จ่าย', 'gider', 'خرچہ', '费用', 'koste', '', 'Δαπάνη', 'Gastos', 'खर्च', 'расходы', 'Bekostning', 'Ծախս', 'ხარჯები', 'खर्च', 'Perbelanjaan', 'ਖਰਚਾ', 'செலவு', 'ఖర్చుల', 'Bekostnad', 'Gastos'),
(806, 'transitions', 'Transitions', 'স্থানান্তর', 'الانتقالات', 'Transitions', 'संक्रमण', 'Transisi', 'transizioni', 'トランジション', '전환', 'Overgangen', '', 'การเปลี่ยน', 'Geçişler', 'ٹرانزیشن', '转场', 'oorgange', '', 'Μεταβάσεις', 'Transiciones', 'संक्रमण', 'Переходы', 'Overgange', 'Անցումներ', 'გადასვლები', 'संक्रमणे', 'Peralihan', 'ਤਬਦੀਲੀ', 'மாற்றங்கள்', 'పరివర్తనాలు', 'övergångar', 'Mga Paglilipat'),
(807, 'sheet', 'Sheet', 'চাদর', 'ورقة', 'Feuille', 'चादर', 'Lembar', 'Foglio', 'シート', '시트', 'Vel', '', 'แผ่น', 'yaprak', 'چادر', '片', 'vel', '', 'Σεντόνι', 'Sábana', 'पाना', 'Лист', 'Ark', 'Թերթ', 'ფურცელი', 'पत्रक', 'Helaian', 'ਸ਼ੀਟ', 'தாள்', 'షీట్', 'Ark', 'Sheet'),
(808, 'income_vs_expense', 'Income Vs Expense', 'আয় বনাম ব্যয়', 'الدخل مقابل المصاريف', 'Revenu contre dépenses', 'आय बनाम व्यय', 'Penghasilan Vs Beban', 'Entrate vs. spese', '収入対費用', '수입 대 경비', 'Inkomen versus kosten', '', 'รายรับเทียบกับค่าใช้จ่าย', 'Gelir ve Gider', 'انکم بمقام اخراجات', '收入与支出', 'Inkomste teen uitgawes', '', 'Έσοδα έναντι δαπανών', 'Ingresos vs gastos', 'आय बनाम खर्च', 'Доход против расходов', 'Indkomst mod udgift', 'Եկամուտ ընդդեմ ծախսերի', 'შემოსავალი წინააღმდეგ ხარჯები', 'उत्पन्न विरूद्ध खर्च', 'Pendapatan berbanding perbelanjaan', 'ਆਮਦਨ ਬਨਾਮ ਖਰਚ', 'வருமான Vs செலவு', 'ఆదాయం Vs ఖర్చు', 'Inkomster mot kostnad', 'Kita sa Vs na Kita'),
(809, 'attendance_reports', 'Attendance Reports', 'উপস্থিতি রিপোর্ট', 'تقارير الحضور', 'Rapports de présence', 'उपस्थिति रिपोर्ट', 'Laporan Kehadiran', 'Rapporti di presenza', '出席レポート', '출석 보고서', 'Aanwezigheidsrapporten', '', 'รายงานการเข้าร่วมประชุม', 'Katılım Raporları', 'حاضری کی اطلاعات', '出勤报告', 'Bywoningsverslae', '', 'Αναφορές παρακολούθησης', 'Informes de asistencia', 'उपस्थिति रिपोर्टहरू', 'Отчеты о посещаемости', 'Deltagelsesrapporter', 'Հաճախումների հաշվետվություններ', 'დასწრების ანგარიშები', 'उपस्थिती अहवाल', 'Laporan Kehadiran', 'ਹਾਜ਼ਰੀ ਰਿਪੋਰਟ', 'வருகை அறிக்கைகள்', 'హాజరు నివేదికలు', 'Deltagarrapporter', 'Mga Ulat sa Pagdalo'),
(810, 'examination', 'Examination', 'পরীক্ষা', 'فحص', 'Examen', 'इंतिहान', 'Pemeriksaan', 'Visita medica', '検査', '시험', 'Examen', '', 'การตรวจสอบ', 'sınav', 'امتحان', '检查', 'eksamen', '', 'Εξέταση', 'Examen', 'परीक्षा', 'экспертиза', 'Undersøgelse', 'Քննություն', 'შემოწმება', 'परीक्षा', 'Pemeriksaan', 'ਪ੍ਰੀਖਿਆ', 'தேர்வு', 'పరీక్ష', 'Undersökning', 'Eksaminasyon'),
(811, 'school_settings', 'School Settings', 'স্কুল সেটিংস', 'إعدادات المدرسة', 'Impostazione della scuola', 'स्कूल सेटिंग्स', 'Pengaturan sekolah', 'Impostazioni della scuola', '学校の設定', '학교 설정', 'Schoolinstellingen', '', 'การตั้งค่าโรงเรียน', 'Okul Ayarları', 'اسکول کی ترتیبات', '学校设置', 'Skoolinstellings', '', 'Ρυθμίσεις σχολείου', 'Configuraciones escolares', 'स्कूल सेटिंग्स', 'Настройки школы', 'Skoleindstillinger', 'Դպրոցի պարամետրերը', 'სკოლის პარამეტრები', 'शाळा सेटिंग्ज', 'Tetapan Sekolah', 'ਸਕੂਲ ਸੈਟਿੰਗਜ਼', 'பள்ளி அமைப்புகள்', 'పాఠశాల సెట్టింగులు', 'Skolinställningar', 'Mga Setting ng Paaralan'),
(812, 'role_permission', 'Role Permission', 'ভূমিকা অনুমতি', 'إذن الدور', 'Autorisation de rôle', 'भूमिका की अनुमति', 'Izin Peran', 'Autorizzazione al ruolo', '役割の権限', '역할 권한', 'Roltoestemming', '', 'การอนุญาตบทบาท', 'Rol İzni', 'کردار کی اجازت', '角色权限', 'Roltoestemming', '', 'Άδεια ρόλου', 'Permiso de rol', 'भूमिका अनुमति', 'Разрешение на роль', 'Rolle tilladelse', 'Դերի թույլտվություն', 'როლის ნებართვა', 'भूमिका परवानगी', 'Kebenaran Peranan', 'ਰੋਲ ਅਧਿਕਾਰ', 'பங்கு அனுமதி', 'పాత్ర అనుమతి', 'Rolltillstånd', 'Pahintulot sa Papel'),
(813, 'cron_job', 'Cron Job', 'ক্রোন জব', 'وظيفة كرون', 'Tâche planifiée', 'क्रॉन नौकरी', 'Pekerjaan Cron', 'Cron Job', 'cronジョブ', '크론 직업', 'Cron Job', '', 'Cron Job', 'Cron İşi', 'کرون جاب', 'Cron Job', 'Cron Job', '', 'Cron Job', 'Cron Job', 'क्रोन कार्य', 'Cron Job', 'Cron Job', 'Քրոն Jobոբ', 'კრონ ჯობი', 'क्रोन जॉब', 'Pekerjaan Cron', 'ਕ੍ਰੋਨ ਜੌਬ', 'கிரான் வேலை', 'క్రాన్ జాబ్', 'Cron jobb', 'Trabaho ng Cron'),
(814, 'custom_field', 'Custom Field', 'কাস্টম ক্ষেত্র', 'حقل مخصص', 'Champ personnalisé', 'कस्टम फील्ड', 'Tanah adat', 'Campo personalizzato', 'カスタムフィールド', '사용자 정의 필드', 'Aangepast veld', '', 'ฟิลด์ที่กำหนดเอง', 'Özel alan', 'کسٹم فیلڈ', '自订栏位', 'Aangepaste veld', '', 'Προσαρμοσμένο πεδίο', 'Campo personalizado', 'अनुकूलन क्षेत्र', 'Пользовательское поле', 'Brugerdefineret felt', 'Պատվերով դաշտ', 'საბაჟო ველი', 'सानुकूल फील्ड', 'Bidang Adat', 'ਕਸਟਮ ਫੀਲਡ', 'தனிப்பயன் புலம்', 'అనుకూల ఫీల్డ్', 'Anpassat fält', 'Pasadyang Patlang'),
(815, 'enter_valid_email', 'Enter Valid Email', 'সঠিক ইমেইল এড্রেস প্রদান করুন', 'أدخل بريدًا إلكترونيًا صالحًا', 'Entrez une adresse email valide', 'मान्य ईमेल दर्ज करें', 'Masuk kan email yang benar', 'Inserisci un indirizzo e-mail valido', '有効な電子メールを入力してください', '유효한 이메일을 입력하십시오', 'Vul een geldig emailadres in', '', 'ใส่อีเมลที่ถูกต้อง', 'Geçerli e-posta girin', 'درست ای میل درج کریں', '输入有效的邮箱', 'Voer geldige e-posadres in', '', 'Εισαγάγετε έγκυρο email', 'Ingrese un email valido', 'मान्य ईमेल प्रविष्ट गर्नुहोस्', 'Введите действующий адрес электронной почты', 'Indtast gyldig e-mail', 'Մուտքագրեք վավեր էլ', 'შეიყვანეთ სწორი ელ', 'वैध ईमेल प्रविष्ट करा', 'Masukkan E-mel yang Sah', 'ਵੈਧ ਈਮੇਲ ਦਰਜ ਕਰੋ', 'செல்லுபடியாகும் மின்னஞ்சலை உள்ளிடவும்', 'చెల్లుబాటు అయ్యే ఇమెయిల్‌ను నమోదు చేయండి', 'Ange en giltig e-postadress', 'Magpasok ng wastong email'),
(816, 'lessons', 'Lessons', 'পাঠ', 'الدروس', 'Cours', 'पाठ', 'Pelajaran', 'Lezioni', 'レッスン', '수업', 'Lessen', '', 'บทเรียน', 'Dersler', 'اسباق', '经验教训', 'lesse', '', 'Μαθήματα', 'Lecciones', 'पाठ', 'занятия', 'Erfaringer', 'Դասեր', 'გაკვეთილები', 'धडे', 'Pengajaran', 'ਸਬਕ', 'பாடங்கள்', 'పాఠాలు', 'lektioner', 'Mga Aralin'),
(817, 'live_class', 'Live Class', 'লাইভ ক্লাস', 'فئة حية', 'Cours en direct', 'लाइव क्लास', 'Kelas Langsung', 'Classe dal vivo', 'ライブクラス', '라이브 클래스', 'Live klasse', '', 'ชั้นเรียนสด', 'Canlı Sınıf', 'براہ راست کلاس', '现场课', 'Live klas', '', 'Ζωντανή τάξη', 'Clase en vivo', 'प्रत्यक्ष कक्षा', 'Живой класс', 'Live klasse', 'Կենդանի դաս', 'ცოცხალი კლასი', 'थेट वर्ग', 'Kelas Langsung', 'ਲਾਈਵ ਕਲਾਸ', 'நேரடி வகுப்பு', 'లైవ్ క్లాస్', 'Live klass', 'Live na Klase'),
(818, 'sl', 'Sl', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(819, 'meeting_id', 'Live Class', 'লাইভ ক্লাস', 'فئة حية', 'Cours en direct', 'लाइव क्लास', 'Kelas Langsung', 'Classe dal vivo', 'ライブクラス', '라이브 클래스', 'Live klasse', '', 'ชั้นเรียนสด', 'Canlı Sınıf', 'براہ راست کلاس', '现场课', 'Live klas', '', 'Ζωντανή τάξη', 'Clase en vivo', 'प्रत्यक्ष कक्षा', 'Живой класс', 'Live klasse', 'Կենդանի դաս', 'ცოცხალი კლასი', 'थेट वर्ग', 'Kelas Langsung', 'ਲਾਈਵ ਕਲਾਸ', 'நேரடி வகுப்பு', 'లైవ్ క్లాస్', 'Live klass', 'Live na Klase'),
(820, 'start_time', 'Start Time', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(821, 'end_time', 'End Time', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(822, 'zoom_meeting_id', 'Zoom Meeting Id', 'জুম মিটিং আইডি', 'تكبير / تصغير معرف الاجتماع', 'Zoom ID de réunion', 'ज़ूम मीटिंग आईडी', 'Zoom Id Rapat', 'Zoom ID riunione', '会議IDをズーム', '확대 회의 ID', 'Zoom Meeting Id', '', 'ซูมรหัสการประชุม', 'Toplantı Kimliği Yakınlaştır', 'زوم میٹنگ آئی ڈی', '缩放会议ID', 'Zoom-byeenkoms-ID', '', 'Αναγνωριστικό σύσκεψης ζουμ', 'Zoom ID de reunión', 'जुम बैठक आईडी', 'Zoom Meeting Id', 'Zoom møde-id', 'Մեծացնել Հանդիպման Id', 'მასშტაბის შეხვედრის Id', 'झूम मीटिंग आयडी', 'Id Mesyuarat Zum', 'ਜ਼ੂਮ ਮੀਟਿੰਗ ਆਈਡੀ', 'பெரிதாக்குதல் ஐடி', 'జూమ్ మీటింగ్ ఐడి', 'Zoom Meeting Id', 'Mag-zoom Id Id'),
(823, 'zoom_meeting_password', 'Zoom Meeting Password', 'জুম মিটিংয়ের পাসওয়ার্ড', 'تكبير كلمة مرور الاجتماع', 'Zoom sur le mot de passe de la réunion', 'जूम मीटिंग पासवर्ड', 'Zoom Kata Sandi Rapat', 'Zoom password riunione', 'ズームミーティングパスワード', '회의 비밀번호 확대', 'Zoom Meeting Password', '', 'ซูมรหัสผ่านการประชุม', 'Toplantı Şifresini Yakınlaştır', 'زوم میٹنگ پاس ورڈ', '缩放会议密码', 'Zoom vergaderwagwoord', '', 'Κωδικός πρόσβασης σύσκεψης ζουμ', 'Zoom Contraseña de reunión', 'जुम बैठक पासवर्ड', 'Zoom Пароль встречи', 'Zoom møde adgangskode', 'Մեծացնել հանդիպման գաղտնաբառ', 'მასშტაბის შეხვედრის პაროლი', 'झूम मीटिंग पासवर्ड', 'Kata Laluan Mesyuarat Zum', 'ਜ਼ੂਮ ਮੀਟਿੰਗ ਦਾ ਪਾਸਵਰਡ', 'பெரிதாக்குதல் கடவுச்சொல்', 'జూమ్ మీటింగ్ పాస్‌వర్డ్', 'Zoommöte lösenord', 'Zoom Meeting Password'),
(824, 'time_slot', 'Time Slot', 'সময় স্লট', 'فسحة زمنية', 'Créneau horaire', 'टाइम स्लॉट', 'Slot waktu', 'Fascia oraria', 'タイムスロット', '타임 슬롯', 'Tijdslot', '', 'ช่วงเวลา', 'Zaman aralığı', 'ٹائم سلاٹ', '时隙', 'Tydsgleuf', '', 'Χρονοθήκη', 'Ranura de tiempo', 'समय स्लट', 'Временной интервал', 'Tidsvindue', 'Ժամանակի անցք', 'Დროის ინტერვალი', 'वेळ स्लॉट', 'Slot masa', 'ਟਾਈਮ ਸਲਾਟ', 'ஒதுக்கப்பட்ட நேரம்', 'సమయ విభాగం', 'Tidslucka', 'Oras ng Oras'),
(825, 'send_notification_sms', 'Send Notification Sms', 'বিজ্ঞপ্তি এসএমএস প্রেরণ করুন', 'إرسال رسالة إعلام', 'Envoyer des SMS de notification', 'अधिसूचना एसएमएस भेजें', 'Kirim Pemberitahuan Sms', 'Invia SMS di notifica', '通知SMSを送信', '알림 SMS 보내기', 'Melding verzenden Sms', '', 'ส่ง SMS แจ้งเตือน', 'Bildirim Gönder Sms', 'نوٹیفیکیشن ایس ایم ایس ارسال کریں', '发送通知短信', 'Stuur kennisgewing SMS', '', 'Αποστολή ειδοποίησης Sms', 'Enviar SMS de notificación', 'सूचना एसएमएस पठाउनुहोस्', 'Отправить уведомление смс', 'Send Notification Sms', 'Ուղարկեք ծանուցման sms- ին', 'გაგზავნეთ შეტყობინების sms', 'सूचना एसएमएस पाठवा', 'Hantarkan Pemberitahuan Sms', 'ਸੂਚਨਾ ਭੇਜੋ', 'அறிவிப்பு எஸ்எம்எஸ் அனுப்பவும்', 'నోటిఫికేషన్ SMS పంపండి', 'Send Notification Sms', 'Magpadala ng Mga Sms ng Abiso'),
(826, 'host', 'Host', 'নিমন্ত্রণকর্তা', 'مضيف', 'Hôte', 'मेज़बान', 'Tuan rumah', 'Ospite', 'ホスト', '주최자', 'Gastheer', '', 'เจ้าภาพ', 'evsahibi', 'میزبان', '主办', 'host', '', 'Πλήθος', 'Anfitrión', 'होस्ट', 'хозяин', 'Vært', 'Հյուրընկալող', 'მასპინძელი', 'होस्ट', 'Tuan rumah', 'ਹੋਸਟ', 'தொகுப்பாளர்', 'హోస్ట్', 'Värd', 'Host'),
(827, 'school', 'School', 'বিদ্যালয়', 'مدرسة', 'École', 'स्कूल', 'Sekolah', 'Scuola', '学校', '학교', 'School', '', 'โรงเรียน', 'Okul', 'اسکول', '学校', 'Skool', '', 'Σχολείο', 'Colegio', 'स्कूल', 'Школа', 'Skole', 'Դպրոց', 'სკოლა', 'शाळा', 'Sekolah', 'ਵਿਦਿਆਲਾ', 'பள்ளி', 'స్కూల్', 'Skola', 'Paaralan'),
(828, 'accounting_links', 'Accounting Links', 'অ্যাকাউন্টিং লিংক', 'روابط المحاسبة', 'Liens comptables', 'लेखा लिंक', 'Tautan Akuntansi', 'Collegamenti di contabilità', '会計リンク', '회계 링크', 'Accounting Links', '', 'ลิงค์บัญชี', 'Muhasebe Bağlantıları', 'اکاؤنٹنگ لنکس', '会计链接', 'Rekeningkundige skakels', '', 'Λογιστικοί σύνδεσμοι', 'Enlaces contables', 'लेखा लि Links्कहरू', 'Бухгалтерские ссылки', 'Regnskabsforbindelser', 'Հաշվապահական Հղումներ', 'ბუღალტრული ბმულები', 'लेखा दुवे', 'Pautan Perakaunan', 'ਲੇਖਾ ਲਿੰਕ', 'கணக்கியல் இணைப்புகள்', 'అకౌంటింగ్ లింకులు', 'Bokföringslänkar', 'Mga Link sa Accounting'),
(829, 'applicant', 'Applicant', 'প্রার্থী', 'طالب وظيفة', 'Demandeur', 'आवेदक', 'Pemohon', 'Richiedente', '申請者', '응모자', 'Aanvrager', '', 'ผู้ขอ', 'Başvuru sahibi', 'درخواست دہندہ', '申请人', 'aansoeker', '', 'Αιτών', 'Solicitante', 'आवेदक', 'заявитель', 'Ansøger', 'Դիմող', 'განმცხადებელი', 'अर्जदार', 'Pemohon', 'ਬਿਨੈਕਾਰ', 'விண்ணப்பதாரர்', 'దరఖాస్తుదారు', 'Sökande', 'Aplikante'),
(830, 'apply_date', 'Apply Date', 'আবেদন করুন তারিখ', 'تاريخ تطبيق', 'Date d\'application', 'आवेदन की तिथि', 'Terapkan Tanggal', 'Applica data', '申請日', '날짜를 적용하십시오', 'Datum toepassen', '', 'ใช้วันที่', 'Başvuru tarihi', 'تاریخ کا اطلاق کریں', '申请日期', 'Pas datum toe', '', 'Εφαρμογή ημερομηνίας', 'Fecha de aplicación', 'मिति लागू गर्नुहोस्', 'Применить дату', 'Anvend dato', 'Դիմել Ամսաթիվը', 'განაცხადის თარიღი', 'अर्ज करा', 'Tarikh Memohon', 'ਮਿਤੀ ਲਾਗੂ ਕਰੋ', 'தேதி விண்ணப்பிக்கவும்', 'తేదీని వర్తించండి', 'Tillämpa datum', 'Mag-apply ng Petsa'),
(831, 'add_leave', 'Add Leave', 'ছুটি যুক্ত করুন', 'أضف إجازة', 'Ajouter un congé', 'छुट्टी जोड़ें', 'Tambahkan Cuti', 'Aggiungi congedo', '休暇を追加', '휴가 추가', 'Verlof toevoegen', '', 'เพิ่มการลา', 'İzin Ekle', 'رخصت شامل کریں', '添加休假', 'Voeg verlof by', '', 'Προσθήκη άδειας', 'Agregar licencia', 'छोड्नुहोस्', 'Добавить Оставить', 'Tilføj orlov', 'Ավելացնել արձակուրդ', 'დაამატე შვებულება', 'रजा जोडा', 'Tambah Cuti', 'ਛੁੱਟੀ ਸ਼ਾਮਲ ਕਰੋ', 'விடுப்பு சேர்க்கவும்', 'సెలవు జోడించండి', 'Lägg till ledighet', 'Magdagdag ng Iwanan'),
(832, 'leave_date', 'Leave Date', 'ছেড়ে দিন', 'تاريخ مغادرة', 'Date de départ', 'तारीख को छोड़ दें', 'Tanggal Cuti', 'Lascia la data', '休暇日', '휴가 날짜', 'Datum verlaten', '', 'ออกจากวันที่', 'Ayrılış tarihi', 'تاریخ چھوڑو', '休假日期', 'Verlaat Datum', '', 'Ημερομηνία αποχώρησης', 'Fecha de partida', 'मिति छोड्नुहोस्', 'Дата отпуска', 'Forlad dato', 'Թողեք Ամսաթիվ', 'დატოვე თარიღი', 'सोडण्याची तारीख', 'Tarikh Cuti', 'ਤਾਰੀਖ ਛੱਡੋ', 'விடுப்பு தேதி', 'సెలవు తేదీ', 'Lämna datum', 'Mag-iwan ng Petsa'),
(833, 'attachment', 'Attachment', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(834, 'comments', 'Comments', 'মন্তব্য', 'تعليقات', 'commentaires', 'टिप्पणियाँ', 'Komentar', 'Commenti', 'コメント', '코멘트', 'Opmerkingen', '', 'ความคิดเห็น', 'Yorumlar', 'تبصرے', '注释', 'kommentaar', '', 'Σχόλια', 'Comentarios', 'प्रतिक्रियाहरु', 'Комментарии', 'Kommentarer', 'Մեկնաբանություններ', 'კომენტარები', 'टिप्पण्या', 'Komen', 'ਟਿਪਣੀਆਂ', 'கருத்துரைகள்', 'వ్యాఖ్యలు', 'kommentarer', 'Mga Komento'),
(835, 'staff_id', 'Staff Id', 'স্টাফ আইডি', 'معرف الموظفين', 'Identifiant du personnel', 'स्टाफ आईडी', 'ID Staf', 'ID personale', 'スタッフID', '직원 ID', 'Personeels-ID', '', 'รหัสพนักงาน', 'Personel Kimliği', 'اسٹاف کی شناخت', '员工编号', 'Personeel-id', '', 'Αναγνωριστικό προσωπικού', 'Identificación del personal', 'स्टाफ आईडी', 'Идентификатор персонала', 'Personale-id', 'Աշխատակազմի Id', 'პერსონალის Id', 'स्टाफ आयडी', 'Id Kakitangan', 'ਸਟਾਫ ਆਈ.ਡੀ.', 'பணியாளர்கள் ஐடி', 'స్టాఫ్ ఐడి', 'Personal-id', 'Staff Id'),
(836, 'income_vs_expense_of', 'Income Vs Expense Of', 'আয় বনাম ব্যয়', 'دخل مقابل حساب', 'Revenu contre dépenses de', 'की आय बनाम व्यय', 'Penghasilan vs Biaya', 'Entrate vs spese di', '収入対費用', '소득 대 비용', 'Inkomen versus kosten van', '', 'รายรับเทียบกับค่าใช้จ่าย', 'Gelir ve Giderleri', 'آمدنی بمقابلہ اخراجات', '收入与支出', 'Inkomste teen uitgawes van', '', 'Έσοδα έναντι δαπανών', 'Ingresos vs gastos de', 'आय बनाम खर्च', 'Доход против расходов', 'Indkomst mod udgift af', 'Եկամուտը ընդդեմ ծախսերի', 'შემოსავლის წინააღმდეგ ხარჯები', 'उत्पन्न विरूद्ध खर्च', 'Pendapatan berbanding perbelanjaan', 'ਆਮਦਨ ਬਨਾਮ ਖਰਚ', 'வருமான Vs செலவு', 'ఆదాయం Vs ఖర్చు', 'Inkomster mot utgifter för', 'Kita ng kita ng kita'),
(837, 'designation_name', 'Designation Name', 'পদবি নাম', 'اسم التعيين', 'Nom de la désignation', 'पदनाम नाम', 'Nama Penunjukan', 'Nome di designazione', '指定名', '명칭 명', 'Benaming Naam', '', 'ชื่อตำแหน่ง', 'Adı', 'عہدہ نام', '名称名称', 'Benaming Naam', '', 'Όνομα προσδιορισμού', 'Nombre de designación', 'पदनाम', 'Наименование Наименование', 'Betegnelse Navn', 'Նշման անվանումը', 'აღნიშვნის სახელი', 'पदनाम', 'Nama Penamaan', 'ਅਹੁਦਾ ਨਾਮ', 'பதவி பெயர்', 'హోదా పేరు', 'Beteckning Namn', 'Pangalan ng pagtatalaga'),
(838, 'already_taken', 'This %s already exists.', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(839, 'department_name', 'Department Name', 'বিভাগ নাম', 'اسم القسم', 'Nom du département', 'विभाग का नाम', 'nama departemen', 'Nome Dipartimento', '部署名', '부서 이름', 'Afdelingsnaam', '', 'ชื่อห้างสรรพสินค้า', 'Bölüm Adı', 'محکمہ نام', '部门名称', 'Departement Naam', '', 'όνομα τμήματος', 'Nombre de Departamento', 'विभाग नाम', 'название отдела', 'Afdelingsnavn', 'Բաժնի անուն', 'დეპარტამენტის სახელწოდება', 'विभागाचे नाव', 'nama jabatan', 'ਵਿਭਾਗ ਦਾ ਨਾਮ', 'துறை பெயர்', 'శాఖ పేరు', 'Avdelningsnamn', 'Pangalan ng Kagawaran'),
(840, 'date_of_birth', 'Date Of Birth', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Geboortedatum', 'Geburtsdatum', 'Ημερομηνια γεννησης', 'Fecha de nacimiento', 'जन्म मिति', 'Дата рождения', 'Fødselsdato', 'Ծննդյան ամսաթիվ', 'Დაბადების თარიღი', 'जन्म तारीख', 'Tarikh lahir', 'ਜਨਮ ਤਾਰੀਖ', 'பிறந்த தேதி', 'పుట్టిన తేది', 'Födelsedatum', 'Araw ng kapanganakan'),
(841, 'bulk_delete', 'Bulk Delete', 'বাল্ক মুছুন', 'حذف مجمّع', 'Suppression groupée', 'बल्क डिलीट करें', 'Hapus Massal', 'Elimina in blocco', '一括削除', '대량 삭제', 'Bulk verwijderen', '', 'ลบเป็นกลุ่ม', 'Toplu Silme', 'بلک ڈیلیٹ', '批量删除', 'Grootmaatverwydering', '', 'Μαζική διαγραφή', 'Eliminar a granel', 'थोक हटाउनुहोस्', 'Массовое удаление', 'Bulk Delete', 'Զանգվածի ջնջում', 'ნაყარი წაშლა', 'बल्क हटवा', 'Padam Pukal', 'ਥੋਕ ਮਿਟਾਓ', 'மொத்த நீக்கு', 'బల్క్ డిలీట్', 'Bulk Delete', 'Maramihang Tanggalin'),
(842, 'guardian_name', 'Guardian Name', 'অভিভাবকের নাম', 'اسم الوصي', 'Nom du gardien', 'अभिभावक का नाम', 'Nama penjaga', 'Nome della guardia', '保護者の名前', '보호자 이름', 'Naam voogd', '', 'ชื่อผู้พิทักษ์', 'Muhafız adı', 'گارڈین کا نام', '监护人姓名', 'Voognaam', '', 'Όνομα κηδεμόνα', 'Nombre del tutor', 'अभिभावकको नाम', 'Имя опекуна', 'Værge navn', 'Խնամակալ անուն', 'მეურვის სახელი', 'पालक नाव', 'Nama Penjaga', 'ਸਰਪ੍ਰਸਤ ਦਾ ਨਾਮ', 'கார்டியன் பெயர்', 'గార్డియన్ పేరు', 'Väktarnamn', 'Pangalan ng Tagapangalaga'),
(843, 'fees_progress', 'Fees Progress', 'ফি অগ্রগতি', 'رسوم التقدم', 'Progression des frais', 'फीस प्रगति', 'Kemajuan Biaya', 'Commissioni Progresso', '料金の進捗', '수수료 진행', 'Vergoedingen vooruitgang', '', 'ความคืบหน้าค่าธรรมเนียม', 'Ücret İlerlemesi', 'فیس ترقی', '收费进度', 'Fooie vorder', '', 'Πρόοδος χρεώσεων', 'Tasas de progreso', 'शुल्क प्रगति', 'Тарифы Прогресс', 'Gebyrer fremskridt', 'Վճարների առաջընթաց', 'პროგრესი', 'फी प्रगती', 'Kemajuan Yuran', 'ਫੀਸ ਤਰੱਕੀ', 'கட்டணம் முன்னேற்றம்', 'ఫీజు పురోగతి', 'Avgifter framsteg', 'Pag-unlad ng Bayad'),
(844, 'evaluate', 'Evaluate', 'মূল্যনির্ধারণ', 'تقييم', 'Évaluer', 'मूल्यांकन करना', 'Evaluasi', 'Valutare', '評価する', '평가', 'Evalueer', '', 'ประเมินผล', 'Değerlendirmek', 'اندازہ', '评估', 'evalueer', '', 'Αξιολογώ', 'Evaluar', 'मूल्यांकन गर्नुहोस्', 'оценивать', 'Vurdere', 'Գնահատեք', 'შეაფასეთ', 'मूल्यांकन करा', 'Nilaikan', 'ਪੜਤਾਲ', 'மதிப்பீடு செய்யுங்கள்', 'పరీక్షించు', 'Utvärdera', 'Suriin'),
(845, 'date_of_homework', 'Date Of Homework', 'হোম ওয়ার্কের তারিখ', 'تاريخ الواجب المنزلي', 'Date des devoirs', 'होमवर्क की तारीख', 'Tanggal Pekerjaan Rumah', 'Data dei compiti', '宿題の日', '숙제 날짜', 'Datum van huiswerk', '', 'วันที่ทำการบ้าน', 'Ödev Tarihi', 'ہوم ورک کی تاریخ', '作业日期', 'Datum van huiswerk', '', 'Ημερομηνία εργασίας', 'Fecha de tarea', 'गृहकार्यको मिति', 'Дата домашней работы', 'Dato for hjemmearbejde', 'Տնային աշխատանքների ամսաթիվ', 'საშინაო დავალების თარიღი', 'गृहपाठ तारीख', 'Tarikh Kerja Rumah', 'ਹੋਮਵਰਕ ਦੀ ਤਾਰੀਖ', 'வீட்டுப்பாடம் தேதி', 'హోంవర్క్ తేదీ', 'Datum för läxor', 'Petsa ng Gawaing Pantahanan'),
(846, 'date_of_submission', 'Date Of Submission', 'জমা তারিখ', 'تاريخ التقديم', 'Date de soumission', 'ज़मा करने की तिथि', 'Tanggal Penyerahan', 'Data di presentazione', '提出日', '제출 날짜', 'Datum van indiening', '', 'วันที่ยื่น', 'Teslim tarihi', 'جمع کرانے کی تاریخ', '提交日期', 'Datum van indiening', '', 'Ημερομηνία υποβολής', 'Fecha de presentación', 'बुझाइएको मिति', 'Дата подачи', 'Afleveringsdato', 'Ներկայացման ամսաթիվը', 'წარდგენის თარიღი', 'सादर करण्याची तारीख', 'Tarikh penyerahan', 'ਪੇਸ਼ ਕਰਨ ਦੀ ਮਿਤੀ', 'சமர்ப்பிக்க வேண் டிய தேதி', 'దాఖలు చేసే తేదీ', 'Inlämningsdatum', 'Petsa ng Pagsumite'),
(847, 'student_fees_report', 'Student Fees Report', 'শিক্ষার্থী ফি রিপোর্ট', 'تقرير رسوم الطالب', 'Rapport sur les frais de scolarité', 'छात्र शुल्क रिपोर्ट', 'Laporan Biaya Siswa', 'Rapporto sulle tasse studentesche', '学生料金レポート', '학생 비 보고서', 'Student Fees Report', '', 'รายงานค่าธรรมเนียมนักศึกษา', 'Öğrenci Ücretleri Raporu', 'طلباء کی فیس رپورٹ', '学生费用报告', 'Studentegelde-verslag', '', 'Αναφορά φοιτητικών αμοιβών', 'Informe de tarifas estudiantiles', 'विद्यार्थी शुल्क रिपोर्ट', 'Отчет о студенческих взносах', 'Rapport om studerendes gebyrer', 'Ուսանողների վարձատրության մասին հաշվետվություն', 'სტუდენტური საფასურის ანგარიში', 'विद्यार्थी फी अहवाल', 'Laporan Yuran Pelajar', 'ਵਿਦਿਆਰਥੀ ਫੀਸ ਦੀ ਰਿਪੋਰਟ', 'மாணவர் கட்டண அறிக்கை', 'విద్యార్థుల ఫీజు నివేదిక', 'Studentavgiftsrapport', 'Ulat sa Bayad ng Mag-aaral'),
(848, 'student_fees_reports', 'Student Fees Reports', 'ছাত্র ফি প্রতিবেদন', 'تقارير رسوم الطلاب', 'Rapports sur les frais de scolarité', 'छात्र शुल्क रिपोर्ट', 'Laporan Biaya Siswa', 'Rapporti sulle tasse degli studenti', '学生料金レポート', '학생 비 보고서', 'Rapportage studententarieven', '', 'รายงานค่าธรรมเนียมนักศึกษา', 'Öğrenci Ücret Raporları', 'طلباء کی فیسوں کی رپورٹیں', '学生费用报告', 'Verslae oor studentegelde', '', 'Αναφορές φοιτητικών τελών', 'Informes de tarifas de estudiantes', 'विद्यार्थी शुल्क रिपोर्टहरू', 'Отчеты о студенческих сборах', 'Rapporter om studerendes gebyrer', 'Ուսանողների վճարների հաշվետվություններ', 'სტუდენტური მოსაკრებლების ანგარიშები', 'विद्यार्थी फी अहवाल', 'Laporan Yuran Pelajar', 'ਵਿਦਿਆਰਥੀ ਫੀਸ ਰਿਪੋਰਟ', 'மாணவர் கட்டணம் அறிக்கைகள்', 'విద్యార్థుల ఫీజు నివేదికలు', 'Rapporter om studentavgifter', 'Mga Ulat sa Mga Mag-aaral'),
(849, 'due_date', 'Due Date', 'নির্দিষ্ট তারিখ', 'تاريخ الاستحقاق', 'Due Date', 'नियत तारीख', 'Batas tanggal terakhir', 'Due Date', '期日', '마감일', 'Opleveringsdatum', '', 'วันที่ครบกำหนด', 'Bitiş tarihi', 'اخری تاریخ', '截止日期', 'Keerdatum', '', 'Ημερομηνία λήξης', 'Fecha de vencimiento', 'मिति', 'Срок сдачи', 'Afleveringsdato', 'Վերջնաժամկետ', 'Თარიღის თანახმად', 'देय तारीख', 'Tarikh Akhir', 'ਅਦਾਇਗੀ ਤਾਰੀਖ', 'உரிய தேதி', 'గడువు తేది', 'Förfallodatum', 'Takdang petsa'),
(850, 'payment_date', 'Payment Date', 'টাকা প্রদানের তারিখ', 'موعد الدفع', 'Date de paiement', 'भुगतान तिथि', 'Tanggal pembayaran', 'Data di pagamento', '支払期日', '지불 일', 'Betaaldatum', '', 'วันจ่าย', 'Ödeme tarihi', 'ادائیگی کی تاریخ', '付款日期', 'Betaaldatum', '', 'Ημερομηνία πληρωμής', 'Fecha de pago', 'भुक्तान मिति', 'Дата оплаты', 'Betalingsdato', 'Վճարման օր', 'Გადახდის დღე', 'पगाराची तारीख', 'Tarikh pembayaran', 'ਭੁਗਤਾਨ ਦੀ ਮਿਤੀ', 'கட்டணம் தேதி', 'చెల్లింపు తేదీ', 'Betalningsdag', 'Petsa ng Pagbabayad'),
(851, 'payment_via', 'Payment Via', 'অর্থ প্রদানের মাধ্যমে', 'الدفع عن طريق', 'Paiement via', 'भुगतान वाया', 'Pembayaran Via', 'Pagamento via', '支払い', '통해 결제', 'Betaling via', '', 'ชำระเงินผ่าน', 'Üzerinden Ödeme', 'ادائیگی کے ذریعے', '通过付款', 'Betaling via', '', 'Πληρωμή μέσω', 'Pago vía', 'भुक्तान मार्फत', 'Оплата через', 'Betaling via', 'Վճարման միջոցով', 'გადახდის საშუალებით', 'पेमेंट मार्गे', 'Pembayaran Melalui', 'ਭੁਗਤਾਨ ਦੁਆਰਾ', 'கட்டணம் வழியாக', 'చెల్లింపు ద్వారా', 'Betalning via', 'Pagbabayad sa Via'),
(852, 'generate', 'Generate', 'জেনারেট করুন', 'انشاء', 'produire', 'उत्पन्न', 'Menghasilkan', 'creare', '生む', '일으키다', 'Genereer', '', 'สร้าง', 'üretmek', 'پیدا کرنا', '生成', 'genereer', '', 'Παράγω', 'Generar', 'उत्पन्न गर्नुहोस्', 'генерировать', 'Frembringe', 'Ստեղծել', 'Გენერირება', 'उत्पन्न करा', 'Menjana', 'ਤਿਆਰ ਕਰੋ', 'உருவாக்கு', 'రూపొందించండి', 'Generera', 'Bumuo'),
(853, 'print_date', 'Print Date', 'মুদ্রণ তারিখ', 'تاريخ الطباعة', 'Print Date', 'प्रिंट दिनांक', 'Tanggal cetak', 'Data di stampa', '印刷日', '인쇄 일', 'Print datum', '', 'วันที่พิมพ์', 'Basım tarihi', 'تاریخ پرنٹ کریں', '列印日期', 'Drukdatum', '', 'Ημερομηνία εκτύπωσης', 'Fecha de impresion', 'मिति छाप्नुहोस्', 'Дата печати', 'Udskriv dato', 'Տպման ամսաթիվը', 'დაბეჭდვის თარიღი', 'मुद्रित तारीख', 'Tarikh Cetakan', 'ਪ੍ਰਿੰਟ ਮਿਤੀ', 'அச்சு தேதி', 'ప్రింట్ తేదీ', 'Utskriftsdatum', 'Petsa ng Pag-print'),
(854, 'bulk_sms_and_email', 'Bulk Sms And Email', 'বাল্ক এসএমএস এবং ইমেল', 'الرسائل القصيرة والبريد الإلكتروني', 'Sms en vrac et email', 'थोक एसएमएस और ईमेल', 'Sms Dan Email Massal', 'SMS all\'ingrosso ed e-mail', '一括SMSとメール', '대량 SMS 및 이메일', 'Bulk SMS en e-mail', '', 'SMS จำนวนมากและอีเมล์', 'Toplu Sms ve E-posta', 'بلک ایس ایم ایس اور ای میل', '大量短信和电子邮件', 'Grootmaat SMS’e en e-pos', '', 'Μαζικά SMS και email', 'SMS a granel y correo electrónico', 'थोक एसएमएस र ईमेल', 'Массовая смс и электронная почта', 'Bulk SMS og e-mail', 'Զանգվածային SMS և էլ', 'ნაყარი SMS და ელ', 'बल्क एसएमएस आणि ईमेल', 'Sms Dan E-mel Pukal', 'ਬਲਕ ਐਸ ਐਮ ਐਸ ਅਤੇ ਈਮੇਲ', 'மொத்த எஸ்எம்எஸ் மற்றும் மின்னஞ்சல்', 'బల్క్ SMS మరియు ఇమెయిల్', 'Bulk SMS och e-post', 'Maramihang Mga Sms At Email'),
(855, 'campaign_type', 'Campaign Type', 'প্রচারের ধরণ', 'نوع الحملة', 'Type de campagne', 'अभियान प्रकार', 'Jenis Kampanye', 'Tipo di campagna', 'キャンペーンタイプ', '캠페인 유형', 'Campagnetype', '', 'ประเภทแคมเปญ', 'Kampanya Türü', 'مہم کی قسم', '广告活动类型', 'Veldtogtipe', '', 'Τύπος καμπάνιας', 'Tipo de campaña', 'अभियान प्रकार', 'Тип кампании', 'Kampagnetype', 'Քարոզարշավի տեսակը', 'კამპანიის ტიპი', 'मोहिमेचा प्रकार', 'Jenis Kempen', 'ਮੁਹਿੰਮ ਦੀ ਕਿਸਮ', 'பிரச்சார வகை', 'ప్రచార రకం', 'Kampanjtyp', 'Uri ng Kampanya'),
(856, 'both', 'Both', 'উভয়', 'على حد سواء', 'Tous les deux', 'दोनों', 'Kedua', 'Tutti e due', 'どちらも', '양자 모두', 'Beide', '', 'ทั้งสอง', 'Her ikisi de', 'دونوں', '都', 'beide', '', 'Και τα δυο', 'Ambos', 'दुबै', 'Обе', 'Begge', 'Երկուսն էլ', 'ორივე', 'दोघेही', 'Kedua-duanya', 'ਦੋਵੇਂ', 'இருவரும்', 'రెండు', 'Både', 'Parehong'),
(857, 'regular', 'Regular', 'নিয়মিত', 'منتظم', 'Ordinaire', 'नियमित', 'Reguler', 'Regolare', '定期的', '정규병', 'Regelmatig', '', 'ปกติ', 'Düzenli', 'باقاعدہ', '定期', 'gereelde', '', 'Τακτικός', 'Regular', 'नियमित', 'регулярное', 'Fast', 'Հերթական', 'რეგულარული', 'नियमित', 'Biasa', 'ਰੋਜਾਨਾ', 'வழக்கமான', 'రెగ్యులర్', 'Regelbunden', 'Regular');
INSERT INTO `languages` (`id`, `word`, `english`, `bengali`, `arabic`, `french`, `hindi`, `indonesian`, `italian`, `japanese`, `korean`, `dutch`, `portuguese`, `thai`, `turkish`, `urdu`, `chinese`, `afrikaans`, `german`, `greek`, `spanish`, `nepali`, `russian`, `danish`, `armenian`, `georgian`, `marathi`, `malay`, `punjabi`, `tamil`, `telugu`, `swedish`, `filipino`) VALUES
(858, 'Scheduled', 'Scheduled', 'তালিকাভুক্ত', 'المقرر', 'Programmé', 'अनुसूचित', 'Dijadwalkan', 'In programma', '予定', '예정', 'Gepland', '', 'ตามเวลาที่กำหนด', 'tarifeli', 'طے شدہ', '预定的', 'geskeduleer', '', 'Προγραμματισμένος', 'Programado', 'अनुसूचित', 'Запланированное', 'Planlagt', 'Պլանավորված', 'დაგეგმილი', 'अनुसूचित', 'Berjadual', 'ਤਹਿ', 'திட்டமிடப்பட்ட', 'షెడ్యూల్డ్', 'Planerad', 'Naka-iskedyul'),
(859, 'campaign', 'Campaign', 'ক্যাম্পেইন', 'حملة', 'Campagne', 'अभियान', 'Kampanye', 'Campagna', '運動', '운동', 'Campagne', '', 'รณรงค์', 'Kampanya', 'مہم', '运动', 'veldtog', '', 'καμπάνια', 'Campaña', 'अभियान', 'кампания', 'Kampagne', 'Քարոզարշավ', 'კამპანია', 'मोहीम', 'Kempen', 'ਮੁਹਿੰਮ', 'பிரச்சாரம்', 'ప్రచారం', 'Kampanj', 'Kampanya'),
(860, 'campaign_name', 'Campaign Name', 'প্রচারাভিযান নাম', 'اسم الحملة', 'Nom de la campagne', 'अभियान का नाम', 'Nama Kampanye', 'Nome della campagna', 'キャンペーン名', '캠페인 이름', 'Campagne naam', '', 'ชื่อแคมเปญ', 'Kampanya ismi', 'مہم کا نام', '广告活动名称', 'Veldtognaam', '', 'Όνομα καμπάνιας', 'Nombre de campaña', 'अभियान नाम', 'Название кампании', 'Kampagnenavn', 'Քարոզարշավի անվանումը', 'კამპანიის სახელი', 'मोहिमेचे नाव', 'Nama Kempen', 'ਮੁਹਿੰਮ ਦਾ ਨਾਮ', 'பிரச்சாரத்தின் பெயர்', 'ప్రచార పేరు', 'Kampanj namn', 'Pangalan ng Kampanya'),
(861, 'sms_gateway', 'Sms Gateway', 'এসএমএস গেটওয়ে', 'بوابة الرسائل القصيرة', 'Passerelle SMS', 'एसएमएस गेटवे', 'Sms Gateway', 'Sms Gateway', 'SMSゲートウェイ', 'SMS 게이트웨이', 'Sms Gateway', '', 'Sms Gateway', 'SMS Ağ Geçidi', 'ایس ایم ایس گیٹ وے', '短信网关', 'Sms Gateway', '', 'Sms Gateway', 'Sms Gateway', 'एसएमएस गेटवे', 'Смс шлюз', 'Sms Gateway', 'Sms Gateway', 'სმს გეითეი', 'एसएमएस गेटवे', 'Pintu Gerbang Sms', 'ਐਸਐਮਐਸ ਗੇਟਵੇ', 'எஸ்எம்எஸ் நுழைவாயில்', 'ఎస్ఎంఎస్ గేట్వే', 'Sms Gateway', 'Sms Gateway'),
(862, 'recipients_type', 'Recipients Type', 'প্রাপক প্রকার', 'نوع المستلمين', 'Type de destinataires', 'प्राप्तकर्ता प्रकार', 'Jenis Penerima', 'Tipo di destinatario', '受信者タイプ', '받는 사람 유형', 'Type ontvangers', '', 'ประเภทผู้รับ', 'Alıcı Türü', 'وصول کنندگان کی قسم', '收件人类型', 'Ontvanger tipe', '', 'Τύπος παραληπτών', 'Tipo de destinatarios', 'प्रापकहरूको प्रकार', 'Тип получателей', 'Modtagerens type', 'Ստացողի տեսակը', 'მიმღების ტიპი', 'प्राप्तकर्त्यांचा प्रकार', 'Jenis Penerima', 'ਪ੍ਰਾਪਤ ਕਰਨ ਵਾਲਿਆਂ ਦੀ ਕਿਸਮ', 'பெறுநர்கள் வகை', 'గ్రహీతల రకం', 'Mottagartyp', 'Uri ng Mga tatanggap'),
(863, 'recipients_count', 'Recipients Count', 'প্রাপকগণ গণনা করুন', 'عدد المستلمين', 'Nombre de destinataires', 'प्राप्तकर्ता की गणना', 'Hitungan Penerima', 'Conteggio dei destinatari', '受信者数', '받는 사람 수', 'Ontvangers tellen', '', 'จำนวนผู้รับ', 'Alıcı Sayısı', 'وصول کنندگان گنتے ہیں', '收件人数', 'Ontvangers tel', '', 'Αριθμός παραληπτών', 'Recuento de destinatarios', 'प्रापकहरूको गणना', 'Количество получателей', 'Antal modtagere', 'Ստացողները հաշվում են', 'მიმღების რაოდენობა', 'प्राप्तकर्त्यांची गणना', 'Jumlah Penerima', 'ਪ੍ਰਾਪਤਕਰਤਾਵਾਂ ਦੀ ਗਿਣਤੀ', 'பெறுநர்களின் எண்ணிக்கை', 'గ్రహీతల సంఖ్య', 'Mottagare räknar', 'Mga Bilang ng Mga tatanggap'),
(864, 'body', 'Body', 'শরীর', 'الجسم', 'Corps', 'तन', 'Tubuh', 'Corpo', '体', '신체', 'Lichaam', '', 'ร่างกาย', 'Vücut', 'جسم', '身体', 'liggaam', '', 'Σώμα', 'Cuerpo', 'जीउ', 'тело', 'Legeme', 'Մարմին', 'სხეული', 'शरीर', 'Badan', 'ਸਰੀਰ', 'உடல்', 'శరీర', 'Kropp', 'Katawan'),
(865, 'guardian_already_exist', 'Guardian Already Exist', 'অভিভাবক ইতিমধ্যে বিদ্যমান', 'الوصي موجود بالفعل', 'Guardian existe déjà', 'अभिभावक पहले से ही मौजूद हैं', 'Wali Sudah Ada', 'Il guardiano esiste già', 'ガーディアンはすでに存在します', '보호자 이미 존재', 'Beschermer bestaat al', '', 'ผู้ปกครองมีอยู่แล้ว', 'Guardian Zaten Var', 'گارڈین پہلے سے موجود ہے', '监护人已经存在', 'Voog bestaan ​​alreeds', '', 'Ο φύλακας υπάρχει ήδη', 'Guardian ya existe', 'अभिभावक पहिले नै अवस्थित छ', 'Хранитель уже существует', 'Guardian findes allerede', 'Խնամակալն արդեն գոյություն ունի', 'მეურვე უკვე არსებობს', 'पालक आधीच अस्तित्वात आहेत', 'Penjaga Sudah Ada', 'ਸਰਪ੍ਰਸਤ ਪਹਿਲਾਂ ਹੀ ਮੌਜੂਦ ਹੈ', 'கார்டியன் ஏற்கனவே உள்ளது', 'గార్డియన్ ఇప్పటికే ఉంది', 'Guardian existerar redan', 'Tagapangalaga na Mayroon na'),
(866, 'guardian', 'Guardian', 'অভিভাবক', 'وصي', 'Gardien', 'अभिभावक', 'Wali', 'Custode', 'ガーディアン', '보호자', 'Voogd', '', 'ผู้ปกครอง', 'Muhafız', 'سرپرست', '监护人', 'voog', '', 'Κηδεμόνας', 'guardián', 'संरक्षक', 'блюститель', 'Guardian', 'Խնամակալ', 'მეურვე', 'पालक', 'Penjaga', 'ਸਰਪ੍ਰਸਤ', 'கார்டியன்', 'సంరక్షకుడు', 'väktare', 'Tagapangalaga'),
(867, 'mother_name', 'Mother Name', 'মা নাম', 'اسم الأم', 'Nom de la mère', 'मां का नाम', 'Nama ibu', 'Nome della madre', '母の名前', '엄마 이름', 'Naam moeder', '', 'ชื่อแม่', 'Anne adı', 'ماں کا نام', '母亲名字', 'Moeder se naam', '', 'Όνομα μητέρας', 'Nombre de la madre', 'आमाको नाम', 'Имя матери', 'Modernavn', 'Մոր անուն', 'დედა სახელი', 'आईचे नाव', 'Nama Ibu', 'ਮਾਂ ਦਾ ਨਾਮ', 'தாய் பெயர்', 'తల్లి పేరు', 'Modernamn', 'Pangalan ng ina'),
(868, 'bank_details', 'Bank Details', 'ব্যাংক বিবরণ', 'التفاصيل المصرفية', 'coordonnées bancaires', 'बैंक विवरण', 'rincian bank', 'coordinate bancarie', '銀行詳細', '은행 계좌 정보', 'Bankgegevens', 'Detalhes bancários', 'รายละเอียดธนาคาร', 'Banka detayları', 'بینک کی تفصیلات', '银行明细', 'Bankbesonderhede', 'Bankdaten', 'Στοιχεία τράπεζας', 'Detalles del banco', 'बैंक विवरणहरू', 'Банковские реквизиты', 'Bank detaljer', 'Բանկի տվյալներ', 'Საბანკო დეტალები', 'बँक तपशील', 'Butiran Bank', 'ਬੈਂਕ ਵੇਰਵਾ', 'வங்கி விவரங்கள்', 'బ్యాంక్ వివరములు', 'Bankuppgifter', 'Mga Detalye ng Bank'),
(869, 'skipped_bank_details', 'Skipped Bank Details', 'বাদ দেওয়া ব্যাঙ্কের বিশদ', 'تخطي تفاصيل البنك', 'Détails bancaires ignorés', 'छोड़ दिया गया बैंक विवरण', 'Detail Bank yang Dilewati', 'Dettagli bancari saltati', 'スキップされた銀行の詳細', '건너 뛴 은행 세부 정보', 'Bankgegevens overgeslagen', 'Detalhes bancários ignorados', 'ข้ามรายละเอียดธนาคาร', 'Atlanan Banka Bilgileri', 'اسکیپ بینک کی تفصیلات', '跳过的银行详细信息', 'Bankbesonderhede oorgeslaan', 'Übersprungene Bankdaten', 'Παράλειψη στοιχείων τράπεζας', 'Detalles bancarios omitidos', 'छोडियो बैंक विवरणहरू', 'Пропущенные банковские реквизиты', 'Overførte bankoplysninger', 'Բաց թողնելով բանկի մանրամասները', 'გამოტოვებული ბანკის დეტალები', 'वगळलेले बँक तपशील', 'Butiran Bank yang Dilangkau', 'ਛੱਡਿਆ ਬੈਂਕ ਵੇਰਵਾ', 'தவிர்க்கப்பட்ட வங்கி விவரங்கள்', 'దాటవేసిన బ్యాంక్ వివరాలు', 'Hoppade över bankdetaljer', 'Mga Detalye ng Mga Nilaktawan sa Bangko'),
(870, 'bank', 'Bank', 'ব্যাংক', 'مصرف', 'Banque', 'बैंक', 'Bank', 'Banca', 'バンク', '은행', 'Bank', '', 'ธนาคาร', 'Banka', 'بینک', '银行', 'Bank', '', 'Τράπεζα', 'Banco', 'बैंक', 'Банка', 'Bank', 'Բանկ', 'ბანკი', 'बँक', 'Bank', 'ਬੈਂਕ', 'வங்கி', 'బ్యాంక్', 'Bank', 'bangko'),
(871, 'holder_name', 'Holder Name', 'ধারক নাম', 'اسم صاحب التسجيل', 'Nom du titulaire', 'धारक का नाम', 'Nama pemegang', 'Nome del titolare', 'ホルダーネーム', '소지자 이름', 'Naam van de houder', '', 'ชื่อเจ้าของ', 'Sahibinin adı', 'حاملین کا نام', '持有人名称', 'Houer Naam', '', 'Ονομα του κατόχου', 'Nombre del titular', 'होल्डरको नाम', 'Имя владельца', 'Holder Name', 'Սեփականատիրոջ անունը', 'Მფლობელის სახელი', 'धारकाचे नाव', 'Nama pemegang', 'ਧਾਰਕ ਦਾ ਨਾਮ', 'வைத்திருப்பவரின் பெயர்', 'ఖాతా దారి పేరు', 'Innehavarens namn', 'Ang pangalan ng tagahawak'),
(872, 'bank_branch', 'Bank Branch', 'ব্যাংকের শাখা', 'فرع بنك', 'Agence bancaire', 'बैंक शाखा', 'Cabang Bank', 'Filiale bancaria', '銀行支店', '은행 지점', 'Bankfiliaal', '', 'สาขาธนาคาร', 'Banka şubesi', 'بنک کی شاخ', '银行支行', 'Banktak', '', 'Υποκατάστημα τράπεζας', 'Sucursal bancaria', 'बैंक शाखा', 'Отделение банка', 'Bankfilial', 'Բանկի մասնաճյուղը', 'Ბანკის ფილიალი', 'बँक शाखा', 'Cawangan Bank', 'ਬੈਂਕ ਸ਼ਾਖਾ', 'வங்கிக்கிளை', 'బ్యాంకు శాఖ', 'Bankkontor', 'Bank Branch'),
(873, 'custom_field_for', 'Custom Field For', 'কাস্টম ফিল্ড জন্য', 'حقل مخصص لـ', 'Champ personnalisé pour', 'कस्टम फ़ील्ड के लिए', 'Bidang Kustom Untuk', 'Campo personalizzato per', 'カスタムフィールド', '맞춤 입력란', 'Aangepast veld voor', '', 'ฟิลด์ที่กำหนดเองสำหรับ', 'İçin Özel Alan', 'کے لئے کسٹم فیلڈ', '自定义字段', 'Aangepaste veld vir', '', 'Προσαρμοσμένο πεδίο για', 'Campo personalizado para', 'कस्टम फिल्डका लागि', 'Пользовательское поле для', 'Brugerdefineret felt til', 'Պատվերով դաշտ', 'საბაჟო ველი', 'यासाठी सानुकूल फील्ड', 'Medan Tersuai Untuk', 'ਲਈ ਕਸਟਮ ਫੀਲਡ', 'தனிப்பயன் புலம்', 'అనుకూల ఫీల్డ్', 'Anpassat fält för', 'Pasadyang Patlang Para sa'),
(874, 'label', 'Label', 'লেবেল', 'ضع الكلمة المناسبة', 'Label', 'लेबल', 'Label', 'Etichetta', 'ラベル', '상표', 'Etiket', '', 'ฉลาก', 'Etiket', 'لیبل لگائیں', '标签', 'Etiket', '', 'Επιγραφή', 'Etiqueta', 'लेबल', 'метка', 'Etiket', 'Պիտակ', 'იარლიყი', 'लेबल', 'Label', 'ਲੇਬਲ', 'லேபிள்', 'లేబుల్', 'Märka', 'Label'),
(875, 'order', 'Order', 'ক্রম', 'طلب', 'Ordre', 'गण', 'Memesan', 'Ordine', '注文', '주문', 'Bestellen', '', 'ใบสั่ง', 'Sipariş', 'ترتیب', '订购', 'Orde', '', 'Σειρά', 'Orden', 'अर्डर', 'порядок', 'Bestille', 'Պատվեր', 'შეკვეთა', 'ऑर्डर', 'Pesanan', 'ਆਰਡਰ', 'ஆர்டர்', 'ఆర్డర్', 'Beställa', 'Order'),
(876, 'online_admission', 'Online Admission', 'অনলাইন ভর্তি', 'القبول عبر الإنترنت', 'Online Admission', 'ऑनलाइन प्रवेश', 'Online Admission', 'Ammissione online', 'オンライン入場', '온라인 입학', 'Online toelating', '', 'การรับสมัครออนไลน์', 'Online Kabul', 'آن لائن داخلہ', '网上入场', 'Aanlyn toelating', '', 'Ηλεκτρονική είσοδος', 'Admisión en línea', 'अनलाइन प्रवेश', 'Онлайн прием', 'Online adgang', 'Առցանց ընդունելություն', 'ონლაინ დაშვება', 'ऑनलाईन प्रवेश', 'Kemasukan Dalam Talian', 'ਆਨਲਾਈਨ ਦਾਖਲਾ', 'ஆன்லைன் சேர்க்கை', 'ఆన్‌లైన్ ప్రవేశం', 'Online-inträde', 'Pagpasok sa Online'),
(877, 'field_label', 'Field Label', 'ফিল্ড লেবেল', 'تسمية الميدان', 'Étiquette de champ', 'फील्ड लेबल', 'Label Bidang', 'Etichetta sul campo', 'フィールドラベル', '필드 레이블', 'veld Label', '', 'เลเบลของฟิลด์', 'Alan Etiketi', 'فیلڈ لیبل', '栏位标签', 'Veldetiket', '', 'Ετικέτα πεδίου', 'Etiqueta de campo', 'क्षेत्र लेबल', 'Полевая Метка', 'Feltmærke', 'Դաշտային պիտակ', 'საველე ეტიკეტი', 'फील्ड लेबल', 'Label Medan', 'ਫੀਲਡ ਲੇਬਲ', 'புல லேபிள்', 'ఫీల్డ్ లేబుల్', 'Fältetikett', 'Label ng Patlang'),
(878, 'field_type', 'Field Label', 'ফিল্ড লেবেল', 'تسمية الميدان', 'Étiquette de champ', 'फील्ड लेबल', 'Label Bidang', 'Etichetta sul campo', 'フィールドラベル', '필드 레이블', 'veld Label', '', 'เลเบลของฟิลด์', 'Alan Etiketi', 'فیلڈ لیبل', '栏位标签', 'Veldetiket', '', 'Ετικέτα πεδίου', 'Etiqueta de campo', 'क्षेत्र लेबल', 'Полевая Метка', 'Feltmærke', 'Դաշտային պիտակ', 'საველე ეტიკეტი', 'फील्ड लेबल', 'Label Medan', 'ਫੀਲਡ ਲੇਬਲ', 'புல லேபிள்', 'ఫీల్డ్ లేబుల్', 'Fältetikett', 'Label ng Patlang'),
(879, 'default_value', 'Default Value', 'ডিফল্ট মান', 'القيمة الافتراضية', 'Valeur par défaut', 'डिफ़ॉल्ट मान', 'Nilai Default', 'Valore predefinito', 'デフォルト値', '기본값', 'Standaardwaarde', '', 'ค่าเริ่มต้น', 'Varsayılan değer', 'پہلے سے طے شدہ قیمت', '默认值', 'Standaard waarde', '', 'Προεπιλεγμένη τιμή', 'Valor por defecto', 'पूर्वनिर्धारित मान', 'Значение по умолчанию', 'Standard værdi', 'Լռելյայն արժեք', 'ნაგულისხმევი მნიშვნელობა', 'डीफॉल्ट मूल्य', 'Nilai asal', 'ਮੂਲ ਮੁੱਲ', 'இயல்புநிலை மதிப்பு', 'డిఫాల్ట్ విలువ', 'Standardvärde', 'Halaga ng Default'),
(880, 'checked', 'Checked', 'সংযত', 'التحقق', 'Vérifié', 'चेक किए गए', 'Diperiksa', 'verificato', 'チェック済み', '확인', 'Gecontroleerd', '', 'ถูกตรวจสอบ', 'Kontrol', 'چیک کیا گیا', '已检查', 'nagegaan', '', 'Τετραγωνισμένος', 'Comprobado', 'जाँच गरियो', 'Проверено', 'Kontrolleret', 'Ստուգվում', 'შემოწმებულია', 'तपासले', 'Diperiksa', 'ਚੈੱਕ ਕੀਤਾ ਗਿਆ', 'சரிபார்க்கப்பட்டது', 'తనిఖీ', 'Kontrollerade', 'Nasuri'),
(881, 'unchecked', 'Unchecked', 'অবারিত', 'غير محدد', 'Décoché', 'अनियंत्रित', 'Tidak dicentang', 'non verificato', '未チェック', '미확인', 'Niet aangevinkt', '', 'ไม่ถูกตรวจสอบ', 'kontrolsüz', 'چیک نہیں کیا گیا', '未检查', 'ongehinderd', '', 'Ανεξέλεγκτος', 'Desenfrenado', 'जाँच नगरिएको', 'непроверенный', 'Ukontrolleret', 'Չստուգված', 'გადაუმოწმებელი', 'चेक न केलेले', 'Tidak dicentang', 'ਚੈਕ ਨਾ ਕੀਤਾ', 'தேர்வு செய்யப்படவில்லை', 'అనియంత్రిత', 'Okontrollerat', 'Hindi napigilan'),
(882, 'roll_number', 'Roll Number', 'রোল নাম্বার', 'رقم اللفة', 'Numéro de rôle', 'रोल नंबर', 'Nomor roll', 'Numero del rullino', 'ロール番号', '롤 번호', 'Rolnummer', '', 'จำนวนม้วน', 'Rulo Sayısı', 'رول نمبر', '卷号', 'Rol nommer', '', 'Αριθμός ρολού', 'Número de rollo', 'रोल नम्बर', 'Номер рулона', 'Rullenummer', 'Roll համարը', 'Roll ნომერი', 'हजेरी क्रमांक', 'Nombor Roll', 'ਰੋਲ ਨੰਬਰ', 'பட்டியல் எண்', 'రోల్ సంఖ్య', 'Valsnummer', 'Numero ng Roll'),
(883, 'add_rows', 'Add Rows', 'সারি যুক্ত করুন', 'إضافة صفوف', 'Ajouter des lignes', 'पंक्तियाँ जोड़ें', 'Tambahkan Baris', 'Aggiungi righe', '行を追加', '행 추가', 'Rijen toevoegen', '', 'เพิ่มแถว', 'Satır Ekle', 'قطاریں شامل کریں', '添加行', 'Voeg rye by', '', 'Προσθήκη σειρών', 'Agregar filas', 'पows्क्तिहरू थप्नुहोस्', 'Добавить строки', 'Tilføj rækker', 'Ավելացնել տողեր', 'დაამატეთ რიგები', 'पंक्ती जोडा', 'Tambah Baris', 'ਕਤਾਰਾਂ ਸ਼ਾਮਲ ਕਰੋ', 'வரிசைகளைச் சேர்க்கவும்', 'వరుసలను జోడించండి', 'Lägg till rader', 'Magdagdag ng Rows'),
(884, 'salary', 'Salary', 'বেতন', 'راتب', 'Un salaire', 'वेतन', 'Gaji', 'Stipendio', '給料', '봉급', 'Salaris', '', 'เงินเดือน', 'Maaş', 'تنخواہ', '薪水', 'Salaris', '', 'Μισθός', 'Salario', 'तलब', 'Зарплата', 'Løn', 'Աշխատավարձ', 'ხელფასი', 'पगार', 'Gaji', 'ਤਨਖਾਹ', 'சம்பளம்', 'జీతం', 'Lön', 'Salary'),
(885, 'basic', 'Basic', 'মৌলিক', 'الأساسي', 'De base', 'बुनियादी', 'Dasar', 'Di base', 'ベーシック', '기본', 'Basic', '', 'ขั้นพื้นฐาน', 'Temel', 'بنیادی', '基本的', 'basiese', '', 'Βασικός', 'Básico', 'आधारभूत', 'основной', 'Grundlæggende', 'Հիմնական', 'ძირითადი', 'मूलभूत', 'Asas', 'ਮੁੱ .ਲਾ', 'அடிப்படை', 'ప్రాథమిక', 'Grundläggande', 'Pangunahing'),
(886, 'allowance', 'Allowance', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(887, 'deduction', 'Deduction', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(888, 'net', 'Net', 'নেট', 'Net', 'Net', 'जाल', 'Bersih', 'Netto', 'ネット', '그물', 'Net', '', 'สุทธิ', 'Ağ', 'نیٹ', '净', 'net', '', 'Καθαρά', 'Red', 'नेट', 'Net', 'Net', 'Զուտ', 'ბადე', 'नेट', 'Bersih', 'ਨੈੱਟ', 'நிகர', 'నికర', 'Netto', 'Net'),
(889, 'activated_sms_gateway', 'Activated Sms Gateway', 'সক্রিয় এসএমএস গেটওয়ে', 'بوابة الرسائل القصيرة المنشّطة', 'Passerelle Sms activée', 'सक्रिय एसएमएस गेटवे', 'Gateway Sms Diaktifkan', 'Gateway SMS attivato', 'アクティブ化されたSMSゲートウェイ', '활성화 된 SMS 게이트웨이', 'Geactiveerde Sms-gateway', '', 'เปิดใช้งาน Sms Gateway', 'Etkinleştirilmiş Sms Ağ Geçidi', 'چالو ایس ایم ایس گیٹ وے', '激活的短信网关', 'Sms Gateway geaktiveer', '', 'Ενεργοποιημένη πύλη Sms', 'Gateway SMS activado', 'सक्रिय एसएमएस गेटवे', 'Активированный смс шлюз', 'Aktiveret Sms Gateway', 'Ակտիվացված Sms Gateway', 'გააქტიურებული sms Gateway', 'सक्रिय एसएमएस गेटवे', 'Sms Gateway yang diaktifkan', 'ਐਕਟਿਵੇਟਿਡ ਐਸ ਐਮ ਐਸ ਗੇਟਵੇ', 'செயல்படுத்தப்பட்ட எஸ்எம்எஸ் நுழைவாயில்', 'సక్రియం చేసిన Sms గేట్‌వే', 'Aktiverad Sms Gateway', 'Aktibo Sms Gateway'),
(890, 'account_sid', 'Account Sid', 'অ্যাকাউন্ট সিড', 'حساب Sid', 'Compte Sid', 'खाता सिड', 'Akun Sid', 'Conto Sid', 'アカウントSID', '계정 시드', 'Account Sid', '', 'ซิดบัญชี', 'Hesap Sid', 'اکاؤنٹ سڈ', '帐户编号', 'Rekening Sid', '', 'Λογαριασμός Sid', 'Cuenta Sid', 'खाता सिड', 'Аккаунт Сид', 'Konto Sid', 'Հաշիվը Sid', 'ანგარიში Sid', 'खाते सिड', 'Akaun Sid', 'ਖਾਤਾ ਸਿਡ', 'கணக்கு சித்', 'ఖాతా సిడ్', 'Account Sid', 'Account Sid'),
(891, 'roles', 'Roles', 'ভূমিকা', 'الأدوار', 'Les rôles', 'भूमिकाएँ', 'Peran', 'ruoli', '役割', '역할', 'Rollen', '', 'บทบาท', 'Roller', 'کردار', '的角色', 'rolle', '', 'Ρόλοι', 'Roles', 'भूमिकाहरू', 'Роли', 'Roller', 'Դերը', 'როლები', 'भूमिका', 'Peranan', 'ਰੋਲ', 'பாத்திரங்கள்', 'పాత్రలు', 'roller', 'Mga Papel'),
(892, 'system_role', 'System Role', 'সিস্টেমের ভূমিকা', 'دور النظام', 'Rôle système', 'सिस्टम रोल', 'Peran Sistem', 'Ruolo di sistema', 'システムの役割', '시스템 역할', 'Systeemrol', '', 'บทบาทของระบบ', 'Sistem Rolü', 'سسٹم کا کردار', '系统角色', 'Stelselrol', '', 'Ρόλος συστήματος', 'Rol del sistema', 'प्रणाली भूमिका', 'Системная роль', 'Systemrolle', 'Համակարգի դերը', 'სისტემის როლი', 'सिस्टम रोल', 'Peranan Sistem', 'ਸਿਸਟਮ ਰੋਲ', 'கணினி பங்கு', 'సిస్టమ్ పాత్ర', 'Systemroll', 'System Role'),
(893, 'permission', 'Permission', 'অনুমতি', 'الإذن', 'Permission', 'अनुमति', 'Izin', 'Autorizzazione', '許可', '허가', 'Toestemming', '', 'การอนุญาต', 'izin', 'اجازت', '允许', 'toestemming', '', 'Αδεια', 'Permiso', 'अनुमति', 'разрешение', 'Tilladelse', 'Թույլտվություն', 'ნებართვა', 'परवानगी', 'Kebenaran', 'ਆਗਿਆ', 'அனுமதி', 'అనుమతి', 'Tillstånd', 'Pahintulot'),
(894, 'edit_session', 'Edit Session', 'সেশন সম্পাদনা করুন', 'تحرير الجلسة', 'Edit Session', 'सत्र संपादित करें', 'Edit Sesi', 'Modifica sessione', 'セッションを編集', '세션 편집', 'Sessie bewerken', '', 'แก้ไขเซสชัน', 'Oturumu Düzenle', 'سیشن میں ترمیم کریں', '编辑会议', 'Redigeer sessie', '', 'Επεξεργασία περιόδου σύνδεσης', 'Editar sesión', 'सत्र सम्पादन गर्नुहोस्', 'Изменить сессию', 'Rediger session', 'Խմբագրել նիստը', 'სესიის რედაქტირება', 'सत्र संपादित करा', 'Edit Sesi', 'ਸ਼ੈਸ਼ਨ ਸੋਧੋ', 'அமர்வைத் திருத்து', 'సెషన్‌ను సవరించండి', 'Redigera session', 'I-edit ang Session'),
(895, 'transactions', 'Transactions', 'লেনদেন', 'المعاملات', 'Transactions', 'लेन-देन', 'Transaksi', 'Le transazioni', '取引', '업무', 'Transacties', '', 'การทำธุรกรรม', 'işlemler', 'لین دین', '交易次数', 'transaksies', '', 'Συναλλαγές', 'Actas', 'लेनदेन', 'операции', 'Transaktioner', 'Գործարքներ', 'გარიგებები', 'व्यवहार', 'Urus Niaga', 'ਲੈਣ-ਦੇਣ', 'பரிவர்த்தனைகள்', 'ట్రాన్సాక్షన్స్', 'transaktioner', 'Mga Transaksyon'),
(896, 'default_account', 'Default Account', 'ডিফল্ট অ্যাকাউন্ট', 'الحساب الافتراضي', 'Compte par défaut', 'मूल खाता', 'Akun Default', 'Account predefinito', 'デフォルトのアカウント', '기본 계정', 'Standaardaccount', '', 'บัญชีเริ่มต้น', 'Varsayılan Hesap', 'ڈیفالٹ اکاؤنٹ', '默认帐号', 'Verstekrekening', '', 'Προεπιλεγμένος λογαριασμός', 'Cuenta predeterminada', 'पूर्वनिर्धारित खाता', 'Аккаунт по умолчанию', 'Standardkonto', 'Կանխադրված հաշիվ', 'ნაგულისხმევი ანგარიში', 'डीफॉल्ट खाते', 'Akaun Lalai', 'ਮੂਲ ਖਾਤਾ', 'இயல்புநிலை கணக்கு', 'డిఫాల్ట్ ఖాతా', 'Standardkonto', 'Default account'),
(897, 'deposit', 'Deposit', 'আমানত', 'الوديعة', 'Dépôt', 'जमा', 'Deposit', 'Depositare', '預り金', '예금', 'Storting', '', 'เงินฝาก', 'Depozito', 'جمع کروانا', '存款', 'deposito', '', 'Κατάθεση', 'Depositar', 'निक्षेप', 'депозит', 'Depositum', 'Դեպոզիտ', 'ანაბარი', 'ठेवी', 'Deposit', 'ਜਮ੍ਹਾ ਕਰੋ', 'வைப்பு', 'డిపాజిట్', 'Deposition', 'Deposit'),
(898, 'acccount', 'Acccount', 'অ্যাকাউন্টে', 'حساب', 'Compte', 'acccount', 'Acount', 'acccount', 'アカウント', '계정', 'Boekhouding', '', 'acccount', 'gelir hesabı', 'حساب کتاب', '户口', 'acccount', '', 'Λογαριασμός', 'Cuenta', 'खाता', 'acccount', 'acccount', 'Հաշվարկ', 'თანხა', 'हिशेब', 'Perakaunan', 'ਲੇਖਾ', 'கணக்கு', 'ఖాతాలో', 'de uppmärksamma', 'Acccount'),
(899, 'role_permission_for', 'Role Permission For', 'ভূমিকা জন্য অনুমতি', 'إذن دور لـ', 'Autorisation de rôle pour', 'भूमिका की अनुमति', 'Izin Peran Untuk', 'Autorizzazione al ruolo per', 'の役割権限', '역할 권한', 'Roltoestemming voor', '', 'การอนุญาตบทบาทสำหรับ', 'İçin Rol İzni', 'کردار کی اجازت کیلئے', '角色权限', 'Roltoestemming vir', '', 'Άδεια ρόλου για', 'Permiso de rol para', 'को लागि भूमिका अनुमति', 'Разрешение на роль для', 'Rolle tilladelse til', 'Դերի թույլտվություն', 'როლის ნებართვა', 'भूमिका परवानगी', 'Kebenaran Peranan Untuk', 'ਭੂਮਿਕਾ ਅਨੁਮਤੀ ਲਈ', 'பங்கு அனுமதி', 'పాత్ర అనుమతి', 'Rollstillstånd för', 'Pagpapahintulot sa Role Para sa'),
(900, 'feature', 'Feature', 'বৈশিষ্ট্য', 'خاصية', 'Fonctionnalité', 'फ़ीचर', 'Fitur', 'caratteristica', '特徴', '특색', 'Voorzien zijn van', '', 'ลักษณะเฉพาะ', 'özellik', 'خصوصیت', '特征', 'funksie', '', 'χαρακτηριστικό', 'Característica', 'फिचर', 'Характерная черта', 'Feature', 'Առանձնահատկություն', 'თვისება', 'वैशिष्ट्य', 'Ciri', 'ਫੀਚਰ', 'அம்சம்', 'ఫీచర్', 'Funktion', 'Tampok'),
(901, 'access_denied', 'Access Denied', 'অ্যাক্সেস অস্বীকৃত', 'تم الرفض', 'Accès refusé', 'पहुंच अस्वीकृत', 'Akses ditolak', 'Accesso negato', 'アクセスが拒否されました', '접근 불가', 'Toegang geweigerd', '', 'ปฏิเสธการเข้าใช้', 'Erişim reddedildi', 'رسائی مسترد کر دی', '拒绝访问', 'Toegang verbied', 'Zugriff abgelehnt', 'Δεν επιτρέπεται η πρόσβαση', 'Acceso denegado', 'प्रवेश अस्वीकृत', 'Доступ закрыт', 'Adgang nægtet', 'Մուտքն արգելված է', 'Წვდომა შეზღუდულია', 'प्रवेश नाकारला', 'Akses dinafikan', 'ਐਕਸੇਸ ਡਿਨਾਇਡ', 'அணுகல் மறுக்கப்பட்டது', 'అనుమతి నిరాకరించడం అయినది', 'Tillträde beviljas ej', 'Walang pahintulot'),
(902, 'time_start', 'Time Start', 'সময় শুরু', 'وقت البدء', 'Heure de début', 'समय प्रारंभ', 'Waktu mulai', 'Time Start', 'タイムスタート', '시간 시작', 'Tijd begint', '', 'เวลาเริ่มต้น', 'Süre başladı', 'ٹائم اسٹارٹ', '时间开始', 'Tyd begin', 'Mal starten', 'Ώρα έναρξης', 'Hora de inicio', 'समय सुरु', 'Время начала', 'Tid start', 'Ժամանակի մեկնարկ', 'დაწყების დრო', 'वेळ प्रारंभ', 'Masa Bermula', 'ਟਾਈਮ ਸਟਾਰਟ', 'நேரம் தொடக்கம்', 'సమయం ప్రారంభం', 'Time Start', 'Simula ng Oras'),
(903, 'time_end', 'Time End', 'সময় শেষ', 'انتهى الوقت', 'Fin de temps', 'समय समाप्त', 'Waktu berakhir', 'Time End', 'タイムエンド', '타임 엔드', 'Eindtijd', '', 'หมดเวลา', 'Zaman Sonu', 'وقت کا اختتام', '时间结束', 'Tyd eindig', 'Zeitende', 'Ώρα λήξης', 'Fin del tiempo', 'समय अन्त्य', 'Конец времени', 'Time End', 'Ժամանակի վերջ', 'დრო დამთავრდება', 'वेळ समाप्त', 'Tamat Masa', 'ਸਮਾਂ ਸਮਾਪਤ', 'நேர முடிவு', 'సమయం ముగింపు', 'Tidsslut', 'Pagtatapos ng Oras'),
(904, 'month_of_salary', 'Month Of Salary', 'বেতন মাস', 'شهر الراتب', 'Mois de salaire', 'वेतन का महीना', 'Bulan Gaji', 'Mese Di Stipendio', '給与月', '월급', 'Maand van salaris', '', 'เดือนของเงินเดือน', 'Maaş Ayı', 'تنخواہ کا مہینہ', '月薪', 'Maand van salaris', 'Monat des Gehalts', 'Μήνας μισθού', 'Mes de salario', 'तलबको महिना', 'Месяц зарплаты', 'Lønmåned', 'Աշխատավարձի ամիս', 'თვე სახელფასო', 'पगाराचा महिना', 'Bulan Gaji', 'ਤਨਖਾਹ ਦਾ ਮਹੀਨਾ', 'சம்பள மாதம்', 'జీతం నెల', 'Lön månad', 'Buwan Ng Salary'),
(905, 'add_documents', 'Add Documents', 'নথি যুক্ত করুন', 'أضف وثائق', 'Ajouter des documents', 'दस्तावेज़ जोड़ें', 'Tambahkan Dokumen', 'Aggiungi documenti', 'ドキュメントを追加', '문서 추가', 'Documenten toevoegen', '', 'เพิ่มเอกสาร', 'Belge Ekle', 'دستاویزات شامل کریں', '新增文件', 'Voeg dokumente by', 'Dokumente hinzufügen', 'Προσθήκη εγγράφων', 'Agregar documentos', 'कागजातहरू थप्नुहोस्', 'Добавить документы', 'Tilføj dokumenter', 'Ավելացնել փաստաթղթեր', 'დაამატეთ დოკუმენტები', 'कागदपत्रे जोडा', 'Tambah Dokumen', 'ਦਸਤਾਵੇਜ਼ ਸ਼ਾਮਲ ਕਰੋ', 'ஆவணங்களைச் சேர்க்கவும்', 'పత్రాలను జోడించండి', 'Lägg till dokument', 'Magdagdag ng Mga Dokumento'),
(906, 'document_type', 'Document Type', 'নথিপত্র ধরণ', 'نوع الوثيقة', 'Document Type', 'दस्तावेज़ का प्रकार', 'tipe dokumen', 'tipo di documento', 'ドキュメントタイプ', '문서 유형', 'type document', '', 'ประเภทเอกสาร', 'Belge Türü', 'دستاویز کی قسم', '文件类型', 'Dokumenttipe', 'Dokumententyp', 'Είδος αρχείου', 'Tipo de Documento', 'कागजात प्रकार', 'тип документа', 'dokument type', 'Փաստաթղթի տեսակը', 'დოკუმენტის ტიპი', 'दस्तऐवज प्रकार', 'jenis dokumen', 'ਦਸਤਾਵੇਜ਼ ਦੀ ਕਿਸਮ', 'ஆவண வகை', 'దస్తావేజు పద్దతి', 'Dokumenttyp', 'Uri ng dokumento'),
(907, 'document', 'Document', 'দলিল', 'المستند', 'Document', 'दस्तावेज़', 'Dokumen', 'Documento', '資料', '문서', 'Document', '', 'เอกสาร', 'belge', 'دستاویز', '文献', 'dokument', 'Dokumentieren', 'Εγγραφο', 'Documento', 'कागजात', 'Документ', 'Dokument', 'Փաստաթուղթ', 'დოკუმენტი', 'कागदपत्र', 'Dokumen', 'ਦਸਤਾਵੇਜ਼', 'ஆவணம்', 'డాక్యుమెంట్', 'Dokumentera', 'Dokumento'),
(908, 'document_title', 'Document Title', 'নথির শিরোনাম', 'عنوان الوثيقة', 'Titre du document', 'दस्तावेज़ का शीर्षक', 'Judul dokumen', 'Titolo del documento', 'ドキュメントのタイトル', '문서 제목', 'Document titel', '', 'ชื่อเอกสาร', 'Belge başlığı', 'دستاویز کا عنوان', '文件名', 'Dokument titel', 'Dokumenttitel', 'Τίτλος εγγράφου', 'Titulo del documento', 'कागजात शीर्षक', 'Заголовок документа', 'Dokumenttitel', 'Փաստաթղթի վերնագիր', 'დოკუმენტის სათაური', 'दस्तऐवज शीर्षक', 'Tajuk dokumen', 'ਦਸਤਾਵੇਜ਼ ਦਾ ਸਿਰਲੇਖ', 'ஆவண தலைப்பு', 'పత్రం శీర్షిక', 'Dokument titel', 'Titulo ng dokumento'),
(909, 'document_category', 'Document Category', 'নথি বিভাগ', 'فئة الوثيقة', 'Catégorie de document', 'दस्तावेज़ श्रेणी', 'Kategori Dokumen', 'Categoria del documento', 'ドキュメントカテゴリ', '문서 카테고리', 'Documentcategorie', '', 'หมวดหมู่เอกสาร', 'Belge Kategorisi', 'دستاویز کی قسم', '文件类别', 'Dokumentkategorie', 'Dokumentkategorie', 'Κατηγορία εγγράφου', 'Categoría de documento', 'कागजात कोटी', 'Категория документа', 'Dokumentkategori', 'Փաստաթղթերի կատեգորիա', 'დოკუმენტების კატეგორია', 'दस्तऐवज श्रेणी', 'Kategori Dokumen', 'ਦਸਤਾਵੇਜ਼ ਸ਼੍ਰੇਣੀ', 'ஆவண வகை', 'పత్రం వర్గం', 'Dokumentkategori', 'Kategorya ng dokumento'),
(910, 'exam_result', 'Exam Result', 'পরীক্ষার ফলাফল', 'نتيجة الإمتحان', 'Résultat d\'éxamen', 'परीक्षा परिणाम', 'Hasil ujian', 'Risultato dell\'esame', '試験の結果', '시험 결과', 'Examenresultaat', '', 'ผลสอบ', 'Sınav sonucu', 'امتحان کا نتیجہ', '考试成绩', 'Eksamenuitslag', 'Prüfungsergebnis', 'Αποτέλεσμα εξετάσεων', 'Resultado del examen', 'परीक्षा परिणाम', 'Результаты экзамена', 'Eksamen Resultat', 'Քննության արդյունքը', 'გამოცდის შედეგი', 'परीक्षेचा निकाल', 'Keputusan Peperiksaan', 'ਪ੍ਰੀਖਿਆ ਦਾ ਨਤੀਜਾ', 'தேர்வு முடிவு', 'పరీక్షా ఫలితం', 'Provresultat', 'Resulta ng pagsusulit'),
(911, 'my_annual_fee_summary', 'My Annual Fee Summary', 'আমার বার্ষিক ফি সংক্ষিপ্তসার', 'ملخص رسومي السنوي', 'Mon résumé des frais annuels', 'मेरा वार्षिक शुल्क सारांश', 'Ringkasan Biaya Tahunan Saya', 'Riepilogo commissioni annuali', '私の年会費概要', '연간 요금 요약', 'Mijn jaarlijkse kostenoverzicht', '', 'สรุปค่าธรรมเนียมรายปีของฉัน', 'Yıllık Ücret Özetim', 'میرا سالانہ فیس کا خلاصہ', '我的年费摘要', 'My jaarlikse fooiopsomming', 'Meine jährliche Gebührenübersicht', 'Περίληψη ετήσιων χρεώσεων', 'Mi resumen anual de tarifas', 'मेरो वार्षिक शुल्क सारांश', 'Мой годовой отчет', 'Min årlige gebyroversigt', 'Իմ տարեկան վճարների ամփոփագիրը', 'ჩემი წლიური გადასახადი', 'माझा वार्षिक फी सारांश', 'Ringkasan Yuran Tahunan Saya', 'ਮੇਰੀ ਸਲਾਨਾ ਫੀਸ ਦਾ ਸਾਰ', 'எனது வருடாந்திர கட்டணச் சுருக்கம்', 'నా వార్షిక రుసుము సారాంశం', 'Min årliga avgiftsöversikt', 'Ang Aking Pangkalahatang Buod ng Bayad'),
(912, 'book_manage', 'Book Manage', 'বই পরিচালনা', 'إدارة الكتاب', 'Book Manage', 'पुस्तक का प्रबंधन', 'Kelola Buku', 'Prenota Gestisci', 'ブック管理', '도서 관리', 'Boek beheren', '', 'จัดการหนังสือ', 'Kitap Yönetimi', 'کتاب کا انتظام', '图书管理', 'Boekbestuur', 'Buch verwalten', 'Διαχείριση βιβλίων', 'Administrar libro', 'पुस्तक प्रबन्धन', 'Управление книгами', 'Bogstyring', 'Գրքի կառավարում', 'წიგნის მართვა', 'पुस्तक व्यवस्थापित करा', 'Urus Buku', 'ਕਿਤਾਬ ਦਾ ਪ੍ਰਬੰਧਨ', 'புத்தக நிர்வகி', 'పుస్తక నిర్వహణ', 'Bokhantera', 'Pamamahala ng Aklat'),
(913, 'add_leave_category', 'Add Leave Category', 'ছাড়ার বিভাগ যুক্ত করুন', 'إضافة فئة إجازة', 'Ajouter une catégorie de congé', 'छुट्टी श्रेणी जोड़ें', 'Tambahkan Kategori Cuti', 'Aggiungi categoria di abbandono', '休暇カテゴリを追加', '휴가 카테고리 추가', 'Voeg verlofcategorie toe', '', 'เพิ่มประเภทการลา', 'Ayrılma Kategorisi Ekle', 'رخصت زمرہ شامل کریں', '添加休假类别', 'Voeg verlofkategorie by', 'Urlaubskategorie hinzufügen', 'Προσθήκη κατηγορίας άδειας', 'Agregar categoría de licencia', 'छोड्ने कोटी थप्नुहोस्', 'Добавить Оставить категорию', 'Tilføj forladelseskategori', 'Ավելացնել արձակուրդային կատեգորիա', 'დაამატე დატოვე კატეგორია', 'सोडा श्रेणी जोडा', 'Tambah Kategori Cuti', 'ਛੁੱਟੀ ਸ਼੍ਰੇਣੀ ਸ਼ਾਮਲ ਕਰੋ', 'விடுப்பு வகையைச் சேர்க்கவும்', 'వర్గాన్ని వదిలివేయండి', 'Lägg till lämna kategori', 'Magdagdag ng Category Category'),
(914, 'edit_leave_category', 'Edit Leave Category', 'বিভাগ ছেড়ে যান', 'تحرير فئة الإجازة', 'Modifier la catégorie de congé', 'अवकाश श्रेणी संपादित करें', 'Edit Kategori Cuti', 'Modifica lascia categoria', '休暇カテゴリの編集', '휴가 카테고리 수정', 'Bewerk verlofcategorie', '', 'แก้ไขประเภทการลา', 'Ayrılma Kategorisini Düzenle', 'کیٹیگری میں ترمیم کریں', '编辑休假类别', 'Wysig verlofkategorie', '', 'Επεξεργασία άδειας κατηγορίας', 'Editar dejar la categoría', 'श्रेणी छोड्नुहोस्', 'Редактировать Оставить категорию', 'Rediger forlad kategori', 'Խմբագրել Թողնել կատեգորիան', 'შეცვალეთ Leave კატეგორია', 'श्रेणी सोडा संपादित करा', 'Edit Kategori Cuti', 'ਸ਼੍ਰੇਣੀ ਸੋਧੋ', 'விடுப்பு வகையைத் திருத்து', 'వర్గాన్ని వదిలివేయండి', 'Redigera Lämna kategori', 'I-edit ang Category Category'),
(915, 'staff_role', 'Staff Role', 'স্টাফ ভূমিকা', 'دور الموظفين', 'Rôle du personnel', 'कर्मचारी भूमिका', 'Peran Staf', 'Ruolo del personale', 'スタッフの役割', '직원의 역할', 'Rol van het personeel', '', 'บทบาทของพนักงาน', 'Personel Rolü', 'اسٹاف کا کردار', '员工角色', 'Personeel Rol', '', 'Ρόλος προσωπικού', 'Rol del personal', 'स्टाफ रोल', 'Роль персонала', 'Personalets rolle', 'Աշխատակազմի դերը', 'პერსონალის როლი', 'कर्मचारी भूमिका', 'Peranan Kakitangan', 'ਸਟਾਫ ਦੀ ਭੂਮਿਕਾ', 'பணியாளர்கள் பங்கு', 'సిబ్బంది పాత్ర', 'Personalroll', 'Staff Role'),
(916, 'edit_assign', 'Edit Assign', 'সম্পাদনা করুন', 'تحرير تعيين', 'Modifier l\'attribution', 'असाइन करें संपादित करें', 'Edit Tugas', 'Modifica assegnazione', '割り当てを編集', '할당 수정', 'Toewijzing bewerken', '', 'แก้ไขการมอบหมาย', 'Atamayı Düzenle', 'تفویض کریں', '编辑分配', 'Wysig toewysing', '', 'Επεξεργασία εκχώρησης', 'Editar asignación', 'सम्पादन गर्नुहोस्', 'Редактировать Назначить', 'Rediger Tildeling', 'Խմբագրել նշանակումը', 'დავალების რედაქტირება', 'संपादित करा', 'Edit Tugaskan', 'ਸੋਧ ਦਿਓ', 'திருத்து ஒதுக்கு', 'కేటాయించండి', 'Redigera tilldelning', 'I-edit ang Takdang-aralin'),
(917, 'view_report', 'View Report', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(918, 'rank_out_of_5', 'Rank Out Of 5', 'র‌্যাঙ্ক আউট 5', 'مرتبة من 5', 'Classement sur 5', '5 में से रैंक', 'Peringkat Keluar Dari 5', 'Rango fuori da 5', 'ランクアウト5', '5 점 만점', 'Positie op 5', '', 'อันดับที่ 5', 'Sıralama 5 üzerinden', '5 میں درجہ بندی', '排名5', 'Rang uit 5', '', 'Κατάταξη 5', 'Rango fuera de 5', 'Of बाहिर श्रेणी', 'Рейтинг из 5', 'Placeret ud af 5', 'Դասակարգեք 5-ից', 'რეიტინგი 5-დან', '5 पैकी क्रमांक', 'Kedudukan Dari 5', '5 ਵਿਚੋਂ ਦਰਜਾ', '5 இல் தரவரிசை', '5 ర్యాంక్', 'Rang av 5', 'Ranggo ng 5'),
(919, 'hall_no', 'Hall No', 'হল নং', 'القاعة رقم', 'Salle No', 'हॉल नं', 'Hall No', 'Sala n', 'ホール番号', '홀 번호', 'Hal nr', '', 'เลขที่ฮอลล์', 'Salon No', 'ہال نمبر', '展馆号', 'Saal No', '', 'Αίθουσα αρ', 'Hall No', 'हल नम्बर', 'Зал №', 'Hall nr', 'Դահլիճ թիվ', 'დარბაზი არა', 'हॉल क्र', 'Dewan No.', 'ਹਾਲ ਨੰ', 'ஹால் எண்', 'హాల్ నం', 'Hall nr', 'Hall Hindi'),
(920, 'no_of_seats', 'No Of Seats', 'নং আসন', 'عدد المقاعد', 'Pas de sièges', 'सीट्स की नहीं', 'Tidak Ada Kursi', 'No Di Posti', '席なし', '좌석 없음', 'Geen zitplaatsen', '', 'ไม่มีที่นั่ง', 'Koltuk Sayısı', 'نشستوں کا نمبر', '座位数', 'Geen sitplekke nie', '', 'Αριθμός καθισμάτων', 'No de asientos', 'सीटहरूको संख्या छैन', 'Нет мест', 'Antal sæder', 'Նստատեղերից ոչ մեկը', 'არა სავარძლები', 'जागा नाही', 'Jumlah Tempat Duduk', 'ਸੀਟਾਂ ਦਾ ਕੋਈ ਨੰਬਰ', 'இருக்கைகள் இல்லை', 'సీట్ల సంఖ్య', 'Antal platser', 'Walang Ng Mga Seats'),
(921, 'mark_distribution', 'Mark Distribution', 'চিহ্ন বিতরণ', 'توزيع مارك', 'Mark Distribution', 'मार्क वितरण', 'Tandai Distribusi', 'Mark Distribution', 'マーク分布', '마크 배포', 'Mark Distribution', '', 'การกระจายมาร์ค', 'Mark Dağıtım', 'نشان تقسیم کریں', '标记分布', 'Merkverspreiding', '', 'Διανομή σήματος', 'Mark Distribution', 'मार्क वितरण', 'Марка Распределение', 'Mark distribution', 'Նշման բաշխում', 'ნიშნის განაწილება', 'चिन्हांकित वितरण', 'Pembahagian Markah', 'ਮਾਰਕ ਡਿਸਟਰੀਬਿ .ਸ਼ਨ', 'மார்க் விநியோகம்', 'మార్క్ పంపిణీ', 'Mark Distribution', 'Pamamahagi ng Markahan'),
(922, 'exam_type', 'Exam Type', 'পরীক্ষার ধরণ', 'نوع الامتحان', 'Type d\'examen', 'परीक्षा का प्रकार', 'Jenis ujian', 'Tipo di esame', '試験の種類', '시험 유형', 'Examentype', '', 'ประเภทการสอบ', 'Sınav Türü', 'امتحان کی قسم', '考试类型', 'Tipe eksamens', 'Prüfungstyp', 'Τύπος εξέτασης', 'Tipo de examen', 'परीक्षा प्रकार', 'Тип экзамена', 'Eksamen Type', 'Քննության տեսակը', 'გამოცდის ტიპი', 'परीक्षेचा प्रकार', 'Jenis Peperiksaan', 'ਪ੍ਰੀਖਿਆ ਦੀ ਕਿਸਮ', 'தேர்வு வகை', 'పరీక్ష రకం', 'Examen Typ', 'Uri ng Pagsusulit'),
(923, 'marks_and_grade', 'Marks And Grade', 'চিহ্ন এবং গ্রেড', 'العلامات والدرجات', 'Marques et grade', 'मार्क्स और ग्रेड', 'Nilai Dan Nilai', 'Segni e grado', 'マークとグレード', '마크와 등급', 'Merken en cijfer', '', 'เครื่องหมายและเกรด', 'İşaretler ve Sınıf', 'مارکس اور گریڈ', '分数和等级', 'Punte en graad', 'Noten und Note', 'Βαθμοί και βαθμοί', 'Marcas y grado', 'मार्क्स र ग्रेड', 'Знаки и класс', 'Mærker og karakter', 'Նշումներ և դասարան', 'ნიშნები და კლასი', 'गुण आणि श्रेणी', 'Markah Dan Gred', 'ਮਾਰਕਸ ਅਤੇ ਗ੍ਰੇਡ', 'மதிப்பெண்கள் மற்றும் தரம்', 'మార్కులు మరియు గ్రేడ్', 'Märken och betyg', 'Mga Marks At Baitang'),
(924, 'min_percentage', 'Min Percentage', 'ন্যূনতম শতাংশ', 'النسبة المئوية', 'Pourcentage minimal', 'न्यूनतम प्रतिशत', 'Persentase Min', 'Percentuale minima', '最小パーセンテージ', '최소 백분율', 'Min percentage', '', 'เปอร์เซ็นต์ขั้นต่ำ', 'Minimum Yüzde', 'کم سے کم فیصد', '最低百分比', 'Min persentasie', 'Min. Prozentsatz', 'Ελάχιστο ποσοστό', 'Porcentaje min.', 'न्यूनतम प्रतिशत', 'Мин. Процент', 'Min procentdel', 'Նվազագույն տոկոսը', 'მინიმალური პროცენტი', 'किमान टक्केवारी', 'Peratus Min', 'ਘੱਟੋ ਘੱਟ ਪ੍ਰਤੀਸ਼ਤ', 'குறைந்தபட்ச சதவீதம்', 'కనిష్ట శాతం', 'Min procent', 'Min Porsyento'),
(925, 'max_percentage', 'Max Percentage', 'সর্বোচ্চ শতাংশ', 'النسبة المئوية القصوى', 'Pourcentage max', 'अधिकतम प्रतिशत', 'Persentase Maks', 'Percentuale massima', '最大パーセンテージ', '최대 백분율', 'Max percentage', '', 'เปอร์เซ็นต์สูงสุด', 'Maksimum Yüzde', 'زیادہ سے زیادہ فیصد', '最高百分比', 'Maksimum persentasie', '', 'Μέγιστο ποσοστό', 'Porcentaje Máx.', 'अधिकतम प्रतिशत', 'Макс. Процент', 'Maks. Procent', 'Առավելագույն տոկոսը', 'მაქსიმალური პროცენტი', 'कमाल टक्केवारी', 'Peratusan Maks', 'ਵੱਧ ਤੋਂ ਵੱਧ ਪ੍ਰਤੀਸ਼ਤ', 'அதிகபட்ச சதவீதம்', 'గరిష్ట శాతం', 'Max Percentage', 'Max Porsyento'),
(926, 'cost_per_bed', 'Cost Per Bed', 'প্রতি বিছানা খরচ', 'تكلفة السرير', 'Coût par lit', 'प्रति बिस्तर लागत', 'Biaya Per Tempat Tidur', 'Costo per letto', 'ベッドあたりのコスト', '침대 당 비용', 'Cost Per Bed', 'Custo por cama', 'ราคาต่อเตียง', 'Yatak Başına Maliyet', 'قیمت فی بستر', '每床费用', 'Koste per bed', 'Kosten pro Bett', 'Κόστος ανά κρεβάτι', 'Costo por cama', 'मूल्य प्रति ओछ्यान', 'Стоимость за кровать', 'Pris pr. Seng', 'Արժեք մեկ մահճակալի համար', 'ღირებულება თითო საწოლზე', 'दर बेड', 'Kos Setiap Katil', 'ਪ੍ਰਤੀ ਬੈੱਡ ਦੀ ਕੀਮਤ', 'ஒரு படுக்கைக்கு செலவு', 'ప్రతి మంచానికి ఖర్చు', 'Kostnad per säng', 'Gastos sa kama'),
(927, 'add_category', 'Add Category', 'বিভাগ যুক্ত করুন', 'إضافة فئة', 'ajouter une catégorie', 'कैटेगरी जोड़े', 'Tambahkan kategori', 'Aggiungi categoria', 'カテゴリを追加', '카테고리 추가', 'categorie toevoegen', 'Adicionar categoria', 'เพิ่มหมวดหมู่', 'Kategori ekle', 'زمرہ شامل کریں', '添加类别', 'Voeg kategorie by', 'Kategorie hinzufügen', 'Προσθήκη κατηγορίας', 'añadir categoría', 'कोटी थप्नुहोस्', 'Добавить категорию', 'Tilføj kategori', 'Ավելացնել կատեգորիա', 'კატეგორიის დამატება', 'श्रेणी जोडा', 'Tambah Kategori', 'ਸ਼੍ਰੇਣੀ ਸ਼ਾਮਲ ਕਰੋ', 'வகையைச் சேர்க்கவும்', 'వర్గాన్ని జోడించండి', 'Lägg till Kategori', 'Magdagdag ng kategorya'),
(928, 'category_for', 'Category For', 'বিভাগের জন্য', 'التصنيف لـ', 'Catégorie Pour', 'श्रेणी के लिए', 'Kategori Untuk', 'Categoria per', 'カテゴリー', '카테고리', 'Categorie voor', 'Categoria para', 'ประเภทสำหรับ', 'Kategori İçin', 'زمرہ برائے', '类别', 'Kategorie vir', 'Kategorie für', 'Κατηγορία για', 'Categoría para', 'को लागी कोटी', 'Категория Для', 'Kategori for', 'Կարգավիճակ', 'კატეგორია', 'श्रेणीसाठी', 'Kategori Untuk', 'ਸ਼੍ਰੇਣੀ ਲਈ', 'வகை', 'కోసం వర్గం', 'Kategori för', 'Kategorya Para sa'),
(929, 'start_place', 'Start Place', 'স্টার্ট প্লেস', 'ابدأ مكان', 'Start Place', 'प्रारंभ स्थान', 'Mulai Tempat', 'Inizia il posto', '開始場所', '출발지', 'Start plaats', 'Start Place', 'เริ่มที่', 'Başlangıç ​​Yeri', 'اسٹارٹ پلیس', '开始地点', 'Begin plek', 'Startplatz', 'Ξεκινήστε το μέρος', 'Lugar de inicio', 'ठाउँ सुरू गर्नुहोस्', 'Начальное место', 'Start sted', 'Սկսել Տեղ', 'დაწყების ადგილი', 'प्रारंभ ठिकाण', 'Tempat Mula', 'ਸਟਾਰਟ ਪਲੇਸ', 'தொடக்க இடம்', 'స్థలాన్ని ప్రారంభించండి', 'Starta plats', 'Simulan ang Lugar'),
(930, 'stop_place', 'Stop Place', 'স্টপ প্লেস', 'مكان التوقف', 'Stop Place', 'जगह बंद करो', 'Stop Place', 'Stop Place', 'ストッププレイス', '장소 중지', 'Stopplaats', 'Stop Place', 'หยุดสถานที่', 'Bitiş Yeri', 'سٹاپ پلیس', '停止地点', 'Stop plek', 'Stop Place', 'Σταματήστε το μέρος', 'Lugar de parada', 'ठाउँ रोक्नुहोस्', 'Стоп Плейс', 'Stop sted', 'Կանգնեք Տեղ', 'გაჩერების ადგილი', 'थांबा ठिकाण', 'Tempat Berhenti', 'ਸਟਾਪ ਪਲੇਸ', 'இடத்தை நிறுத்து', 'స్థలం ఆపు', 'Stoppplats', 'Itigil ang Lugar'),
(931, 'vehicle', 'Vehicle', 'বাহন', 'مركبة', 'Véhicule', 'वाहन', 'Kendaraan', 'Veicolo', '車両', '차량', 'Voertuig', 'Veículo', 'พาหนะ', 'araç', 'گاڑی', '车辆', 'voertuig', 'Fahrzeug', 'Οχημα', 'Vehículo', 'सवारी', 'Транспортное средство', 'Køretøj', 'Փոխադրամիջոց', 'მანქანა', 'वाहन', 'Kenderaan', 'ਵਾਹਨ', 'வாகனம்', 'వాహనం', 'Fordon', 'Sasakyan'),
(932, 'select_multiple_vehicle', 'Select Multiple Vehicle', 'একাধিক যান নির্বাচন করুন', 'حدد مركبة متعددة', 'Sélectionnez plusieurs véhicules', 'एकाधिक वाहन का चयन करें', 'Pilih Banyak Kendaraan', 'Seleziona Veicolo multiplo', '複数の車両を選択', '여러 차량 선택', 'Selecteer Meerdere voertuigen', 'Selecionar veículo múltiplo', 'เลือกรถหลายคัน', 'Birden Çok Araç Seçin', 'ایک سے زیادہ گاڑیوں کا انتخاب کریں', '选择多辆车', 'Kies meervoudige voertuie', 'Wählen Sie Mehrere Fahrzeuge', 'Επιλέξτε Πολλαπλό όχημα', 'Seleccionar vehículo múltiple', 'बहु वाहन चयन गर्नुहोस्', 'Выберите несколько транспортных средств', 'Vælg flere køretøjer', 'Ընտրեք բազմակի մեքենա', 'აირჩიეთ მრავალჯერადი მანქანა', 'एकाधिक वाहन निवडा', 'Pilih Kenderaan Pelbagai', 'ਬਹੁ ਵਾਹਨ ਦੀ ਚੋਣ ਕਰੋ', 'பல வாகனத்தைத் தேர்ந்தெடுக்கவும்', 'బహుళ వాహనాన్ని ఎంచుకోండి', 'Välj flera fordon', 'Piliin ang Maramihang Sasakyan'),
(933, 'book_details', 'Book Details', 'বইয়ের বিবরণ', 'تفاصيل الكتاب', 'Détails du livre', 'पुस्तक विवरण', 'Detail Buku', 'Dettagli del libro', '本の詳細', '도서 세부 사항', 'Boek Details', 'Detalhes do livro', 'รายละเอียดหนังสือ', 'Kitap Ayrıntıları', 'کتاب کی تفصیلات', '书籍详细资料', 'Boekbesonderhede', 'Buchdetails', 'Λεπτομέρειες βιβλίου', 'Detalles del libro', 'पुस्तक विवरण', 'Детали книги', 'Bogdetaljer', 'Գրքի մանրամասները', 'წიგნის დეტალები', 'पुस्तक तपशील', 'Butiran Buku', 'ਕਿਤਾਬ ਦੇ ਵੇਰਵੇ', 'புத்தக விவரங்கள்', 'పుస్తక వివరాలు', 'Bokdetaljer', 'Mga Detalye ng Aklat'),
(934, 'issued_by', 'Issued By', 'প্রদান করেছেন', 'أصدرت من قبل', 'Délivré par', 'जारीकर्ता', 'Dikeluarkan oleh', 'Rilasciato da', 'が発行', '발행자', 'Uitgegeven door', 'Publicado por', 'ออกโดย', 'Veren kuruluş', 'کے ذریعہ جاری کیا گیا', '由...发出', 'Uitgereik deur', 'Ausgestellt durch', 'Εκδόθηκε από', 'Emitido por', 'जारी गर्ने; प्रकासित गर्ने; प्रकासक', 'Выдан', 'Udstedt af', 'Թողարկվել է', 'Მიერ გაცემული', 'द्वारा जारी', 'Dikeluarkan oleh', 'ਵੱਲੋਂ ਜਾਰੀ ਕੀਤਾ ਗਿਆ', 'வழங்கியது', 'జారీ చేసింది', 'Utfärdats av', 'Inilabas Ni'),
(935, 'return_by', 'Return By', 'ফিরে আসুন', 'العودة بواسطة', 'Retour par', 'वापसी करके', 'Kembali dengan', 'Ritorna entro', '返却', '반납', 'Return By', 'Retorno por', 'ส่งคืนโดย', 'Gönderen', 'واپس لوٹ کر', '返回依据', 'Terug deur', 'Zurück durch', 'Επιστροφή από', 'Volver por', 'द्वारा फिर्ता', 'Вернуться к', 'Vend tilbage af', 'Վերադառնալ', 'დაბრუნდით', 'परत या', 'Kembali Oleh', 'ਦੁਆਰਾ ਵਾਪਸ', 'மூலம் திரும்பவும்', 'ద్వారా తిరిగి', 'Återvänd av', 'Bumalik Ni'),
(936, 'group', 'Group', 'গ্রুপ', 'مجموعة', 'Groupe', 'समूह', 'Kelompok', 'Gruppo', 'グループ', '그룹', 'Groep', 'Grupo', 'กลุ่ม', 'grup', 'گروپ', '组', 'groep', 'Gruppe', 'Ομάδα', 'Grupo', 'समूह', 'группа', 'Gruppe', 'Խումբ', 'ჯგუფი', 'गट', 'Kumpulan', 'ਸਮੂਹ', 'குழு', 'గ్రూప్', 'Grupp', 'Pangkat'),
(937, 'individual', 'Individual', 'স্বতন্ত্র', 'فرد', 'Individuel', 'व्यक्ति', 'Individu', 'Individuale', '個人', '개인', 'Individueel', 'Individual', 'รายบุคคล', 'bireysel', 'انفرادی', '个人', 'individuele', 'Individuell', 'Ατομο', 'Individual', 'व्यक्तिगत', 'Физическое лицо', 'Individuel', 'Անհատական', 'Ინდივიდუალური', 'वैयक्तिक', 'Individu', 'ਵਿਅਕਤੀਗਤ', 'தனிப்பட்ட', 'వ్యక్తిగత', 'Enskild', 'Indibidwal'),
(938, 'recipients', 'Recipients', 'প্রাপক', 'المستلمون', 'Destinataires', 'प्राप्तकर्ता', 'Penerima', 'destinatari', '受取人', '받는 사람', 'Ontvangers', 'Destinatários', 'ผู้รับ', 'Alıcılar', 'وصول کنندگان', '收件者', 'ontvangers', 'Empfänger', 'Παραλήπτες', 'Destinatarios', 'प्राप्तकर्ताहरू', 'Получатели', 'Modtagere', 'Ստացողներ', 'მიმღები', 'प्राप्तकर्ते', 'Penerima', 'ਪ੍ਰਾਪਤ ਕਰਨ ਵਾਲੇ', 'பெறுநர்கள்', 'గ్రహీతలు', 'mottagare', 'Mga tatanggap'),
(939, 'group_name', 'Group Name', 'দলের নাম', 'أسم المجموعة', 'Nom de groupe', 'समूह का नाम', 'Nama grup', 'Nome del gruppo', 'グループ名', '그룹 이름', 'Groepsnaam', 'Nome do grupo', 'ชื่อกลุ่ม', 'Grup ismi', 'گروہ کا نام', '组的名字', 'Groepnaam', 'Gruppenname', 'Ονομα ομάδας', 'Nombre del grupo', 'समूहको नाम', 'Имя группы', 'Gruppe navn', 'Խմբի անուն', 'Ჯგუფის სახელი', 'गटाचे नाव', 'Nama kumpulan', 'ਸਮੂਹ ਦਾ ਨਾਮ', 'குழு பெயர்', 'సముహం పేరు', 'Grupp namn', 'Pangalan ng grupo'),
(940, 'fee_code', 'Fee Code', 'ফি কোড', 'كود الرسوم', 'Fee Code', 'फीस कोड', 'Kode Biaya', 'Codice tariffa', '料金コード', '수수료 코드', 'Kostencode', 'Código da taxa', 'รหัสค่าธรรมเนียม', 'Ücret Kodu', 'فیس کوڈ', '费用代码', 'Fooi-kode', 'Gebührencode', 'Κωδικός χρέωσης', 'Código de tarifa', 'शुल्क कोड', 'Код оплаты', 'Gebyrkode', 'Վճարների ծածկագիր', 'საფასურის კოდი', 'फी कोड', 'Kod Yuran', 'ਫੀਸ ਕੋਡ', 'கட்டணக் குறியீடு', 'ఫీజు కోడ్', 'Avgiftskod', 'Code ng Bayad'),
(941, 'fine_type', 'Fine Type', 'ফাইন টাইপ', 'نوع جيد', 'Type fin', 'ठीक प्रकार', 'Tipe Baik', 'Tipo fine', 'ファインタイプ', '파인 타입', 'Fijn type', 'Tipo Fino', 'ประเภทดี', 'İnce Tip', 'جرمانہ کی قسم', '精细型', 'Fyn tipe', 'Feiner Typ', 'Πρόστιμο τύπο', 'Tipo fino', 'राम्रो प्रकार', 'Прекрасный тип', 'Fin type', 'Նուրբ տեսակը', 'სახვითი ტიპი', 'ललित प्रकार', 'Jenis Baik', 'ਵਧੀਆ ਕਿਸਮ', 'சிறந்த வகை', 'ఫైన్ టైప్', 'Fin typ', 'Uri ng Fine'),
(942, 'fine_value', 'Fine Value', 'সূক্ষ্ম মান', 'قيمة جيدة', 'Fine Value', 'ठीक मूल्य', 'Nilai Baik', 'Ottimo valore', 'ファインバリュー', '훌륭한 가치', 'Fijne waarde', 'Valor Fino', 'ค่าที่ดี', 'İnce Değer', 'ٹھیک قیمت', '优良的价值', 'Fyn waarde', 'Feiner Wert', 'Πρόστιμη αξία', 'Valor fino', 'राम्रो मूल्य', 'Прекрасное значение', 'Fin værdi', 'Լավ արժեք', 'შესანიშნავი ღირებულება', 'उत्तम मूल्य', 'Nilai Baik', 'ਵਧੀਆ ਮੁੱਲ', 'சிறந்த மதிப்பு', 'చక్కటి విలువ', 'Fint värde', 'Mahusay na Halaga'),
(943, 'late_fee_frequency', 'Late Fee Frequency', 'দেরিতে ফি ফ্রিকোয়েন্সি', 'تردد الرسوم المتأخرة', 'Fréquence des frais de retard', 'लेट फीस फ्रीक्वेंसी', 'Frekuensi Biaya Terlambat', 'Frequenza delle commissioni in ritardo', '延滞料の頻度', '늦은 수수료 빈도', 'Frequentie van late vergoedingen', 'Frequência de taxas atrasadas', 'ความถี่ค่าธรรมเนียมล่าช้า', 'Gecikme Ücreti Sıklığı', 'دیر سے فیس تعدد', '滞纳金频率', 'Laatfooi-frekwensie', 'Späte Gebührenhäufigkeit', 'Συχνότητα καθυστερημένων τελών', 'Frecuencia de pago tardío', 'ढिलो शुल्क फ्रिक्वेन्सी', 'Частота позднего сбора', 'Sidste gebyrfrekvens', 'Ուշ վճարների հաճախականություն', 'გვიან მოსაკრებლის სიხშირე', 'उशीरा फी वारंवारता', 'Kekerapan Bayaran Lewat', 'ਦੇਰ ਨਾਲ ਆਉਣ ਵਾਲੀ ਫੀਸ', 'தாமத கட்டணம் அதிர்வெண்', 'ఆలస్య రుసుము ఫ్రీక్వెన్సీ', 'Sen avgiftsfrekvens', 'Karaniwang Kadalasan sa Bayad'),
(944, 'fixed_amount', 'Fixed Amount', 'নির্দিষ্ট পরিমাণ', 'مبلغ ثابت', 'Montant fixé', 'निर्धारित रकम', 'Jumlah Tetap', 'Importo fisso', '定額', '정액', 'Vaste hoeveelheid', 'Quantia fixa', 'จำนวนเงินคงที่', 'Sabit miktar', 'مقررہ رقم', '固定值', 'Vaste bedrag', 'Fester Betrag', 'Προκαθορισμένο ποσό', 'Cantidad fija', 'स्थिर रकम', 'Фиксированное количество', 'Fast beløb', 'Հաստատուն գումար', 'ფიქსირებული თანხა', 'निश्चित रक्कम', 'Amaun Tetap', 'ਫਿਕਸਡ ਰਕਮ', 'நிர்ணயிக்கப்பட்ட தொகை', 'స్థిర మొత్తం', 'Bestämd mängd', 'Nakapirming Halaga'),
(945, 'fixed', 'Fixed', 'ফিক্সড', 'ثابت', 'Fixé', 'फिक्स्ड', 'Tetap', 'Fisso', '修繕', '결정된', 'Gemaakt', 'Fixo', 'แก้ไขแล้ว', 'Sabit', 'طے شدہ', '固定', 'vaste', 'Fest', 'Σταθερός', 'Fijo', 'फिक्स्ड', 'Исправлена', 'Fixed', 'Ամրագրված է', 'ფიქსირდება', 'निश्चित', 'Memperbaiki', 'ਫਿਕਸਡ', 'சரி செய்யப்பட்டது', 'స్థిర', 'Fast', 'Nakapirming'),
(946, 'daily', 'Daily', 'দৈনন্দিন', 'اليومي', 'du quotidien', 'रोज', 'Harian', 'Quotidiano', '毎日', '매일', 'Dagelijks', 'Diariamente', 'ประจำวัน', 'Günlük', 'روزانہ', '日常', 'daaglikse', 'Täglich', 'Καθημερινά', 'Diario', 'दैनिक', 'Ежедневно', 'Daglige', 'Ամեն օր', 'ყოველდღიურად', 'दररोज', 'Setiap hari', 'ਰੋਜ਼ਾਨਾ', 'தினசரி', 'డైలీ', 'Dagligen', 'Araw-araw'),
(947, 'weekly', 'Weekly', 'সাপ্তাহিক', 'أسبوعي', 'Hebdomadaire', 'साप्ताहिक', 'Mingguan', 'settimanalmente', '毎週', '주간', 'Wekelijks', 'Semanal', 'รายสัปดาห์', 'Haftalık', 'ہفتہ وار', '每周', 'weeklikse', 'Wöchentlich', 'Εβδομαδιαίος', 'Semanal', 'साप्ताहिक', 'еженедельно', 'Ugentlig', 'Շաբաթական', 'ყოველკვირეულად', 'साप्ताहिक', 'Setiap minggu', 'ਹਫਤਾਵਾਰੀ', 'வாராந்திர', 'వీక్లీ', 'Varje vecka', 'Lingguhan'),
(948, 'monthly', 'Monthly', 'মাসিক', 'شهريا', 'Mensuel', 'महीने के', 'Bulanan', 'Mensile', '毎月', '월간 간행물', 'Maandelijks', 'Por mês', 'รายเดือน', 'Aylık', 'ماہانہ', '每月一次', 'maandelikse', 'Monatlich', 'Μηνιαίο', 'Mensual', 'मासिक', 'ежемесячно', 'Månedlige', 'Ամսական', 'ყოველთვიურად', 'मासिक', 'Bulanan', 'ਮਾਸਿਕ', 'மாதாந்திர', 'మంత్లీ', 'En gång i månaden', 'Buwanang'),
(949, 'annually', 'Annually', 'সালিয়ানা', 'سنويا', 'Annuellement', 'हर साल', 'Setiap tahun', 'Annualmente', '毎年', '매년', 'jaarlijks', 'Anualmente', 'เป็นประจำทุกปี', 'yıllık', 'سالانہ', '每年', 'jaarliks', 'Jährlich', 'Ετησίως', 'Anualmente', 'बार्षिक', 'ежегодно', 'Årligt', 'Տարեկան', 'ყოველწლიურად', 'वार्षिक', 'Setiap tahun', 'ਸਲਾਨਾ', 'ஆண்டுதோறும்', 'వార్షికంగా', 'Årligen', 'Taun-taon'),
(950, 'first_select_the_group', 'First Select The Group', 'প্রথমে গ্রুপটি নির্বাচন করুন', 'أولا حدد المجموعة', 'Sélectionnez d\'abord le groupe', 'पहले समूह का चयन करें', 'Pertama Pilih Grup', 'Prima seleziona il gruppo', '最初にグループを選択', '먼저 그룹을 선택하십시오', 'Selecteer eerst de groep', 'Primeiro selecione o grupo', 'ก่อนอื่นเลือกกลุ่ม', 'Önce Grubu Seçin', 'پہلے گروپ کو منتخب کریں', '首先选择组', 'Kies eers die groep', 'Wählen Sie zuerst die Gruppe aus', 'Πρώτα επιλέξτε την ομάδα', 'Primero seleccione el grupo', 'पहिले समूह चयन गर्नुहोस्', 'Сначала выберите группу', 'Vælg først gruppen', 'Նախ ընտրեք խումբը', 'პირველი აირჩიეთ ჯგუფი', 'प्रथम गट निवडा', 'Pertama Pilih Kumpulan', 'ਪਹਿਲਾਂ ਸਮੂਹ ਚੁਣੋ', 'முதலில் குழுவைத் தேர்ந்தெடுக்கவும்', 'మొదట సమూహాన్ని ఎంచుకోండి', 'Välj först gruppen', 'Una Piliin ang Grupo'),
(951, 'percentage', 'Percentage', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'persentasie', 'Prozentsatz', 'Ποσοστό', 'Porcentaje', 'प्रतिशत', 'процент', 'Procent', 'Տոկոս', 'პროცენტი', 'टक्केवारी', 'Peratusan', 'ਪ੍ਰਤੀਸ਼ਤ', 'சதவிதம்', 'శాతం', 'Procentsats', 'Porsyento'),
(952, 'value', 'Value', 'মান', 'القيمة', 'Valeur', 'मूल्य', 'Nilai', 'Valore', '値', '값', 'Waarde', 'Valor', 'ราคา', 'değer', 'قدر', '值', 'waarde', 'Wert', 'αξία', 'Valor', 'मान', 'Ценность', 'Værdi', 'Արժեք', 'ღირებულება', 'मूल्य', 'Nilai', 'ਮੁੱਲ', 'மதிப்பு', 'విలువ', 'Värde', 'Halaga'),
(953, 'fee_group', 'Fee Group', 'ফি গ্রুপ', 'مجموعة الرسوم', 'Groupe de frais', 'शुल्क समूह', 'Kelompok Biaya', 'Gruppo di commissioni', '料金グループ', '요금 그룹', 'Kostengroep', 'Grupo de taxas', 'กลุ่มค่าธรรมเนียม', 'Ücret Grubu', 'فیس گروپ', '费用组', 'Fooi-groep', 'Gebührengruppe', 'Ομάδα αμοιβών', 'Grupo de tarifas', 'शुल्क समूह', 'Комиссия группы', 'Gebyrgruppe', 'Վճարների խումբ', 'საფასურის ჯგუფი', 'फी गट', 'Kumpulan Yuran', 'ਫੀਸ ਸਮੂਹ', 'கட்டணக் குழு', 'ఫీజు గ్రూప్', 'Avgiftsgrupp', 'Grupo ng Bayad'),
(954, 'due_invoice', 'Due Invoice', 'ইনভয়েস', 'فاتورة مستحقة', 'Facture due', 'कारण चालान', 'Faktur jatuh tempo', 'Fattura dovuta', '未払いの請求書', '인보이스', 'Te betalen factuur', 'Fatura vencida', 'ใบแจ้งหนี้เนื่องจาก', 'Vadesi Gelen Fatura', 'انوائس کی وجہ سے', '到期发票', 'Behoorlike faktuur', 'Fällige Rechnung', 'Προθεσμιακό τιμολόγιο', 'Factura vencida', 'बाँकी इनभ्वाइस', 'Счет-фактура', 'Forfalden faktura', 'Ժամանակին հաշիվ-ապրանքագիր', 'ინვოისი', 'देय चलन', 'Invois Belum Selesai', 'ਬਕਾਇਆ ਚਲਾਨ', 'உரிய விலைப்பட்டியல்', 'డ్యూ ఇన్వాయిస్', 'Skyldig faktura', 'Dahil sa Invoice'),
(955, 'reminder', 'Reminder', 'অনুস্মারক', 'تذكير', 'Rappel', 'अनुस्मारक', 'Peringatan', 'Promemoria', 'リマインダー', '조언', 'Herinnering', 'Lembrete', 'การแจ้งเตือน', 'Hatırlatma', 'یاد دہانی', '提醒', 'herinnering', 'Erinnerung', 'Υπενθύμιση', 'Recordatorio', 'अनुस्मारक', 'напоминание', 'Påmindelse', 'Հիշեցում', 'შეხსენება', 'स्मरणपत्र', 'Peringatan', 'ਰੀਮਾਈਂਡਰ', 'நினைவூட்டல்', 'రిమైండర్', 'Påminnelse', 'Paalala'),
(956, 'frequency', 'Frequency', 'ফ্রিকোয়েন্সি', 'تكرر', 'La fréquence', 'आवृत्ति', 'Frekuensi', 'Frequenza', '周波数', '회수', 'Frequentie', 'Frequência', 'ความถี่', 'Sıklık', 'تعدد', '频率', 'Frekwensie', 'Frequenz', 'Συχνότητα', 'Frecuencia', 'फ्रिक्वेन्सी', 'частота', 'Frekvens', 'Հաճախականությունը', 'სიხშირე', 'वारंवारता', 'Kekerapan', 'ਬਾਰੰਬਾਰਤਾ', 'அதிர்வெண்', 'తరచుదనం', 'Frekvens', 'Dalas'),
(957, 'notify', 'Notify', 'অবহিত', 'أبلغ', 'Notifier', 'सूचित करें', 'Memberitahukan', 'Notificare', '通知する', '통지', 'Melden', 'Notificar', 'แจ้ง', 'bildirmek', 'مطلع', '通知', 'Stel', 'Benachrichtigen', 'Κοινοποιώ', 'Notificar', 'सूचित गर्नुहोस्', 'Уведомлять', 'Underrette', 'Տեղեկացնել', 'შეატყობინე', 'सूचित करा', 'Maklumkan', 'ਨੂੰ ਸੂਚਿਤ ਕਰੋ', 'அறிவிக்கவும்', 'తెలియజేయి', 'Meddela', 'Ipaalam'),
(958, 'before', 'Before', 'আগে', 'قبل', 'Avant', 'इससे पहले', 'Sebelum', 'Prima', '前', '전에', 'Voordat', 'Antes', 'ก่อน', 'Önce', 'پہلے', '之前', 'voordat', 'Vor', 'Πριν', 'antes de', 'पहिले', 'Перед', 'Før', 'Նախքան', 'ადრე', 'आधी', 'Sebelum', 'ਪਹਿਲਾਂ', 'முன்', 'ముందు', 'Innan', 'Bago'),
(959, 'after', 'After', 'পরে', 'بعد', 'Après', 'उपरांत', 'Setelah', 'Dopo', '後', '후', 'Na', 'Depois de', 'หลังจาก', 'Sonra', 'کے بعد', '后', 'na', 'Nach', 'Μετά', 'Después', 'पछि', 'После', 'Efter', 'Հետո', 'მას შემდეგ', 'नंतर', 'Selepas', 'ਦੇ ਬਾਅਦ', 'பிறகு', 'తరువాత', 'Efter', 'Pagkatapos'),
(960, 'number', 'Number', 'সংখ্যা', 'رقم', 'Nombre', 'संख्या', 'Jumlah', 'Numero', '数', '번호', 'Aantal', 'Número', 'จำนวน', 'Numara', 'نمبر', '数', 'aantal', 'Nummer', 'Αριθμός', 'Número', 'संख्या', 'Число', 'Nummer', 'Թիվ', 'რიცხვი', 'संख्या', 'Nombor', 'ਗਿਣਤੀ', 'எண்', 'సంఖ్య', 'siffra', 'Bilang');
INSERT INTO `languages` (`id`, `word`, `english`, `bengali`, `arabic`, `french`, `hindi`, `indonesian`, `italian`, `japanese`, `korean`, `dutch`, `portuguese`, `thai`, `turkish`, `urdu`, `chinese`, `afrikaans`, `german`, `greek`, `spanish`, `nepali`, `russian`, `danish`, `armenian`, `georgian`, `marathi`, `malay`, `punjabi`, `tamil`, `telugu`, `swedish`, `filipino`) VALUES
(961, 'ref_no', 'Ref No', 'সুত্র নেই', 'مصدر رقم', 'Réf No', 'संदर्भ संख्या', 'Nomor referensi', 'Ref no', '参照番号', '참조 번호', 'Ref nr', 'Nº de referência', 'เลขที่อ้างอิง', 'Ref No', 'ریف نمبر', '参考编号', 'Verw No', 'Referenznummer', 'Αναφορά αριθ', 'Número de referencia', 'रेफ्रे नम्बर', 'Ref №', 'Ref nr', 'Ref ոչ', 'Ref არა', 'संदर्भ क्रमांक', 'Nombor rujukan', 'ਹਵਾਲਾ ਨੰ', 'Ref எண்', 'సూచిక క్రమాంకము', 'Ref nr', 'Ref Hindi'),
(962, 'pay_via', 'Pay Via', 'ভায়া দিয়ে', 'ادفع عن طريق', 'Payez via', 'भुगतान करें', 'Bayar Via', 'Pay Via', '経由で支払う', '통해 지불', 'Pay Via', 'Pay Via', 'ชำระเงินผ่าน', 'Ödeme Yöntemi', 'ویا کے ذریعہ', '通过付款', 'Betaal via', 'Zahlen Sie über', 'Πληρώστε μέσω', 'Pagar vía', 'भुक्तान मार्फत', 'Оплатить через', 'Betal via', 'Վճարիր միջոցով', 'გადაიხადე ვია', 'पे मार्गे', 'Bayar Melalui', 'ਭੁਗਤਾਨ ਦੁਆਰਾ', 'வழியாக செலுத்தவும்', 'ద్వారా చెల్లించండి', 'Betala via', 'Magbayad Via'),
(963, 'ref', 'Ref', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(964, 'dr', 'Dr', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(965, 'cr', 'Cr', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(966, 'edit_book', 'Edit Book', 'সম্পাদনা বই', 'تحرير كتاب', 'Modifier le livre', 'पुस्तक संपादित करें', 'Edit Buku', 'Modifica libro', '本を編集', '책 편집', 'Boek bewerken', 'Editar livro', 'แก้ไขหนังสือ', 'Kitabı Düzenle', 'کتاب میں ترمیم کریں', '编辑书', 'Redigeer boek', 'Buch bearbeiten', 'Επεξεργασία βιβλίου', 'Editar libro', 'पुस्तक सम्पादन गर्नुहोस्', 'Редактировать книгу', 'Rediger bog', 'Խմբագրել գիրքը', 'წიგნის რედაქტირება', 'पुस्तक संपादित करा', 'Edit Buku', 'ਕਿਤਾਬ ਸੋਧੋ', 'புத்தகத்தைத் திருத்து', 'పుస్తకాన్ని సవరించండి', 'Redigera bok', 'I-edit ang Aklat'),
(967, 'leaves', 'Leaves', 'পত্রাদি', 'اوراق اشجار', 'Feuilles', 'पत्ते', 'Daun-daun', 'Le foglie', '葉', '이파리', 'Bladeren', 'Folhas', 'ใบไม้', 'Yapraklar', 'پتے', '树叶', 'blare', 'Blätter', 'Φύλλα', 'Hojas', 'पातहरू', 'Листья', 'Blade', 'Թողնում է', 'ტოვებს', 'पाने', 'Daun', 'ਪੱਤੇ', 'இலைகள்', 'ఆకులు', 'Löv', 'Mga dahon'),
(968, 'leave_request', 'Leave Request', 'অনুরোধ ত্যাগ করুন', 'طلب إجازة', 'Demande de congé', 'छुट्टी का अनुरोध', 'Tinggalkan Permintaan', 'Lascia una richiesta', '休暇願', '요청을 남겨주세요', 'Verzoek indienen', 'Deixar pedido', 'ใบลา', 'Ayrılma İsteği', 'درخواست چھوڑ دیں', '休假申请', 'Verlaat versoek', 'Anfrage hinterlassen', 'Αίτημα αποχώρησης', 'Dejar petición', 'अनुरोध छोड्नुहोस्', 'Оставьте запрос', 'Forlad anmodning', 'Թողեք հայցը', 'დატოვე მოთხოვნა', 'विनंती सोडा', 'Tinggalkan Permintaan', 'ਬੇਨਤੀ ਛੱਡੋ', 'கோரிக்கை விடுங்கள்', 'అభ్యర్థనను వదిలివేయండి', 'Lämna förfrågan', 'Mag-iwan ng Kahilingan'),
(969, 'this_file_type_is_not_allowed', 'This File Type Is Not Allowed', 'এই ফাইল টাইপ অনুমোদিত নয়', 'نوع الملف هذا غير مسموح به', 'Ce type de fichier n\'est pas autorisé', 'यह फ़ाइल प्रकार अनुमति नहीं है', 'Jenis File Ini Tidak Diizinkan', 'Questo tipo di file non è consentito', 'このファイルタイプは許可されていません', '이 파일 형식은 허용되지 않습니다', 'Dit bestandstype is niet toegestaan', 'Este tipo de arquivo não é permitido', 'ไม่อนุญาตให้ใช้ไฟล์ประเภทนี้', 'Bu Dosya Türüne İzin Verilmiyor', 'اس فائل کی قسم کی اجازت نہیں ہے', '不允许此文件类型', 'Hierdie lêertipe word nie toegelaat nie', 'Dieser Dateityp ist nicht zulässig', 'Αυτός ο τύπος αρχείου δεν επιτρέπεται', 'Este tipo de archivo no está permitido', 'यो फाईल प्रकारलाई अनुमति छैन', 'Этот тип файла не разрешен', 'Denne filtype er ikke tilladt', 'Այս ֆայլի տեսակը թույլատրված չէ', 'ამ ფაილის ტიპი დაუშვებელია', 'या फाईल प्रकारास परवानगी नाही', 'Jenis Fail Ini Tidak Dibolehkan', 'ਇਸ ਫਾਈਲ ਕਿਸਮ ਦੀ ਇਜ਼ਾਜ਼ਤ ਨਹੀਂ ਹੈ', 'இந்த கோப்பு வகை அனுமதிக்கப்படவில்லை', 'ఈ ఫైల్ రకం అనుమతించబడదు', 'Denna filtyp är inte tillåten', 'Hindi Pinahintulutan ang Uri ng File na ito'),
(970, 'error_reading_the_file', 'Error Reading The File', 'ফাইলটি পড়ার সময় ত্রুটি', 'خطأ في قراءة الملف', 'Erreur de lecture du fichier', 'फ़ाइल पढ़ने में त्रुटि', 'Kesalahan Membaca File', 'Errore durante la lettura del file', 'ファイルの読み取りエラー', '파일 읽기 오류', 'Fout bij het lezen van het bestand', 'Erro ao ler o arquivo', 'เกิดข้อผิดพลาดในการอ่านไฟล์', 'Dosya Okuma Hatası', 'فائل پڑھنے میں خامی', '读取文件时出错', 'Kon nie die lêer lees nie', 'Fehler beim Lesen der Datei', 'Σφάλμα κατά την ανάγνωση του αρχείου', 'Error al leer el archivo', 'फाइल पढ्ने क्रममा त्रुटि', 'Ошибка чтения файла', 'Fejl ved læsning af filen', 'Ֆայլը կարդալու սխալ', 'ფაილის წაკითხვის შეცდომა', 'फाईल वाचण्यात त्रुटी', 'Ralat Membaca Fail', 'ਫਾਇਲ ਪੜਨ ਦੌਰਾਨ ਗਲਤੀ', 'கோப்பைப் படிப்பதில் பிழை', 'ఫైల్‌ను చదవడంలో లోపం', 'Fel vid läsning av filen', 'Error sa Pagbasa ng File'),
(971, 'staff', 'Staff', 'কর্মী', 'العاملين', 'Personnel', 'कर्मचारी', 'Staf', 'Personale', 'スタッフ', '직원', 'Personeel', 'Funcionários', 'บุคลากร', 'Personel', 'عملہ', '员工', 'personeel', 'Mitarbeiter', 'Προσωπικό', 'Personal', 'स्टाफ', 'Сотрудники', 'Personale', 'Աշխատակազմ', 'თანამშრომლები', 'कर्मचारी', 'Kakitangan', 'ਸਟਾਫ', 'பணியாளர்கள்', 'స్టాఫ్', 'Personal', 'Mga tauhan'),
(972, 'waiting', 'Waiting', 'অপেক্ষা', 'انتظار', 'Attendre', 'इंतज़ार कर रही', 'Menunggu', 'In attesa', '待っています', '기다리는', 'Aan het wachten', 'Esperando', 'ที่รอคอย', 'Bekleme', 'انتظار کر رہا ہے', '等候', 'wag', 'Warten', 'Αναμονή', 'Esperando', 'पर्खँदै', 'Ожидание', 'Venter', 'Սպասում', 'ველოდები', 'वाट पहात आहे', 'Menunggu', 'ਉਡੀਕ ਕਰ ਰਿਹਾ ਹੈ', 'காத்திருக்கிறது', 'వేచి', 'Väntar', 'Naghihintay'),
(973, 'live', 'Live', 'লাইভ দেখান', 'حي', 'Vivre', 'लाइव', 'Hidup', 'Vivere', '住む', '라이브', 'Leven', 'Viver', 'มีชีวิต', 'Canlı', 'جیو', '生活', 'Leef', 'Leben', 'Ζω', 'En Vivo', 'प्रत्यक्ष', 'Жить', 'Direkte', 'Ապրիր', 'იცხოვრე', 'राहतात', 'Langsung', 'ਜੀ', 'வாழ்க', 'Live', 'leva', 'Mabuhay'),
(974, 'by', 'By', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(975, 'host_live_class', 'Host Live Class', 'হোস্ট লাইভ ক্লাস', 'استضافة فئة مباشرة', 'Host Live Class', 'होस्ट लाइव क्लास', 'Tuan Rumah Kelas Langsung', 'Ospita classe dal vivo', 'ホストライブクラス', '호스트 라이브 클래스', 'Host Live Class', 'Host Live Class', 'โฮสต์คลาสสด', 'Host Sınıfı', 'میزبان براہ راست کلاس', '主持人直播课程', 'Gasheer Live Class', 'Host Live Class', 'Φιλοξενήστε ζωντανή τάξη', 'Host Live Class', 'होस्ट लाइभ क्लास', 'Host Live Class', 'Host Live Class', 'Հաղորդավար կենդանի դաս', 'მასპინძელი ცოცხალი კლასი', 'होस्ट लाइव्ह क्लास', 'Hoskan Kelas Langsung', 'ਮੇਜ਼ਬਾਨ ਲਾਈਵ ਕਲਾਸ', 'நேரடி வகுப்பை நடத்துங்கள்', 'లైవ్ క్లాస్ హోస్ట్ చేయండి', 'Värd Live Class', 'Pag-host ng Live Class'),
(976, 'join_live_class', 'Join Live Class', 'লাইভ ক্লাসে যোগদান করুন', 'انضم إلى Live Class', 'Rejoignez Live Class', 'लाइव क्लास ज्वाइन करें', 'Bergabunglah dengan Kelas Langsung', 'Unisciti alla Live Class', 'ライブクラスに参加', '라이브 수업 참여', 'Doe mee met Live Class', 'Participar de aulas ao vivo', 'เข้าร่วม Live Class', 'Canlı Sınıfa Katılın', 'براہ راست کلاس میں شامل ہوں', '加入直播课程', 'Sluit aan by Live Class', 'Treten Sie der Live-Klasse bei', 'Εγγραφείτε στο Live Class', 'Únete a la clase en vivo', 'प्रत्यक्ष कक्षामा सम्मिलित हुनुहोस्', 'Присоединиться к Live Class', 'Deltag i Live Class', 'Միացեք կենդանի դասին', 'შემოგვიერთდით ცოცხალ კლასში', 'थेट वर्गात सामील व्हा', 'Sertailah Kelas Langsung', 'ਲਾਈਵ ਕਲਾਸ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ', 'நேரடி வகுப்பில் சேரவும்', 'లైవ్ క్లాస్‌లో చేరండి', 'Gå med i Live Class', 'Sumali sa Live Class'),
(977, 'system_logo', 'System Logo', 'সিস্টেম লোগো', 'شعار النظام', 'Logo du système', 'सिस्टम लोगो', 'Logo Sistem', 'Logo di sistema', 'システムロゴ', '시스템 로고', 'Systeemlogo', 'System Logo', 'โลโก้ระบบ', 'Sistem Logosu', 'سسٹم کا لوگو', '系统徽标', 'Stelsellogo', 'Systemlogo', 'Λογότυπο συστήματος', 'Logotipo del sistema', 'प्रणाली लोगो', 'Системный логотип', 'Systemlogo', 'Համակարգի լոգոն', 'სისტემის ლოგო', 'सिस्टम लोगो', 'Logo Sistem', 'ਸਿਸਟਮ ਲੋਗੋ', 'கணினி லோகோ', 'సిస్టమ్ లోగో', 'Systemlogotyp', 'Logo ng System'),
(978, 'text_logo', 'Text Logo', 'পাঠ্য লোগো', 'شعار النص', 'Logo texte', 'पाठ लोगो', 'Logo teks', 'Logo di testo', 'テキストロゴ', '텍스트 로고', 'Tekst logo', 'Text Logo', 'โลโก้ข้อความ', 'Metin Logosu', 'متن لوگو', '文字标志', 'Tekslogo', 'Text Logo', 'Λογότυπο κειμένου', 'Logo de texto', 'पाठ लोगो', 'Текстовый логотип', 'Tekstlogo', 'Տեքստի պատկերանշան', 'ტექსტის ლოგო', 'मजकूर लोगो', 'Logo Teks', 'ਟੈਕਸਟ ਲੋਗੋ', 'உரை லோகோ', 'టెక్స్ట్ లోగో', 'Textlogotyp', 'Logo ng Teksto'),
(979, 'printing_logo', 'Printing Logo', 'মুদ্রণ লোগো', 'شعار الطباعة', 'Printing Logo', 'मुद्रण लोगो', 'Mencetak logo', 'Stampa del logo', 'ロゴの印刷', '로고 인쇄', 'Logo afdrukken', 'Printing Logo', 'พิมพ์โลโก้', 'Baskı Logo', 'علامت (لوگو) پرنٹ کرنا', '印刷标志', 'Druk logo', 'Logo drucken', 'Εκτύπωση λογότυπου', 'Logo de impresión', 'लोगो प्रिन्ट गर्दै', 'Печать логотипа', 'Udskrivning af logo', 'Տպագրական պատկերանշան', 'ბეჭდვის ლოგო', 'मुद्रण लोगो', 'Mencetak Logo', 'ਪ੍ਰਿੰਟਿੰਗ ਲੋਗੋ', 'லோகோவை அச்சிடுகிறது', 'లోగోను ముద్రించడం', 'Trycklogotyp', 'Pag-print ng Logo'),
(980, 'expired', 'Expired', 'মেয়াদোত্তীর্ণ', 'منتهية الصلاحية', 'Expiré', 'समय सीमा समाप्त', 'Kedaluwarsa', 'Scaduto', '期限切れ', '만료', 'Niet meer geldig', 'Expirado', 'ที่หมดอายุแล้ว', 'Süresi doldu', 'میعاد ختم ہوگئی', '已过期', 'verval', 'Abgelaufen', 'έχει λήξει', 'Caducado', 'म्याद सकियो', 'Истекший', 'Udløbet', 'Ժամկետանց', 'ამოიწურა', 'कालबाह्य', 'Tamat tempoh', 'ਮਿਆਦ ਪੁੱਗ ਗਈ', 'காலாவதியான', 'గడువు', 'Utgånget', 'Natapos na'),
(981, 'collect_fees', 'Collect Fees', 'ফি সংগ্রহ করুন', 'تحصيل الرسوم', 'Percevoir les frais', 'फीस लीजिए', 'Kumpulkan Biaya', 'Raccogliere commissioni', '手数料を徴収する', '수수료 징수', 'Verzamel vergoedingen', 'Cobrar taxas', 'เก็บค่าธรรมเนียม', 'Ücretleri Toplayın', 'فیسیں جمع کریں', '收取费用', 'Versamel fooie', 'Gebühren sammeln', 'Συλλέξτε τέλη', 'Cobrar tarifas', 'शुल्क स Collect्कलन गर्नुहोस्', 'Сбор Сборов', 'Saml gebyrer', 'Հավաքեք տուրքեր', 'შეაგროვეთ საფასური', 'फी जमा करा', 'Kumpulkan Yuran', 'ਫੀਸ ਇਕੱਠੀ ਕਰੋ', 'கட்டணம் வசூலிக்கவும்', 'ఫీజు వసూలు చేయండి', 'Samla avgifter', 'Kolektahin ang mga Bayad'),
(982, 'fees_code', 'Fees Code', 'ফি কোড', 'كود الرسوم', 'Code des frais', 'फीस कोड', 'Kode Biaya', 'Codice delle tasse', '料金コード', '수수료 코드', 'Kostencode', 'Código das taxas', 'รหัสค่าธรรมเนียม', 'Ücret Kodu', 'فیس کوڈ', '费用代码', 'Fooie kode', 'Gebührencode', 'Κωδικός χρεώσεων', 'Código de tarifas', 'शुल्क कोड', 'Код сборов', 'Gebyrkode', 'Վճարների ծածկագիր', 'საფასურის კოდი', 'फी कोड', 'Kod Yuran', 'ਫੀਸ ਕੋਡ', 'கட்டணக் குறியீடு', 'ఫీజు కోడ్', 'Avgiftskod', 'Code ng Bayad'),
(983, 'collect_by', 'Collect By', 'সংগ্রহ করুন', 'اجمع بواسطة', 'Collecter par', 'द्वारा लीजिए', 'Kumpulkan Oleh', 'Colleziona da', '収集者', '에 의해 수집', 'Verzamel door', 'Coletar por', 'รวบรวมโดย', 'Toplayan:', 'بذریعہ جمع کریں', '收集者', 'Versamel deur', 'Sammeln von', 'Συλλέξτε από', 'Recoger por', 'द्वारा स Collect्कलन गर्नुहोस्', 'Собрать', 'Saml efter', 'Հավաքել ըստ', 'კოლექციონირება', 'द्वारे संकलित करा', 'Kumpulkan Oleh', 'ਦੁਆਰਾ ਇਕੱਠਾ ਕਰੋ', 'மூலம் சேகரிக்கவும்', 'ద్వారా సేకరించండి', 'Samla med', 'Kolektahin Ni'),
(984, 'fee_payment', 'Fee Payment', 'ফি জমাদান', 'دفع الرسوم', 'Paiement des frais', 'शुल्क भुगतान', 'Pembayaran Biaya', 'Pagamento delle commissioni', '料金の支払い', '수수료 지불', 'Kosten betaling', 'Pagamento da taxa', 'ชำระค่าธรรมเนียม', 'Ücret Ödeme', 'فیس کی ادائیگی', '费用支付', 'Fooi betaling', 'Gebührenzahlung', 'Πληρωμή τέλους', 'Pago de honorarios', 'शुल्क भुक्तानी', 'Оплата комиссии', 'Gebyr for betaling', 'Վճարների վճարում', 'საფასურის გადახდა', 'फी भरणे', 'Bayaran Yuran', 'ਫੀਸ ਦਾ ਭੁਗਤਾਨ', 'கட்டணம் செலுத்துதல்', 'ఫీజు చెల్లింపు', 'Avgiftsbetalning', 'Pagbayad ng fee'),
(985, 'write_message', 'Write Message', 'বার্তা লিখুন', 'اكتب رسالة', 'Écrire un message', 'संदेश लिखो', 'Menulis pesan', 'Scrivi un messaggio', 'メッセージを書く', '메시지 쓰기', 'Schrijf een bericht', 'Escrever mensagem', 'เขียนข้อความ', 'Mesaj Yaz', 'پیغام لکھیں', '写信息', 'Skryf boodskap', 'Nachricht schreiben', 'Γράψε μήνυμα', 'Escribe un mensaje', 'सन्देश लेख्नुहोस्', 'Написать сообщение', 'Skriv besked', 'Գրեք հաղորդագրություն', 'დაწერე შეტყობინება', 'संदेश लिहा', 'Tulis Mesej', 'ਸੁਨੇਹਾ ਲਿਖੋ', 'செய்தி எழுதுங்கள்', 'సందేశం రాయండి', 'Skriv meddelande', 'Magsulat ng mensahe'),
(986, 'discard', 'Discard', 'বাতিল করা', 'تجاهل', 'Jeter', 'रद्द करें', 'Membuang', 'Scartare', '捨てる', '포기', 'Weggooien', 'Descartar', 'ยกเลิก', 'Sil', 'خارج کردیں', '丢弃', 'Gooi', 'Verwerfen', 'Απορρίπτω', 'Descarte', 'रद्द गर्नुहोस्', 'Выбросьте', 'Kassér', 'Հրաժարվել', 'Გაუქმება', 'टाकून द्या', 'Buang', 'ਬਰਖਾਸਤ ਕਰੋ', 'நிராகரி', 'విస్మ', 'Kassera', 'Itapon'),
(987, 'message_sent_successfully', 'Message Sent Successfully', 'বার্তা সফলভাবে পাঠানো হয়েছে', 'تم إرسال الرسالة بنجاح', 'Message envoyé avec succès', 'संदेश सफलतापूर्वक भेजा जा चुका है', 'Pesan terkirim dengan sukses', 'Messaggio inviato con successo', '送信に成功しました', '메세지가 성공적으로 전송되었습니다', 'Bericht succesvol verzonden', 'Mensagem enviada com sucesso', 'ข้อความที่ส่งประสบความสำเร็จ', 'Mesaj Başarıyla Gönderildi', 'پیغام کامیابی سے چلا گیا', '消息已成功发送', 'Boodskap is suksesvol gestuur', 'Nachricht erfolgreich gesendet', 'Το μήνυμα εστάλη επιτυχώς', 'Mensaje enviado con éxito', 'सन्देश सफलतापूर्वक पठाइयो', 'Сообщение успешно отправлено', 'Beskeden blev sendt', 'Հաղորդագրությունն հաջողությամբ ուղարկվեց', 'გაგზავნა წარმატებით გაგზავნილი', 'संदेश यशस्वीरित्या पाठविला', 'Mesej Dihantar Berjaya', 'ਸੁਨੇਹਾ ਸਫਲਤਾਪੂਰਵਕ ਭੇਜਿਆ ਗਿਆ', 'செய்தி வெற்றிகரமாக அனுப்பப்பட்டது', 'సందేశం విజయవంతంగా పంపబడింది', 'Meddelandet skickades utan problem', 'Matagumpay na ipinadala ang Mensahe'),
(988, 'not_found_anything', 'Not Found Anything', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(989, 'email_subject', 'Email Subject', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(990, 'certificate', 'Certificate', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(991, 'templete', 'Templete', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(992, 'advance_salary_request', 'Advance Salary Request', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(993, 'system_update', 'System Update', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(994, 'visit_home_page', 'Visit Home Page', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(995, 'frontend', 'Frontend', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(996, 'setting', 'Setting', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(997, 'menu', 'Menu', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(998, 'page', 'Page', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(999, 'manage', 'Manage', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1000, 'slider', 'Slider', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1001, 'features', 'Features', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1002, 'testimonial', 'Testimonial', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1003, 'service', 'Service', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1004, 'faq', 'Faq', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1005, 'card_management', 'Card Management', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1006, 'id_card', 'Id Card', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1007, 'admit_card', 'Admit Card', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1008, 'update_now', 'Update Now', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1009, 'usename', 'Usename', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1010, 'website_page', 'Website Page', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1011, 'welcome', 'Welcome', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1012, 'services', 'Services', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1013, 'call_to_action_section', 'Call To Action Section', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1014, 'subtitle', 'Subtitle', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1015, 'cta', 'Cta', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1016, 'button_text', 'Button Text', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1017, 'button_url', 'Button Url', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1018, '_title', ' Title', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1019, 'meta', 'Meta', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1020, 'keyword', 'Keyword', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1021, 'position', 'Position', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1022, 'target_new_window', 'Target New Window', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1023, 'external_url', 'External Url', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1024, 'external_link', 'External Link', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1025, 'submit', 'Submit', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1026, 'appointment', 'Appointment', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1027, 'banner_photo', 'Banner Photo', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1028, 'contact', 'Contact', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1029, 'box_title', 'Box Title', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1030, 'box_description', 'Box Description', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1031, 'box_photo', 'Box Photo', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1032, 'form_title', 'Form Title', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1033, 'submit_button_text', 'Submit Button Text', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1034, 'map_iframe', 'Map Iframe', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1035, 'guardian_relation', 'Guardian Relation', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1036, 'button_text_1', 'Button Text 1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1037, 'button_url_1', 'Button Url 1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1038, 'button_text_2', 'Button Text 2', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1039, 'button_url_2', 'Button Url 2', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1040, 'left', 'Left', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1041, 'center', 'Center', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1042, 'right', 'Right', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1043, 'about', 'About', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1044, 'content', 'Content', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1045, 'about_photo', 'About Photo', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1046, 'parallax_photo', 'Parallax Photo', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1047, 'audition', 'Audition', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1048, 'show_website', 'Show Website', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1049, 'image', 'Image', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1050, 'experience_details', 'Experience Details', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1051, 'total_experience', 'Total Experience', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1052, 'class_schedule', 'Class Schedule', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1053, 'play', 'Play', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1054, 'video', 'Video', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1055, 'website', 'Website', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1056, 'cms', 'Cms', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1057, 'url_alias', 'Url Alias', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1058, 'cms_frontend', 'Cms Frontend', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1059, 'enabled', 'Enabled', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1060, 'receive_email_to', 'Receive Email To', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1061, 'captcha_status', 'Captcha Status', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1062, 'recaptcha_site_key', 'Recaptcha Site Key', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1063, 'recaptcha_secret_key', 'Recaptcha Secret Key', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1064, 'working_hours', 'Working Hours', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1065, 'fav_icon', 'Fav Icon', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1066, 'theme', 'Theme', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1067, 'fax', 'Fax', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1068, 'footer_about_text', 'Footer About Text', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1069, 'copyright_text', 'Copyright Text', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1070, 'facebook_url', 'Facebook Url', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1071, 'twitter_url', 'Twitter Url', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1072, 'youtube_url', 'Youtube Url', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1073, 'google_plus', 'Google Plus', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1074, 'linkedin_url', 'Linkedin Url', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1075, 'pinterest_url', 'Pinterest Url', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1076, 'instagram_url', 'Instagram Url', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1077, 'edit_attachments', 'Edit Attachments', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1078, 'cms_default_branch', 'Cms Default Branch', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1079, 'prefix', 'Prefix', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1080, 'url', 'Url', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1081, 'page_title', 'Page Title', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1082, 'select_menu', 'Select Menu', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1083, 'meta_keyword', 'Meta Keyword', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1084, 'meta_description', 'Meta Description', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1085, 'edit_branch', 'Edit Branch', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1086, 'create_section', 'Create Section', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1087, 'section_list', 'Section List', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1088, 'username_has_already_been_used', 'Username Has Already Been Used', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1089, 'student_inquiry', 'Student Inquiry', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1090, 'inquiry', 'Inquiry', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1091, 'create_inquiry', 'Create Inquiry', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1092, 'gdr_office_no', 'Gdr Office No', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1093, 'inquiry_no', 'Inquiry No', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1094, 'inquiry_type', 'Inquiry Type', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1095, 'visited_date', 'Visited Date', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1096, 'inquiry_list', 'Inquiry List', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1097, 'guardian_office_number', 'Guardian Office Number', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1098, 'guardian_mobile_number', 'Guardian Mobile Number', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1099, 'guardian_email', 'Guardian Email', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1100, 'previous_remarks', 'Previous Remarks', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1101, 'guardian_office', 'Guardian Office', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1102, 'guardian_mobile', 'Guardian Mobile', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1103, 'add_inquiry', 'Add Inquiry', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1104, 'student_promotion', 'Student Promotion', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1105, 'the_next_session_was_transferred_to_the_students', 'The Next Session Was Transferred To The Students', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1106, 'promote_to_session', 'Promote To Session', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1107, 'promote_to_class', 'Promote To Class', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1108, 'promote_to_section', 'Promote To Section', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1109, 'mark_summary', 'Mark Summary', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1110, 'translation_update', 'Translation Update', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1111, 'parents_profile', 'Parents Profile', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1112, 'childs', 'Childs', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1113, 'No_record_found.', 'No Record Found.', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1114, 'record_found.', 'Record Found.', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1115, 'select_for_everyone', 'Select For Everyone', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1116, 'evaluation_date', 'Evaluation Date', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1117, 'incomplete', 'Incomplete', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1118, 'evaluated_by', 'Evaluated By', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1119, 'hostels', 'Hostels', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1120, 'there_is_no_room_allocation', 'There Is No Room Allocation', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1121, 'room_category', 'Room Category', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1122, 'no_fees_have_been_allocated', 'No Fees Have Been Allocated', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1123, 'teachers_list', 'Teachers List', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1124, 'applicable_user', 'Applicable User', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1125, 'page_layout', 'Page Layout', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1126, 'background', 'Background', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1127, 'signature', 'Signature', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1128, 'hall_room', 'Hall Room', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1129, 'mark', 'Mark', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1130, 'mark_from', 'Mark From', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1131, 'mark_upto', 'Mark Upto', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1132, 'edit_grade', 'Edit Grade', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1133, 'total_discount', 'Total Discount', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1134, 'total_fine', 'Total Fine', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1135, 'total_balance', 'Total Balance', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1136, 'leave_days', 'Leave Days', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(1137, 'student_fee', 'Student Fee', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `language_list`
--

CREATE TABLE `language_list` (
  `id` int(11) NOT NULL,
  `name` varchar(600) NOT NULL,
  `lang_field` varchar(600) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language_list`
--

INSERT INTO `language_list` (`id`, `name`, `lang_field`, `status`, `created_at`, `updated_at`) VALUES
(1, 'English', 'english', 1, '2018-11-15 11:36:31', '2020-11-29 02:33:08'),
(2, 'Bengali', 'bengali', 1, '2018-11-15 11:36:31', '2018-12-04 15:41:50'),
(3, 'Arabic', 'arabic', 1, '2018-11-15 11:36:31', '2019-01-20 03:04:53'),
(4, 'French', 'french', 1, '2018-11-15 11:36:31', '2019-01-20 03:04:55'),
(5, 'Hindi', 'hindi', 1, '2018-11-15 11:36:31', '2019-01-20 03:00:10'),
(6, 'Indonesian', 'indonesian', 1, '2018-11-15 11:36:31', '2019-01-20 03:00:12'),
(7, 'Italian', 'italian', 1, '2018-11-15 11:36:31', '2019-01-20 03:00:14'),
(8, 'Japanese', 'japanese', 1, '2018-11-15 11:36:31', '2019-01-20 03:00:15'),
(9, 'Korean', 'korean', 1, '2018-11-15 11:36:31', '2019-01-20 03:00:17'),
(10, 'Dutch', 'dutch', 1, '2018-11-15 11:36:31', '2019-01-20 03:00:19'),
(11, 'Portuguese', 'portuguese', 1, '2018-11-15 11:36:31', '2019-01-20 03:00:20'),
(12, 'Thai', 'thai', 1, '2018-11-15 11:36:31', '2019-01-20 03:00:22'),
(13, 'Turkish', 'turkish', 1, '2018-11-15 11:36:31', '2019-01-20 03:00:25'),
(14, 'Urdu', 'urdu', 1, '2018-11-15 11:36:31', '2019-01-20 03:00:28'),
(15, 'Chinese', 'chinese', 1, '2018-11-15 11:36:31', '2019-03-29 02:44:39'),
(16, 'Afrikaans', 'afrikaans', 1, '2018-11-15 11:36:31', '2019-03-29 02:44:39'),
(17, 'German', 'german', 1, '2018-11-15 11:36:31', '2019-03-29 02:44:39'),
(18, 'Greek', 'greek', 1, '2018-11-15 11:36:31', '2019-03-29 02:44:39'),
(19, 'Spanish', 'spanish', 1, '2018-11-15 11:36:31', '2019-03-29 02:44:39'),
(20, 'Nepali', 'nepali', 1, '2018-11-15 11:36:31', '2019-03-29 02:44:39'),
(21, 'Russian', 'russian', 1, '2018-11-15 11:36:31', '2019-03-29 02:44:39'),
(22, 'Danish', 'danish', 1, '2018-11-15 11:36:31', '2019-03-29 02:44:39'),
(23, 'Armenian', 'armenian', 1, '2018-11-15 11:36:31', '2019-03-29 02:44:39'),
(24, 'Georgian', 'georgian', 1, '2018-11-15 11:36:31', '2019-03-29 02:44:39'),
(25, 'Marathi', 'marathi', 1, '2018-11-15 11:36:31', '2019-03-29 02:44:39'),
(26, 'Malay', 'malay', 1, '2018-11-15 11:36:31', '2019-03-29 02:44:39'),
(27, 'Punjabi', 'punjabi', 1, '2018-11-15 11:36:31', '2019-03-29 02:44:39'),
(28, 'Tamil', 'tamil', 1, '2018-11-15 11:36:31', '2019-03-29 02:44:39'),
(29, 'Telugu', 'telugu', 1, '2018-11-15 11:36:31', '2019-03-29 02:44:39'),
(30, 'Swedish', 'swedish', 1, '2018-11-15 11:36:31', '2019-03-29 02:44:39'),
(31, 'Filipino', 'filipino', 1, '2018-11-15 11:36:31', '2019-03-29 02:44:39');

-- --------------------------------------------------------

--
-- Table structure for table `leave_application`
--

CREATE TABLE `leave_application` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `category_id` int(2) NOT NULL,
  `reason` longtext CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `leave_days` varchar(20) NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL DEFAULT 1 COMMENT '1=pending,2=accepted 3=rejected',
  `apply_date` date DEFAULT NULL,
  `approved_by` int(11) NOT NULL,
  `orig_file_name` varchar(255) NOT NULL,
  `enc_file_name` varchar(255) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leave_application`
--

INSERT INTO `leave_application` (`id`, `user_id`, `role_id`, `category_id`, `reason`, `start_date`, `end_date`, `leave_days`, `status`, `apply_date`, `approved_by`, `orig_file_name`, `enc_file_name`, `comments`, `session_id`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 7, 7, 1, 'I am ill today', '2021-03-17', '2021-03-17', '1', 1, '2021-03-16', 0, 'image1-14.png', '45415148f0b547b0f905ddfeec821a3c.png', '', 3, 1, '2021-03-16 12:33:31', NULL),
(2, 8, 7, 1, 'dasd', '2021-03-19', '2021-03-19', '1', 1, '2021-03-17', 0, '', '', '', 3, 1, '2021-03-16 20:44:26', NULL),
(3, 8, 7, 1, 'test with doc', '2021-03-20', '2021-03-20', '1', 1, '2021-03-17', 0, 'test.docx', '8009e924a8f661abc5c75377743b3ce9.docx', '', 3, 1, '2021-03-16 20:45:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leave_category`
--

CREATE TABLE `leave_category` (
  `id` int(2) NOT NULL,
  `name` longtext CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `role_id` tinyint(1) NOT NULL,
  `days` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leave_category`
--

INSERT INTO `leave_category` (`id`, `name`, `role_id`, `days`, `branch_id`) VALUES
(1, 'Sick leave', 7, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `live_class`
--

CREATE TABLE `live_class` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `meeting_id` varchar(255) NOT NULL,
  `meeting_password` varchar(255) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` varchar(11) NOT NULL,
  `remarks` text NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `live_class_config`
--

CREATE TABLE `live_class_config` (
  `id` int(11) NOT NULL,
  `zoom_api_key` varchar(255) DEFAULT NULL,
  `zoom_api_secret` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login_credential`
--

CREATE TABLE `login_credential` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(250) NOT NULL,
  `role` tinyint(2) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1(active) 0(deactivate)',
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_credential`
--

INSERT INTO `login_credential` (`id`, `user_id`, `username`, `password`, `role`, `active`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 1, 'iamomerbhutta@gmail.com', '$2y$10$HNeAMGEFPiAxOnTHwPUWYODMyBv/UBa4YdAshFtJLvvNpEEyeEPnm', 1, 1, '2021-03-19 02:09:40', '2020-10-02 03:57:08', NULL),
(2, 1, 'faizahmad', '$2y$10$IWyK5Z//gg7E6gcmGvgIkusS4BiVn/Tg2/d9aoTOgypfildb.UyPe', 6, 1, NULL, '2020-11-23 21:40:27', NULL),
(3, 1, 'umarfaiz', '$2y$10$QzeX/3pNGZKwiKLQreAsp.53eVeO7s7vaReR1NQtvIU4FnX56HXx.', 7, 1, '2021-03-01 10:34:08', '2020-11-23 21:40:27', NULL),
(4, 2, 'greattest', '$2y$10$gIMPu8ZCfxvRD1BTHbl8AeSMN9LiEXXaDq2RFBqA06Lg3ifvqxY3O', 6, 1, NULL, '2020-11-28 17:19:25', NULL),
(5, 2, 'testone', '$2y$10$kEDJGaJk.hV6Ztss3ArNxeufuAqWf5d16n2hM18UBPLVAXrR.OQ/6', 7, 1, NULL, '2020-11-28 17:19:25', NULL),
(6, 3, 'std@test.com', '$2y$10$Jn0nbmYU1Pi41V30Q7VS5eEC.AOrNsDMZM/khZl/XTZw18os.yEhO', 7, 1, NULL, '2020-11-29 12:25:17', NULL),
(7, 4, 'std22@test.com', '$2y$10$zLdwqrX987tzuOQ1ztYV0.HyX0LyEnzAk50dfjlvrPAn6J8QocDt2', 7, 1, NULL, '2020-11-29 12:27:31', NULL),
(8, 5, 'std33@test.com', '$2y$10$qvoLlnS70AoJgSzpQoGz1.EhsUgZnIPl44/JD2PTwIO7LalA0qWRi', 7, 1, NULL, '2020-11-29 12:27:31', NULL),
(9, 6, 'xyz@xyx.com', '$2y$10$4obqqktenrIy.pEVp3s7K.zccvqWydODeJg4.kjGiIMRsW1dD.GS6', 7, 1, '2021-03-02 09:34:03', '2021-03-01 22:48:49', NULL),
(10, 7, 'omer@123.com', '$2y$10$3QplBXDpO4UV9syW3ouSw.AdBl6E.zbY902vlvbsIEutZksRgqfPW', 7, 1, '2021-03-16 17:31:30', '2021-03-01 22:48:49', NULL),
(11, 8, 'riaz@asd.cpom', '$2y$10$DMX4UR3O7bn5gfFpnK9n4OHnLxb7saYdSUWy6F1iFJ8JSQdITJNUu', 7, 1, '2021-03-17 01:33:52', '2021-03-01 22:48:49', NULL),
(12, 9, 'Sameena@asd.com', '$2y$10$KgFCp1V7UnPN72RNc/pbk.frBWBTGVskPGthRiqJjSUT2Je6uvQ/q', 7, 1, NULL, '2021-03-01 22:48:49', NULL),
(13, 10, 'JAJJ@kjh.com', '$2y$10$4kyj.HBFjyG87h86DOhVUuD9DuBa.RnvDh1DCp6n5zLnOUYv0M/qy', 7, 1, NULL, '2021-03-01 22:48:49', NULL),
(14, 2, 'GhulamNabi', '$2y$10$/DumBtbsfTKrMNjI6R2zf.pccwduMu8mW3UYKJNJyp89d/QKr5ULu', 3, 1, NULL, '2021-03-01 23:05:14', NULL),
(15, 3, 'shafi@gmail.com', '$2y$10$zCX1WPcHp0TaSnB.O9fpC.6Uducs74lOdvLZm4HrIcCoT/fdFy2MS', 3, 1, NULL, '2021-03-01 23:07:37', NULL),
(16, 11, 'testusera', '$2y$10$gWfTlkWyO/hlLKvvCgs7uuImOdtZgLLE5Hk2b714WLsvb/LcSZYf2', 7, 1, NULL, '2021-03-18 19:27:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mark`
--

CREATE TABLE `mark` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `mark` text DEFAULT NULL,
  `absent` varchar(4) DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mark`
--

INSERT INTO `mark` (`id`, `student_id`, `subject_id`, `class_id`, `section_id`, `exam_id`, `mark`, `absent`, `session_id`, `branch_id`) VALUES
(1, 6, 1, 4, 1, 1, '{\"1\":\"75\"}', '', 3, 1),
(2, 7, 1, 4, 1, 1, '{\"1\":\"42\"}', '', 3, 1),
(3, 8, 1, 4, 1, 1, '{\"1\":\"65\"}', '', 3, 1),
(4, 9, 1, 4, 1, 1, '{\"1\":\"85\"}', '', 3, 1),
(5, 10, 1, 4, 1, 1, '{\"1\":\"77\"}', '', 3, 1),
(6, 6, 2, 4, 1, 1, '{\"1\":\"68\"}', '', 3, 1),
(7, 7, 2, 4, 1, 1, '{\"1\":\"98\"}', '', 3, 1),
(8, 8, 2, 4, 1, 1, '{\"1\":\"45\"}', '', 3, 1),
(9, 9, 2, 4, 1, 1, '{\"1\":\"65\"}', '', 3, 1),
(10, 10, 2, 4, 1, 1, '{\"1\":\"82\"}', '', 3, 1),
(11, 6, 3, 4, 1, 1, '{\"1\":\"52\"}', '', 3, 1),
(12, 7, 3, 4, 1, 1, '{\"1\":\"78\"}', '', 3, 1),
(13, 8, 3, 4, 1, 1, '{\"1\":\"67\"}', '', 3, 1),
(14, 9, 3, 4, 1, 1, '{\"1\":\"94\"}', '', 3, 1),
(15, 10, 3, 4, 1, 1, '{\"1\":\"40\"}', '', 3, 1),
(16, 6, 4, 4, 1, 1, '{\"1\":\"40\"}', '', 3, 1),
(17, 7, 4, 4, 1, 1, '{\"1\":\"30\"}', '', 3, 1),
(18, 8, 4, 4, 1, 1, '{\"1\":\"25\"}', '', 3, 1),
(19, 9, 4, 4, 1, 1, '{\"1\":\"0\"}', '', 3, 1),
(20, 10, 4, 4, 1, 1, '{\"1\":\"0\"}', '', 3, 1),
(21, 6, 5, 4, 1, 1, '{\"1\":\"50\"}', '', 3, 1),
(22, 7, 5, 4, 1, 1, '{\"1\":\"45\"}', '', 3, 1),
(23, 8, 5, 4, 1, 1, '{\"1\":\"40\"}', '', 3, 1),
(24, 9, 5, 4, 1, 1, '{\"1\":\"10\"}', '', 3, 1),
(25, 10, 5, 4, 1, 1, '{\"1\":\"10\"}', '', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `body` longtext NOT NULL,
  `subject` varchar(255) NOT NULL,
  `file_name` text DEFAULT NULL,
  `enc_name` text DEFAULT NULL,
  `trash_sent` tinyint(1) NOT NULL,
  `trash_inbox` int(11) NOT NULL,
  `fav_inbox` tinyint(1) NOT NULL,
  `fav_sent` tinyint(1) NOT NULL,
  `reciever` varchar(100) NOT NULL,
  `sender` varchar(100) NOT NULL,
  `read_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 unread 1 read',
  `reply_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 unread 1 read',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `message_reply`
--

CREATE TABLE `message_reply` (
  `id` int(11) UNSIGNED NOT NULL,
  `message_id` int(11) NOT NULL,
  `body` text NOT NULL,
  `file_name` text NOT NULL,
  `enc_name` text NOT NULL,
  `identity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(300);

-- --------------------------------------------------------

--
-- Table structure for table `online_admission`
--

CREATE TABLE `online_admission` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` varchar(25) NOT NULL,
  `birthday` date NOT NULL,
  `mobile_no` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `guardian_name` varchar(255) NOT NULL,
  `guardian_relation` varchar(50) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `mother_name` varchar(255) NOT NULL,
  `grd_occupation` varchar(255) NOT NULL,
  `grd_income` varchar(25) NOT NULL,
  `grd_education` varchar(255) NOT NULL,
  `grd_email` varchar(255) NOT NULL,
  `grd_mobile_no` varchar(50) NOT NULL,
  `grd_address` varchar(255) NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT 1,
  `branch_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `apply_date` datetime NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `relation` varchar(255) NOT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `occupation` varchar(100) NOT NULL,
  `income` varchar(100) NOT NULL,
  `education` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobileno` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `photo` varchar(255) NOT NULL,
  `facebook_url` varchar(255) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `twitter_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `active` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0(active) 1(deactivate)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`id`, `name`, `relation`, `father_name`, `mother_name`, `occupation`, `income`, `education`, `email`, `mobileno`, `address`, `city`, `state`, `branch_id`, `photo`, `facebook_url`, `linkedin_url`, `twitter_url`, `created_at`, `updated_at`, `active`) VALUES
(1, 'Self', 'Father', 'Faiz Ahmad', 'asa', 'test', '', '', '', '123456645546', '', '', '', 1, 'defualt.png', NULL, NULL, NULL, '2020-11-23 21:40:27', NULL, 0),
(2, 'Great Test', 'Father', '', '', 'Vaila', '', '', '', '03058734387', '', '', '', 1, 'defualt.png', NULL, NULL, NULL, '2020-11-28 17:19:25', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment_config`
--

CREATE TABLE `payment_config` (
  `id` int(11) NOT NULL,
  `paypal_username` varchar(255) DEFAULT NULL,
  `paypal_password` varchar(255) DEFAULT NULL,
  `paypal_signature` varchar(255) DEFAULT NULL,
  `paypal_email` varchar(255) DEFAULT NULL,
  `paypal_sandbox` tinyint(4) DEFAULT NULL,
  `paypal_status` tinyint(4) DEFAULT NULL,
  `stripe_secret` varchar(255) DEFAULT NULL,
  `stripe_demo` varchar(255) DEFAULT NULL,
  `stripe_status` tinyint(4) DEFAULT NULL,
  `payumoney_key` varchar(255) DEFAULT NULL,
  `payumoney_salt` varchar(255) DEFAULT NULL,
  `payumoney_demo` tinyint(4) DEFAULT NULL,
  `payumoney_status` tinyint(4) DEFAULT NULL,
  `paystack_secret_key` varchar(255) NOT NULL,
  `paystack_status` tinyint(4) NOT NULL,
  `razorpay_key_id` varchar(255) NOT NULL,
  `razorpay_key_secret` varchar(255) NOT NULL,
  `razorpay_demo` tinyint(4) NOT NULL,
  `razorpay_status` tinyint(4) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_salary_stipend`
--

CREATE TABLE `payment_salary_stipend` (
  `id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `amount` int(11) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_types`
--

CREATE TABLE `payment_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_types`
--

INSERT INTO `payment_types` (`id`, `name`, `branch_id`, `timestamp`) VALUES
(1, 'Cash', 0, '2019-07-27 18:12:21'),
(2, 'Card', 0, '2019-07-27 18:12:31'),
(3, 'Cheque', 0, '2019-12-21 10:07:59'),
(4, 'Bank Transfer', 0, '2019-12-21 10:08:36'),
(5, 'Other', 0, '2019-12-21 10:08:45'),
(6, 'Paypal', 0, '2019-12-21 10:08:45'),
(7, 'Stripe', 0, '2019-12-21 10:08:45'),
(8, 'PayUmoney', 0, '2019-12-21 10:08:45'),
(9, 'Paystack', 0, '2019-12-21 10:08:45'),
(10, 'Razorpay', 0, '2019-12-21 10:08:45');

-- --------------------------------------------------------

--
-- Table structure for table `payslip`
--

CREATE TABLE `payslip` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `month` varchar(200) DEFAULT NULL,
  `year` varchar(20) NOT NULL,
  `basic_salary` decimal(18,2) NOT NULL,
  `total_allowance` decimal(18,2) NOT NULL,
  `total_deduction` decimal(18,2) NOT NULL,
  `net_salary` decimal(18,2) NOT NULL,
  `bill_no` varchar(25) NOT NULL,
  `remarks` text NOT NULL,
  `pay_via` tinyint(1) NOT NULL,
  `hash` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `paid_by` varchar(200) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payslip_details`
--

CREATE TABLE `payslip_details` (
  `id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `type` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `prefix` varchar(100) NOT NULL,
  `show_view` tinyint(1) DEFAULT 1,
  `show_add` tinyint(1) DEFAULT 1,
  `show_edit` tinyint(1) DEFAULT 1,
  `show_delete` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `module_id`, `name`, `prefix`, `show_view`, `show_add`, `show_edit`, `show_delete`, `created_at`) VALUES
(1, 2, 'Student', 'student', 1, 1, 1, 1, '2020-01-22 11:45:47'),
(2, 2, 'Multiple Import', 'multiple_import', 0, 1, 0, 0, '2020-01-22 11:45:47'),
(3, 2, 'Student Category', 'student_category', 1, 1, 1, 1, '2020-01-22 11:45:47'),
(4, 2, 'Student Id Card', 'student_id_card', 1, 0, 0, 0, '2020-01-22 11:45:47'),
(5, 2, 'Disable Authentication', 'student_disable_authentication', 1, 1, 0, 0, '2020-01-22 11:45:47'),
(6, 4, 'Employee', 'employee', 1, 1, 1, 1, '2020-01-22 11:55:19'),
(7, 3, 'Parent', 'parent', 1, 1, 1, 1, '2020-01-22 13:24:05'),
(8, 3, 'Disable Authentication', 'parent_disable_authentication', 1, 1, 0, 0, '2020-01-22 14:22:21'),
(9, 4, 'Department', 'department', 1, 1, 1, 1, '2020-01-22 17:41:39'),
(10, 4, 'Designation', 'designation', 1, 1, 1, 1, '2020-01-22 17:41:39'),
(11, 4, 'Disable Authentication', 'employee_disable_authentication', 1, 1, 0, 0, '2020-01-22 17:41:39'),
(12, 5, 'Salary Template', 'salary_template', 1, 1, 1, 1, '2020-01-23 05:13:57'),
(13, 5, 'Salary Assign', 'salary_assign', 1, 1, 0, 0, '2020-01-23 05:14:05'),
(14, 5, 'Salary Payment', 'salary_payment', 1, 1, 0, 0, '2020-01-24 06:45:40'),
(15, 5, 'Salary Summary Report', 'salary_summary_report', 1, 0, 0, 0, '2020-03-14 17:09:17'),
(16, 5, 'Advance Salary', 'advance_salary', 1, 1, 1, 1, '2020-01-28 18:23:39'),
(17, 5, 'Advance Salary Manage', 'advance_salary_manage', 1, 1, 1, 1, '2020-01-25 04:57:12'),
(18, 5, 'Advance Salary Request', 'advance_salary_request', 1, 1, 0, 1, '2020-01-28 17:49:58'),
(19, 5, 'Leave Category', 'leave_category', 1, 1, 1, 1, '2020-01-29 02:46:23'),
(20, 5, 'Leave Request', 'leave_request', 1, 1, 1, 1, '2020-01-30 12:06:33'),
(21, 5, 'Leave Manage', 'leave_manage', 1, 1, 1, 1, '2020-01-29 07:27:15'),
(22, 5, 'Award', 'award', 1, 1, 1, 1, '2020-01-31 18:49:11'),
(23, 6, 'Classes', 'classes', 1, 1, 1, 1, '2020-02-01 18:10:00'),
(24, 6, 'Section', 'section', 1, 1, 1, 1, '2020-02-01 21:06:44'),
(25, 6, 'Assign Class Teacher', 'assign_class_teacher', 1, 1, 1, 1, '2020-02-02 07:09:22'),
(26, 6, 'Subject', 'subject', 1, 1, 1, 1, '2020-02-03 04:32:39'),
(27, 6, 'Subject Class Assign ', 'subject_class_assign', 1, 1, 1, 1, '2020-02-03 17:43:19'),
(28, 6, 'Subject Teacher Assign', 'subject_teacher_assign', 1, 1, 0, 1, '2020-02-03 19:05:11'),
(29, 6, 'Class Timetable', 'class_timetable', 1, 1, 1, 1, '2020-02-04 05:50:37'),
(30, 2, 'Student Promotion', 'student_promotion', 1, 1, 0, 0, '2020-02-05 18:20:30'),
(31, 8, 'Attachments', 'attachments', 1, 1, 1, 1, '2020-02-06 17:59:43'),
(32, 7, 'Homework', 'homework', 1, 1, 1, 1, '2020-02-07 05:40:08'),
(33, 8, 'Attachment Type', 'attachment_type', 1, 1, 1, 1, '2020-02-07 07:16:28'),
(34, 9, 'Exam', 'exam', 1, 1, 1, 1, '2020-02-07 09:59:29'),
(35, 9, 'Exam Term', 'exam_term', 1, 1, 1, 1, '2020-02-07 12:09:28'),
(36, 9, 'Exam Hall', 'exam_hall', 1, 1, 1, 1, '2020-02-07 14:31:04'),
(37, 9, 'Exam Timetable', 'exam_timetable', 1, 1, 0, 1, '2020-02-08 17:04:31'),
(38, 9, 'Exam Mark', 'exam_mark', 1, 1, 1, 1, '2020-02-10 12:53:41'),
(39, 9, 'Exam Grade', 'exam_grade', 1, 1, 1, 1, '2020-02-10 17:29:16'),
(40, 10, 'Hostel', 'hostel', 1, 1, 1, 1, '2020-02-11 04:41:36'),
(41, 10, 'Hostel Category', 'hostel_category', 1, 1, 1, 1, '2020-02-11 07:52:31'),
(42, 10, 'Hostel Room', 'hostel_room', 1, 1, 1, 1, '2020-02-11 11:50:09'),
(43, 10, 'Hostel Allocation', 'hostel_allocation', 1, 0, 0, 1, '2020-02-11 13:06:15'),
(44, 11, 'Transport Route', 'transport_route', 1, 1, 1, 1, '2020-02-12 05:26:19'),
(45, 11, 'Transport Vehicle', 'transport_vehicle', 1, 1, 1, 1, '2020-02-12 05:57:30'),
(46, 11, 'Transport Stoppage', 'transport_stoppage', 1, 1, 1, 1, '2020-02-12 06:49:20'),
(47, 11, 'Transport Assign', 'transport_assign', 1, 1, 1, 1, '2020-02-12 09:55:21'),
(48, 11, 'Transport Allocation', 'transport_allocation', 1, 0, 0, 1, '2020-02-12 19:33:05'),
(49, 12, 'Student Attendance', 'student_attendance', 0, 1, 0, 0, '2020-02-13 05:25:53'),
(50, 12, 'Employee Attendance', 'employee_attendance', 0, 1, 0, 0, '2020-02-13 10:04:16'),
(51, 12, 'Exam Attendance', 'exam_attendance', 0, 1, 0, 0, '2020-02-13 11:08:14'),
(52, 12, 'Student Attendance Report', 'student_attendance_report', 1, 0, 0, 0, '2020-02-13 19:20:56'),
(53, 12, 'Employee Attendance Report', 'employee_attendance_report', 1, 0, 0, 0, '2020-02-14 06:08:53'),
(54, 12, 'Exam Attendance Report', 'exam_attendance_report', 1, 0, 0, 0, '2020-02-14 06:21:40'),
(55, 13, 'Book', 'book', 1, 1, 1, 1, '2020-02-14 06:40:42'),
(56, 13, 'Book Category', 'book_category', 1, 1, 1, 1, '2020-02-15 04:11:41'),
(57, 13, 'Book Manage', 'book_manage', 1, 1, 0, 1, '2020-02-15 11:13:24'),
(58, 13, 'Book Request', 'book_request', 1, 1, 0, 1, '2020-02-17 06:45:19'),
(59, 14, 'Event', 'event', 1, 1, 1, 1, '2020-02-17 18:02:15'),
(60, 14, 'Event Type', 'event_type', 1, 1, 1, 1, '2020-02-18 04:40:33'),
(61, 15, 'Sendsmsmail', 'sendsmsmail', 1, 1, 0, 1, '2020-02-22 07:19:57'),
(62, 15, 'Sendsmsmail Template', 'sendsmsmail_template', 1, 1, 1, 1, '2020-02-22 10:14:57'),
(63, 17, 'Account', 'account', 1, 1, 1, 1, '2020-02-25 09:34:43'),
(64, 17, 'Deposit', 'deposit', 1, 1, 1, 1, '2020-02-25 12:56:11'),
(65, 17, 'Expense', 'expense', 1, 1, 1, 1, '2020-02-26 06:35:57'),
(66, 17, 'All Transactions', 'all_transactions', 1, 0, 0, 0, '2020-02-26 13:35:05'),
(67, 17, 'Voucher Head', 'voucher_head', 1, 1, 1, 1, '2020-02-25 10:50:56'),
(68, 17, 'Accounting Reports', 'accounting_reports', 1, 1, 1, 1, '2020-02-25 13:36:24'),
(69, 16, 'Fees Type', 'fees_type', 1, 1, 1, 1, '2020-02-27 10:11:03'),
(70, 16, 'Fees Group', 'fees_group', 1, 1, 1, 1, '2020-02-26 05:49:09'),
(71, 16, 'Fees Fine Setup', 'fees_fine_setup', 1, 1, 1, 1, '2020-03-05 02:59:27'),
(72, 16, 'Fees Allocation', 'fees_allocation', 1, 1, 1, 1, '2020-03-01 13:47:43'),
(73, 16, 'Collect Fees', 'collect_fees', 0, 1, 0, 0, '2020-03-15 04:23:58'),
(74, 16, 'Fees Reminder', 'fees_reminder', 1, 1, 1, 1, '2020-03-15 04:29:58'),
(75, 16, 'Due Invoice', 'due_invoice', 1, 0, 0, 0, '2020-03-15 04:33:36'),
(76, 16, 'Invoice', 'invoice', 1, 0, 0, 1, '2020-03-15 04:38:06'),
(77, 9, 'Mark Distribution', 'mark_distribution', 1, 1, 1, 1, '2020-03-19 13:02:54'),
(78, 9, 'Report Card', 'report_card', 1, 0, 0, 0, '2020-03-20 12:20:28'),
(79, 9, 'Tabulation Sheet', 'tabulation_sheet', 1, 0, 0, 0, '2020-03-21 07:12:38'),
(80, 15, 'Sendsmsmail Reports', 'sendsmsmail_reports', 1, 0, 0, 0, '2020-03-21 17:02:02'),
(81, 18, 'Global Settings', 'global_settings', 1, 0, 1, 0, '2020-03-22 05:05:41'),
(82, 18, 'Payment Settings', 'payment_settings', 1, 1, 0, 0, '2020-03-22 05:08:57'),
(83, 18, 'Sms Settings', 'sms_settings', 1, 1, 1, 1, '2020-03-22 05:08:57'),
(84, 18, 'Email Settings', 'email_settings', 1, 1, 1, 1, '2020-03-22 05:10:39'),
(85, 18, 'Translations', 'translations', 1, 1, 1, 1, '2020-03-22 05:18:33'),
(86, 18, 'Backup', 'backup', 1, 1, 1, 1, '2020-03-22 07:09:33'),
(87, 18, 'Backup Restore', 'backup_restore', 0, 1, 0, 0, '2020-03-22 07:09:34'),
(88, 7, 'Homework Evaluate', 'homework_evaluate', 1, 1, 0, 0, '2020-03-28 04:20:29'),
(89, 7, 'Evaluation Report', 'evaluation_report', 1, 0, 0, 0, '2020-03-28 09:56:04'),
(90, 18, 'School Settings', 'school_settings', 1, 0, 1, 0, '2020-03-30 17:36:37'),
(91, 1, 'Monthly Income Vs Expense Pie Chart', 'monthly_income_vs_expense_chart', 1, 0, 0, 0, '2020-03-31 06:15:31'),
(92, 1, 'Annual Student Fees Summary Chart', 'annual_student_fees_summary_chart', 1, 0, 0, 0, '2020-03-31 06:15:31'),
(93, 1, 'Employee Count Widget', 'employee_count_widget', 1, 0, 0, 0, '2020-03-31 06:31:56'),
(94, 1, 'Student Count Widget', 'student_count_widget', 1, 0, 0, 0, '2020-03-31 06:31:56'),
(95, 1, 'Parent Count Widget', 'parent_count_widget', 1, 0, 0, 0, '2020-03-31 06:31:56'),
(96, 1, 'Teacher Count Widget', 'teacher_count_widget', 1, 0, 0, 0, '2020-03-31 06:31:56'),
(97, 1, 'Student Quantity Pie Chart', 'student_quantity_pie_chart', 1, 0, 0, 0, '2020-03-31 07:14:07'),
(98, 1, 'Weekend Attendance Inspection Chart', 'weekend_attendance_inspection_chart', 1, 0, 0, 0, '2020-03-31 07:14:07'),
(99, 1, 'Admission Count Widget', 'admission_count_widget', 1, 0, 0, 0, '2020-03-31 07:22:05'),
(100, 1, 'Voucher Count Widget', 'voucher_count_widget', 1, 0, 0, 0, '2020-03-31 07:22:05'),
(101, 1, 'Transport Count Widget', 'transport_count_widget', 1, 0, 0, 0, '2020-03-31 07:22:05'),
(102, 1, 'Hostel Count Widget', 'hostel_count_widget', 1, 0, 0, 0, '2020-03-31 07:22:05'),
(103, 18, 'Accounting Links', 'accounting_links', 1, 0, 1, 0, '2020-03-31 09:46:30'),
(104, 16, 'Fees Reports', 'fees_reports', 1, 0, 0, 0, '2020-04-01 15:52:19'),
(105, 18, 'Cron Job', 'cron_job', 1, 0, 1, 0, '2020-03-31 09:46:30'),
(106, 18, 'Custom Field', 'custom_field', 1, 1, 1, 1, '2020-03-31 09:46:30'),
(107, 5, 'Leave Reports', 'leave_reports', 1, 0, 0, 0, '2020-03-31 09:46:30'),
(108, 18, 'Live Class Config', 'live_class_config', 1, 0, 1, 0, '2020-03-31 09:46:30'),
(109, 19, 'Live Class', 'live_class', 1, 1, 1, 1, '2020-03-31 09:46:30'),
(110, 20, 'Certificate Templete', 'certificate_templete', 1, 1, 1, 1, '2020-03-31 09:46:30'),
(111, 20, 'Generate Student Certificate', 'generate_student_certificate', 1, 0, 0, 0, '2020-03-31 09:46:30'),
(112, 20, 'Generate Employee Certificate', 'generate_employee_certificate', 1, 0, 0, 0, '2020-03-31 09:46:30'),
(113, 21, 'ID Card Templete', 'id_card_templete', 1, 1, 1, 1, '2020-03-31 09:46:30'),
(114, 21, 'Generate Student ID Card', 'generate_student_idcard', 1, 0, 0, 0, '2020-03-31 09:46:30'),
(115, 21, 'Generate Employee ID Card', 'generate_employee_idcard', 1, 0, 0, 0, '2020-03-31 09:46:30'),
(116, 21, 'Admit Card Templete', 'admit_card_templete', 1, 1, 1, 1, '2020-03-31 09:46:30'),
(117, 21, 'Generate Admit card', 'generate_admit_card', 1, 0, 0, 0, '2020-03-31 09:46:30'),
(118, 22, 'Frontend Setting', 'frontend_setting', 1, 1, 0, 0, '2019-09-11 03:24:07'),
(119, 22, 'Frontend Menu', 'frontend_menu', 1, 1, 1, 1, '2019-09-11 04:03:39'),
(120, 22, 'Frontend Section', 'frontend_section', 1, 1, 0, 0, '2019-09-11 04:26:11'),
(121, 22, 'Manage Page', 'manage_page', 1, 1, 1, 1, '2019-09-11 05:54:08'),
(122, 22, 'Frontend Slider', 'frontend_slider', 1, 1, 1, 1, '2019-09-11 06:12:31'),
(123, 22, 'Frontend Features', 'frontend_features', 1, 1, 1, 1, '2019-09-11 06:47:51'),
(124, 22, 'Frontend Testimonial', 'frontend_testimonial', 1, 1, 1, 1, '2019-09-11 06:54:30'),
(125, 22, 'Frontend Services', 'frontend_services', 1, 1, 1, 1, '2019-09-11 07:01:44'),
(126, 22, 'Frontend Faq', 'frontend_faq', 1, 1, 1, 1, '2019-09-11 07:06:16'),
(127, 2, 'Online Admission', 'online_admission', 1, 1, 0, 1, '2019-09-11 07:06:16'),
(128, 18, 'System Update', 'system_update', 0, 1, 0, 0, '2019-09-11 07:06:16');

-- --------------------------------------------------------

--
-- Table structure for table `permission_modules`
--

CREATE TABLE `permission_modules` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `prefix` varchar(50) NOT NULL,
  `system` tinyint(1) NOT NULL,
  `sorted` tinyint(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission_modules`
--

INSERT INTO `permission_modules` (`id`, `name`, `prefix`, `system`, `sorted`, `created_at`) VALUES
(1, 'Dashboard', 'dashboard', 1, 1, '2019-05-26 22:23:00'),
(2, 'Student', 'student', 1, 3, '2019-05-26 22:23:00'),
(3, 'Parents', 'parents', 1, 4, '2019-05-26 22:23:00'),
(4, 'Employee', 'employee', 1, 5, '2019-05-26 22:23:00'),
(5, 'Human Resource', 'human_resource', 1, 8, '2019-05-26 22:23:00'),
(6, 'Academic', 'academic', 1, 9, '2019-05-26 22:23:00'),
(7, 'Homework', 'homework', 1, 12, '2019-05-26 22:23:00'),
(8, 'Attachments Book', 'attachments_book', 1, 11, '2019-05-26 22:23:00'),
(9, 'Exam Master', 'exam_master', 1, 13, '2019-05-26 22:23:00'),
(10, 'Hostel', 'hostel', 1, 14, '2019-05-26 22:23:00'),
(11, 'Transport', 'transport', 1, 15, '2019-05-26 22:23:00'),
(12, 'Attendance', 'attendance', 1, 16, '2019-05-26 22:23:00'),
(13, 'Library', 'library', 1, 17, '2019-05-26 22:23:00'),
(14, 'Events', 'events', 1, 18, '2019-05-26 22:23:00'),
(15, 'Bulk Sms And Email', 'bulk_sms_and_email', 1, 19, '2019-05-26 22:23:00'),
(16, 'Student Accounting', 'student_accounting', 1, 20, '2019-05-26 22:23:00'),
(17, 'Office Accounting', 'office_accounting', 1, 21, '2019-05-26 22:23:00'),
(18, 'Settings', 'settings', 1, 22, '2019-05-26 22:23:00'),
(19, 'Live Class', 'live_class', 1, 10, '2019-05-26 22:23:00'),
(20, 'Certificate', 'certificate', 1, 7, '2019-05-26 22:23:00'),
(21, 'Card Management', 'card_management', 1, 6, '2019-05-26 22:23:00'),
(22, 'Website', 'website', 1, 2, '2019-05-26 22:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `reset_password`
--

CREATE TABLE `reset_password` (
  `key` longtext NOT NULL,
  `username` varchar(100) NOT NULL,
  `login_credential_id` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reset_password`
--

INSERT INTO `reset_password` (`key`, `username`, `login_credential_id`, `created_at`) VALUES
('3327cf4d22df3bfb96ebf852fa3912dc7a99a6ad1899fbdf2c65cf772d33fb897c3345226f42570b81e043bdc586707b7fec97cb5c70b8e3196d6baaa63a2f27', 'iamomerbhutta@gmail.com', '1', '2020-11-20 18:46:07');

-- --------------------------------------------------------

--
-- Table structure for table `rm_sessions`
--

CREATE TABLE `rm_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rm_sessions`
--

INSERT INTO `rm_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('0012e216a88773860805e1e9f76f0a85851e073b', '119.153.188.151', 1612425672, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323432353637313b),
('001a11gk34j5no30ib2mbkns3pmjhgg8', '127.0.0.1', 1606346870, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363334363837303b72656469726563745f75726c7c733a32373a22687474703a2f2f72616d2e746573742f696e71756972792f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('006f62568c143042afbcd743db4c22b07b40fe1e', '101.53.254.132', 1613832947, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323934363b),
('00a7b61eeabcbcdef9f668b40521bbe65ed0eb02', '138.246.253.24', 1610790628, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303739303632383b),
('00bde839ce9f75da2b5a09316117731b7ecaa7a0', '39.42.65.245', 1606580293, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363538303239333b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('01bsfuq64ge2jhb6ctc90mb1ltt1cvds', '101.53.254.132', 1615315817, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353831373b),
('025c124b8112847b43817dbd2437f9bd0b59421b', '54.36.114.53', 1616155042, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353034323b),
('026d19b36ac63dc7ff854e66645ed66c98e1bbd2', '101.53.254.132', 1613835046, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833353034363b),
('028e471c9f24308427c357f9900c23ea1e77d7e9', '101.53.254.132', 1613831492, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313439313b),
('02qcql7052811ehh2j59st7rm4gigu2f', '127.0.0.1', 1605897944, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630353839373934343b72656469726563745f75726c7c733a32393a22687474703a2f2f72616d6f6d2e746573742f73747564656e742f616464223b),
('039hhqu34kh0h1gu81rm8hmlfgmea93r', '101.53.254.132', 1615906783, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363738333b),
('03a9f1a16fa920499468c0099f9cd0d850c59b64', '158.101.115.177', 1614604952, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343630343935323b),
('03fad28a90c01c9a2c518971e98ca22a87d85e56', '163.172.148.199', 1610129311, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303132393331313b),
('03vn1ffie801ur0aua3v93q609fa7csh', '101.53.254.132', 1615903661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333636313b),
('04c1a9d7ffdba0d32e21859a271717fa57f7642f', '54.221.27.173', 1611800188, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313830303138383b),
('04dc0b09bc4f8a5135a95cc68d91a1742c6ec19a', '54.36.114.53', 1616153999, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333939393b),
('053c45b43971bdf3bfd3f37fc1c7327836ab7998', '101.53.254.132', 1613830751, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833303735313b),
('056bbdce1fdbb51079323bc103fadc6fb2769260', '193.123.68.20', 1608501177, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383530313137373b),
('057551923728af5bcb0e8f8868f73ea3eb0e9ba2', '101.53.254.132', 1613833109, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333130393b),
('05e10006cb2a8855625e6155e8443322662ee220', '184.170.252.252', 1609754516, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343531363b),
('068dd20844beb7ac6c4ed44b073fdbdc755eb7de', '5.104.111.253', 1613764263, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736343236333b),
('069311e422a87463c167f687d73ccf47d0190e48', '184.170.252.252', 1609754515, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343531353b),
('069eimn6i1r7htm5d5vbjjclbki7idte', '101.53.254.132', 1615380700, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303730303b),
('06f53991fbab172ccafda081cc9fb3fe4ee74169', '209.17.96.34', 1607770058, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373737303035373b),
('073cc48078f5d2b258eaf64d7fd120f5de270865', '158.101.115.177', 1614614266, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343236363b),
('075839834a7262192841500214bf8ef3b75e7d68', '5.104.111.253', 1613765108, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736353130383b),
('0837f799bcb249f40d2d33f1354332028c681f01', '101.53.254.132', 1613832815, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323831353b),
('083sd54qr7lbp199a7qm08kr2kpiqs7m', '101.53.254.132', 1615369705, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393730353b),
('085b961540f7141b074a6d13630bdc9b4bb29cc5', '54.36.114.53', 1616153434, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333433343b),
('09ca78b940e887768aca926bf8bc2bbaa0c4dfb6', '101.53.254.132', 1613832534, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323533343b),
('09d85dd022677db88a00879996107d9b73ef6ebf', '101.53.254.132', 1613771448, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313434383b),
('0a13umtv8rk1feptgu430m31uv5r9ck2', '127.0.0.1', 1606353477, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363335333437373b72656469726563745f75726c7c733a32383a22687474703a2f2f72616d2e746573742f696e71756972792f76696577223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('0a550ca0ac5e17bfe338de7e2ec26001f867057f', '146.59.225.195', 1613038784, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333033383738333b),
('0a6ukbice1ho7loeitejcc3ohs81m8rj', '101.53.254.132', 1615903407, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333430363b),
('0abdff0610507498f5bb0520d2d0149495400f52', '138.246.253.24', 1611974533, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313937343533333b),
('0b357dce1a8ba7826083026afa26100d638395cf', '138.246.253.24', 1612442262, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323434323236313b),
('0b554a40418d47ea9d1341b21223892424cf43c0', '184.170.252.252', 1609754574, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343537343b),
('0bf5f35928fd87fffc4f9d0f5900712010a67816', '101.53.254.132', 1613832244, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323234343b),
('0c05e7b75364509acf2cdd97de4242e56538d213', '129.213.109.135', 1611901459, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313435393b),
('0c31ca2a9dfe4f53e34d990d1099869cecc09258', '101.53.254.132', 1613832182, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323138323b),
('0c48h3lmudhvfi0pd0kocds27fgeng4h', '101.53.254.132', 1615379253, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393235323b),
('0c7de48f0b4164976de7e795c93870e525998752', '54.36.114.53', 1616153488, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333438383b),
('0c9191b817bda183462ef4e56ce1bbf4b14ef4ea', '101.53.254.132', 1613831894, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313839333b),
('0cfp9kd22gk9vv57n8t1bgm2psd3l2mt', '101.53.254.132', 1615905833, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353833333b),
('0cmblm0hch7d9d7dvlvvvj4n3h9tu0lq', '101.53.254.132', 1615903615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333631353b),
('0cv1meho0dsn2l9dbmi1mkvajka380o8', '101.53.254.132', 1615903744, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333734343b),
('0d2kl1ug0a94r6dtke0t06hlc2oe198b', '101.53.254.132', 1615371918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337313931383b),
('0d3b3b4e438e57512c63dc5fbdeade6c77c406d9', '138.246.253.24', 1614253477, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343235333437363b),
('0d51c9f8e34f683297e22bf0a3c433e2037543b6', '54.36.114.53', 1616153684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333638343b),
('0dcf738546e1a978d84ca3a74e71eb63de01047e', '158.101.115.177', 1614614268, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343236383b),
('0dq0eal7gnjll44h7p3hc417el38p60l', '101.53.254.132', 1615380484, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303438343b),
('0dsojjdloogcbtkn1sfr7o2vdocf38v3', '101.53.254.132', 1615903745, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333734353b),
('0e066e63e375f8d550bf2e0e0521ef77c0c4da93', '209.17.96.194', 1608392243, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383339323234333b),
('0ebb1f7bf87020caa7a450efa543ed575ba2b7e0', '101.53.254.132', 1613833143, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333134333b),
('0ej4de9madltohtvepcmofblrl1gf8kj', '101.53.254.132', 1615906385, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363338353b),
('0equ03589t7am6aliojktse9h22j0lkm', '35.181.112.20', 1615625594, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353632353539343b),
('0f064bbd8bf16409f729f4a073fd4a4c0daa541a', '39.42.65.245', 1606584467, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363538343436373b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('0f4c4e6b4c4641685d3969d06471a7df26cbe7e5', '167.172.23.19', 1609920599, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393932303539383b),
('0f6fv56ahnr9btfcj1vsogn44g6hlq24', '101.53.254.132', 1615903029, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333032393b),
('0f805a2a682df1fa006b16987425a6587cd19e27', '184.170.252.252', 1609754518, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343531383b),
('0fa536b7769d2fbfc6c17443c15ea41ce35019d9', '129.213.109.135', 1611901462, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436323b),
('0febb71672330ed2b85cb46fd5fea3542083009f', '184.170.252.252', 1609754547, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343534373b),
('0ff3c6455c884763b10d9f96eb07695ed18d33ea', '72.255.54.157', 1613595327, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333539353239363b),
('0ff8714962510bc312348121ddd9ef38444c18e7', '185.220.100.252', 1613038786, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333033383738363b),
('0gbvaqjkng5sgjj5ierroebprpf2aa6h', '185.204.1.224', 1615588837, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353538383833373b),
('0ida5gc2e7227inubrqgs85gv9bht94c', '101.53.254.132', 1615380240, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303234303b),
('0j050dr50avlkdtj2hufuodd50qees0e', '101.53.254.132', 1615315728, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353732383b),
('0j9rfmtupq1pp7jq4rge6edjudjb6c4v', '101.53.254.132', 1615906850, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363835303b),
('0jcu62lfeo3heqdst2r2nludeqrudnrq', '101.53.254.132', 1615906540, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363534303b),
('0kdps0dqdpohgtcu8qj58d8u863g45nk', '101.53.254.132', 1615379799, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393739393b),
('0l2pb90a4jl5844uk12k26ipbaik669q', '101.53.254.132', 1615379800, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393830303b),
('0ml320v1cm7uio1h33i72a11r74csuap', '127.0.0.1', 1606484685, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363438343638353b72656469726563745f75726c7c733a32383a22687474703a2f2f72616d2e746573742f696e71756972792f76696577223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('0nnqhj6hqvt90tr81f2tahdc9jvprlda', '127.0.0.1', 1606485487, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363438353438373b72656469726563745f75726c7c733a32383a22687474703a2f2f72616d2e746573742f696e71756972792f76696577223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('0ok1vch18rs5dandqjvve0vke3r62u6c', '101.53.254.132', 1615906936, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363933363b),
('0pi6656r8tdsdp4drbg6s7hgh9rrvkbu', '72.255.54.157', 1615927564, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353932373431363b),
('0poml8042t2otb080kiuqn33l0bh8rop', '127.0.0.1', 1606349608, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363334393630383b72656469726563745f75726c7c733a32373a22687474703a2f2f72616d2e746573742f696e71756972792f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('0ra6jt18q637t0i2a3nq19e0dsl0vdka', '101.53.254.132', 1615906635, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363633353b),
('0st3s1mk8htf30g0jm35f279qdc5cvc4', '101.53.254.132', 1615380424, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303432343b),
('0tnpqgfrba46rnnn1l59ehjv2hp84go0', '101.53.254.132', 1615379832, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393833323b),
('1076de5cc517fcc3b691faf80e0d142ea87cc383', '101.53.254.132', 1613832319, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323331393b),
('109871f8336f59bcacd69e1af2461fc364532665', '101.53.254.132', 1613834597, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833343539373b),
('10b646cc48e80f98802827ad596369c63d644d4f', '101.53.254.132', 1613833067, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333036373b),
('10c3e91cfe52f4a957eb7b67b5dbcc4274f5277d', '39.45.153.20', 1613391421, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333339313432313b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('10j375doljkuqrdsua1diptr50ksbteo', '101.53.254.132', 1615902038, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930323033383b),
('10mepstj3nqknp5mufhkitbomfrddiao', '101.53.254.132', 1615120079, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353132303036353b),
('112nuc7uctb8blhiit500grip1i5elad', '119.160.100.91', 1614645711, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343634353538323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('1146bb0047a34b66e29b3ea5375dc69f9d50f01d', '5.39.64.29', 1614081647, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343038313634373b),
('118qfaae0t9rb97at0ev5pv83bcf38td', '101.53.254.132', 1615903188, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333138383b),
('11ba07632993db4a7d4bfdd383ccad01a70ccd3b', '101.53.254.132', 1613832542, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323534323b),
('122efdeb27581ece3188e32a2e1be393e0596515', '39.45.153.20', 1613391117, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333339313131373b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('12nqki9f9a76dpmfg8ma968p11d84bqv', '101.53.254.132', 1615379975, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393937353b),
('12q3ivb8vi30qf033dcvoe07a25pujgi', '101.53.254.132', 1615369935, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393933353b),
('132nder9c62u65bcq74h8pcsi1unu4il', '101.53.254.132', 1615903555, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333535353b),
('137f36c1d6c3e570195de5b5a65302f83da9f8e3', '101.53.254.132', 1613833057, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333035373b),
('13lg2aq47s3jn56ocsjueg5j25qub78v', '101.53.254.132', 1615907027, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373032373b),
('140d5314fd2aa5cc39af5d9355915d1f6d98846b', '184.170.252.252', 1609754534, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343533343b),
('1414e22855d80a211e9d8593f7bd54162b0f0ff5', '119.160.97.134', 1616158249, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135383234393b72656469726563745f75726c7c733a33393a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f616464223b),
('141o8ul1iv3me7rg46reu0jturpg3rlc', '39.45.10.36', 1615832537, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353833323232383b72656469726563745f75726c7c733a34343a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f666565732f6475655f696e766f696365223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('14d9ff04a4824ad3c6d7761ad525cf554a6410c3', '101.53.254.132', 1613835046, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833353034363b),
('15514065195a7a6b90ce3bbddbb9b9431b4a66a2', '54.169.91.239', 1613960718, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333936303731373b),
('15a1226a00697a9b7b1baa87ee9e5097be272373', '184.170.252.252', 1609754557, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343535373b),
('160b46f523c8c562f010be0561d0a3136484162c', '54.36.114.53', 1616153855, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333835353b),
('16155b177113912573ac39c24678e3737e76fd3b', '5.104.111.253', 1613765055, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736353035353b),
('165869724bcda5cf92ffd9c84d70a44bab675dc7', '193.123.68.20', 1608501178, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383530313137383b),
('167e8db26816f480a405213ba13438203ef93381', '54.36.114.53', 1616155070, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353037303b),
('167f8594a554d177ecdb3520b908f8c2ead5465f', '101.53.254.132', 1613833029, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333032393b),
('1700f338a3d6feacbd4db375111451263d537693', '72.255.54.157', 1614361877, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343336313833373b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('171i55ukj439lrfjrrtth2fl7mf3qrm8', '101.53.254.132', 1615380363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303336333b),
('17933b0a1a09ce612802155276ad5c6c09b55c38', '184.170.252.252', 1609754549, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343534393b),
('17cr8qsh176ddjrb74hjr8c3ke5d47hg', '101.53.254.132', 1615906937, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363933373b),
('17d86be50bd4d5d2484cc2e6efcfde52e9476c62', '101.53.254.132', 1613832722, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323732323b),
('17d86f23c838159a4321e41c9b11129fbe5415c1', '209.17.96.162', 1610091897, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303039313839363b),
('17e48129ea4ae0d057498dbb993652d0e7e483ea', '54.36.114.53', 1616153931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333933313b),
('17oqqb77bjigv1n6aehkpnln3310uqrk', '101.53.254.132', 1615379832, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393833323b),
('1859f57c098ca3bd2b4eb984068651186140b356', '101.53.254.132', 1613832244, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323234343b),
('18a9ac3dad919ae2f4425c17ad953e0ca63e123c', '101.53.254.132', 1613832458, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323435383b),
('18dcdb1101dfac89ab2cc50adae07d3fe5fd0a07', '101.53.254.132', 1613832143, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323134333b),
('18vsavqpj14emid5j58s5ng7u9bj91pr', '127.0.0.1', 1606168425, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363136383432353b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('190e19212eca09fd9f5b534d091bb4563add81c5', '54.36.114.53', 1616153685, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333638353b),
('1913e4b29433b2f72652c4f77fbf45a74a14a97a', '54.36.114.53', 1616153685, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333638353b),
('194c43c2cd809e25a175319b81f59267e826facc', '54.36.114.53', 1616153707, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333730363b),
('19b286fb460909ec0be3f50684589e30ba4ca463', '54.36.114.53', 1616153684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333638343b),
('19f82093b69c16991255529f64fbf6660beb6b50', '101.53.254.132', 1613833109, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333130393b),
('1a3981ddc9f245bb6e21bb2313d0af9f6e13771e', '148.72.211.177', 1613589254, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333538393235333b),
('1a4487d9733a61b8fa46ec02d9e93736443bbe0b', '184.170.252.252', 1609754509, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343530393b),
('1aab4dcca3855af75eabfb89a76c516565caf325', '101.53.254.132', 1613832201, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323230313b),
('1ae9b9192a40ab8022547fe0b6be299946ba37c4', '54.36.114.53', 1616153920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333932303b),
('1ahqvcps6cldb0i6uokoih313jel08o7', '101.53.254.132', 1615903472, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333437323b),
('1bcaecc10f738882e7cba17a4b66c35869181944', '54.36.114.53', 1616155724, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353732343b),
('1bd8c670109396d924bc3823d9f21b8578a0a8a0', '209.17.96.122', 1611127187, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313132373138373b),
('1bv47p321mqvbbkbj12r7tk1oonis3ob', '101.53.254.132', 1615369517, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393531373b),
('1c5462ac63c10a29bf4bb44301d5226ce986da4b', '101.53.254.132', 1613833074, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333037343b),
('1c6jaunc1qeukp2srv8fprdaelj1kqe8', '101.53.254.132', 1615906539, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363533393b),
('1ca64da96ea5e1be17c27fda8da422dac1690fab', '101.53.254.132', 1613683207, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333638333230373b),
('1ccb98506b103371a3fac5c5f5ed00058c813a5d', '119.160.100.91', 1614624605, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343632343536333b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('1cf7527ea49939042400b7efffe41608ffdd831d', '54.36.114.53', 1616153668, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333636383b),
('1d037518fef88b1739048919029c4525a85f16e7', '101.53.254.132', 1613683268, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333638333236383b),
('1d109d92f7e7fa547598287db48968b7d555c450', '54.93.229.100', 1612260169, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323236303136393b),
('1d5ur0dbone9estskat15jqpeji77h8t', '101.53.254.132', 1615380363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303336333b),
('1d61ubohses7d9lfd26mtjhj21l8fasi', '101.53.254.132', 1615376546, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337363534363b),
('1d82cec96ce8a8fbc134638d61a2f86697912ac3', '101.53.254.132', 1613832627, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323632373b),
('1db20dcce8381859ccef942b620b36296d90ffe6', '129.213.109.135', 1611901459, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313435393b),
('1dcc770d1c35fd25c9dc8befb80f3c2c759a479b', '43.245.10.82', 1606656555, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363635363535353b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('1djnifem2t73j4ie9geaihnt0pbd5u6k', '72.255.54.157', 1615927355, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353932373130353b),
('1dk4h3dti7vlhk15smmsbdc01i773im8', '72.255.54.157', 1614717512, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343731373232373b72656469726563745f75726c7c733a34353a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f70726f66696c652f36223b6e616d657c733a31313a2251616d6172206a61766564223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2239223b6c6f67676564696e5f7573657269647c733a313a2236223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('1e53bt2jsgit3ca0na72uc1qspef73ju', '101.53.254.132', 1615906783, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363738333b),
('1e808e0be3a0cc546de755a68083f6511cef9fab', '101.53.254.132', 1613834597, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833343539373b),
('1e8600b286058360e2040259d18b33eb77f71f22', '101.53.254.132', 1613682331, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333638323333313b),
('1eab8kgajo644vka4c9ogvaihj8peh98', '101.53.254.132', 1615316721, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363732313b),
('1ebbc3a60d7edb3dcca05c4b74c9abd7f2eb2591', '101.53.254.132', 1613771661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313636313b),
('1edf9a78fdc7146003b8b92331904d9204d31cd9', '193.123.68.20', 1608501176, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383530313137363b),
('1f14f968ef6744ad0496806f34dbe949b1c197b5', '101.53.254.132', 1613831670, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313637303b),
('1fa45cf3615be95df1f63ca9451ad636a348d90e', '39.45.198.56', 1613333341, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333333333334313b),
('1faf4vlinsjq1bu804gve5cj1he13rct', '101.53.254.132', 1615380227, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303232373b),
('1fcea24bdc81c772035cb218d893f3bbf755c4ae', '34.248.10.44', 1608202471, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383230323437313b),
('1fdd9b15abe5770ee7f4a64abc11ca98e2728930', '72.255.54.157', 1613594659, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333539343635393b),
('1fkvujc6bdnvhn545oe0haj3tcid86va', '101.53.254.132', 1615906557, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363535373b),
('1h17m47f4gbuhuod0qf6709purs4cbm0', '101.53.254.132', 1615380348, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303334383b),
('1hbv243k4814211t74mvc6265gj2gjg4', '101.53.254.132', 1615906763, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363736333b),
('1ig2jetm2jb7jbonjqnjupgscsg38e7n', '101.53.254.132', 1615903744, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333734343b),
('1imjq7vnqqeae1litbkeqbbrqv79736k', '101.53.254.132', 1615905856, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353835363b),
('1ioimacfdqmo4viu2u6kibn42jcjbhbp', '101.53.254.132', 1615369550, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393535303b),
('1jchcllgqp63iilihjv4oeuqtat6crcp', '39.42.112.51', 1615127746, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353132373535373b),
('1jh5atpojv0dg1kqkq7ehdt99rnb7eer', '101.53.254.132', 1615907025, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373032353b),
('1krtr1mepoqp0jgpeer1nv054dn5sn7t', '101.53.254.132', 1615907035, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373033353b),
('1l3600qm9gq9664nf3mppghllhkifpq5', '101.53.254.132', 1615906713, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363731333b),
('1lf8hljam8lmuqnlljs8iufbfkk0p0dc', '101.53.254.132', 1615906557, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363535373b),
('1m9skmu61pv575s4j0rvq1o4p6qv9lct', '101.53.254.132', 1615903661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333636313b),
('1mu73gvsuq0kfanorg9r3d3s4u5u5s6r', '101.53.254.132', 1615906800, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363830303b),
('1n5ml32flsefa2n49o66g67f02v7dk9r', '101.53.254.132', 1615371641, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337313634313b),
('1nei3u08283in4kh7c9dln8grkj90vb8', '101.53.254.132', 1615905641, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353634313b),
('1nhau8schgr8ft1lpd71g0ah9omu1fbq', '39.45.10.36', 1615897299, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353839373239393b),
('1p4hji4m8vpm8rg0ds41q62qn3dn0tup', '101.53.254.132', 1615380482, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303438323b),
('1pe97fmt1pa7r11matv732qjgong5g5q', '101.53.254.132', 1615906517, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363531373b),
('1q7b9497kpff7q7toak5toqbp4psh7nq', '101.53.254.132', 1615907034, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373033343b),
('1q9emhr2k5lfeenc9gu0ek090k0hgbf5', '101.53.254.132', 1615192621, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323632313b),
('1sadj6g4u8389jvbd4rj73iki26ou8gg', '101.53.254.132', 1615321395, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353332313339353b),
('1sg3migevher4lfkdmavf8defe04ncmc', '101.53.254.132', 1615906763, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363736333b),
('1si95gh2rrrptpec5ek7s2i3thrl24b2', '101.53.254.132', 1615903616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333631363b),
('1soiqjva459j8rr2gen6hm6eogc6pvd9', '101.53.254.132', 1615379606, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393630363b),
('1sqdrjhbv96soss3tmev1b2apts3bpl1', '101.53.254.132', 1615368092, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336373930363b),
('1t08ho7puafthhr1p4geupd45blqt551', '39.45.10.36', 1615834882, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353833343836383b72656469726563745f75726c7c733a34343a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f666565732f6475655f696e766f696365223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('1to16pavdmm5m5pvc0nsknb7vjqnlrlq', '101.53.254.132', 1615903438, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333433383b),
('1u9t7h2in632dd01rg56956eihvln8mf', '101.53.254.132', 1615903662, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333636323b),
('20003ee92946b8a81a6cd65c2145dd4aa909758a', '62.210.113.228', 1610296439, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303239363433383b),
('20c378fd72532e8ee498affc35302ca272232cc5', '129.213.109.135', 1611901465, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436353b),
('20cc27d52ed576194a3fe812c6575130b65ab68f', '101.53.254.132', 1613831638, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313633383b),
('20edde740e12c1b971f4acafe77599834d873a9f', '39.42.65.245', 1606580898, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363538303839383b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('20jt3i6o0mnsm9keljk9fq3t8vi22bmt', '72.255.54.157', 1614720079, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343731393839333b72656469726563745f75726c7c733a34353a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f70726f66696c652f36223b6e616d657c733a31313a2251616d6172206a61766564223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2239223b6c6f67676564696e5f7573657269647c733a313a2236223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('210a1a4ee9c8f602b741b4ea5a11b44b05c6b5af', '100.26.251.213', 1612951041, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323935313034313b),
('2129ad2c836f655a8c8c415b4a6b0d83bd474b01', '54.36.114.53', 1616153669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333636393b),
('216f18eeaad7e42619e48c53842257c1a5840b2a', '54.36.114.53', 1616155744, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353734343b),
('216f565fe63f78bfd040d1d99bc9db232090bc46', '101.53.254.132', 1613832190, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323139303b),
('221ca7ce484a01aba8a498da8ea5f6096e81abd8', '5.104.111.253', 1613766135, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736363133353b),
('22b220dccb477e01ac5d2766eb02e3fc5f30d889', '54.36.114.53', 1616155744, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353734343b),
('22ec9139db093209cbfa7589a5c8454ca61353a6', '54.36.114.53', 1616155745, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353734353b),
('22fc289f5a5e7bf866b74ef3d12ad8afd6db5d06', '23.102.70.47', 1611285117, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313238353131363b),
('22nm9uruqb1p4kpv5envtc5kiaci8bf8', '101.53.254.132', 1615903709, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333730393b),
('22ocp2lbmfsovovb7u848ilmfn5gv8ip', '101.53.254.132', 1615380279, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303237393b),
('23161b301ad9deed4907d25e2dc2fb9a828f2da4', '54.36.114.53', 1616153996, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333939363b),
('231gg842e5vhr229i0ll1nhcsqplpap2', '52.192.73.251', 1614773165, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343737333136353b),
('23eb786197ab2bac2d9e1a053be99b905ea36eca', '54.36.114.53', 1616153769, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333736383b),
('24279ed8o8h0r6ndu1vr1oaghnvjts6h', '101.53.254.132', 1615906973, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363937333b),
('2433f3b915b4997be546990abda9b28bba336330', '188.165.210.14', 1612961362, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323936313336323b),
('246gg6vjlpti6ue07qfk33qplb8hbsa0', '101.53.254.132', 1615316482, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363438323b),
('24c1a2e7d49aff0dd6bccac78e4b49d480249027', '54.36.114.53', 1616153494, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333439343b),
('24c8d777db1d8563e83e154d28865d127b4dd7e4', '101.53.254.132', 1613832997, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323939373b),
('26p8uf8hrh0hs21ldtki7atn9vm6keij', '101.53.254.132', 1615903189, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333138393b),
('270cafd0e9bcc5bc640589718d4027c559a75224', '39.45.173.81', 1612954890, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323935343736393b72656469726563745f75726c7c733a33393a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f696e71756972792f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('2722ff7d198f2bd3716adf8412db5f0e3095c792', '101.53.254.132', 1613831835, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313833353b),
('2746hs5dc9jco382stqsah00bqau4dch', '39.45.176.96', 1615163356, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353136333135373b72656469726563745f75726c7c733a34343a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f666565732f6475655f696e766f696365223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('276f89d2d661c6eaf11f250d14e0015c5362a49a', '101.53.254.132', 1613832340, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323334303b),
('27731fb293d356ca520bf10885179089374d9d75', '35.180.147.121', 1611991200, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313939313230303b),
('2780ce445ca2efde8ce08f75fb2db716fc131fa9', '101.53.254.132', 1613831410, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313430393b),
('27b7t8qr9sddskjnubuk82g8musi51jp', '39.45.176.96', 1615165721, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353136353432333b72656469726563745f75726c7c733a34343a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f666565732f6475655f696e766f696365223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('27ec234535d5fa4959eaf440e84aef4e4f1b1bdb', '205.169.39.20', 1608847087, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383834373038363b),
('280d4e8afaed98be856e732904a37dd6fbf4a295', '101.53.254.132', 1613682822, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333638323832323b),
('2819533cb523b003f472f7ae5088ee7b7aa63294', '142.93.35.169', 1607778783, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373737383738333b),
('284df1a5ca4833e61fc2b0ddf16f4ed9ef0ebc55', '5.104.111.253', 1613766029, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736363032393b),
('284e853b740f1ff25812089272c67d0a716626e6', '35.183.26.176', 1613691403, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333639313430333b),
('286c490bcc4d48e568ed3ad08877e35eeffa29e1', '54.36.114.53', 1616153494, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333439343b),
('2889e169e6d6288a6b721a4a7fec9911974ff68f', '72.255.54.157', 1612374140, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323337343134303b72656469726563745f75726c7c733a34303a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f696e71756972792f76696577223b),
('288ee1d26ba3cdc6d0a64f11ba7861abedad1ed0', '184.170.252.252', 1609754538, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343533383b),
('28b87c75c396881070f008a82673331b0c705787', '72.255.54.157', 1612336645, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323333363634353b),
('28f85c28597b7d34db014653b25ba141bc751229', '101.53.254.132', 1613832157, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323135373b),
('296fd277c002f3e129ae15982bc4c769c7f29619', '184.170.252.252', 1609754511, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343531313b),
('29c3e230684f66ab32d713b917bf339bdc7876dc', '134.122.70.55', 1609696416, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393639363431363b),
('29ffce44d15a64b1896e372bf331c42394088ecb', '39.45.212.243', 1614643798, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343634333739383b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33393a22496e666f726d6174696f6e20486173204265656e205361766564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
('29r98pcipm05glkgf1ep9s4spgi35rtu', '101.53.254.132', 1615369454, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393435343b),
('2a69857558b6180e22cf4bf1d7d3b14db6410f2a', '72.255.54.157', 1613592698, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333539323639383b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('2abd03eb657b28399bfb7d0570068c6ecd486a37', '129.213.109.135', 1611901460, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436303b),
('2ad22a82849ec1f77248ceb2974cf27e667c7ee1', '40.78.153.184', 1614247457, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343234373435373b),
('2ae9euq3k8j7nbfcvh2f2j8273u64jpb', '101.53.254.132', 1615315498, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353439383b),
('2af3195q79piuvtvv800l76q6hi2378o', '72.255.54.157', 1615400140, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353339393839303b),
('2aorgdl33hdifkdfme0rqsnsqtjss0hn', '72.255.54.157', 1616094624, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363039343339353b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('2b233bfaa5ba1a7c976d3c06f2d8467bcba8156d', '101.53.254.132', 1613831537, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313533373b),
('2b408db1039e294448bc4a939768e800d0e74fe0', '39.45.244.218', 1612563908, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323536333833343b72656469726563745f75726c7c733a34303a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f696e71756972792f76696577223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('2b4fe629908af1e19bd7bb7dab04730908391ea6', '101.53.254.132', 1613771661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313636313b),
('2b7732df05c37039364248d2be8e1354547afec3', '51.89.228.159', 1612388472, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323338383437323b72656469726563745f75726c7c733a34303a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f696e71756972792f76696577223b),
('2bc1b51301191f314f2552df6758f39083e51ed5', '101.53.254.132', 1613682429, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333638323432393b),
('2bmrilnr77jtuhp01u6ts6pcq73hk5ub', '101.53.254.132', 1615380227, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303232373b),
('2c24bddd2b54712fe1c050ea952885b6e8d4642b', '101.53.254.132', 1613832276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323237363b),
('2c82fecd62f66af8b945813f77464ec15d09f846', '39.45.212.243', 1614644649, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343634343433353b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('2cd365bd8f77b64bda9254908a9490cb1ebe1783', '129.213.109.135', 1611901464, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436343b),
('2d280c8fea1369f3ba9e238ba08162a16162ca65', '103.95.14.19', 1608542117, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383534323131373b),
('2d6fl0rj20a00c0neaoh3rb78vj7lega', '72.255.54.157', 1614720200, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343732303139393b),
('2e51d3a227ebd0a62851b5e7a0e1b530ea49ac6f', '54.36.114.53', 1616155059, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353035393b),
('2e5491e7b7e45e5fcdc7d3cb521abced90a85f2c', '39.45.212.243', 1614644124, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343634343132343b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a34313a22496e666f726d6174696f6e20486173204265656e2055706461746564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
('2e9951825c3b55d63e1fe140133d7587aef53196', '101.53.254.132', 1613832608, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323630383b),
('2ecd040793c44a954ca704d92f79dcba38ba4de4', '184.170.252.252', 1609754528, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343532383b),
('2ecoshafhpp3kk95r84lpug2tve9s2ae', '101.53.254.132', 1615905763, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353736333b),
('2eda6af5e953817cfe73c2fa18ff1b5c46a214aa', '5.104.111.253', 1613764678, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736343637383b);
INSERT INTO `rm_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('2f003f788c3e8cb902db69829768e663fbb01c70', '101.53.254.132', 1613832986, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323938363b),
('2f51ce47419ecc907534d208cc53e1cc7e93ed52', '72.255.54.157', 1612461041, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323436313030323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('2f5d6c3eea014dc2e01caee8aec0131ef1985181', '101.53.254.132', 1613835287, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833353238373b),
('2f9b2e9deaa59d6e8b9db6b7eb593ff83bea7198', '72.255.54.157', 1614634162, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343633343136323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('2fa0e9b937af050bc395557b766df97646842eee', '101.53.254.132', 1613831491, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313439313b),
('2h2h8k51epqtq0ieb5fecbov98q507gj', '101.53.254.132', 1615906529, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363532393b),
('2h63iqtt2sgh06dlarrt7b0hlpklsrhg', '101.53.254.132', 1615903119, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333131393b),
('2i0sb5lsrgjprct088khc5n1hm4ol4bd', '101.53.254.132', 1615379250, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393235303b),
('2i6hfvnuukqhvu74b75t5e6m922b95sl', '::1', 1606347504, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363334373530333b72656469726563745f75726c7c733a33323a22687474703a2f2f6c6f63616c686f73742f72616d2f696e71756972792f616464223b),
('2i7lkh4thuqu11510bglj7krfg7kp76g', '101.53.254.132', 1615380389, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303338393b),
('2j6lmiu7kkf6l56r1tbf3q1qknm35qkc', '101.53.254.132', 1615906713, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363731333b),
('2jpmu98nq48vtg7nl2un0cdp50vv4po9', '101.53.254.132', 1615905857, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353835373b),
('2jvk3q3f550petedracek5fgv1f9s0p2', '35.181.112.20', 1615625593, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353632353539333b),
('2mp414cfat8qutj83c6pap5japopp480', '101.53.254.132', 1615903109, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333130393b),
('2mqkit4d4tfounc41oh8ovgloaj29car', '101.53.254.132', 1615315152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353135323b),
('2mtv54mna5nbu3l39dvcfskne25rkpba', '101.53.254.132', 1615903661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333636313b),
('2nikearjnkpih2n99uuc7v308l4sc6k1', '101.53.254.132', 1615371918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337313931383b),
('2nola85cqoe9tiol0cf6mtqto95c7g7n', '101.53.254.132', 1615906575, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363537353b),
('2pam1snhq69cacjgkt734d81rvpd39fg', '101.53.254.132', 1615903437, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333433373b),
('2qdj7pg3usbckh8629i0mooujhf5s1n5', '101.53.254.132', 1615316469, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363436393b),
('2qiiip3s4rkgnb2gv01t0n7csgbqpbjh', '101.53.254.132', 1615379581, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393538313b),
('2qmtt4sboc8j6tmu0f53oput04proh2l', '101.53.254.132', 1615316796, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363739363b),
('2rqkm71vkrss4ui3h9honkoneub3su46', '101.53.254.132', 1615903189, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333138393b),
('2slm5l1ekm5d06uelhhmgmo4kqkobj5m', '101.53.254.132', 1615903745, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333734353b),
('2u9l3l4vsanhc3ab10on5sp64k28jajl', '72.255.54.157', 1614717219, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343731363935393b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a34313a22496e666f726d6174696f6e20486173204265656e2055706461746564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d),
('2v65ge2hg7cijs534rpl4n18lghpnaos', '101.53.254.132', 1615380227, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303232373b),
('30b98364827ebecee997205638ba0388aaa6ee0b', '54.36.114.53', 1616153727, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333732373b),
('312e2bf09fc9803812e65520b2ad7420032bae7b', '119.153.188.151', 1612425691, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323432353639313b),
('31399b9f7c1d2909a9f31acb25177d9148e5020b', '39.45.212.243', 1614641418, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343634313431383b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33393a22496e666f726d6174696f6e20486173204265656e205361766564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
('31748fb95bbb32d563b70bc64e7f3e6ad5cc6e87', '54.36.114.53', 1616153777, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333737373b),
('319486deae112d93b142084a594546a80db1a530', '101.53.254.132', 1613771415, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313431353b),
('31acb5a2eafa316146df32f648fe7c169635f2c8', '34.236.202.207', 1613980880, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333938303838303b),
('3210e163e127155ea2cac20bd0fe9d387faef71e', '159.89.48.237', 1611162078, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313136323037373b),
('32e0ba1208ad1c834797eeb7fcdb4e9c545bb363', '208.109.53.185', 1613837418, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833373431383b),
('32f761cc720b00435a6235fddd30a6c1b7bc89e2', '172.241.112.1', 1606516105, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363531353938303b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('32nvr56li02dbj60bnv3iojjeunb61i0', '101.53.254.132', 1615907035, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373033353b),
('33057d7eb563aa733b5f11b155ef7088b8d86ca4', '35.183.26.176', 1613691400, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333639313339393b),
('330la2mc098coc34sfo1lnvuoe4ttasg', '101.53.254.132', 1615906988, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363938383b),
('335a655dfa7e4835a9e71d009929900d5b64220d', '103.95.14.19', 1608542112, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383534323131313b),
('3372055a658612bbddd4bcba7ef29e011b5fd40b', '39.42.65.245', 1606584467, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363538343436373b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('3395ac1df60fb9f0bd64fd13f146e5919149eb79', '101.53.254.132', 1616156105, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135363130353b),
('33a9285d2c2ee28a480c26f8a6be07e9f021a0bb', '101.53.254.132', 1613771588, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313538383b),
('33aefa818b87a51ef00baf5f4ad9a4c3697ea141', '39.45.43.236', 1612436565, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323433363536353b),
('33d4e486a0efd9ab2f0b4e742bff99ddda73c008', '184.170.252.252', 1609754520, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343532303b),
('33f8692a739a160f9325469d49d2b9c3404ad13b', '184.170.252.252', 1609754551, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343535313b),
('33q8d194jl7vkruojj71gm2g1tfciv59', '101.53.254.132', 1615370780, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337303738303b),
('342f33fb4dd82e8111190ba9851f4ca4d502da8b', '51.15.191.81', 1611823336, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313832333333363b),
('343c1f1e7976898265ee97d0126f2dd4d7a5d194', '106.53.83.56', 1610664267, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303636343236373b),
('348a257baa8d159526c184f3b042ce617dc7e042', '101.53.254.132', 1613832153, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323135333b),
('348g090g2jribbfr2k501tg3tvdnsgrm', '101.53.254.132', 1615903078, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333037383b),
('34a1c3eeac83e9224ed6839e4f391fa1b91083f1', '193.123.68.20', 1608539512, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383533393531323b),
('34bd4194e94cff5a697eca85dd98ff5a6a1bba5c', '54.36.114.53', 1616153769, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333736393b),
('34c94549d4a19d0cdd99fc5a3a9742b637d64c4f', '158.101.115.177', 1614614276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343237363b),
('34e07679bbe45a720e5e4bae1ab3f08549fe0375', '54.36.114.53', 1616153728, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333732383b),
('34etrg3ekitb14kcb0n8ivohi7kiepc9', '72.255.54.157', 1614699113, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343639393131313b72656469726563745f75726c7c733a34303a2268747470733a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f616464223b),
('3501e48867bed2060c8a42011e994771b64f94b2', '101.53.254.132', 1613832833, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323833333b),
('35f419517c5a633455084e64ddaa5acc4f5f7cc2', '54.36.114.53', 1616153685, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333638343b),
('35fc6c6d5e24735db76eb17827733a93f9048db5', '101.53.254.132', 1613832230, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323233303b),
('3653682150ad9aca3c7fd251d8aba48b3bef7b4c', '101.53.254.132', 1613827923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333832373932333b),
('369052ba40c31ab5fcd1e9fbb551c428ae6057d6', '72.255.54.157', 1613593931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333539333633333b),
('36hknuebp2stgemq0oq5jkm6g9eb8c8i', '138.246.253.24', 1614983364, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343938333336343b),
('36hqh0musa4p7ip07rpnl9td6eens54s', '101.53.254.132', 1615380279, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303237393b),
('36lbo1dniipr06thq551a1tj8jehgp4d', '101.53.254.132', 1615192639, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323633393b),
('3746e7cdb1f891541b18485820fd3059d55762c5', '5.104.111.253', 1613767119, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736373131383b),
('375224a86d2eb112f6398adb30eb34128f0ed57d', '54.36.114.53', 1616153931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333933313b),
('37583b2d12a37a74c8587979fde0b68f2ed2a99e', '54.36.114.53', 1616153996, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333939363b),
('37983f7458b1631fbcd9a14899788e89ca516c50', '72.255.54.157', 1614361933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343336313933333b),
('37a274638acda70485bb9ac1faed9aea51c76414', '3.0.115.255', 1614403968, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343430333936383b),
('37b6907a1d94d4ebf9a0caad67b6bed359e19ece', '101.53.254.132', 1613831731, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313733313b),
('37c1826f524c651958e7b9732f4ad4c3b5cf54a6', '72.255.54.157', 1612373742, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323337333734323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('37d9a3603dd4185c468aa921caa1cf41fc39d3f8', '101.53.254.132', 1613830751, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833303735313b),
('3835aaaab61eb40b2c263456e6a77a7762ed9546', '101.53.254.132', 1616156106, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135363130353b),
('384avh1dcgvdqp8a90pueff0gri34hat', '101.53.254.132', 1615903132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333133323b),
('38cd847f1fe753513c343a67120c023a64847ba0', '72.255.54.157', 1613593423, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333539333432333b),
('38det8osigvtrgakg91p2qf04ibqh5vp', '101.53.254.132', 1615369516, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393531363b),
('390c53e46decd03122945242ad83d8ce1514a25e', '43.245.10.82', 1606655492, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363635353439323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('39171ebf0ea4a3c3c03257746e2b22e2f75005c2', '101.53.254.132', 1613832602, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323630323b),
('39ace4e5697818996e31e90aad924bd6581babb6', '101.53.254.132', 1613831714, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313731343b),
('39d650e1e6952cf0974b3a73ee8587f7a2e2987e', '158.101.115.177', 1614614275, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343237353b),
('3a016f5b511177dfabf6bc5e9b5a17b6f0e3b750', '212.47.251.118', 1610592003, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303539323030323b),
('3a0bc53c29766c2d9037a19c0f4a255f14c92049', '101.53.254.132', 1613827872, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333832373837323b),
('3aa954135a8ce24d8699f18136489ca63a198d63', '101.53.254.132', 1613771199, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313139393b),
('3ae4694fe7e936a8c565cfe2943469c629cc2523', '184.170.252.252', 1609754523, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343532333b),
('3afvltnqlmgsth79l0433au3vq9k8dps', '101.53.254.132', 1615313113, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331333131333b),
('3b52f6cafbb7e00a1e5bd7b87027619abb9a5b41', '54.36.114.53', 1616153442, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333434323b),
('3b611fc195ad06b03234501478de04f351dc1944', '101.53.254.132', 1613833188, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333138383b),
('3bcb068698e4c40efafad48bccf8ebf593d7aa2a', '138.246.253.24', 1613799889, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333739393838383b),
('3c1abd57c509300619742e33bce95b1a84eeeca4', '101.53.254.132', 1613835287, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833353238373b),
('3c95226f7811b49b92921bbf884e23d6a892bc72', '101.53.254.132', 1613683304, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333638333330343b),
('3cce345436dd367b0350df9c88abb27928861252', '162.247.72.199', 1613038785, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333033383738353b),
('3cf15333283ea1042a948d271c36bd9a1de74dd1', '54.36.114.53', 1616153684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333638343b),
('3ch3c1jcdmjuc0uc88dbc0t3bh64t86l', '101.53.254.132', 1615906841, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363834313b),
('3cifa8kf4b1jpliljgs8sqjjasbquca1', '101.53.254.132', 1615903745, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333734353b),
('3cqdhkfao8bnccpuofou2e2lhpvc8obb', '101.53.254.132', 1615316358, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363335383b),
('3d2c215795f712574bad075febbad6079af433bb', '101.53.254.132', 1613833009, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333030393b),
('3daf346f8beffe84ff3a004dcef413ac7b0c0c6d', '54.36.114.53', 1616153999, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333939393b),
('3de174b931bc8196984d7da4e869bdadd47698c8', '101.53.254.132', 1613832458, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323435383b),
('3e0f3f2923cb6b893f2c7d0e971da8c7be49beda', '101.53.254.132', 1613835287, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833353238373b),
('3esdapoa72nece1kngc6dt6ov6rhvcnv', '101.53.254.132', 1615315728, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353732383b),
('3f0dc8d95addd1e88b1aee8b751ccfb2b8489fe1', '184.170.252.252', 1609754539, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343533393b),
('3f1c597e2294e16cbbc85acea87012849dae3f0c', '101.53.254.132', 1613832933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323933333b),
('3f6a3458004820b2fc74a2384f9681730e47f377', '138.246.253.24', 1607645364, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373634353336343b),
('3f88d0978fa90adbaeeb9af7fadf2ea76e6f1b8a', '101.53.254.132', 1613771071, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313037313b),
('3fa5504f7dcbc8b3311c94c896a478434161dc18', '40.78.153.184', 1614247457, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343234373435373b),
('3gtdjktc6sgin7tojv4dhembr1j49l79', '101.53.254.132', 1615905832, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353833323b),
('3imglk1arehuls1ng5kof115tr7cnj7k', '101.53.254.132', 1615906989, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363938393b),
('3j08dsaeo5ejil27tsbkns3h3h9n4ft6', '101.53.254.132', 1615906615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363631353b),
('3k53bip750htbt0l4f5kjdeq3tbqpn0a', '101.53.254.132', 1615316765, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363736353b),
('3k92bmjcsc6qmd3omvob33mcmb6btflp', '101.53.254.132', 1615380663, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303636333b),
('3lccoicor6i4oblmq16e8edoodu6p6vq', '101.53.254.132', 1615906764, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363736343b),
('3mm0rk52pq7c6lv7qjqum67pau808t59', '101.53.254.132', 1615312742, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331323734323b),
('3onpvfvda8pbun5o6gd4pi0579ua2ifp', '101.53.254.132', 1615906695, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363639343b),
('3ot7a78vg8p4doots6re1ijj03m06ihr', '101.53.254.132', 1615368994, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336383939343b),
('3pfvq2hlv9lde8dnnh0q56pl7d31li3d', '101.53.254.132', 1615317109, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331373130393b),
('3qcc0eq0vpd8ec8hhpjd4pqkh69q30lf', '101.53.254.132', 1615379987, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393831323b),
('3r0gmu5t63bhdkb0qn481uq0d7odali8', '101.53.254.132', 1615906696, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363639363b),
('3r6vj6lm3d12vu78n25d8ega2sc7j8qt', '101.53.254.132', 1615315858, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353835383b),
('3s9t21ju6acv6hk4456h3qs036m5g047', '39.42.73.202', 1614722874, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343732323837343b72656469726563745f75726c7c733a34353a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f70726f66696c652f36223b6e616d657c733a31313a2251616d6172206a61766564223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2239223b6c6f67676564696e5f7573657269647c733a313a2236223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('3t99d28ju5s3t7d3a6in83360ua6kin0', '101.53.254.132', 1615380335, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303333353b),
('3uddb2s1vefd35r4qiv3cqjm427fjvsb', '101.53.254.132', 1615906547, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363534373b),
('3uflelu9hssckjmgod0qedptf6jd3g58', '127.0.0.1', 1605898206, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630353839373934343b72656469726563745f75726c7c733a32393a22687474703a2f2f72616d6f6d2e746573742f73747564656e742f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('3uknu69lrut36o36c1603q8fi517fdlk', '121.4.251.221', 1615221884, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353232313838343b),
('3vaglpn3gamgkk101pijsr8mutnpi6p0', '101.53.254.132', 1615380227, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303232373b),
('4000a0814547316ff421e37e701133ebd1bfb547', '34.242.196.17', 1612375180, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323337353138303b),
('403d4322ad0c92f4a67bb65f2261f7c511d382b0', '101.53.254.132', 1613763453, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736333435333b),
('40d4974232af1be7f6c10a0bcd676dfad98a9283', '138.246.253.24', 1609510367, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393531303336363b),
('40l5mk7kqmv967p1uf2imqv9urfrbvg2', '101.53.254.132', 1615903029, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333032393b),
('40mg1de4vv9dgm02983bc4e0ihgk5v2t', '101.53.254.132', 1615371900, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337313930303b),
('41612cef49ea257273ed89eaa196001c0630d3a5', '101.53.254.132', 1613831537, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313533373b),
('4179dmpr3sr7osbrhab467em2f6avavn', '101.53.254.132', 1615380668, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303636383b),
('41cfa44a617a1b34ddf347ba0693bb6213c99d7e', '101.53.254.132', 1613771588, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313538383b),
('41f149ec324210da04e633b44de7d3ae948585ba', '54.36.114.53', 1616153707, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333730373b),
('420fvkf022hj1kguv0o5l1f4fbfrnh50', '101.53.254.132', 1615907035, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373033353b),
('421863a1ac3646b618b58a6c76ad124c53302fa3', '101.53.254.132', 1613832118, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323131383b),
('42427c9521c076a42db33ce69adc56b58d2cfdf9', '101.53.254.132', 1613833147, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333134373b),
('426lspeoqqc1fasb1ruu5ea54k8k2s9i', '127.0.0.1', 1606351517, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363335313531373b72656469726563745f75726c7c733a32373a22687474703a2f2f72616d2e746573742f696e71756972792f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('4303ddb33a3e4c28039f5b389bd9676f17d83660', '184.170.252.252', 1609754550, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343535303b),
('43137f00bdcd54ab06f670edd7097682bd3b748c', '138.246.253.24', 1610767125, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303736373132353b),
('432iet5urhai93slkkq9vekoqi68agsc', '101.53.254.132', 1615906695, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363639353b),
('4346156544be5f68bc4b6468309ad8f7fb2f4281', '101.53.254.132', 1613771440, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313434303b),
('438aa6b5f906fcf4396203e98c4e17589a7c29c1', '101.53.254.132', 1613831835, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313833353b),
('43r4nrj32di8tkdmdhcdjqe15ognfc12', '39.45.212.243', 1614685228, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343638353232383b72656469726563745f75726c7c733a33393a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f616464223b),
('4409494f5c69d583417e096172d467f4bde957d0', '101.53.254.132', 1613770527, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737303532373b),
('4466484095db6f398b19229b1ae20550844839ae', '62.4.14.198', 1611984970, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313938343936393b),
('448c169bb963f13b0f77c35cb7517bee84eb03e0', '101.53.254.132', 1613832167, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323136373b),
('44eeeda6cda176853479167648545bf2e5ce8bc1', '158.101.115.177', 1614614264, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343236343b),
('44vhmhfpf12dl5dgoktr2lucb8q9li8b', '101.53.254.132', 1615316604, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363630343b),
('4542edfd01cf04aabda0863959fb2fa0b15d217e', '39.42.73.202', 1614645980, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343634353837373b72656469726563745f75726c7c733a33393a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('45d129f20b81cca701caa6d9089798c59fc2fe66', '101.53.254.132', 1613831492, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313439323b),
('4618bf81a16a42153fc928d284782d5633c31efe', '101.53.254.132', 1613834828, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833343832383b),
('464ac984b8c285fbfe893a5268efd115a5cf32a7', '101.53.254.132', 1613771402, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313430313b),
('469e978e6e3b24aacd44def7208f2822bbdc7942', '101.53.254.132', 1613770069, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737303036383b),
('473b6142554441cda579169e813223e1262c96f3', '129.213.109.135', 1611901464, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436343b),
('47514b960c38a3e5e582a0b515d639fca95fddac', '101.53.254.132', 1613682731, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333638323733303b),
('475e3f212f1e5da4b8c609a98952e6a80b05a313', '101.53.254.132', 1613832174, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323137343b),
('4763c1dee76a10b55b0f3d4fb15d76813a2157fa', '106.53.83.56', 1610664269, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303636343236393b),
('47ef4cb19ef82d731229d0c698d7c70c564af517', '184.170.252.252', 1609754524, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343532343b),
('47l7qls0jf7a9n9lsphp9468lplgd81o', '101.53.254.132', 1615380229, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303232393b),
('47rmqi2lnsh7u4ndio0d8bheri8sn7i8', '128.199.122.54', 1615828925, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353832383932353b),
('49228a0c10e03166e1203e87bebec983db7ea629', '138.246.253.24', 1607769249, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373736393234383b),
('49340a073eac91d0fd3f1cc656ce9775c98845b2', '138.246.253.24', 1613166319, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333136363331383b),
('49c446d5f4bc659ee6f0ef7a84e599f7c5c26807', '193.123.68.20', 1608539513, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383533393531333b),
('4a27c9caccb917a15f4a21ca0dd887e37d0b6123', '184.170.252.252', 1609754573, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343537333b),
('4a2ed4afd0042d7fd7fca5109478c932725026b7', '101.53.254.132', 1613832946, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323934363b),
('4a5df8cca963950c452112999716bc298c182a12', '193.123.68.20', 1608539513, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383533393531333b),
('4a5sf0443af9l3kerrd35ma0vkhbmprb', '101.53.254.132', 1615316323, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363332333b),
('4acb09acdf1372278832b48045b893e497cd1d42', '138.246.253.24', 1611860546, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313836303534363b),
('4ak5o7do5p45p5utkfenk90fn86qhn6o', '101.53.254.132', 1615903078, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333037383b),
('4b159nsbe3vo6keo3dlo7bjt4sngmaal', '101.53.254.132', 1615379563, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393536333b),
('4b5f9bfd7853ebe2a869cdd7a21de3c5005e7ca0', '72.255.54.157', 1606739338, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363733393333383b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('4bf7f6c6a85d9526dd1862650bc150636e4ba712', '101.53.254.132', 1613771661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313636313b),
('4bjm7e3m9apjfldm116ie2er51edfb93', '101.53.254.132', 1615368989, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336383938393b),
('4c14b0a01e9b50ae937224bdbebbd202c0a83e98', '5.104.111.253', 1613766177, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736363137373b),
('4c43cb8f817b1113f0d8b01776bb293644d944eb', '54.36.114.53', 1616153707, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333730373b),
('4c7f6f4c11ac3be6d2d383940001396d7966b0fa', '101.53.254.132', 1613835310, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833353331303b),
('4cbbf4779c137f21b316d7edf87e98e227c83259', '101.53.254.132', 1613833057, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333035373b),
('4ce1532d3ec4304a496a103adee8075830b5c504', '34.242.141.183', 1612375180, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323337353138303b),
('4cf9cf871e4f8b030fe10943404ff90b5bab9280', '129.213.109.135', 1611901465, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436353b),
('4d188b3d06eddea38710abe53e35fd8448187b1c', '54.36.114.53', 1616153949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333934393b),
('4d1d797b1458a81a9893890ec9d76c642d7a6cc3', '101.53.254.132', 1613832174, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323137343b),
('4d2d7fbb5e90835a9aec25eb0328f81f8e2c2d86', '209.17.97.34', 1609057267, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393035373236373b),
('4d4f6180017255e1e26142b2f1a41a1b7c6491dd', '54.36.114.53', 1616155069, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353036393b),
('4ddf113c8d40858a9156abbc181ba9785502605e', '101.53.254.132', 1613833128, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333132383b),
('4diqo3bjjg3s1qem91f4og1cjhtn3n53', '101.53.254.132', 1615369547, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393534373b),
('4dl4scs3vug4hlro5onqm7nprnn6307p', '::1', 1605898687, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630353839383533363b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('4ds1cc2pii8j854j3lcnhbvjpe627c0b', '101.53.254.132', 1615903206, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333230363b),
('4dup6i9up2lerbeiupfsabi3bqrabhf4', '101.53.254.132', 1615315882, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353838323b),
('4e0d0u8gnes817u6180gaa7tiagku3bu', '101.53.254.132', 1615903131, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333133313b),
('4e3a4824d6cecbb38eccbd3bf53ae0e2eb73c258', '101.53.254.132', 1613832118, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323131383b),
('4ebbf0ca942d949a42adfd9f9416368d87bf5d8a', '141.101.25.191', 1608478591, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383437383539313b),
('4f2a2d5d5ed2d0115757247e108556144eca73ff', '39.42.65.245', 1606583298, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363538333239383b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('4fcbe1bb742cf6ed5be06af3f3d226190a2fa1df', '164.90.132.116', 1612125934, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323132353933343b),
('4ge64oekvhc52onvb5r2qcgonhm3g0p8', '127.0.0.1', 1605900111, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630353930303131313b),
('4lpn47ciimq2h36ijmsc18squh540ijt', '101.53.254.132', 1615317124, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331373132343b),
('4mo7du71pujq09tg6t9u79icqt7n58bt', '101.53.254.132', 1615907035, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373033353b),
('4ndosngeusaij71h0hgscemui3jrk1nv', '127.0.0.1', 1606511749, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363531313734393b72656469726563745f75726c7c733a32373a22687474703a2f2f72616d2e746573742f696e71756972792f616464223b),
('4nss9h22aieqvqbs63sodhg5i1lq23e1', '39.42.73.202', 1614724330, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343732343333303b),
('4oloeqpr8h2umot4gk7g0nsbq4bcnpju', '101.53.254.132', 1615312741, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331323734313b),
('4q9sonv5f67no5qaoncme3b2318mkfk9', '101.53.254.132', 1615903110, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333131303b),
('4reuc322k7pb20mip54sd54f039fpkqb', '101.53.254.132', 1615371678, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337313637383b),
('4rlcf9tq64gr372taibc01kpb647q8b2', '34.215.69.55', 1614670213, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343637303231333b),
('4t3m2hn2gvgn9v3dprhihbb1g04605kk', '101.53.254.132', 1615907026, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373032363b),
('4vkbj4a882pk867itueufq68nkv474r2', '101.53.254.132', 1615369291, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393239313b),
('504ee5c16b0716cd145bc11b24a3499d102c4595', '39.42.65.245', 1606578459, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363537383435383b),
('505711829f108a40ba2090420b9470b6c27d4f11', '72.255.54.157', 1612374122, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323337343034333b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('505cc7f17aaace26546c408be7ad80bb4f8ab1d9', '101.53.254.132', 1613831904, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313930343b),
('50ap4f0mt5aof75s4lomicubssvccfbu', '127.0.0.1', 1606485811, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363438353831313b72656469726563745f75726c7c733a32383a22687474703a2f2f72616d2e746573742f696e71756972792f76696577223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('50c286d3eddf9cc19ada17751d17bccdadb8d5a8', '101.53.254.132', 1613831747, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313734373b),
('50d9d97bbabfb3afcc1c48dea426bb8c8ecda0e0', '54.36.114.53', 1616153728, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333732383b),
('50f714b005440898416df2e36098aed756d6af4a', '101.53.254.132', 1613832746, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323734363b),
('50meujg09avj76ikdsjmsd6ohavo3vi5', '101.53.254.132', 1615903661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333636313b),
('50v34uj4r3k4fdphvthfnrob4aa29n97', '101.53.254.132', 1615907007, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373030373b),
('510d60486f752d3ed628ff318c31be14000f472b', '62.210.209.245', 1610977432, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303937373433323b),
('5110a2b2011c6ae60dc4d57cc6041bf2dd999553', '18.196.239.107', 1608431867, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383433313836373b),
('518b6a5a9c82938805402c89849712893a58c37f', '39.45.212.243', 1614639232, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343633393233323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('51b6b8bb4d46bd289e4893779132c126bc042132', '39.45.212.243', 1614643096, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343634333039363b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a34313a22496e666f726d6174696f6e20486173204265656e2055706461746564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
('51ef8e37ee7a403a035f7c356ed596da723928d1', '54.36.114.53', 1616153769, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333736393b),
('51f94355a5efb1a7bf39a05225fef99e7034e9f0', '209.17.96.66', 1613037259, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333033373235383b),
('525cf600d06f1e4485fe04083cbd8e10a7c32dbe', '101.53.254.132', 1613833187, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333138373b),
('5269f0dc73894b606402b41528604dfa00592adb', '72.255.54.157', 1606739590, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363733393333383b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('527rljh7t7hiamnuj3lf5lo6tmfb0e9p', '72.255.54.157', 1614717294, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343731373239343b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('5285c7f0446ead8acdcb406289680150c36d2608', '158.101.115.177', 1614614269, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343236393b),
('52c5672a70bb409a4cfaac445412949a656ef087', '39.45.198.56', 1613220457, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333232303435363b72656469726563745f75726c7c733a33373a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f64617368626f617264223b),
('53322090ad1320b2c424ca08a7e4bf84f0621c00', '54.36.114.53', 1616155724, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353732343b),
('534d17304ba95fb12aae3a39c25f46158701c922', '39.45.212.243', 1614548980, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343534383938303b72656469726563745f75726c7c733a33373a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f64617368626f617264223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('537pfnr5trs0mtf0hvtjm8jsvktsqc6l', '101.53.254.132', 1615903472, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333437323b),
('538pkg69al1qlnmito80c9j1rg2s4623', '101.53.254.132', 1615903592, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333539323b),
('53b9da0d1d351fd6770e05d73d3460a811342078', '54.36.114.53', 1616153488, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333438383b),
('53bpclmlguq9t09itf7av920j4c6fqp8', '101.53.254.132', 1615315665, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353636353b),
('54215627addeba827d69a31bfa818b7ab8c68509', '193.123.68.20', 1608504065, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383530343036343b),
('54bb0dc102572bce58d572e6801fedf5e73345db', '101.53.254.132', 1613771182, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313138323b),
('54d2df878417f04e7c92cd1312593db33ff0e0ac', '101.53.254.132', 1613832071, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323037313b),
('5590a73f4a4ca0bdf10e9482620b75d571fef496', '40.78.153.184', 1614242267, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343234323236373b),
('55a383ee9dd90c661538d21c73a12d68d2f5c5d9', '101.53.254.132', 1613832065, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323036353b),
('562ce19929e09937594117d36f37cec1abb85309', '138.246.253.24', 1612439640, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323433393633393b),
('565rabu295rplf08gssg4lc5p1dfvu4t', '72.255.54.157', 1615373721, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337333436313b),
('568d97d07e381687e90219129b33bdd6d406ede5', '54.36.114.53', 1616155059, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353035393b),
('56b1788862081ad3bdb02dccf3a2a251a5f31a2b', '39.45.212.243', 1614640487, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343634303438373b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33393a22496e666f726d6174696f6e20486173204265656e205361766564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
('56e5ff6ab829112ea3a2315f5c9c226ed9cc4adb', '101.53.254.132', 1613831410, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313430393b),
('56f1297f91ca7f95ce85a3e7c91bf79198e2ee17', '101.53.254.132', 1613832331, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323333313b),
('57g38ah8puavu1pqoop95uhn15kurek7', '66.249.93.20', 1615640422, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353634303432313b),
('580d44ac83d3c66d7a3c6620f65b55a77fa36148', '158.101.115.177', 1614614274, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343237343b),
('5868829dc7f4ab661b799bdea1f54229e6d59f74', '101.53.254.132', 1613771610, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313631303b),
('588b739gnllfmkr0d5f509j56327qd3u', '35.181.112.20', 1615625588, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353632353538383b),
('599vnj5kr3ts0do0mggkqj4htt3hpemd', '127.0.0.1', 1606352278, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363335323237383b72656469726563745f75726c7c733a32373a22687474703a2f2f72616d2e746573742f696e71756972792f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('59acq2dc8j2mt17tuemvbjs0s9pcr9cb', '127.0.0.1', 1606348536, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363334383533363b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('59de7076001e42720442e3ab6d7a447e826c010f', '138.246.253.24', 1608275547, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383237353534363b),
('59is8vj6pvd8msquqabefj7u6ba7nv5c', '101.53.254.132', 1615317092, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331373039323b),
('5a686608a2911c4479b47f5a36dc81993f2a607f', '101.53.254.132', 1613831854, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313835343b),
('5a8vq2gtng815aosfmh2rl8q8jmjpp11', '101.53.254.132', 1615903661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333636313b),
('5a9dc29d7f362085aceff58296bea472d0fbcb1e', '18.196.239.107', 1608431818, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383433313831373b),
('5b5d0a6911c7fcb33b1cfff9fd1e3b3338c7a5aa', '18.196.239.107', 1608431808, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383433313830363b),
('5b987c81a5f49c40c2c054933407fe3d28a2bcbc', '101.53.254.132', 1613833028, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333032383b),
('5bd203f521b626141d79dad66a60468a41e9b1ca', '3.0.115.255', 1614403967, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343430333936373b),
('5bjkc3qtib24fngc57ndqutte55gfnhh', '101.53.254.132', 1615368995, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336383939353b),
('5c1fcc450d75a9a932aa09b3c7b82a44392c8da5', '54.36.114.53', 1616153489, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333438393b),
('5c4isflpaiemhcjb4dup115eb8gp8scs', '101.53.254.132', 1615906695, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363639353b),
('5c6001dedfd293ea31116390c161bbf687a84025', '3.24.217.241', 1613941278, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333934313237383b),
('5c646e2f7c8e032b774cb0544e86d30b4bdba3ac', '40.78.153.184', 1614242268, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343234323236383b),
('5c70cc3d9479b32ef357571ee4b45b2b660733f3', '54.36.114.53', 1616153489, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333438393b),
('5c755d5f22264246d9d753e88cb8d0f845ab12aa', '129.213.109.135', 1611901465, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436353b),
('5c82956ad5cc13565fa9268934171a0b10e732d5', '101.53.254.132', 1613834572, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833343537323b);
INSERT INTO `rm_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('5cb90ffcb62781c1b3125ebbd89f6483412663c6', '54.36.114.53', 1616153728, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333732383b),
('5cf891b350f66f28f85aa9819420644f4cbd5b72', '209.17.96.2', 1610636811, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303633363831313b),
('5coubm4ii6nj95bodmv7sfkf573rad07', '101.53.254.132', 1615906540, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363534303b),
('5d39a63c4d80bf7f046a91951c100746766edd04', '158.101.115.177', 1614614267, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343236373b72656469726563745f75726c7c733a33343a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f6261636b7570223b),
('5d76d164eb0983005883ec37f41976b0d0d8f550', '72.255.54.157', 1612336645, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323333363634353b),
('5d8e904caf584e081be298ea7984c28a8f2801aa', '34.248.10.44', 1608202471, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383230323437303b),
('5e17lrdinfnfrm54242cakg1kclpamce', '101.53.254.132', 1615907007, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373030373b),
('5e98e87607fc4081e6dd7f45c836573cf1c1ae6f', '101.53.254.132', 1613827563, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333832373536333b),
('5eaisho87i4all9t2aiho75e52ti9och', '101.53.254.132', 1615883398, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353838333335393b),
('5ee38e29abe855d81fc77ee063954b7a310af027', '101.53.254.132', 1613833137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333133373b),
('5ef6f95c2c2292322257ab2f1224e7087c469b0b', '101.53.254.132', 1613831669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313636393b),
('5ej3ck03qqvgvu20m43tg44e3q6qat7h', '101.53.254.132', 1615380227, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303232373b),
('5f0b873e1d0d0eaedfa82c473c9f0412439e8bb0', '193.123.68.20', 1608504066, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383530343036363b),
('5f406bf831397b83e8a039b8d5c176ef74e8ac5c', '101.53.254.132', 1613832534, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323533343b),
('5f6inbojm2vtij5d7vtc8quimrua8ac4', '101.53.254.132', 1615380702, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303730313b),
('5f9dc7437e69b6e82db0ede16eb724ece9cd0279', '54.36.114.53', 1616153494, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333439343b),
('5g6am134k0k07if3fovcqo5b7mj2a5ef', '101.53.254.132', 1615316629, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363632393b),
('5gcot2lpas0dhbk74o2f7hmhcfle3qf2', '101.53.254.132', 1615903119, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333131393b),
('5h2tp79c2u20tvtagkuoo1muqrc999eb', '101.53.254.132', 1615907009, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373030393b),
('5hsl1327qcb9mgm3lq9rlrqa7sfqa0m9', '101.53.254.132', 1615192561, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323536313b),
('5ifgvccgh094l0b7r06sco6unq7v1926', '101.53.254.132', 1615903624, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333632343b),
('5ipdmohl3he95mdbvqgnu18c6d9vg39m', '101.53.254.132', 1615906936, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363933363b),
('5j5ulmikc8tskndm4j1m14vfl176pbkg', '101.53.254.132', 1615906964, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363936343b),
('5jqn64tjpl73lbqpb9h0i4e7b1gan93h', '101.53.254.132', 1615380336, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303333363b),
('5ka2kt4mkvuem64osre7l3dt6mqcoj00', '101.53.254.132', 1615902989, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930323938393b),
('5lplhs64da7l7shvgmgqo9iaqllq5umh', '101.53.254.132', 1615906546, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363534363b),
('5m1h4qr3v81smvfsina7ovtsvvaul06k', '101.53.254.132', 1615903437, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333433373b),
('5m7os7tgpjv2op5iqb01ea1l4s5njqs8', '101.53.254.132', 1615906370, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363337303b),
('5nm0s1urnak5i5e9bg04pcl5qa3fb2r9', '127.0.0.1', 1606167753, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363136373735333b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('5pp3rleoin577014hct35jgcvp9cqvlo', '101.53.254.132', 1615371872, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337313837323b),
('5q4n16d0h4c07g2pc4v43ihh6vgm229e', '101.53.254.132', 1615380424, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303432343b),
('5qocmlismordpfs4jbn3qjs8ad851gi1', '101.53.254.132', 1615906841, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363834313b),
('5qpgogloapvsbl4d1acqe7hpa4emet9j', '39.42.73.202', 1614728679, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343732383537303b),
('5r5vcr6kb20uu3q03gmablslgn96tebj', '101.53.254.132', 1615316490, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363439303b),
('5rcvtcfe2mfr7pncgd7pvrrci6nusob4', '101.53.254.132', 1615192222, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323232323b),
('5s7c6qu7umg06o1fhij6ibro1g5s1nge', '127.0.0.1', 1606337097, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363333373039373b72656469726563745f75726c7c733a32373a22687474703a2f2f72616d2e746573742f696e71756972792f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('5tc3cvq2fb073mpdqf9mvc18m5hab19b', '101.53.254.132', 1615380335, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303333353b),
('5uti32fhl9hmjr16t1fdas0egtq9d8f9', '101.53.254.132', 1615316708, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363730383b),
('5v7phfv9h4qju2idm3kasups3kvnkjlh', '101.53.254.132', 1615906958, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363935373b),
('5vuvc6coqli63ld46b2lu6nnml3i9mks', '72.255.54.157', 1614718535, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343731383236363b72656469726563745f75726c7c733a34353a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f70726f66696c652f36223b6e616d657c733a31313a2251616d6172206a61766564223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2239223b6c6f67676564696e5f7573657269647c733a313a2236223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('60b642b33111c8e89ccd6241d35e5ded27951c03', '209.17.96.114', 1609074663, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393037343636333b),
('60d63c710b58c75b651604e7c57070bc24c7e5cd', '158.101.115.177', 1614614274, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343237343b),
('619e4eb56560c1947bf7bb1d0c9f76d01f19ec04', '54.36.114.53', 1616153777, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333737373b),
('628e60plkt946f5072eijcsvv6e58p22', '127.0.0.1', 1605899954, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630353839393731373b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('62953fec994a2adfbc20eb9e9200cf2cb734d9cc', '101.53.254.132', 1613833009, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333030393b),
('631d42da842b7aef2a7f6ed5da346ab109d515a2', '101.53.254.132', 1613833084, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333038343b),
('63be3010e6a26e11bcb6e98b3eaf756998464fdd', '184.170.252.252', 1609754563, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343536333b),
('644902fc557a60a1a54a1c26a2b6d96acb165ae3', '54.36.114.53', 1616155744, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353734343b),
('6466dbba87dd879520ba12699e527b6bdd480c03', '101.53.254.132', 1613832458, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323435383b),
('649ism9kuargntqdmg26kmlahjuu0b7f', '101.53.254.132', 1615903709, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333730393b),
('64c5e652b78fc56af4b634d9dacbdb75e0a5f321', '54.36.114.53', 1616153949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333934393b),
('64d80ookn56i47omejsgii8hfm3uvree', '101.53.254.132', 1615369609, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393630393b),
('64p2qpt8u2afv171qrffhp14vcmn56et', '101.53.254.132', 1615379799, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393739393b),
('64u3v05jfihr82dcto580uqc5p3e12b6', '101.53.254.132', 1615907026, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373032363b),
('655usaucnejm6rqpsldj9pk30ppqrdm8', '101.53.254.132', 1615380684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303638343b),
('65kv08d80mpj8gogtkak4vlm765jrdfn', '101.53.254.132', 1615380347, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303334373b),
('668i21an1us5qjrjbbpp73o46d51263m', '101.53.254.132', 1615906712, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363731323b),
('66a6896a57cb30d6026ef04d18ccfb703aae0ba3', '101.53.254.132', 1613681968, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333638313936383b),
('66b43abc86dd4a8251cba95cb0dbc5ad38aac0ba', '129.213.109.135', 1611901459, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313435393b),
('66ca4480cebea06d9445c6672f353e21973a99fd', '101.53.254.132', 1613833084, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333038343b),
('6792e5ea6117ff1fcbf2cb4e94a24198b8b87ea8', '72.255.54.157', 1613593742, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333539333734323b),
('67i4iak75d50s71k7lp4ll7qsjtm7spd', '101.53.254.132', 1615901954, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930313935343b),
('67tc27obuaghtphs6ev16rvl6vv093k9', '101.53.254.132', 1615906713, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363731333b),
('67usn9sf73q9jdnf27itmqdrqrkgm4r8', '101.53.254.132', 1615369517, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393531373b),
('682d170fa64357c3c574b532b41c2a9cd437c1f9', '101.53.254.132', 1613831637, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313633373b),
('6846fc0909e301e894ef4b9a3bdff091e0ce4bda', '39.45.173.81', 1612954769, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323935343736393b72656469726563745f75726c7c733a33393a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f696e71756972792f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('695c4fa2f1a9664e6447dd457895ebbae6a762fc', '13.212.93.201', 1613794830, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333739343832393b),
('695d4d839f15c2f0a925056abf06ebeb2e659bd0', '184.170.252.252', 1609754531, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343533313b),
('69686a28eb5a46c5a45f9863c8b62c96d55dd56f', '101.53.254.132', 1613835309, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833353330393b),
('69c1f7e245d2da31d4908a96f25b3b2bab4ea003', '212.83.146.233', 1606550302, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363535303330323b),
('69cef7399f388b3074a4cb3cfca472e6814d686a', '101.53.254.132', 1613832157, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323135373b),
('69f11d0ce01d37091e1638bc573e8b4e8e09886a', '72.255.54.157', 1613593633, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333539333633333b),
('69h1ag549oei1d6eaa0i80pirvpm46rk', '101.53.254.132', 1615380364, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303336333b),
('69ov3sphs0cr79422asokabeh99vn9ad', '182.185.143.172', 1614689968, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343638393936383b),
('6aa41edd39e116c3b36a53f08e14ce339be0cf53', '54.36.114.53', 1616153488, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333438383b),
('6ajj28anj35fiooabfgvt75l3g1f2ppg', '101.53.254.132', 1615380669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303636393b),
('6b2941b3fe3074cc60f01bc0d67eadd484e46e31', '129.213.109.135', 1611901461, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436313b),
('6blmshlqr16dvjpcb363nja208k2d5mj', '101.53.254.132', 1615903591, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333539313b),
('6c2073a2d451fe70b22c2b33f174949d3252abc5', '72.255.54.157', 1606515980, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363531353938303b),
('6c5792a6eb6b9ab493f6fd2ad7544da53907b8e1', '101.53.254.132', 1613679517, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333637393531373b),
('6c6d92e428eb1c51f6bceb01b907ee2c4a533f17', '54.36.114.53', 1616153854, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333835343b),
('6c9460d99037b2594e219e88d40ac9af38aba95c', '65.154.226.165', 1611784281, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313738343238313b),
('6cd192615040f0a3de5fa2b80f6da0f7498fa116', '184.170.252.252', 1609754510, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343531303b),
('6cd3c6rc5b2k17bmvqsms3kbpmirobs2', '127.0.0.1', 1606355975, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363335353937353b72656469726563745f75726c7c733a32383a22687474703a2f2f72616d2e746573742f696e71756972792f76696577223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('6cdaprhbhbva65hccqcpjdalhq4i4qej', '101.53.254.132', 1615903406, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333430363b),
('6ct5alosrsnbpigmm34kuu9tnuoejto7', '101.53.254.132', 1615907035, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373033353b),
('6d3c5acbd6f3a8b40a33a29513a944a675687dfe', '5.104.111.253', 1613763978, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736333937383b),
('6d4db5a54356461b28986e3b16085ae9a01b91ca', '129.213.109.135', 1611901463, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436333b),
('6dd5c61a036345a73ffa4f0993df54620a9a0a93', '158.101.115.177', 1614614263, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343236333b),
('6de94b6eda7595c851a661dc65c9447ef24d1147', '100.26.251.213', 1612951043, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323935313034333b),
('6f0bec302f50f32241960e23e8098cb1a81c102d', '101.53.254.132', 1613834609, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833343630393b),
('6f258bf172476948c83072e6c14fb640dc0a4e4c', '129.213.109.135', 1611901461, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436313b72656469726563745f75726c7c733a33343a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f6261636b7570223b),
('6fj7eqei3fq0al6jumi09mqbir0urqt1', '101.53.254.132', 1615906841, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363834303b),
('6ghrcs69rv4qv91thfgkmsc21436ti8k', '101.53.254.132', 1615315727, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353732373b),
('6gm3tnujecot1no2v3c519c0phk1lhiu', '72.255.54.157', 1615400663, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353430303537383b),
('6ivfpj5c5n4ohr3j1hg3aa0pgf7tml1k', '101.53.254.132', 1615905831, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353833313b),
('6j21s14g3d2nolpu8dajajahf82v8a4r', '101.53.254.132', 1615907021, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373032313b),
('6js3re03p1gca1koocn3hijmqlrhficd', '127.0.0.1', 1606353805, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363335333830353b72656469726563745f75726c7c733a32383a22687474703a2f2f72616d2e746573742f696e71756972792f76696577223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('6n6jc7v5ie37vhrne735f8cjq0p1fvqs', '101.53.254.132', 1615380334, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303333343b),
('6n8spog4qp7e5e7nu3d3a167v9rqspda', '101.53.254.132', 1615316844, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363834343b),
('6nhqvdv94heb83fun7bvq0cs0smkuims', '34.209.105.222', 1615998559, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353939383535393b),
('6nina0s0olg28a1so1151ksuh4jaa58j', '101.53.254.132', 1615380660, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303636303b),
('6nu18enkdua23fpucpat460299bj72rr', '101.53.254.132', 1615902038, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930323033383b),
('6osj78oapnnj3jhrjh2509m0sv7en0u8', '101.53.254.132', 1615380423, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303432333b),
('6ou35mti2dt17eivo9i4utgiug6jcaft', '101.53.254.132', 1615380662, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303636323b),
('6qsf6rak1r5k4cv750po87pjukrovlbs', '101.53.254.132', 1615906963, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363936333b),
('6rq8s1lrl190c9gfa2jhkd08ube5j9mk', '101.53.254.132', 1615380348, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303334383b),
('6td8pq2eitceu6m111pct6fgssk19816', '101.53.254.132', 1615369471, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393437313b),
('6u6lg0r9efpfp84h4kmm70o6v5tvpb4c', '101.53.254.132', 1615906547, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363534373b),
('6uaar3bpu9alk5181k7oj89jl85ujujr', '101.53.254.132', 1615313152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331333135323b),
('6vuii3igtjinhk1vtabpjljrv75ev3dj', '101.53.254.132', 1615192500, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323530303b),
('70057dbf7edef9eabe3c09106b9e548c65f9e041', '101.53.254.132', 1613832182, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323138323b),
('70162a67fc0c5fe41549e0317594a7520ca8ca43', '54.36.114.53', 1616153776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333737363b),
('7024p8dmieklgeta24cvta3tdt1e8uq3', '101.53.254.132', 1615907034, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373033343b),
('706366686ec04a5883858c52533308027acf382f', '209.17.96.50', 1612627539, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323632373533393b),
('7072e02ab8fefbde335d49dae6bba1f860f1cd3a', '101.53.254.132', 1613830638, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833303633373b),
('70b49268a2c98644e8204863cb20ea247ae69585', '184.170.252.252', 1609754513, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343531333b),
('70j4c4u7b1bdtk1k7vr8mol1sq0d07r0', '101.53.254.132', 1615903615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333631353b),
('712iikvcrpu9h9tb3hiuvqbr5j90h99h', '39.45.10.36', 1615836511, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353833363138313b72656469726563745f75726c7c733a34343a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f666565732f6475655f696e766f696365223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33393a22496e666f726d6174696f6e20486173204265656e205361766564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
('7163ab7b7a05403f99f76ecd48a49440552a76de', '101.53.254.132', 1613832065, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323036353b),
('7174ab37be782579f56fae0d50265ccd248ecb56', '54.36.114.53', 1616153777, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333737373b),
('7199d534177341e046160f2dc896a9b0b3eedffb', '101.53.254.132', 1613771071, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313037313b),
('7206dcf7c6a5a074b7567aa3bd9eb32859be93a0', '54.36.114.53', 1616155070, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353037303b),
('72415315571c5654bb6fe850577053cebb166e20', '101.53.254.132', 1613832678, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323637383b),
('7270884ab4e0c60c44c4ab6955b8b3657c4b2e70', '101.53.254.132', 1613832088, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323038383b),
('729f1f8572185b3a22c328972a87ed41940ba036', '101.53.254.132', 1613831762, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313736323b),
('72abfba756307f5b09762a74be0435c184841f16', '54.36.114.53', 1616155059, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353035393b),
('72bb2f23623432bd3a60670e026db5a0d67a78d1', '54.36.114.53', 1616153488, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333438383b),
('7317a39c3318fa70b623b4d7913819b104cc3c92', '101.53.254.132', 1613683172, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333638333137323b),
('73285de89d178cdeb06617d05c9706234049e186', '101.53.254.132', 1613832319, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323331393b),
('73b55d3f8d16e854875436ca346c4c698c841a94', '3.121.214.79', 1613936116, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333933363131353b),
('73d3a0554a7836fffc1724af69b3cbb5542fb490', '72.255.54.157', 1614273966, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343237333936363b),
('7410hkp21gum403b5r4t6abemts8a65k', '101.53.254.132', 1615317109, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331373130393b),
('744rm0g5i520o6fb9q6b34qjm6jmm06t', '101.53.254.132', 1615380669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303636393b),
('7454e7fcd6962b99910d5cdd494cc55e94246cae', '101.53.254.132', 1613831731, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313733313b),
('749f5b8f80e2dda4c97f5a98e95356eeeb069af6', '54.36.114.53', 1616153707, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333730373b),
('74abiknqive4ijubdrea0osik1np14vb', '101.53.254.132', 1615316795, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363739353b),
('74cf3488e877e9038b91c4c4843a10d504d375c7', '54.36.114.53', 1616153448, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333434383b),
('74d064b1f5e3ff129c46b891ba5d81053643e1b6', '101.53.254.132', 1613771637, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313633373b),
('74dd5d48c0f82dbfa8ad87a1d893e63140124c64', '54.36.114.53', 1616155074, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353037343b),
('7571ae82dfa57af82d27950a2d746e01a1d1b469', '101.53.254.132', 1613832602, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323630313b),
('75824b85200edb1f0a53f6728750a61a90628e25', '54.36.114.53', 1616153768, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333736383b),
('75ef1decb09b525933e7f7862cea4bf700f2b1b2', '101.53.254.132', 1613832627, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323632373b),
('763297cae7829a00114a0fada9d9d2d6e3b6118e', '101.53.254.132', 1613832753, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323735333b),
('764018bf4cf99c015f12a504ec1573b8aa2aa6f4', '54.36.114.53', 1616155628, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353632383b),
('7690fee84853d220a68590e3042af4ad73efb333', '158.101.115.177', 1614614274, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343237343b),
('76bhgv2ej15jd9rbd9jcdns85brk69to', '101.53.254.132', 1615906948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363934383b),
('76df0ba55d5048b87818e4124fe1ef3534eeb24c', '209.17.96.138', 1613149822, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333134393832323b),
('76gi9n7ukj1ausr3thgc2k6l331h4jlt', '101.53.254.132', 1615907019, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373031393b),
('7731lmlk8fcrc91ghtlfqrihobvgfnml', '39.42.73.202', 1614726857, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343732363536363b72656469726563745f75726c7c733a34353a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f70726f66696c652f36223b6e616d657c733a31313a2251616d6172206a61766564223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2239223b6c6f67676564696e5f7573657269647c733a313a2236223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('7733caatvi1gt6la8h9295ea0uv8jj5o', '101.53.254.132', 1615316367, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363336373b),
('774526f4ec79784050ed125560530165bdfe54a4', '101.53.254.132', 1613832986, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323938363b),
('7772b2526d564322fc1050c0184814a8584fb9b4', '39.45.153.20', 1613390593, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333339303539333b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('77912c8bd650f65c4385aee81bf18cb220b56a27', '65.0.18.238', 1614018793, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343031383739323b),
('77b394487e84cd900462007c5c7f436c62982655', '188.165.210.14', 1612961352, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323936313335323b),
('788599b5e1087ffa64ae3640dfb1a1c78425bcfb', '101.53.254.132', 1613833029, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333032393b),
('78caa9c4d48f622cd2ff98ab9865dcb09d834960', '129.213.109.135', 1611901463, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436333b),
('78gkbbnm4pj3ce81nngaob7d6v4erdkb', '101.53.254.132', 1615903624, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333632343b),
('78p9j9lqjavoj8tb135j27g5hidovmep', '101.53.254.132', 1615191507, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139313530373b),
('790acc95d888b4b01d26570beb8e796387c44bfe', '101.53.254.132', 1613831747, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313734373b),
('792be5ce0cb7a7c98bb6c5d78f74796bd1cec7dc', '101.53.254.132', 1613833109, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333130393b),
('79df853obejthjlggqfaoufttr3st6se', '101.53.254.132', 1615905856, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353835363b),
('79f180bb4c5c2ec15daf84e4248e69ef2500bdbf', '101.53.254.132', 1613834596, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833343539363b),
('7ad2c5d24d1d2fbae487eab068b35ae8485fc983', '101.53.254.132', 1613832601, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323630313b),
('7ada6ee9eb0b824a2cc0e41b67937ba71d1a0ea1', '101.53.254.132', 1613832054, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323035343b),
('7amr0u7gs89oaven0e5nq5ch3cfqrt3s', '101.53.254.132', 1615903616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333631363b),
('7b2ca42e5e8c83c51fb1ab0e2314941a7520f809', '101.53.254.132', 1613832609, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323630383b),
('7b78fe228e32948ec14118bfd1297a12a3e95212', '72.255.54.157', 1616095088, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363039353038383b72656469726563745f75726c7c733a33393a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('7c0d194c5079550a7c80cf19628677734193d05a', '54.36.114.53', 1616153931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333933313b),
('7c3d3ef8172a452d65f58b135206b76c2e268bd3', '39.45.11.201', 1614041209, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343034313139323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('7c85981c0199406d41ff35e708ef39e8a45b9b5b', '101.53.254.132', 1613833137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333133373b),
('7c8aa1b7147b43531dec710d7ce034351d9b0c8d', '92.118.160.17', 1613302257, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333330323235373b),
('7ce659427a056be28d4681187941ff70cdb4779d', '101.53.254.132', 1613831638, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313633383b),
('7cpmefqhhrjllc07655q4chffuegg9kt', '101.53.254.132', 1615192222, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323232323b),
('7d164850c7d3db1bd4eda21dc612015c35a1f9c4', '158.101.115.177', 1614614274, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343237343b),
('7di5hcgqk903qgc16g3khqae4prf0is3', '101.53.254.132', 1615906851, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363835313b),
('7e6161433797d7a33b5de2ab3146d2f4d2a75501', '34.255.58.82', 1612375180, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323337353138303b),
('7eb4rlievtig46434smqlchiga4p7403', '101.53.254.132', 1615906764, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363736343b),
('7edbd7e26e5349c09de4d764a35cc71cf24ebed2', '54.36.114.53', 1616153669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333636393b),
('7f2fa71353e088329836f57f113ea9347ae29b84', '101.53.254.132', 1613831854, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313835343b),
('7f3abae5776125f9391ea1dd17fcd215393068c4', '101.53.254.132', 1613832997, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323939373b),
('7f4dedd7810fd7555ba355f0ed73d3c0a9581c3f', '40.78.153.184', 1614242268, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343234323236383b),
('7ff86eeb8a55ccc8f63593aa266a73d0cac820f9', '43.245.10.82', 1606654114, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363635343131343b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('7hg4qihqchiq2d4nnr6k9jiffj67icl1', '101.53.254.132', 1615315858, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353835383b),
('7kuv9otaeo3kmdjgr9np3fu0k0hlt32f', '101.53.254.132', 1615315817, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353831373b),
('7mg3kbdmi8ppiejcja5ikgvq8pcgomkr', '101.53.254.132', 1615192720, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323732303b),
('7mtahi48dsak251ibba79p62hq394445', '101.53.254.132', 1615906783, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363738333b),
('7n2tgs1d3bqsjqvkmkanun1h81tpov32', '101.53.254.132', 1615316357, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363335373b),
('7n2u63mgmql4q4hkm4ro42uh9sbj7jhs', '101.53.254.132', 1615370057, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337303035373b),
('7o3tjksr2pn2udgv47t8tmsmktlqoa7f', '101.53.254.132', 1615903120, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333132303b),
('7ohqvvmes4hcr1atvij9c6mab5sao793', '101.53.254.132', 1615316722, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363732323b),
('7oi3hb7dlnsk8qs1q93sbdrbl8erpopk', '101.53.254.132', 1615192667, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323636373b),
('7omj4nltcge2qf7cnaal91lhp30kiff4', '101.53.254.132', 1615316422, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363432323b),
('7pe3ob5pmci4hjvp7h7l9va05i2n82g6', '20.184.3.245', 1615912637, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353931323633313b),
('7r5s6q2it7rao5jgg1hqi4n75cm04pao', '101.53.254.132', 1615316624, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363632343b),
('7ttju618si8l05qvd6t7smqf064sunkr', '101.53.254.132', 1615903132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333133323b),
('7u9tqkdu3pr2fq00vphbq1f2rvs00934', '101.53.254.132', 1615379490, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393439303b),
('7ueb96t5u89ilibem2anm9l0vf34f0u5', '101.53.254.132', 1615902036, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930323033363b),
('7vgspbpldrkist93v3285b0ddatfc8lq', '101.53.254.132', 1615905763, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353736333b),
('80bc7bfda9c58c4f4b913d057ce06d60957ff6ed', '39.45.153.20', 1613333341, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333333333334313b),
('80nt719rl7f4lsfpssorum6neqqdu4hk', '101.53.254.132', 1615380684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303638343b),
('8191b76fec39e39d34d3db1d86d039ff140c6d63', '209.17.96.186', 1609000707, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393030303730373b),
('81c7526bd381812a190f66f92d75364cfbb33c65', '158.101.115.177', 1614614275, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343237353b),
('81d7d81749f41dcb6f81e47908e5efa0efcd0815', '184.170.252.252', 1609754545, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343534353b),
('821ff1683632375301391a1d1454915bc1e09f28', '158.101.115.177', 1614614273, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343237333b),
('82316491ea89580a3e2dab32bc9f5eccd5146900', '138.246.253.24', 1609073034, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393037333033343b),
('823210d90871c3de7cba35a0f23a3030389d0bfb', '209.17.96.154', 1612269415, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323236393431343b),
('824d0pftv5l7829dfk47ncf1mugft7a0', '101.53.254.132', 1615906989, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363938393b),
('82716bb25b33d16451142fb4f3da3d01bfccb313', '39.45.41.33', 1616101809, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363130313737343b72656469726563745f75726c7c733a33373a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f64617368626f617264223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('82c335da0acbd007433db418400b095d339171ec', '101.53.254.132', 1613832998, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323939383b),
('831a801a0898051a36e7395f478417645aba3c13', '101.53.254.132', 1613834826, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833343832363b),
('833393c4d83272c153297c64a563b8b6167d1a0a', '101.53.254.132', 1613831859, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313835393b),
('8337d82ce02d9abcf4f484858149f37b5ac28c0a', '51.158.109.3', 1610199418, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303139393431383b),
('83c0ef99d6afa552ad85dd81b82fa20554f95ec1', '184.170.252.252', 1609754519, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343531393b),
('83fn4sp1k7tl5lgb2123tidt29hqnjbg', '101.53.254.132', 1615906528, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363532383b),
('840hactt1rnhum5u38jbrj8pen4usuu1', '101.53.254.132', 1615906540, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363534303b),
('845a4d5a7795512746cf36c64fada87a54594124', '39.45.212.243', 1614638600, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343633383630303b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('848jatrt1htthvtdg2t7g0i04qvqvnhm', '101.53.254.132', 1615906516, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363531363b),
('849e9cb2e363ab09a50d4d82781754b853b761db', '101.53.254.132', 1613682263, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333638323236333b),
('84b06ba17c39a8da33babf91ded0a246664db0f6', '101.53.254.132', 1613831410, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313431303b),
('84k6phu1glh5khado6oduchrvk2u8is9', '101.53.254.132', 1615192538, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323533383b),
('850fb1679ec8bfc7918fc4fca240e1c8f575739f', '129.213.109.135', 1611901458, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313435383b),
('851e3bf9267aedb3da7866e24991519391cd119f', '101.53.254.132', 1613833009, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333030393b),
('8591tdvg39g3421uu88ps9q9cec425qa', '101.53.254.132', 1615192639, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323633393b),
('85cbbbf670d73b6f867e0388fc3c7cf64ff74c94', '184.170.252.252', 1609754568, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343536383b),
('85cfed2cf9ee27578c2ddc5e61091ef04434f477', '159.203.112.128', 1609928147, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393932383134363b),
('860bc140fb1f676245e0b9d2b00116db87efbda8', '119.160.100.91', 1614624563, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343632343536333b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('8654a01bd33172310f80a5d918349a34d766efed', '119.160.100.175', 1612375656, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323337353635353b72656469726563745f75726c7c733a34303a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f696e71756972792f76696577223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('8686a91b894532f47a1d0d68cc71976d9a70b7a7', '101.53.254.132', 1613831859, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313835393b),
('868da52d5f56cd6aa8d88a837ed39ab953a781e5', '101.53.254.132', 1613832276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323237363b),
('869f08a85fd0fdb63a88a04e0fa56735b5998a67', '166.62.80.109', 1609448322, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393434383332323b),
('8755c43d854f9b7c48c22445aeb805c3d90ed1f9', '158.101.115.177', 1614614267, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343236373b),
('878f4d2fd3d1dc80635b6c919d2f6229966954bc', '212.83.146.233', 1606550843, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363535303834323b),
('8796e9e27e6ac57afec4ff6223fe404c78918a43', '184.170.252.252', 1609754556, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343535363b),
('87e99ff3ad064eb402fd1a3f35b86c9ca986966d', '54.36.114.53', 1616153855, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333835353b),
('87hkrg87ug4fn4t55sflve8kjnbgs0kq', '101.53.254.132', 1615316490, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363439303b),
('88122dc89be42722389e53f96f336a5eda7670e3', '101.53.254.132', 1613771199, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313139393b),
('8842c2cdad07cdcd4e7b96c18e3ab39a22ae746c', '106.53.83.56', 1610664259, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303636343235353b),
('8845e5e2eee3e03db5ad23ea2af00921c38202af', '54.36.114.53', 1616153931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333933313b),
('8854ccdd668f7a8ecbc255faa5d83bfd879c02de', '119.160.100.91', 1614624079, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343632343037393b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('88922705193eaf1171f8bb1365fc2279ee318816', '138.246.253.24', 1614334925, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343333343932343b),
('88c677f752dec3a6153bac7979cc96439f6d1440', '209.17.96.178', 1612600817, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323630303831373b),
('88ce8f01426baf040e44567dc38f45458d4c6b64', '54.36.114.53', 1616155719, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353731393b),
('890b5657838534491a1d62235b113b50aad53e16', '5.104.111.253', 1613764663, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736343636333b),
('8957fe8c5582ac23e3c057d532946c452c9211de', '101.53.254.132', 1613679517, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333637393531373b),
('899fe3bf8cb6d5f761185f0ea1c17006b7a678ad', '101.53.254.132', 1613833143, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333134333b),
('89b099a6b8f2919295d6841ed2b30f3fe535b17c', '54.36.114.53', 1616153931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333933313b),
('89b628e3bad8ace1631f8e005ac35af9334c08ba', '101.53.254.132', 1613832815, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323831353b),
('89q3eiqvo5qu8rinaupb309fa35s1adp', '101.53.254.132', 1615317124, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331373132343b),
('8a38bde0c034afdb0143a2fb5fd4726098b08b88', '101.53.254.132', 1613832535, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323533353b),
('8a5af30ca9b4bbfd20c25f17bb844b13155b6575', '101.53.254.132', 1613834609, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833343630393b),
('8a6hvep81101mrfc9gfqmo9ufbhvie5q', '101.53.254.132', 1615192500, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323530303b),
('8a8cfbb975e0bbb771f24dd887ba458944acc15d', '101.53.254.132', 1613832815, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323831353b),
('8aea4cf6a57e785ce64cb3676fa89da48398b9a1', '101.53.254.132', 1613832190, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323139303b),
('8apstb2pjmnld28bddrfged6lveem1kv', '39.42.73.202', 1614722517, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343732323438393b),
('8b43e493f7ee7e1eef0dff3edd3517874630fae5', '72.255.54.157', 1613593092, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333539333039323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('8b9cb00512330ca65da1c04b6751447b1878baaa', '101.53.254.132', 1613833148, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333134383b),
('8bbdc3b398798710c8f638bd3ea5e60d8ccdba32', '212.83.146.233', 1606701270, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363730313236393b),
('8bbf9f8959aa8bad3ca54f4505081987884bfae2', '72.255.54.157', 1613594076, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333539343037363b),
('8bc73be3ef93e0f33efda84a1ca28dab5104fb58', '40.78.153.184', 1614242267, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343234323236373b),
('8c05e644503107a7ee128d2882e5e1e1aa76b11f', '134.209.171.29', 1612127360, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323132373336303b),
('8c232bba270c1f00fbcece28b1fa12e5a4bf46cf', '5.39.64.29', 1614081646, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343038313634363b),
('8c2ildea3bdhb0lc8g0iiek1uoef983l', '101.53.254.132', 1615905763, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353736333b),
('8c7aaea3c946886b3cd110ff17d2ca5d21f5de3b', '39.45.212.243', 1614643488, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343634333438383b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('8c7fpanvijckn0v3hb5me7l35jftv1il', '101.53.254.132', 1615316597, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363539373b),
('8ce67164be6e8f254c139ae13e733c1eedb0d7ae', '184.170.252.252', 1609754571, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343537313b),
('8cmufh8rtshjsann7b7gnli8pv4scqc4', '101.53.254.132', 1615316482, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363438323b),
('8cqm7d18rjpmpm39f9cavojh5vaq9d54', '101.53.254.132', 1615905764, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353736343b),
('8d9876a5bf5f4cf6615322c67793faba14efbd67', '107.180.88.41', 1612717022, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323731373032323b),
('8da3hqqep4okt2aooq641n6lbmo127mp', '101.53.254.132', 1615906615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363631353b),
('8ddc257347e412803090c1e0f54adbbf2abe3636', '54.36.114.53', 1616153777, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333737373b),
('8def0abac298078a35a63a8b4822aa66bd222f79', '101.53.254.132', 1613831714, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313731343b),
('8e1f12308a5d9adf2af7608f4192af6c75296c9f', '184.170.252.252', 1609754530, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343533303b),
('8e286207285db30876eafcb8517989182acbab53', '54.36.114.53', 1616153670, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333637303b),
('8ef17cddb3117a6545a42ce2cd828261f5a68463', '54.36.114.53', 1616153993, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333939333b),
('8efj3caas711jm4m1c1qjvrggq1n0jgg', '101.53.254.132', 1615316261, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363236313b),
('8fdhuhobcd1nceemovjjhcfalid2gl42', '101.53.254.132', 1615906371, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363337313b),
('8ffd6c375dac3a5751db7af15ba91ef0c94dd0da', '101.53.254.132', 1613682857, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333638323835373b),
('8hpq4erefjql7p963c3u1t86ik7rgedi', '39.45.212.243', 1614681706, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343638313730363b),
('8k76nset2cf4k945su14odhh8a3io3ij', '101.53.254.132', 1615901952, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930313935323b),
('8l6cfubh2285kuh9m8rnubljpn2kfebo', '101.53.254.132', 1615906385, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363338353b);
INSERT INTO `rm_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('8og0mbab88jjbsp801g1s5cpfd1vhv6l', '101.53.254.132', 1615903744, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333734343b),
('8ognvejiqfav2kv7rno32496t3lrb02n', '101.53.254.132', 1615906973, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363937333b),
('8q060c3aug219oe6j81j22l1s1b0cdjf', '101.53.254.132', 1615380240, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303233393b),
('8q57nla02fc5i1gke5tptpch0rvu9ts0', '39.45.176.96', 1615165769, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353136353732343b72656469726563745f75726c7c733a34343a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f666565732f6475655f696e766f696365223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('8q5r8jipsiauvd96tsjbaij83kp9jcs7', '86.106.143.229', 1615558995, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353535383939343b),
('8sbe6ib0kkrmcs170kb3nrks54oaui6r', '39.42.72.203', 1615401814, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353430313732393b),
('8t2gec1925sl06127mui8e33enlvmm3u', '101.53.254.132', 1615906841, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363834313b),
('8u59vmpimmjtu8ggo4ipu1b329rs7bv3', '101.53.254.132', 1615903592, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333539323b),
('8ubnr6di3d2jg9hs1fsgv2t6vvttigog', '101.53.254.132', 1615192621, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323632313b),
('8vf3eja5u4tj72rtnmk4ukn3b4ulskch', '101.53.254.132', 1615906947, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363934373b),
('8vgdf3l0ukpn0mjq1e5ap3b26amsmg68', '101.53.254.132', 1615379776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393737363b),
('8vrdug4iqmmg3a4sgljvei4ihi2f1b6l', '39.42.73.202', 1614722855, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343732323536383b72656469726563745f75726c7c733a34353a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f70726f66696c652f36223b6e616d657c733a31313a2251616d6172206a61766564223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2239223b6c6f67676564696e5f7573657269647c733a313a2236223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('8vt0gu7709hgo4b8p44trqututvh8hs2', '101.53.254.132', 1615380280, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303238303b),
('8vtovm7e1e2ak1jols9m1qr3km1tpifn', '101.53.254.132', 1615903078, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333037383b),
('901e43cd8a380d8f9e61ea446107918d965ccbd7', '101.53.254.132', 1613831854, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313835343b),
('9022f9a5f9aaae6157a33f64e01aa82e8e8a5ee4', '54.36.114.53', 1616153685, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333638353b),
('904001e1b26374992ca77a75d1e69f4cb74747f2', '43.245.10.82', 1606652851, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363635323835313b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('90653c3be5de14bc216224d02c5066818ae3fef9', '101.53.254.132', 1613831537, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313533373b),
('90867f3ce017e8c0c0ccebcee79ed8f514054927', '72.255.54.157', 1613591959, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333539313935393b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('908eb4d266e03cb8b84b0f08e379de8159e8a703', '101.53.254.132', 1613834572, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833343537323b),
('90968745c24e546d704010d7c745827ad4a97353', '39.45.14.237', 1612375655, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323337353635353b72656469726563745f75726c7c733a34303a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f696e71756972792f76696577223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('90a142485968322c798f22816641c33f786d93f8', '167.172.56.36', 1608220488, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383232303438383b),
('90fu2j7qd4t0u0gp4lhgmbmc0b4quljm', '101.53.254.132', 1615371918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337313931383b),
('90oblk79ajk47atjn8rk53qmd4h9kqaa', '127.0.0.1', 1606351202, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363335313230323b72656469726563745f75726c7c733a32373a22687474703a2f2f72616d2e746573742f696e71756972792f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('911931e3877f403658e11ad2629049776df586f6', '129.213.109.135', 1611901460, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436303b),
('913e6b800af9da0330cd84d8050ceea12869ba81', '184.170.252.252', 1609754527, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343532373b),
('91dca275454de8c5f3219c2a4b564c16e532ddc2', '184.170.252.252', 1609754565, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343536353b),
('921q3scrb8tgfjsqkfs2ju6av5i0cih3', '72.255.54.157', 1615925930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353932353932353b),
('9253439ecd3891bfecc3e0185bd266adae77344b', '158.101.115.177', 1614614270, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343237303b),
('9295b554174b8fed1e4c49452b49e003409d20a5', '101.53.254.132', 1613831762, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313736323b),
('92roelur6ncbg5cekgtdn5dkgm88ujfv', '101.53.254.132', 1615903625, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333632353b),
('933238c8ea1b4ad18815259b0952a0c8c25265a6', '184.170.252.252', 1609754566, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343536363b),
('9355962c3b3d90301bea93da1942050bb4409911', '62.210.185.4', 1611511385, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313531313338343b),
('937db6f8299add362502540231a589bd8ffd4074', '101.53.254.132', 1613771181, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313138313b),
('93a51f10cae63c0874a2201f594681f478abe079', '54.36.114.53', 1616153920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333932303b),
('93ace6818da685439c193d059a8c015c8071ada1', '101.53.254.132', 1613835239, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833353233393b),
('946095e1e6caba95e6dcb42de695d659e84e55ec', '13.239.41.77', 1614036649, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343033363634383b),
('947156f7604f898837eaaf6e71477521709d52a8', '138.246.253.24', 1609402181, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393430323138303b),
('94peve6ddv9oorbmur1prff8racjm23v', '101.53.254.132', 1615192667, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323636373b),
('95022eedfa633d49e55a3f884116a60644bc8620', '39.42.65.245', 1606579095, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363537393039353b),
('9524710ffedba84e741568a861e2605503c3d050', '158.101.115.177', 1614614268, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343236373b),
('954f96f0d75488a6971682d9c1362148db0833e7', '3.16.11.92', 1614025576, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343032353537353b),
('955i9c8sbnmjlna7ljuvolrv2ad6r6g0', '101.53.254.132', 1615902989, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930323938393b),
('95870f847761d4587267e1e6b059d0ae85266ab7', '54.36.114.53', 1616153728, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333732383b),
('95a37825704d99eec0b1b8cd98414d972182fbdb', '101.53.254.132', 1613833057, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333035373b),
('95a506b75c64ca82e616fa5bffd11190172cc2b7', '54.36.114.53', 1616153932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333933323b),
('95d0c876cd67f8a79256fa05fcc56d969e95bd93', '101.53.254.132', 1613834572, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833343537323b),
('95f2f43e655dbdc0664db1602a233c3128996d27', '101.53.254.132', 1613832174, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323137343b),
('95lgmtgqhbfab367on8qo0faeddftl2r', '101.53.254.132', 1615368970, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336383937303b),
('95n6pohus44gl6bimrq0gihr7bo7tvkn', '101.53.254.132', 1615380389, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303338393b),
('9632d3619e9c9851ffbdf2cee40957cfcb47d821', '39.42.65.245', 1606583965, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363538333936353b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('966da0484d5b763cde5742021b5f1d47dc896728', '184.170.252.252', 1609754552, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343535323b),
('96a94d51df86b1f08937fa94757a953689b86e00', '101.53.254.132', 1613771610, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313631303b),
('96b8ce7cb7853a350ed1caed86f0ee86f65cc1cb', '101.53.254.132', 1613835045, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833353034353b),
('9705f8e6c5aabb9cc3dbfdc8bf24e66d2146a135', '5.104.111.253', 1613766253, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736363235333b),
('9766737000a8122d038d97a8098c84e76063109c', '209.17.96.138', 1609102924, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393130323932333b),
('97aj6acd0l98pn6foj268cu2as78q35m', '34.215.69.55', 1614670212, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343637303231323b),
('97d5c16d4366404cd539de1ee54c2a0512ff71eb', '43.245.10.82', 1606654487, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363635343438373b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('97jr21l0kcmi45s3nc18c040v7es2jbu', '101.53.254.132', 1615907084, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373038343b),
('97k3qc8vs4jift1rb5vlk1fs95nt6noc', '101.53.254.132', 1615379643, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393634333b),
('983nhb8l8a1dsfknfb4nbgsi0n3r08mm', '101.53.254.132', 1615312578, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331323537383b),
('98bb1bo9glhcncepjvaa6mrj7lgpj8vp', '101.53.254.132', 1615907035, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373033353b),
('99pcuko3k6sp7viunak5cfl4vqmjeaha', '39.45.41.33', 1616091820, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363039313630343b72656469726563745f75726c7c733a33393a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('9a14s0ubb732056bf0oh9dj4gvgg2n3a', '101.53.254.132', 1615903178, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333137383b),
('9a207f14ebf8926e58815408c11b6290440664a6', '72.255.54.157', 1616095494, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363039353439343b72656469726563745f75726c7c733a33393a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('9aa5f498ddf66398db97d250d2c9650308411194', '72.255.54.157', 1614634427, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343633343136323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a34313a22496e666f726d6174696f6e20486173204265656e2055706461746564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d),
('9aaj9st553j0nl9a5fpmnlbv10mer9hv', '127.0.0.1', 1606355597, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363335353539373b72656469726563745f75726c7c733a32383a22687474703a2f2f72616d2e746573742f696e71756972792f76696577223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('9ab24df509382d22074c8514441bb818f416285a', '101.53.254.132', 1613833137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333133373b),
('9aece800ce63259786bc21646178dbdcded5a4a2', '101.53.254.132', 1613649870, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333634393837303b),
('9b025ece9c40994162bfbc30c8e9774d917a6d6d', '101.53.254.132', 1613832627, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323632373b),
('9b2158dd1016e30b293fb806ba6b50416669e8d4', '54.36.114.53', 1616153776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333737363b),
('9b4qf27j85ohg2qkftv4ratt4r51gfnd', '101.53.254.132', 1615907039, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373033393b),
('9b91e51be813f581b8f6dadc872800564e2d9260', '209.17.96.218', 1608372291, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383337323239313b),
('9b9e35077f6ba312ddf0f67212b1e9e5bfc9905f', '184.170.252.252', 1609754536, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343533363b),
('9bc68g2jhvg5n1h2tlgpg67biovl0kr6', '101.53.254.132', 1615316439, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363433393b),
('9bdpeqcs87ngv263ed665l7m169m2v45', '101.53.254.132', 1615906974, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363937343b),
('9bf7fca6a4c983f47c74fa5f105d72d78d86f359', '39.45.153.20', 1613341824, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333334313539313b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('9bl4qfnp1bqrsjkg4blujimht4amhs9j', '101.53.254.132', 1615380336, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303333363b),
('9c0ae85e94508f47a85d7662ef86c20b8cd1b7f7', '101.53.254.132', 1613771071, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313037313b),
('9c1ebd1c843ecfffd283396988b0ab9afe31df51', '101.53.254.132', 1613827563, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333832373536333b),
('9c76fd67d6a997c1be718351454cb26b9052b921', '129.213.109.135', 1611901462, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436323b),
('9cim5dbdb1jdgi7nc790v6rnv3tcf4u3', '101.53.254.132', 1615380389, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303338393b),
('9d120f67d783b3ee49a128d6ac78fd831dabb073', '54.36.114.53', 1616155074, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353037343b),
('9db4ec82146c8e6c67ba59e97f3258a920b2b6f5', '43.245.10.82', 1606653771, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363635333737313b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('9dd0eeacef90ddbc12859223cc38fb46ac6cc101', '39.45.212.243', 1614644435, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343634343433353b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b70726f66696c655f7461627c693a313b5f5f63695f766172737c613a313a7b733a31313a2270726f66696c655f746162223b733a333a226e6577223b7d),
('9e67d3002b0ad3a6310c38c7a3d47b40da8df3fc', '31.220.0.202', 1613038784, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333033383738333b),
('9ebc1214a68249877e63989efd4d40d6f6cc9d00', '40.78.153.184', 1614247411, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343234373431303b),
('9ec185eeb889263e35230ce45f9953d70e7737b5', '194.154.192.87', 1614024552, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343032343535323b),
('9ef389a8f5c7817db1160f0f6c385c95dda439fc', '39.45.11.201', 1614041192, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343034313139323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('9f04775f212a6fbca9c2d4e1c962c77dbdc4b41e', '209.17.97.90', 1613022744, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333032323734333b),
('9f6034c46957c6381de1e2286071d64f09d47151', '101.53.254.132', 1613771610, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313631303b),
('9fbb84b89bacb452ee39af32a64cb6ba3cfcb009', '209.17.96.50', 1611155930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313135353933303b),
('9ffte3lf23gt8vo2nt6gopf93gvk12pj', '52.192.73.251', 1614773166, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343737333136363b),
('9fheg0je0jsa5vqi25q9bpovjds8aoe8', '101.53.254.132', 1615380685, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303638353b),
('9fhgia7rrflib0og45a31e64hvngotr5', '101.53.254.132', 1615380669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303636393b),
('9fj8vkn4dl42kk73h49db902ukb7nsi6', '101.53.254.132', 1615368734, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336383733343b),
('9h0vpbght30j2osn7oo2351oroeeniq1', '127.0.0.1', 1606348916, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363334383931363b72656469726563745f75726c7c733a32373a22687474703a2f2f72616d2e746573742f696e71756972792f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('9hpsbp50tut2ea90h4ig6e4204eopaoq', '101.53.254.132', 1615903401, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333430313b),
('9i0bfvdd13svmo01pgme0qcn5irl20v7', '101.53.254.132', 1615380684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303638343b),
('9ipnotmi9vsd55riafgvvkm3k2d5s1sq', '101.53.254.132', 1615570745, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353537303734353b),
('9jlv8n022a5miu5396j3rvjd72i7e26a', '101.53.254.132', 1615906989, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363938393b),
('9lh0eggc4812ln7o3gmdqv9r0lqadot9', '72.255.54.157', 1615399860, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353339393537313b),
('9n7h4tvl54pl0q95ee6pjehn57kmcmq2', '101.53.254.132', 1615906964, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363936333b),
('9nak0ncmglos0itpekmk3uqhj87qdv24', '101.53.254.132', 1615192510, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323531303b),
('9p895ciimou4fjqj46kcam2efe7o306o', '72.255.54.157', 1614685921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343638353837343b72656469726563745f75726c7c733a35303a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f6f6e6c696e655f61646d697373696f6e2f696e646578223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('9pme6li3i1k6is0jli2ofvop3asrpqrc', '101.53.254.132', 1615906615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363631353b),
('9q66266m3j9n2jvalr24e7oonq84tlhb', '101.53.254.132', 1615380227, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303232373b),
('9r3p6u2bfcjlfjd1f7ek1kvr4ndaomae', '101.53.254.132', 1615312589, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331323538393b),
('9sgim5v1mif5fehka5fsiulsgj95e911', '101.53.254.132', 1615368730, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336383733303b),
('9sq9lncissgmhmggvegltkkj6fb6co8h', '101.53.254.132', 1615905831, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353833313b),
('9t5b5vco5enttasr8qonr8c75827q9he', '39.45.176.96', 1615158249, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353135383035333b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('9tm5pokdl06dfigl7759s2la2a2mc7kr', '101.53.254.132', 1615906923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363932333b),
('9uanf03b062vahgvmaoull5i1e8lk1hs', '72.255.54.157', 1614718503, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343731383530323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('9ubs2uubap07g4laruhrphs00sl34f0g', '101.53.254.132', 1615379776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393737363b),
('9vamrrvbtqb6in6t4jiv874qo01mjo1v', '101.53.254.132', 1615368970, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336383937303b),
('a08579d5c4eb41bf4291aba55b719630c417e2e6', '101.53.254.132', 1613831894, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313839333b),
('a0f18d2c3551ff64893086f9ba3e02109fced612', '39.45.212.243', 1614640178, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343634303137383b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a34313a22496e666f726d6174696f6e20486173204265656e2055706461746564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
('a0il9ii8ubp36u43s9r9rt3kggpbnf74', '101.53.254.132', 1615906936, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363933363b),
('a11o3ud7sbkpmmc89dj3ir56lvglbhup', '101.53.254.132', 1615906935, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363933353b),
('a16402ae69ac29225aaf292313159119a0982355', '5.104.111.253', 1613763873, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736333837333b),
('a1rauknca4rbhlsslm3kmlk1calnnl3s', '101.53.254.132', 1615370136, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337303133363b),
('a29f1549bdeec684a98ee6ce66486ebd9d09a626', '101.53.254.132', 1613831670, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313637303b),
('a2afba900c4844f3775b96fd4d2ea94534a19b92', '54.36.114.53', 1616153728, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333732383b),
('a2tpp4i4hhandc80c39th4rmaegsff83', '101.53.254.132', 1615316828, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363832383b),
('a306e879d0ed596e205f45a6455637d9e67fd7c8', '51.158.118.231', 1614552319, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343535323331393b),
('a38d74bd0ebfb0f2d54c6328d67507910ab117ed', '54.36.114.53', 1616153777, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333737373b),
('a3o5ipbj0s00ofk2i5kuki4uubqcqmrn', '101.53.254.132', 1615380364, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303336343b),
('a3rmaf3gsolmt6tfbur4ad5uh1buoo60', '101.53.254.132', 1615903078, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333037383b),
('a46c00b9d67d6bb75aa9aa11a8fff8d0e6c5eb0a', '54.36.114.53', 1616153668, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333636383b),
('a49a0edefb0ab95bba81faf7c36e75e835743d60', '54.36.114.53', 1616153855, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333835353b),
('a4hg58iei04hamonm4s8rbv93jnonqck', '101.53.254.132', 1615906528, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363532383b),
('a4vbptjg1pfdc5mj3pts5te4nor2kqgm', '101.53.254.132', 1615907039, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373033393b),
('a53a4ea6d4cd0201d1c2789921b13f13994116db', '54.36.114.53', 1616153707, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333730373b),
('a547dec1f031390bc9f7b1d114bf6771c2d187e9', '184.170.252.252', 1609754554, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343535343b),
('a5afv3svmr59ta29cbjh9tspp8t6qcis', '101.53.254.132', 1615906974, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363937343b),
('a63a6c99d3806734175dd3a2d740486ddb6ab8db', '14.200.1.238', 1613941149, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333934313134393b),
('a651b5648c50e0f3e782b9471c048bef0f4ce1df', '72.255.54.157', 1612336646, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323333363634363b),
('a68e527e7eeb0e03d9e69c5818e2e7489426e41a', '54.36.114.53', 1616153920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333932303b),
('a6e18527bd3bd2ac6da6aff1658fa6a4485756c2', '39.45.212.243', 1614641115, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343634313131353b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('a7ce2811dfe9ccdb1af3564468614997df63a62e', '101.53.254.132', 1613835052, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833353035323b),
('a7f2447efe79765b7b7cf1dcc5449a9c805633d7', '101.53.254.132', 1613832542, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323534323b),
('a805ed5a7224dfec2fa0d49de178cb11867b2f19', '101.53.254.132', 1613832054, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323035343b),
('a80fa56dpli0vgk8fdopigvjppvusbrn', '101.53.254.132', 1615906924, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363932343b),
('a81fa64f59249eb31a9ed58e7e9abbe42c829cdc', '54.36.114.53', 1616153920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333932303b),
('a8e06c2d3frifcib202a03qjhfqeoje0', '101.53.254.132', 1615316449, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363434393b),
('aa9q8qoaquig8hvgncjd76annc038hg6', '101.53.254.132', 1615380335, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303333353b),
('aab5f28f7a5ac3cb7a3ccb5180c8dbdbd52ed732', '101.53.254.132', 1613683014, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333638333031343b),
('aajs7cb1cifdr6jdnrvn2lnnpc726b4f', '101.53.254.132', 1615906635, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363633353b),
('ab680e7598a697232e8aba9c11305cdfd54fd4c7', '101.53.254.132', 1613832031, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323033313b),
('ab85ad7d547ee907ad9403696324165ebf781e13', '39.45.212.243', 1614597017, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343539373031353b72656469726563745f75726c7c733a33363a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f686f6d65776f726b223b),
('aba381b0c3b02290fb2c80b3df9f884908d851cb', '129.213.109.135', 1611901460, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436303b),
('abb6d020335b9140116720a98070680ac3bdaff8', '39.45.212.243', 1614642783, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343634323738333b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b70726f66696c655f7461627c693a313b5f5f63695f766172737c613a313a7b733a31313a2270726f66696c655f746162223b733a333a226e6577223b7d),
('abd1738202994e963a106e927dceef825b9580ae', '39.45.212.243', 1614548644, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343534383634343b72656469726563745f75726c7c733a33373a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f64617368626f617264223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('abnkinhi2hog0uvmmklko1hsd4jr2uvd', '101.53.254.132', 1615906783, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363738323b),
('ac19f1bc67b73cad66686cdcfcc9b580c889bb55', '101.53.254.132', 1613683016, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333638333031353b),
('ac21124d6f3e4be89d7ad7504c601d70576ef1ba', '101.53.254.132', 1613832678, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323637383b),
('ac6af5543bed1357657823dce6fd032ab14495f3', '101.53.254.132', 1613832836, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323833363b),
('accfe666226d926dd0507af5a5de760e2fea0cf8', '101.53.254.132', 1613827630, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333832373633303b),
('ad68739ebf2299c14c5374a376cde50c3b730cc5', '101.53.254.132', 1613770564, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737303536343b),
('ad7ffed3535646462c76c6ebc5afe69f4054dd1d', '184.170.252.252', 1609754522, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343532323b),
('ada9e278e5324deafbd4d82814ed69ee569b2c03', '54.36.114.53', 1616155070, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353037303b),
('adcdd90ecd5b93f64a3d656d2b0b3127040a008e', '101.53.254.132', 1613771610, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313631303b),
('add5faa6bbc6c6f2b6016aa54089371ee1139098', '129.213.109.135', 1611901462, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436323b),
('ae1dcrsc8rdr0hgpgifd7ats78unrkgd', '101.53.254.132', 1615906385, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363338353b),
('aecd18668ceccba359b004f330ebe7e030ca309a', '39.45.212.243', 1614548126, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343534383132363b72656469726563745f75726c7c733a33373a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f64617368626f617264223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a34313a22496e666f726d6174696f6e20486173204265656e2055706461746564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d),
('af236a4ecab0921854902ad06a455ff409e83e08', '101.53.254.132', 1613828254, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333832383235343b),
('af2d6880a72cc569d35ad55fd10cc16c51b64c62', '101.53.254.132', 1613771402, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313430313b),
('af8a559aed6e2eb94e9fc5a73cae6d75b52168b7', '101.53.254.132', 1613832543, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323534333b),
('afc45c7789e24f0c56ccefc4a0ec675df7dccccb', '54.36.114.53', 1616153669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333636393b),
('agb8i8isq9sd24t7b6vl6183mqrh52dt', '101.53.254.132', 1615906957, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363935373b),
('ah1jjb81vhu4mqrkvl51iapc0q8p8vd9', '101.53.254.132', 1615906713, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363731333b),
('ahhsn8r60it7pcafs5ctc3p37c1psvpf', '39.45.10.36', 1615837175, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353833363931363b72656469726563745f75726c7c733a34343a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f666565732f6475655f696e766f696365223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('ak2f5a40ebtteu6kqkb7qtblsmvuhtn6', '101.53.254.132', 1615377070, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337363832303b),
('alj0ehv4rom0d3558eimq1iacpbehff4', '39.42.73.202', 1614725864, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343732353630393b72656469726563745f75726c7c733a34353a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f70726f66696c652f36223b6e616d657c733a31313a2251616d6172206a61766564223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2239223b6c6f67676564696e5f7573657269647c733a313a2236223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('alo2m750n55bk8lvi0mr0jue2gbicdqv', '72.255.54.157', 1615926860, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353932363737353b72656469726563745f75726c7c733a34353a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f70726f66696c652f38223b6e616d657c733a31313a2246616b68617220416c616d223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a323a223131223b6c6f67676564696e5f7573657269647c733a313a2238223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('alv0d5v6nb7cg2nfuvj670thr84l6jm1', '101.53.254.132', 1615906936, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363933363b),
('amcvpf924iq6hei2vbovfi0hioailuta', '101.53.254.132', 1615315521, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353532313b),
('amhmhd9au15lcl28o6llp7bvqddpjs7b', '101.53.254.132', 1615907009, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373030393b),
('an88d2s4mr52mj6q16ledr1kvrbcauhq', '101.53.254.132', 1615312684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331323638343b),
('an9msq0l89fl0ul9l9kn53c9ql2md87p', '101.53.254.132', 1615192561, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323536313b),
('anrvddk4qftig93bhjgu16lhok9res66', '101.53.254.132', 1615380684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303638343b),
('aov5ise8obl75qhjkbgib532rt9npigd', '101.53.254.132', 1615315710, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353730393b),
('arbtc0qivu6an5tvt3smhadk5atocu6h', '101.53.254.132', 1615313133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331333133333b),
('arm00a6uql34b2p9ums9k5fvr670tmfu', '101.53.254.132', 1615905468, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353436383b),
('aupfueh736anndgjkm6pcrv97sqgkoa7', '52.192.73.251', 1614773167, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343737333136373b),
('av53tpk3fdatrnead767oagdvdbr8pa1', '127.0.0.1', 1606348610, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363334383631303b72656469726563745f75726c7c733a32373a22687474703a2f2f72616d2e746573742f696e71756972792f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('b00c991cee0186c165bb09d5427ed54ee391fa57', '51.15.195.246', 1614408131, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343430383133313b),
('b022e98cb1fb19d5ba22a3d9065206179835c4bb', '158.101.115.177', 1614614268, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343236383b),
('b09775a9e9a45cbd2ae07e2631b8766223306df0', '119.160.97.132', 1606656822, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363635363535353b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('b1028afbeda537e8021b1d5a1eb134afc1dced9f', '54.36.114.53', 1616155041, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353034313b),
('b10e3u412ffjnklb0ro5n2qlpq35dlic', '101.53.254.132', 1615906923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363932333b),
('b10fa476f8aa8d31200538df3dd321f86fbd10b1', '51.15.191.81', 1606704933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363730343933333b),
('b115251850cde13784a7b2062d11037cd1663f07', '209.17.97.82', 1610545260, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303534353236303b),
('b1414b9b4ee9761e2103a3fd190565c02bc1add4', '34.236.202.207', 1613980879, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333938303837393b),
('b16ad64b399feb70c7f8fa5138b5a45d2dd94110', '101.53.254.132', 1613832933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323933333b),
('b1983c3af805777aff7e18fe73819c5ba6aeac7d', '5.104.111.253', 1613763764, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736333736343b),
('b217eb45732aa2231d9895e7f713831aac00940d', '129.213.109.135', 1611901463, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436333b),
('b21d3c3eb28e161cf2c9820b42e68a56cf18842d', '101.53.254.132', 1613831747, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313734373b),
('b254b2eafa00174716056feea49f600847a2ffa3', '209.17.96.194', 1608673967, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383637333936363b),
('b25ec4bb5308ac05b8a1c658e1883438ec223ae4', '101.53.254.132', 1613831835, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313833353b),
('b288baca183050af61d6a43211f423a25fec3230', '101.53.254.132', 1613832244, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323234343b),
('b2bc4a92ee6f043d24a9ce1560fd9fe89fd4f7fe', '72.255.54.157', 1613595296, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333539353239363b),
('b2e19573e0fa1b1f86522902f808cee694f1b728', '101.53.254.132', 1613833067, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333036373b),
('b2r8rform4outpepptiir3kft7u87474', '101.53.254.132', 1615905642, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353634323b),
('b393cb17fbea296e52e12fdfb8402be5f47c6b13', '5.104.111.253', 1613766079, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736363037393b),
('b3f05846118e79f58229c05cea3108bfbeb1c25a', '5.104.111.253', 1613764451, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736343435313b),
('b3ib4c0ddv2553t685vaqbbtv0l6v2dl', '101.53.254.132', 1615379799, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393739393b),
('b3o2516upc48vh6k67bglkarl75jr7ik', '101.53.254.132', 1615905857, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353835373b),
('b3sq6tvrp3basr5ttrl78jhtqg8akfug', '127.0.0.1', 1606347153, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363334363837303b72656469726563745f75726c7c733a32373a22687474703a2f2f72616d2e746573742f696e71756972792f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('b40l0v2br49rkgs1e376adrgu3e4v76e', '101.53.254.132', 1615316641, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363634313b),
('b4714c38992a9b186185b551aafe833401f420f7', '54.36.114.53', 1616153919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333931393b),
('b484dfe681f77bc027058ada1f76f82098d9d6a9', '101.53.254.132', 1613831866, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313836363b),
('b49606aad6899f81abb2bf240ee7bb7f9989370b', '54.36.114.53', 1616153728, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333732383b),
('b5257740fbe81000ec80bc680656b377bc0321fb', '54.36.114.53', 1616153685, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333638353b),
('b59bb0a52bcb87c23892e9186770530738752b54', '184.170.252.252', 1609754529, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343532393b),
('b5de325ut6n67l87p7lo4ldo6ngmcfim', '39.45.176.96', 1615162576, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353136323239393b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('b5ea23f76084633dc7fc16c37f485b0d47801076', '158.101.115.177', 1614614266, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343236363b),
('b604c06c4f0e3b18d8ec7c876e332758ba082f60', '101.53.254.132', 1613832947, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323934373b),
('b625a095d90e5bcfe3081e5ecf181f1c04c79f96', '101.53.254.132', 1613833067, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333036373b),
('b65400ba7f43545117ae9c8d43116b89ca3beeab', '158.101.115.177', 1614614275, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343237353b),
('b66t203jgl1sssqf88ar7cnqa9g4pi1k', '101.53.254.132', 1615906963, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363936333b),
('b67f4edc03ea960c1777dd17b314e4e900b9dcea', '129.213.109.135', 1611901464, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436343b),
('b6c7a4cd5e3b00de87a54c9d5c3fec0989fb79ee', '5.104.111.253', 1613763708, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736333730373b),
('b6cf13158e310f74585197dbdf87fd5ef343fc78', '129.213.109.135', 1611901464, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436343b),
('b6u6elrarsu8eu2h6pj32gg8r86srunf', '72.255.54.157', 1615232034, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353233323033343b),
('b738a7606f06acfd496f61e9c760a6a33ebd5c63', '209.17.96.186', 1612644844, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323634343834333b),
('b74e92c4d9d1ef3787a662a4759fe1254df6f975', '209.17.96.82', 1612869660, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323836393635393b),
('b781ce8a1bbf05d3b737137003d852c09a96f3d3', '54.36.114.53', 1616153669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333636393b),
('b7be5fb95771c323ed259a797b3029c2c2b6920e', '101.53.254.132', 1613649880, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333634393837303b),
('b7eb672805a45442c7496c71039a4cd68ffd0fbb', '138.246.253.24', 1607180352, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630373138303335313b),
('b7rsa6hsm0ekqbo95tmbl95oq91q533j', '101.53.254.132', 1615377764, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337373735353b),
('b80dabe50c053b8cee5ab8ab05efa3b3c8d0308c', '212.83.146.233', 1606701645, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363730313634353b),
('b8964a1ba029ea30f4a2a98068893ec25ea84a59', '101.53.254.132', 1613828254, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333832383235343b);
INSERT INTO `rm_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('b8d7a88bdeb1cf465ffca03d3f35b8ef1e63f8c0', '39.45.212.243', 1614639554, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343633393535343b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33393a22496e666f726d6174696f6e20486173204265656e205361766564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
('b915f2c212a1cee2700fd9563473b5a943d14d27', '101.53.254.132', 1613832986, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323938363b),
('b91c33162c0733be9750aa7fdf6d6ac3f58affa1', '101.53.254.132', 1613835310, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833353331303b),
('b92a3g9nmuk3rh5o8jvdc8lv92sncr5n', '101.53.254.132', 1615321399, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353332313339393b),
('b998cf79d32cc0c3e4ee548ff2c9aa5796b685c5', '100.26.251.213', 1612951040, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323935313034303b),
('b9d283bee5318bf315bbc5d2e3ccaeac4cfa0cf5', '209.17.96.170', 1608639933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383633393933333b),
('bac1533c2bd8e7d134b3f191145d9ca080a5056d', '54.36.114.53', 1616153707, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333730373b),
('bac3v152algepbbvh3iav3m8072m2bdg', '101.53.254.132', 1615906695, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363639353b),
('bac8cb214d334e800e8e504ee53452b033602aad', '101.53.254.132', 1613833128, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333132383b),
('bb7b1f3444a4a74003b51b3a727c6c59f428cd7d', '54.221.27.173', 1611854690, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313835343639303b),
('bb9c7652b2922850391684f1f91f47d6c6d6dc12', '101.53.254.132', 1613832905, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323930353b),
('bbba82dc342d8c71424da9059a7962f3801fd866', '101.53.254.132', 1613828107, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333832383130373b),
('bbu39tb8qn1ftai082a313hthu00kmtk', '127.0.0.1', 1606336690, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363333363639303b72656469726563745f75726c7c733a32373a22687474703a2f2f72616d2e746573742f696e71756972792f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('bcb89fab8dbe6328038c9d9c89a370dd5fa09132', '39.45.212.243', 1614640791, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343634303739313b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33393a22496e666f726d6174696f6e20486173204265656e205361766564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
('bcbd915a151d510c50feb6701add9db9f8dba47f', '101.53.254.132', 1613832143, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323134333b),
('bcqf0o5lpqplp9ndv79fr4the108bn31', '101.53.254.132', 1615903132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333133323b),
('bd21ee93586acce589f607eb45088ba59442f86b', '13.124.214.108', 1613117076, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333131373037363b),
('bd8705eace24be1ad80ae900b487c4269d114cf7', '72.255.54.157', 1614108563, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343130383534353b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('bdbv8hmvee5jqf5gt8q8avfptrtpt9sn', '101.53.254.132', 1615371900, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337313930303b),
('be1635ddb2eb0ef35aecdd7254f26ffece27d853', '184.170.252.252', 1609754540, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343534303b),
('be2e35df762ee435078fe6d683b9aaf27975dda7', '138.246.253.24', 1606991027, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363939313032373b),
('be943c6abcb56fc93a4ec2576053e4bd61b115a4', '54.36.114.53', 1616153728, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333732383b),
('bea6dbfcd1413368fea2aa1c3b47b00cccfd328a', '129.213.109.135', 1611901459, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313435393b),
('bekngr07mms36ijvlthsue5132dd9r9g', '39.45.10.36', 1615834440, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353833343337333b72656469726563745f75726c7c733a34343a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f666565732f6475655f696e766f696365223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('bemq24ofcq13n7ke4ulojlvilvnlppqu', '101.53.254.132', 1615315882, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353838323b),
('bet5mgt37pee7k3fr5htf30qsqfprdqb', '101.53.254.132', 1615379578, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393537383b),
('bf1b3e4c9065e664b4becb6df1589b56db27be0a', '158.101.115.177', 1614614277, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343237373b),
('bf1b5d8b36db5c5d4c631b7c4325c959ef844411', '54.36.114.53', 1616153768, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333736383b),
('bf4fff2cff6e854979788702f5a7d93404517120', '101.53.254.132', 1613832609, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323630383b),
('bf8dad43c458958324eaa96bb8e1e2db0a5d647d', '54.36.114.53', 1616153920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333932303b),
('bfc2s6cqn7bnlia3ie543cg4ikplbali', '101.53.254.132', 1615906384, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363338343b),
('bg6683etr40njeiemmaqf325hlqsggna', '101.53.254.132', 1615906528, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363532383b),
('bg8r06g88rqoh1g9hk8kmnibv8ag43qh', '72.255.54.157', 1615399468, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353339393138373b),
('bg9do55loknpalviud5s1vp3hblj71uj', '101.53.254.132', 1615316469, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363436393b),
('bhr0804nve1v7ueg12hgl5qu0bt06a21', '101.53.254.132', 1615905856, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353835363b),
('bjqldeans7790pn1ifp7fa2hiv3igcck', '101.53.254.132', 1615315666, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353636363b),
('bke04rtl5i0115po8624e27jmse8af7a', '101.53.254.132', 1615379501, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393530313b),
('bl1t1m6b5tk8kken1915fbnhg46lm2pq', '101.53.254.132', 1615906763, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363736333b),
('bl4t3rmk4661vnjnnuermnif949sper0', '101.53.254.132', 1615906851, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363835313b),
('blhrbs49o6nvogj1p2pl5d8d0gjmpmoq', '101.53.254.132', 1615380240, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303234303b),
('blsdidh8jn7dce56n692aemg87l9vq48', '101.53.254.132', 1615906801, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363830313b),
('bmvll28ja2cj78ba3sfiprib4rg6ren7', '101.53.254.132', 1615906948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363934383b),
('bo3tfmlvqp5a6eft9ere1qcsiqa82jdk', '101.53.254.132', 1615371681, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337313638313b),
('bquvd78hta4pqsbfokfv7kitlujj8stg', '101.53.254.132', 1615905763, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353736333b),
('br09hdqii9opiui1kgdt4vg0ofdfk996', '101.53.254.132', 1615030330, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353033303333303b),
('bta4vralldhtf5obp69f3g0689hvdu9q', '101.53.254.132', 1615907039, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373033393b),
('bu5qogmjn67bf6qvgjpub67ijd73bbk0', '101.53.254.132', 1615315876, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353837363b),
('bu73q9c818cvf8st1n0omf9l86m4fdn2', '101.53.254.132', 1615380701, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303730313b),
('bviuq9sui7qae7slqo9c1akvab2avuqm', '101.53.254.132', 1615906557, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363535373b),
('c01c890d6d3cf8e55037e81a94ff4ef4f7a92a9d', '39.45.212.243', 1614642482, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343634323438323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('c0910e8ecd0656693f05f1fc608f17afefe7a605', '5.104.111.253', 1613766296, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736363239363b),
('c0dkse1j5skcseucl8kd0lfd3p0defgi', '39.45.176.96', 1615165407, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353136353130343b72656469726563745f75726c7c733a34343a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f666565732f6475655f696e766f696365223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('c0e7513efce6ff28f10dd761b6b50a4d52f75c21', '184.170.252.252', 1609754546, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343534363b),
('c142m8rfopf229onuu4jm5vnr4dp5k13', '127.0.0.1', 1606354659, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363335343635393b72656469726563745f75726c7c733a32383a22687474703a2f2f72616d2e746573742f696e71756972792f76696577223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('c145def3f16f16485bc3638e548dcb18dd6b1808', '43.245.10.82', 1606653220, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363635333232303b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('c162580cad9b528d0dab6ee90611f175088fabce', '129.213.109.135', 1611901466, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436363b),
('c1e85edbbdc600e16113aaec53a30f4e7ee9a384', '101.53.254.132', 1613833143, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333134333b),
('c1f7cc9d8f50978522157a012bb7cb5ef57c384b', '34.86.35.132', 1613357254, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333335373235343b),
('c1inn1idpp8mu126av5bai63ga303526', '127.0.0.1', 1605899324, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630353839393037393b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('c2027f2304601212835ba9528375678d3bf345f1', '101.53.254.132', 1613832153, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323135333b),
('c222de55c5bcb868421208d43ff87d7790eeee01', '138.246.253.24', 1610255425, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303235353432353b),
('c27dfe845a44845b89efe00b31970ec998edddbd', '184.170.252.252', 1609754572, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343537323b),
('c28f721b3ff285e8edd983a3116aa143b8f215a3', '100.26.251.213', 1612951040, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323935313033393b),
('c2aujp9a90i0ihjsbi82ndbefd0cd7dd', '101.53.254.132', 1615380389, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303338393b),
('c2ji1gcbumconesnn1r0715bd03rlkot', '101.53.254.132', 1615906695, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363639343b),
('c39895534bb91ae89ae23dedb570af129fff198d', '101.53.254.132', 1616155802, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353830323b),
('c3d4e2c58c5d38274e01b083810445050f932a09', '158.101.115.177', 1614614267, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343236373b),
('c4028b26db5c458705f9840ef8cc6fa303b1d7e9', '34.242.141.183', 1612375180, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323337353138303b),
('c40b687c9a2a5a651534071cebe36fb61fa6705c', '207.244.250.95', 1608235154, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383233353135343b),
('c40ku1s1hoij40autukcnhq1gdonnm34', '101.53.254.132', 1615379581, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393538313b),
('c4549c63f2f2d3d4abee9697fec5e67e51827716', '158.101.115.177', 1614614265, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343236353b),
('c46b5f2697b9ad8ab42a3b25eee5bf6b7d3e1726', '13.211.70.147', 1613946616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333934363631363b),
('c4b68f5e867a0a63b9de3767f6b608656695f65b', '184.170.252.252', 1609754569, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343536393b),
('c4c6ba6b1bc9a280d022d782057c7bcfa35e933e', '101.53.254.132', 1613831905, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313930353b),
('c4cooh4j5auacnva8r5jtbppmvv45sqm', '101.53.254.132', 1615192615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323631353b),
('c4lps26lm14mpcg5on5on8t8u74fjrgs', '101.53.254.132', 1615317109, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331373130393b),
('c4vqu3as4qt4l0sriou5nrdivnpcjgu6', '101.53.254.132', 1615902040, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930323034303b),
('c55fa0a034e60c87b3238d3b4507963d481a1086', '101.53.254.132', 1613832201, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323230313b),
('c57d323af61c07afeeef4b7ab8d74897897a82bb', '101.53.254.132', 1613832907, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323930373b),
('c5bfea8a06355d70a2262f5bfcae92c364857f74', '5.104.111.253', 1613764747, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736343734373b),
('c5eaec40b13a19ce941deeaba287a922c1247b3f', '184.170.252.252', 1609754561, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343536313b),
('c61cfaa02411705f27b6fbce7699bb30527ab5cb', '54.36.114.53', 1616153777, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333737373b),
('c6488d865468380eb326a46006f60cc29202b4d6', '138.246.253.24', 1610079763, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303037393736323b),
('c6571a075a03f167d2a58e43bf75df18f3777fb6', '101.53.254.132', 1613832276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323237363b),
('c663eb2e678fede7db4e3de462ad2384dfa9791d', '138.246.253.24', 1608198014, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383139383031343b),
('c673a656dca1ff36a24f433361643028add0669b', '54.36.114.53', 1616153950, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333935303b),
('c6a112704e33998146bbd3f5b8cf3f65fd691ccf', '34.236.202.207', 1613980880, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333938303838303b),
('c6vadv3ptr16huoqu3ek3asuvl14h99m', '101.53.254.132', 1615380335, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303333353b),
('c751ad9ab7ea56b753487a868187b5d42483f07d', '5.104.111.253', 1613766233, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736363233333b),
('c75554d8d863ff5a5b0641c136d103decd15136c', '184.170.252.252', 1609754525, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343532353b),
('c80f22129f90501b5aa4f191f99dadc3d426535c', '101.53.254.132', 1613832153, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323135333b),
('c91bf657dbde08ec92a3f1f9ce439eb16bd8d047', '139.99.69.189', 1614527317, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343532373331363b),
('c94c8acbefbd4c1faada4648ad8d9ed4817f3945', '158.101.115.177', 1614614266, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343236363b),
('c9d5fca3ee74273924f6cb7e5a958adb763876cd', '129.213.109.135', 1611901463, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436333b),
('c9dcffa5c0f00ce9abdbe794b1b5cdb86fa2808d', '43.245.10.82', 1606654907, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363635343930373b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('c9e50f40ff79c1cc3d9270ae999e9ec9fae66337', '52.208.210.147', 1612375180, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323337353138303b),
('c9ee3712d2f2c921c0ac9640b349df2e9523b75c', '54.36.114.53', 1616153489, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333438393b),
('ca1d398db0f58578c83788a3f3500b624afb1137', '101.53.254.132', 1613832032, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323033313b),
('ca216e49732f900963a096383d790809c6bd62e0', '72.255.54.157', 1614634710, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343633343434303b6e616d657c733a393a22556d6172204661697a223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2233223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('cad307c821b239373c9956c14d880f71cdd1e548', '203.135.47.26', 1606652539, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363635323533393b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('cb1bc3ddea53f9692c6bdaf73dabf3c1a8d5a25e', '54.36.114.53', 1616153488, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333438383b),
('cb79f98be4cdfd379fe1ac53165593de67cee7f2', '35.180.147.121', 1611991200, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313939313230303b),
('cc6c2188ae41bc0de0f67edbcba15c983aa6a62e', '101.53.254.132', 1613833188, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333138383b),
('cc6mgdbp5unn5etbn0o6bcnd839hi6vb', '101.53.254.132', 1615906370, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363337303b),
('cc7837441a8a0686ae7049946519c1cd02d65e3f', '101.53.254.132', 1613832230, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323233303b),
('cc86244c967f8ba3aa379c87f01b02d9f78c14a2', '54.36.114.53', 1616153494, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333439343b),
('cc9b9027deddb81438621b84ce63af475b87d8ad', '54.36.114.53', 1616153778, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333737383b),
('cca08f2da9189a10c6249ebb872324dc341ab332', '209.17.97.34', 1610783506, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303738333530363b),
('cce73eea0111b5d78c539dcad56c9df5731347fd', '39.45.212.243', 1614642052, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343634323035323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('cce7i73e3lc0nsj1thrl3c63edk3nvta', '101.53.254.132', 1615906957, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363935373b),
('cce993f8be3ec850767a68ce1e97d277c518480b', '39.45.212.243', 1614639872, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343633393837323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('cd0d99d96f3f8249892338c1103056601baa80c3', '101.53.254.132', 1613832319, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323331393b),
('cd26030025c7b77e7bd34867e2c1966981b06f53', '158.101.115.177', 1614614268, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343236383b),
('cd2n026jhi12qf1piv7c9cdut101lcrb', '101.53.254.132', 1615368996, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336383939363b),
('cd3923dadd335544b20a7c1a76c013c5a3e8aac6', '101.53.254.132', 1613833148, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333134373b),
('cd53d4e94f3a6187a277fe690f7865518a98c4f8', '101.53.254.132', 1613683144, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333638333134343b),
('cd61f841cb57dac79ce9f8c55a192d8b14bcffa5', '101.53.254.132', 1613833074, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333037343b),
('cd93c6c19f1011eb6cb6b9e0ea60c3597afbc742', '54.36.114.53', 1616153707, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333730373b),
('cd95663f21ee6520e813a408f4fd56f3ab240f24', '72.255.54.157', 1612374043, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323337343034333b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('cdb8b8pg1qlgrojajc6pfmhsecmmcl0g', '101.53.254.132', 1615906957, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363935373b),
('cdtee8vktubfv662b57eo67l7voq6q2d', '34.209.105.222', 1615998563, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353939383536333b),
('ce15aaed95edb2010c88c7cbb4053cbeb01d165e', '101.53.254.132', 1613831866, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313836363b),
('ce822ff0f6b009e0704634ded23799696ae0cf25', '101.53.254.132', 1613832201, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323230313b),
('ce8d329cbaf378bad90e275bdd56dd44dd6bab87', '209.17.97.106', 1613148228, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333134383232383b),
('cee3098debb46242fc3f305bab6b122ee2030ab1', '54.36.114.53', 1616153494, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333439343b),
('ceed95f0c1c42b1cecb31c7569e5432c7d609979', '165.227.107.59', 1609433364, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393433333336343b),
('cf0c550961ea79d6217718cfedecf8c39eaf9c7a', '101.53.254.132', 1613832182, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323138323b),
('cf38k4grt3pn5cqbpptjhe4rmj0kk5ki', '101.53.254.132', 1615903438, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333433383b),
('cf69bfb49376fe21791eb60e0ccddc2bcf3c438c', '101.53.254.132', 1613827872, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333832373837323b),
('cfc4eebf1271af43121204fa2e5ff6964649fcca', '129.213.109.135', 1611901465, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436353b),
('chion7gta22v10qc2ehpt3g2q0gat1pc', '101.53.254.132', 1615905763, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353736333b),
('chshqfpbe453bkrb4n68kc5utpeifq7f', '127.0.0.1', 1606356521, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363335363532313b72656469726563745f75726c7c733a32383a22687474703a2f2f72616d2e746573742f696e71756972792f76696577223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('cl71nkm427gf60c5tn0boa35ps5t1krr', '101.53.254.132', 1615380335, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303333353b),
('cml35pc1ejmtkqfdr3fhci1ciclk0l2n', '39.42.73.202', 1614723962, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343732333936323b),
('cn0s3uti9acjiskog72g1gmhfouqgqjc', '101.53.254.132', 1615315954, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353935343b),
('cn11b53oh8s4053pq7gsqmbqf9jpjdmp', '101.53.254.132', 1615380240, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303234303b),
('cp5g1a37rv7fqu6v2j4keof765vtfq0g', '101.53.254.132', 1615312762, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331323736313b),
('cplgbnptnijmg2vvk7idsaba4ugirauu', '101.53.254.132', 1615192561, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323536313b),
('cq98a02crd03el75m4kogl4e9gfppgkh', '101.53.254.132', 1615903591, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333539313b),
('ctnahfts4qp3t5m8jqk8s0qbr1n0i4pv', '39.42.73.202', 1614727497, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343732373238373b72656469726563745f75726c7c733a34353a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f70726f66696c652f36223b6e616d657c733a31313a2251616d6172206a61766564223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2239223b6c6f67676564696e5f7573657269647c733a313a2236223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('d057bed9b5fa89119eaf2630642d98b767225102', '54.36.114.53', 1616153855, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333835353b),
('d0882c3945a735d1de2647a58396e6a98993792a', '54.36.114.53', 1616153855, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333835353b),
('d0b92aj6l35ap6ihcqdt6c7v3k8rburv', '101.53.254.132', 1615906547, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363534373b),
('d0l3122a49807pp4qi412uort55k5l92', '127.0.0.1', 1606326747, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363332363733333b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('d10928c2dda3e7a2940abdeabf1049fd246e8919', '184.170.252.252', 1609754541, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343534313b),
('d1218a8520bce74e0b1991af1057325acfc168e8', '54.36.114.53', 1616155744, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353734343b),
('d12pl242en0dkre8gpi54tdho9v9al1k', '39.45.10.36', 1615897196, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353839373139363b),
('d14305027833e15cf2a3683510ad53d6faab0e58', '101.53.254.132', 1613832190, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323139303b),
('d1562ffcfa82d5d8aa4d202464d319e5743aba7f', '54.36.114.53', 1616153931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333933313b),
('d19464ee1974654f0f4738bbe7b0c0142e7a5cd0', '54.36.114.53', 1616153948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333934383b),
('d1d8371766100b920b59fbceb3a1e2268bf061e0', '101.53.254.132', 1613832932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323933323b),
('d1e0feb9f10c698c896d602427cdacafcf063d41', '101.53.254.132', 1613771441, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313434313b),
('d1eb042ed5061177fa2a119906733c5400c536f9', '18.140.97.126', 1613883544, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333838333534343b),
('d2628feca82ff79c0e085badcbdba81302beaa17', '101.53.254.132', 1613832722, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323732323b),
('d280cdcfd391c5d51db9736d6cb0c9dae1666ed2', '101.53.254.132', 1613832089, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323038393b),
('d396b242fc07871059e04f67b907fbf55997f3c0', '54.36.114.53', 1616153919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333931393b),
('d3b927611e28869155ee8b8a53b4902bee441a35', '138.246.253.24', 1608887448, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383838373434373b),
('d3ee5f33fd7762c281864cb8f56e771df5e8e6ad', '129.213.109.135', 1611890024, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313839303032343b),
('d40e70dae6ce6fe9a8d6d54990863ea821de891b', '54.36.114.53', 1616153949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333934393b),
('d42885bbfc651a4ad7c4ff238f8577690ae83355', '62.4.14.198', 1611822201, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313832323230313b),
('d430dd3691d27a1d535f49424a4b26c987d9d894', '138.246.253.24', 1613195522, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333139353532323b),
('d49ea5d83b3628437a7943191e6a01437f85bee5', '101.53.254.132', 1613832118, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323131383b),
('d49f02ae1aacc5db78ec7cda5dc80195b90b50b4', '101.53.254.132', 1613831904, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313930343b),
('d4b2e91f8909c0cc3e40b59c4d0b6895f5ed0274', '101.53.254.132', 1613771401, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313430313b),
('d4cdb806840859fa3317d4460f336660252cf6f5', '158.101.115.177', 1614614275, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343237353b),
('d4ec8214da2d4293084b4f1af38f84792ce42f0d', '5.104.111.253', 1613764141, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736343134313b),
('d4oe95tp730t0v4ba7cpn87i5ab906nu', '101.53.254.132', 1615906528, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363532383b),
('d50da34d419dadd8d86e15e10ca31d5b29cebc34', '34.236.202.207', 1613980880, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333938303838303b),
('d511633c91c75fd33b734c93b1218f212f59b8b0', '158.101.115.177', 1614614273, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343237333b),
('d5666203ad9f95f0265c23f4074214de0a4817e6', '184.170.252.252', 1609754558, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343535383b),
('d57bbf854f029a0688ea50f23ac81e9e8822db24', '195.154.61.206', 1606553927, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363535333932373b),
('d5ae99885b0546c555d0faca92c38c3e7afab5b4', '5.104.111.253', 1613765133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736353133333b),
('d61b0f110c145fa4e466163fd35c388ba5665cf8', '101.53.254.132', 1613831731, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313733313b),
('d6431344684604c25c2ad810ed2273e876475a20', '101.53.254.132', 1613832065, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323036353b),
('d655a90280807bd7299770edcfdeb28d4cf47a00', '101.53.254.132', 1613832550, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323535303b),
('d66ucok4f03jh1bb62ulmcdjm9d20g3v', '101.53.254.132', 1615369605, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393630343b),
('d682c9fdd5216154a1b91371cdeb499a3fbbb1a4', '39.45.43.236', 1612436565, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323433363536353b),
('d6ae66ef57723c7dac8dedb02515188106d6e69b', '39.45.212.243', 1614548980, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343534383938303b72656469726563745f75726c7c733a33373a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f64617368626f617264223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('d6e89e7428f66cc2380bb891b2e3a19c0c710480', '101.53.254.132', 1613831866, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313836363b),
('d6hnj6f4c0u66bd1vmafelejrjkqcd7e', '101.53.254.132', 1615312741, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331323734313b),
('d704fd61c72b9a2347d5a840907e914e1b914cdb', '101.53.254.132', 1613832550, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323535303b),
('d750240b34bf1ca58885585a87b1bda48a1b969a', '54.36.114.53', 1616153442, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333434313b),
('d7e4e05a94d56eeb8d665a7bcc0e8031ab1a623f', '167.86.75.216', 1613659850, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333635393835303b),
('d814e418e452d584cf98a9ee0201f2550549445a', '149.202.8.66', 1611996559, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313939363535393b),
('d81fc4e92958acaf79267a3363aa495dedc0b399', '158.101.115.177', 1614614276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343237363b),
('d820474df1ae7d8de1931be26300bda797726ccc', '5.104.111.253', 1613764242, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736343234323b),
('d83dfb70e41254db5e26af3c88de0d5f406340c2', '101.53.254.132', 1613827923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333832373932333b),
('d867b174d623fe73cb514d5d3f3197b86ec0a1db', '54.36.114.53', 1616153920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333932303b),
('d88f9e21788b5900feb1ac5c04ed16b0f7171e73', '54.36.114.53', 1616153949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333934393b),
('d9c74ad9feccf59d0ca60a3316e3b60666ddcd22', '138.246.253.24', 1613729392, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333732393339323b),
('d9io6k88hvagtfvl7jkuu2amsff9d32n', '101.53.254.132', 1615379500, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393530303b),
('da22a24bac07cf648082885885b9319563df2ac6', '106.53.83.56', 1610664276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303636343237363b),
('da588de67d17ba4cca3e82f7aa0b519bcbd19691', '13.125.141.200', 1613103034, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333130333033343b),
('da5ohi11fms0tbn0rf3jbi7i54dg1bka', '101.53.254.132', 1615379722, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393732323b),
('da85df268e70d102f555ba58bb2d52d619dec419', '101.53.254.132', 1613771447, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313434373b),
('daf51b4e5fda4913e72dfe77b643204ff11cf39d', '62.210.209.245', 1610847050, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303834373034393b),
('dbad4eb8644e7bb8aa738c6dd31cbdfa13316380', '54.36.114.53', 1616153706, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333730363b),
('dc24957c8166465486eae2403685d47f8c67a675', '54.36.114.53', 1616153768, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333736383b),
('dc50416031da82f16ef09ddfbfa51a3f87a97530', '101.53.254.132', 1613827872, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333832373837323b),
('dc873abaf7f79caf23abeaa99fefa1e5ee4492cd', '101.53.254.132', 1613833128, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333132383b),
('dc8c51b9d98792399c2d71978d86ce7774f2d204', '129.213.109.135', 1611901462, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436323b),
('dcadb37653441a9046103c6e072837e05b8c9cb6', '129.213.109.135', 1611901458, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313435383b),
('dcfaufh60cqav7o9i8slqlle551fhdto', '127.0.0.1', 1605962326, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630353936323136333b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('dd31lqqttifh21tsumanslpf555lvl2u', '101.53.254.132', 1615315682, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353638323b),
('dd5f960dbcb06d964928ea3d4a89c538769b670e', '72.255.54.157', 1613594975, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333539343937353b),
('dd7c116dc4e618b42c440bcb81955e27591d91bc', '54.36.114.53', 1616153448, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333434383b),
('dd831321236891e4c8688aa22d929092814186fc', '54.36.114.53', 1616153855, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333835353b),
('ddj32murneamh48hncftk3n2rgifi9jl', '101.53.254.132', 1615903189, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333138393b),
('ddubjcmaolscqesml7vl82fbfh2blcnj', '101.53.254.132', 1615906370, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363337303b),
('de050d65444991a336ecd74184292e163e5b21ad', '54.36.114.53', 1616153931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333933313b),
('de77j9jrc6l509j4mn21vaa3gs2u4ltl', '101.53.254.132', 1615312589, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331323538393b),
('deccg89etreh1onaa7q7skei4jiet0le', '101.53.254.132', 1615316828, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363832383b),
('dej3k3p3eitge0vbsf8mad7jojfvqg8r', '101.53.254.132', 1615902040, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930323034303b),
('deu5i6665dfkt404160bigmo3f7pac1n', '101.53.254.132', 1615906615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363631353b),
('df0bd4edc34421c5c8b1bf90ec743720de9645f0', '101.53.254.132', 1613832071, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323037303b),
('df7iapg4eratfcufr394k3dm73v3eopj', '101.53.254.132', 1615903744, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333734343b),
('dgja3dgig704ckqe5v8vfq8r52430u44', '101.53.254.132', 1615369940, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393934303b),
('dh3g2khj3dps68slmplokqs2lpanrrmu', '101.53.254.132', 1615903206, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333230353b),
('dhr8rk42s2uoc8u9dnluqe8hctku2juk', '101.53.254.132', 1615315541, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353534313b),
('diqn2emgmt51i2oc8i63ao8kplen55v3', '101.53.254.132', 1615380364, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303336343b),
('djsu0fi5amo2g07nfhkkt730ddd4v2ma', '101.53.254.132', 1615380389, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303338393b),
('dkas5mjarhrhcgvo8336chq854fo8mqu', '34.209.105.222', 1615998563, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353939383536333b),
('dm0pr4tq9nkcunf82kthj9tnoq5m384q', '101.53.254.132', 1615368996, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336383939363b),
('dm56ap16fi2p48av9bp40vinfpisb90g', '101.53.254.132', 1615379721, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393732313b),
('dmb6h1cl8ego81ht578liupaj0ec7qi6', '101.53.254.132', 1615906529, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363532393b),
('do03bsdqhee352923gijvmbouu0us9bc', '101.53.254.132', 1615192510, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323531303b),
('dpn2pnntno6kqp1jn2fcco4dgangf0v3', '101.53.254.132', 1615192621, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323632313b),
('dqe5eu4r0mqhnqb2gpni7bemljbg2fqj', '101.53.254.132', 1615906800, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363830303b),
('dqnj4rqpoh7jf22io29v8ku46o1rmdp0', '101.53.254.132', 1615907007, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373030373b),
('dr143pdjun70o03in3aour4g756tpbca', '101.53.254.132', 1615907020, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373032303b),
('dta99raqhst415hn1356i85tros092ql', '118.24.106.70', 1615057341, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353035373333393b),
('dvivoj9cfbncgo0kn23if5rbfr15obga', '101.53.254.132', 1615906964, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363936343b),
('e00e130ba0f2be9073f327029b89d3f5faa57991', '101.53.254.132', 1613771415, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313431353b),
('e067d66962d1808af0d7cc2d676f9cfc144510e5', '54.36.114.53', 1616153949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333934393b),
('e0c3f623d49696075dcb6a3d00b3751f64a47302', '34.96.130.222', 1613322451, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333332323435313b),
('e0d2c5f92106c696c1c367dc21e9036b318635ad', '18.196.239.107', 1608431820, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630383433313832303b),
('e11384aohrvgmn87iq887grbn235e8ls', '101.53.254.132', 1615903178, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333137383b),
('e126e2d5ff1805528a0cb38a78e707c8702295f0', '5.104.111.253', 1613763392, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736333339323b),
('e162be061c1db4735c0611916536557078447d34', '54.36.114.53', 1616153727, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333732373b),
('e1ab3a77a8ab9d52a8ffa1c71afad41cf8b1ddbe', '54.36.114.53', 1616153669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333636393b),
('e2do766ip1g0uq4d95ptqnc5ac9ahueb', '101.53.254.132', 1615903178, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333137383b),
('e3194f922f65932a003e4ca33b672189ae0648d1', '158.101.115.177', 1614614266, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343236363b),
('e3205a1ac8b0e1e0efdf3231f885a27e42550251', '101.53.254.132', 1613832511, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323531313b),
('e35bf53d7f7d25629ade39a47da643ca84b3e8c4', '101.53.254.132', 1613771447, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313434373b),
('e3d85mk53nljf4ajn8g0rqv9i1qktk39', '101.53.254.132', 1615314815, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331343738353b),
('e3ea0b0b60e064fe4247f69bfba72f1302dd11ea', '129.213.109.135', 1611901461, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436313b),
('e3f405d798a5ca9eb0841facb396f024b8239c50', '101.53.254.132', 1613832089, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323038393b),
('e3f820d32e02e453f3321ae35f9a7c00c8855ae2', '54.36.114.53', 1616155628, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353632383b),
('e40644063e9cf831d5b66175ca04992f9434525e', '101.53.254.132', 1613832054, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323035343b),
('e484db57e802c5e3c8798019261c920b542e4770', '116.203.205.103', 1611571736, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313537313733353b),
('e48dmetmic96sd8t4p9bfn10hc7u3jb5', '101.53.254.132', 1615906841, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363834313b),
('e512e92266bb9ce02f69de059aec9d205dc05513', '5.104.111.253', 1613764810, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736343831303b),
('e532f92353a76d2f8cf95d895704dc3b54b53289', '101.53.254.132', 1613771441, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313434313b),
('e53364e4344020d432445bcfb04e0aaeaceb68c4', '54.36.114.53', 1616153669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333636393b),
('e555d1b06dae6241e8c2f414cf119fed42abb9e4', '54.36.114.53', 1616153932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333933323b),
('e597867ebc93d9f5a6ba821b987f63b2a0462c3f', '101.53.254.132', 1613683319, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333638333331393b),
('e5a5dd58c397964e95e11e7918a96c831cc29c8d', '101.53.254.132', 1613833074, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333037343b),
('e5ct5j29qo4micg1pbe8g9gpbjn3hkci', '101.53.254.132', 1615380349, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303334393b),
('e5f37a523de25bedb324c1101a8983aa80ff4b27', '138.246.253.24', 1611338644, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313333383634343b),
('e5jm9tipqmt613m6aen85dlngm9qqros', '127.0.0.1', 1606347831, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363334373833313b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('e62bk6eqkeha3bp0kd7pibkhasfvd8dp', '72.255.54.157', 1615308819, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353330383830303b),
('e6r2qvrhgbmdr8tmfkdiea8evsh1rgen', '101.53.254.132', 1615902776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930323737363b),
('e6s30oek54ke76kghm2nik8ukvbt9374', '101.53.254.132', 1615907039, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373033393b),
('e771e4435f43d18cb13deea91cc4058ee7bc1882', '184.170.252.252', 1609754567, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343536373b),
('e7c29be790f8362e1e0858885da0559bbd4a7aae', '54.36.114.53', 1616153706, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333730363b),
('e7m4b55kuvnr0uoml746fpb1g4f7af48', '101.53.254.132', 1615907038, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373033383b),
('e80ihibjb62ppqnks4c231prnrairu7k', '101.53.254.132', 1615903413, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333431333b),
('e84f80128aced8cb7ef848ad63d88d543543f2b3', '129.213.109.135', 1611901462, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436323b),
('e87d1b3250ec09e1b6cbe17a950a319cb364440f', '101.53.254.132', 1613830751, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833303735313b),
('e8ce734906eb9b080f8efe8f2353eeda17c77039', '5.104.111.253', 1613764517, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736343531373b),
('e8fcc9be304be8c12e8758610af0f85812d212c2', '101.53.254.132', 1613832678, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323637383b),
('e925a1f1f3430a4041597baa84f385ab5b610566', '54.36.114.53', 1616153948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333934383b),
('e933673128066db22114702bd9d40e993268341a', '54.36.114.53', 1616153854, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333835343b),
('e94giep3g7e5sfqbnuj5k8r78bsi06mu', '101.53.254.132', 1615312578, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331323537383b),
('e9597d6df2d6c50eaa61c0ee763e45ac36a93504', '34.86.35.204', 1613310137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333331303133373b),
('e9c700774dc1db4c1bd41373037e2c17e3b2789b', '72.255.54.157', 1613593093, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333539333039333b),
('ea4d8e5801c03792a58a75b08d5030e280315473', '3.0.115.255', 1614403969, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343430333936393b);
INSERT INTO `rm_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('ea667b21929e3961c2e01b05f82c77d6cb424958', '101.53.254.132', 1616142852, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363134323835313b),
('eafbd155b9b0dd77e2d49837959b233a2d776eff', '101.53.254.132', 1613771637, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313633373b),
('eb03fcb0bd413f5ac8a5b08b32e14064575a8ea0', '101.53.254.132', 1613832549, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323534393b),
('eb0e4697f9605a06406e2fbb3a86130b73c1915e', '209.17.96.34', 1609412186, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393431323138353b),
('eb278f818d6e78ce45ba41b9d90e33d3bc922684', '209.17.96.114', 1610092373, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303039323337333b),
('eb3c345cd7446e3e35f8ef28c0f14dbda6e8e054', '101.53.254.132', 1613832157, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323135373b),
('ebbhd40jri2opokquthv1ffklg1iaaj0', '39.45.10.36', 1615897878, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353839373837383b),
('ebbptq2envgqa1undl59qms7cfu8e5r5', '39.42.73.202', 1614727147, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343732363933363b72656469726563745f75726c7c733a34353a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f70726f66696c652f36223b6e616d657c733a31313a2251616d6172206a61766564223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2239223b6c6f67676564696e5f7573657269647c733a313a2236223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('ebfba3c41dfdbfb9a8d825a2fa72355bd9070f0c', '39.45.173.81', 1612865074, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631323836343839323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('ebjrqq392kk5lka8p249koki3frpr705', '101.53.254.132', 1615905468, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353436383b),
('ec1b262dfece26e36f22ff01c5e56c85918fe498', '54.36.114.53', 1616153488, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333438383b),
('eca2o38nhbjm0nla79tgaucqqhmdrjf2', '101.53.254.132', 1615315537, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353533373b),
('eca70b51bc1025d76217545fd5fd0c484b2d02c6', '39.42.65.245', 1606579871, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363537393837313b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('ecd492ad7f95a55aa33b2bfe423f7b887a54ba6b', '101.53.254.132', 1613832168, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323136383b),
('edom0i04942hv1mn11tmap1ghh4o8f5t', '101.53.254.132', 1615316629, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363632393b),
('edssm48brfpdcvk2dboufn6h3af45ee7', '101.53.254.132', 1615906540, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363534303b),
('ee3ef43c9bcea9181a8846dd5cdc1373dc7d6fc8', '101.53.254.132', 1613831894, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313839343b),
('ee4a40428169dcdf48434bf27af6ea4ad45aca52', '101.53.254.132', 1613831410, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313430393b),
('ee4e67b9b474ae2c946df30a90d804e013299ed4', '184.170.252.252', 1609754560, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343536303b),
('eea93749fdf120bd30e06c65b72c9d7db3c7dbc7', '101.53.254.132', 1613771588, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313538383b),
('eeed6242ddb7015fcaa7370b5201141dd6868412', '101.53.254.132', 1613835243, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833353234333b),
('eeh3rg30av62ien0qv41m0hbtj3ft798', '101.53.254.132', 1615369468, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393436383b),
('ef0035171f88113ce9872991419c94a32a3df634', '54.36.114.53', 1616153769, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333736393b),
('ef086e5bbbb1c91aad467d684645ad3864904a96', '39.45.212.243', 1614513942, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343531333932323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('ef238a537225098f43ddb130f362ac1493708c76', '54.36.114.53', 1616153685, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333638353b),
('ef2b897ae9f933fda564c1efbd8f1079aa1829e7', '54.36.114.53', 1616153768, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333736383b),
('ef3975d32637ee91e2beadbbb138d9007a89c1bd', '54.36.114.53', 1616153495, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333439353b),
('ef98dc63718205507f0a6e3410a5a690803fe6ea', '39.45.153.20', 1613391484, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333339313432313b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('efa87f864110492dcc2c3b8593f6e79b73e3036e', '158.101.115.177', 1614614276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343237363b),
('efdm8c916v5omj2ct0mo2393ti0oaam9', '101.53.254.132', 1615315876, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353837363b),
('efhupq53p2soekl87258mlqg6mf320jo', '101.53.254.132', 1615315817, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353831373b),
('ejs75c7ebfppmatls2gtj1qpdgndhc7d', '101.53.254.132', 1615907007, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373030373b),
('eka2q5p33n8o5mfq9c3kmbesc9rr7ma8', '101.53.254.132', 1615906763, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363736333b),
('ekeih3a48of46r1pqlmvugjti87fp0n8', '101.53.254.132', 1615905465, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353436353b),
('ekf3r75epgm5vinf54jsra6pcq3igl1b', '101.53.254.132', 1615906801, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363830313b),
('elkdikr7r4dobplp23fc56kp141463q5', '101.53.254.132', 1615192716, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323731363b),
('elmoo4p75gj2s70fmleeso82s31caijj', '101.53.254.132', 1615903119, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333131393b),
('enelcvsii6pfcmidg8568gubusp4ugto', '101.53.254.132', 1615903079, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333037393b),
('erp7v4md09rfrag0q8dufl7hvl1uc4dj', '101.53.254.132', 1615316794, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363739343b),
('erq0kmp4mbf0vqo2na4v8ja1kg1e0lj1', '101.53.254.132', 1615906540, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363534303b),
('esd9voh1fhh5jn3anatk1o7oj0ts0u3s', '101.53.254.132', 1615316844, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363834343b),
('ess2bsro3jolsopljle6h0db14ahgh9k', '101.53.254.132', 1615903708, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333730383b),
('eutl2t2t2063bk0o121phedl21na0mhu', '101.53.254.132', 1615903132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333133323b),
('evst1g6mist438ucm5q1j31f7ui8j6va', '101.53.254.132', 1615312756, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331323735363b),
('f083629218fa4b797c9a9669c3477d9b6d9c00e8', '34.86.35.172', 1613378383, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333337383338333b),
('f09oa4pvkikm1cj17c0pgn8594tt7qf2', '118.24.106.70', 1615057342, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353035373334313b),
('f0o2h29shram91f279rfem3qpkmmi6v2', '101.53.254.132', 1615315876, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353837363b),
('f1065eca909156d71ece2b319845a58f4e44b988', '184.170.252.252', 1609754535, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343533353b),
('f15028c2953f3c65ce66f7706f1268307ce38a04', '5.104.111.253', 1613765076, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333736353037363b),
('f18ekltko7a4oainrs7ckkg1426gqjo9', '101.53.254.132', 1615380389, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303338393b),
('f1a0da4aa1d4625ba14f1ea94dfc2b48d5da3d78', '94.23.5.185', 1614393266, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343339333236363b),
('f1b53jseolvleng4dms2ks0da1ifthng', '101.53.254.132', 1615903119, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333131393b),
('f1e5960217a212a32083f8188ad4b8709f8d7825', '39.45.212.243', 1614513923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343531333932323b),
('f1m8hl9b766edbegcmakten1n1eepafm', '101.53.254.132', 1615906948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363934383b),
('f24e8a154fb92b4c4ab65caad90fe95a50108e2f', '101.53.254.132', 1613832167, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323136373b),
('f27417528910e49bcd625e83f98dc4cc455006f9', '101.53.254.132', 1613832511, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323531313b),
('f2be909ac7c4f98c317e431b08a81023d2b89e5f', '101.53.254.132', 1613834609, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833343630393b),
('f2v6crur7koeotfcf3tv290rnstot1no', '101.53.254.132', 1615191499, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139313439393b),
('f31a18571f982fca472bba6d9270dfc9d348b9aa', '54.36.114.53', 1616153769, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333736383b),
('f3bpgc0l8grb40h9bevfbl2urek05e95', '182.185.143.172', 1614689890, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343638393839303b),
('f417hcu9700kasvtap2eqk1ndco3lofu', '101.53.254.132', 1615903205, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333230353b),
('f47cblr91p2opd00ggjsjhv838q8qapu', '101.53.254.132', 1615906801, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363830313b),
('f47e6b665fda6bff62aa78c2fadbebc8aa234e5e', '184.170.252.252', 1609754542, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343534323b),
('f49535002f08bc785b71bff11321c3aa2239a987', '54.36.114.53', 1616155038, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353033383b),
('f4tn0i94afemlfgmgghcj245v56jgkit', '101.53.254.132', 1615315682, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353638323b),
('f5145fda1d99ba07ffb42b214cdebd0f550db340', '101.53.254.132', 1613771175, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333737313137353b),
('f544191489ab756e5d648226e226abd600d5fd6e', '54.36.114.53', 1616153920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333932303b),
('f5aaae7bf1ef21cd6dc0dc403a32371c3ee836e2', '101.53.254.132', 1613835052, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833353035323b),
('f5b68fd13d91219b72af96345107a08de974ba77', '101.53.254.132', 1613832143, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323134333b),
('f67ad8922eb72a8354f985cdabd5e404c6aaa616', '101.53.254.132', 1613827923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333832373932333b),
('f68102749faa67ac4abf24d1b9ee7a5e829d43c6', '101.53.254.132', 1613832230, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323233303b),
('f6e309666d2ad2e14f1cd162f0305cbe552c8958', '51.158.66.83', 1610686720, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631303638363732303b),
('f7044lj0ph6m8j18fcl9scrkdhdelusq', '3.97.10.122', 1615659265, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353635393236353b),
('f750e2d13a2f89418c913badfd7faa669b69993e', '54.36.114.53', 1616155071, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353037313b),
('f767fcd18d52bceb8ddab29cb3a0aa843f3610b2', '101.53.254.132', 1613833084, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833333038343b),
('f790u7dga97b5aj2flihr2lr76t6jq10', '101.53.254.132', 1615316952, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363935323b),
('f7c282afc48fa167a054b1b208e632b127ea8904', '158.101.115.177', 1614614265, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343631343236353b),
('f83achj5tch2f9aed1efgfgvj5rh2qvk', '18.230.60.69', 1615068277, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353036383237363b),
('f84415b0306e1330559ef5626f96271fafab8d64', '184.170.252.252', 1609754562, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343536323b),
('f85f22e4b8f9c12306a6cc9d08c1cba1824544cf', '129.213.109.135', 1611901461, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313930313436313b),
('f977ddcb54c1ddc61d7acb6b5882eb67b490763e', '101.53.254.132', 1613832722, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323732323b),
('f9af4d42a9ddf18f61500ff1ad1ab08d674aeea5', '40.78.153.184', 1614247411, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343234373431303b),
('f9cf0747286dfac600efeb6ec9be0278f2eb44aa', '54.36.114.53', 1616155628, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135353632383b),
('fa92fd04bd7335a73470d74435b16dab85b62cfd', '184.170.252.252', 1609754555, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343535353b),
('fafe26a8de674cb72dfd0fe6b4ab2314253d8dd0', '54.36.114.53', 1616153951, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333935313b),
('fafso2snoqfv36d2er16ri64rrs7b1bf', '101.53.254.132', 1615380423, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303432333b),
('fb3d3mjdsp5nj34rortfhvq78k16qfsr', '101.53.254.132', 1615316422, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363432323b),
('fbe1dc3d27c8d9a141d1b47cd0e819b43f4966aa', '39.42.65.245', 1606582892, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363538323839323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('fc61ae4346a8aae60ca7f25581945230eb42b173', '39.45.212.243', 1614641722, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343634313732323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('fc6df3c6577df11bdb99b6d8e79fb0731dc77b0c', '101.53.254.132', 1613832511, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323531313b),
('fcdb07251bc1789abab2cca107749b7200ee0a9d', '54.36.114.53', 1616153855, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363135333835353b),
('fcf1daa3b471ad9e02d41e4d8ad63ac35285c89f', '39.45.212.243', 1614638907, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343633383930373b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('fd2c352cefcdb35ed81934df01a08fe78f3d9e07', '34.86.35.49', 1613321457, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333332313435373b),
('fd2d71c09975e4b722fdd643752947675712c56b', '101.53.254.132', 1613831762, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833313736323b),
('fd3b1e3a44ae8713b66d5a48a5f1fd4ee7ef72a0', '35.177.176.242', 1613999276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333939393237353b),
('fdbbbcd7fc3140dc72dafb0d585a2bd0fe765158', '184.170.252.252', 1609754544, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343534343b),
('febc71nmjmfev49v08ku8t9jjrtqikpb', '101.53.254.132', 1615907026, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373032363b),
('fecc68700aca8aa1a2f749aa7c91049fad71c241', '138.246.253.24', 1611314928, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631313331343932373b),
('fee6c15a3121d4838442f65e6798f1a01bd3068b', '184.170.252.252', 1609754533, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343533333b),
('feed8e175fb11083630e03c22204ef59cd0171e0', '101.53.254.132', 1613832031, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631333833323033313b),
('fegvb9e97k1chdc2qm871l9tdhnh54eb', '101.53.254.132', 1615906385, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363338353b),
('ff1bfa52ca946fa23d16f88d51f44c3c690508ad', '72.255.54.157', 1616095747, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363039353439343b72656469726563745f75726c7c733a33393a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('ff8c462c38179ee09283b9ed85cea8cd88a7bb2f', '184.170.252.252', 1609754514, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630393735343531343b),
('ff9ac4badb6d35abcb9de73e975e7f04a77ac823', '3.0.115.255', 1614403968, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343430333936383b),
('fge2kmn4lofcoq241ep8sjnd8djfm97q', '127.0.0.1', 1606334580, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363333343538303b72656469726563745f75726c7c733a32373a22687474703a2f2f72616d2e746573742f696e71756972792f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('fiavc9htim90iu3f4kr512vr9goqq37l', '101.53.254.132', 1615906516, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363531363b),
('fk3j6sup0act5mkeo6ho0b4tih70pdi8', '101.53.254.132', 1615902951, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930323935313b),
('fl36sdqiva7oltbnounmv7bu5l5etseu', '101.53.254.132', 1615907084, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373038343b),
('fnci4m76tq1mec91r2mikt2v0cves62q', '101.53.254.132', 1615906851, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363835313b),
('fnj12pnains9r026320r5cd76rgdveh4', '101.53.254.132', 1615906957, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363935373b),
('fqali7h7ja5kofpqk6m02qvq2rdndalh', '101.53.254.132', 1615906840, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363834303b),
('fro60rd25b1pbafa44tiioo58pe0v10k', '101.53.254.132', 1615379606, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393630363b),
('fske687031fr30fada7v9oloql8t668i', '101.53.254.132', 1615902954, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930323935343b),
('fth3m9ov6a0c743b5ljbik1r4hpcn1iq', '127.0.0.1', 1606356618, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363335363532313b72656469726563745f75726c7c733a32383a22687474703a2f2f72616d2e746573742f696e71756972792f76696577223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('ftumno1kfvlo58smvo8626sjdk596ops', '101.53.254.132', 1615903132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333133323b),
('fvsfdqgkv55hru40oqqq1p4jac324knf', '101.53.254.132', 1615380422, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303432323b),
('g49egaekckuh3mal3rvn5cd4e7vi26f7', '101.53.254.132', 1615903079, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333037393b),
('g4l7p4cu2si5tmkfd5h8n9hss7itbgjt', '39.45.176.96', 1615155504, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353135353433323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('g5g5f36hkrcovhunhqath3fvf423mi1d', '101.53.254.132', 1615380700, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303730303b),
('g65ga8u7bla95ioeo8lcvj9giqlr4ae5', '72.255.54.157', 1615374146, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337333839393b),
('g7oto1h0p3b5cvv710o2n90icl4i4oam', '101.53.254.132', 1615380364, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303336343b),
('g8i7n78c6e0gs368d1tan1nifmlpemkk', '101.53.254.132', 1615905857, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353835373b),
('g8l2u7lq9d24eqj0mp96co5h9j67uoqj', '101.53.254.132', 1615906370, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363337303b),
('ga0fsr7scgpnoqciirmg4m482qmdp84l', '72.255.54.157', 1614719854, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343731393535383b72656469726563745f75726c7c733a34353a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f70726f66696c652f36223b6e616d657c733a31313a2251616d6172206a61766564223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2239223b6c6f67676564696e5f7573657269647c733a313a2236223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('gaeo4c4n82q3o3kl6ssl4q95rh4faqqe', '101.53.254.132', 1615191507, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139313530373b),
('gagbhevejvsc5sdlvrkr8red7hooqo04', '101.53.254.132', 1615906801, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363830313b),
('gb7ho7pcl8s75vd9e790q32vm0fp15kv', '101.53.254.132', 1615192616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323631363b),
('gbmgrl5ak7naf7dduq4hlvejevlcg7ue', '101.53.254.132', 1615907038, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373033383b),
('gc0r1pmtbpgli11238nvk03vvehh1rur', '101.53.254.132', 1615906557, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363535373b),
('gcq27fa11ho3gipp08rus79453knrn0d', '101.53.254.132', 1615906801, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363830313b),
('gd31uqhr6h1l0ng3eqd7m8aqp7orhdrk', '127.0.0.1', 1606348173, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363334383137333b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('ge99rdgv31h6jodeg7nuhj57qvt7pl3e', '39.42.73.202', 1614645833, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343634353830323b72656469726563745f75726c7c733a33373a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f64617368626f617264223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('gf5avq6fob4246eaa1c2gbuu8qbt4d69', '101.53.254.132', 1615903119, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333131393b),
('gfcof9hdtse0oanm7icu6egd24j6tdtc', '101.53.254.132', 1615906947, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363934373b),
('gfgh136hvdo3l55okjterdck504pn22f', '101.53.254.132', 1615317092, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331373039323b),
('gfgm040ie80t8ghcnsm5n792vmdlklhk', '101.53.254.132', 1615315858, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353835383b),
('gg768r2ejv4jg7b0ichatmto18adjvm8', '101.53.254.132', 1615906936, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363933363b),
('ghgplmvhi9mhthlo05q94j18kcbjch2r', '101.53.254.132', 1615316261, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363236313b),
('ghnnn409sn36lql4dp80qv2s81fbrqn6', '101.53.254.132', 1615316398, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363339373b),
('gj916gb5eoqhnck2u9llm06lph9pn6n0', '127.0.0.1', 1605899713, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630353839393431363b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('gkbgigi1j95f7ib1106rflm5sdka5u4v', '127.0.0.1', 1606334921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363333343932313b72656469726563745f75726c7c733a32373a22687474703a2f2f72616d2e746573742f696e71756972792f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('gkdk2nkgg0araq21muav2oj5vboj1lt0', '101.53.254.132', 1615368995, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336383939353b),
('gkl9gse351mq13mb25iqaluabrnkp015', '39.42.73.202', 1614724824, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343732343533373b72656469726563745f75726c7c733a34353a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f70726f66696c652f36223b6e616d657c733a31313a2251616d6172206a61766564223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2239223b6c6f67676564696e5f7573657269647c733a313a2236223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('gkvdip2a16n02b23hd76ad6esfmujrht', '101.53.254.132', 1615903119, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333131393b),
('gl84t9724eds6hkqfof3g7og1a1tgnc5', '101.53.254.132', 1615907084, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373038343b),
('gn3heif0ai9us4mrf2su607nqdv9op38', '101.53.254.132', 1615906547, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363534373b),
('goaufqvebo28nfap73jlo6ko1tt92asv', '101.53.254.132', 1615371641, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337313634313b),
('gp6t7gkktf0d0kuk699a2bffe814pokn', '101.53.254.132', 1615907084, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373038343b),
('gpguneu4ep6ln9jcsagqg16pj1v6olg8', '101.53.254.132', 1615313152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331333135323b),
('gq13bt9psknpv5u0ij3s698upipu94hh', '101.53.254.132', 1615374027, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337343032373b),
('gtnlpql57nrd0ogbpqu047lvp47g3n8a', '101.53.254.132', 1615379776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393737363b),
('gvh3e4k1154jtpej871gdo5jf5skug2u', '101.53.254.132', 1615380684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303638343b),
('h2pen0fl8qjt7ftqjsr2ra6uomhver7n', '101.53.254.132', 1615903188, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333138383b),
('h3d2als4thg1kk96qlpra1e9d5i7f7ql', '101.53.254.132', 1615312589, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331323538393b),
('h3s0q7db5gsmmcrt9qs9u0u6c5rg004v', '101.53.254.132', 1615905859, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353835393b),
('h4475hs0hu5fpb2ekbgifc9el32big67', '101.53.254.132', 1615902954, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930323935343b),
('h44il7p9ubc43o182vtm9v7ptaab2a0g', '101.53.254.132', 1615191447, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139313434373b),
('h6ghbclvloej9tdsonda5qotir7ehkn0', '101.53.254.132', 1615905642, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353634323b),
('ha7mu37gmkk1rgq8naima5bif0jd7pp7', '101.53.254.132', 1615316456, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363435363b),
('hb7jk1uv9voi2ktkrb73nmhnhvbvprsm', '101.53.254.132', 1615316346, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363334363b),
('hb8suoal56jrkvr4nbuqfmira36d41cp', '101.53.254.132', 1615906696, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363639363b),
('hcq84qem0v1guug36p687j40upplj5f1', '101.53.254.132', 1615903028, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333032383b),
('hd592pndtv0q1cd6m7b01759lp35fq8m', '39.42.73.202', 1614727396, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343732373339333b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('hdveoi61sk3rqb5ajbh4n4i0qr1s8cmc', '101.53.254.132', 1615903661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333636303b),
('hec986shp02dg4dvltnv9mahvbgo40up', '101.53.254.132', 1615907025, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373032353b),
('hf9lhqm2le2a3r18ac7mh99v36es7597', '101.53.254.132', 1615316347, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363334373b),
('hg2mcfnb530r1tmg2s9ubj69noeipfch', '3.25.129.67', 1615258878, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353235383832323b),
('hh676dkspc2rc2f10s9lq4v5n22q4aj0', '118.24.106.70', 1615057341, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353035373333393b),
('hhtise1tokhfodu4bj7q6u1ucbmk0s16', '101.53.254.132', 1615370057, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337303035373b),
('hic2eesfp7mf70rhl7blamjee03bu2rm', '101.53.254.132', 1615192615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323631353b),
('hik5vin6ss49gmlrsh7l9urvr8mkm2df', '39.42.73.202', 1614728896, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343732383839363b72656469726563745f75726c7c733a34353a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f70726f66696c652f36223b6e616d657c733a31313a2251616d6172206a61766564223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2239223b6c6f67676564696e5f7573657269647c733a313a2236223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('hj4ild7or8q55dfggddridgbbfhj5raf', '101.53.254.132', 1615368970, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336383937303b),
('hj6oe6v2d035shj0opjjeml589j8v2h9', '101.53.254.132', 1615380702, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303730313b),
('hjfunnevh8m0scuqkebg2crnn66rkgn6', '101.53.254.132', 1615906547, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363534373b),
('hjj6l0tfn9crljks3phvipuc7inodcjd', '101.53.254.132', 1615906958, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363935383b),
('hjp752hrcjh71lfgbao5ean8b1ai69kt', '101.53.254.132', 1615906989, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363938393b),
('hk0rarle2ad3k2dlavuboljdh092orfk', '101.53.254.132', 1615380478, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303437383b),
('hl6cuoh3qd3vttv942ctmh8e05grfokf', '101.53.254.132', 1615368996, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336383939363b),
('hma4je4kocgmt8aatc7t764djpkis5f1', '101.53.254.132', 1615903709, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333730393b),
('hp8199g7jgfl0s8so72hcplji9pendd5', '34.215.69.55', 1614670213, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343637303231333b),
('hphuah4ac0i45k89phofl9djdn3k9ckn', '101.53.254.132', 1615379831, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393833313b),
('hprrlb3n6hnpivlt1p68etq6t6hm00tr', '72.255.54.157', 1614718931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343731383636373b72656469726563745f75726c7c733a34353a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f70726f66696c652f36223b6e616d657c733a31313a2251616d6172206a61766564223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2239223b6c6f67676564696e5f7573657269647c733a313a2236223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('hps2qhfd9qgdfub3gm2ieu8s1u309uao', '101.53.254.132', 1615903591, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333539313b),
('hq06icfk018cgf6ej6c7i0es7stdtved', '127.0.0.1', 1606167429, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363136373432393b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33393a22496e666f726d6174696f6e20486173204265656e205361766564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226e6577223b7d),
('hqqtk2k3tn1eq255q7jufm0vti8i5bm2', '101.53.254.132', 1615380227, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303232373b),
('hrfi4m9bhuo404sl3fmlnap56l5hk3lb', '101.53.254.132', 1615371872, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337313837323b),
('hsaup8s0748gc0p2mrqcl8nh81vva44o', '101.53.254.132', 1615905856, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353835363b),
('ht5d5rcgta8h3e0v2i99cpt2aaml0i16', '101.53.254.132', 1615906974, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363937343b),
('htqhf1bdehmpcmu7cmeadnvhhpkobo8d', '127.0.0.1', 1606169479, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363136393437393b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('hucssq6dj6jbiecc2kl3dd0bq30ngm6q', '101.53.254.132', 1615192434, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323433343b),
('hud161jd2m6nb85rq93450thab4cbfpl', '101.53.254.132', 1615369003, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393030333b),
('hufeuvrvvellep6mcpqtp2b8mge98s80', '101.53.254.132', 1615906958, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363935383b),
('hvcgp0t3gdp8eilge5qbv9v74583rbk7', '127.0.0.1', 1606485812, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363438353831313b72656469726563745f75726c7c733a32383a22687474703a2f2f72616d2e746573742f696e71756972792f76696577223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('i011o1lsharuos4s685dolsss4igcr95', '101.53.254.132', 1615906371, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363337313b),
('i16mlulrmfs34bp4jm14o2ulojcfvobo', '101.53.254.132', 1615906924, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363932343b),
('i3mfdl3u0tlu7hrt677rkspj5o2cch5m', '101.53.254.132', 1615192530, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323533303b),
('i4jsh8t1l4g3gkrmj4bdput2cipcvsdv', '101.53.254.132', 1615903205, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333230353b),
('i6idcvenra6knnscuu8sqig0btqijd3k', '101.53.254.132', 1615380229, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303232393b),
('iav41uks7a9lrr16sv4ak6djgd15rijn', '101.53.254.132', 1615906964, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363936343b),
('iccmodnfre8lnfgmmisqptdg45siapi4', '101.53.254.132', 1615903591, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333539313b),
('icocuve86qfqbvrua87ka9i475g6uomc', '127.0.0.1', 1605900612, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630353930303631323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('id206vgojpr7r97hovb0sq9g3ctiu1ps', '101.53.254.132', 1615902968, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930323936383b),
('if9otp44748fg543v1r8u6srhgrke6bj', '101.53.254.132', 1615903744, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333734343b),
('ifaul6hht3mjidt16196t2rsgoe975o8', '101.53.254.132', 1615192538, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323533383b),
('ih1f8tf9gi5pc1mccg6omd3lau8mr2i4', '45.148.10.190', 1615583973, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353538333937333b),
('ik2k2230qse9q17tf4ps81i8mphc0ka0', '101.53.254.132', 1615903615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333631353b),
('ik9uunpacia1hbtle03i7aq9htlpji4q', '101.53.254.132', 1615906556, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363535363b),
('ilk0umr3kuh8ekbakd80p3j0lfvj85kp', '119.160.100.91', 1614645737, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343634353733373b72656469726563745f75726c7c733a33373a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f64617368626f617264223b),
('imf52ti4bc5bg6rbihcotttkaa8of17o', '101.53.254.132', 1615379667, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393636373b),
('imfd6gsgtpb0ofkh1tvs9k1l93uane0e', '101.53.254.132', 1615906547, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363534373b),
('irbra3k6vphvu53j7n2c8db4urbdl546', '101.53.254.132', 1615906958, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363935383b),
('is4esbfc2ho4ct3m3t8t6kr4dmt25spv', '101.53.254.132', 1615903078, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333037383b),
('isdkfhnr0l22le16h2ln5o4kmlb6l98d', '101.53.254.132', 1615906713, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363731333b),
('itm3k6bvojvbnl1qsb5clapubuk2drmc', '101.53.254.132', 1615029803, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353032393830323b),
('iuquub6m1b5sf9pddho2kik6jhljc7td', '101.53.254.132', 1615903206, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333230353b),
('iuutvrljbbadqhi2kcpus84dobreem84', '101.53.254.132', 1615906713, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363731333b),
('j173bc773rdhj4s5kdg7vlavo9t54tc4', '101.53.254.132', 1615906974, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363937343b),
('j1fdkhj0bine3qs450nl1adga1inq6um', '101.53.254.132', 1615379776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393737363b),
('j28tfpoa7vtol8jc6kuh37p4cebun5mm', '101.53.254.132', 1615901947, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930313934373b),
('j2p3tjo4k5o6po4r4pebirg66jd8ople', '101.53.254.132', 1615315682, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353638323b),
('j7bt65ivjl2n07f74r12dfnh57la74mh', '101.53.254.132', 1615316721, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363732313b),
('j7ol8mlp6db0db86eqiovb273kh0cseq', '101.53.254.132', 1615906635, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363633353b),
('j8782qcmka6igvtpftqhvs7ljf0bjhck', '101.53.254.132', 1615315709, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353730393b),
('j9g8705ucgfk9l9a90pb5j2uqr548qq4', '72.255.54.157', 1614719036, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343731393030383b72656469726563745f75726c7c733a34353a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f70726f66696c652f36223b6e616d657c733a31313a2251616d6172206a61766564223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2239223b6c6f67676564696e5f7573657269647c733a313a2236223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('ja1d7dvaggkjlirm30n86hh0aa841l5r', '101.53.254.132', 1615192141, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323134313b),
('jaqoqebuju88eq5ho8pil4pdcecncunv', '101.53.254.132', 1615191490, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139313439303b),
('jenkk2b5e1mil4iuvbeoaq9um1gq99e4', '101.53.254.132', 1615369708, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393730383b),
('jer5g5jtt1v6lbmlu4e4r5815jg9sc07', '39.45.10.36', 1615898012, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353839373837383b6e616d657c733a31323a2241686d65642053616c6d616e223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a323a223130223b6c6f67676564696e5f7573657269647c733a313a2237223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33393a22496e666f726d6174696f6e20486173204265656e205361766564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d),
('jf1ikcmcvhmab7j54rgqgc36inati6ku', '101.53.254.132', 1615192222, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323232323b),
('jg2j19o0sna9d9gmnpfdohaij889cjsi', '101.53.254.132', 1615906636, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363633363b),
('jgae49j75pa2blr5v2n24ogb0meag47o', '101.53.254.132', 1615902770, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930323737303b),
('jgehs464udbjgtem34jkue1k9pnfhm76', '101.53.254.132', 1615316598, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363539383b),
('jja94vj7ukuqk3hcfl6f3l8ggoorcv9o', '101.53.254.132', 1615317092, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331373039323b),
('jk40m9bjc9vunrrmj65teid7ole67q87', '101.53.254.132', 1615380661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303636313b),
('jkkosrm4j3lbpt0ifkv0cp61vd4sun5h', '101.53.254.132', 1615192639, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323633393b),
('jl19l4i78c29fjq0cbbkq5af1p1hdus3', '101.53.254.132', 1615192526, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323532363b),
('jm04g6mbdcrcr51o9ipbhcfmvi00h17j', '39.45.205.173', 1615231660, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353233313635303b72656469726563745f75726c7c733a34353a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f70726f66696c652f36223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('joubu3fs4uk5aahqpil5d820nuidm6tm', '101.53.254.132', 1615379501, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393530313b),
('jrjqcvgr9p7cp3e2ni0mntqrhj7rs460', '101.53.254.132', 1615315522, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353532323b),
('jukptoj1imbq9tf104kbqmial104g3p0', '39.42.73.202', 1614726181, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343732353934313b72656469726563745f75726c7c733a34353a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f70726f66696c652f36223b6e616d657c733a31313a2251616d6172206a61766564223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2239223b6c6f67676564696e5f7573657269647c733a313a2236223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('jvmme08vpdr2hfqjjk3tt9ekm0gq6hi0', '101.53.254.132', 1615380348, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303334383b),
('k081kfhknttkth6lvojfti1r85u8s8er', '101.53.254.132', 1615906935, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363933353b),
('k2vaodnkkrgie7iu4194d7btuaam6piu', '101.53.254.132', 1615380669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303636393b),
('k3sdorkjtkbv4ggvphu5ppb75gpsbckd', '101.53.254.132', 1615903709, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333730393b),
('k4c4b2on0t8bheuecb2bdcqcus4qgfg4', '39.42.73.202', 1614726523, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343732363234363b72656469726563745f75726c7c733a34353a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f70726f66696c652f36223b6e616d657c733a31313a2251616d6172206a61766564223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2239223b6c6f67676564696e5f7573657269647c733a313a2236223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('k76f2spt62ab7tudukr72c0shjff5nvj', '101.53.254.132', 1615903709, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333730393b),
('k9ah7cksdk5r4rsh8j1kno3c30s2moi5', '101.53.254.132', 1615373604, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337333630343b),
('k9biu5kc4duqdmlkqlgfs2qvkeqnfh1n', '101.53.254.132', 1615316398, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363339383b);
INSERT INTO `rm_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('k9c9h1jes49nkl86mijjh73shv1qpmhe', '101.53.254.132', 1615903109, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333130393b),
('k9mte5jogivmdbg84s1g4tsmt3j65jtq', '101.53.254.132', 1615369453, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393435333b),
('kagpdcjnl43dku79lmemb26d0pst8o3l', '101.53.254.132', 1615903206, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333230363b),
('kal6tosps3t91orve6387hg9ugf0lop3', '101.53.254.132', 1615380482, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303438323b),
('kddrhl3k8ujrgi9e20aa1kbtl6irb5nk', '101.53.254.132', 1615903178, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333137383b),
('keq6lm30tdnmcusgp5mjh71ok41m4cji', '101.53.254.132', 1615316707, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363730373b),
('kf6ru6kdhh15sg82p0deufhr52uhor35', '101.53.254.132', 1615903120, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333132303b),
('kfud1jdeltpqbk9r4flt44h8r0qnp31n', '101.53.254.132', 1615192469, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323436393b),
('kg096351bqs3ngnmdleu5n843brujk4o', '101.53.254.132', 1615191482, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139313435373b),
('kgddcdsjfvf6k8r3fvj9kp0jj0k6r07a', '101.53.254.132', 1615905823, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353832333b),
('ki2acbp5j9hpb25c549mbd6dnt64hk9f', '101.53.254.132', 1615380684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303638343b),
('kigjmk1687dv6bf6r1h1m5imeg3k2ubg', '101.53.254.132', 1615307558, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353330373530363b),
('kilk7vkirp3eveskpkfnp30bcs81vtoi', '101.53.254.132', 1615906556, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363535363b),
('kj6baut19jemu0b2vh7jp6cpm78orh46', '101.53.254.132', 1615906923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363932333b),
('kjdntqbuhan04bpgthjl68iv2o9btf5l', '101.53.254.132', 1615192110, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323131303b),
('kkgsg7qev6u9f91mlkjj7l6r2s8dk44v', '101.53.254.132', 1615379490, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393439303b),
('klsrbuh200gpkkh6ovbu3fths5j8i74j', '101.53.254.132', 1615905463, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353436323b),
('kmbgr977mlncr4m6gods98rvcmch4seg', '101.53.254.132', 1615903028, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333032383b),
('kmf6okr2cpv7n8ocducfvvuiqr8lkaus', '101.53.254.132', 1615906539, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363533393b),
('kn2q0ccd80ika6trlhc4h20gdogr26bf', '101.53.254.132', 1615906540, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363534303b),
('ko7v0iuchpgina0npdoe0u0e8dacctdn', '101.53.254.132', 1615192153, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323135333b),
('kpask1l4pqaunvm46qa8tco5kihse4tp', '101.53.254.132', 1615906557, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363535373b),
('kqdsl90jmc3jgpl338u94abs7usa8ov0', '101.53.254.132', 1615906713, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363731333b),
('kqfg5ep4mvfvkfb116pdn0mid1t0bfii', '101.53.254.132', 1615380661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303636313b),
('kr5j1cbngr10u1vid31r9s746ru0nvfp', '101.53.254.132', 1615906990, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363939303b),
('krukflpnjgj7l4hahbj37r7e22pplis9', '101.53.254.132', 1615371933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337313933333b),
('kv2dhnbnjnjs6qth0cf8umqv6jqjf4o3', '101.53.254.132', 1615192526, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323532363b),
('l0t7oq427bllmesm6b5os3fer9bkctff', '39.45.176.96', 1615163089, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353136323739393b72656469726563745f75726c7c733a34343a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f666565732f6475655f696e766f696365223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33393a22496e666f726d6174696f6e20486173204265656e205361766564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d),
('l18ikcddtrtschl57h95b6mrb6s81fha', '101.53.254.132', 1615380240, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303234303b),
('l1k1d7erbd70falud93kt1ajmt7en4bc', '101.53.254.132', 1615376546, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337363534363b),
('l1v6umsq8p31icbo6svpj042bedjbml8', '101.53.254.132', 1615903616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333631363b),
('l3452ef1f0vttdlca7j2s3djbpuh39ao', '101.53.254.132', 1615380390, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303339303b),
('l5nm62lnlptbvuop67a38i1fb365fp0g', '101.53.254.132', 1615316346, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363334363b),
('l7i9nu3f2rhbpnrqm4sadmvkat30cmet', '101.53.254.132', 1615380423, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303432333b),
('la82d3n11oaiqrh78hrachqp66gdns5s', '101.53.254.132', 1615380241, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303234313b),
('lb5f2d1u49ard8rt2nutncqqvtu6gfes', '101.53.254.132', 1615316422, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363432323b),
('lbg5t21n4bggk5fjg8kge1m0ckr0u9go', '101.53.254.132', 1615380363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303336333b),
('lc27rqbnc0pk1aq8t580a6pktl7g8duv', '101.53.254.132', 1615313133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331333133333b),
('lccqledrp5b4vubjv7e2ejcecqhjdef9', '101.53.254.132', 1615316449, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363434393b),
('ldlb6n9qgtu9n38cmfe6o1ig1p94rdrp', '101.53.254.132', 1615313133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331333133333b),
('lemtenautltt30lfjk9olfrplb6lpok0', '39.42.72.203', 1615402516, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353430323239363b),
('lgc96ijepbg4agptsqhgnrq9ks5mlqta', '101.53.254.132', 1615368986, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336383938363b),
('ligfjcam9592bn7133jceam4e32i6htp', '101.53.254.132', 1615380279, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303237393b),
('lihjd3mo1egdoe8d4s7irikn1kcgad9p', '72.255.54.157', 1615400371, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353430303230383b),
('llc0gt0nckvkk7l4pjqg7c4if9g03u80', '101.53.254.132', 1615903206, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333230353b),
('llu6itquptmk4ql8pr2i34a3js158par', '101.53.254.132', 1615380662, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303636313b),
('ln3lnhuaq3q4msjdhmaa4g56dvtpvoc9', '101.53.254.132', 1615380279, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303237393b),
('lq59mio1kil3pav6mbc8ris6cfkgva3d', '127.0.0.1', 1606349976, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363334393937363b72656469726563745f75726c7c733a32373a22687474703a2f2f72616d2e746573742f696e71756972792f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('lq6artjtlboqv5hqkdaga4uu4ireluha', '127.0.0.1', 1605899663, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630353839393434353b),
('lr3e1emfds0pjbr1mea1hne4erv46ggr', '101.53.254.132', 1615906547, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363534373b),
('lsij2lo7jk5ugv71s5mfe3qckcum2isa', '101.53.254.132', 1615315954, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353935343b),
('lt682i9r1kciteiqbv43uhclao4hcktt', '118.24.106.70', 1615057341, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353035373333393b),
('ltrju8m4ahloq3fmc4hf92i0kj2rks75', '101.53.254.132', 1615906851, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363835303b),
('ltuebajjr5debjhlgaqpi40mcalfu4bj', '52.192.73.251', 1614773166, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343737333136363b),
('ltvh5jf221glfigjhcmrfe781ebph8eh', '128.199.21.230', 1615617039, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353631373033393b),
('lu1f7ulqp1vp3n5995b8378ak429hgj5', '101.53.254.132', 1615906615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363631353b),
('luj2vncbsejudc87nqrh71dl61arcfdc', '101.53.254.132', 1615906695, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363639353b),
('m20ko68et2g804rpi4ckh8cd38hgob3j', '101.53.254.132', 1615906615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363631353b),
('m2jn083ttu3lsdtl2mfcrbvb7omcvkal', '127.0.0.1', 1606352375, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363335323237383b72656469726563745f75726c7c733a32373a22687474703a2f2f72616d2e746573742f696e71756972792f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('m3it3jlrmk1fbf94bspmh485pavsjr7v', '127.0.0.1', 1606168748, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363136383734383b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('m7r22oha6di2c2mt1ekv8th0h8no5sgl', '72.255.54.157', 1615927581, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353932373432373b72656469726563745f75726c7c733a34353a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f70726f66696c652f38223b6e616d657c733a31313a2246616b68617220416c616d223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a323a223131223b6c6f67676564696e5f7573657269647c733a313a2238223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('m9sefpqr7kct1usvfkt2nugn28t8ru6n', '119.160.100.250', 1615193533, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139333339313b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('m9slfjtesf9ubn9torkjfrgiuusj3l81', '101.53.254.132', 1615906989, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363938393b),
('ma8bg2dhreafgk0fn23avr17b917scqu', '101.53.254.132', 1615906963, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363936333b),
('mam6b3dtoupf03tdoed7v531soaf0e8b', '101.53.254.132', 1615907020, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373032303b),
('mcdu0d33k7hs6j2bjjpndff81ocij4gp', '101.53.254.132', 1615906557, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363535373b),
('md5cetan9i8ldhj415q968mgpe5pn8bj', '101.53.254.132', 1615903189, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333138393b),
('mdkmjc06eeldveit65anf63svqobpnbg', '101.53.254.132', 1615906924, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363932343b),
('mec1kngtslkb39bivk1k2cdhavbqda0v', '185.204.1.224', 1615588845, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353538383834353b),
('memln0kn4m3eh2g4q3ql0jm83m6cua52', '101.53.254.132', 1615369264, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393236343b),
('mg7ksuapmnq2khqhegcbcnsmo30bbrl4', '101.53.254.132', 1615369941, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393934313b),
('mi078hjmveaha4nchgfkp4fe8qmi5u36', '101.53.254.132', 1615906964, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363936333b),
('miibv20777su82jmc5hqovds95pjit2s', '127.0.0.1', 1606168121, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363136383132313b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('mjf4apkhseaupq5fgajopct39lrhsf91', '101.53.254.132', 1615906963, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363936333b),
('mktmdn6gj8cllm61fmn38um8ptfk1ro3', '101.53.254.132', 1615371641, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337313634313b),
('mlqslngumn68qrq2sqcjpl275q77vni9', '101.53.254.132', 1615379667, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393636373b),
('mlvos2nb2aufo2vpcbh3bc9rkpb1lvgb', '101.53.254.132', 1615907007, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373030373b),
('moqd3rn26ge5tmufrk2dkqm2hn5c757d', '101.53.254.132', 1615312749, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331323734393b),
('motdg815aucpsgo4kkq1ghdnclnkm231', '101.53.254.132', 1615316828, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363832383b),
('mq0dkv6p98mqqv82ge3un6o41n43huuu', '101.53.254.132', 1615905641, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353634313b),
('mqe18f6pacm5dfaiff4ifal8s9dmiu97', '101.53.254.132', 1615906540, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363534303b),
('mrsqfso32g1uamuh5ulvchgbrpnpq71b', '101.53.254.132', 1615380422, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303432323b),
('ms0r07nscf2po9k58nll4b3q7hepn1n2', '101.53.254.132', 1615379832, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393833323b),
('msuqok3tnscub1gs422l6fe2nqhtvhi8', '101.53.254.132', 1615906782, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363738323b),
('mtij7ahn5rc1q9tdlh3q248vqqm7gi2r', '101.53.254.132', 1615380668, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303636383b),
('mtkq9jfau4hi3vjs985a9acd3m2n3s27', '101.53.254.132', 1615903413, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333431333b),
('mvdt7c5mr8i2jknpi1ad2umhk9leu2tv', '101.53.254.132', 1615903132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333133323b),
('mviocvtbfilvrp86kr4obcuk8hajblid', '127.0.0.1', 1606169162, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363136393136323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('n4835uoflthci4bpa243u9ad850t4ikp', '101.53.254.132', 1615903189, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333138393b),
('n4j0490pa5lkg9g9kv7thlvgc2t2e4j8', '101.53.254.132', 1615906801, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363830313b),
('n61okis0rk36fn7mkdeamur0rrnqgpso', '39.45.176.96', 1615162265, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353136313938333b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33393a22496e666f726d6174696f6e20486173204265656e205361766564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d),
('n72mpkc4mhusg3n8b732s32c90pb857m', '101.53.254.132', 1615901952, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930313935323b),
('n7djt6jve27ck5cc7ii9n5t8gfptej9p', '101.53.254.132', 1615903615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333631353b),
('n8i1am27e19snisfs2dh2cbe2js989j7', '101.53.254.132', 1615903615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333631353b),
('n9bon3htcan2i3g8doga9o9q8hd762pq', '101.53.254.132', 1615379537, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393533373b),
('nalni92s405c2j0ft0nlkmt6mtsnvgj5', '101.53.254.132', 1615906385, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363338353b),
('naqp1a8ofknffpp4560qrqn6nvf9t18v', '127.0.0.1', 1606353079, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363335333037393b72656469726563745f75726c7c733a32383a22687474703a2f2f72616d2e746573742f696e71756972792f76696577223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('nbm2shnj80jv7j0jsucth7o62iu23mde', '101.53.254.132', 1615903029, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333032393b),
('ndssf4mnuam6e94o13ugjdnh5jv0qfn3', '101.53.254.132', 1615316456, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363435363b),
('ngo5ous80hkpdu1q7p9dvjf68tg84v91', '101.53.254.132', 1615380279, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303237393b),
('niklkllsghh27gfkuu97ggqhktguqas7', '101.53.254.132', 1615380484, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303438343b),
('nj0ebj10m0mperi2tc5qho7kpvutrcl5', '101.53.254.132', 1615906712, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363731323b),
('nj398raic8u3idir7lj5645cgp5ul7bn', '101.53.254.132', 1615380348, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303334383b),
('njgaicgs1s0qp2a2bvdls4du5mqikk5c', '101.53.254.132', 1615377482, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337373333333b),
('njrlhgb81lroeo1klhg59soh8ge579ln', '101.53.254.132', 1615380389, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303338393b),
('nm93q8jibl98beuv1ub1od17mp62q8uf', '101.53.254.132', 1615907027, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373032373b),
('nms8l7s89m350dit6adcuksq6kk3b1pg', '101.53.254.132', 1615316765, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363736353b),
('nob4eggsa17crcqrt344evq3v8g9bkpb', '101.53.254.132', 1615315882, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353838323b),
('npf3jok23dv47m9uhae1r2erpr44meu4', '101.53.254.132', 1615379721, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393732313b),
('npi0k4cic2teg9u7tj79vod4tdtf8i9s', '101.53.254.132', 1615369709, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393730393b),
('nrhtsmvgopvhth12aoc8hj3er2udmc8f', '127.0.0.1', 1606335400, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363333353430303b72656469726563745f75726c7c733a32373a22687474703a2f2f72616d2e746573742f696e71756972792f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('nu6lp9g17njgv98mqumumfj7cqtjmmd0', '101.53.254.132', 1615192469, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323436393b),
('nupop8g14qh7v54775aoi1scamsap9tv', '101.53.254.132', 1615906937, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363933373b),
('nutke7ps3aq39i462dm1q0eruipq0r14', '101.53.254.132', 1615906782, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363738323b),
('nv3lfvmq4vbjfu7kad0bchbatfjn691f', '164.90.140.214', 1614929825, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343932393832353b),
('nvhbjirob5dikniilgr78due70mjdjpv', '101.53.254.132', 1615906635, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363633353b),
('o02703jljdou1khldeejfiu25n5n6ns3', '101.53.254.132', 1615906385, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363338353b),
('o1njc2plup0hd7r7c83k1qn60gnp3u2e', '101.53.254.132', 1615906528, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363532383b),
('o4b7de3j0fg3btgcna77lhg8ahrttdb1', '101.53.254.132', 1615906385, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363338353b),
('o4jiish99p2r672c9d76qj82hkdakki7', '101.53.254.132', 1615906850, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363835303b),
('o5atfs7tqj63atrpapumfcgld495qm4b', '101.53.254.132', 1615380349, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303334393b),
('o6l5qpr6hnt2c2nge74n6facd3svm8vc', '101.53.254.132', 1615903178, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333137383b),
('o6pod7ddusq4020q89sjk7lqssg42v25', '101.53.254.132', 1615376541, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337363534313b),
('o7lamqcftfou9c5gs8l2q93mblfs01ju', '101.53.254.132', 1615903709, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333730393b),
('o9g28lcj23nmbd99et5b99lg8aqhbij8', '101.53.254.132', 1615380364, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303336343b),
('oas77b8ijulval7domoah76bih321vko', '39.45.176.96', 1615162681, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353136323630313b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('oc53mfjajd06fs0uaa6d93q5arrp64b1', '101.53.254.132', 1615191500, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139313530303b),
('ocv7da31pkum30gahj8rkb4oefg9du6s', '101.53.254.132', 1615903624, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333632343b),
('odt4q2gud7iehep9qtb5grt8ld77jgiv', '101.53.254.132', 1615901954, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930313935343b),
('oedbqomb68h9f9fmptvm2se3uvac4lqu', '72.255.54.157', 1615308761, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353330383436373b),
('ofui32emgq4eoq33hup48mlkck8qlrpl', '101.53.254.132', 1615906371, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363337313b),
('oh9guggvi9jvfk28u38auioudiagt45p', '39.42.73.202', 1614646048, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343634363030373b72656469726563745f75726c7c733a34303a2268747470733a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('oh9jbf07ohaoot7hq3dlrcfj39j85nri', '127.0.0.1', 1605900441, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630353930303236373b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('ohccfm7d7dvrumnpu4rpi10plcgu0sqr', '101.53.254.132', 1615316261, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363236313b),
('ohev892ob7amkbgja8n5n27c0dtka72m', '101.53.254.132', 1615380701, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303730313b),
('oi649e4eeihpb6bj1rvk8dossp4u2ubr', '101.53.254.132', 1615903591, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333539313b),
('oijbcsgln8b372c760e9suro1c562nin', '101.53.254.132', 1615907040, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373034303b),
('okn3mv2b8kmsr7cja4u5eiqh208g0qo5', '101.53.254.132', 1615903661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333636313b),
('oko1em48gtpdjgn1ngjg55h1ke2g51v0', '101.53.254.132', 1615316641, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363634313b),
('om1ihcrptmol1kkoqrj6ql8k5g6vtgqg', '101.53.254.132', 1615369609, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393630393b),
('omp6opadrkfn8jcdtg90r6jjnp6ok9e1', '101.53.254.132', 1615905859, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353835393b),
('onqrvl7cm3oq337otp53li16i180085o', '101.53.254.132', 1615380701, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303730313b),
('op3qd2fu637r6e3qdecuokbk5rurl3gi', '101.53.254.132', 1615906841, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363834313b),
('oq2kbcf19ir5qvrn9lr0ojjmt9io9cv3', '101.53.254.132', 1615371933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337313933333b),
('oum5o4m68vququ18gs1ng0sjg7u5lt3k', '101.53.254.132', 1615316367, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363336373b),
('ov0evton7attmv7f9osgorsmkkm72h90', '101.53.254.132', 1615379722, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393732323b),
('ovap0g4dkh6k7j6gurkhevjahi57o8dl', '101.53.254.132', 1615317124, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331373132343b),
('ovtj36ajo0ermjdd0d5cd7c6k35ofuri', '101.53.254.132', 1615906974, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363937343b),
('p1tsj61htbqkkqqob6g8pch6jvjcmojv', '101.53.254.132', 1615905465, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353436353b),
('p2bu0jcloiehkksctb93dnkmgucqq92j', '34.209.105.222', 1615998550, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353939383535303b),
('p2l6dcsc08mhqm2fk56faucjp573khhv', '101.53.254.132', 1615380389, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303338393b),
('p2slhp3jijgvljb14rqmle1ddnbb05dd', '39.42.73.202', 1614728860, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343732383836303b),
('p39amlbp0sas95l20ioa9k6brm3oanli', '101.53.254.132', 1615903205, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333230353b),
('p4a1ogf4rimsc5ugmc628jsobunfreuj', '101.53.254.132', 1615903624, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333632343b),
('p5uvtjh9fvtnipp9720fp0a3um5cv4eg', '72.255.54.157', 1615925709, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353932353538323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('p5v2bn3ghcc1po284brkgh3p86o92r8t', '101.53.254.132', 1615380364, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303336343b),
('p6l0eo6v0tg3visc214gjsuje9odgf50', '101.53.254.132', 1615906528, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363532383b),
('p8mkh0ephctothhfsnb39i2vjf1ve8ct', '101.53.254.132', 1615906695, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363639353b),
('p8o7p59o5nfk758ulrf8c5gek3kgjvd9', '39.45.176.96', 1615158576, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353135383537333b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('pbptshmj22s36nu6tu94e1fks1ebg10g', '127.0.0.1', 1605898978, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630353839383639323b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('pd4ucefoppbk2rbpb6lrp61vioe324mt', '101.53.254.132', 1615905763, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353736333b),
('pf7v48evmm7dkk0ihoss2mc04mnhd1sr', '101.53.254.132', 1615903615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333631353b),
('pf998qru4uhdaqmgisl87q4lnql8iq0k', '101.53.254.132', 1615907083, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373038333b),
('pfttmbsdi9b7v4b9isr9i61d3au3055t', '101.53.254.132', 1615316707, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363730373b),
('phavft3tnqgs7tgkm03mvee5pvo9rskp', '101.53.254.132', 1615316398, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363339383b),
('pile617rsn5sgd19ukgrqqp9lrrbsp8e', '39.45.10.36', 1615896804, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353839363830343b),
('pim141iit94i2osjeb0ik0djqq05t6ui', '72.255.54.157', 1615232526, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353233323532363b),
('pjtr14qo80cvou1bvirteqve3u8a87f8', '101.53.254.132', 1615379536, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393533363b),
('pl9lb1dr97a66pushdv27rsqflvji4er', '101.53.254.132', 1615906841, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363834313b),
('plm0o06obhktvf15dppt62ju5psdipar', '101.53.254.132', 1615379253, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393235333b),
('pmtjqqv29g623d6e4t75i61ddk1ntj76', '101.53.254.132', 1615120225, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353132303232343b),
('pmvm0smvvcajas70vok01udsti8k9auc', '101.53.254.132', 1615315521, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353532313b),
('poflqvicka5dqagkfl6ub8mmc6o61f2b', '101.53.254.132', 1615906546, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363534363b),
('pp55v05m175ss77bv31aavujunlqhe1f', '101.53.254.132', 1615907084, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373038343b),
('pp9tqb65qhn2a12v9u05iomblf5fe4f1', '101.53.254.132', 1615906516, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363531363b),
('ppbeta4km7rkjiekvh5606i2eeu994sa', '101.53.254.132', 1615192469, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323436393b),
('ppobh7cl88nvu94610o30ngaa58cfp77', '127.0.0.1', 1606347286, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363334373136343b72656469726563745f75726c7c733a32373a22687474703a2f2f72616d2e746573742f696e71756972792f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('pq5giiaehg4n5pd1crfk7eqv233bq6oa', '101.53.254.132', 1615316469, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363436393b),
('pqkupee3cooqmugoda5r01652ngn9jv0', '101.53.254.132', 1615906782, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363738323b),
('pqoscbrm32qccua41pfv07r00orl3c41', '101.53.254.132', 1615903178, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333137383b),
('psi31480vvommmlv186sbiepgvjmill8', '101.53.254.132', 1615316323, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363332333b),
('puhaia6fol10100ecs55v2d7u6jsatpj', '101.53.254.132', 1615380423, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303432333b),
('pvtvup9etoc1k8ui32u8tvc8jb7or3p0', '101.53.254.132', 1615905856, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353835363b),
('q0pk619vnhuj5ddkmq4kif3hkivnpi4s', '101.53.254.132', 1615379831, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393833313b),
('q1fojuhctilom93knjs124tehgga6ond', '39.45.212.243', 1614666757, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343636363735333b72656469726563745f75726c7c733a33373a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f64617368626f617264223b),
('q35m75taemj23b6lqcrrppvgjbmhfoum', '39.42.73.202', 1614727906, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343732373639313b72656469726563745f75726c7c733a34353a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f70726f66696c652f36223b6e616d657c733a31313a2251616d6172206a61766564223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2239223b6c6f67676564696e5f7573657269647c733a313a2236223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('q47l70nd1cqmoom8lhu52fbcabm9deli', '101.53.254.132', 1615379606, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393630363b),
('q5eq406r7pr9ieg6m3irtnhkauae91rk', '101.53.254.132', 1615369550, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393535303b),
('q5klda853pq1smudukr12o4qde6lkluk', '101.53.254.132', 1615369471, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393437313b),
('q5p5069utmc2ftlh9n3uit1ipi92iepa', '101.53.254.132', 1615380662, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303636313b),
('q6caku81tvftaebbtqf2iaolrc6735vv', '101.53.254.132', 1615312327, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331323332373b),
('q74jr2ekphmd4761ihs8vv4dv0rumoom', '101.53.254.132', 1615903132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333133323b),
('q75olnh1j0iltnj0fdanllm5ujnl7ofg', '101.53.254.132', 1615380347, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303334373b),
('q7995cu2op0u2dmdkmobc1k3lolo4qh0', '101.53.254.132', 1615369268, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393236383b),
('q7ouo86d0imai95kralptrf0e14n8r8v', '101.53.254.132', 1615907020, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373032303b),
('q8astqokvmobfoevcriaoa6f19123ol4', '127.0.0.1', 1606349294, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363334393239343b72656469726563745f75726c7c733a32373a22687474703a2f2f72616d2e746573742f696e71756972792f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('q9t1sip5rfr4n6q321ediel9duf104lg', '101.53.254.132', 1615379563, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393536333b),
('q9uvr0pskdaki31bclsnks2invf1ftbr', '72.255.54.157', 1614720293, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343732303237323b72656469726563745f75726c7c733a34353a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f70726f66696c652f36223b6e616d657c733a31313a2251616d6172206a61766564223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2239223b6c6f67676564696e5f7573657269647c733a313a2236223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('qa29uubskt99d2mi39mn7b98li6mff66', '101.53.254.132', 1615192500, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323530303b),
('qabfoqflj99h5mji4d07cqgdllua1a0d', '101.53.254.132', 1615192227, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323232373b),
('qc5p1iofcd2nrt4q7flup3mrdcgbvuot', '101.53.254.132', 1615192434, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323433343b),
('qc6666h9a9ccotpgtpb7q9gn21q4fpqp', '101.53.254.132', 1615906989, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363938383b),
('qdin2uhlpkq23q3vlcekfd9bb9u7p7p1', '101.53.254.132', 1615907019, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373031393b),
('qdjetlv8tui7srihbsd1nv4hbnatrtab', '101.53.254.132', 1615903625, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333632353b),
('qfre20r1njqkhfq8tn6244rsvg2t2qh3', '101.53.254.132', 1615903109, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333130393b),
('qghj0sd4eh02li38b4ivf7kddl137b20', '34.215.69.55', 1614670213, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343637303231333b),
('qgho94n6pv7eanl5v52n7qt19gjcsilb', '101.53.254.132', 1615315665, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353636353b),
('qgj60de0s1tklp3dm8895bh2dl37ld0c', '101.53.254.132', 1615312670, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331323636393b),
('qh5kcp8so0ma0h3jrno4eecfmav6mhqi', '101.53.254.132', 1615906764, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363736343b),
('qiu2kbblpipbndset9f60gc5762clm0a', '39.45.10.36', 1615897598, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353839373239393b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('qj2267fhl0a7b2m8er2c6nlmhcqqhtpt', '101.53.254.132', 1615903555, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333535353b),
('qjaupq8fj91k9ku3plcakhd6hne26un1', '101.53.254.132', 1615906923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363932333b),
('qkvcstsjunmhr5mq9136svuo3c2kaj33', '101.53.254.132', 1615379667, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393636373b),
('qlv694un7jgq605opvglrc4ujq7bsg8l', '101.53.254.132', 1615903205, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333230353b),
('qlvc02vq2mi1o8plbk0tjb9lkiilmjr2', '101.53.254.132', 1615316641, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363634313b),
('qmo0245u1n1d7llmtvs192ab680pcjlb', '101.53.254.132', 1615903189, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333138393b),
('qn042oa05os17rfidmgiifhaqc5ve2us', '101.53.254.132', 1615903028, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333032383b),
('qnsrpf6eb400vjmsits8vadf3fbpa2n5', '101.53.254.132', 1615369453, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336393435333b),
('qnvf7o1585ia1sajoc1cqm0nea8ookbe', '101.53.254.132', 1615316449, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363434393b),
('qokcd7gctmtif1ddhjb82ugo4e87d9jt', '101.53.254.132', 1615192434, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323433343b),
('qp9avomss7dg6tu1plv4a49l19j1h3di', '101.53.254.132', 1615316484, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363438343b),
('qquen8muo359d1k6p3aj9f66ja7j7kk4', '101.53.254.132', 1615380348, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303334383b),
('qr2reomnnne6migif4bnrav3aqimch6t', '101.53.254.132', 1615193163, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323931343b),
('qrkh7q2pcq8m2h9mdp716jbqoguu5rib', '101.53.254.132', 1615906851, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363835313b),
('qs6he6otd2t0qea56t5n4ilqltbv7945', '101.53.254.132', 1615906616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363631363b),
('qsoejm45r5t7m3qmpivlad1hqug9u2ta', '101.53.254.132', 1615903110, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333131303b),
('qtgv4enilu1ikjvodclg08vbs6etogpi', '101.53.254.132', 1615191500, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139313530303b),
('qu47bgjjikh5k0iqased66s63ugmt5jd', '101.53.254.132', 1615192667, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323636373b),
('quehi35eh7l0drk7g8q4au1f9aufkjl3', '101.53.254.132', 1615906615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363631353b),
('qvdfl198jb2m8g2inl8236gi1163nbpe', '101.53.254.132', 1615906948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363934383b),
('r0ep4u7gi5ktm5a0c10aemu5fa4utjfc', '101.53.254.132', 1615903078, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333037383b),
('r0nmmp15ecif3iadk59po6p424e5cm9m', '101.53.254.132', 1615906782, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363738323b),
('r0o02oltc4ql8qhvbu7cs4df9tufi50q', '101.53.254.132', 1615379525, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393532353b),
('r4q3bfnsc9ot6qrrqcc47cq6sh8f99an', '101.53.254.132', 1615380241, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303234313b),
('r4u03u86gu7ln8ih8qavmjkpgalbo73e', '39.45.10.36', 1615836635, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353833363531313b72656469726563745f75726c7c733a34343a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f666565732f6475655f696e766f696365223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('r5bkdd0s8jod1sc33r8nfs146shrg16n', '101.53.254.132', 1615315498, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353439383b),
('r6topckvae2jpij37nf3iacabnecot8q', '101.53.254.132', 1615907040, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373034303b),
('r72kp7gtbqivd7m854apskcrdceil8fe', '101.53.254.132', 1615380660, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303636303b),
('r8m59fi666op0a458ve11um3q2tgglj1', '101.53.254.132', 1615316604, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363630343b),
('r9hrsrp9lu47p8a56vdhftcusioj1eho', '127.0.0.1', 1606337371, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363333373039373b72656469726563745f75726c7c733a32373a22687474703a2f2f72616d2e746573742f696e71756972792f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('rd8il2oitp8hicqot2ipks567pkchfv0', '101.53.254.132', 1615192526, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323532363b),
('ret0gdr7b32mu5jq0rnkkbfh34vupkgi', '101.53.254.132', 1615903591, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333539313b),
('rfhvbh09randg6pfpbr1bsq6tjieqpmh', '101.53.254.132', 1615379643, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393634333b),
('ri6f79k9te6ca29cl1umbrk442ng1i5v', '101.53.254.132', 1615906923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363932333b),
('rm08rtnmg265pig0g4g55ltejfa8q6ii', '101.53.254.132', 1615906370, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363337303b),
('rm0e7f9j06ajkp2ouru55s0g5m088oe7', '35.181.112.20', 1615625588, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353632353538383b),
('rmk5ftg303b3fg8kgml08l9ppvghk90k', '101.53.254.132', 1615903708, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333730383b),
('romicvlnpa3qgmd5lv3asdqqoik18nib', '101.53.254.132', 1615380240, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303233393b),
('rp9tpfu3rs66e17rn9upo8cpb879n4im', '::1', 1605898536, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630353839383533363b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('rpr3p883m7490d68r6itop1bcs1ns99b', '101.53.254.132', 1615371681, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337313638313b),
('rpt6vik47ta3g6q7697u839u447ek0rr', '101.53.254.132', 1615906763, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363736333b),
('rqql21aut14na3pdjse4egr8i69qirkp', '101.53.254.132', 1615907020, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373032303b),
('rqvschacihr6ga1b7i3l295poudm8jru', '101.53.254.132', 1615380279, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303237393b),
('rr1gc3irricn8m6pbh1lnnov7t5rq4c0', '101.53.254.132', 1615906801, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363830313b),
('rsai6sknnus9o0de3v09ul6tvlf7rt82', '101.53.254.132', 1615903591, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333539313b),
('rtorck6dlisghq76o4tq3k8e89baci4k', '101.53.254.132', 1615903709, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333730393b),
('ru03fpt5f3f82lt2nfoc145o2158na1j', '39.42.73.202', 1614722449, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343732323134393b),
('s0h55glj4h22t8l54lpfjvdg7u66eqon', '101.53.254.132', 1615316457, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363435373b),
('s3kbh77g7e1snrf7l8gujt44ldjn6c90', '39.42.73.202', 1614722660, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343732323635393b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('s3sdvebdrki6mgrkgncrs1amvabit558', '101.53.254.132', 1615379776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393737363b),
('s4c27hvls1uqjo7641hffj5jnh3fq78t', '101.53.254.132', 1615380669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303636393b),
('s4ki4skn7g9tts4slqp9lf5s8s2qsu4u', '101.53.254.132', 1615380279, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303237393b),
('s4ngj1j13p9l5bcor6hvu0s3euk9hc96', '101.53.254.132', 1615315709, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353730393b),
('s57srj5mknni1udf25rg7vig17cekhjn', '101.53.254.132', 1615906635, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363633353b),
('s6ql6a2g4jc173016bepuseilg9e2pd8', '101.53.254.132', 1615371900, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337313930303b),
('s71jfg5qkaogr9rbs4tb2l861nhhr2ai', '101.53.254.132', 1615380684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303638343b);
INSERT INTO `rm_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('s8aghuqloaiai8efq2mavj7ob7abvp9u', '127.0.0.1', 1606169656, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363136393437393b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('s8hkv0pv0r27a584di3u18mmhuk2e2gd', '39.42.25.154', 1615818687, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353831383638373b),
('s9q1lcqilp1hasf1jg5oo1s9vng5mqlj', '101.53.254.132', 1615316604, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363630343b),
('sacffth4jr1ei1s74sb420ogtb0konig', '72.255.54.157', 1614717810, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343731373830393b72656469726563745f75726c7c733a34353a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f70726f66696c652f36223b6e616d657c733a31313a2251616d6172206a61766564223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2239223b6c6f67676564696e5f7573657269647c733a313a2236223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('sb94gheb7rgq06d46u2g0im4trjad54r', '101.53.254.132', 1615316765, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363736353b),
('sc2h032a7fipt29esurjssu4hra5hmil', '101.53.254.132', 1615907084, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373038343b),
('sc35jorfrd2jma64tmi9mlnk4od9q6db', '101.53.254.132', 1615379721, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393732313b),
('scbte1beg5g6bdk8fc95s6si3fjjrodv', '127.0.0.1', 1605962590, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630353936323530303b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('sd7g9veg8vghiusecrd15aada1ms3gas', '101.53.254.132', 1615903401, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333430313b),
('sdiruid38qq36ts847kasv58oto9udn6', '101.53.254.132', 1615192711, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323731313b),
('sdoap7vsusmgo4ndg0ic81bt8anhb1al', '101.53.254.132', 1615906958, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363935383b),
('senqkkntthhoh5dful2s7apb46sj5khs', '35.181.112.20', 1615625593, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353632353539333b),
('sf7q63kim0339ivlkjsla46kf7u8badn', '101.53.254.132', 1615191507, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139313530373b),
('sg4ad5n2h29d728aookodsthq1omm5hm', '101.53.254.132', 1615316490, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363439303b),
('si7hjo5h6se8tabnluvo4m2gj2001971', '101.53.254.132', 1615402164, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353430323136343b),
('sjlbtaudg115vto809n7ap3q4o35e84n', '101.53.254.132', 1615903131, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333133313b),
('smc8pkg17b2lpr07stoq0t9stltun894', '::1', 1606347500, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363334373338313b72656469726563745f75726c7c733a33323a22687474703a2f2f6c6f63616c686f73742f72616d2f696e71756972792f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('smkruv6eekctu07t62pvnjb3jgellnlt', '39.42.73.202', 1614728566, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343732383430303b72656469726563745f75726c7c733a34353a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f70726f66696c652f36223b6e616d657c733a31313a2251616d6172206a61766564223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2239223b6c6f67676564696e5f7573657269647c733a313a2236223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('smv3skboeo93964cu0tu74bh1gke57sf', '39.45.41.33', 1616025704, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631363032353638333b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('sn07ouon8mevhbe5rno0chuiirc8o2j7', '101.53.254.132', 1615380334, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303333343b),
('snu9kg7ubqoe2fhf4cplruffs4ojlcbr', '101.53.254.132', 1615316952, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363935323b),
('sptcr28qldo3cuhfv6g4jtr2qo2mjvqq', '101.53.254.132', 1615376433, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337363433333b),
('ss60ec0lkhh7kqgrpmmrjhe2o2eipfad', '159.89.33.69', 1614930907, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343933303930373b),
('su6kksnavhir37mtc142acvpkdnff3qq', '101.53.254.132', 1615907026, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373032363b),
('svtv3r324paj07l4nfl5b4rs3rcbt5kr', '101.53.254.132', 1615379563, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393536333b),
('t042rn1f2fv12dgegcavr78kqtfe8gbh', '101.53.254.132', 1615371933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337313933333b),
('t0bhfdupjb2e748khlctb5p5eashe3vn', '101.53.254.132', 1615906851, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363835313b),
('t20a88qln5iroi5m265b37m2rogs3h59', '101.53.254.132', 1615368738, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336383733383b),
('t3hij5sks0e9nau740ffc940mq9to97t', '101.53.254.132', 1615906782, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363738323b),
('t3v02lm20m8448m28uin6751l2reivgb', '101.53.254.132', 1615143974, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353134333935383b),
('t9apjhkdtogd9emi39itbj54sc8mf199', '101.53.254.132', 1615907026, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373032363b),
('t9n4e9tep6d5e3tki49f75k8tcpvlgct', '101.53.254.132', 1615905856, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353835363b),
('t9sonqlm0ir82g55v2pbrsokga7069ta', '101.53.254.132', 1615192530, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323533303b),
('ta0dpumputk2hkufq5cju6rh876upme2', '72.255.54.157', 1615926626, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353932363432363b),
('tb92k111nofdvo4ue3ipoblihcjdps8t', '101.53.254.132', 1615906850, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363835303b),
('tbf0mdk2dbuvgi13n5qke4tvaf1b1qh5', '101.53.254.132', 1615903744, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333734343b),
('tcjrthhvtabg89l5t3c2vm6octldqjfk', '127.0.0.1', 1606348576, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363334383533363b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33393a22496e666f726d6174696f6e20486173204265656e205361766564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d),
('td90k008803orhlv6dqp24s4hkmimvpe', '101.53.254.132', 1615312578, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331323537383b),
('te4e681drata9h7qv46rcrc6l5ujfa96', '101.53.254.132', 1615380701, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303730313b),
('tes26eivdnmn3f44j1oanlc5pf3ouu75', '101.53.254.132', 1615906974, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363937343b),
('tf5ukscu8gi5008t5qk2ajsnuje940d2', '101.53.254.132', 1615907084, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373038343b),
('tgiopgjvcvmo7gpr676eq16dnk1v05vb', '101.53.254.132', 1615903466, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333436363b),
('tgq50cbr97grlem139oosmt7thl55lga', '101.53.254.132', 1615903189, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333138393b),
('th4877il61d3sve5h99s726jsju7p0lb', '101.53.254.132', 1615315498, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353439383b),
('thp3aaa5o0ilbp1hidpvnrvn5vtp5q6s', '101.53.254.132', 1615906557, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363535373b),
('tjc3ej158j74tf9n0ujnu645gaku001s', '101.53.254.132', 1615316439, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363433393b),
('tjtoionfuial9pnhilnkt3494v0rp12n', '101.53.254.132', 1615907039, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373033393b),
('tmd8q74bjeiig77i67m2u75llt0v8mhr', '138.246.253.24', 1615014951, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353031343935313b),
('tmhu707arfrha7a96j5o5nrkpb5p7g4e', '101.53.254.132', 1615380701, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303730313b),
('to595fvmmt5roaj1sd35ijl955sevf2g', '127.0.0.1', 1606350570, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363335303537303b72656469726563745f75726c7c733a32373a22687474703a2f2f72616d2e746573742f696e71756972792f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('tp1o3pcab3oug7oe769kn6m3i11anuuh', '101.53.254.132', 1615380662, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303636323b),
('tpu6lir43pc9b8gl0da5fc41ospp9552', '101.53.254.132', 1615379775, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393737353b),
('tsa790nc3mhmog549f318r82alpl12p1', '34.209.105.222', 1615998554, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353939383535343b),
('tshuvfn768h4cgu0rvghnbtrmll4ktql', '101.53.254.132', 1615907020, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373032303b),
('tsj2roudjojgasp95dtrjdte3h7f8qgm', '101.53.254.132', 1615192538, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323533383b),
('tt32nd01s3s44n7tge5lt3cs3uhkk6s9', '101.53.254.132', 1615380280, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303238303b),
('ttj5t26n6e7avb1lmbuhri5nakehcjq3', '101.53.254.132', 1615316367, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363336373b),
('tva38qauipg7bgojgr2leeu3spubhd2k', '101.53.254.132', 1615192530, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323533303b),
('tvcanhdl0spu8v9145oek7dt7oo9jbd4', '101.53.254.132', 1615903661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333636313b),
('u042l5sm48pha35ns2llup5f4i743nqr', '101.53.254.132', 1615315954, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331353935343b),
('u0spqf5656u957v4jcfooltu5l2d5sm9', '101.53.254.132', 1615906528, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363532383b),
('u1q6ahp7smj6pg5pnmider77a3n8jpkb', '101.53.254.132', 1615907007, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373030373b),
('u1rfjvn48dcvd99h8s1t1n6mg9jgsgjg', '101.53.254.132', 1615906370, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363337303b),
('u5i9mqqk6903bgj7st9fgcd13sde7g8h', '101.53.254.132', 1615906384, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363338343b),
('u8nt2i4mhnt2hk3it7ifiduvr1chgdfe', '101.53.254.132', 1615903437, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333433373b),
('uasci0paeab3jo4i32vba1daa2f2k3ua', '101.53.254.132', 1615905763, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353736333b),
('ucqf25afaeb8ipoqjrum0a6b1isqcugg', '101.53.254.132', 1615902968, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930323936383b),
('uesfm7t7ug8th8ubnbalg82lb1ms3l91', '54.36.118.115', 1614702880, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343730323837393b72656469726563745f75726c7c733a33393a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f616464223b),
('ufm4d94kuj5qpl9sctu35849i1b06idj', '101.53.254.132', 1615906989, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363938393b),
('ugai51bin4g3hm56k4htb9m5nfk9l18n', '101.53.254.132', 1615907021, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373032313b),
('uiuoep4lspbocl4hdh9hfo20677fpg27', '101.53.254.132', 1615905610, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353631303b),
('uj97s9gcc47uhjrb1beqc4sfp1k3faha', '101.53.254.132', 1615380669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303636393b),
('uklbqj3l0l9nchmh08ppvu5a901k8tr3', '101.53.254.132', 1615906923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363932333b),
('ulhu1t0391oirs9isitf2grsd317ejqi', '101.53.254.132', 1615380423, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303432333b),
('ulth35te9ujd14uqark3negb17pr895h', '101.53.254.132', 1615906516, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363531363b),
('umunve48gqgla77svb8ee2ho7odmopv8', '101.53.254.132', 1615906516, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363531363b),
('uocnb1boirmhhut1eo52j65d2tfaapci', '101.53.254.132', 1615316357, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363335373b),
('utn9jmlh6lod1t7ce9hjj8ncuosnscm3', '101.53.254.132', 1615316624, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363632343b),
('uuoc4ng56akbekbknd31r75e4e11kpkp', '101.53.254.132', 1615380669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303636393b),
('uv17pufa1o2uhd244kpqgkue5slvccbn', '101.53.254.132', 1615906841, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363834313b),
('v0jb2112da12dco39vq6g7lvrcflub0p', '127.0.0.1', 1606352719, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363335323731393b72656469726563745f75726c7c733a32383a22687474703a2f2f72616d2e746573742f696e71756972792f76696577223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('v12cttikvcbchoc0oet39546u57e50u8', '127.0.0.1', 1606350888, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363335303838383b72656469726563745f75726c7c733a32373a22687474703a2f2f72616d2e746573742f696e71756972792f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('v1dvi7d62404rfsk6b7a298vkqrt4lpe', '127.0.0.1', 1605962010, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630353936313733313b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('v1nmk02iqruvujp9u3pa19v7l5un3d4p', '101.53.254.132', 1615402665, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353430323533333b),
('v1o1e82q7cbrqk2lmuq81dupl3riorp0', '101.53.254.132', 1615905764, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930353736343b),
('v2c8cog89a92n8es23p0m79aqbfae2sk', '39.42.73.202', 1614728316, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343732383031393b72656469726563745f75726c7c733a34353a22687474703a2f2f72616d6f6d2e6c6f67696373666f72742e636f6d2f73747564656e742f70726f66696c652f36223b6e616d657c733a31313a2251616d6172206a61766564223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2239223b6c6f67676564696e5f7573657269647c733a313a2236223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('v2udivvlskm8l6u70ivji4783qdsv9nl', '101.53.254.132', 1615379643, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393634333b),
('v3urhtb31o5h1lv1jo76d9vd386mqn5f', '101.53.254.132', 1615316844, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363834343b),
('v5i0r5lvvkn27us07rtror7ochm0thj2', '72.255.54.157', 1614718499, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631343731373631383b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('v67903st1ha9h78928tce8rqnop7apdv', '101.53.254.132', 1615379799, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393739393b),
('v6itn7c2nkttrabod7i9br0cp4crcfbg', '101.53.254.132', 1615371872, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337313837323b),
('v8eatnsia0ljik9q5e3rb0l3up90s3ag', '101.53.254.132', 1615903109, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333130393b),
('v8pahik3qanc1h0vgcv5f82d6bcak6eh', '185.204.1.224', 1615588840, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353538383834303b),
('vaa65p70d2m7affude26l2nffp615fmr', '101.53.254.132', 1615313152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331333135323b),
('vbknsvvt6479lkiqkhiobcusa95cnri5', '101.53.254.132', 1615192510, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353139323531303b),
('vd3ff86bdrn57u4eplv0f1u4a5ckrque', '101.53.254.132', 1615370048, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337303034383b),
('vf1m59gl6eqr2s4if14sn4e8nh6a5g2f', '101.53.254.132', 1615316952, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363935323b),
('vf32fprlmjprr2jpv3sbtkgbttjrarju', '101.53.254.132', 1615903119, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333131393b),
('vf5fs5tg5mnbmn4prkg12pligvge15jj', '101.53.254.132', 1615316322, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363332323b),
('vfimsh3ot5iu9iakupl6d1jkv99udc0a', '101.53.254.132', 1615903078, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333037383b),
('vg1o2knbpqprj18prufkpp8pfutacaaj', '101.53.254.132', 1615906616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363631363b),
('vgks22e5lr1tr22cv5rctskq8n1mvoog', '101.53.254.132', 1615316596, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363539363b),
('vi2u80vjss9l71epsrlv2kltau2j9gsg', '72.255.54.157', 1615981602, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353938313439333b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('vil555b7kp9q62nqek7dcp3nb63ut4s9', '101.53.254.132', 1615316623, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363632333b),
('viuj66kb904kkfa9l4pb2vssibd2796j', '101.53.254.132', 1615312180, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331323035353b),
('vjprcdtkpu5i9r3umt7f64ujislq7anj', '101.53.254.132', 1615907035, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373033353b),
('vl1p0no405cdnaorcpib1olhkb106nj6', '101.53.254.132', 1615903398, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930333339383b),
('vlmgct8k86vgcocf8vcppj1qh3v9affs', '101.53.254.132', 1615907007, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373030373b),
('vlqrq021mb5ogph1uno2jmv92svd1vi8', '101.53.254.132', 1615902776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930323737363b),
('vmtbk5op434f3nqqu1vnhlmhs62j0c5v', '72.255.54.157', 1615926827, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353932363730313b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a34313a22496e666f726d6174696f6e20486173204265656e2055706461746564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d),
('vnk7o3nokr6kn0gb79scp5htn27f1hdp', '101.53.254.132', 1615379721, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393732313b),
('vnsh803vft3q3g65ad2ff751l35kidv2', '101.53.254.132', 1615380684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303638343b),
('vokt6f1b257j5feo15cdmg8bqu9groc9', '101.53.254.132', 1615906974, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363937343b),
('vopc28qn11hv012uttv7qp67dfn8prtv', '101.53.254.132', 1615379831, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393833313b),
('vpcicdihhtvvlcqg706gdrbllkjktiu9', '101.53.254.132', 1615907083, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930373038333b),
('vpsqtmnagkjb139kf1np1sodq5fc2fcd', '72.255.54.157', 1615374205, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337343230353b),
('vq87973ik27pvi5969s106vh7l1pjgi4', '101.53.254.132', 1615906763, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353930363736333b),
('vr4j59aura0jk2257qg2s25797ts0mam', '101.53.254.132', 1615368994, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353336383939343b),
('vrulcsqh3cs34seed2ma5vu8jlnd4ekd', '127.0.0.1', 1606427080, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630363432373036373b72656469726563745f75726c7c733a32373a22687474703a2f2f72616d2e746573742f696e71756972792f616464223b6e616d657c733a353a2261646d696e223b6c6f676765725f70686f746f7c4e3b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b7365745f73657373696f6e5f69647c733a313a2233223b6c6f67676564696e7c623a313b),
('vse0h96relifnroqgn7e0k3vd2fvgdnl', '39.45.10.36', 1615896975, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353839363937353b),
('vskdtd86e1a0gv6aa78b3thlvqp5s85m', '101.53.254.132', 1615379800, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393830303b),
('vtc87e4s8bco0um2l42bsk4agqc043t9', '101.53.254.132', 1615316439, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353331363433393b),
('vul1k0pjo5ukom12vl5vi9dv99bfdblg', '101.53.254.132', 1615380240, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353338303234303b),
('vvf9r2f6mcps2g3377g4pqfnrq7dl7ka', '101.53.254.132', 1615379490, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353337393439303b),
('vvp9a17ggskkoueteomdu4r1mjretibj', '101.53.254.132', 1615227650, 0x5f5f63695f6c6173745f726567656e65726174657c693a313631353232373632333b);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `is_system` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `prefix`, `is_system`) VALUES
(1, 'Super Admin', 'superadmin', '1'),
(2, 'Admin', 'admin', '1'),
(3, 'Teacher', 'teacher', '1'),
(4, 'Accountant', 'accountant', '1'),
(5, 'Librarian', 'librarian', '1'),
(6, 'Parent', 'parent', '1'),
(7, 'Student', 'student', '1');

-- --------------------------------------------------------

--
-- Table structure for table `salary_template`
--

CREATE TABLE `salary_template` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `basic_salary` decimal(18,2) NOT NULL,
  `overtime_salary` varchar(100) NOT NULL DEFAULT '0',
  `branch_id` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salary_template_details`
--

CREATE TABLE `salary_template_details` (
  `id` int(11) NOT NULL,
  `salary_template_id` varchar(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `type` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `schoolyear`
--

CREATE TABLE `schoolyear` (
  `id` int(11) NOT NULL,
  `school_year` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schoolyear`
--

INSERT INTO `schoolyear` (`id`, `school_year`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '2019-2020', 1, '2020-02-25 19:35:41', '2020-02-26 16:54:49'),
(3, '2020-2021', 1, '2020-02-25 19:35:41', '2020-02-26 01:35:41'),
(4, '2021-2022', 1, '2020-02-25 19:35:41', '2020-02-26 01:35:41'),
(5, '2022-2023', 1, '2020-02-25 19:35:41', '2020-02-26 01:35:41'),
(6, '2023-2024', 1, '2020-02-25 19:35:41', '2020-02-26 01:35:41'),
(7, '2024-2025', 1, '2020-02-25 19:35:41', '2020-02-26 01:20:04'),
(9, '2025-2026', 1, '2020-02-26 07:00:10', '2020-02-26 13:00:24');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `capacity` varchar(20) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`id`, `name`, `capacity`, `branch_id`) VALUES
(1, 'A', '50', 1),
(2, 'B', '50', 1),
(3, 'C', '50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sections_allocation`
--

CREATE TABLE `sections_allocation` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections_allocation`
--

INSERT INTO `sections_allocation` (`id`, `class_id`, `section_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sms_api`
--

CREATE TABLE `sms_api` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_api`
--

INSERT INTO `sms_api` (`id`, `name`) VALUES
(1, 'twilio'),
(2, 'clickatell'),
(3, 'msg91'),
(4, 'bulksms'),
(5, 'textlocal');

-- --------------------------------------------------------

--
-- Table structure for table `sms_credential`
--

CREATE TABLE `sms_credential` (
  `id` int(11) NOT NULL,
  `sms_api_id` int(11) NOT NULL,
  `field_one` varchar(300) NOT NULL,
  `field_two` varchar(300) NOT NULL,
  `field_three` varchar(300) NOT NULL,
  `field_four` varchar(300) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sms_template`
--

CREATE TABLE `sms_template` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `tags` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_template`
--

INSERT INTO `sms_template` (`id`, `name`, `tags`) VALUES
(1, 'admission', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}'),
(2, 'fee_collection', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {paid_amount}, {paid_date} '),
(3, 'attendance', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}'),
(4, 'exam_attendance', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {exam_name}, {term_name}, {subject}'),
(5, 'exam_results', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {exam_name}, {term_name}, {subject}, {marks}'),
(6, 'homework', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {subject}, {date_of_homework}, {date_of_submission}'),
(7, 'live_class', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {date_of_live_class}, {start_time}, {end_time}, {host_by}');

-- --------------------------------------------------------

--
-- Table structure for table `sms_template_details`
--

CREATE TABLE `sms_template_details` (
  `id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `notify_student` tinyint(3) NOT NULL DEFAULT 1,
  `notify_parent` tinyint(3) NOT NULL DEFAULT 1,
  `template_body` longtext NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `staff_id` varchar(25) NOT NULL,
  `name` varchar(255) NOT NULL,
  `department` int(11) NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `experience_details` varchar(255) DEFAULT NULL,
  `total_experience` varchar(255) DEFAULT NULL,
  `designation` int(11) NOT NULL,
  `joining_date` varchar(100) NOT NULL,
  `birthday` varchar(100) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `religion` varchar(100) NOT NULL,
  `blood_group` varchar(20) NOT NULL,
  `present_address` text NOT NULL,
  `permanent_address` text NOT NULL,
  `mobileno` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `salary_template_id` int(11) DEFAULT 0,
  `branch_id` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `facebook_url` varchar(255) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `twitter_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `staff_id`, `name`, `department`, `qualification`, `experience_details`, `total_experience`, `designation`, `joining_date`, `birthday`, `sex`, `religion`, `blood_group`, `present_address`, `permanent_address`, `mobileno`, `email`, `salary_template_id`, `branch_id`, `photo`, `facebook_url`, `linkedin_url`, `twitter_url`, `created_at`, `updated_at`) VALUES
(1, '370cb71', 'admin', 0, '', NULL, NULL, 0, '2020-10-02', '', '', '', '', '', '', '', 'admin@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, '2020-10-02 03:57:08', NULL),
(2, '412da15', 'Ghulam Nabi', 1, 'Matric', '', '', 1, '2021-03-02', '', 'male', '', '', 'Samanabad park, Lahore', '', '14785236985', 'Gnabi@gmai.com', 0, 1, 'defualt.png', '', '', '', '2021-03-01 23:05:14', NULL),
(3, '8431d9e', 'Shafi sab', 1, 'Masters', '', '', 2, '2021-02-18', '', 'male', '', '', 'Gilshan Ravi, Lahore', '', '1025634556', 'shafi@gmail.com', 0, 1, 'defualt.png', '', '', '', '2021-03-01 23:07:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_attendance`
--

CREATE TABLE `staff_attendance` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `status` varchar(11) DEFAULT NULL COMMENT 'P=Present, A=Absent, H=Holiday, L=Late',
  `remark` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_attendance`
--

INSERT INTO `staff_attendance` (`id`, `staff_id`, `status`, `remark`, `date`, `branch_id`) VALUES
(1, 2, 'P', '', '2021-03-01', 1),
(2, 3, 'P', '', '2021-03-01', 1),
(3, 2, 'H', '', '2021-02-28', 1),
(4, 3, 'H', '', '2021-02-28', 1),
(5, 2, 'P', '', '2021-02-27', 1),
(6, 3, 'P', '', '2021-02-27', 1),
(7, 2, 'P', '', '2021-02-25', 1),
(8, 3, 'L', '', '2021-02-25', 1),
(9, 2, 'A', '', '2021-02-24', 1),
(10, 3, 'P', '', '2021-02-24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff_bank_account`
--

CREATE TABLE `staff_bank_account` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `bank_name` varchar(200) NOT NULL,
  `holder_name` varchar(255) NOT NULL,
  `bank_branch` varchar(255) NOT NULL,
  `bank_address` varchar(255) NOT NULL,
  `ifsc_code` varchar(200) NOT NULL,
  `account_no` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff_department`
--

CREATE TABLE `staff_department` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_department`
--

INSERT INTO `staff_department` (`id`, `name`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'Teaching', 1, '2021-03-01 23:01:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_designation`
--

CREATE TABLE `staff_designation` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_designation`
--

INSERT INTO `staff_designation` (`id`, `name`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'Subject Lecturer', 1, '2021-03-01 23:01:00', NULL),
(2, 'Class Incharge', 1, '2021-03-01 23:01:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_documents`
--

CREATE TABLE `staff_documents` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category_id` varchar(20) NOT NULL,
  `remarks` text NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `enc_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff_privileges`
--

CREATE TABLE `staff_privileges` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `is_add` tinyint(1) NOT NULL,
  `is_edit` tinyint(1) NOT NULL,
  `is_view` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_privileges`
--

INSERT INTO `staff_privileges` (`id`, `role_id`, `permission_id`, `is_add`, `is_edit`, `is_view`, `is_delete`) VALUES
(1, 3, 1, 1, 1, 1, 1),
(2, 3, 2, 0, 0, 0, 0),
(3, 3, 3, 1, 1, 1, 1),
(4, 3, 4, 0, 0, 0, 0),
(5, 3, 5, 0, 0, 0, 0),
(6, 3, 30, 0, 0, 0, 0),
(7, 3, 7, 0, 0, 0, 0),
(8, 3, 8, 0, 0, 0, 0),
(9, 3, 6, 0, 0, 1, 0),
(10, 3, 9, 0, 0, 0, 0),
(11, 3, 10, 0, 0, 0, 0),
(12, 3, 11, 0, 0, 0, 0),
(13, 3, 12, 0, 0, 0, 0),
(14, 3, 13, 0, 0, 0, 0),
(15, 3, 14, 0, 0, 1, 0),
(16, 3, 15, 0, 0, 1, 0),
(17, 3, 16, 0, 0, 0, 0),
(18, 3, 17, 0, 0, 0, 0),
(20, 3, 19, 0, 0, 0, 0),
(21, 3, 20, 1, 1, 1, 1),
(22, 3, 21, 0, 0, 0, 0),
(23, 3, 22, 0, 0, 1, 0),
(24, 3, 23, 0, 0, 1, 0),
(25, 3, 24, 0, 0, 1, 0),
(26, 3, 25, 0, 0, 1, 0),
(27, 3, 26, 0, 0, 1, 0),
(28, 3, 27, 0, 0, 1, 0),
(29, 3, 28, 0, 0, 1, 0),
(30, 3, 29, 0, 0, 1, 0),
(31, 3, 32, 1, 1, 1, 1),
(32, 3, 31, 1, 1, 1, 1),
(33, 3, 33, 1, 1, 1, 1),
(34, 3, 34, 1, 1, 1, 1),
(35, 3, 35, 1, 1, 1, 1),
(36, 3, 36, 1, 1, 1, 1),
(37, 3, 37, 0, 0, 0, 0),
(38, 3, 38, 1, 1, 1, 1),
(39, 3, 39, 1, 1, 1, 1),
(40, 3, 77, 1, 1, 1, 1),
(41, 3, 78, 0, 0, 1, 0),
(42, 3, 79, 0, 0, 0, 0),
(43, 3, 40, 0, 0, 0, 0),
(44, 3, 41, 0, 0, 0, 0),
(45, 3, 42, 0, 0, 0, 0),
(46, 3, 43, 0, 0, 0, 0),
(47, 3, 44, 0, 0, 0, 0),
(48, 3, 45, 0, 0, 0, 0),
(49, 3, 46, 0, 0, 0, 0),
(50, 3, 47, 0, 0, 0, 0),
(51, 3, 48, 0, 0, 0, 0),
(52, 3, 49, 1, 0, 0, 0),
(53, 3, 50, 0, 0, 0, 0),
(54, 3, 51, 0, 0, 0, 0),
(55, 3, 52, 0, 0, 0, 0),
(56, 3, 53, 0, 0, 0, 0),
(57, 3, 54, 0, 0, 0, 0),
(58, 3, 55, 0, 0, 1, 0),
(59, 3, 56, 0, 0, 0, 0),
(60, 3, 57, 0, 0, 0, 0),
(61, 3, 58, 1, 0, 1, 1),
(62, 3, 59, 0, 0, 1, 0),
(63, 3, 60, 0, 0, 0, 0),
(64, 3, 61, 0, 0, 0, 0),
(65, 3, 62, 0, 0, 0, 0),
(66, 3, 80, 0, 0, 0, 0),
(67, 3, 69, 0, 0, 0, 0),
(68, 3, 70, 0, 0, 0, 0),
(69, 3, 71, 0, 0, 0, 0),
(70, 3, 72, 0, 0, 0, 0),
(71, 3, 73, 0, 0, 0, 0),
(72, 3, 74, 0, 0, 0, 0),
(73, 3, 75, 0, 0, 0, 0),
(74, 3, 76, 0, 0, 0, 0),
(75, 3, 63, 0, 0, 0, 0),
(76, 3, 64, 0, 0, 0, 0),
(77, 3, 65, 0, 0, 0, 0),
(78, 3, 66, 0, 0, 0, 0),
(79, 3, 67, 0, 0, 0, 0),
(80, 3, 68, 0, 0, 0, 0),
(81, 3, 81, 0, 0, 0, 0),
(82, 3, 82, 0, 0, 0, 0),
(83, 3, 83, 0, 0, 0, 0),
(84, 3, 84, 0, 0, 0, 0),
(85, 3, 85, 0, 0, 0, 0),
(86, 3, 86, 0, 0, 0, 0),
(87, 3, 87, 0, 0, 0, 0),
(88, 2, 1, 1, 1, 1, 1),
(89, 2, 2, 1, 0, 0, 0),
(90, 2, 3, 1, 1, 1, 1),
(91, 2, 4, 0, 0, 0, 0),
(92, 2, 5, 1, 0, 1, 0),
(93, 2, 30, 1, 0, 1, 0),
(94, 2, 7, 1, 1, 1, 1),
(95, 2, 8, 1, 0, 1, 0),
(96, 2, 6, 1, 1, 1, 1),
(97, 2, 9, 1, 1, 1, 1),
(98, 2, 10, 1, 1, 1, 1),
(99, 2, 11, 1, 0, 1, 0),
(100, 2, 12, 1, 1, 1, 1),
(101, 2, 13, 1, 0, 1, 0),
(102, 2, 14, 1, 0, 1, 0),
(103, 2, 15, 0, 0, 1, 0),
(104, 2, 16, 1, 1, 1, 1),
(105, 2, 17, 1, 1, 1, 1),
(107, 2, 19, 1, 1, 1, 1),
(108, 2, 20, 1, 1, 1, 1),
(109, 2, 21, 1, 1, 1, 1),
(110, 2, 22, 1, 1, 1, 1),
(111, 2, 23, 1, 1, 1, 1),
(112, 2, 24, 1, 1, 1, 1),
(113, 2, 25, 1, 1, 1, 1),
(114, 2, 26, 1, 1, 1, 1),
(115, 2, 27, 1, 1, 1, 1),
(116, 2, 28, 1, 0, 1, 1),
(117, 2, 29, 1, 1, 1, 1),
(118, 2, 32, 1, 1, 1, 1),
(119, 2, 31, 1, 1, 1, 1),
(120, 2, 33, 1, 1, 1, 1),
(121, 2, 34, 1, 1, 1, 1),
(122, 2, 35, 1, 1, 1, 1),
(123, 2, 36, 1, 1, 1, 1),
(124, 2, 37, 1, 0, 1, 1),
(125, 2, 38, 1, 1, 1, 1),
(126, 2, 39, 1, 1, 1, 1),
(127, 2, 77, 1, 1, 1, 1),
(128, 2, 78, 0, 0, 1, 0),
(129, 2, 79, 0, 0, 1, 0),
(130, 2, 40, 1, 1, 1, 1),
(131, 2, 41, 1, 1, 1, 1),
(132, 2, 42, 1, 1, 1, 1),
(133, 2, 43, 0, 0, 1, 1),
(134, 2, 44, 1, 1, 1, 1),
(135, 2, 45, 1, 1, 1, 1),
(136, 2, 46, 1, 1, 1, 1),
(137, 2, 47, 1, 1, 1, 1),
(138, 2, 48, 0, 0, 1, 1),
(139, 2, 49, 1, 0, 0, 0),
(140, 2, 50, 1, 0, 0, 0),
(141, 2, 51, 1, 0, 0, 0),
(142, 2, 52, 0, 0, 1, 0),
(143, 2, 53, 0, 0, 1, 0),
(144, 2, 54, 0, 0, 1, 0),
(145, 2, 55, 1, 1, 1, 1),
(146, 2, 56, 1, 1, 1, 1),
(147, 2, 57, 1, 0, 1, 1),
(148, 2, 58, 1, 0, 1, 1),
(149, 2, 59, 1, 1, 1, 1),
(150, 2, 60, 1, 1, 1, 1),
(151, 2, 61, 1, 0, 1, 1),
(152, 2, 62, 1, 1, 1, 1),
(153, 2, 80, 0, 0, 1, 0),
(154, 2, 69, 1, 1, 1, 1),
(155, 2, 70, 1, 1, 1, 1),
(156, 2, 71, 1, 1, 1, 1),
(157, 2, 72, 1, 1, 1, 1),
(158, 2, 73, 1, 0, 0, 0),
(159, 2, 74, 1, 1, 1, 1),
(160, 2, 75, 0, 0, 1, 0),
(161, 2, 76, 0, 0, 1, 1),
(162, 2, 63, 1, 1, 1, 1),
(163, 2, 64, 1, 1, 1, 1),
(164, 2, 65, 1, 1, 1, 1),
(165, 2, 66, 0, 0, 1, 0),
(166, 2, 67, 1, 1, 1, 1),
(167, 2, 68, 1, 1, 1, 1),
(168, 2, 81, 0, 0, 0, 0),
(169, 2, 82, 1, 0, 1, 0),
(170, 2, 83, 1, 1, 1, 1),
(171, 2, 84, 1, 1, 1, 1),
(172, 2, 85, 1, 1, 1, 1),
(173, 2, 86, 0, 0, 0, 0),
(174, 2, 87, 0, 0, 0, 0),
(175, 7, 1, 0, 0, 0, 0),
(176, 7, 2, 0, 0, 0, 0),
(177, 7, 3, 0, 0, 0, 0),
(178, 7, 4, 0, 0, 0, 0),
(179, 7, 5, 0, 0, 0, 0),
(180, 7, 30, 0, 0, 0, 0),
(181, 7, 7, 0, 0, 0, 0),
(182, 7, 8, 0, 0, 0, 0),
(183, 7, 6, 0, 0, 0, 0),
(184, 7, 9, 0, 0, 0, 0),
(185, 7, 10, 0, 0, 0, 0),
(186, 7, 11, 0, 0, 0, 0),
(187, 7, 12, 0, 0, 0, 0),
(188, 7, 13, 0, 0, 0, 0),
(189, 7, 14, 0, 0, 0, 0),
(190, 7, 15, 0, 0, 0, 0),
(191, 7, 16, 0, 0, 0, 0),
(192, 7, 17, 0, 0, 0, 0),
(194, 7, 19, 0, 0, 0, 0),
(195, 7, 20, 0, 0, 0, 0),
(196, 7, 21, 0, 0, 0, 0),
(197, 7, 22, 0, 0, 0, 0),
(198, 7, 23, 0, 0, 0, 0),
(199, 7, 24, 0, 0, 0, 0),
(200, 7, 25, 0, 0, 0, 0),
(201, 7, 26, 0, 0, 1, 0),
(202, 7, 27, 0, 0, 0, 0),
(203, 7, 28, 0, 0, 0, 0),
(204, 7, 29, 0, 0, 1, 0),
(205, 7, 32, 0, 0, 0, 0),
(206, 7, 31, 0, 0, 0, 0),
(207, 7, 33, 0, 0, 0, 0),
(208, 7, 34, 0, 0, 0, 0),
(209, 7, 35, 0, 0, 0, 0),
(210, 7, 36, 0, 0, 0, 0),
(211, 7, 37, 0, 0, 0, 0),
(212, 7, 38, 0, 0, 0, 0),
(213, 7, 39, 0, 0, 0, 0),
(214, 7, 77, 0, 0, 0, 0),
(215, 7, 78, 0, 0, 0, 0),
(216, 7, 79, 0, 0, 0, 0),
(217, 7, 40, 0, 0, 0, 0),
(218, 7, 41, 0, 0, 0, 0),
(219, 7, 42, 0, 0, 0, 0),
(220, 7, 43, 0, 0, 0, 0),
(221, 7, 44, 0, 0, 0, 0),
(222, 7, 45, 0, 0, 0, 0),
(223, 7, 46, 0, 0, 0, 0),
(224, 7, 47, 0, 0, 0, 0),
(225, 7, 48, 0, 0, 0, 0),
(226, 7, 49, 0, 0, 0, 0),
(227, 7, 50, 0, 0, 0, 0),
(228, 7, 51, 0, 0, 0, 0),
(229, 7, 52, 0, 0, 0, 0),
(230, 7, 53, 0, 0, 0, 0),
(231, 7, 54, 0, 0, 0, 0),
(232, 7, 55, 0, 0, 0, 0),
(233, 7, 56, 0, 0, 0, 0),
(234, 7, 57, 0, 0, 0, 0),
(235, 7, 58, 0, 0, 0, 0),
(236, 7, 59, 0, 0, 0, 0),
(237, 7, 60, 0, 0, 0, 0),
(238, 7, 61, 0, 0, 0, 0),
(239, 7, 62, 0, 0, 0, 0),
(240, 7, 80, 0, 0, 0, 0),
(241, 7, 69, 0, 0, 0, 0),
(242, 7, 70, 0, 0, 0, 0),
(243, 7, 71, 0, 0, 0, 0),
(244, 7, 72, 0, 0, 0, 0),
(245, 7, 73, 0, 0, 0, 0),
(246, 7, 74, 0, 0, 0, 0),
(247, 7, 75, 0, 0, 0, 0),
(248, 7, 76, 0, 0, 0, 0),
(249, 7, 63, 0, 0, 0, 0),
(250, 7, 64, 0, 0, 0, 0),
(251, 7, 65, 0, 0, 0, 0),
(252, 7, 66, 0, 0, 0, 0),
(253, 7, 67, 0, 0, 0, 0),
(254, 7, 68, 0, 0, 0, 0),
(255, 7, 81, 0, 0, 0, 0),
(256, 7, 82, 0, 0, 0, 0),
(257, 7, 83, 0, 0, 0, 0),
(258, 7, 84, 0, 0, 0, 0),
(259, 7, 85, 0, 0, 0, 0),
(260, 7, 86, 0, 0, 0, 0),
(261, 7, 87, 0, 0, 0, 0),
(262, 88, 88, 1, 1, 1, 1),
(263, 88, 88, 1, 1, 1, 1),
(264, 89, 89, 1, 1, 1, 1),
(265, 90, 90, 1, 1, 1, 1),
(266, 2, 88, 1, 0, 1, 0),
(267, 2, 89, 0, 0, 1, 0),
(268, 90, 90, 1, 1, 1, 1),
(269, 2, 90, 0, 1, 1, 0),
(270, 91, 91, 1, 1, 1, 1),
(271, 92, 92, 1, 1, 1, 1),
(272, 2, 91, 0, 0, 1, 0),
(273, 2, 92, 0, 0, 1, 0),
(274, 93, 93, 1, 1, 1, 1),
(275, 94, 94, 1, 1, 1, 1),
(276, 95, 95, 1, 1, 1, 1),
(277, 96, 96, 1, 1, 1, 1),
(278, 2, 93, 0, 0, 1, 0),
(279, 2, 94, 0, 0, 1, 0),
(280, 2, 95, 0, 0, 1, 0),
(281, 2, 96, 0, 0, 1, 0),
(282, 97, 97, 1, 1, 1, 1),
(283, 98, 98, 1, 1, 1, 1),
(284, 2, 97, 0, 0, 1, 0),
(285, 2, 98, 0, 0, 1, 0),
(286, 99, 99, 1, 1, 1, 1),
(287, 100, 100, 1, 1, 1, 1),
(288, 101, 101, 1, 1, 1, 1),
(289, 102, 102, 1, 1, 1, 1),
(290, 2, 99, 0, 0, 1, 0),
(291, 2, 100, 0, 0, 1, 0),
(292, 2, 101, 0, 0, 1, 0),
(293, 2, 102, 0, 0, 1, 0),
(294, 103, 103, 1, 1, 1, 1),
(295, 2, 103, 0, 1, 1, 0),
(296, 3, 91, 0, 0, 0, 0),
(297, 3, 92, 0, 0, 0, 0),
(298, 3, 93, 0, 0, 1, 0),
(299, 3, 94, 0, 0, 1, 0),
(300, 3, 95, 0, 0, 1, 0),
(301, 3, 96, 0, 0, 1, 0),
(302, 3, 97, 0, 0, 1, 0),
(303, 3, 98, 0, 0, 1, 0),
(304, 3, 99, 0, 0, 0, 0),
(305, 3, 100, 0, 0, 0, 0),
(306, 3, 101, 0, 0, 0, 0),
(307, 3, 102, 0, 0, 0, 0),
(308, 3, 88, 0, 0, 0, 0),
(309, 3, 89, 0, 0, 0, 0),
(310, 3, 90, 0, 0, 0, 0),
(311, 3, 103, 0, 0, 0, 0),
(312, 4, 91, 0, 0, 1, 0),
(313, 4, 92, 0, 0, 1, 0),
(314, 4, 93, 0, 0, 0, 0),
(315, 4, 94, 0, 0, 0, 0),
(316, 4, 95, 0, 0, 0, 0),
(317, 4, 96, 0, 0, 0, 0),
(318, 4, 97, 0, 0, 0, 0),
(319, 4, 98, 0, 0, 0, 0),
(320, 4, 99, 0, 0, 0, 0),
(321, 4, 100, 0, 0, 0, 0),
(322, 4, 101, 0, 0, 0, 0),
(323, 4, 102, 0, 0, 0, 0),
(324, 4, 1, 0, 0, 0, 0),
(325, 4, 2, 0, 0, 0, 0),
(326, 4, 3, 0, 0, 0, 0),
(327, 4, 4, 0, 0, 0, 0),
(328, 4, 5, 0, 0, 0, 0),
(329, 4, 30, 0, 0, 0, 0),
(330, 4, 7, 0, 0, 0, 0),
(331, 4, 8, 0, 0, 0, 0),
(332, 4, 6, 0, 0, 0, 0),
(333, 4, 9, 0, 0, 0, 0),
(334, 4, 10, 0, 0, 0, 0),
(335, 4, 11, 0, 0, 0, 0),
(336, 4, 12, 1, 1, 1, 1),
(337, 4, 13, 1, 0, 1, 0),
(338, 4, 14, 1, 0, 1, 0),
(339, 4, 15, 0, 0, 1, 0),
(340, 4, 16, 1, 1, 1, 1),
(341, 4, 17, 1, 1, 1, 1),
(343, 4, 19, 1, 1, 1, 1),
(344, 4, 20, 1, 1, 1, 1),
(345, 4, 21, 1, 1, 1, 1),
(346, 4, 22, 1, 1, 1, 1),
(347, 4, 23, 0, 0, 0, 0),
(348, 4, 24, 0, 0, 0, 0),
(349, 4, 25, 0, 0, 0, 0),
(350, 4, 26, 0, 0, 0, 0),
(351, 4, 27, 0, 0, 0, 0),
(352, 4, 28, 0, 0, 0, 0),
(353, 4, 29, 0, 0, 0, 0),
(354, 4, 32, 0, 0, 0, 0),
(355, 4, 88, 0, 0, 0, 0),
(356, 4, 89, 0, 0, 0, 0),
(357, 4, 31, 0, 0, 0, 0),
(358, 4, 33, 0, 0, 0, 0),
(359, 4, 34, 0, 0, 0, 0),
(360, 4, 35, 0, 0, 0, 0),
(361, 4, 36, 0, 0, 0, 0),
(362, 4, 37, 0, 0, 0, 0),
(363, 4, 38, 0, 0, 0, 0),
(364, 4, 39, 0, 0, 0, 0),
(365, 4, 77, 0, 0, 0, 0),
(366, 4, 78, 0, 0, 0, 0),
(367, 4, 79, 0, 0, 0, 0),
(368, 4, 40, 0, 0, 0, 0),
(369, 4, 41, 0, 0, 0, 0),
(370, 4, 42, 0, 0, 0, 0),
(371, 4, 43, 0, 0, 0, 0),
(372, 4, 44, 0, 0, 0, 0),
(373, 4, 45, 0, 0, 0, 0),
(374, 4, 46, 0, 0, 0, 0),
(375, 4, 47, 0, 0, 0, 0),
(376, 4, 48, 0, 0, 0, 0),
(377, 4, 49, 0, 0, 0, 0),
(378, 4, 50, 0, 0, 0, 0),
(379, 4, 51, 0, 0, 0, 0),
(380, 4, 52, 0, 0, 0, 0),
(381, 4, 53, 0, 0, 0, 0),
(382, 4, 54, 0, 0, 0, 0),
(383, 4, 55, 0, 0, 1, 0),
(384, 4, 56, 0, 0, 0, 0),
(385, 4, 57, 0, 0, 0, 0),
(386, 4, 58, 1, 0, 1, 0),
(387, 4, 59, 0, 0, 0, 0),
(388, 4, 60, 0, 0, 0, 0),
(389, 4, 61, 0, 0, 0, 0),
(390, 4, 62, 0, 0, 0, 0),
(391, 4, 80, 0, 0, 0, 0),
(392, 4, 69, 1, 1, 1, 1),
(393, 4, 70, 1, 1, 1, 1),
(394, 4, 71, 1, 1, 1, 1),
(395, 4, 72, 1, 1, 1, 1),
(396, 4, 73, 1, 0, 0, 0),
(397, 4, 74, 1, 1, 1, 1),
(398, 4, 75, 0, 0, 1, 0),
(399, 4, 76, 0, 0, 1, 0),
(400, 4, 63, 1, 1, 1, 1),
(401, 4, 64, 1, 1, 1, 1),
(402, 4, 65, 1, 1, 1, 1),
(403, 4, 66, 0, 0, 1, 0),
(404, 4, 67, 1, 1, 1, 1),
(405, 4, 68, 1, 1, 1, 1),
(406, 4, 81, 0, 0, 0, 0),
(407, 4, 82, 0, 0, 0, 0),
(408, 4, 83, 0, 0, 0, 0),
(409, 4, 84, 0, 0, 0, 0),
(410, 4, 85, 0, 0, 0, 0),
(411, 4, 86, 0, 0, 0, 0),
(412, 4, 87, 0, 0, 0, 0),
(413, 4, 90, 0, 0, 0, 0),
(414, 4, 103, 0, 0, 0, 0),
(415, 5, 91, 0, 0, 0, 0),
(416, 5, 92, 0, 0, 0, 0),
(417, 5, 93, 0, 0, 1, 0),
(418, 5, 94, 0, 0, 1, 0),
(419, 5, 95, 0, 0, 0, 0),
(420, 5, 96, 0, 0, 0, 0),
(421, 5, 97, 0, 0, 0, 0),
(422, 5, 98, 0, 0, 0, 0),
(423, 5, 99, 0, 0, 0, 0),
(424, 5, 100, 0, 0, 0, 0),
(425, 5, 101, 0, 0, 0, 0),
(426, 5, 102, 0, 0, 0, 0),
(427, 5, 1, 0, 0, 1, 0),
(428, 5, 2, 0, 0, 0, 0),
(429, 5, 3, 0, 0, 0, 0),
(430, 5, 4, 0, 0, 0, 0),
(431, 5, 5, 0, 0, 0, 0),
(432, 5, 30, 0, 0, 0, 0),
(433, 5, 7, 0, 0, 0, 0),
(434, 5, 8, 0, 0, 0, 0),
(435, 5, 6, 0, 0, 1, 0),
(436, 5, 9, 0, 0, 0, 0),
(437, 5, 10, 0, 0, 0, 0),
(438, 5, 11, 0, 0, 0, 0),
(439, 5, 12, 0, 0, 0, 0),
(440, 5, 13, 0, 0, 0, 0),
(441, 5, 14, 0, 0, 0, 0),
(442, 5, 15, 0, 0, 0, 0),
(443, 5, 16, 0, 0, 0, 0),
(444, 5, 17, 0, 0, 0, 0),
(446, 5, 19, 0, 0, 0, 0),
(447, 5, 20, 1, 1, 1, 1),
(448, 5, 21, 0, 0, 0, 0),
(449, 5, 22, 0, 0, 0, 0),
(450, 5, 23, 0, 0, 0, 0),
(451, 5, 24, 0, 0, 0, 0),
(452, 5, 25, 0, 0, 0, 0),
(453, 5, 26, 0, 0, 0, 0),
(454, 5, 27, 0, 0, 0, 0),
(455, 5, 28, 0, 0, 0, 0),
(456, 5, 29, 0, 0, 0, 0),
(457, 5, 32, 0, 0, 0, 0),
(458, 5, 88, 0, 0, 0, 0),
(459, 5, 89, 0, 0, 0, 0),
(460, 5, 31, 0, 0, 0, 0),
(461, 5, 33, 0, 0, 0, 0),
(462, 5, 34, 0, 0, 0, 0),
(463, 5, 35, 0, 0, 0, 0),
(464, 5, 36, 0, 0, 0, 0),
(465, 5, 37, 0, 0, 0, 0),
(466, 5, 38, 0, 0, 0, 0),
(467, 5, 39, 0, 0, 0, 0),
(468, 5, 77, 0, 0, 0, 0),
(469, 5, 78, 0, 0, 0, 0),
(470, 5, 79, 0, 0, 0, 0),
(471, 5, 40, 0, 0, 0, 0),
(472, 5, 41, 0, 0, 0, 0),
(473, 5, 42, 0, 0, 0, 0),
(474, 5, 43, 0, 0, 0, 0),
(475, 5, 44, 0, 0, 0, 0),
(476, 5, 45, 0, 0, 0, 0),
(477, 5, 46, 0, 0, 0, 0),
(478, 5, 47, 0, 0, 0, 0),
(479, 5, 48, 0, 0, 0, 0),
(480, 5, 49, 0, 0, 0, 0),
(481, 5, 50, 0, 0, 0, 0),
(482, 5, 51, 0, 0, 0, 0),
(483, 5, 52, 0, 0, 0, 0),
(484, 5, 53, 0, 0, 0, 0),
(485, 5, 54, 0, 0, 0, 0),
(486, 5, 55, 1, 1, 1, 1),
(487, 5, 56, 1, 1, 1, 1),
(488, 5, 57, 1, 0, 1, 1),
(489, 5, 58, 1, 0, 1, 1),
(490, 5, 59, 0, 0, 0, 0),
(491, 5, 60, 0, 0, 0, 0),
(492, 5, 61, 0, 0, 0, 0),
(493, 5, 62, 0, 0, 0, 0),
(494, 5, 80, 0, 0, 0, 0),
(495, 5, 69, 0, 0, 0, 0),
(496, 5, 70, 0, 0, 0, 0),
(497, 5, 71, 0, 0, 0, 0),
(498, 5, 72, 0, 0, 0, 0),
(499, 5, 73, 0, 0, 0, 0),
(500, 5, 74, 0, 0, 0, 0),
(501, 5, 75, 0, 0, 0, 0),
(502, 5, 76, 0, 0, 0, 0),
(503, 5, 63, 0, 0, 0, 0),
(504, 5, 64, 0, 0, 0, 0),
(505, 5, 65, 0, 0, 0, 0),
(506, 5, 66, 0, 0, 0, 0),
(507, 5, 67, 0, 0, 0, 0),
(508, 5, 68, 0, 0, 0, 0),
(509, 5, 81, 0, 0, 0, 0),
(510, 5, 82, 0, 0, 0, 0),
(511, 5, 83, 0, 0, 0, 0),
(512, 5, 84, 0, 0, 0, 0),
(513, 5, 85, 0, 0, 0, 0),
(514, 5, 86, 0, 0, 0, 0),
(515, 5, 87, 0, 0, 0, 0),
(516, 5, 90, 0, 0, 0, 0),
(517, 5, 103, 0, 0, 0, 0),
(518, 104, 104, 1, 1, 1, 1),
(519, 2, 104, 0, 0, 1, 0),
(520, 4, 104, 0, 0, 1, 0),
(521, 2, 18, 0, 0, 0, 0),
(522, 2, 105, 0, 1, 1, 0),
(523, 2, 106, 1, 1, 1, 1),
(524, 2, 107, 0, 0, 0, 0),
(525, 2, 109, 1, 1, 1, 1),
(526, 2, 108, 0, 1, 1, 0),
(527, 3, 18, 0, 0, 0, 0),
(528, 3, 107, 0, 0, 0, 0),
(529, 3, 109, 1, 1, 1, 1),
(530, 3, 104, 0, 0, 0, 0),
(531, 3, 105, 0, 0, 0, 0),
(532, 3, 106, 0, 0, 0, 0),
(533, 3, 108, 0, 0, 0, 0),
(534, 2, 110, 1, 1, 1, 1),
(535, 2, 111, 0, 0, 1, 0),
(536, 2, 112, 0, 0, 1, 0),
(537, 2, 113, 1, 1, 1, 1),
(538, 2, 114, 0, 0, 1, 0),
(539, 2, 115, 0, 0, 1, 0),
(540, 2, 116, 1, 1, 1, 1),
(541, 2, 117, 0, 0, 1, 0),
(542, 3, 110, 1, 1, 1, 1),
(543, 3, 111, 0, 0, 1, 0),
(544, 3, 112, 0, 0, 0, 0),
(545, 3, 113, 1, 1, 1, 1),
(546, 3, 114, 0, 0, 1, 0),
(547, 3, 115, 0, 0, 0, 0),
(548, 3, 116, 1, 1, 1, 1),
(549, 3, 117, 0, 0, 1, 0),
(550, 2, 127, 1, 0, 1, 1),
(551, 2, 118, 1, 0, 1, 0),
(552, 2, 119, 1, 1, 1, 1),
(553, 2, 120, 1, 0, 1, 0),
(554, 2, 121, 1, 1, 1, 1),
(555, 2, 122, 1, 1, 1, 1),
(556, 2, 123, 1, 1, 1, 1),
(557, 2, 124, 1, 1, 1, 1),
(558, 2, 125, 1, 1, 1, 1),
(559, 2, 126, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `register_no` varchar(100) NOT NULL,
  `admission_date` varchar(100) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `birthday` varchar(100) DEFAULT NULL,
  `religion` varchar(100) NOT NULL,
  `caste` varchar(100) NOT NULL,
  `blood_group` varchar(100) NOT NULL,
  `mother_tongue` varchar(100) DEFAULT NULL,
  `current_address` text DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `mobileno` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `email` varchar(100) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL DEFAULT 0,
  `vehicle_id` int(11) NOT NULL DEFAULT 0,
  `hostel_id` int(11) NOT NULL DEFAULT 0,
  `room_id` int(11) NOT NULL DEFAULT 0,
  `previous_details` text NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `register_no`, `admission_date`, `first_name`, `last_name`, `gender`, `birthday`, `religion`, `caste`, `blood_group`, `mother_tongue`, `current_address`, `permanent_address`, `city`, `state`, `mobileno`, `category_id`, `email`, `parent_id`, `route_id`, `vehicle_id`, `hostel_id`, `room_id`, `previous_details`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'RSM-00001', '2020-11-23', 'Umar', 'Faiz', 'male', '2020-01-28', '', '', 'O-', '', 'testing', '', 'Lahore', 'Punjab', '03054348474', 1, 'umarfaiz95@gmail.com', 1, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2020-11-23 21:40:27', '2020-11-23 21:40:27'),
(2, 'RSM-00002', '2020-11-28', 'Test', 'One', 'male', '1992-08-31', '', '', 'O+', '', '', '', '', '', '923334455666', 1, '', 2, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2020-11-28 17:19:25', '2020-11-28 17:19:25'),
(3, '3a0a9c5', '1969-12-31', 'test', 'test', 'Male', '1969-12-31', '', '', 'A', '', '', '', 'lahore', 'Punjab', '6544654', 0, 'std@test.com', 1, 0, 0, 0, 0, '', 'defualt.png', '2020-11-29 12:25:17', '2020-11-29 12:25:17'),
(4, '6919fb3', '1969-12-31', 'test', 'test', 'Male', '1969-12-31', '', '', 'A', '', '', '', 'lahore', 'Punjab', '6544654', 0, 'std22@test.com', 1, 0, 0, 0, 0, '', 'defualt.png', '2020-11-29 12:27:31', '2020-11-29 12:27:31'),
(5, '0f9211a', '1969-12-31', 'test 2', 'test 2', 'Male', '1969-12-31', '', '', 'A', '', '', '', 'lahore', 'Punjab', '6544654', 0, 'std33@test.com', 1, 0, 0, 0, 0, '', 'defualt.png', '2020-11-29 12:27:31', '2020-11-29 12:27:31'),
(6, '31a49db', '1969-12-31', 'Qamar', 'javed', 'Male', '2002-01-03', 'Islam', 'Mughal', 'A+', 'Urdu', 'Sabza zar lahore', 'Sabza zar lahore', 'Lahore', 'Punjab', '3131472583', 1, 'xyz@xyx.com', 1, 0, 0, 0, 0, '', 'defualt.png', '2021-03-01 22:48:49', '2021-03-01 22:48:49'),
(7, 'a3dfcbd', '1969-12-31', 'Ahmed', 'Salman', 'Male', '2001-06-05', 'Islam', 'Butt', 'O+', 'Urdu', 'Town Ship', 'Town Ship', 'Lahore', 'Punjab', '3021452365', 1, 'omer@123.com', 1, 0, 0, 0, 0, '', 'defualt.png', '2021-03-01 22:48:49', '2021-03-01 22:48:49'),
(8, 'c9ff4dc', '1969-12-31', 'Fakhar', 'Alam', 'Male', '2001-07-05', 'Islam', 'Shiekh', 'AB+', 'Urdu', 'Green Town', 'Green Town', 'Lahore', 'Punjab', '3456987150', 1, 'riaz@asd.cpom', 1, 0, 0, 0, 0, '', 'defualt.png', '2021-03-01 22:48:49', '2021-03-01 22:48:49'),
(9, 'ca40857', '1969-12-31', 'Jimmy', 'Don', 'Male', '2001-08-05', 'Christian', 'Bhatti', 'A-', 'Punjabi', 'DHA', 'DHA', 'Lahore', 'Punjab', '3145142653', 1, 'Sameena@asd.com', 1, 0, 0, 0, 0, '', 'defualt.png', '2021-03-01 22:48:49', '2021-03-01 22:48:49'),
(10, 'ae41786', '1969-12-31', 'Sehar', 'Khan', 'Female', '2006-09-09', 'Christian', 'Khan', 'O-', 'Urdu', 'DHA', 'DHA', 'Lahore', 'Punjab', '3156245250', 1, 'JAJJ@kjh.com', 1, 0, 0, 0, 0, '', 'defualt.png', '2021-03-01 22:48:49', '2021-03-01 22:48:49'),
(11, 'RSM-00011', '2021-03-19', 'dasdsa', 'dadssadds', 'male', '1970-01-01', '', '', '', '', '', '', '', '', '1231231231', 1, 'dssad@sad.ca', 1, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2021-03-18 19:27:46', '2021-03-18 19:27:46');

-- --------------------------------------------------------

--
-- Table structure for table `student_attendance`
--

CREATE TABLE `student_attendance` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(4) DEFAULT NULL COMMENT 'P=Present, A=Absent, H=Holiday, L=Late',
  `remark` text DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_attendance`
--

INSERT INTO `student_attendance` (`id`, `student_id`, `date`, `status`, `remark`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-02-28', 'P', '', 1, '2021-02-28 21:32:00', NULL),
(2, 2, '2021-02-28', 'A', '', 1, '2021-02-28 21:32:00', NULL),
(3, 3, '2021-02-28', 'L', '', 1, '2021-02-28 21:32:00', NULL),
(4, 4, '2021-02-28', 'P', '', 1, '2021-02-28 21:32:00', NULL),
(5, 5, '2021-02-28', 'H', '', 1, '2021-02-28 21:32:00', NULL),
(6, 1, '2021-02-27', 'L', '', 1, '2021-02-28 21:34:46', NULL),
(7, 2, '2021-02-27', 'H', '', 1, '2021-02-28 21:34:46', NULL),
(8, 3, '2021-02-27', 'A', '', 1, '2021-02-28 21:34:46', NULL),
(9, 4, '2021-02-27', 'P', '', 1, '2021-02-28 21:34:46', NULL),
(10, 5, '2021-02-27', 'P', '', 1, '2021-02-28 21:34:46', NULL),
(11, 1, '2021-02-26', 'P', '', 1, '2021-02-28 21:35:13', NULL),
(12, 2, '2021-02-26', 'P', '', 1, '2021-02-28 21:35:13', NULL),
(13, 3, '2021-02-26', 'P', '', 1, '2021-02-28 21:35:13', NULL),
(14, 4, '2021-02-26', 'L', '', 1, '2021-02-28 21:35:13', NULL),
(15, 5, '2021-02-26', 'A', '', 1, '2021-02-28 21:35:13', NULL),
(16, 6, '2021-03-01', 'P', '', 1, '2021-03-01 23:34:59', NULL),
(17, 7, '2021-03-01', 'A', '', 1, '2021-03-01 23:34:59', NULL),
(18, 8, '2021-03-01', 'L', '', 1, '2021-03-01 23:34:59', NULL),
(19, 9, '2021-03-01', 'P', '', 1, '2021-03-01 23:34:59', NULL),
(20, 10, '2021-03-01', 'P', '', 1, '2021-03-01 23:34:59', NULL),
(21, 6, '2021-02-27', 'P', '', 1, '2021-03-01 23:35:22', NULL),
(22, 7, '2021-02-27', 'P', '', 1, '2021-03-01 23:35:22', NULL),
(23, 8, '2021-02-27', 'P', '', 1, '2021-03-01 23:35:22', NULL),
(24, 9, '2021-02-27', 'P', '', 1, '2021-03-01 23:35:22', NULL),
(25, 10, '2021-02-27', 'P', '', 1, '2021-03-01 23:35:22', NULL),
(26, 6, '2021-02-26', 'P', '', 1, '2021-03-01 23:35:57', NULL),
(27, 7, '2021-02-26', 'P', '', 1, '2021-03-01 23:35:57', NULL),
(28, 8, '2021-02-26', 'P', '', 1, '2021-03-01 23:35:57', NULL),
(29, 9, '2021-02-26', 'P', '', 1, '2021-03-01 23:35:57', NULL),
(30, 10, '2021-02-26', 'P', '', 1, '2021-03-01 23:35:57', NULL),
(31, 6, '2021-02-28', 'H', '', 1, '2021-03-01 23:36:27', NULL),
(32, 7, '2021-02-28', 'H', '', 1, '2021-03-01 23:36:27', NULL),
(33, 8, '2021-02-28', 'H', '', 1, '2021-03-01 23:36:27', NULL),
(34, 9, '2021-02-28', 'H', '', 1, '2021-03-01 23:36:27', NULL),
(35, 10, '2021-02-28', 'H', '', 1, '2021-03-01 23:36:27', NULL),
(36, 6, '2021-02-24', 'L', '', 1, '2021-03-01 23:36:51', NULL),
(37, 7, '2021-02-24', 'L', '', 1, '2021-03-01 23:36:51', NULL),
(38, 8, '2021-02-24', 'P', '', 1, '2021-03-01 23:36:51', NULL),
(39, 9, '2021-02-24', 'P', '', 1, '2021-03-01 23:36:51', NULL),
(40, 10, '2021-02-24', 'A', '', 1, '2021-03-01 23:36:51', NULL),
(41, 6, '2021-02-23', 'P', '', 1, '2021-03-01 23:37:21', NULL),
(42, 7, '2021-02-23', 'L', '', 1, '2021-03-01 23:37:21', NULL),
(43, 8, '2021-02-23', 'A', '', 1, '2021-03-01 23:37:21', NULL),
(44, 9, '2021-02-23', 'P', '', 1, '2021-03-01 23:37:21', NULL),
(45, 10, '2021-02-23', 'L', '', 1, '2021-03-01 23:37:21', NULL),
(46, 6, '2021-02-22', 'P', '', 1, '2021-03-01 23:37:45', NULL),
(47, 7, '2021-02-22', 'P', '', 1, '2021-03-01 23:37:45', NULL),
(48, 8, '2021-02-22', 'P', '', 1, '2021-03-01 23:37:45', NULL),
(49, 9, '2021-02-22', 'P', '', 1, '2021-03-01 23:37:45', NULL),
(50, 10, '2021-02-22', 'P', '', 1, '2021-03-01 23:37:45', NULL),
(51, 6, '2021-02-25', 'A', '', 1, '2021-03-01 23:39:46', NULL),
(52, 7, '2021-02-25', 'L', '', 1, '2021-03-01 23:39:46', NULL),
(53, 8, '2021-02-25', 'A', '', 1, '2021-03-01 23:39:46', NULL),
(54, 9, '2021-02-25', 'A', '', 1, '2021-03-01 23:39:46', NULL),
(55, 10, '2021-02-25', 'P', '', 1, '2021-03-01 23:39:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_category`
--

CREATE TABLE `student_category` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_category`
--

INSERT INTO `student_category` (`id`, `branch_id`, `name`) VALUES
(1, 1, 'First'),
(2, 1, 'Sec');

-- --------------------------------------------------------

--
-- Table structure for table `student_documents`
--

CREATE TABLE `student_documents` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `remarks` text NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `enc_name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject_code` varchar(200) NOT NULL,
  `subject_type` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `subject_author` varchar(255) NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `name`, `subject_code`, `subject_type`, `subject_author`, `branch_id`) VALUES
(1, 'English', '001', 'Theory', '', 1),
(2, 'Math', '004', 'Theory', '', 1),
(3, 'Urdu', '005', 'Theory', '', 1),
(4, 'Arabic', '006', 'Optional', '', 1),
(5, 'Electrical work shop', '007', 'Practical', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subject_assign`
--

CREATE TABLE `subject_assign` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` longtext NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject_assign`
--

INSERT INTO `subject_assign` (`id`, `class_id`, `section_id`, `subject_id`, `teacher_id`, `branch_id`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1', 0, 1, 3, '2021-02-28 21:44:49', NULL),
(2, 4, 1, '1', 3, 1, 3, '2021-03-01 22:59:47', NULL),
(3, 4, 1, '2', 2, 1, 3, '2021-03-01 22:59:47', NULL),
(4, 4, 1, '3', 3, 1, 3, '2021-03-01 22:59:47', NULL),
(5, 4, 1, '4', 2, 1, 3, '2021-03-01 22:59:47', NULL),
(6, 4, 1, '5', 3, 1, 3, '2021-03-01 22:59:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_allocation`
--

CREATE TABLE `teacher_allocation` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_note`
--

CREATE TABLE `teacher_note` (
  `id` int(11) NOT NULL,
  `title` longtext NOT NULL,
  `description` longtext NOT NULL,
  `file_name` longtext NOT NULL,
  `enc_name` longtext NOT NULL,
  `type_id` int(11) NOT NULL,
  `class_id` longtext NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `theme_settings`
--

CREATE TABLE `theme_settings` (
  `id` int(11) NOT NULL,
  `border_mode` varchar(200) NOT NULL,
  `dark_skin` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `theme_settings`
--

INSERT INTO `theme_settings` (`id`, `border_mode`, `dark_skin`, `created_at`, `updated_at`) VALUES
(1, 'false', 'false', '2018-10-23 16:59:38', '2020-05-10 14:08:47');

-- --------------------------------------------------------

--
-- Table structure for table `timetable_class`
--

CREATE TABLE `timetable_class` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `break` varchar(11) DEFAULT 'false',
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `class_room` varchar(100) DEFAULT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `day` varchar(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `timetable_class`
--

INSERT INTO `timetable_class` (`id`, `class_id`, `section_id`, `break`, `subject_id`, `teacher_id`, `class_room`, `time_start`, `time_end`, `day`, `session_id`, `branch_id`) VALUES
(1, 4, 1, '0', 1, 2, '1', '08:15:00', '09:10:00', 'monday', 3, 1),
(2, 4, 1, '0', 4, 3, '1', '09:15:00', '10:10:00', 'monday', 3, 1),
(3, 4, 1, '0', 2, 3, '1', '10:15:00', '11:10:00', 'monday', 3, 1),
(4, 4, 1, '0', 5, 2, '1', '11:15:00', '12:10:00', 'monday', 3, 1),
(5, 4, 1, '1', 0, 0, '', '12:10:00', '13:00:00', 'monday', 3, 1),
(6, 4, 1, '0', 3, 2, '2', '13:00:00', '13:45:00', 'monday', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `timetable_exam`
--

CREATE TABLE `timetable_exam` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `time_start` varchar(20) NOT NULL,
  `time_end` varchar(20) NOT NULL,
  `mark_distribution` text NOT NULL,
  `hall_id` int(11) NOT NULL,
  `exam_date` date NOT NULL,
  `branch_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `timetable_exam`
--

INSERT INTO `timetable_exam` (`id`, `exam_id`, `class_id`, `section_id`, `subject_id`, `time_start`, `time_end`, `mark_distribution`, `hall_id`, `exam_date`, `branch_id`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 1, 1, '8:20 AM', '11:30 AM', '{\"1\":{\"full_mark\":\"100\",\"pass_mark\":\"40\"}}', 1, '2021-03-03', 1, 3, '2021-03-01 23:22:33', NULL),
(2, 1, 4, 1, 2, '8:20 AM', '11:30 AM', '{\"1\":{\"full_mark\":\"100\",\"pass_mark\":\"33\"}}', 1, '2021-03-04', 1, 3, '2021-03-01 23:22:33', NULL),
(3, 1, 4, 1, 3, '8:20 AM', '11:30 AM', '{\"1\":{\"full_mark\":\"100\",\"pass_mark\":\"40\"}}', 1, '2021-03-05', 1, 3, '2021-03-01 23:22:33', NULL),
(4, 1, 4, 1, 4, '8:20 AM', '11:30 AM', '{\"1\":{\"full_mark\":\"50\",\"pass_mark\":\"20\"}}', 1, '2021-03-06', 1, 3, '2021-03-01 23:22:33', NULL),
(5, 1, 4, 1, 5, '8:20 AM', '11:30 AM', '{\"1\":{\"full_mark\":\"75\",\"pass_mark\":\"35\"}}', 1, '2021-03-08', 1, 3, '2021-03-01 23:22:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `account_id` varchar(20) NOT NULL,
  `voucher_head_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `category` varchar(20) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `dr` decimal(18,2) NOT NULL DEFAULT 0.00,
  `cr` decimal(18,2) NOT NULL DEFAULT 0.00,
  `bal` decimal(18,2) NOT NULL DEFAULT 0.00,
  `date` date NOT NULL,
  `pay_via` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `attachments` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `system` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transactions_links`
--

CREATE TABLE `transactions_links` (
  `id` int(11) NOT NULL,
  `status` tinyint(3) DEFAULT NULL,
  `deposit` tinyint(3) DEFAULT NULL,
  `expense` tinyint(3) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transport_assign`
--

CREATE TABLE `transport_assign` (
  `id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `stoppage_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transport_route`
--

CREATE TABLE `transport_route` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `start_place` longtext NOT NULL,
  `remarks` longtext NOT NULL,
  `stop_place` longtext NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transport_stoppage`
--

CREATE TABLE `transport_stoppage` (
  `id` int(11) NOT NULL,
  `stop_position` varchar(255) NOT NULL,
  `stop_time` time NOT NULL,
  `route_fare` decimal(18,2) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transport_vehicle`
--

CREATE TABLE `transport_vehicle` (
  `id` int(11) NOT NULL,
  `vehicle_no` longtext NOT NULL,
  `capacity` longtext NOT NULL,
  `insurance_renewal` longtext NOT NULL,
  `driver_name` longtext NOT NULL,
  `driver_phone` longtext NOT NULL,
  `driver_license` longtext NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_head`
--

CREATE TABLE `voucher_head` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `system` tinyint(1) DEFAULT 0,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advance_salary`
--
ALTER TABLE `advance_salary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachments_type`
--
ALTER TABLE `attachments_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `award`
--
ALTER TABLE `award`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_issues`
--
ALTER TABLE `book_issues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bulk_msg_category`
--
ALTER TABLE `bulk_msg_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bulk_sms_email`
--
ALTER TABLE `bulk_sms_email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `card_templete`
--
ALTER TABLE `card_templete`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificates_templete`
--
ALTER TABLE `certificates_templete`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_field`
--
ALTER TABLE `custom_field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields_values`
--
ALTER TABLE `custom_fields_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relid` (`relid`),
  ADD KEY `fieldid` (`field_id`);

--
-- Indexes for table `email_config`
--
ALTER TABLE `email_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates_details`
--
ALTER TABLE `email_templates_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enroll`
--
ALTER TABLE `enroll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_types`
--
ALTER TABLE `event_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_attendance`
--
ALTER TABLE `exam_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_hall`
--
ALTER TABLE `exam_hall`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_mark_distribution`
--
ALTER TABLE `exam_mark_distribution`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_term`
--
ALTER TABLE `exam_term`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees_reminder`
--
ALTER TABLE `fees_reminder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees_type`
--
ALTER TABLE `fees_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_allocation`
--
ALTER TABLE `fee_allocation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_fine`
--
ALTER TABLE `fee_fine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_groups`
--
ALTER TABLE `fee_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_groups_details`
--
ALTER TABLE `fee_groups_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_payment_history`
--
ALTER TABLE `fee_payment_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_about`
--
ALTER TABLE `front_cms_about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_admission`
--
ALTER TABLE `front_cms_admission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_contact`
--
ALTER TABLE `front_cms_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_events`
--
ALTER TABLE `front_cms_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_faq`
--
ALTER TABLE `front_cms_faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_faq_list`
--
ALTER TABLE `front_cms_faq_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_home`
--
ALTER TABLE `front_cms_home`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_home_seo`
--
ALTER TABLE `front_cms_home_seo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_menu`
--
ALTER TABLE `front_cms_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_pages`
--
ALTER TABLE `front_cms_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_services`
--
ALTER TABLE `front_cms_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_services_list`
--
ALTER TABLE `front_cms_services_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_setting`
--
ALTER TABLE `front_cms_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_teachers`
--
ALTER TABLE `front_cms_teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_testimonial`
--
ALTER TABLE `front_cms_testimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `global_settings`
--
ALTER TABLE `global_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hall_allocation`
--
ALTER TABLE `hall_allocation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homework`
--
ALTER TABLE `homework`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homework_evaluation`
--
ALTER TABLE `homework_evaluation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hostel`
--
ALTER TABLE `hostel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hostel_category`
--
ALTER TABLE `hostel_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hostel_room`
--
ALTER TABLE `hostel_room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inquiry`
--
ALTER TABLE `inquiry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language_list`
--
ALTER TABLE `language_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_application`
--
ALTER TABLE `leave_application`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_category`
--
ALTER TABLE `leave_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_class`
--
ALTER TABLE `live_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_class_config`
--
ALTER TABLE `live_class_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_credential`
--
ALTER TABLE `login_credential`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mark`
--
ALTER TABLE `mark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_reply`
--
ALTER TABLE `message_reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_admission`
--
ALTER TABLE `online_admission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_config`
--
ALTER TABLE `payment_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_salary_stipend`
--
ALTER TABLE `payment_salary_stipend`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_types`
--
ALTER TABLE `payment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payslip`
--
ALTER TABLE `payslip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payslip_details`
--
ALTER TABLE `payslip_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_modules`
--
ALTER TABLE `permission_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `rm_sessions`
--
ALTER TABLE `rm_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_template`
--
ALTER TABLE `salary_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_template_details`
--
ALTER TABLE `salary_template_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schoolyear`
--
ALTER TABLE `schoolyear`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections_allocation`
--
ALTER TABLE `sections_allocation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_api`
--
ALTER TABLE `sms_api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_credential`
--
ALTER TABLE `sms_credential`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_template`
--
ALTER TABLE `sms_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_template_details`
--
ALTER TABLE `sms_template_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_bank_account`
--
ALTER TABLE `staff_bank_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_department`
--
ALTER TABLE `staff_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_designation`
--
ALTER TABLE `staff_designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_documents`
--
ALTER TABLE `staff_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_privileges`
--
ALTER TABLE `staff_privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_attendance`
--
ALTER TABLE `student_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_category`
--
ALTER TABLE `student_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_documents`
--
ALTER TABLE `student_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject_assign`
--
ALTER TABLE `subject_assign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_allocation`
--
ALTER TABLE `teacher_allocation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_note`
--
ALTER TABLE `teacher_note`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theme_settings`
--
ALTER TABLE `theme_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timetable_class`
--
ALTER TABLE `timetable_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timetable_exam`
--
ALTER TABLE `timetable_exam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions_links`
--
ALTER TABLE `transactions_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transport_assign`
--
ALTER TABLE `transport_assign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transport_route`
--
ALTER TABLE `transport_route`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transport_stoppage`
--
ALTER TABLE `transport_stoppage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transport_vehicle`
--
ALTER TABLE `transport_vehicle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voucher_head`
--
ALTER TABLE `voucher_head`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `advance_salary`
--
ALTER TABLE `advance_salary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attachments_type`
--
ALTER TABLE `attachments_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `award`
--
ALTER TABLE `award`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_category`
--
ALTER TABLE `book_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_issues`
--
ALTER TABLE `book_issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bulk_msg_category`
--
ALTER TABLE `bulk_msg_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bulk_sms_email`
--
ALTER TABLE `bulk_sms_email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `card_templete`
--
ALTER TABLE `card_templete`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `certificates_templete`
--
ALTER TABLE `certificates_templete`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `custom_field`
--
ALTER TABLE `custom_field`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields_values`
--
ALTER TABLE `custom_fields_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_config`
--
ALTER TABLE `email_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `email_templates_details`
--
ALTER TABLE `email_templates_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enroll`
--
ALTER TABLE `enroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `event_types`
--
ALTER TABLE `event_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exam_attendance`
--
ALTER TABLE `exam_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_hall`
--
ALTER TABLE `exam_hall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exam_mark_distribution`
--
ALTER TABLE `exam_mark_distribution`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exam_term`
--
ALTER TABLE `exam_term`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fees_reminder`
--
ALTER TABLE `fees_reminder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fees_type`
--
ALTER TABLE `fees_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fee_allocation`
--
ALTER TABLE `fee_allocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fee_fine`
--
ALTER TABLE `fee_fine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fee_groups`
--
ALTER TABLE `fee_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fee_groups_details`
--
ALTER TABLE `fee_groups_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `fee_payment_history`
--
ALTER TABLE `fee_payment_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `front_cms_about`
--
ALTER TABLE `front_cms_about`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_admission`
--
ALTER TABLE `front_cms_admission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_contact`
--
ALTER TABLE `front_cms_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_events`
--
ALTER TABLE `front_cms_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_faq`
--
ALTER TABLE `front_cms_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_faq_list`
--
ALTER TABLE `front_cms_faq_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `front_cms_home`
--
ALTER TABLE `front_cms_home`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `front_cms_home_seo`
--
ALTER TABLE `front_cms_home_seo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_menu`
--
ALTER TABLE `front_cms_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `front_cms_pages`
--
ALTER TABLE `front_cms_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_services`
--
ALTER TABLE `front_cms_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_services_list`
--
ALTER TABLE `front_cms_services_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `front_cms_setting`
--
ALTER TABLE `front_cms_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_teachers`
--
ALTER TABLE `front_cms_teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_testimonial`
--
ALTER TABLE `front_cms_testimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `global_settings`
--
ALTER TABLE `global_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hall_allocation`
--
ALTER TABLE `hall_allocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `homework`
--
ALTER TABLE `homework`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `homework_evaluation`
--
ALTER TABLE `homework_evaluation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hostel`
--
ALTER TABLE `hostel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hostel_category`
--
ALTER TABLE `hostel_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hostel_room`
--
ALTER TABLE `hostel_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inquiry`
--
ALTER TABLE `inquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1138;

--
-- AUTO_INCREMENT for table `language_list`
--
ALTER TABLE `language_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `leave_application`
--
ALTER TABLE `leave_application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `leave_category`
--
ALTER TABLE `leave_category`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `live_class`
--
ALTER TABLE `live_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live_class_config`
--
ALTER TABLE `live_class_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_credential`
--
ALTER TABLE `login_credential`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `mark`
--
ALTER TABLE `mark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message_reply`
--
ALTER TABLE `message_reply`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_admission`
--
ALTER TABLE `online_admission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parent`
--
ALTER TABLE `parent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_config`
--
ALTER TABLE `payment_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_salary_stipend`
--
ALTER TABLE `payment_salary_stipend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_types`
--
ALTER TABLE `payment_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payslip`
--
ALTER TABLE `payslip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payslip_details`
--
ALTER TABLE `payslip_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `permission_modules`
--
ALTER TABLE `permission_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `salary_template`
--
ALTER TABLE `salary_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_template_details`
--
ALTER TABLE `salary_template_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schoolyear`
--
ALTER TABLE `schoolyear`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sections_allocation`
--
ALTER TABLE `sections_allocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sms_api`
--
ALTER TABLE `sms_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sms_credential`
--
ALTER TABLE `sms_credential`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_template`
--
ALTER TABLE `sms_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sms_template_details`
--
ALTER TABLE `sms_template_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `staff_bank_account`
--
ALTER TABLE `staff_bank_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_department`
--
ALTER TABLE `staff_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staff_designation`
--
ALTER TABLE `staff_designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff_documents`
--
ALTER TABLE `staff_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_privileges`
--
ALTER TABLE `staff_privileges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=560;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `student_attendance`
--
ALTER TABLE `student_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `student_category`
--
ALTER TABLE `student_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student_documents`
--
ALTER TABLE `student_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subject_assign`
--
ALTER TABLE `subject_assign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `teacher_allocation`
--
ALTER TABLE `teacher_allocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher_note`
--
ALTER TABLE `teacher_note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theme_settings`
--
ALTER TABLE `theme_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `timetable_class`
--
ALTER TABLE `timetable_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `timetable_exam`
--
ALTER TABLE `timetable_exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions_links`
--
ALTER TABLE `transactions_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_assign`
--
ALTER TABLE `transport_assign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_route`
--
ALTER TABLE `transport_route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_stoppage`
--
ALTER TABLE `transport_stoppage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_vehicle`
--
ALTER TABLE `transport_vehicle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voucher_head`
--
ALTER TABLE `voucher_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inquiry`
--
ALTER TABLE `inquiry`
  ADD CONSTRAINT `inquiry_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

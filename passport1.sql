-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2021 at 03:06 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `passport1`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `name1` varchar(100) NOT NULL,
  `number1` varchar(15) NOT NULL,
  `number_alt` varchar(15) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `email_alt` varchar(100) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `first_contact_date` datetime DEFAULT NULL,
  `source1` varchar(20) DEFAULT NULL,
  `referred_by` varchar(30) DEFAULT NULL,
  `process_type` varchar(20) DEFAULT NULL,
  `first_registration_of` varchar(30) DEFAULT NULL,
  `lead_type` varchar(20) DEFAULT NULL,
  `search_required` varchar(5) DEFAULT NULL,
  `assigned_to` varchar(30) DEFAULT NULL,
  `search_location` varchar(30) DEFAULT NULL,
  `search_taluka` varchar(30) DEFAULT NULL,
  `wa_group` varchar(5) DEFAULT NULL,
  `wa_group_name` varchar(30) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `name1`, `number1`, `number_alt`, `email`, `email_alt`, `location`, `first_contact_date`, `source1`, `referred_by`, `process_type`, `first_registration_of`, `lead_type`, `search_required`, `assigned_to`, `search_location`, `search_taluka`, `wa_group`, `wa_group_name`, `address`, `created_at`, `updated_at`) VALUES
(27, 'Jyoti Harijan', '9373555015', '', 'jyotiharijan07@gmail.com', 'jyotiharijan07@gmail.com', 'Mapusa', NULL, 'Facebook', NULL, 'BB 1961 Registration', NULL, 'Hot', NULL, NULL, 'Goa', NULL, 'Yes', 'Jk & Jyoti Work', 'H.No. 20 Feira Altha, Mapusa Goa', '2021-04-19 06:34:27', '2021-04-19 06:34:27'),
(28, 'Leonilda & Clemente', '7666012739', '+447459811634', 'leonildafernandes248@gmail.com', 'leonildafernandes248@gmail.com', 'Margao', NULL, 'Facebook', NULL, 'BA 1961 Registration', NULL, 'Hot', NULL, NULL, '', NULL, 'Yes', 'PCFG Leonilda & Clemente', 'Curtorim Salcete Goa', '2021-04-19 09:50:14', '2021-04-19 09:50:14'),
(36, 'sandy san', '08660225160', '54248949+94', 'devsandy12@gmail.com', 'devsandy12@gmail.com', 'India', NULL, 'Facebook', 'bh kjbni', 'BA 1961 Registration', 'hjbiui', 'Hot', 'Yes', '1', 'India', NULL, 'Yes', 'jbjbih i', 'No.23, Hessargatta road ,AGBG layout,chikkasandra bengaluru', '2021-08-09 15:24:36', '2021-08-09 15:24:36'),
(37, 'client name', 'phone number', 'alt phone numb', 'mail@gmail.com', 'altmail@gmail.com', 'Karnataka', NULL, 'Referrence', 'reffered by', 'Marriage Registratio', 'first registration of', 'Cold', 'Yes', '2', 'Goa', NULL, 'Yes', 'Marriage registration', 'No.23, Hessargatta road ,AGBG layout,chikkasandra bengaluru', '2021-08-09 15:28:07', '2021-08-09 15:28:07'),
(38, 'client name', 'phone number', 'alt phone numb', 'mail@gmail.com', 'altmail@gmail.com', 'Karnataka', NULL, 'Referrence', 'reffered by', 'Marriage Registratio', 'first registration of', 'Cold', 'Yes', '2', 'Goa', NULL, 'Yes', 'Marriage registration', 'No.23, Hessargatta road ,AGBG layout,chikkasandra bengaluru', '2021-08-09 15:31:10', '2021-08-09 15:31:10');

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `registration` text DEFAULT NULL,
  `to_register` text DEFAULT NULL,
  `document` text DEFAULT NULL,
  `document_of` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `place` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `registered_date` date DEFAULT NULL,
  `doc_available` text DEFAULT NULL,
  `doc_in_office` text DEFAULT NULL,
  `sac_date` date DEFAULT NULL,
  `a/t_date` date DEFAULT NULL,
  `translation_date` date DEFAULT NULL,
  `notary_date` date DEFAULT NULL,
  `collector_date` date DEFAULT NULL,
  `apostle_date` date DEFAULT NULL,
  `send_to_pt_date` date DEFAULT NULL,
  `doc_reached_pt` text DEFAULT NULL,
  `received_in_pt_date` date DEFAULT NULL,
  `submitted_date` date DEFAULT NULL,
  `concluded_date` date DEFAULT NULL,
  `doc_issue_date` date DEFAULT NULL,
  `reg_bill` text DEFAULT NULL,
  `submitted` text DEFAULT NULL,
  `attachment` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `billable` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`id`, `client_id`, `registration`, `to_register`, `document`, `document_of`, `name`, `place`, `date`, `registered_date`, `doc_available`, `doc_in_office`, `sac_date`, `a/t_date`, `translation_date`, `notary_date`, `collector_date`, `apostle_date`, `send_to_pt_date`, `doc_reached_pt`, `received_in_pt_date`, `submitted_date`, `concluded_date`, `doc_issue_date`, `reg_bill`, `submitted`, `attachment`, `comment`, `billable`, `created_at`, `updated_at`) VALUES
(24, 18, 'test', 'self', 'this', 'self', 'Dattaprasad', 'place here', '2021-01-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://some-name-for-bucket.s3.amazonaws.com/.gitignore', NULL, NULL, '2021-02-17 11:14:27', '2021-02-17 11:14:27'),
(25, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://some-name-for-bucket.s3.amazonaws.com/jyoti bank details.pdf', NULL, NULL, '2021-04-19 06:38:13', '2021-04-19 06:38:13'),
(26, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://some-name-for-bucket.s3.amazonaws.com/PCFG - Terms & Conditions.pdf', NULL, NULL, '2021-04-19 09:19:28', '2021-04-19 09:19:28'),
(27, 27, 'Birth Before 1961', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://some-name-for-bucket.s3.amazonaws.com/PCFG - Terms & Conditions.pdf', NULL, NULL, '2021-04-19 09:20:02', '2021-04-19 09:20:02'),
(28, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://some-name-for-bucket.s3.amazonaws.com/Birth cert of Leonilda fraiza fernandes.pdf', NULL, NULL, '2021-04-19 10:24:51', '2021-04-19 10:24:51'),
(29, 28, NULL, NULL, NULL, NULL, 'Leonilda Fraiza Fernandes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://some-name-for-bucket.s3.amazonaws.com/Adhar card Leonilda fraiza fernandes.pdf', NULL, NULL, '2021-04-19 10:27:57', '2021-04-19 10:27:57'),
(30, 28, NULL, NULL, NULL, NULL, 'Leonilda Fraiza Fernandes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://some-name-for-bucket.s3.amazonaws.com/Birth cert of Leonilda fraiza fernandes.pdf', NULL, NULL, '2021-04-19 10:29:09', '2021-04-19 10:29:09'),
(31, 28, NULL, NULL, 'Handoff Shhet', NULL, 'Leonilda Fraiza Fernandes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://some-name-for-bucket.s3.amazonaws.com/handoff sheet 7 apr 2021.pdf', NULL, NULL, '2021-04-19 10:31:25', '2021-04-19 10:31:25'),
(32, 28, NULL, NULL, 'casamento', NULL, 'Leonilda Fraiza Fernandes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://some-name-for-bucket.s3.amazonaws.com/assento de casamento clemente & filipina.jpeg', NULL, NULL, '2021-04-19 10:31:52', '2021-04-19 10:31:52'),
(33, 28, NULL, NULL, 'nascimento', NULL, 'Leonilda Fraiza Fernandes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://some-name-for-bucket.s3.amazonaws.com/assento de nascimento clemente.jpeg', NULL, NULL, '2021-04-19 10:32:21', '2021-04-19 10:32:21'),
(34, 28, 'Birth After 1961', 'Self', 'Adhar Card', 'Self', 'Leonilda Fraiza Fernandes', 'Curtorim', NULL, NULL, 'Photocopy', 'Photocopy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://some-name-for-bucket.s3.amazonaws.com/assento de nascimento clemente.jpeg', NULL, NULL, '2021-04-19 10:36:59', '2021-04-19 10:36:59');

-- --------------------------------------------------------

--
-- Table structure for table `followup`
--

CREATE TABLE `followup` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `followup_for` text DEFAULT NULL,
  `type` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `followup`
--

INSERT INTO `followup` (`id`, `user_id`, `followup_for`, `type`, `date`, `comments`, `created_at`, `updated_at`) VALUES
(26, 18, 'New Employee', 'Enquiry clients closures', '2021-03-02', 'mjkl;', '2021-02-05 16:39:22', '2021-02-05 16:39:22');

-- --------------------------------------------------------

--
-- Table structure for table `reminder`
--

CREATE TABLE `reminder` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `remind` text DEFAULT NULL,
  `current_case_stage` text DEFAULT NULL,
  `closed_by` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reminder`
--

INSERT INTO `reminder` (`id`, `user_id`, `remind`, `current_case_stage`, `closed_by`, `created_at`, `updated_at`) VALUES
(13, 18, 'Joshua', '', '', '2021-02-05 16:40:09', '2021-02-05 16:40:09'),
(14, 18, 'Joshua', 'Case Stage 1', 'New Employee', '2021-02-05 16:40:19', '2021-02-05 16:40:19'),
(15, 18, 'Joshua', 'Case Stage 1', 'New Employee', '2021-02-05 16:40:27', '2021-02-05 16:40:27'),
(16, 18, 'New Employee', 'Dead End', 'Joshua', '2021-03-03 09:45:09', '2021-03-03 09:45:09');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `user_type`, `created_at`, `updated_at`) VALUES
(20, 'Admin', 'ekavade@gmail.com', 'data1234', 1, '2021-04-19 06:13:26', '2021-04-19 06:15:00'),
(21, 'Jyoti', 'jyoti@gmail.com', 'jyoti9012', 2, '2021-04-19 06:16:19', '2021-04-19 06:16:19'),
(22, 'Vinita', 'vinita@gmail.com', 'vinita9012', 2, '2021-04-19 06:16:55', '2021-04-19 06:16:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `followup`
--
ALTER TABLE `followup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reminder`
--
ALTER TABLE `reminder`
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
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `followup`
--
ALTER TABLE `followup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `reminder`
--
ALTER TABLE `reminder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

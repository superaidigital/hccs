-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2025 at 09:55 PM
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
-- Database: `sisaket_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `healthstaff_shelters`
--

CREATE TABLE `healthstaff_shelters` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shelter_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `healthstaff_shelters`
--

INSERT INTO `healthstaff_shelters` (`id`, `user_id`, `shelter_id`, `created_at`) VALUES
(34, 6, 3, '2025-07-27 16:26:51'),
(35, 6, 1, '2025-07-27 16:26:51');

-- --------------------------------------------------------

--
-- Table structure for table `hospital_daily_reports`
--

CREATE TABLE `hospital_daily_reports` (
  `id` int(11) NOT NULL,
  `shelter_id` int(11) NOT NULL,
  `report_date` date NOT NULL,
  `total_patients` int(11) DEFAULT 0,
  `male_patients` int(11) DEFAULT 0,
  `female_patients` int(11) DEFAULT 0,
  `pregnant_women` int(11) DEFAULT 0,
  `disabled_patients` int(11) DEFAULT 0,
  `bedridden_patients` int(11) DEFAULT 0,
  `elderly_patients` int(11) DEFAULT 0,
  `child_patients` int(11) DEFAULT 0,
  `chronic_disease_patients` int(11) DEFAULT 0,
  `diabetes_patients` int(11) DEFAULT 0,
  `hypertension_patients` int(11) DEFAULT 0,
  `heart_disease_patients` int(11) DEFAULT 0,
  `mental_health_patients` int(11) DEFAULT 0,
  `kidney_disease_patients` int(11) DEFAULT 0,
  `other_monitored_diseases` int(11) DEFAULT 0,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hospital_daily_reports`
--

INSERT INTO `hospital_daily_reports` (`id`, `shelter_id`, `report_date`, `total_patients`, `male_patients`, `female_patients`, `pregnant_women`, `disabled_patients`, `bedridden_patients`, `elderly_patients`, `child_patients`, `chronic_disease_patients`, `diabetes_patients`, `hypertension_patients`, `heart_disease_patients`, `mental_health_patients`, `kidney_disease_patients`, `other_monitored_diseases`, `notes`, `created_at`, `updated_at`, `created_by`) VALUES
(1, 3, '2025-07-27', 8, 2, 1, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, NULL, '2025-07-27 17:59:46', '2025-07-27 19:13:37', 2);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`setting_key`, `setting_value`, `active`) VALUES
('menu_dashboard', '1', 1),
('menu_settings', '1', 1),
('menu_shelters', '1', 1),
('menu_users', '1', 1),
('system_status', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shelters`
--

CREATE TABLE `shelters` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `capacity` int(11) DEFAULT 0,
  `current_occupancy` int(11) DEFAULT 0,
  `coordinator` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `amphoe` varchar(100) DEFAULT NULL,
  `tambon` varchar(100) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `requires_detailed_report` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shelters`
--

INSERT INTO `shelters` (`id`, `name`, `type`, `capacity`, `current_occupancy`, `coordinator`, `phone`, `amphoe`, `tambon`, `latitude`, `longitude`, `created_at`, `requires_detailed_report`) VALUES
(1, 'วัดบ้านพยุห์', 'ศูนย์พักพิง', 1000, 250, 'ปฐวีกานต์ ศรีคราม', '0981051534', 'พยุห์', 'พยุห์', '', '', '2025-07-27 07:55:51', 0),
(2, 'ปฐวีกานต์ ศรีคราม', 'รพ.สต.', 1000, 20, 'ปฐวีกานต์ ศรีคราม', '0981051534', 'พยุห์', 'พยุห์', '', '', '2025-07-27 07:55:54', 1),
(3, 'PaPa', 'รพ.สต.', 1000, 8, 'ปฐวีกานต์ ศรีคราม', '0981051534', 'พยุห์', 'พยุห์', '', '', '2025-07-27 07:55:55', 1),
(4, 'ปฐวีกานต์ ศรีคราม', 'ศูนย์รับบริจาค', 0, 0, 'ปฐวีกานต์ ศรีคราม', '0981051534', 'ไพรบึง', 'แข้', '', '', '2025-07-27 08:23:06', 0),
(5, 'ปากกาสีน้ำเงิน', 'ศูนย์พักพิง', 0, 0, 'ปฐวีกานต์', '', 'โพธิ์ศรีสุวรรณ', 'โดด', '', '', '2025-07-27 09:06:13', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shelter_logs`
--

CREATE TABLE `shelter_logs` (
  `id` int(11) NOT NULL,
  `shelter_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_unit` varchar(50) NOT NULL,
  `change_amount` int(11) NOT NULL,
  `log_type` enum('add','subtract') NOT NULL,
  `new_total` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shelter_logs`
--

INSERT INTO `shelter_logs` (`id`, `shelter_id`, `item_name`, `item_unit`, `change_amount`, `log_type`, `new_total`, `created_at`) VALUES
(1, 1, 'ผู้เข้าพัก/ใช้บริการ', 'คน', 100, 'add', 100, '2025-07-27 09:06:35'),
(2, 5, 'ผู้เข้าพัก/ใช้บริการ', 'คน', 5000, 'add', 5000, '2025-07-27 09:06:47'),
(3, 1, 'ผู้เข้าพัก/ใช้บริการ', 'คน', 150, 'add', 250, '2025-07-27 10:41:31'),
(4, 3, 'ผู้เข้าพัก/ใช้บริการ', 'คน', 5, 'add', 5, '2025-07-27 10:48:53'),
(5, 3, 'ผู้เข้าพัก/ใช้บริการ', 'คน', 500, 'add', 505, '2025-07-27 11:05:22'),
(6, 2, 'บะหมี่', 'กล่อง', 5, 'add', 5, '2025-07-27 11:05:44'),
(7, 2, 'ผู้เข้าพัก/ใช้บริการ', 'คน', 1, 'add', 6, '2025-07-27 12:42:28'),
(8, 2, 'ผู้เข้าพัก/ใช้บริการ', 'คน', 14, 'add', 20, '2025-07-27 12:42:41'),
(9, 3, 'ผู้เข้าพัก/ใช้บริการ', 'คน', 1, 'add', 506, '2025-07-27 14:48:09'),
(10, 3, 'ผู้เข้าพัก/ใช้บริการ', 'คน', 1, 'add', 507, '2025-07-27 14:48:12'),
(11, 3, 'ผู้เข้าพัก/ใช้บริการ', 'คน', 2, 'add', 509, '2025-07-27 16:48:10'),
(12, 3, 'ผู้เข้าพัก/ใช้บริการ', 'คน', 1, 'add', 510, '2025-07-27 16:48:14'),
(13, 3, 'ผู้เข้าพัก/ใช้บริการ', 'คน', 2, 'add', 512, '2025-07-27 16:50:11'),
(14, 3, 'ผู้เข้าพัก/ใช้บริการ', 'คน', 1, 'subtract', 511, '2025-07-27 16:50:17'),
(15, 3, 'ผู้เข้าพัก/ใช้บริการ', 'คน', 1, 'subtract', 510, '2025-07-27 16:50:21'),
(16, 5, 'ผู้เข้าพัก/ใช้บริการ', 'คน', 5000, 'add', 10000, '2025-07-27 17:15:02'),
(17, 5, 'ผู้เข้าพัก/ใช้บริการ', 'คน', 10000, 'add', 20000, '2025-07-27 17:15:10'),
(18, 5, 'ผู้เข้าพัก/ใช้บริการ', 'คน', 2000, 'subtract', 18000, '2025-07-27 17:15:20'),
(19, 5, 'ผู้เข้าพัก/ใช้บริการ', 'คน', 18000, 'add', 36000, '2025-07-27 17:15:30'),
(20, 5, 'ผู้เข้าพัก/ใช้บริการ', 'คน', 36000, 'subtract', 0, '2025-07-27 17:15:45'),
(21, 3, 'ผู้ป่วย (รพ.สต.)', 'คน', 10, 'add', 520, '2025-07-27 17:59:46'),
(22, 3, 'ผู้ป่วย (รพ.สต.)', 'คน', 3, 'add', 523, '2025-07-27 18:23:01'),
(23, 3, 'ผู้ป่วย (รพ.สต.)', 'คน', 3, 'subtract', 520, '2025-07-27 18:23:10'),
(24, 3, 'ผู้ป่วย (รพ.สต.)', 'คน', 2, 'add', 522, '2025-07-27 18:24:05'),
(25, 3, 'ผู้ป่วย (รพ.สต.)', 'คน', 522, 'subtract', 0, '2025-07-27 18:25:05'),
(26, 3, 'ผู้ป่วย (รพ.สต.)', 'คน', 3, 'add', 3, '2025-07-27 18:25:49'),
(27, 3, 'ผู้ป่วย (รพ.สต.)', 'คน', 5, 'add', 8, '2025-07-27 18:46:29');

-- --------------------------------------------------------

--
-- Table structure for table `shelter_occupant_details`
--

CREATE TABLE `shelter_occupant_details` (
  `id` int(11) NOT NULL,
  `shelter_id` int(11) DEFAULT NULL,
  `male` int(11) NOT NULL,
  `female` int(11) NOT NULL,
  `pregnant` int(11) DEFAULT 0,
  `disabled` int(11) DEFAULT 0,
  `bedridden` int(11) DEFAULT 0,
  `elderly` int(11) DEFAULT 0,
  `children` int(11) DEFAULT 0,
  `diabetes` int(11) DEFAULT 0,
  `hypertension` int(11) DEFAULT 0,
  `heart_disease` int(11) DEFAULT 0,
  `psychiatric` int(11) DEFAULT 0,
  `kidney_dialysis` int(11) DEFAULT 0,
  `other_conditions` text DEFAULT NULL,
  `status` enum('เพิ่ม','ลด') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_shelters`
--

CREATE TABLE `staff_shelters` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shelter_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin','Coordinator','HealthStaff','User') NOT NULL DEFAULT 'User',
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `assigned_shelter_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `status`, `assigned_shelter_id`, `created_at`) VALUES
(2, 'ปฐวีกานต์ ศรีคราม', 'adminmax@gmail.com', '$2y$10$h5z6a4fhD3KMDcxKPApdMOTfk38eWbC/mYK5WsI4tblnCHggS2Xya', 'Admin', 'Active', NULL, '2025-07-27 07:02:49'),
(6, 'พยาบาล', 'nurse@mail.com', '$2y$10$jcX.89PPtIPqFrDgSWHLKOnX4qlf.qctqP7derxCWBw5pLnT77NRu', 'HealthStaff', 'Active', NULL, '2025-07-27 13:28:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `healthstaff_shelters`
--
ALTER TABLE `healthstaff_shelters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_assignment` (`user_id`,`shelter_id`),
  ADD KEY `shelter_id` (`shelter_id`);

--
-- Indexes for table `hospital_daily_reports`
--
ALTER TABLE `hospital_daily_reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_shelter_date` (`shelter_id`,`report_date`),
  ADD KEY `idx_report_date` (`report_date`),
  ADD KEY `idx_shelter_date` (`shelter_id`,`report_date`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`setting_key`);

--
-- Indexes for table `shelters`
--
ALTER TABLE `shelters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shelter_logs`
--
ALTER TABLE `shelter_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shelter_id` (`shelter_id`);

--
-- Indexes for table `shelter_occupant_details`
--
ALTER TABLE `shelter_occupant_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shelter_id` (`shelter_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `staff_shelters`
--
ALTER TABLE `staff_shelters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `shelter_id` (`shelter_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `users_ibfk_1` (`assigned_shelter_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `healthstaff_shelters`
--
ALTER TABLE `healthstaff_shelters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `hospital_daily_reports`
--
ALTER TABLE `hospital_daily_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shelters`
--
ALTER TABLE `shelters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shelter_logs`
--
ALTER TABLE `shelter_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `shelter_occupant_details`
--
ALTER TABLE `shelter_occupant_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_shelters`
--
ALTER TABLE `staff_shelters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `healthstaff_shelters`
--
ALTER TABLE `healthstaff_shelters`
  ADD CONSTRAINT `healthstaff_shelters_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `healthstaff_shelters_ibfk_2` FOREIGN KEY (`shelter_id`) REFERENCES `shelters` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hospital_daily_reports`
--
ALTER TABLE `hospital_daily_reports`
  ADD CONSTRAINT `hospital_daily_reports_ibfk_1` FOREIGN KEY (`shelter_id`) REFERENCES `shelters` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shelter_logs`
--
ALTER TABLE `shelter_logs`
  ADD CONSTRAINT `shelter_logs_ibfk_1` FOREIGN KEY (`shelter_id`) REFERENCES `shelters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shelter_occupant_details`
--
ALTER TABLE `shelter_occupant_details`
  ADD CONSTRAINT `shelter_occupant_details_ibfk_1` FOREIGN KEY (`shelter_id`) REFERENCES `shelters` (`id`),
  ADD CONSTRAINT `shelter_occupant_details_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `staff_shelters`
--
ALTER TABLE `staff_shelters`
  ADD CONSTRAINT `staff_shelters_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `staff_shelters_ibfk_2` FOREIGN KEY (`shelter_id`) REFERENCES `shelters` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`assigned_shelter_id`) REFERENCES `shelters` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

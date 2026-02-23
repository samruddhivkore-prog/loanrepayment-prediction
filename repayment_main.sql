-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 13, 2025 at 12:10 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pisysqvw_Repayment_prediction`
--

-- --------------------------------------------------------

--
-- Table structure for table `repayment_main`
--

CREATE TABLE `repayment_main` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(255) DEFAULT 'male',
  `martial_status` varchar(255) NOT NULL,
  `dependants` int(11) NOT NULL,
  `education` varchar(255) NOT NULL,
  `employment` varchar(255) NOT NULL,
  `income` varchar(255) NOT NULL,
  `co_income` varchar(255) NOT NULL,
  `expense` varchar(255) NOT NULL,
  `loan_purpose` varchar(255) NOT NULL,
  `loan_amount` varchar(255) NOT NULL,
  `loan_amount_term` int(11) NOT NULL,
  `Credit_score` varchar(255) NOT NULL,
  `dti` varchar(255) NOT NULL,
  `property_area` varchar(255) NOT NULL,
  `repayment_status` varchar(255) NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `repayment_main`
--

INSERT INTO `repayment_main` (`id`, `name`, `age`, `gender`, `martial_status`, `dependants`, `education`, `employment`, `income`, `co_income`, `expense`, `loan_purpose`, `loan_amount`, `loan_amount_term`, `Credit_score`, `dti`, `property_area`, `repayment_status`, `date`, `time`) VALUES
(4, 'wee', 23, 'female', 'married', 2, 'illiterate', 'self-employed', '232323.0', '23232.0', '232323.0', 'Home Loan', '232323.0', 11, '121.0', '56', 'urban', 'unlikely', '2025-01-13', '10:59:37'),
(5, 'asdas', 22, 'female', 'married', 3, 'illiterate', 'self-employed', '23424.0', '2424.0', '2424.0', 'Gold Loan', '42424.0', 12, '221.0', '56', 'urban', 'unlikely', '2025-01-13', '12:37:04'),
(6, 'sujeet ', 55, 'male', 'married', 3, 'graduate', 'unemployed', '800000.0', '0.0', '20000.0', 'Car Loan', '20000.0', 12, '678.0', '30', 'semiurban', 'unlikely', '2025-01-13', '12:52:20'),
(7, 'vikrant sarade', 26, 'male', 'married', 2, 'higher studies', 'salaried', '3000000.0', '2000000.0', '20000.0', 'Personal Loan', '400000.0', 24, '890.0', '29', 'urban', 'Likely to pay', '2025-01-13', '12:54:42'),
(8, 'Jijai', 44, 'male', 'unmarried', 4, 'higher studies', 'self-employed', '1000000.0', '800000.0', '20000.0', 'Gold Loan', '40000.0', 12, '800.0', '29.0', 'urban', 'Likely to pay', '2025-01-13', '12:57:53'),
(9, 'Omkar daswadkar', 22, 'male', 'unmarried', 3, 'graduate', 'self-employed', '500000.0', '0.0', '20000.0', 'Home Loan', '200000.0', 12, '340.0', '36.0', 'urban', 'Unlikely', '2025-01-13', '15:04:25'),
(10, 'Omkar daswadkar', 22, 'male', 'unmarried', 3, 'graduate', 'self-employed', '500000.0', '0.0', '20000.0', 'Home Loan', '200000.0', 12, '340.0', '36.0', 'urban', 'Unlikely', '2025-01-13', '15:04:25'),
(11, 'Omkar daswadkar', 22, 'male', 'unmarried', 3, 'graduate', 'self-employed', '500000.0', '0.0', '20000.0', 'Home Loan', '200000.0', 12, '340.0', '36.0', 'urban', 'Unlikely', '2025-01-13', '15:04:25'),
(12, 'sdsfd', 23, 'male', 'married', 2, 'illiterate', 'self-employed', '324543.0', '2323.0', '232323232.0', 'Gold Loan', '3232323232.0', 2, '234.0', '56.0', 'rural', 'Unlikely to Pay', '2025-01-13', '16:00:15'),
(13, 'sdsfd', 23, 'male', 'married', 2, 'illiterate', 'self-employed', '324543.0', '2323.0', '232323232.0', 'Gold Loan', '3232323232.0', 2, '234.0', '56.0', 'rural', 'Unlikely to Pay', '2025-01-13', '16:00:15'),
(14, 'sdsfd', 23, 'male', 'married', 2, 'illiterate', 'self-employed', '324543.0', '2323.0', '232323232.0', 'Gold Loan', '3232323232.0', 2, '234.0', '56.0', 'rural', 'Unlikely to Pay', '2025-01-13', '16:00:15'),
(15, 'sdsfd', 23, 'male', 'married', 2, 'illiterate', 'self-employed', '324543.0', '2323.0', '232323232.0', 'Gold Loan', '3232323232.0', 2, '234.0', '56.0', 'rural', 'Unlikely to Pay', '2025-01-13', '16:05:18'),
(16, 'dwefw', 22, 'male', 'married', 2, 'illiterate', 'self-employed', '23432.0', '232.0', '32342.0', 'Home Loan', '4232.0', 2, '232.0', '23.0', 'urban', 'Unlikely', '2025-01-13', '16:28:42'),
(17, 'dwefw', 22, 'male', 'married', 2, 'illiterate', 'self-employed', '23432.0', '232.0', '32342.0', 'Home Loan', '4232.0', 2, '232.0', '23.0', 'urban', 'Unlikely', '2025-01-13', '16:28:42'),
(18, 'dwefw', 22, 'male', 'married', 2, 'illiterate', 'self-employed', '23432.0', '232.0', '32342.0', 'Home Loan', '4232.0', 2, '232.0', '23.0', 'urban', 'Unlikely', '2025-01-13', '16:28:42'),
(19, 'sneha yadav', 30, 'female', 'married', 2, 'higher studies', 'salaried', '1200000.0', '600000.0', '30000.0', 'Secured Loan', '4543.0', 24, '789.8', '32.4', 'urban', 'Likely to pay', '2025-01-13', '16:32:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `repayment_main`
--
ALTER TABLE `repayment_main`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `repayment_main`
--
ALTER TABLE `repayment_main`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

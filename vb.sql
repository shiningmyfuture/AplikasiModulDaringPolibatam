-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2023 at 08:03 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vb`
--

-- --------------------------------------------------------

--
-- Table structure for table `code_admin`
--

CREATE TABLE `code_admin` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `code` varchar(5) NOT NULL,
  `expire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `code_admin`
--

INSERT INTO `code_admin` (`id`, `email`, `code`, `expire`) VALUES
(27, 'febrianariandini1402@gmail.com', '16259', 1664957147),
(28, 'febrianariandini1402@gmail.com', '10156', 1665020358),
(29, 'febrianariandini1402@gmail.com', '79814', 1665987232),
(30, 'febrianariandini1402@gmail.com', '42685', 1665987527),
(31, 'febrianariandini1402@gmail.com', '86996', 1665987530);

-- --------------------------------------------------------

--
-- Table structure for table `code_dosen`
--

CREATE TABLE `code_dosen` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `code` int(5) NOT NULL,
  `expire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `code_dosen`
--

INSERT INTO `code_dosen` (`id`, `email`, `code`, `expire`) VALUES
(1, 'febrianariandini1402@gmail.com', 20697, 1663578641),
(2, 'aldoichbal@gmail.com', 68053, 1664959307);

-- --------------------------------------------------------

--
-- Table structure for table `code_guest`
--

CREATE TABLE `code_guest` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `code` varchar(200) NOT NULL,
  `expire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `code_guest`
--

INSERT INTO `code_guest` (`id`, `email`, `code`, `expire`) VALUES
(1, 'febrianariandini@gmail.com', '28847', 1668048295),
(2, 'febrianariandini@gmail.com', '14788', 1668048359),
(3, 'febrianariandini@gmail.com', '93376', 1668048362);

-- --------------------------------------------------------

--
-- Table structure for table `code_laboran`
--

CREATE TABLE `code_laboran` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `code` varchar(5) NOT NULL,
  `expire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `code_laboran`
--

INSERT INTO `code_laboran` (`id`, `email`, `code`, `expire`) VALUES
(1, 'arulbagus21@gmail.com', '35838', 1663562994),
(3, 'aldoichbal@gmail.com', '49764', 1664958731),
(4, 'febrianariandini1402@gmail.com', '92713', 1665022513);

-- --------------------------------------------------------

--
-- Table structure for table `code_mahasiswa`
--

CREATE TABLE `code_mahasiswa` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `code` varchar(5) NOT NULL,
  `expire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `code_mahasiswa`
--

INSERT INTO `code_mahasiswa` (`id`, `email`, `code`, `expire`) VALUES
(1, 'aldoichbal@gmail.com', '56023', 1664958558),
(2, 'febrianariandini@gmail.com', '73545', 1665021829),
(3, 'febrianariandini@gmail.com', '37791', 1668048010);

-- --------------------------------------------------------

--
-- Table structure for table `matkul_mhs`
--

CREATE TABLE `matkul_mhs` (
  `id_matkul_mhs` int(11) NOT NULL,
  `id_matkul` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `id_prodi` int(11) NOT NULL,
  `username` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `no_hpadmin` varchar(200) NOT NULL,
  `email_admin` varchar(200) NOT NULL,
  `alamat_admin` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  `profile_img` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id_admin`, `username`, `password`, `no_hpadmin`, `email_admin`, `alamat_admin`, `date`, `profile_img`) VALUES
(11, 'Admin', '$2y$10$Ao5bI4v2micqoQzbRpgez.GJVjbHQnNWlQ3gHJHWajSWK.lsRTzBS', '085272174432', 'febrianariandini1402@gmail.com', 'Citra Batam', '0000-00-00 00:00:00', 'mnyt.jfif'),
(19, 'Jamal', '$2y$10$vFRHT8WM0xgbBHpmBvzNrOdkrhjUeA3ZYyx0zAYG0ZSdb6uQDpfxK', '089988727272', 'jamal@gmail.com', 'Batam Center', '0000-00-00 00:00:00', NULL),
(20, 'Andin', 'c0ffaa1cfa6feec5da9c30960ff74e9324fc278ff736ab77e7ed630f493c38b3', '0821212292192', 'andin171@gmail.com', 'Batu Aji', '0000-00-00 00:00:00', NULL),
(21, 'shining', '96c984b12f5fcac14629c3d607eec7a92a1b352c1b5bd3cdff16a8e3f2759f85', '087675262161', 'shining@gmail.com', '', '0000-00-00 00:00:00', NULL),
(22, 'Jaehyun14', '$2y$10$8ekJZ3QnUYiwg4TU6X8b/OEjcQw64XmGVOEG3rDVHj3DtGeOKasYa', '08927218271', 'Jaehyun14@gmail.com', 'Bengkong Baru', '0000-00-00 00:00:00', NULL),
(23, 'Andincantikz', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '0876251', 'andin@gmail.com', '', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_attempt`
--

CREATE TABLE `tbl_attempt` (
  `id_attempt` int(11) NOT NULL,
  `id_matkul` int(11) NOT NULL,
  `id_modul` int(11) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `waktu` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_attempt`
--

INSERT INTO `tbl_attempt` (`id_attempt`, `id_matkul`, `id_modul`, `deskripsi`, `waktu`) VALUES
(16, 18, 125, 'JJJJDSJS', 7200),
(17, 17, 120, 'asdasdasd', 7200);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dosen`
--

CREATE TABLE `tbl_dosen` (
  `id_dosen` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `nik_dosen` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `no_hpdosen` varchar(200) NOT NULL,
  `email_dosen` varchar(200) NOT NULL,
  `alamat_dosen` varchar(200) NOT NULL,
  `profile_img` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_dosen`
--

INSERT INTO `tbl_dosen` (`id_dosen`, `username`, `nik_dosen`, `password`, `no_hpdosen`, `email_dosen`, `alamat_dosen`, `profile_img`) VALUES
(11, 'DOSEN', '123', '$2y$10$j0p5YNypmfknu.1fgFb8ru6oyJNXoV/bw6AvEfkU0INXy9FqdQKb6', '08252617', 'sd@gmail.com', 'fe', 'user.jpg'),
(13, 'Joshua', '123', '$2y$10$80nocDibks/h5yCZJk4/hO/VOVizz93tBTTK6m9/YMyPLJ/3Cpph6', '1323', 'febrianariandini@gmail.com', 'Citra Batam', ''),
(14, 'dede', '123', '$2y$10$HRrwxa0213ZtrtDiegY6du8YsNy6MDIH4WmTbm1txegcmQl/hBVR.', '2323', 'febrianariandini@gmail.com', 'Citra Batam', ''),
(15, 'ff', '123', '$2y$10$6ptUXqRUOi2eS.RzyNNoQ.6iD/7CCpUqOD9p7TqxGW/Uu/ew2zVtq', '121', 'febrianariandini@gmail.com', 'Citra Batam', ''),
(17, 'dosen12', '212718271728', '$2y$10$FUKFXUUSUlB0dhO0vfJqPeJSOVP1VdqBz0bRJ4VoBuyL4kb5quboW', '08391839831', 'andin17@gmail.com', 'kjdakhdajlf', ''),
(20, 'Dirgawijaya', '2129121921920109201', '44c5a63a3cb5da213fc51cde5267718c15befd80645e75302021992d0dfc85c2', '08975656579968', 'dirgawijaya@gmail.com', 'Batam Center Perumahan Royal Grande', NULL),
(21, 'sebastian', '21291219219076109201', 'b358342bb32727e4e14262b09c94ffa6007d268b99e2dada62c5fa2513ed379e', '08975756579968', 'sebastian@gmail.com', 'Batam Center Perumahan Beverly', NULL),
(22, 'dosen97', '219821928192891', '1018b49a711c11960806fea922b81ede996e1a3b2a93e783b69fbebb8a21b1ee', '08976767687', 'dosen97@gmail.com', '', NULL),
(23, 'Dosen128', '212182128271', '2747b7c718564ba5f066f0523b03e17f6a496b06851333d2d59ab6d863225848', '0897262726281', 'dosen128@gmail.com', '', NULL),
(24, 'Siti97', '215216', '29e488401fe4ac16ac08c3cb4f0ea93dc3d3f554876573d7feb8a04352064d07', '0896', 'ana@gmail.com', '', NULL),
(25, 'abc', '12192', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '082912711', 'abc@gmail.com', '', NULL),
(26, 'Rafana', '1234', '31b9853f8c546a96ad38d3f90df0f065911f0165747a17bc0d58fd47e856fa65', '0962524', 'rafana@gmail.com', '', NULL),
(27, 'nafisah', '522882', 'ed7f534f3f3259a2823ea7f6ee7e2a5a907a01639ddceef8cb779288011867d0', '017217218', 'nafisah@gmail.com', '', NULL),
(28, 'anggun', '8273738', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '082726', 'anggun@gmail.com', '', NULL),
(29, 'Dosen176', '21928162', 'cba28b89eb859497f544956d64cf2ecf29b76fe2ef7175b33ea59e64293a4461', '089762573', 'dosen172@gmail.com', '', NULL),
(30, 'sayadosen', '043', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '911', 'sayadosen@gmail.com', '', NULL),
(31, 'Dosenweb', '217161717151', '9722e8c5bdca46222eef4ca6d301b31d3012bfb3cf76543703c230a5e93430a7', '08272726', 'dosenweb@gmail.com', '', NULL),
(32, 'dosenimk', '216544', 'c6485e205432d160cb573229a376adbff943aa8adf302f48509489728b1a6201', '0897654', 'sagda@gmail.com', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dospengampu`
--

CREATE TABLE `tbl_dospengampu` (
  `id_dospengampu` int(11) NOT NULL,
  `id_dosen` int(11) NOT NULL,
  `id_matkul` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_dospengampu`
--

INSERT INTO `tbl_dospengampu` (`id_dospengampu`, `id_dosen`, `id_matkul`) VALUES
(73, 11, 17),
(74, 11, 18),
(75, 17, 50),
(76, 17, 47);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_guest`
--

CREATE TABLE `tbl_guest` (
  `id_guest` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email_guest` varchar(200) NOT NULL,
  `profile_img` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_guest`
--

INSERT INTO `tbl_guest` (`id_guest`, `username`, `password`, `email_guest`, `profile_img`) VALUES
(9, 'dd', '$2y$10$t0WSz6fMPCMr1zW.AFKgG.9597vbgbQEuQEqrmzufmR1CsFaM5ePO', 'sd@gmail.com', NULL),
(14, 'guest', '$2y$10$veI5ruAR.VQ3hzHMrsvgp.6T.ZSpLMw7omHuzOTZJSSc62cHzPOLi', 'guest@gmail.com', ''),
(15, 'Febri', '$2y$10$3VgYf6XpjUSUYZyfVq9dkeBpD6n82B70nFMVC5IKAdHcZf9hGmiZq', 'guest@gmail.com', ''),
(16, 'rr', '$2y$10$dyh0X1oRdB0SgBPUOnxh/u58oBBquXjWZdO8LCPvN3tCtMbKDOzH6', 'guest@gmail.com', ''),
(17, 'feb', '$2y$10$GZQNcGyLE6nQGD2eEIkvXu8nGNznLIRcMXoSyW3vKoed5qubE6Gy6', 'febrianariandini@gmail.com', NULL),
(19, 'sunshine', 'sunshine', 'sunshine@gmail.com', NULL),
(20, 'sunshine123', '$2y$10$RFe7ifAxznUE/NWANC6sBOSC.LY7sHqSWnJeFkGgWT0eqzLarXK3q', 'sunshine123@gmail.com', NULL),
(21, 'guest172', '922c7954216ccfe7a61def609305ce1dc7c67e225f873f256d30d7a8ee4f404c', 'guest178@gmail.com', NULL),
(22, 'guest7', 'eda3a4a861a05ba5dd6c5bac62c1dee094da35ed5da64778478796cacddca278', 'guest7@gmail.com', NULL),
(23, 'guest165', 'bc52dd634277c4a34a2d6210994a9a5e2ab6d33bb4a3a8963410e00ca6c15a02', 'guest165@gmail.com', NULL),
(24, 'shiningjamal', '96c984b12f5fcac14629c3d607eec7a92a1b352c1b5bd3cdff16a8e3f2759f85', 'shiningjamal@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jurusan`
--

CREATE TABLE `tbl_jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `nama_jurusan` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_jurusan`
--

INSERT INTO `tbl_jurusan` (`id_jurusan`, `nama_jurusan`) VALUES
(7, 'Teknik Informatika'),
(8, 'Teknik Mesin'),
(9, 'Teknik Elektro'),
(10, 'Manajemen Bisnis');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jwb_guest`
--

CREATE TABLE `tbl_jwb_guest` (
  `id_jwb_guest` int(100) NOT NULL,
  `id_attempt` int(11) NOT NULL,
  `id_matkulguest` int(11) NOT NULL,
  `id_soal` int(100) NOT NULL,
  `jawaban` enum('a','b','c','d','e','f','t') DEFAULT NULL,
  `jawab_essay` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jwb_mhs`
--

CREATE TABLE `tbl_jwb_mhs` (
  `id_jwb_mhs` int(100) NOT NULL,
  `id_attempt` int(11) NOT NULL,
  `id_matkulmhs` int(11) NOT NULL,
  `id_soal` int(100) NOT NULL,
  `jawaban` enum('a','b','c','d','e','f','t') CHARACTER SET utf8mb4 DEFAULT NULL,
  `jawab_essay` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_jwb_mhs`
--

INSERT INTO `tbl_jwb_mhs` (`id_jwb_mhs`, `id_attempt`, `id_matkulmhs`, `id_soal`, `jawaban`, `jawab_essay`) VALUES
(204, 16, 10, 64, 'f', ''),
(205, 16, 10, 65, 'c', ''),
(206, 16, 10, 66, 'b', ''),
(210, 17, 13, 61, 'b', ''),
(211, 17, 13, 62, 'b', ''),
(212, 17, 13, 63, 'f', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_laboran`
--

CREATE TABLE `tbl_laboran` (
  `id_laboran` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `nik_laboran` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `no_hplaboran` varchar(200) NOT NULL,
  `email_laboran` varchar(200) NOT NULL,
  `alamat_laboran` varchar(200) NOT NULL,
  `profile_img` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_laboran`
--

INSERT INTO `tbl_laboran` (`id_laboran`, `username`, `nik_laboran`, `password`, `no_hplaboran`, `email_laboran`, `alamat_laboran`, `profile_img`) VALUES
(8, 'laboran', '1234', '$2y$10$/FzHS6yDMb1ZSz4/fHn17.L1FLaAOtFdR4ZwBQXgo34BDYzRp3GFy', '085272174483', 'febrianariandini1402@gmail.com', 'sdscdsc', NULL),
(10, 'labor', '4311', '$2y$10$a8p1ASSP759qRWE/wuDxf.8LBY.f1kZyGltGe8u2CRzZc3bcn5fSi', '0852111111', 'febrianariandini1402@gmail.com', 'sdsffd', ''),
(11, 'susi', '123', '$2y$10$jcE.3C9sCyl/IM3SzIPIUeuBJYfARzxC2tb7IFpkkawY8LSolF1Tu', '2323', 'febrianariandini1402@gmail.com', 'ewdwd', ''),
(12, 'nia', '123', '$2y$10$FiLu0ov24dp.LuJ8M.VeJe1Af8HSOAxMrRkCDBcvkxtmesuZbMa.a', '43553', 'febrianariandini1402@gmail.com', 'sdsffd', ''),
(14, 'ff', '123', '$2y$10$UgviLQXIVaR3qOAf.wSopOk5HfmIIAuiiGQ.JRg12EkiqR3CgDNMO', '133', 'febrianariandini1402@gmail.com', 'sdsffd', ''),
(15, 'laboran171', '2129121081920109201', '41480a81daf8f28b3b65eedb75327b33bc2ebd05c4ab78b7bba3fdf891d7b1cd', '009982911039', 'laboran17@gmail.com', 'Bengkong Sadai', NULL),
(16, 'laboran87', '21102219201920912', '817ee472fa5bcf242fd3235dea966b67c5237ffcad4772f41ad9957bf8f43e49', '08787987879768', 'laboran87@gmail.com', '', NULL),
(17, 'laboran125', '2121621282712818', '0f8ef3377b30fc47f96b48247f463a726a802f62f3faa03d56403751d2f66c67', '0897218216217', 'laboran125@gmail.com', '', NULL),
(18, 'Taeyong19', '21313151', 'd3889b80a6f76160f86d5f58e792f42b4b9d5b3c1c8bea72518d1bddacb5d130', '0872616', 'taeyong2gmail.com', '', NULL),
(19, 'laboran1717', '21621721', '33dc0ba86008f4434bd43d050df9022209367483c1eef5280b25da861c32f6ad', '08716251', 'laboran123@gmail.com', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_labpengampu`
--

CREATE TABLE `tbl_labpengampu` (
  `id_labpengampu` int(11) NOT NULL,
  `id_lab` int(11) NOT NULL,
  `id_matkul` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_labpengampu`
--

INSERT INTO `tbl_labpengampu` (`id_labpengampu`, `id_lab`, `id_matkul`) VALUES
(5, 10, 17);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mahasiswa`
--

CREATE TABLE `tbl_mahasiswa` (
  `id_mhs` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `nim_mhs` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `no_hpmhs` varchar(200) NOT NULL,
  `email_mhs` varchar(200) NOT NULL,
  `alamat_mhs` varchar(200) NOT NULL,
  `profile_img` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_mahasiswa`
--

INSERT INTO `tbl_mahasiswa` (`id_mhs`, `username`, `nim_mhs`, `password`, `no_hpmhs`, `email_mhs`, `alamat_mhs`, `profile_img`) VALUES
(48, 'ew', '4311901019', '$2y$10$skBEMUfJpjaxA4H/tXSWZuIjc.t92ZpSCaCOWhd1/EKw4fR.oRsoy', '3234', 'febrianariandini@gmail.com', 'Citra Batam', NULL),
(49, 'mhs', '4311901019', '$2y$10$PDUEjZsgp1XEmjYkoqpMf.r5SeUYzVqWjMK3n.ksYODkTCxFGoTXC', '32424', 'febrianariandini@gmail.com', 'Citra Batam', 'kucing.jfif'),
(50, 'fd', '4311901019', '$2y$10$CVsTHAyv.IbFnlHcOAMJsu3H4xzyqQ07LPA8WVMlzVg9dEV3oTUVe', '085272174483', 'febrianariandini@gmail.com', 'Citra Batam', ''),
(51, 'tt', '4311901019', '$2y$10$RdCwhCdt0sn8NWUItvYeb.sf7Pwhvq55MlV0QZokJX5KdEkY4Zisi', '133', 'febrianariandini@gmail.com', 'Citra Batam', ''),
(52, 'Febriana Riandini', '4311901019', '', '85272174483', 'febrianariandini@gmail.com', 'Citra Batam', NULL),
(53, 'Ichbal Reyvaldo', '4311901015', '', '3434343', 'ichbal@gmail.com', 'Bengkong', NULL),
(54, 'Balqis Nabel Fadilla Rusymaidad', '4311901013', '', '43434', 'balqis@gmail.com', 'Tiban kampung', NULL),
(55, 'Sakina Januariyanti', '4311901023', '', '545232', 'sakina@gmail.com', 'Tiban Asri', NULL),
(56, 'Leni Gusniati', '4311901009', '', '323244', 'leni@gmail.com', 'Tiban Indah', NULL),
(57, 'Sepnita Indriyani', '4311901017', '', '454545', 'sepnita@gmail.com', 'Tiban Permai', NULL),
(58, 'Annisa Tiara', '4311901011', '', '324332', 'annisa@gmail.com', 'Tiban BTC', NULL),
(59, 'Sherly Octaviani Sari', '4311901030', '', '242343252', 'sherly@gmail.com', 'Tiban ayu', NULL),
(60, 'Noval Alfauzan', '4311901025', '', '423422', 'noval@gmail.com', 'Tiban impian', NULL),
(61, 'sunshine', '3312101012', '$2y$10$Hv/AIdNAMa5PbHUpkDRoVu8pH949QAkBkna.mWAQqpq/TuURpKRFS', '0812172712', 'andin17@gmail.com', 'Bengkong Baru Blok E 05', ''),
(62, 'Angguncantiks', '3312101013', '$2y$10$HPsRvVChG1XKrz9KUnQZvOqiFiJIdl6GNGuW.huQ.U52.cnNwOKay', '089727272', 'mhs@gmail.com', 'Batam Center', NULL),
(63, 'irene123', '99887766', '12345', '089726162182129', 'irene@gmail.com', 'Bengkong baru', NULL),
(64, 'jamal123', '3312101098', '123', '0891729121', 'jamal@gmail.com', '', NULL),
(65, 'jennie', '331215251', '567', '08919289182', 'jenni2@gmail.com', '', NULL),
(66, 'jennie123', '331052564', '5678', '08919289182', 'jenni2@gmail.com', '', NULL),
(68, 'andin', '123465', '098', '0876271', 'andin@gmail.com', '', NULL),
(69, 'jungjamal', '3312898398', '030bf56b472b7a1d478dcbbb26ec87c241b902a2', '089756565646', 'jungjamal@gmail.com', 'Tiban', NULL),
(71, 'Taeyong123', '3312898397', 'taeyong', '0897565656468', 'taeyong@gmail.com', 'Batam Center', NULL),
(72, 'nctaja', '3312898390', '922c7954216ccfe7a61def609305ce1dc7c67e225f873f256d30d7a8ee4f404c', '08765423162', 'nctgaming@gmail.com', 'Tiban Kampoeng', NULL),
(73, 'Andin272', '33171717', '922c7954216ccfe7a61def609305ce1dc7c67e225f873f256d30d7a8ee4f404c', '087878787878', 'andin272@gmail.com', '', NULL),
(74, 'Jamal127', '3312101517', '922c7954216ccfe7a61def609305ce1dc7c67e225f873f256d30d7a8ee4f404c', '097887878787', 'jamal1227@gmail.com', '', NULL),
(75, 'Anggun17', '3314455667', '33dc0ba86008f4434bd43d050df9022209367483c1eef5280b25da861c32f6ad', '089787867577', 'anggun171@gmail.com', '', NULL),
(76, 'Anggun127', '33121717187', '922c7954216ccfe7a61def609305ce1dc7c67e225f873f256d30d7a8ee4f404c', '087262827262', 'anggun127@gmail.com', '', NULL),
(77, 'suuu', '043', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '00', 'suuu@gmail.com', '', NULL),
(78, 'Andin143', '3312727287', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '08768292727', 'andin143@gmail.com', '', NULL),
(79, 'Jaehyun1497', '2353115', '5ec1a0c99d428601ce42b407ae9c675e0836a8ba591c8ca6e2a2cf5563d97ff0', '089754', 'jaehyun1419@gmail.com', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_matakuliah`
--

CREATE TABLE `tbl_matakuliah` (
  `id_matkul` int(11) NOT NULL,
  `kode_matkul` varchar(200) NOT NULL,
  `nama_matkul` varchar(200) NOT NULL,
  `id_prodi` int(11) NOT NULL,
  `matkul_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_matakuliah`
--

INSERT INTO `tbl_matakuliah` (`id_matkul`, `kode_matkul`, `nama_matkul`, `id_prodi`, `matkul_id`) VALUES
(17, 'MJ233', 'Etika Profesi', 13, 1),
(18, 'MJ453', 'magang', 13, 2),
(24, 'MJ543', 'Pemograman web', 13, 3),
(31, 'TK8797', 'badan kapal', 21, 0),
(46, 'MJ453', 'Pemograman Web', 13, 0),
(47, 'MJ342', 'Etika Profesi', 13, 0),
(48, 'MJ453', 'Pelaporan Kerja', 13, 0),
(49, 'MJ234', 'Mangang', 13, 0),
(50, 'MJ567', 'Bahasa Inggris', 13, 0),
(54, 'kp8989', 'kpl', 21, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_matkulguest`
--

CREATE TABLE `tbl_matkulguest` (
  `id_matkulguest` int(11) NOT NULL,
  `id_guest` int(11) NOT NULL,
  `id_matkul` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_matkulguest`
--

INSERT INTO `tbl_matkulguest` (`id_matkulguest`, `id_guest`, `id_matkul`) VALUES
(5, 14, 17);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_matkulmhs`
--

CREATE TABLE `tbl_matkulmhs` (
  `id_matkulmhs` int(11) NOT NULL,
  `id_mhs` int(11) NOT NULL,
  `id_matkul` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_matkulmhs`
--

INSERT INTO `tbl_matkulmhs` (`id_matkulmhs`, `id_mhs`, `id_matkul`) VALUES
(10, 49, 18),
(13, 49, 17),
(14, 49, 24),
(15, 61, 31),
(17, 61, 54),
(18, 61, 50),
(19, 61, 46),
(20, 61, 47),
(21, 73, 17),
(22, 73, 46),
(27, 69, 50),
(28, 74, 50),
(29, 73, 48);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_modulpraktik`
--

CREATE TABLE `tbl_modulpraktik` (
  `id_modul` int(11) NOT NULL,
  `id_matkul` int(11) NOT NULL,
  `jenis_modul` varchar(200) NOT NULL,
  `judul_modul` varchar(200) NOT NULL,
  `deskripsi_modul` varchar(200) NOT NULL,
  `modul_file` text DEFAULT NULL,
  `modul_link` varchar(200) DEFAULT NULL,
  `icon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_modulpraktik`
--

INSERT INTO `tbl_modulpraktik` (`id_modul`, `id_matkul`, `jenis_modul`, `judul_modul`, `deskripsi_modul`, `modul_file`, `modul_link`, `icon`) VALUES
(120, 17, 'Link', 'Module 1', '556557thghghddssd', '', 'https://github.com/shiningmyfuture/AplikasiModulDaring-Vid/raw/3048e539cc1969355a28b227e324688a812d5c48/Tutorial%20Flutter%20%231%20-%20Intro%20Pengenalan.mp4', 'https://cdn-icons-png.flaticon.com/512/5965/5965885.png'),
(121, 17, 'File', 'Module 1 PDF', 'tytutytytytytytyt', '11.007 Balasan Surat Permohonan Magang Industri_Moch Ichbal Reyvaldo.pdf', 'http://file.upi.edu/Direktori/FPEB/PRODI._MANAJEMEN_FPEB/197207152003121-CHAIRUL_FURQON/004._SIM-sistem_informasi.pdf', 'https://cdn-icons-png.flaticon.com/512/4726/4726010.png'),
(123, 17, 'File', 'Module 2 PDF', 'penjelasan tetang apa saja itu mulmed', 'No.BO.8.4.3.1-V2 Borang Logbook Magang.doc', 'https://github.com/Alfajris/videoDrive/raw/main/P11.%20Konfigurasi%20CI.pdf', 'https://cdn-icons-png.flaticon.com/512/4726/4726010.png'),
(125, 18, 'File', 'Module 3 PDF', 'Penjelasan tentang apa saja dalam matkul magang', '20221031102732107.pdf', 'https://github.com/Alfajris/videoDrive/raw/main/Teori%2013%20-%20Virtual%20Reality.pdf', 'https://cdn-icons-png.flaticon.com/512/4726/4726010.png'),
(126, 18, 'File', 'Module 4 PDF', 'Materi awal', '20170222135029-Prosiding 2012.pdf', 'https://github.com/Alfajris/videoDrive/raw/main/teori%2010.%20Webhook.pdf', 'https://cdn-icons-png.flaticon.com/512/4726/4726010.png'),
(127, 18, 'File', 'Module 5 PDF', 'materi 2', 'UTS Pelaporan Kerja_Febriana Riandini_4311901019.pdf', 'http://eprints.ums.ac.id/22030/19/ARTIKEL_ILMIAH.pdf', 'https://cdn-icons-png.flaticon.com/512/4726/4726010.png'),
(128, 47, 'Link', 'Module 2', 'Test', '', 'https://github.com/shiningmyfuture/AplikasiModulDaring-Vid/raw/3048e539cc1969355a28b227e324688a812d5c48/video1622542956.mp4', 'https://cdn-icons-png.flaticon.com/512/5965/5965885.png'),
(129, 47, 'File', 'Module 7 PDF', 'Test', 'DIVISI ACARA 1.pdf', 'https://github.com/Alfajris/videoDrive/raw/main/teori%2010.%20Webhook.pdf', 'https://cdn-icons-png.flaticon.com/512/4726/4726010.png'),
(130, 47, 'Link', 'Module 3', 'Ini Tes 3', '', 'https://github.com/Alfajris/videoDrive/raw/main/rawvideo/keju.mp4', 'https://cdn-icons-png.flaticon.com/512/5965/5965885.png'),
(133, 47, 'Link', 'Module 4', 'Tes112', 'Tes Insert Modul', 'https://github.com/Alfajris/videoDrive/raw/main/rawvideo/keju.mp4', 'https://cdn-icons-png.flaticon.com/512/5965/5965885.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_nilai_guest`
--

CREATE TABLE `tbl_nilai_guest` (
  `id_nilai_guest` int(11) NOT NULL,
  `id_attempt` int(11) NOT NULL,
  `id_matkulguest` int(11) NOT NULL,
  `nilai` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_nilai_mhs`
--

CREATE TABLE `tbl_nilai_mhs` (
  `id_nilai_mhs` int(11) NOT NULL,
  `id_attempt` int(11) NOT NULL,
  `id_matkulmhs` int(11) NOT NULL,
  `nilai` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_nilai_mhs`
--

INSERT INTO `tbl_nilai_mhs` (`id_nilai_mhs`, `id_attempt`, `id_matkulmhs`, `nilai`) VALUES
(171, 16, 10, '100.00'),
(174, 17, 13, '66.67'),
(175, 16, 10, '100.00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_prodi`
--

CREATE TABLE `tbl_prodi` (
  `id_prodi` int(11) NOT NULL,
  `nama_prodi` varchar(200) NOT NULL,
  `id_jurusan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_prodi`
--

INSERT INTO `tbl_prodi` (`id_prodi`, `nama_prodi`, `id_jurusan`) VALUES
(13, 'D4 Teknik Multimedia dan Jaringan', 7),
(19, 'jj', 7),
(20, 'Managerial Accountingyeahh', 7),
(21, 'kons. kapal', 8),
(22, 'Magang', 7),
(23, 'D3 Teknik Informatika', 7),
(24, 'D4 Akutansi Manajerial', 10),
(25, 'D4 Teknik Robotika', 9),
(26, 'D4 Teknik Elektronika Manufaktur', 9),
(27, 'D4 Teknik Elektronika', 9),
(28, 'D3 Teknik Instrumentasi', 9),
(29, 'D4 Mekatronika', 9),
(30, 'D4 Animasi', 7),
(31, 'D3 Teknik Geomatika', 7),
(32, 'D4 Rekayasa Keamanan Siber', 7),
(33, 'D3 Akutansi', 10);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_soal`
--

CREATE TABLE `tbl_soal` (
  `id_soal` int(100) NOT NULL,
  `id_matkul` int(11) NOT NULL,
  `id_modul` int(11) NOT NULL,
  `jenis_soal` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `pertanyaan` varchar(400) CHARACTER SET utf8mb4 NOT NULL,
  `jawab_a` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `jawab_b` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `jawab_c` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `jawab_d` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `jawab_e` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `jawab_option` enum('a','b','c','d','e','f','t') CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_soal`
--

INSERT INTO `tbl_soal` (`id_soal`, `id_matkul`, `id_modul`, `jenis_soal`, `pertanyaan`, `jawab_a`, `jawab_b`, `jawab_c`, `jawab_d`, `jawab_e`, `jawab_option`) VALUES
(61, 17, 120, 'Ganda', 'qewqweqw', 'g', 'b', 'n', 'h', 'r', 'b'),
(62, 17, 120, 'Ganda', 'eew', '1', '2', '3', '4', '5', 'e'),
(63, 17, 120, 'Boolean', 'frakasdlaslk', '', '', '', '', '', 'f'),
(64, 18, 125, 'Boolean', 'dgfkjfdfjgjk', '', '', '', '', '', 'f'),
(65, 18, 125, 'Ganda', 'tertrtrerettrey', 'g', 'h', 'c', 'j', 'y', 'c'),
(66, 18, 125, 'Ganda', 'weqewqweweqwertty', 'y', 'b', 'g', 'r', 'a', 'b');

-- --------------------------------------------------------

--
-- Table structure for table `video_mod`
--

CREATE TABLE `video_mod` (
  `id` int(11) NOT NULL,
  `name` varchar(11255) NOT NULL,
  `urlVideo` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `video_mod`
--

INSERT INTO `video_mod` (`id`, `name`, `urlVideo`, `icon`) VALUES
(1, 'Module 1', 'https://github.com/shiningmyfuture/AplikasiModulDaring-Vid/raw/3048e539cc1969355a28b227e324688a812d5c48/Tutorial%20Flutter%20%231%20-%20Intro%20Pengenalan.mp4', 'https://cdn-icons-png.flaticon.com/512/5965/5965885.png'),
(2, 'Module 2', 'https://github.com/shiningmyfuture/AplikasiModulDaring-Vid/raw/3048e539cc1969355a28b227e324688a812d5c48/video1622542956.mp4', 'https://cdn-icons-png.flaticon.com/512/5965/5965885.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `code_admin`
--
ALTER TABLE `code_admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`),
  ADD KEY `expire` (`expire`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `code_dosen`
--
ALTER TABLE `code_dosen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`),
  ADD KEY `expire` (`expire`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `code_guest`
--
ALTER TABLE `code_guest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `code` (`code`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `code_laboran`
--
ALTER TABLE `code_laboran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`),
  ADD KEY `expire` (`expire`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `code_mahasiswa`
--
ALTER TABLE `code_mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `code` (`code`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `matkul_mhs`
--
ALTER TABLE `matkul_mhs`
  ADD PRIMARY KEY (`id_matkul_mhs`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD KEY `email_admin` (`email_admin`);

--
-- Indexes for table `tbl_attempt`
--
ALTER TABLE `tbl_attempt`
  ADD PRIMARY KEY (`id_attempt`),
  ADD KEY `id_modul` (`id_modul`),
  ADD KEY `id_matkul` (`id_matkul`);

--
-- Indexes for table `tbl_dosen`
--
ALTER TABLE `tbl_dosen`
  ADD PRIMARY KEY (`id_dosen`);

--
-- Indexes for table `tbl_dospengampu`
--
ALTER TABLE `tbl_dospengampu`
  ADD PRIMARY KEY (`id_dospengampu`),
  ADD KEY `id_dosen` (`id_dosen`),
  ADD KEY `id_matkul` (`id_matkul`);

--
-- Indexes for table `tbl_guest`
--
ALTER TABLE `tbl_guest`
  ADD PRIMARY KEY (`id_guest`);

--
-- Indexes for table `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `tbl_jwb_guest`
--
ALTER TABLE `tbl_jwb_guest`
  ADD PRIMARY KEY (`id_jwb_guest`),
  ADD KEY `id_attempt` (`id_attempt`),
  ADD KEY `id_matkulguest` (`id_matkulguest`),
  ADD KEY `id_soal` (`id_soal`);

--
-- Indexes for table `tbl_jwb_mhs`
--
ALTER TABLE `tbl_jwb_mhs`
  ADD PRIMARY KEY (`id_jwb_mhs`),
  ADD KEY `id_attempt` (`id_attempt`),
  ADD KEY `id_soal` (`id_soal`),
  ADD KEY `id_matkulmhs` (`id_matkulmhs`);

--
-- Indexes for table `tbl_laboran`
--
ALTER TABLE `tbl_laboran`
  ADD PRIMARY KEY (`id_laboran`);

--
-- Indexes for table `tbl_labpengampu`
--
ALTER TABLE `tbl_labpengampu`
  ADD PRIMARY KEY (`id_labpengampu`),
  ADD KEY `id_laboran` (`id_lab`),
  ADD KEY `id_matkul` (`id_matkul`);

--
-- Indexes for table `tbl_mahasiswa`
--
ALTER TABLE `tbl_mahasiswa`
  ADD PRIMARY KEY (`id_mhs`);

--
-- Indexes for table `tbl_matakuliah`
--
ALTER TABLE `tbl_matakuliah`
  ADD PRIMARY KEY (`id_matkul`),
  ADD KEY `id_prodi` (`id_prodi`);

--
-- Indexes for table `tbl_matkulguest`
--
ALTER TABLE `tbl_matkulguest`
  ADD PRIMARY KEY (`id_matkulguest`),
  ADD KEY `id_matkul` (`id_matkul`),
  ADD KEY `id_guest` (`id_guest`);

--
-- Indexes for table `tbl_matkulmhs`
--
ALTER TABLE `tbl_matkulmhs`
  ADD PRIMARY KEY (`id_matkulmhs`),
  ADD KEY `id_mhs` (`id_mhs`),
  ADD KEY `id_matkul` (`id_matkul`);

--
-- Indexes for table `tbl_modulpraktik`
--
ALTER TABLE `tbl_modulpraktik`
  ADD PRIMARY KEY (`id_modul`),
  ADD KEY `id_matkul` (`id_matkul`);

--
-- Indexes for table `tbl_nilai_guest`
--
ALTER TABLE `tbl_nilai_guest`
  ADD PRIMARY KEY (`id_nilai_guest`),
  ADD KEY `id_attempt` (`id_attempt`),
  ADD KEY `id_matkulguest` (`id_matkulguest`);

--
-- Indexes for table `tbl_nilai_mhs`
--
ALTER TABLE `tbl_nilai_mhs`
  ADD PRIMARY KEY (`id_nilai_mhs`),
  ADD KEY `id_attempt` (`id_attempt`),
  ADD KEY `id_matkulmhs` (`id_matkulmhs`);

--
-- Indexes for table `tbl_prodi`
--
ALTER TABLE `tbl_prodi`
  ADD PRIMARY KEY (`id_prodi`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indexes for table `tbl_soal`
--
ALTER TABLE `tbl_soal`
  ADD PRIMARY KEY (`id_soal`),
  ADD KEY `id_modul` (`id_modul`),
  ADD KEY `id_matkul` (`id_matkul`);

--
-- Indexes for table `video_mod`
--
ALTER TABLE `video_mod`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `code_admin`
--
ALTER TABLE `code_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `code_dosen`
--
ALTER TABLE `code_dosen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `code_guest`
--
ALTER TABLE `code_guest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `code_laboran`
--
ALTER TABLE `code_laboran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `code_mahasiswa`
--
ALTER TABLE `code_mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `matkul_mhs`
--
ALTER TABLE `matkul_mhs`
  MODIFY `id_matkul_mhs` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbl_attempt`
--
ALTER TABLE `tbl_attempt`
  MODIFY `id_attempt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_dosen`
--
ALTER TABLE `tbl_dosen`
  MODIFY `id_dosen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tbl_dospengampu`
--
ALTER TABLE `tbl_dospengampu`
  MODIFY `id_dospengampu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `tbl_guest`
--
ALTER TABLE `tbl_guest`
  MODIFY `id_guest` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_jwb_guest`
--
ALTER TABLE `tbl_jwb_guest`
  MODIFY `id_jwb_guest` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_jwb_mhs`
--
ALTER TABLE `tbl_jwb_mhs`
  MODIFY `id_jwb_mhs` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT for table `tbl_laboran`
--
ALTER TABLE `tbl_laboran`
  MODIFY `id_laboran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_labpengampu`
--
ALTER TABLE `tbl_labpengampu`
  MODIFY `id_labpengampu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_mahasiswa`
--
ALTER TABLE `tbl_mahasiswa`
  MODIFY `id_mhs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `tbl_matakuliah`
--
ALTER TABLE `tbl_matakuliah`
  MODIFY `id_matkul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `tbl_matkulguest`
--
ALTER TABLE `tbl_matkulguest`
  MODIFY `id_matkulguest` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_matkulmhs`
--
ALTER TABLE `tbl_matkulmhs`
  MODIFY `id_matkulmhs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tbl_modulpraktik`
--
ALTER TABLE `tbl_modulpraktik`
  MODIFY `id_modul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `tbl_nilai_guest`
--
ALTER TABLE `tbl_nilai_guest`
  MODIFY `id_nilai_guest` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_nilai_mhs`
--
ALTER TABLE `tbl_nilai_mhs`
  MODIFY `id_nilai_mhs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `tbl_prodi`
--
ALTER TABLE `tbl_prodi`
  MODIFY `id_prodi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tbl_soal`
--
ALTER TABLE `tbl_soal`
  MODIFY `id_soal` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `video_mod`
--
ALTER TABLE `video_mod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_attempt`
--
ALTER TABLE `tbl_attempt`
  ADD CONSTRAINT `tbl_attempt_ibfk_1` FOREIGN KEY (`id_matkul`) REFERENCES `tbl_matakuliah` (`id_matkul`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_attempt_ibfk_2` FOREIGN KEY (`id_modul`) REFERENCES `tbl_modulpraktik` (`id_modul`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_dospengampu`
--
ALTER TABLE `tbl_dospengampu`
  ADD CONSTRAINT `tbl_dospengampu_ibfk_1` FOREIGN KEY (`id_dosen`) REFERENCES `tbl_dosen` (`id_dosen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_dospengampu_ibfk_2` FOREIGN KEY (`id_matkul`) REFERENCES `tbl_matakuliah` (`id_matkul`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_jwb_guest`
--
ALTER TABLE `tbl_jwb_guest`
  ADD CONSTRAINT `tbl_jwb_guest_ibfk_1` FOREIGN KEY (`id_attempt`) REFERENCES `tbl_attempt` (`id_attempt`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_jwb_guest_ibfk_2` FOREIGN KEY (`id_matkulguest`) REFERENCES `tbl_matkulguest` (`id_matkulguest`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_jwb_guest_ibfk_3` FOREIGN KEY (`id_soal`) REFERENCES `tbl_soal` (`id_soal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_jwb_mhs`
--
ALTER TABLE `tbl_jwb_mhs`
  ADD CONSTRAINT `tbl_jwb_mhs_ibfk_1` FOREIGN KEY (`id_attempt`) REFERENCES `tbl_attempt` (`id_attempt`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_jwb_mhs_ibfk_2` FOREIGN KEY (`id_matkulmhs`) REFERENCES `tbl_matkulmhs` (`id_matkulmhs`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_jwb_mhs_ibfk_3` FOREIGN KEY (`id_soal`) REFERENCES `tbl_soal` (`id_soal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_labpengampu`
--
ALTER TABLE `tbl_labpengampu`
  ADD CONSTRAINT `tbl_labpengampu_ibfk_1` FOREIGN KEY (`id_lab`) REFERENCES `tbl_laboran` (`id_laboran`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_labpengampu_ibfk_2` FOREIGN KEY (`id_matkul`) REFERENCES `tbl_matakuliah` (`id_matkul`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_matakuliah`
--
ALTER TABLE `tbl_matakuliah`
  ADD CONSTRAINT `tbl_matakuliah_ibfk_1` FOREIGN KEY (`id_prodi`) REFERENCES `tbl_prodi` (`id_prodi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_matkulguest`
--
ALTER TABLE `tbl_matkulguest`
  ADD CONSTRAINT `tbl_matkulguest_ibfk_1` FOREIGN KEY (`id_matkul`) REFERENCES `tbl_matakuliah` (`id_matkul`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_matkulguest_ibfk_2` FOREIGN KEY (`id_guest`) REFERENCES `tbl_guest` (`id_guest`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_matkulmhs`
--
ALTER TABLE `tbl_matkulmhs`
  ADD CONSTRAINT `tbl_matkulmhs_ibfk_1` FOREIGN KEY (`id_mhs`) REFERENCES `tbl_mahasiswa` (`id_mhs`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_matkulmhs_ibfk_2` FOREIGN KEY (`id_matkul`) REFERENCES `tbl_matakuliah` (`id_matkul`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_modulpraktik`
--
ALTER TABLE `tbl_modulpraktik`
  ADD CONSTRAINT `tbl_modulpraktik_ibfk_1` FOREIGN KEY (`id_matkul`) REFERENCES `tbl_matakuliah` (`id_matkul`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_nilai_guest`
--
ALTER TABLE `tbl_nilai_guest`
  ADD CONSTRAINT `tbl_nilai_guest_ibfk_1` FOREIGN KEY (`id_attempt`) REFERENCES `tbl_attempt` (`id_attempt`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_nilai_guest_ibfk_2` FOREIGN KEY (`id_matkulguest`) REFERENCES `tbl_matkulguest` (`id_matkulguest`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_nilai_mhs`
--
ALTER TABLE `tbl_nilai_mhs`
  ADD CONSTRAINT `tbl_nilai_mhs_ibfk_1` FOREIGN KEY (`id_attempt`) REFERENCES `tbl_attempt` (`id_attempt`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_nilai_mhs_ibfk_2` FOREIGN KEY (`id_matkulmhs`) REFERENCES `tbl_matkulmhs` (`id_matkulmhs`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_prodi`
--
ALTER TABLE `tbl_prodi`
  ADD CONSTRAINT `tbl_prodi_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `tbl_jurusan` (`id_jurusan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_soal`
--
ALTER TABLE `tbl_soal`
  ADD CONSTRAINT `tbl_soal_ibfk_1` FOREIGN KEY (`id_matkul`) REFERENCES `tbl_matakuliah` (`id_matkul`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_soal_ibfk_2` FOREIGN KEY (`id_modul`) REFERENCES `tbl_modulpraktik` (`id_modul`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

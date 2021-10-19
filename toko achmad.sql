-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2021 at 05:31 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `harga`) VALUES
('B0001', 'Monitor 1080P', 2500000),
('B0002', 'Keyboard Game', 510000),
('B0003', 'Mouse Game', 250000),
('B0004', 'MousePad Game', 80000),
('B0005', 'Mouse logitac', 60000),
('B0006', 'Keyboard logitac', 150000),
('B0007', 'Kabel VGA', 30000),
('B0008', 'Flashdisk 16gb', 50000),
('B0009', 'Hardisk 1TB', 650000),
('B0010', 'Stop Kontak', 15000);

-- --------------------------------------------------------

--
-- Table structure for table `faktur`
--

CREATE TABLE `faktur` (
  `id_faktur` varchar(10) NOT NULL,
  `id_pelangan` varchar(20) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faktur`
--

INSERT INTO `faktur` (`id_faktur`, `id_pelangan`, `tanggal`) VALUES
('F0001', '20211001', '2021-10-10'),
('F0002', '20211002', '2021-10-10'),
('F0003', '20211004', '2021-10-11'),
('F0004', '20211005', '2021-10-12'),
('F0005', '20211008', '2021-10-13'),
('F0006', '20211009', '2021-10-14'),
('F0007', '20211010', '2021-10-14');

-- --------------------------------------------------------

--
-- Table structure for table `faktur_barang`
--

CREATE TABLE `faktur_barang` (
  `id_barang` varchar(20) NOT NULL,
  `id_faktur` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faktur_barang`
--

INSERT INTO `faktur_barang` (`id_barang`, `id_faktur`) VALUES
('B0001', 'F0001'),
('B0005', 'F0001'),
('B0006', 'F0001'),
('B0002', 'F0002'),
('B0010', 'F0002'),
('B0009', 'F0002'),
('B0001', 'F0003'),
('B0003', 'F0003'),
('B0005', 'F0003'),
('B0001', 'F0004'),
('B0006', 'F0004'),
('B0004', 'F0004'),
('B0007', 'F0005'),
('B0008', 'F0005'),
('B0002', 'F0005'),
('B0004', 'F0006'),
('B0002', 'F0006'),
('B0001', 'F0006'),
('B0009', 'F0007'),
('B0006', 'F0007'),
('B0010', 'F0007');

-- --------------------------------------------------------

--
-- Table structure for table `pelangan`
--

CREATE TABLE `pelangan` (
  `id_pelangan` varchar(20) NOT NULL,
  `nama_pelangan` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelangan`
--

INSERT INTO `pelangan` (`id_pelangan`, `nama_pelangan`) VALUES
('20211001', 'Aulia Yunisa'),
('20211002', 'Alimron Aida'),
('20211003', 'Surip Suharto'),
('20211004', 'Iwan Afandi'),
('20211005', 'Saitama Susanto'),
('20211006', 'Sulis Muazin'),
('20211007', 'Zenrasid'),
('20211008', 'Rahmayani'),
('20211009', 'Winda Auliya'),
('20211010', 'Putri Astutik');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `faktur`
--
ALTER TABLE `faktur`
  ADD PRIMARY KEY (`id_faktur`),
  ADD KEY `id_pelangan` (`id_pelangan`);

--
-- Indexes for table `faktur_barang`
--
ALTER TABLE `faktur_barang`
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_faktur` (`id_faktur`);

--
-- Indexes for table `pelangan`
--
ALTER TABLE `pelangan`
  ADD PRIMARY KEY (`id_pelangan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `faktur`
--
ALTER TABLE `faktur`
  ADD CONSTRAINT `id_pelangan` FOREIGN KEY (`id_pelangan`) REFERENCES `pelangan` (`id_pelangan`);

--
-- Constraints for table `faktur_barang`
--
ALTER TABLE `faktur_barang`
  ADD CONSTRAINT `id_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `id_faktur` FOREIGN KEY (`id_faktur`) REFERENCES `faktur` (`id_faktur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

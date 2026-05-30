-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql102.byetcluster.com
-- Generation Time: Oct 01, 2025 at 08:30 AM
-- Server version: 11.4.7-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_39958456_perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin','Pegawai') DEFAULT 'Admin',
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `username`, `password`, `role`, `foto`) VALUES
(1, 'Administrator Utama', 'admin', '12345', 'Admin', NULL),
(2, 'Admin Kedua', 'admin2', '1234', 'Admin', NULL),
(3, 'Wahyu', 'wahyuoyoy', 'wahyu123', 'Admin', 'images (3).jpg');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `nomor_buku` varchar(50) DEFAULT NULL,
  `judul` varchar(150) NOT NULL,
  `pengarang` varchar(100) DEFAULT NULL,
  `penerbit` varchar(100) DEFAULT NULL,
  `tahun_terbit` year(4) DEFAULT NULL,
  `kategori` enum('Fiksi','Non Fiksi','Religius','Referensi') NOT NULL,
  `jumlah_stok` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `nomor_buku`, `judul`, `pengarang`, `penerbit`, `tahun_terbit`, `kategori`, `jumlah_stok`) VALUES
(7, 'A 001', 'Sang Kiyai', 'Coba', 'Gramedia', 2008, 'Fiksi', 7),
(8, 'F 001', 'One Pice', 'Shuesiha', 'Elex Media', 1997, 'Fiksi', 5),
(9, 'F 002', 'Soekarno', 'Taufik adi susilo', 'Garasi House of book', 1970, 'Non Fiksi', 10),
(10, 'L 001', 'Laskar Pelangi', 'Samsul', 'Pasuruan', 2007, 'Fiksi', 10);

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `nama_siswa` varchar(100) NOT NULL,
  `kelas` varchar(20) NOT NULL,
  `kategori` enum('Fiksi','Non Fiksi','Referensi','Religius') NOT NULL,
  `judul_buku` varchar(150) NOT NULL,
  `nomor_buku` varchar(50) DEFAULT NULL,
  `penerbit` varchar(100) NOT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `tgl_jatuh_tempo` date DEFAULT NULL,
  `status` enum('Dipinjam','Kembali') DEFAULT 'Dipinjam'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `nama_siswa`, `kelas`, `kategori`, `judul_buku`, `nomor_buku`, `penerbit`, `tgl_pinjam`, `tgl_jatuh_tempo`, `status`) VALUES
(1, 'Budi Santoso', 'VII A', 'Fiksi', 'Laskar Pelangi', NULL, 'Bentang Pustaka', '2025-09-01', '2025-09-08', 'Kembali'),
(2, 'Siti Aminah', 'VII B', 'Non Fiksi', 'Sejarah Nusantara', NULL, 'Gramedia', '2025-09-01', '2025-09-08', 'Kembali'),
(3, 'Andi Wijaya', 'VII C', 'Referensi', 'Ensiklopedia IPA', NULL, 'Erlangga', '2025-09-02', '2025-09-09', 'Kembali'),
(4, 'Ratna Dewi', 'VII D', 'Fiksi', 'Negeri 5 Menara', NULL, 'Gramedia', '2025-09-02', '2025-09-09', 'Kembali'),
(5, 'Joko Prasetyo', 'VIII A', 'Non Fiksi', 'Atlas Dunia', NULL, 'Erlangga', '2025-09-03', '2025-09-10', 'Kembali'),
(6, 'Lina Marlina', 'VIII B', 'Referensi', 'Kamus Bahasa Indonesia', NULL, 'Balai Pustaka', '2025-09-03', '2025-09-10', 'Kembali'),
(7, 'Budi Santoso', 'VII B', 'Religius', 'Fiqih Dasar', NULL, 'Mizan', '2025-09-12', '2025-09-16', 'Dipinjam'),
(8, 'Fikri', 'VII A', 'Fiksi', 'Kancil', NULL, 'Nabswi', '2025-09-17', '2025-09-20', 'Dipinjam'),
(9, 'Budi', 'VII A', 'Fiksi', 'Doa', NULL, 'Alim', '2025-09-18', '2025-09-21', 'Kembali'),
(10, 'adit', 'IX A', 'Religius', 'Sang Kiyai', 'A 001', 'Gramedia', '2025-09-20', '2025-09-23', 'Kembali'),
(11, 'Samsul', 'VIII A', 'Fiksi', 'Sang Hakim', '09876', 'Gramedia', '2025-10-01', '2025-10-04', 'Dipinjam'),
(12, '', '', 'Fiksi', 'Laskar pelangi', 'L001', 'Pasuruan', '2025-10-01', '2025-10-04', 'Kembali');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_pengembalian` int(11) NOT NULL,
  `id_peminjaman` int(11) DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `denda` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`id_pengembalian`, `id_peminjaman`, `tgl_kembali`, `denda`) VALUES
(1, 3, '2025-09-05', 0),
(2, 6, '2025-09-07', 0),
(3, 1, '2025-09-17', 9000),
(4, 9, '2025-09-18', 0),
(5, 2, '2025-09-21', 13000),
(6, 4, '2025-09-21', 12000),
(7, 10, '2025-10-01', 8000),
(8, 12, '2025-10-01', 0),
(9, 5, '2025-10-01', 21000);

-- --------------------------------------------------------

--
-- Table structure for table `pengunjung`
--

CREATE TABLE `pengunjung` (
  `id_pengunjung` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `tgl_kunjung` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengunjung`
--

INSERT INTO `pengunjung` (`id_pengunjung`, `id_siswa`, `tgl_kunjung`) VALUES
(1, 1, '2025-09-30'),
(2, 1, '2025-10-01'),
(3, 2, '2025-10-01');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `nis` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kelas` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nis`, `nama`, `kelas`) VALUES
(1, '112', 'Samsul', 'VIII A'),
(2, '0987644', 'Agil', 'IX D');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id_pengembalian`),
  ADD KEY `id_peminjaman` (`id_peminjaman`);

--
-- Indexes for table `pengunjung`
--
ALTER TABLE `pengunjung`
  ADD PRIMARY KEY (`id_pengunjung`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD UNIQUE KEY `nis` (`nis`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id_pengembalian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pengunjung`
--
ALTER TABLE `pengunjung`
  MODIFY `id_pengunjung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `pengembalian_ibfk_1` FOREIGN KEY (`id_peminjaman`) REFERENCES `peminjaman` (`id_peminjaman`);

--
-- Constraints for table `pengunjung`
--
ALTER TABLE `pengunjung`
  ADD CONSTRAINT `pengunjung_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

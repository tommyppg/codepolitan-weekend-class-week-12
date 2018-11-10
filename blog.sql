-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2018 at 03:49 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--
CREATE DATABASE IF NOT EXISTS `blog` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `blog`;

-- --------------------------------------------------------

--
-- Table structure for table `artikel`
--

CREATE TABLE `artikel` (
  `id_artikel` int(11) NOT NULL,
  `judul_artikel` varchar(100) NOT NULL,
  `isi_artikel` text NOT NULL,
  `author_artikel` varchar(50) NOT NULL,
  `tanggal_artikel` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gambar_artikel` varchar(100) DEFAULT NULL,
  `id_kategori` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artikel`
--

INSERT INTO `artikel` (`id_artikel`, `judul_artikel`, `isi_artikel`, `author_artikel`, `tanggal_artikel`, `gambar_artikel`, `id_kategori`) VALUES
(1, 'Library JavaScript Menarik Tahun 2018', 'Dengan naik daun Bahasa Pemrograman JavaScript tentu para Developer akan menggali apakah yang membuat JavaScript tersebut menjadi Bahasa Pemrograman terpopuler, yang telah dilansir oleh StackOverflow dalam Surveynya tahun 2018. Tidak terlepas dari itu semua, Framework dan Library JavaScript merupakan alasan yang membuat JavaScript menjadi hebat seperti saat ini. Namun pada artikel kali ini akan membahasa Library JavaScript yang menarik untuk dipelajari di tahun 2018.', 'Codepolitan', '2018-11-07 14:47:52', NULL, 2),
(2, '100 Fungsi Paling Populer di PHP', 'PHP memiliki ribuan fungsi bawaan yang tentu tidak semuanya kita gunakan dalam proses pembuatan aplikasi. Diantara ribuan fungsi tersebut, ada 100 fungsi bawaan PHP yang paling sering oleh PHP Developer, berikut ini daftar lengkapnya:', 'Codepolitan', '2018-11-07 14:47:55', NULL, 1),
(3, 'Membangun Desktop App dengan 5 Framework Javascript', 'Tidak bisa kita pungkiri bahwa Javascript memang bahasa terbaik saat ini, yang telah dibuktikan dengan keunggulan pada framework dan library-nya. Javascript saat ini bukan hanya fokus pada website tetapi juga dapat diterapkan pada platform mobile dan desktop. Dilansir dari website brainhub.ue yang merupakan website yang bertujuan membangun Produk digital dalam pengembangan perangkat lunak Javascript bahwa terdapat 5 Framework Javascript terbaik untuk Aplikasi Desktop.', 'Codepolitan', '2018-11-07 14:47:57', NULL, 2),
(4, 'Empat Library Animasi Paling TOP Untuk Android', 'Animasi merupakan salah satu fitur aplikasi Andorid yang bisa memberikan pengalaman berbeda. Tanpa animasi apapun asal memliki fungsi yang berjalan dengan baik, aplikasi kita sudah cukup diterima pengguna. Meski begitu sentuhan manis berupa animasi yang menarik dapat memberikan kesan yang berbeda dibandingkan aplikasi lain di mata pengguna.', 'Tommy', '2018-11-07 14:47:59', NULL, 2),
(5, 'Programming Mantap Bangetsssss', 'asdfasdf', 'asdfasdf', '2018-11-07 15:20:18', '467a804840f60ae13965efc11e9f4572.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'PHP'),
(2, 'Javascript'),
(3, 'HTML'),
(4, 'CSS');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `nama_role` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id_role`, `nama_role`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_depan` varchar(50) NOT NULL,
  `nama_belakang` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_depan`, `nama_belakang`, `username`, `password`, `id_role`) VALUES
(1, 'Admin', 'Admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id_artikel`),
  ADD KEY `RELASI_KATEGORI` (`id_kategori`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `RELASI_ROLE` (`id_role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id_artikel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artikel`
--
ALTER TABLE `artikel`
  ADD CONSTRAINT `RELASI_KATEGORI` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `RELASI_ROLE` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Apr 2023 pada 22.07
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_siakad`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `nip` int(11) NOT NULL,
  `akronim` char(3) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`nip`, `akronim`, `nama`) VALUES
(201203320, 'WRJ', 'Warjiyono'),
(201203321, 'ROU', 'Rousyati'),
(201203322, 'SLN', 'Suleman'),
(201203323, 'DTO', 'Dany Pratmanto'),
(201203324, 'FND', 'Fandhilah'),
(201203325, 'ITZ', 'Imam Tazali'),
(201203326, 'HNF', 'Husni Faqih'),
(201203327, 'SOP', 'Sopian Aji'),
(201203328, 'HUB', 'Husni Mubarok'),
(201203329, 'AXR', 'Angga Ardiansyah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `kd_kelas` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `kd_matkul` char(3) NOT NULL,
  `nip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`kd_kelas`, `tahun`, `semester`, `kd_matkul`, `nip`) VALUES
(2130101, 2021, 6, 'WP3', 201203328),
(2130201, 2021, 2, 'DPG', 201203322),
(2130202, 2021, 2, 'ADP', 201203329),
(2130301, 2021, 2, 'AKD', 201203326);

-- --------------------------------------------------------

--
-- Struktur dari tabel `krs`
--

CREATE TABLE `krs` (
  `id` int(11) NOT NULL,
  `kd_kelas` int(11) NOT NULL,
  `nim` int(11) NOT NULL,
  `nilai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `krs`
--

INSERT INTO `krs` (`id`, `kd_kelas`, `nim`, `nilai`) VALUES
(1, 2130301, 12210101, 95),
(2, 2130301, 12210102, 55),
(3, 2130301, 12210102, 55),
(4, 2130301, 12210103, 70),
(5, 2130301, 12210107, 90),
(6, 2130101, 12190122, 85);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kelas` char(8) NOT NULL,
  `telepon` varchar(25) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `kd_prodi` char(3) NOT NULL,
  `nip_pemb_ta` int(11) DEFAULT NULL,
  `nip_dosen_pa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `kelas`, `telepon`, `alamat`, `kd_prodi`, `nip_pemb_ta`, `nip_dosen_pa`) VALUES
(11210101, 'Ayu Sekar', '11.2A.35', NULL, NULL, 'SIA', NULL, 201203320),
(12190122, 'Afdhal Nurachman', '12.6A.35', NULL, NULL, 'SI', 201203326, 201203320),
(12210101, 'Amira Afifa Nahda', '12.2A.35', '028320201010', 'Slawi', 'SI', NULL, 201203326),
(12210102, 'Bagus Sulistyo', '12.2A.35', NULL, NULL, 'SI', NULL, 201203326),
(12210103, 'Muhammad Arya', '12.2A.35', NULL, NULL, 'SI', NULL, 201203326),
(12210104, 'Muhammad Bagus Akbar', '12.2B.35', NULL, NULL, 'SI', NULL, 201203321),
(12210105, 'Indah Setianingrum', '12.2B.35', NULL, NULL, 'SI', NULL, 201203321),
(12210106, 'Arya Gustrian', '12.2B.35', NULL, NULL, 'SI', NULL, 201203321),
(12210107, 'Intan Nisya', '12.2A.35', NULL, NULL, 'SI', NULL, 201203326),
(13210101, 'Hendri Aditya', '13.2A.35', NULL, NULL, 'TK', NULL, 201203322),
(13210102, 'Muhammad Ridho', '13.2A.35', NULL, NULL, 'TK', NULL, 201203322);

-- --------------------------------------------------------

--
-- Struktur dari tabel `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kd_matkul` char(3) NOT NULL,
  `nm_matkul` varchar(50) NOT NULL,
  `sks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `matakuliah`
--

INSERT INTO `matakuliah` (`kd_matkul`, `nm_matkul`, `sks`) VALUES
('ADP', 'Akutansi Dasar & Praktik', 3),
('AKD', 'Aplikasi Basis Data', 3),
('DPG', 'Dasar Pemrograman', 4),
('LGA', 'Logika & Algoritma', 4),
('MPG', 'Mobile Programming', 3),
('MPP', 'Metode Perancangan Program', 3),
('SIM', 'Sistem Informasi Manajemen', 3),
('WP1', 'Web Programming I', 4),
('WP2', 'Web Programming II', 4),
('WP3', 'Web Programming III', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `prasyarat`
--

CREATE TABLE `prasyarat` (
  `id` int(11) NOT NULL,
  `kd_matkul` char(3) NOT NULL,
  `kd_matkul_p` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `prasyarat`
--

INSERT INTO `prasyarat` (`id`, `kd_matkul`, `kd_matkul_p`) VALUES
(1, 'WP1', 'DPG'),
(2, 'WP1', 'AKD'),
(3, 'WP2', 'WP1'),
(4, 'WP3', 'WP2'),
(5, 'MPG', 'DPG');

-- --------------------------------------------------------

--
-- Struktur dari tabel `prodi`
--

CREATE TABLE `prodi` (
  `kd_prodi` char(3) NOT NULL,
  `nm_prodi` varchar(30) NOT NULL,
  `jenjang` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `prodi`
--

INSERT INTO `prodi` (`kd_prodi`, `nm_prodi`, `jenjang`) VALUES
('SI', 'Sistem Informasi', 'D3'),
('SIA', 'Sistem Informasi Akutansi', 'D3'),
('TK', 'Teknologi Informasi', 'D3');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nip`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`kd_kelas`),
  ADD KEY `kd_matkul` (`kd_matkul`),
  ADD KEY `nip` (`nip`);

--
-- Indeks untuk tabel `krs`
--
ALTER TABLE `krs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kd_kelas` (`kd_kelas`),
  ADD KEY `nim` (`nim`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `kd_prodi` (`kd_prodi`),
  ADD KEY `nip_pemb_ta` (`nip_pemb_ta`),
  ADD KEY `nip_dosen_pa` (`nip_dosen_pa`);

--
-- Indeks untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`kd_matkul`);

--
-- Indeks untuk tabel `prasyarat`
--
ALTER TABLE `prasyarat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kd_matkul` (`kd_matkul`),
  ADD KEY `kd_matkul_p` (`kd_matkul_p`);

--
-- Indeks untuk tabel `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`kd_prodi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `krs`
--
ALTER TABLE `krs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `prasyarat`
--
ALTER TABLE `prasyarat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`kd_matkul`) REFERENCES `matakuliah` (`kd_matkul`),
  ADD CONSTRAINT `kelas_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `dosen` (`nip`);

--
-- Ketidakleluasaan untuk tabel `krs`
--
ALTER TABLE `krs`
  ADD CONSTRAINT `krs_ibfk_1` FOREIGN KEY (`kd_kelas`) REFERENCES `kelas` (`kd_kelas`),
  ADD CONSTRAINT `krs_ibfk_2` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`);

--
-- Ketidakleluasaan untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi` (`kd_prodi`),
  ADD CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`nip_pemb_ta`) REFERENCES `dosen` (`nip`),
  ADD CONSTRAINT `mahasiswa_ibfk_3` FOREIGN KEY (`nip_dosen_pa`) REFERENCES `dosen` (`nip`);

--
-- Ketidakleluasaan untuk tabel `prasyarat`
--
ALTER TABLE `prasyarat`
  ADD CONSTRAINT `prasyarat_ibfk_1` FOREIGN KEY (`kd_matkul`) REFERENCES `matakuliah` (`kd_matkul`),
  ADD CONSTRAINT `prasyarat_ibfk_2` FOREIGN KEY (`kd_matkul_p`) REFERENCES `matakuliah` (`kd_matkul`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

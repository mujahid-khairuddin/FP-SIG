-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jan 2021 pada 09.53
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webgis-ci`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_kategori_hotspot`
--

CREATE TABLE `m_kategori_hotspot` (
  `id_kategori_hotspot` int(11) NOT NULL,
  `kd_kategori_hotspot` varchar(10) DEFAULT 'NULL',
  `nm_kategori_hotspot` varchar(50) NOT NULL,
  `marker` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_kategori_hotspot`
--

INSERT INTO `m_kategori_hotspot` (`id_kategori_hotspot`, `kd_kategori_hotspot`, `nm_kategori_hotspot`, `marker`) VALUES
(1, '001', 'SUSPEK PENGAWASAN', 'Suspek.png'),
(2, '002', 'RAPID REAKTIF', 'Reaktif.png'),
(3, '003', 'POSITIF COVID-19', 'Positif.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_kecamatan`
--

CREATE TABLE `m_kecamatan` (
  `id_kecamatan` int(11) NOT NULL,
  `kd_kecamatan` varchar(10) NOT NULL,
  `nm_kecamatan` varchar(30) NOT NULL,
  `geojson_kecamatan` varchar(30) NOT NULL,
  `warna_kecamatan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_kecamatan`
--

INSERT INTO `m_kecamatan` (`id_kecamatan`, `kd_kecamatan`, `nm_kecamatan`, `geojson_kecamatan`, `warna_kecamatan`) VALUES
(59, '32.08.10', 'CIAWIGEBANG', 'CIAWIGEBANG1.geojson', '#000000'),
(60, '32.08.28', 'CIBEUREUM', 'CIBEUREUM.geojson', '#8c8c8c'),
(61, '32.08.05', 'CIBINGBIN', 'CIBINGBIN.geojson', '#7e7777'),
(62, '32.08.11', 'CIDAHU', 'CIDAHU.geojson', '#682c2c'),
(63, '32.08.32', 'CIGANDAMEKAR', 'CIGANDAMEKAR.geojson', '#ffb3b3'),
(64, '32.08.18', 'CIGUGUR', 'CIGUGUR.geojson', '#ff0000'),
(65, '32.08.25', 'CILEBAK', 'CILEBAK.geojson', '#895252'),
(66, '32.08.13', 'CILIMUS', 'CILIMUS.geojson', '#ce97b7'),
(67, '32.08.24', 'CIMAHI', 'CIMAHI.geojson', '#baad87'),
(68, '32.08.02', 'CINIRU', 'CINIRU.geojson', '#a01889'),
(69, '32.08.21', 'CIPICUNG', 'CIPICUNG.geojson', '#7a96d6'),
(70, '32.08.04', 'CIWARU', 'CIWARU.geojson', '#987bdb'),
(71, '32.08.17', 'DARMA', 'DARMA.geojson', '#8d50d7'),
(72, '32.08.08', 'GARAWANGI', 'GARAWANGI.geojson', '#c1420b'),
(73, '32.08.12', 'JALAKSANA', 'JALAKSANA.geojson', '#800000'),
(74, '32.08.23', 'JAPARA', 'JAPARA.geojson', '#ff7575'),
(75, '32.08.01', 'KADUGEDE', 'KADUGEDE.geojson', '#00ffbf'),
(76, '32.08.27', 'KALIMANGGIS', 'KALIMANGGIS.geojson', '#1981f0'),
(77, '32.08.16', 'KRAMATMULYA', 'KRAMATMULYA.geojson', '#ff00d4'),
(78, '32.08.09', 'KUNINGAN', 'KUNINGAN.geojson', '#00ff33'),
(79, '32.08.07', 'LEBAKWANGI', 'LEBAKWANGI.geojson', '#fff700'),
(80, '32.08.06', 'LURAGUNG', 'LURAGUNG.geojson', '#018328'),
(81, '32.08.30', 'MALEBER', 'MALEBER.geojson', '#7e17fd'),
(82, '32.08.14', 'MANDIRANCAN', 'MANDIRANCAN.geojson', '#938c25'),
(83, '32.08.20', 'NUSAHERANG', 'NUSAHERANG.geojson', '#00b3ff'),
(84, '32.08.22', 'PANCALANG', 'PANCALANG.geojson', '#15647e'),
(85, '32.08.19', 'PASAWAHAN', 'PESAWAHAN.geojson', '#bababa'),
(86, '32.08.15', 'SELAJAMBE', 'SELAJAMBE.geojson', '#8c00ff');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `nm_pengguna` varchar(20) NOT NULL,
  `kt_sandi` varchar(150) NOT NULL,
  `level` enum('Admin','User') NOT NULL DEFAULT 'User'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `nm_pengguna`, `kt_sandi`, `level`) VALUES
(1, 'admin', '$2y$10$oNX.X8jgLhNclHBeI8ytT.1vODlml8.AN1Ieb.rSIChhCa1e7cS0S', 'Admin'),
(2, 'user', '$2y$10$oNX.X8jgLhNclHBeI8ytT.1vODlml8.AN1Ieb.rSIChhCa1e7cS0S', 'User');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_hotspot`
--

CREATE TABLE `t_hotspot` (
  `id_hotspot` int(11) NOT NULL,
  `id_kecamatan` int(11) NOT NULL,
  `id_kategori_hotspot` int(11) NOT NULL,
  `lokasi` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `lat` float(9,6) NOT NULL,
  `lng` float(9,6) NOT NULL,
  `tanggal` date NOT NULL,
  `polygon` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_hotspot`
--

INSERT INTO `t_hotspot` (`id_hotspot`, `id_kecamatan`, `id_kategori_hotspot`, `lokasi`, `keterangan`, `lat`, `lng`, `tanggal`, `polygon`) VALUES
(86, 59, 1, 'Ciawigebang', 'Suspek : 4\r\nReaktif : 9\r\nPositif : 12', -6.929770, 108.600533, '2020-12-30', ''),
(89, 85, 1, 'Pasawahan', 'Suspek : 0\r\nReaktif : 0\r\nPositif : 7', -6.805630, 108.426407, '2020-12-30', ''),
(90, 82, 1, 'Mandirancan', 'Suspek : 0\r\nReaktif : 0\r\nPositif : 26', -6.844610, 108.459518, '2020-12-30', ''),
(91, 84, 1, 'Pancalang', 'Suspek : 0\r\nReaktif : 2\r\nPositif : 7', -6.820874, 108.490021, '2020-12-30', ''),
(92, 66, 1, 'Cilimus', 'Suspek : 0\r\nReaktif : 2\r\nPositif : 19', -6.820874, 108.490021, '2021-01-06', ''),
(93, 63, 1, 'Cigandamekar', 'Suspek : 0\r\nReaktif : 0\r\nPositif : 3', -6.886119, 108.529854, '2020-12-30', ''),
(94, 73, 1, 'Jalaksana', 'Suspek : 2\r\nReaktif : 6\r\nPositif : 5', -6.911915, 108.453918, '2020-12-30', ''),
(95, 77, 1, 'Kramatmulya', 'Suspek : 1\r\nReaktif : 7\r\nPositif : 16', -6.940887, 108.493858, '2020-12-30', ''),
(96, 64, 1, 'Cigugur', 'Suspek : 4\r\nReaktif : 4\r\nPositif : 24', -6.967545, 108.453033, '2020-12-30', ''),
(97, 74, 1, 'Japara', 'Suspek : 0\r\nReaktif : 0\r\nPositif : 0', -6.908470, 108.533653, '2020-12-30', ''),
(98, 69, 1, 'Cipicung', 'Suspek : 0\r\nReaktif : 3\r\nPositif : 1', -6.939832, 108.549210, '2020-12-30', ''),
(99, 78, 1, 'Kuningan', 'Suspek : 8\r\nReaktif : 14\r\nPositif : 61', -6.983352, 108.493439, '2020-12-30', ''),
(100, 71, 1, 'Darma', 'Suspek : 3\r\nReaktif : 4\r\nPositif : 14', -7.007460, 108.401985, '2020-12-30', ''),
(101, 83, 1, 'Nusaherang', 'Suspek : 0\r\nReaktif : 1\r\nPositif : 14', -7.015378, 108.433563, '2020-12-30', ''),
(102, 75, 1, 'Kadugede', 'Suspek : 3\r\nReaktif : 3\r\nPositif : 12', -7.006716, 108.458214, '2020-12-30', ''),
(103, 72, 1, 'Garawangi', 'Suspek : 3\r\nReaktif : 4\r\nPositif : 19', -7.010514, 108.525742, '2020-12-30', ''),
(104, 76, 1, 'Kalimanggis', 'Suspek : 1\r\nReaktif : 0\r\nPositif : 3', -6.954041, 108.622429, '2020-12-30', ''),
(105, 62, 1, 'Cidahu', 'Suspek : 2\r\nReaktif : 0\r\nPositif : 7', -6.969032, 108.658356, '2020-12-30', ''),
(106, 80, 1, 'Luragung', 'Suspek : 2\r\nReaktif : 3\r\nPositif : 12', -7.016142, 108.630356, '2020-12-30', ''),
(107, 67, 1, 'Cimahi', 'Suspek : 2\r\nReaktif : 0\r\nPositif : 4', -7.002569, 108.700073, '2020-12-30', ''),
(108, 68, 1, 'Ciniru', 'Suspek : 2\r\nReaktif : 1\r\nPositif : 0', -7.059504, 108.519745, '2020-12-30', ''),
(109, 81, 1, 'Maleber', 'Suspek : 4\r\nReaktif : 1\r\nPositif : 13', -7.057510, 108.576614, '2020-12-30', ''),
(110, 70, 1, 'Ciwaru', 'Suspek : 1\r\nReaktif : 1\r\nPositif : 8', -7.103106, 108.626259, '2020-12-30', ''),
(111, 60, 1, 'Cibeureum', 'Suspek : 0\r\nReaktif : 0\r\nPositif : 0\r\n\r\nDATA TIDAK ADA/TIDAK JELAS', -7.074652, 108.716225, '2020-12-30', ''),
(112, 61, 1, 'Cibingbin', 'Suspek : 1\r\nReaktif : 0\r\nPositif : 0', -7.061196, 108.757271, '2020-12-30', ''),
(113, 86, 1, 'Selajambe', 'Suspek : 0\r\nReaktif : 0\r\nPositif : 0', -7.102625, 108.466461, '2020-12-30', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `m_kategori_hotspot`
--
ALTER TABLE `m_kategori_hotspot`
  ADD PRIMARY KEY (`id_kategori_hotspot`);

--
-- Indeks untuk tabel `m_kecamatan`
--
ALTER TABLE `m_kecamatan`
  ADD PRIMARY KEY (`id_kecamatan`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indeks untuk tabel `t_hotspot`
--
ALTER TABLE `t_hotspot`
  ADD PRIMARY KEY (`id_hotspot`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `m_kategori_hotspot`
--
ALTER TABLE `m_kategori_hotspot`
  MODIFY `id_kategori_hotspot` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `m_kecamatan`
--
ALTER TABLE `m_kecamatan`
  MODIFY `id_kecamatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `t_hotspot`
--
ALTER TABLE `t_hotspot`
  MODIFY `id_hotspot` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 01, 2021 lúc 07:39 PM
-- Phiên bản máy phục vụ: 10.4.19-MariaDB
-- Phiên bản PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nongsanabc`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdathang`
--

CREATE TABLE `chitietdathang` (
  `DATHANG_ID` int(11) NOT NULL,
  `SANPHAM_ID` int(11) NOT NULL,
  `CHITIETDATHANG_SOLUONG` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `chitietdathang`
--

INSERT INTO `chitietdathang` (`DATHANG_ID`, `SANPHAM_ID`, `CHITIETDATHANG_SOLUONG`) VALUES
(531231295, 990888313, 2),
(531231296, 324, 1),
(531231296, 917761117, 3),
(531231296, 990888314, 5),
(531231297, 990888311, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhgia`
--

CREATE TABLE `danhgia` (
  `KHACHHANG_ID` int(11) NOT NULL,
  `SANPHAM_ID` int(11) NOT NULL,
  `DANHGIA_NOIDUNG` varchar(500) DEFAULT NULL,
  `DANHGIA_SOSAO` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `danhgia`
--

INSERT INTO `danhgia` (`KHACHHANG_ID`, `SANPHAM_ID`, `DANHGIA_NOIDUNG`, `DANHGIA_SOSAO`) VALUES
(0, 324, '312321', '5.00'),
(0, 333133121, 'Chưa có đánh giá', '5.00'),
(0, 917761117, 'Chưa có đánh giá', '5.00'),
(0, 990888308, 'Chưa có đánh giá', '5.00'),
(0, 990888311, 'Chưa có đánh giá', '5.00'),
(0, 990888312, 'Chưa có đánh giá', '5.00'),
(0, 990888313, 'Chưa có đánh giá', '5.00'),
(0, 990888314, 'Chưa có đánh giá', '5.00'),
(0, 990888315, 'Chưa có đánh giá', '5.00'),
(0, 990888316, 'Chưa có đánh giá', '5.00'),
(0, 990888317, 'Chưa có đánh giá', '5.00'),
(0, 990888318, 'Chưa có đánh giá', '5.00'),
(0, 990888319, 'Chưa có đánh giá', '5.00'),
(0, 990888320, 'Chưa có đánh giá', '5.00'),
(0, 990888321, 'Chưa có đánh giá', '5.00'),
(0, 990888322, 'Chưa có đánh giá', '5.00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dathang`
--

CREATE TABLE `dathang` (
  `DATHANG_ID` int(11) NOT NULL,
  `TENDANGNHAP` varchar(20) NOT NULL,
  `KHACHHANG_ID` int(11) NOT NULL,
  `DATHANG_TRANGTHAI` varchar(20) DEFAULT NULL,
  `DATHANG_NGAYDAT` varchar(11) DEFAULT NULL,
  `DATHANG_NGAYGIAO` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `dathang`
--

INSERT INTO `dathang` (`DATHANG_ID`, `TENDANGNHAP`, `KHACHHANG_ID`, `DATHANG_TRANGTHAI`, `DATHANG_NGAYDAT`, `DATHANG_NGAYGIAO`) VALUES
(531231295, 'noone', 35, 'Chờ duyệt', '01-08-2021', 'Chưa rõ'),
(531231296, 'noone', 35, 'Hủy', '01-08-2021', 'Chưa rõ'),
(531231297, 'noone', 35, 'Chờ duyệt', '01-08-2021', 'Chưa rõ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

CREATE TABLE `giohang` (
  `KHACHHANG_ID` int(11) NOT NULL,
  `SANPHAM_ID` int(11) NOT NULL,
  `GIOHANG_SOLUONG` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `KHACHHANG_ID` int(11) NOT NULL,
  `KHACHHANG_TEN` varchar(50) DEFAULT NULL,
  `KHACHHANG_SDT` int(20) NOT NULL,
  `KHACHHANG_PHAI` varchar(3) DEFAULT NULL,
  `KHACHHANG_DIACHI` varchar(200) DEFAULT NULL,
  `KHACHHANG_NGAYSINH` varchar(11) DEFAULT NULL,
  `KHACHHANG_MATKHAU` varchar(500) NOT NULL,
  `KHACHHANG_ANH_URL` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`KHACHHANG_ID`, `KHACHHANG_TEN`, `KHACHHANG_SDT`, `KHACHHANG_PHAI`, `KHACHHANG_DIACHI`, `KHACHHANG_NGAYSINH`, `KHACHHANG_MATKHAU`, `KHACHHANG_ANH_URL`) VALUES
(0, 'Không ai', 0, 'Nam', 'noaddress', '1111-11-11', '1', 'images/avatarcustomer/noname.jpg'),
(35, 'Vo Mình Thong', 1234567890, 'Nam', 'Soc Trang', '01/08/2021', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'images/avatarcustomer/noname.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai`
--

CREATE TABLE `loai` (
  `LOAI_ID` int(11) NOT NULL,
  `LOAI_TEN` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `loai`
--

INSERT INTO `loai` (`LOAI_ID`, `LOAI_TEN`) VALUES
(1, 'Gia vị'),
(2, 'Thức uống'),
(3, 'Rau củ'),
(4, 'Trái cây');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `noisanxuat`
--

CREATE TABLE `noisanxuat` (
  `NOISANXUAT_ID` int(11) NOT NULL,
  `NOISANXUAT_TEN` varchar(50) DEFAULT NULL,
  `NOISANXUAT_DIACHI` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `noisanxuat`
--

INSERT INTO `noisanxuat` (`NOISANXUAT_ID`, `NOISANXUAT_TEN`, `NOISANXUAT_DIACHI`) VALUES
(1, 'Công ty hóa nông lúa vàng', '123A, Ninh Kiều, Cần Thơ'),
(2, 'Công ty thực phẩm Thanh Sơn', '223 Bình Điền, Long An'),
(3, 'Công ty Bách Hóa Xanh', 'Cần Thơ, Hậu Giang');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quantri`
--

CREATE TABLE `quantri` (
  `TENDANGNHAP` varchar(20) NOT NULL,
  `MATKHAU` varchar(500) DEFAULT NULL,
  `VAITRO` varchar(20) DEFAULT NULL,
  `HOTEN` varchar(50) DEFAULT NULL,
  `PHAI` varchar(3) DEFAULT NULL,
  `NGAYSINH` date DEFAULT NULL,
  `SODIENTHOAI` varchar(20) DEFAULT NULL,
  `DIACHI` varchar(200) DEFAULT NULL,
  `ANHDAIDIEN` varchar(200) DEFAULT NULL,
  `TRANGTHAI` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `quantri`
--

INSERT INTO `quantri` (`TENDANGNHAP`, `MATKHAU`, `VAITRO`, `HOTEN`, `PHAI`, `NGAYSINH`, `SODIENTHOAI`, `DIACHI`, `ANHDAIDIEN`, `TRANGTHAI`) VALUES
('admin', 'admin', 'Admin', 'admin', 'Nam', '1111-01-01', '1', 'Nhà', 'images/avataradmin/admin.png', 'Kích hoạt'),
('noone', 'noone', 'Thành viên', 'Không ai', 'Nam', '1111-11-22', '000000000', 'noaddress', 'images/avataradmin/noone.png', 'Kích hoạt'),
('vmt', '1', 'Thành viên', 'Võ Minh Thông', 'Nữ', '1111-11-11', '0376347325', 'C120/5 Ấp 5 Long Phú, Sóc Trăng', 'images/avataradmin/avataradmin.png', 'Kích hoạt'),
('vmt2', '2', 'Thành viên', 'Võ Minh Thông Hai', 'Nam', '1999-05-01', '0123456789', 'Cần Thơ', 'images/avataradmin/vmt2.png', 'Kích hoạt'),
('vmt3', '3', 'Thành viên', 'Võ Minh Thông 3', 'Nam', '1999-05-01', '0123456789', 'Sóc Trăng', 'images/avataradmin/vmt3.png', 'Kích hoạt'),
('vmt4', '4', 'Thành viên', 'VO MINH THONG 4', 'Nam', '1993-05-01', '012346789', 'Cà Mau', 'images/avataradmin/vmt4.png', 'Kích hoạt');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `SANPHAM_ID` int(11) NOT NULL,
  `SANPHAM_TEN` varchar(50) DEFAULT NULL,
  `SANPHAM_SOLUONG` decimal(8,0) DEFAULT NULL,
  `SANPHAM_DONGIA` int(11) NOT NULL,
  `SANPHAM_MOTA` varchar(200) DEFAULT NULL,
  `SANPHAM_URL` varchar(200) DEFAULT NULL,
  `NOISANXUAT_ID` int(11) NOT NULL,
  `LOAI_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`SANPHAM_ID`, `SANPHAM_TEN`, `SANPHAM_SOLUONG`, `SANPHAM_DONGIA`, `SANPHAM_MOTA`, `SANPHAM_URL`, `NOISANXUAT_ID`, `LOAI_ID`) VALUES
(324, 'Bột ngọt', '34', 15000, 'Đơn vị: 1kg\r\nTên: Ajinomoto', 'images/products/1626140187.jpg', 3, 1),
(333133121, 'Muối', '75', 9000, 'Đơn vị: 1kg\r\nTên: Vifon', 'images/products/1626144227.jpg', 1, 1),
(917761117, 'Trà đen', '97', 20000, 'Đơn vị: gói 500 gram', 'images/products/1626144122.jpg', 3, 2),
(990888308, 'Dưa lưới', '100', 35000, 'Dưa lưới ngon ngọt từ Newziland', 'images/products/1626153813.jpg', 2, 4),
(990888311, 'Cà chua', '99', 9500, 'Đơn vị: 1kg', 'images/products/1626582624.png', 3, 3),
(990888312, 'Ổi', '150', 9000, 'Ổi ngon ngọt bổ dưỡng', 'images/products/1627218431.png', 2, 4),
(990888313, 'Sầu riêng', '140', 150000, 'Béo ngậy', 'images/products/1627218498.jpg', 1, 4),
(990888314, 'Xoài chua', '118', 25000, 'Cực kì chua', 'images/products/1627224243.jpg', 2, 4),
(990888315, 'Tiêu', '150', 20000, 'Đơn vị: Hộp 500 gram', 'images/products/1627466178.jpg', 3, 1),
(990888316, 'Nước tăng lực Sting', '120', 120000, 'Đơn vị: Thùng', 'images/products/1627466306.jpg', 3, 2),
(990888317, 'Cà phê Wake Up 247', '152', 150000, 'Đơn vị: Thùng (30 chai)', 'images/products/1627466445.jpg', 3, 2),
(990888318, 'Cà rốt Đà Lạt', '152', 22000, 'Đơn vị: Kg, xuất xứ từ Đà Lạt', 'images/products/1627746906.jpg', 3, 3),
(990888319, 'Khoai lang tím', '200', 20000, 'Đơn vị: kg, xuất xứ miền Tây', 'images/products/1627746957.jpg', 3, 3),
(990888320, 'Khoai tây Đà Lạt', '300', 25000, 'Đơn vị: kg, xuất xứ Đà Lạt', 'images/products/1627747075.jpg', 2, 3),
(990888321, 'Củ dền Đà Lạt', '250', 30000, 'Đơn vị: kg, xuất xứ Đà Lạt', 'images/products/1627747326.jpg', 3, 3),
(990888322, 'Củ cải trắng', '253', 15000, 'Đơn vị: kg, xuất xứ miền Tây', 'images/products/1627747396.jpg', 3, 3);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitietdathang`
--
ALTER TABLE `chitietdathang`
  ADD PRIMARY KEY (`DATHANG_ID`,`SANPHAM_ID`),
  ADD KEY `FK_RELATIONSHIP_6` (`SANPHAM_ID`);

--
-- Chỉ mục cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  ADD PRIMARY KEY (`KHACHHANG_ID`,`SANPHAM_ID`),
  ADD KEY `FK_DANHGIA_SANPHAM` (`SANPHAM_ID`);

--
-- Chỉ mục cho bảng `dathang`
--
ALTER TABLE `dathang`
  ADD PRIMARY KEY (`DATHANG_ID`),
  ADD KEY `FK_RELATIONSHIP_11` (`TENDANGNHAP`),
  ADD KEY `FK_RELATIONSHIP_4` (`KHACHHANG_ID`);

--
-- Chỉ mục cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`KHACHHANG_ID`,`SANPHAM_ID`),
  ADD KEY `FK_GIOHANG_SANPHAM` (`SANPHAM_ID`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`KHACHHANG_ID`),
  ADD UNIQUE KEY `KHACHHANG_SDT` (`KHACHHANG_SDT`);

--
-- Chỉ mục cho bảng `loai`
--
ALTER TABLE `loai`
  ADD PRIMARY KEY (`LOAI_ID`);

--
-- Chỉ mục cho bảng `noisanxuat`
--
ALTER TABLE `noisanxuat`
  ADD PRIMARY KEY (`NOISANXUAT_ID`);

--
-- Chỉ mục cho bảng `quantri`
--
ALTER TABLE `quantri`
  ADD PRIMARY KEY (`TENDANGNHAP`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`SANPHAM_ID`),
  ADD KEY `FK_RELATIONSHIP_1` (`LOAI_ID`),
  ADD KEY `FK_RELATIONSHIP_2` (`NOISANXUAT_ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `dathang`
--
ALTER TABLE `dathang`
  MODIFY `DATHANG_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=531231298;

--
-- AUTO_INCREMENT cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `KHACHHANG_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `loai`
--
ALTER TABLE `loai`
  MODIFY `LOAI_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `noisanxuat`
--
ALTER TABLE `noisanxuat`
  MODIFY `NOISANXUAT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `SANPHAM_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=990888323;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitietdathang`
--
ALTER TABLE `chitietdathang`
  ADD CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`DATHANG_ID`) REFERENCES `dathang` (`DATHANG_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_RELATIONSHIP_6` FOREIGN KEY (`SANPHAM_ID`) REFERENCES `sanpham` (`SANPHAM_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  ADD CONSTRAINT `FK_DANHGIA_SANPHAM` FOREIGN KEY (`SANPHAM_ID`) REFERENCES `sanpham` (`SANPHAM_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_RELATIONSHIP_9` FOREIGN KEY (`KHACHHANG_ID`) REFERENCES `khachhang` (`KHACHHANG_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `dathang`
--
ALTER TABLE `dathang`
  ADD CONSTRAINT `FK_RELATIONSHIP_11` FOREIGN KEY (`TENDANGNHAP`) REFERENCES `quantri` (`TENDANGNHAP`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_RELATIONSHIP_4` FOREIGN KEY (`KHACHHANG_ID`) REFERENCES `khachhang` (`KHACHHANG_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `FK_GIOHANG_SANPHAM` FOREIGN KEY (`SANPHAM_ID`) REFERENCES `sanpham` (`SANPHAM_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_RELATIONSHIP_7` FOREIGN KEY (`KHACHHANG_ID`) REFERENCES `khachhang` (`KHACHHANG_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `FK_RELATIONSHIP_1` FOREIGN KEY (`LOAI_ID`) REFERENCES `loai` (`LOAI_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`NOISANXUAT_ID`) REFERENCES `noisanxuat` (`NOISANXUAT_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

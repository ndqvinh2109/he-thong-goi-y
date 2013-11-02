--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.9
-- Dumped by pg_dump version 9.1.9
-- Started on 2013-11-02 10:23:10 ICT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = luanvan, pg_catalog;

SELECT pg_catalog.setval('hibernate_sequence', 1, false);


--
-- TOC entry 1979 (class 0 OID 72523)
-- Dependencies: 165 1988
-- Data for Name: hocphan; Type: TABLE DATA; Schema: luanvan; Owner: postgres
--

INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (1, 'QP001', 6, 115, 50, 'Giáo dục Quốc phòng');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (2, 'TC100', 2, 45, 45, 'Giáo dục Thể chất');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (3, 'CT801', 4, 60, 0, 'Anh văn căn bản 1 (*)');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (4, 'CT802', 3, 45, 0, 'Anh văn căn bản 2 (*)');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (5, 'CT803', 3, 45, 0, 'Anh văn căn bản 3 (*)');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (6, 'XH004', 3, 45, 0, 'Pháp văn căn bản 1 (*)');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (7, 'XH005', 3, 45, 0, 'Pháp văn căn bản 2 (*)');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (8, 'XH006', 4, 60, 0, 'Pháp văn căn bản (*)');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (9, 'ML009', 2, 30, 0, 'Những nguyên lý cơ bản của CN Mác-Lênin 1');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (10, 'ML010', 3, 45, 0, 'Những nguyên lý cơ bản của CN Mác-Lênin 2');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (11, 'ML006', 2, 30, 0, 'Tư tưởng Hồ Chí Minh');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (12, 'ML011', 3, 45, 0, 'Đường lối Cách mạng của ĐCSVN');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (13, 'TN001', 3, 45, 0, 'Vi - Tích phân A 1');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (14, 'TN002', 4, 60, 0, 'Vi - Tích phân A 2');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (15, 'TN010', 3, 45, 0, 'Xác xuất thống kê');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (16, 'TN012', 4, 60, 0, 'Đại số tuyến tính & Hình học');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (17, 'CT001', 1, 15, 0, 'Tin học căn bản');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (19, 'KL001', 2, 30, 0, 'Pháp luật đại cương');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (18, 'CT002', 2, 0, 60, 'TH. Tin học căn bản');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (20, 'CT101', 4, 30, 60, 'Lập trình căn bản A');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (21, 'ML007', 2, 30, 0, 'Logic học đại cương');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (22, 'XH028', 2, 30, 0, 'Xã hội học đại cương');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (23, 'XH014', 2, 30, 0, 'Văn bản & lưu trữ đại cương');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (24, 'SP080', 2, 30, 0, 'Cơ sở văn hóa Việt Nam');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (25, 'SP009', 2, 30, 0, 'Tâm lý học đại cương');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (26, 'SP012', 2, 30, 0, 'Giáo dục học đại cương');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (27, 'KT001', 2, 30, 0, 'Kinh tế học đại cương');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (28, 'CT102', 3, 45, 0, 'Toán rời rạc 1');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (30, 'CT104', 2, 30, 0, 'Kiến trúc máy tính');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (31, 'CT107', 3, 30, 30, 'Hệ điều hành');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (32, 'CT112', 3, 30, 30, 'Mạng máy tính');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (33, 'CT113', 2, 20, 20, 'Nhập môn công nghệ phần mềm');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (34, 'CT114', 3, 30, 30, 'Lập trình hướng đối tượng C++');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (35, 'CT119', 3, 45, 0, 'Toán rời rạc 2');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (36, 'CT120', 2, 30, 0, 'Phân tích và thiết kế thuật toán');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (37, 'CT121', 3, 45, 0, 'Tin học lý thuyết');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (38, 'CT165', 3, 30, 30, 'Ngôn ngữ mô hình hóa UML');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (40, 'CT124', 2, 30, 0, 'Phương pháp tính');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (39, 'CT123', 2, 30, 0, 'Quy hoạch tuyến tính - CNTT');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (41, 'CT125', 2, 30, 0, 'Mô phỏng');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (42, 'CT126', 2, 30, 0, 'Lý thuyết xếp hàng');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (43, 'CT127', 2, 30, 0, 'Lý thuyết thông tin');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (44, 'KT003', 2, 30, 0, 'Kế toán đại cương');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (45, 'CT128', 2, 30, 0, 'Kỹ thuật đồ họa');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (48, 'CT110', 2, 15, 30, 'Hệ quản trị cơ sở dữ liệu');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (46, 'CT106', 4, 45, 30, 'Hệ cơ sở dữ liệu');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (29, 'CT103', 4, 45, 30, 'Cấu trúc dữ liệu');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (47, 'CT109', 3, 30, 30, 'Phân tích và thiết kế hệ thống thông tin');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (49, 'CT428', 3, 30, 30, 'Lập trình web');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (50, 'CT304', 2, 30, 0, 'Giao diện người máy');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (51, 'CT429', 2, 0, 180, 'Thực tập thực tế tin học');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (52, 'CT309', 2, 20, 20, 'Quản lý dự án tin học');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (53, 'CT437', 3, 0, 135, 'Niên luận hệ thống thông tin');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (54, 'CT430', 3, 30, 30, 'Phân tích thiết kế hệ thống hướng đối tượng');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (55, 'CT312', 3, 30, 30, 'Khai khoáng dữ liệu');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (56, 'CT313', 2, 15, 30, 'An toàn & bảo mật thông tin');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (67, 'CT316', 3, 30, 30, 'Xử lý ảnh');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (57, 'CT431', 2, 20, 20, 'Hệ quản trị CSDl đa phương tiện');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (58, 'CT118', 2, 30, 0, 'Anh văn chuyên môn - Tin học');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (59, 'XH019', 2, 30, 0, 'Pháp văn chuyên môn');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (60, 'CT115', 2, 20, 20, 'Chuyên đề ngôn ngữ lập trình 1');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (61, 'CT106', 2, 20, 20, 'Chuyên đề ngôn ngữ lập trình 2');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (62, 'CT117', 2, 20, 20, 'Chuyên đề ngôn ngữ lập trình 3');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (64, 'CT311', 2, 20, 20, 'Phương pháp NCKH');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (65, 'CT302', 2, 20, 20, 'Phát triển phần mềm mã nguồn mở');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (68, 'CT317', 3, 30, 30, 'Lập trình nhúng cơ bản');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (63, 'CT349', 2, 30, 0, 'Thương mại điện tử - CNTT');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (66, 'CT303', 3, 15, 60, 'Phát triển hệ thống thông tin');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (69, 'CT321', 3, 15, 60, 'Phát triển hệ thống thương mại điện tử');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (70, 'CT434', 3, 30, 30, 'An toàn hệ thống và an ninh mạng');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (71, 'CT323', 2, 15, 30, 'Chuyên đề về hệ quản trị CSDL');
INSERT INTO hocphan (id, mahp, sotc, sotietlt, sotietth, tenhp) VALUES (72, 'CT358', 10, 0, 450, 'Luận văn tốt nghiệp Tin học');


--
-- TOC entry 1980 (class 0 OID 72531)
-- Dependencies: 166 1988
-- Data for Name: hocphantienquyet; Type: TABLE DATA; Schema: luanvan; Owner: postgres
--

INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (1, '4', 3);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (2, '5', 4);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (3, '7', 6);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (4, '8', 7);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (5, '10', 9);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (6, '11', 10);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (7, '12', 11);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (8, '14', 13);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (10, '31', 30);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (11, '32', 31);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (9, '29', 20);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (12, '34', 20);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (13, '36', 29);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (14, '37', 20);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (15, '45', 20);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (16, '46', 29);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (17, '47', 46);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (18, '48', 46);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (19, '49', 46);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (20, '49', 34);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (21, '50', 34);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (22, '52', 33);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (23, '54', 38);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (24, '55', 15);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (25, '57', 46);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (26, '58', 5);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (27, '59', 8);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (28, '60', 34);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (29, '61', 34);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (30, '62', 34);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (31, '66', 47);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (32, '68', 20);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (33, '69', 63);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (34, '70', 32);
INSERT INTO hocphantienquyet (id, mahocphantienquyet, hocphanid) VALUES (35, '71', 46);


--
-- TOC entry 1981 (class 0 OID 72536)
-- Dependencies: 167 1988
-- Data for Name: khoachuquan; Type: TABLE DATA; Schema: luanvan; Owner: postgres
--

INSERT INTO khoachuquan (id, makhoa, tenkhoa) VALUES (1, 'DI', 'Hệ thống Thông tin');


--
-- TOC entry 1982 (class 0 OID 72544)
-- Dependencies: 168 1988
-- Data for Name: khoadaotao; Type: TABLE DATA; Schema: luanvan; Owner: postgres
--

INSERT INTO khoadaotao (id, khoadt, namvao) VALUES (1, '37', '2011');

--
-- TOC entry 1976 (class 0 OID 73951)
-- Dependencies: 162 1988
-- Data for Name: bomon; Type: TABLE DATA; Schema: luanvan; Owner: postgres
--

INSERT INTO bomon (id, mabomon, tenbomon, khoachuquanid) VALUES (1, 'HTTT', 'Hệ thống Thông tin', 1);

--
-- TOC entry 1984 (class 0 OID 72560)
-- Dependencies: 170 1988
-- Data for Name: nganh; Type: TABLE DATA; Schema: luanvan; Owner: postgres
--

INSERT INTO nganh (id, manganh, tennganh, bomonid) VALUES (1, '52480104', 'Hệ thống Thông tin', 1);	
--
-- TOC entry 1983 (class 0 OID 72552)
-- Dependencies: 169 1988
-- Data for Name: lop; Type: TABLE DATA; Schema: luanvan; Owner: postgres
--

INSERT INTO lop (id, malop, siso, tenlop, khoadaotaoid, nganhid) VALUES (1, 'DI1195L1', 85, 'Hệ thông thông tin liên thông', 1, 1);

--
-- TOC entry 1985 (class 0 OID 72568)
-- Dependencies: 171 1988
-- Data for Name: nienkhoahocky; Type: TABLE DATA; Schema: luanvan; Owner: postgres
--

INSERT INTO nienkhoahocky (id, hocky, namhoc) VALUES (1, '2', '2011-2012');
INSERT INTO nienkhoahocky (id, hocky, namhoc) VALUES (2, '3', '2011-2012');
INSERT INTO nienkhoahocky (id, hocky, namhoc) VALUES (3, '1', '2012-2013');
INSERT INTO nienkhoahocky (id, hocky, namhoc) VALUES (4, '2', '2012-2013');
INSERT INTO nienkhoahocky (id, hocky, namhoc) VALUES (5, '3', '2012-2013');
INSERT INTO nienkhoahocky (id, hocky, namhoc) VALUES (6, '1', '2013-2014');
INSERT INTO nienkhoahocky (id, hocky, namhoc) VALUES (7, '2', '2014-2015');
INSERT INTO nienkhoahocky (id, hocky, namhoc) VALUES (8, '3', '2014-2015');


--
-- TOC entry 1986 (class 0 OID 72576)
-- Dependencies: 172 1988
-- Data for Name: sinhvien; Type: TABLE DATA; Schema: luanvan; Owner: postgres
--

INSERT INTO sinhvien (id, diachi, email, hoten, masosinhvien, ngaysinh, phai, lopid) VALUES (1, 'Thốt Nốt - Cần Thơ', 'peace.anbinh@gmail.com', 'Phạm Thị Thanh Loan', 'LT11749', '1989-09-08 00:00:00', 0, 1);
INSERT INTO sinhvien (id, diachi, email, hoten, masosinhvien, ngaysinh, phai, lopid) VALUES (2, 'Bình Đại - Bến Tre', 'ptbtuyen83@gmail.com', 'Phan Thị Bích Tuyền', 'LT11791', '1983-04-10 00:00:00', 0, 1);

--
-- TOC entry 1977 (class 0 OID 73957)
-- Dependencies: 163 1988
-- Data for Name: chuongtrinhdaotao; Type: TABLE DATA; Schema: luanvan; Owner: postgres
--

INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (1, '1', '0', '0', 1, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (2, '1', '11', '1', 2, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (3, '1', '12', '1', 3, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (4, '1', '12', '1', 4, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (5, '1', '12', '1', 5, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (6, '1', '12', '1', 6, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (7, '1', '12', '1', 7, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (8, '1', '12', '1', 8, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (9, '1', '0', '0', 9, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (10, '1', '0', '0', 10, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (11, '1', '0', '0', 11, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (12, '1', '0', '0', 12, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (13, '1', '0', '0', 13, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (14, '1', '0', '0', 14, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (15, '1', '0', '0', 15, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (16, '1', '0', '0', 16, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (17, '1', '0', '0', 17, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (18, '1', '0', '0', 18, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (19, '1', '0', '0', 19, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (20, '1', '0', '0', 20, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (21, '1', '13', '1', 21, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (22, '1', '13', '1', 22, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (23, '1', '13', '1', 23, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (24, '1', '13', '1', 24, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (25, '1', '13', '1', 25, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (26, '1', '13', '1', 26, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (27, '1', '13', '1', 27, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (28, '2', '0', '0', 28, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (29, '2', '0', '0', 29, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (30, '2', '0', '0', 30, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (31, '2', '0', '0', 31, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (32, '2', '0', '0', 32, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (33, '2', '0', '0', 33, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (34, '2', '0', '0', 34, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (35, '2', '0', '0', 35, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (36, '2', '0', '0', 36, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (37, '2', '0', '0', 37, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (38, '2', '0', '0', 38, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (39, '2', '21', '1', 39, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (40, '2', '21', '1', 40, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (41, '2', '21', '1', 41, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (42, '2', '21', '1', 42, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (43, '2', '21', '1', 43, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (44, '2', '22', '1', 44, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (45, '2', '22', '1', 45, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (46, '3', '0', '0', 46, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (47, '3', '0', '0', 47, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (48, '3', '0', '0', 48, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (49, '3', '0', '0', 49, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (50, '3', '0', '0', 50, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (51, '3', '0', '0', 51, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (52, '3', '0', '0', 52, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (53, '3', '0', '0', 53, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (54, '3', '0', '0', 54, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (55, '3', '0', '0', 55, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (56, '3', '0', '0', 56, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (57, '3', '0', '0', 57, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (58, '3', '31', '1', 58, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (59, '3', '31', '1', 59, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (60, '3', '32', '1', 60, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (61, '3', '32', '1', 61, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (62, '3', '32', '1', 62, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (63, '3', '33', '1', 63, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (64, '3', '33', '1', 64, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (65, '3', '33', '1', 65, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (66, '3', '34', '1', 66, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (67, '3', '34', '1', 67, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (68, '3', '34', '1', 68, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (69, '3', '34', '1', 69, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (70, '3', '34', '1', 70, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (71, '3', '34', '1', 71, 1, 1);
INSERT INTO chuongtrinhdaotao (id, khoikienthuc, nhomtuchon, tuchon, hocphanid, khoadaotaoid, nganhid) VALUES (72, '3', '34', '1', 72, 1, 1);

--
-- TOC entry 1978 (class 0 OID 73963)
-- Dependencies: 164 1988
-- Data for Name: diem; Type: TABLE DATA; Schema: luanvan; Owner: postgres
--

INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (1, 'B', 17, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (2, 'B', 18, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (3, 'D', 20, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (4, 'M', 28, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (5, 'M', 29, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (6, 'C', 30, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (7, 'B', 31, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (8, 'D', 32, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (9, 'C', 34, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (10, 'C', 60, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (11, 'C', 40, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (12, 'D', 49, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (13, 'B', 51, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (14, 'M', 3, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (15, 'M', 4, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (16, 'M', 5, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (17, 'B', 19, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (18, 'D', 44, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (19, 'D', 11, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (20, 'D', 9, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (21, 'C+', 10, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (22, 'D', 12, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (23, 'M', 1, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (24, 'M', 2, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (25, 'D', 13, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (26, 'D', 14, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (27, 'A', 15, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (28, 'C+', 46, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (29, 'C+', 33, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (30, 'C+', 37, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (31, 'B+', 38, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (32, 'C', 55, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (33, 'A', 27, 1, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (34, 'C', 17, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (35, 'C', 18, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (36, 'C', 20, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (37, 'M', 28, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (38, 'M', 29, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (39, 'B+', 30, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (40, 'A', 46, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (41, 'D', 31, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (42, 'A', 47, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (43, 'B', 48, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (44, 'B', 32, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (45, 'A', 33, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (46, 'B', 34, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (47, 'C', 60, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (48, 'C+', 36, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (49, 'A', 51, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (50, 'M', 3, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (51, 'M', 4, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (52, 'M', 5, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (53, 'A', 19, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (54, 'D', 8, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (55, 'C+', 9, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (56, 'B', 10, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (57, 'M', 1, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (58, 'M', 2, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (59, 'B', 13, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (60, 'B', 14, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (61, 'D', 15, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (62, 'C', 16, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (63, 'B', 58, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (64, 'B', 43, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (65, 'A', 38, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (66, 'B', 52, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (67, 'C+', 56, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (68, 'C+', 49, 1, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (98, NULL, 72, 6, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (69, NULL, 35, 3, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (70, NULL, 37, 3, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (71, NULL, 50, 3, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (72, NULL, 54, 3, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (73, NULL, 57, 3, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (74, NULL, 12, 3, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (75, NULL, 63, 4, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (76, NULL, 53, 4, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (77, NULL, 44, 4, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (78, NULL, 23, 4, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (79, NULL, 15, 5, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (80, NULL, 16, 5, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (81, NULL, 72, 6, 2);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (82, NULL, 44, 2, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (83, NULL, 16, 2, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (84, NULL, 47, 3, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (85, NULL, 58, 3, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (86, NULL, 35, 3, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (87, NULL, 36, 3, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (88, NULL, 50, 3, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (89, NULL, 52, 3, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (90, NULL, 56, 3, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (91, NULL, 57, 3, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (92, NULL, 48, 4, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (93, NULL, 32, 4, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (94, NULL, 43, 4, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (95, NULL, 63, 4, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (96, NULL, 54, 4, 1);
INSERT INTO diem (id, diem, hocphanid, nienkhoaid, sinhvienid) VALUES (97, NULL, 53, 4, 1);




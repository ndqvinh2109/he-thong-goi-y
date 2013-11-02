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
-- TOC entry 1983 (class 0 OID 72552)
-- Dependencies: 169 1988
-- Data for Name: lop; Type: TABLE DATA; Schema: luanvan; Owner: postgres
--



--
-- TOC entry 1984 (class 0 OID 72560)
-- Dependencies: 170 1988
-- Data for Name: nganh; Type: TABLE DATA; Schema: luanvan; Owner: postgres
--



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




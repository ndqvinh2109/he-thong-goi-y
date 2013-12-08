<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#keHoachHocTap table thead{
		color: #ffffff;
		background-color: #3498db;
	}
	
	#keHoachHocTap table{
		margin-top: 15px;
	}
	
	.title-field{
		background: url(../resources/assets/images/titlebg.jpg) center left repeat-x;
		color: white;
		font-size: 14px;
		font-weight: bold;
		padding: 10px 20px;
		margin: 0px auto 0px;
		position: absolute;
		width:100%;
		top: 0;
		left: 0;
	}
</style>
</head>
<body>
	<div class="container" style="padding-bottom: 80px">
		<fieldset class="bs-example">
			<h3 class="title-field">Kế hoạch học tập</h3>
			<table>
			<thead>
				<tr>
					<td class="col-lg-3">Ngành học</td>
					<td class="col-lg-3">Khóa đào tạo</td>
					<td class="col-lg-3"></td>
					<td class="col-lg-3"></td>
					
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><select id="selNganh" class="col-lg-2 form-control">
							<option value="${nganh.nganhId}">${nganh.tenNganh}</option>
		  				</select>
		  			</td>
					<td><select id="selKhoaDaoTao" class="col-lg-2 form-control">
							<option value="${khoaDaoTao.khoaDaoTaoId }">${khoaDaoTao.khoaDT}</option>
						</select>
		  			</td>
					<td><button id="duDoanDiem" class="btn btn-info"><span class="fa fa-cog fa-fw"></span>Dự đoán điểm</button></td>
					<td><button id="exportDiem" class="btn btn-info"><span class="fa fa-file fa-fw"></span>In điểm</button></td>
				</tr>
			</tbody>
		</table>
		</fieldset>
		<fieldset class="bs-example">
			<h3 class="title-field">Thông tin kế hoạch học tập</h3>
		<div id="keHoachHocTap"></div>
		</fieldset>
		
		
	</div>	
	<script type="text/javascript">
	$(document).ready(function(){
		
		$('#exportDiem').click(function(){
			window.location = '${pageContext.request.contextPath}/service/exportDiem';
		});
		
		$(document).on('click','.capNhat',function(){
			var diemId = $(this).attr("id").split("-")[1];
			
			var hocki = $('#hk-' + diemId).text();
			var namhoc = $('#nh-' + diemId).text();
			
			$.ajax({
				url: '${pageContext.request.contextPath}/service/updateHocKyNamHoc',
				type: 'GET',
				dataType: "json",
				data : {
					hocki: hocki,
					namhoc: namhoc,
					diemId: diemId
				},
				beforeSend: function(){
					$.blockUI({ 
						message: '<h4><img src="${pageContext.request.contextPath}/resources/assets/images/ajax-loader.gif" /> Loading...</h4>'
			        });
				},
				complete: function(){
					  setTimeout($.unblockUI, 500); 
				},
				success: function(data){
					if(data == true){
						duDoanDiemSinhVien();
					}
				}
			});
		});
		
		$(document).on('hover','.hocKy',function(){
			var hocKys = [];
			$.each({"1": "1", "2": "2", "3": "3"},function(k,v){
				hocKys.push({id: k, text: v});
			});
			
			$('.hocKy').editable({
				 source: hocKys,
				 title: "Chọn học kỳ",
				 placeholder: 'Chọn học kỳ',
		         allowClear: true,
		         type: "select",
		         display: function(value){
					$(this).text(value);
				}
			});
		});
		
		$(document).on('hover','.namHoc',function(){
			var namHocs = [];
			$.each({
				"1994-1995": "1994-1995",
				"1995-1996": "1995-1996",
				"1996-1997": "1996-1997",
				"1997-1998": "1997-1998",
				"1998-1999": "1998-1999",
				"1999-2000": "1999-2000",
				"2000-2001": "2000-2001",
				"2001-2002": "2001-2002",
				"2002-2003": "2002-2003",
				"2003-2004": "2003-2004",
				"2004-2005": "2004-2005",
				"2005-2006": "2005-2006",
				"2006-2007": "2006-2007",
				"2007-2008": "2007-2008",
				"2008-2009": "2008-2009",
				"2009-2010": "2009-2010",
				"2010-2011": "2010-2011",
				"2011-2012": "2011-2012",
				"2012-2013": "2012-2013",},function(k,v){
				namHocs.push({id: k, text: v});
			});
			
			$('.namHoc').editable({
				 source: namHocs,
				 title: "Chọn năm học",
				 placeholder: 'Chọn năm học',
		         allowClear: true,
		         type: "select",
		         display: function(value){
					$(this).text(value);
				}
			});
		});
		
		$('#duDoanDiem').click(function(){
			duDoanDiemSinhVien();
		});
		
		
		function duDoanDiemSinhVien(){
			$('#keHoachHocTap').empty();
			$.ajax({
				url: '${pageContext.request.contextPath}/service/loadDuDoanDiemChoSinhVien',
				type: 'GET',
				dataType: "json",
				data: null,
				beforeSend: function(){
					$.blockUI({ 
						message: '<h4><img src="${pageContext.request.contextPath}/resources/assets/images/ajax-loader.gif" /> Loading...</h4>'
			        });
				},
				complete: function(){
					$.unblockUI();
				},
				success: function(data){
					console.log(data.danhSachDiemHocPhan);
					var $tbody = $('<tbody></tbody>');
			        var $thead = $('<thead></thead>').append('<tr><td>TT</td><td>Mã số HP</td><td>Tên học phần</td><td>Số tín chỉ</td><td>Điểm</td><td>Điểm dự đoán</td><td>Học kỳ</td><td>Năm học</td><td>Cập nhật</td></tr>');
			        var $table = $('<table></table>',{
			        	'class':'table table-bordered table-hover'
		    		});
			        var hocPhan = new Object();
			    	var diem = new Object();
			    	var nienKhoaHocKy = new Object();
			    	
			        for(var i = 0; i < data.danhSachDiemHocPhan.length; i++){
			        	hocPhan = data.danhSachDiemHocPhan[i][0];
			      		diem = data.danhSachDiemHocPhan[i][1];
			      		nienKhoaHocKy = data.danhSachDiemHocPhan[i][2];
			      		
			      		var diemDuDoanFloat = parseFloat(diem.diemDuDoan);
			      		var diemFloat = parseFloat(diem.diem);
			      		var diemDuDoanChu = "";
			      		var diemChu = "";
			      		if(diem.diemDuDoan != ""){
			      			if(diemDuDoanFloat == 4){
			      				diemDuDoanChu = "A";
							}
							else if(diemDuDoanFloat >= 3.5 && diemDuDoanFloat <= 3.9){
								diemDuDoanChu = "B+";
							}
							else if(diemDuDoanFloat >= 3 &diemDuDoanFloat <= 3.4){
								diemDuDoanChu = "B";
							}
							else if(diemDuDoanFloat >= 2.5 &diemDuDoanFloat <= 2.9){
								diemDuDoanChu = "C+";
							}
							else if(diemDuDoanFloat >= 2 && diemDuDoanFloat <= 2.4){
								diemDuDoanChu = "C";
							}
							else if(diemDuDoanFloat >= 1.5 && diemDuDoanFloat <= 1.9){
								diemDuDoanChu = "D+";
							}	
							else if(diemDuDoanFloat >= 1 && diemDuDoanFloat <= 1.4){
								diemDuDoanChu = "D";
							}
							else{
								diemDuDoanChu = "F";
							}
			      		}
			      				
			      		if(diem.diem != ""){
				      		if(diemFloat >= 8.5){
				      			diemChu = "A";
							}
							else if(diemFloat >= 8 && diemFloat <= 8.4){
								diemChu = "B+";
							}
							else if(diemFloat >= 7 && diemFloat <= 7.9){
								diemChu = "B";
							}
							else if(diemFloat >= 6.5 && diemFloat <= 6.9){
								diemChu = "C+";
							}
							else if(diemFloat >= 5.5 && diemFloat <= 6.4){
								diemChu = "C";
							}
							else if(diemFloat >= 5 && diemFloat <= 5.4){
								diemChu = "D";
							}	
							else{
								diemChu = "F";
							}
			      		}
			      		
			      		var stt = i + 1;
						var $tr = $('<tr></tr>');
						$($tr).append('<td>'+stt+'</td>')
						  .append('<td>'+hocPhan.maHP+'</td>')
						  .append('<td>'+hocPhan.tenHP+'</td>')
						  .append('<td style="vertical-align: middle; text-align: center;">'+hocPhan.soTC+'</td>')
						  .append('<td style="vertical-align: middle; text-align: center;">'+diemChu+'</td>')
						  .append('<td style="vertical-align: middle; text-align: center; color: red">'+diemDuDoanChu+'</td>')
						  .append('<td><a id="hk-'+diem.diemId+'" class="hocKy" href="#" data-pk="'+stt+'" data-value="'+nienKhoaHocKy.hocKy+'">'+nienKhoaHocKy.hocKy+'</a></td>')
						  .append('<td><a id="nh-'+diem.diemId+'"class="namHoc" href="#" data-pk="'+stt+'" data-value="'+nienKhoaHocKy.namHoc+'">'+nienKhoaHocKy.namHoc+'</td>')
						  .append('<td><button id="btn-'+diem.diemId+'" class="btn btn-primary capNhat">Cập nhật</button></td>');
					$($tr).appendTo($tbody);
					
			        }
			        $($thead).appendTo($table);
					$($tbody).appendTo($table);
					$('#keHoachHocTap').append($table);
					
					  $('#keHoachHocTap').fadeIn(800,function(){
							$('html, body').animate({
								scrollTop: $("#keHoachHocTap").offset().top
							}, 800);
					 });
				}
			});
		}
		
	});
	</script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.blockUI.js"></script>
</body>
</html>
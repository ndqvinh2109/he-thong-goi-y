<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dự đoán kết quả học phần</title>
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
			<h3 class="title-field">Chọn sinh viên</h3>
				<div class="row">
				<div class="col-sm-3">
						<div class='form-group'>
							<label>Tìm kiếm sinh viên</label>
							<input title="Nhập mã số sinh viên" id="maSinhVien" type="text" class="form-control" placeholder="Nhập mã sinh viên"/>
						</div>
					</div>
					<div class="col-sm-3">
						<div class='form-group'>
							<label>Sinh viên</label>
							<select id="selSinhVien" class="col-lg-2 form-control">
							<option value="0">Chọn Sinh Viên</option>
			  				<c:forEach var="sinhVien" items="${sinhViens}">
			  						<option value="${sinhVien.sinhVienId}">${sinhVien.hoTen}</option>
			  				</c:forEach>
		  				</select>
						</div>
					</div>
					<div class="col-sm-5" style="margin-top: 24px">
						<button id="inKeHoachHocTap" class="btn btn-info">In kế hoạch học tập</button>
			  			<button id="ghiFile" class="btn btn-info">Ghi File</button>
			  			<button id="duDoanDiem" class="btn btn-info">Dự đoán điểm</button>
					</div>
				</div>
			
		</fieldset>
		<fieldset class="bs-example">
			<h3 class="title-field">Dự đoán điểm học phần</h3>
		<div id="keHoachHocTap"></div>
		</fieldset>
		
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('.form-control').tooltip();
		
		$('#maSinhVien').keyup(function(event){
			var maSinhVien = $('#maSinhVien').val();
			
				$.ajax({
					url: '${pageContext.request.contextPath}/service/loadSinhVienByMaSinhVien',
					type: 'GET',
					dataType: "json",
					data : {
						maSinhVien: maSinhVien,
					},
					success: function(data){
						if(data.sinhVien != null)
							$('#selSinhVien').val(data.sinhVien.sinhVienId);
					}
				});
			
		});
		
		
		$('#inKeHoachHocTap').click(function(){
				$('#keHoachHocTap').empty();
				var sinhVienId = $('#selSinhVien').val();
				$.ajax({
					url: '${pageContext.request.contextPath}/service/loadDuDoanDiemHocPhan',
					type: 'GET',
					dataType: "json",
					data:{
						sinhVienId: sinhVienId
					},
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
				        var $thead = $('<thead></thead>').append('<tr><td>TT</td><td>Mã số HP</td><td>Tên học phần</td><td>Số tín chỉ</td><td>Điểm</td><td>Điểm dự đoán</td><td>Học kỳ</td><td>Năm học</td></tr>');
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
							  .append('<td>'+nienKhoaHocKy.hocKy+'</td>')
							  .append('<td>'+nienKhoaHocKy.namHoc+'</td>');
						$($tr).appendTo($tbody);
						
				        }
				        $($thead).appendTo($table);
						$($tbody).appendTo($table);
						$('#keHoachHocTap').append($table);
					}
				});
		});
		
		$('#ghiFile').click(function(){
			$.ajax({
				url: '${pageContext.request.contextPath}/service/ghiFile',
				type: 'GET',
				data: null,
				beforeSend: function(){
					$.blockUI({ 
						message: '<h4><img src="${pageContext.request.contextPath}/resources/assets/images/ajax-loader.gif" /> Loading...</h4>'
			        }); 
				},
				success: function(data){
					$.unblockUI();
				}
			});
			
		});
		
		
		$('#duDoanDiem').click(function(){
			$.ajax({
				url: '${pageContext.request.contextPath}/service/duDoanDiem',
				type: 'GET',
				data: null,
				beforeSend: function(){
					$.blockUI({ 
						message: '<h4><img src="${pageContext.request.contextPath}/resources/assets/images/ajax-loader.gif" /> Loading...</h4>'
			        }); 
				},
				success: function(data){
					$.unblockUI();
				},
			});
			
		});
	});
		
	</script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.blockUI.js"></script>
</body>
</html>
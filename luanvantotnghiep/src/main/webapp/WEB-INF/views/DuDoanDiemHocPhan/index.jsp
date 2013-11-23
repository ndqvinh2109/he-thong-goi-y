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
</style>
</head>
<body>
<div class="container" style="padding-bottom: 80px">
		<table>
			<thead>
				<tr>
					<td>Sinh viên</td>
					<td class="pull-left"></td>
					<td class="pull-left"></td>
					<td class="pull-left"></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><select id="selSinhVien" class="col-lg-2 form-control">
							<option value="0">Chọn Sinh Viên</option>
			  				<c:forEach var="sinhVien" items="${sinhViens}">
			  						<option value="${sinhVien.sinhVienId}">${sinhVien.hoTen}</option>
			  				</c:forEach>
		  				</select>
		  			</td>
		  			<td><button id="inKeHoachHocTap" class="btn btn-info">In kế hoạch học tập</button></td>
		  			<td><button id="ghiFile" class="btn btn-info">Ghi File</button></td>
		  			<td><button id="duDoanDiem" class="btn btn-info">Dự đoán điểm</button></td>
				</tr>
			</tbody>
		</table>
		
		<div id="keHoachHocTap"></div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
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
						$.blockUI({ css: { 
				            border: 'none', 
				            padding: '15px', 
				            backgroundColor: '#000', 
				            '-webkit-border-radius': '10px', 
				            '-moz-border-radius': '10px', 
				            opacity: .5, 
				            color: '#fff' 
				        } }); 
					},
					success: function(data){
						console.log(data.danhSachDiemHocPhan);
						var $tbody = $('<tbody></tbody>');
				        var $thead = $('<thead></thead>').append('<tr><td>TT</td><td>Mã số HP</td><td>Tên học phần</td><td>Số tín chỉ</td><td>Điểm</td><td>Điểm dự đoán</td><td>Học kỳ</td><td>Năm học</td></tr>');
				        var $table = $('<table></table>',{
				        	'class':'table table-hover'
			    		});
				        var hocPhan = new Object();
				    	var diem = new Object();
				    	var nienKhoaHocKy = new Object();
				    	
				        for(var i = 0; i < data.danhSachDiemHocPhan.length; i++){
				        	hocPhan = data.danhSachDiemHocPhan[i][0];
				      		diem = data.danhSachDiemHocPhan[i][1];
				      		nienKhoaHocKy = data.danhSachDiemHocPhan[i][2];
									var $tr = $('<tr></tr>');
									$($tr).append('<td>'+hocPhan.hocPhanId+'</td>')
									  .append('<td>'+hocPhan.maHP+'</td>')
									  .append('<td>'+hocPhan.tenHP+'</td>')
									  .append('<td>'+hocPhan.soTC+'</td>')
									  .append('<td>'+diem.diem+'</td>')
									  .append('<td>'+diem.diemDuDoan+'</td>')
									  .append('<td>'+nienKhoaHocKy.hocKy+'</td>')
									  .append('<td>'+nienKhoaHocKy.namHoc+'</td>');
								$($tr).appendTo($tbody);
				        }
				        $($thead).appendTo($table);
						$($tbody).appendTo($table);
						$('#keHoachHocTap').append($table);
						$.unblockUI();
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
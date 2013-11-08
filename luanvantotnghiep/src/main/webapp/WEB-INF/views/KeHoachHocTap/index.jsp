<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#chuongTrinhDaoTao table thead{
		color: #ffffff;
		background-color: #3498db;
	}
	
	#chuongTrinhDaoTao table{
		margin-top: 15px;
	}
</style>
</head>
<body>
	<div class="container" style="padding-bottom: 80px">
		<table>
			<thead>
				<tr>
					<td class="col-lg-3">Ngành học</td>
					<td class="col-lg-3">Khóa đào tạo</td>
					<td class="col-lg-3"></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><select id="selNganh" class="col-lg-2 form-control">
							<option value="0">Chọn ngành</option>
			  				<c:forEach var="nganh" items="${nganhs}">
			  						<option value="${nganh.nganhId}">${nganh.tenNganh}</option>
			  				</c:forEach>
		  				</select>
		  			</td>
					<td><select id="selKhoaDaoTao" class="col-lg-2 form-control">
							<option value="0">Chọn khóa đào tạo</option>
		  					<c:forEach var="khoaDaoTao" items="${khoaDaoTaos}">
		  						<option value="${khoaDaoTao.khoaDaoTaoId}">${khoaDaoTao.khoaDT}</option>
		  					</c:forEach>
		  				</select>
		  			</td>
		  			<td><button id="inKeHoach" class="btn btn-info">In kế hoạch học tập</button></td>
				</tr>
			</tbody>
		</table>
		
		<div id="chuongTrinhDaoTao"></div>
		
		
	</div>	
	<script type="text/javascript">
		$(document).ready(function(){
			function countItemInArray(item, array){
				var counter = 0;
				for(var i = 0; i < array.length; i++){
					if(array[i][1].nhomTuChon == item){
						counter ++;
					}
				}
				return counter;
			}
			
			$('#inKeHoach').click(function(){
				$('#chuongTrinhDaoTao').empty();
				var nganhId = $('#selNganh').val();
				var khoaDaoTaoId = $('#selKhoaDaoTao').val();
				$.ajax({
					url: '${pageContext.request.contextPath}/service/loadChuongTrinhDaoTao',
					type: 'GET',
					dataType: "json",
					data:{
						nganhId: nganhId,
						khoaDaoTaoId: khoaDaoTaoId
					},
					success: function(data){
						console.log(data.danhSachHocPhan);
						var $tbody = $('<tbody></tbody>');
				        var $thead = $('<thead></thead>').append('<tr><td>TT</td><td>Mã số HP</td><td>Tên học phần</td><td>Số tín chỉ</td><td>Bắt buộc</td><td>Tự chọn</td><td>Số tiết LT</td><td>Số tiết TH</td><td>Học Phần TQ</td></tr>');
				        var $table = $('<table></table>',{
				        	'class':'table table-hover'
				        });
				    	var hocPhan = new Object();
				    	var chuongTrinhDaoTao = new Object();
				    	
				        for(var i = 0; i < data.danhSachHocPhan.length; i++){
				        	hocPhan = data.danhSachHocPhan[i][0];
				      		chuongTrinhDaoTao = data.danhSachHocPhan[i][1];
				      		console.log(countItemInArray(chuongTrinhDaoTao.nhomTuChon,data.danhSachHocPhan));
				      		$.ajax({
								url: '${pageContext.request.contextPath}/service/loadHocPhanTienQuyetByHocPhanId',
								type: 'GET',
								dataType: "json",
								data: {
									hocPhanId: hocPhan.hocPhanId
								},
								async: false,
								success: function(data){
									var strTemp = '';
									for(var i = 0; i < data.hptq.length; i++){
										var hptqTemp = data.hptq;
										if(i + 1 == data.hptq.length){
											strTemp += hptqTemp[i].maHocPhanTienQuyet;
										}
										else{
											strTemp += hptqTemp[i].maHocPhanTienQuyet + ', ';
										}
									}
								
									var $tr = $('<tr></tr>');
									$($tr).append('<td>'+hocPhan.hocPhanId+'</td>')
									  .append('<td>'+hocPhan.maHP+'</td>')
									  .append('<td>'+hocPhan.tenHP+'</td>')
									  .append('<td>'+hocPhan.soTC+'</td>')
									  .append('<td>'+hocPhan.soTC+'</td>')
									  .append('<td>'+chuongTrinhDaoTao.tuChon+'</td>')
									  .append('<td>'+hocPhan.soTietLT+'</td>')
									  .append('<td>'+hocPhan.soTietTH+'</td>')
									  .append('<td>'+strTemp+'</td>');
								$($tr).appendTo($tbody);
								}
							});		  
						}
				        $($thead).appendTo($table);
						$($tbody).appendTo($table);
						$('#chuongTrinhDaoTao').append($table);
						
					}
				});
				
			});
		});
	</script>
</body>
</html>
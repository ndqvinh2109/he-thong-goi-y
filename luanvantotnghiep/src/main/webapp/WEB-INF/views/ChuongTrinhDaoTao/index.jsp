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
		  			<td><button id="inKeHoach" class="btn btn-info">In chương trình đào tạo</button></td>
				</tr>
			</tbody>
		</table>
		
		<div id="chuongTrinhDaoTao"></div>
		
		
	</div>	
	<script src="${pageContext.request.contextPath}/resources/assets/js/chuongtrinhdaotao.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			function countItemInArray(item, array){
				if(item[0].hocPhanId == array[0][0].hocPhanId){
					if(array.length == 1)
						return 0;
					else
						return array.length;
				}
				else {
					return 0;
				}
			}
						
			function getNhomTuChons(item,array,index){
				var myArray = [];
				if(item == '0'){
					myArray.push(array[index]);
					return myArray;
				}
				else{
					for(var i = 0; i < array.length; i++){
						if(item == array[i][1].nhomTuChon){
							myArray.push(array[i]);
						}
					}
				}
				return myArray;
			}
						
			function getHocPhansByNhomKienThuc(array,group){
				var myArray = [];
				for(var i = 0; i < array.length; i++){
					if(group == array[i][1].khoiKienThuc){
						myArray.push(array[i]);
					}
				}
				return myArray;
			}
						
			function createTable(data,str){
				var $tbody = $('<tbody></tbody>');
		    	var hocPhan = new Object();
		    	var chuongTrinhDaoTao = new Object();
		    	var rowCount = 0;
		    	var $tr = $('<tr></tr>');
		    	$($tr).append('<td colspan="9" class="success text-center"><strong>'+str+'</strong></td>');
		    	$($tr).appendTo($tbody);
		    	for(var i = 0; i < data.length; i++){
		        	hocPhan = data[i][0];
		      		chuongTrinhDaoTao = data[i][1];
		      		rowCount = countItemInArray(data[i], getNhomTuChons(chuongTrinhDaoTao.nhomTuChon, data, i));
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
							$tr = $('<tr></tr>');
							var j = 0;
							
							for(var i = 0; i < data.hptq.length; i++){
								var hptqTemp = data.hptq;
								if(i + 1 == data.hptq.length){
									strTemp += hptqTemp[i].maHocPhanTienQuyet;
								}
								else{
									strTemp += hptqTemp[i].maHocPhanTienQuyet + ', ';
								}
							}
							$($tr).append('<td>'+hocPhan.hocPhanId+'</td>')
							  .append('<td>'+hocPhan.maHP+'</td>')
							  .append('<td>'+hocPhan.tenHP+'</td>')
							  .append('<td style="vertical-align: middle; text-align: center">'+hocPhan.soTC+'</td>');
							
							
							if(chuongTrinhDaoTao.tuChon != '0'){
								 $($tr).append('<td style="vertical-align: middle; text-align: center"></td>');
							}	
							else{
								 $($tr).append('<td style="vertical-align: middle; text-align: center">'+hocPhan.soTC+'</td>');
							}
							 
							
							if(chuongTrinhDaoTao.nhomTuChon == '0' || hocPhan.maHP == 'TC100'){
								if(chuongTrinhDaoTao.nhomTuChon == '0')
									$($tr).append('<td></td>');
								else
									$($tr).append('<td style="vertical-align: middle; text-align: center">'+chuongTrinhDaoTao.tuChon+'</td>');
							}
							else{
								 while(j < rowCount){
								  	$($tr).append('<td style="vertical-align: middle; text-align: center" rowspan="'+rowCount+'">'+chuongTrinhDaoTao.tuChon+'</td>');
								  	break;
								 }
							}
							  
						  $($tr).append('<td style="vertical-align: middle; text-align: center">'+hocPhan.soTietLT+'</td>')
						  .append('<td style="vertical-align: middle; text-align: center">'+hocPhan.soTietTH+'</td>')
						  .append('<td>'+strTemp+'</td>');
						  
						$($tr).appendTo($tbody);
						}
					});		  
				}
				return $tbody;
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
						console.log(data);
						var str = 'Khối kiến thức giáo dục đại cương';
				        var $thead = $('<thead></thead>').append('<tr><td>TT</td><td>Mã số HP</td><td>Tên học phần</td><td>Số tín chỉ</td><td>Bắt buộc</td><td>Tự chọn</td><td>Số tiết LT</td><td>Số tiết TH</td><td>Học Phần TQ</td></tr>');
				        var $table = $('<table></table>',{
				        	'class':'table table-bordered table-hover'
				        });
				        
				    	$($thead).appendTo($table);
				        var $tbody = createTable(getHocPhansByNhomKienThuc(data.danhSachHocPhan,'1'),str);
				        $($tbody).appendTo($table);
				        str = 'Khối kiến thức cơ sở ngành';
				       	$tbody = createTable(getHocPhansByNhomKienThuc(data.danhSachHocPhan,'2'),str);
				        $($tbody).appendTo($table);
				        str = 'Khối kiến thức chuyên ngành';
				        $tbody = createTable(getHocPhansByNhomKienThuc(data.danhSachHocPhan,'3'),str);
				        $($tbody).appendTo($table);
										
						$('#chuongTrinhDaoTao').append($table);
					}
				});
				
			});
		});
	</script>
</body>
</html>
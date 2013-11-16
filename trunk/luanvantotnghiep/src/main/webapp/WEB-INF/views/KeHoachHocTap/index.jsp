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
		
		<div id="keHoachHocTap"></div>
	</div>	
	<script type="text/javascript">
	$(document).ready(function(){
		
		function countHocKyMacDinh(array){
			var count = 1;
			for(var i = 0; i < array.length; i++){
				var j = i + 1;
				if(i == array.length - 1){
					break;
				}
				
				if(array[i][1].hocKyMacDinh != array[j][1].hocKyMacDinh){
					count ++;
				}
			}
			return count;
		}
		
		/* find HocPhans By HocKyMacDinh */
		function getHocPhansByHocKy(array, item){
			var myArray = [];
			for(var i = 0; i < array.length; i++){
				if(item == array[i][1].hocKyMacDinh){
					myArray.push(array[i]);
				}
			}
			return myArray;
		}
		
		
		function createTable(data,str){
			var $tbody = $('<tbody></tbody>');
	    	var hocPhan = new Object();
	    	var chuongTrinhDaoTao = new Object();
	    	var $tr = $('<tr></tr>');
	    	$($tr).append('<td colspan="9" class="danger"><strong>'+str+'</strong></td>');
	    	$($tr).appendTo($tbody);
	    	for(var i = 0; i < data.length; i++){
	        	hocPhan = data[i][0];
	      		chuongTrinhDaoTao = data[i][1];
	      		$.ajax({
					url: '${pageContext.request.contextPath}/service/loadHocPhanTienQuyetKHHTByHocPhanId',
					type: 'GET',
					dataType: "json",
					data: {
						hocPhanId: hocPhan.hocPhanId
					},
					async: false,
					success: function(data){
						var strTemp = '';
						$tr = $('<tr></tr>');
						
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
					
					    if(chuongTrinhDaoTao.tuChon != '0'){
					  		$($tr).append('<td style="vertical-align: middle; text-align: center">'+hocPhan.soTC+'</td>');
					    }
					    else{
							$($tr).append('<td style="vertical-align: middle; text-align: center"></td>');  
					    }
					  
					  
					  $($tr).append('<td style="vertical-align: middle; text-align: center">'+hocPhan.soTietLT+'</td>')
					  .append('<td style="vertical-align: middle; text-align: center">'+hocPhan.soTietTH+'</td>')
					  .append('<td>'+strTemp+'</td>');
					
					$($tr).appendTo($tbody);
					
					}
				});		  
			}
	    	/* Function total point */
	    	
	    	var totalPoint = 0;
	    	for(var i = 0; i < data.length; i++){
	    		hocPhan = data[i][0];
	    		chuongTrinhDaoTao = data[i][1];
	    		if(chuongTrinhDaoTao.tuChon == '0'){
	    			totalPoint += hocPhan.soTC;
	    		}
	    	}
	    	
	    	var $tr = $('<tr></tr>');
	    	$($tr).append('<td colspan="3" class="success text-right" style="color: red"><strong>Tổng: </strong></td>');
	    	$($tr).append('<td></td>');
	    	$($tr).append('<td class="success text-center" style="color: red"><strong>'+totalPoint+'</strong></td>');
	    	for(var i = 0; i < 4 ; i++){
	    		$($tr).append('<td></td>');
	    	}
	    	$($tr).appendTo($tbody);
			return $tbody;
		}
		
		$('#inKeHoach').click(function(){
			$('#keHoachHocTap').empty();
			var nganhId = $('#selNganh').val();
			var khoaDaoTaoId = $('#selKhoaDaoTao').val();
			$.ajax({
				url: '${pageContext.request.contextPath}/service/loadKeHoachHocTap',
				type: 'GET',
				dataType: "json",
				data:{
					nganhId: nganhId,
					khoaDaoTaoId: khoaDaoTaoId
				},
				success: function(data){
					console.log(data);
			        var $thead = $('<thead></thead>').append('<tr><td>TT</td><td>Mã số HP</td><td>Tên học phần</td><td>Số tín chỉ</td><td>Bắt buộc</td><td>Tự chọn</td><td>Số tiết LT</td><td>Số tiết TH</td><td>Học Phần TQ</td></tr>');
			        var $table = $('<table></table>',{
			        	'class':'table table-bordered table-hover'
			        });
			        $($thead).appendTo($table);
			        
			        for(var i = 0; i < countHocKyMacDinh(data.danhSachHocPhan); i++){
			        	var hk = i + 1;
			        	var str = 'Học kì ' + hk;
			        	var $tbody = createTable(getHocPhansByHocKy(data.danhSachHocPhan,i + 1),str);
					    $($tbody).appendTo($table);
			        }
			        $('#keHoachHocTap').append($table);
					
				}
			});
			
		});
	});
	</script>
</body>
</html>
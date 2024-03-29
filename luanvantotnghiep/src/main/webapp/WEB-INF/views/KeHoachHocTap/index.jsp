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
		  			<td><button id="inKeHoach" class="btn btn-info"><span class="fa fa-inbox fa-fw"></span>In kế hoạch học tập</button></td>
				</tr>
			</tbody>
		</table>
		</fieldset>
		<fieldset class="bs-example">
			<h3 class="title-field">Thông tin kế hoạch học tập</h3>
			<div id="thongTinChung"></div>			
			<div id="keHoachHocTap"></div>
		</fieldset>
		
		
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
		
		function arrayUnique(array) {
		    var a = array.concat();
		    for(var i=0; i<a.length; ++i) {
		        for(var j=i+1; j<a.length; ++j) {
		            if(a[i] === a[j])
		                a.splice(j--, 1);
		        }
		    }

		    return a;
		};
		
		function getHocKiMacDinhBySTT(array){
			var arrVarI = [];
			var arrVarJ = [];
			if(countHocKyMacDinh(array) == 1){
				if(array.length != 0)
					return array[0][1].hocKyMacDinh;
			}
			
			for(var i = 0; i < array.length; i++){
				var j = i + 1;
				if(i == array.length - 1){
					break;
				}
				if(array[i][1].hocKyMacDinh != array[j][1].hocKyMacDinh){
					arrVarI.push(array[i][1].hocKyMacDinh);
					arrVarJ.push(array[j][1].hocKyMacDinh);
				}
			}
			return arrayUnique(arrVarI.concat(arrVarJ));
		}
		
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
		
		function createTable(data,str){
			var dataTemp = data;
			var $tbody = $('<tbody></tbody>');
	    	var hocPhan = new Object();
	    	var chuongTrinhDaoTao = new Object();
	    	var rowCount = 0;
	    	var $tr = $('<tr></tr>');
	    	$($tr).append('<td colspan="10" class="danger"><strong>'+str+'</strong></td>');
	    	$($tr).appendTo($tbody);
	    	for(var i = 0; i < data.length; i++){
	    		var stt = i + 1;
	    		hocPhan = data[i][0];
	      		chuongTrinhDaoTao = data[i][1];
	      		rowCount = countItemInArray(data[i], getNhomTuChons(chuongTrinhDaoTao.nhomTuChon, data, i));
	      		$.ajax({
					url: '${pageContext.request.contextPath}/service/loadHocPhanTienQuyetKHHTByHocPhanId',
					type: 'GET',
					dataType: "json",
					data: {
						hocPhanId: hocPhan.hocPhanId
					},
					async: false,
					success: function(data){
						var j = 0;
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
						$($tr).append('<td>'+stt+'</td>')
						  .append('<td>'+hocPhan.maHP+'</td>')
						  .append('<td>'+hocPhan.tenHP+'</td>')
						  .append('<td style="vertical-align: middle; text-align: center">'+hocPhan.soTC+'</td>');
						
						if(chuongTrinhDaoTao.tuChon != '0'){
							 $($tr).append('<td style="vertical-align: middle; text-align: center"></td>');
						}	
						else{
							 $($tr).append('<td style="vertical-align: middle; text-align: center">'+hocPhan.soTC+'</td>');
						}
						var arrTemp = getNhomTuChons(chuongTrinhDaoTao.nhomTuChon, dataTemp, i);
					
						if(chuongTrinhDaoTao.tuChon != '0'){
							if(chuongTrinhDaoTao.nhomTuChon == '0'){
								$($tr).append('<td></td>');
							}
							else{
								if(j != rowCount){
									  $($tr).append('<td style="vertical-align: middle; text-align: center" rowspan="'+rowCount+'">'+chuongTrinhDaoTao.tuChon+'</td>');
								}
								else
								{
									if(arrTemp.length - 1 == 0)
									$($tr).append('<td style="vertical-align: middle; text-align: center">'+chuongTrinhDaoTao.tuChon+'</td>');
								}
							}			
						}else{
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
	    	var totalPointTuChon = 0;
	    	for(var i = 0; i < data.length; i++){
	    		hocPhan = data[i][0];
	    		chuongTrinhDaoTao = data[i][1];
	    		if(chuongTrinhDaoTao.tuChon == '0'){
	    			totalPoint += hocPhan.soTC;
	    		}
	    	}
	    	
	    	for(var i = 0; i < data.length; i++){
	    		var temp = 0;
	    		temp = i + 1;
	    		
	    		if(i == data.length - 1){
	    			break;
	    		}
	    		if(data[i][1].tuChon != '0'){
	    			if(totalPointTuChon == 0){
	    				totalPointTuChon += parseInt(data[i][1].tuChon);
		    		}
	    			
	    			if(parseInt(data[i][1].tuChon) != parseInt(data[temp][1].tuChon)){
	    				console.log("i: " + i);
	    				totalPointTuChon += parseInt(data[temp][1].tuChon);
	    			}
	    		}
	    	}
	    	
	    	var $tr = $('<tr></tr>');
	    	$($tr).append('<td colspan="3" class="success text-right" style="color: red"><strong>Tổng: </strong></td>');
	    	$($tr).append('<td></td>');
	    	$($tr).append('<td class="success text-center" style="color: red"><strong>'+totalPoint+'</strong></td>');
	    	$($tr).append('<td class="success text-center" style="color: red"><strong>'+totalPointTuChon+'</strong></td>');
	    	for(var i = 0; i < 3 ; i++){
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
				beforeSend: function(){
					$.blockUI({ 
						message: '<h4><img src="${pageContext.request.contextPath}/resources/assets/images/ajax-loader.gif" /> Loading...</h4>'
			        });
				},
				complete: function(){
					$.unblockUI();
				},
				success: function(data){
					console.log(data);
					var $tr = $('<tr></tr>');
					var $table1 = $('<table class="table" style="margin: 0 auto; width: 600px"></table>');
					$('<td><strong>Ngành học:</strong> '+data.tenNganh+'</td>').appendTo($tr);
					$('<td><strong>Hệ đào tạo:</strong> Chính quy</td>').appendTo($tr);
					$($tr).appendTo($table1);
					
					$tr = $('<tr></tr>');
					$('<td><strong>Mã ngành:</strong> '+data.maNganh+'</td>').appendTo($tr);
					$('<td><strong>Bộ môn:</strong> '+data.tenNganh+'</td>').appendTo($tr);
					$($tr).appendTo($table1);
					$tr = $('<tr></tr>');
					$('<td><strong>Đơn vị quản lý:</strong> Khoa Công nghệ Thông tin & TT</td>').appendTo($tr);
					$('<td></td>').appendTo($tr);
					$($tr).appendTo($table1);
					
					$('#thongTinChung').append($table1);
					
					
			        var $thead = $('<thead></thead>').append('<tr><td>TT</td><td>Mã số HP</td><td>Tên học phần</td><td>Số tín chỉ</td><td>Bắt buộc</td><td>Tự chọn</td><td>Số tiết LT</td><td>Số tiết TH</td><td>Học Phần TQ</td></tr>');
			        var $table = $('<table></table>',{
			        	'class':'table table-bordered table-hover'
			        });
			        $($thead).appendTo($table);
			        console.log(countHocKyMacDinh(data.danhSachHocPhan));
			        console.log(getHocKiMacDinhBySTT(data.danhSachHocPhan));
			        
			        if(getHocKiMacDinhBySTT(data.danhSachHocPhan).length != 0){
					    for(var i = 0; i < countHocKyMacDinh(data.danhSachHocPhan); i++){
					        	var hkMD = getHocKiMacDinhBySTT(data.danhSachHocPhan)[i];
					        	var str = 'Học kì ' + hkMD;
					        	var $tbody = createTable(getHocPhansByHocKy(data.danhSachHocPhan,hkMD),str);
							    $($tbody).appendTo($table);
					        }
				        
				        $('#keHoachHocTap').append($table);
				        
				        $('#keHoachHocTap').fadeIn(800,function(){
							$('html, body').animate({
								scrollTop: $("#keHoachHocTap").offset().top
							}, 800);
						});
			        }
				}
			});
			
		});
	});
	</script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.blockUI.js"></script>
</body>
</html>
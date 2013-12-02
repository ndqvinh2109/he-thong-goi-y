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
	
	.alert{
		display: none;
	}
	
	.err-text-sel{
		display:block;
		margin-top:40px;
		padding:10px
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
		<h3 class="title-field">Chọn ngành học và khóa đào tạo</h3>
		<div class="row">
			<div class="col-sm-3">
				<div class='form-group'>
					<label>Ngành học</label>
					<select title="Chọn ngành học của sinh viên" id="selNganh" class="col-lg-2 form-control">
						<option value="0">Chọn ngành</option>
		  				<c:forEach var="nganh" items="${nganhs}">
		  						<option value="${nganh.nganhId}">${nganh.tenNganh}</option>
		  				</c:forEach>
					</select>
					<div class="alert">
					Chọn ngành
					<a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
					</div>
				</div>
			</div>
			
			<div class="col-sm-3">
				<div class='form-group'>
					<label>Khóa đào tạo</label>
					<select title="Chọn khóa đào tạo của sinh viên" id="selKhoaDaoTao" class="col-lg-2 form-control">
						<option value="0">Chọn khóa đào tạo</option>
						<c:forEach var="khoaDaoTao" items="${khoaDaoTaos}">
							<option value="${khoaDaoTao.khoaDaoTaoId}">${khoaDaoTao.khoaDT}</option>
						</c:forEach>
	 				</select>
	 				<div class="alert">
	 				Chọn khóa đào tạo
	 				<a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
	 				</div>
				</div>
			</div>
		</div>
		<button id="inKeHoach" class="btn btn-primary" style="margin-top: 30px">In chương trình đào tạo</button>
		</fieldset>
		<fieldset class="bs-example">
			<h3 class="title-field">Nhập học phần</h3>
			<div class="row">
				<div class='col-sm-3'>
					<div class='form-group'>
						<label>Chọn khối kiến thức</label>
						<select title="Chọn khối kiến thức" id="selKhoiKienThuc" class="col-lg-2 form-control">
								<option value="0">Chọn Khối kiến thức</option>
								<option value="1">Khối kiến thức đại cương</option>
				  				<option value="2">Khối kiến thức cơ sở ngành</option>
				  				<option value="3">Khối kiến thức chuyên ngành</option>
			  			</select>
			  			<div class="alert">
			  			Chọn khóa kiến thức
			  			<a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
			  			</div>
					</div>
				</div>
			
				<div class='col-sm-3'>    
		            <div class='form-group'>
		                <label>Nhập mã học phần</label>
		               	<input title="Nhập mã số của học phần" id="maHocPhan" type="text" class="form-control" placeholder="Nhập mã học phần"/>
		           		<div class="alert">
		           		Nhập mã học phần
		           		<a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
		           		</div>
		            </div>
       			</div>
       			<div class='col-sm-3'>    
       			 <label>Tự chọn</label>
		           <div class="checkbox">
					  <label>
					    <input title="Click vào đây nếu học phần là tự chọn" type="checkbox" value="">
					    Học phần tự chọn
					  </label>
				   </div>
       			</div>
       			<div class='col-sm-3'>    
		            <div class='form-group hkmd pull-left' style="display: none">
		                <label>Nhóm học phần</label>
		               	<input title="Nhập thứ tự của nhóm học phần" type="number" class="form-control" id="nhomHocPhan" value="0">
		            	<div class="alert">
		           			Nhập nhóm hp
		           		<a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
		           		</div>
		            </div>
       			</div>
			</div>
			
			<div class="row">
				<div class='col-sm-3'>    
       			</div>
       			<div class='col-sm-3'>    
		            <div class='form-group'>
		                <label>Nhập tên học phần</label>
		               	<input title="Tên của học phần" type="text" class="form-control" placeholder="Nhập tên học phần" id="tenHocPhan"/>
		            </div>
       			</div>
       			<div class='col-sm-3'>    
		            <div class='form-group pull-left'>
		                <label>Học kỳ mặc định</label>
		               	<input title="Nhập học kì mặc định" type="number" class="form-control" id="hocKyMacDinh" value="0">
		           		<div class="alert">
		           		Nhập học kì
		           		<a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
		           		</div>
		            </div>
       			</div>
       			
       			<div class='col-sm-3'>    
		            <div class='form-group pull-left hkmd' style="display: none">
		                <label>Số tín chỉ tự chọn</label>
		               	<input title="Nhập tín chỉ tự chọn" type="number" class="form-control" id="tinChiTuChon" value="0">
		           		<div class="alert">
		           		Nhập tín chỉ tự chọn
		           		<a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
		           		</div>
		            </div>
       			</div>
			</div>
			<div class="col-sm-12">
				<div class="alert-exist" style="display: none"></div>
				<button type="button" class="btn btn-primary" id="themHocPhan">Thêm học phần</button>
			</div>
		</fieldset>
		<fieldset class="bs-example">
		<h3 class="title-field">Chương trình đào tạo</h3>
		<div id="thongTinChung"></div>			
		<div class="alert-success" style="display: none"><strong>Thêm học phần thành công</strong></div>			
		<div id="chuongTrinhDaoTao"></div>
		</fieldset>
		
		
		
	</div>
	<script src="${pageContext.request.contextPath}/resources/assets/js/chuongtrinhdaotao.js"></script>
	<script type="text/javascript">
	function contains(a, obj) {
	    for (var i = 0; i < a.length; i++) {
	        if (a[i] === obj) {
	            return true;
	        }
	    }
	    return false;
	}
	function validate(){
		var arr = [3, 4, 5, 6];
		var arrChild = [4, 6];
		$.each($('.alert'),function(i, element){
			if($(element).prev().val() == '0' || $(element).prev().val() == ''){
				if(contains(arr,i)){
					$(element).addClass('alert-danger err-text-sel').css("margin-top", "5px");
					$(element).parent().addClass('has-error');
					if(!$(':checkbox').prop("checked") && contains(arrChild,i)){
						$(element).removeClass('alert-danger err-text-sel').css("display", "none");
						$(element).parent().removeClass('has-error');
					}
				}
				else {
					$(element).addClass('alert-danger err-text-sel');
					$(element).parent().addClass('has-error');
				}
			}
			else{
				$(element).removeClass('alert-danger err-text-sel').css("display", "none");
				$(element).parent().removeClass('has-error');
			}
		});
	}
	
	function checkExistHocPhan(){
		var nganhId = $('#selNganh').val();
		var khoaDaoTaoId = $('#selKhoaDaoTao').val();
		var maHocPhan = $('#maHocPhan').val();
		$.ajax({
			url: '${pageContext.request.contextPath}/service/checkExistHocPhan',
			type: 'GET',
			dataType: "json",
			async: false,
			data : {
				nganhId: nganhId,
				khoaDaoTaoId: khoaDaoTaoId,
				maHocPhan: maHocPhan
			},
			success: function(data){
				if(!data){
					var html = $("<span><strong>Bạn đã thêm học phần này vào chương trình đào tạo</strong></span>");
					$('.alert-exist').css({"display":"block", "padding": "10px", "margin-bottom": "10px"}).addClass("alert-danger text-center").html(html);
				}
				else{
					$('.alert-exist').css("display","none").removeClass('alert-danger');
				}
				
			}
		});	
		
	}
		
		$(document).ready(function(){
			$('.form-control').tooltip();
			$('#maHocPhan').keyup(function(event){
				var maHocPhan = $('#maHocPhan').val();
				
					$.ajax({
						url: '${pageContext.request.contextPath}/service/loadHocPhanByMaHocPhan',
						type: 'GET',
						dataType: "json",
						data : {
							maHocPhan: maHocPhan,
						},
						success: function(data){
							if(data.hocPhan != null){
								$('#tenHocPhan').val(data.hocPhan.tenHP);
							}
						}
					});
				
			});
			
			$('#nhomHocPhan').click(function(){
				var nhomHocPhan = $('#nhomHocPhan').val();
				var khoiKienThuc = $('#selKhoiKienThuc').val();
				$.ajax({
					url: '${pageContext.request.contextPath}/service/loadSoTinChiTuChon',
					type: 'GET',
					dataType: "json",
					data : {
						nhomHocPhan: nhomHocPhan,
						khoiKienThuc: khoiKienThuc
					},
					success: function(data){
						$('#tinChiTuChon').val(data);
					}
				});
			});
			
			$('#themHocPhan').click(function(){
				validate();
				checkExistHocPhan();
				var nganhId = $('#selNganh').val();
				var khoaDaoTaoId = $('#selKhoaDaoTao').val();
				var khoiKienThuc = $('#selKhoiKienThuc').val();
				var maHocPhan = $('#maHocPhan').val();
				var nhomHocPhan = $('#nhomHocPhan').val();
				var hocKyMacDinh = $('#hocKyMacDinh').val();
				var tuChon = $(':checkbox').prop("checked");
				var tinChiTuChon = $('#tinChiTuChon').val();
				
				if(!$('.alert').hasClass("alert-danger")){
					if(!$('.alert-exist').hasClass("alert-danger")){
					$.ajax({
						url: '${pageContext.request.contextPath}/service/themHocPhan',
						type: 'GET',
						dataType: "json",
						data : {
							nganhId: nganhId,
							khoaDaoTaoId: khoaDaoTaoId,
							khoiKienThuc: khoiKienThuc,
							maHocPhan: maHocPhan,
							nhomHocPhan: nhomHocPhan,
							hocKyMacDinh: hocKyMacDinh,
							tuChon: tuChon,
							tinChiTuChon: tinChiTuChon
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
							if(data){
								$('.alert-success').css({"display":"block", "padding": "10px", "margin-bottom": "10px"}).addClass("alert-info text-center").fadeOut(3000);
							}	
							
							$('#chuongTrinhDaoTao').empty();
							$('#thongTinChung').empty();
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
									$('#chuongTrinhDaoTao').empty();
									$('#thongTinChung').empty();
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
											$('#chuongTrinhDaoTao').fadeIn(800,function(){
												$('html, body').animate({
													scrollTop: $("#chuongTrinhDaoTao").offset().top
												}, 800);
											});
										
										}
									});
								}
							});
						}
					});
				}
			}
			});
			
			$('.checkbox').click(function(){ 
				if($(':checkbox').prop("checked")){
			    	$('.hkmd').css({"display": "inline"});
			    }else{
			    	$('.hkmd').css("display", "none");
			    }
			});
			
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
				var dataTemp = data;
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
		      		console.log(rowCount);
		      		$.ajax({
						url: '${pageContext.request.contextPath}/service/loadHocPhanTienQuyetByHocPhanId',
						type: 'GET',
						dataType: "json",
						data: {
							hocPhanId: hocPhan.hocPhanId
						},
						async: false,
						success: function(data){
							console.log(data);
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
							
							var arrTemp = getNhomTuChons(chuongTrinhDaoTao.nhomTuChon, dataTemp, i);
							
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
							
								 
														  
						  $($tr).append('<td style="vertical-align: middle; text-align: center">'+hocPhan.soTietLT+'</td>')
						  .append('<td style="vertical-align: middle; text-align: center">'+hocPhan.soTietTH+'</td>')
						  .append('<td>'+strTemp+'</td>');
						  
						$($tr).appendTo($tbody);
						}
					});		  
				}
				return $tbody;
			}
			// Test
			$('#inKeHoach').click(function(){
				$('#chuongTrinhDaoTao').empty();
				$('#thongTinChung').empty();
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
						$('#chuongTrinhDaoTao').fadeIn(800,function(){
							$('html, body').animate({
								scrollTop: $("#chuongTrinhDaoTao").offset().top
							}, 800);
						});
					
					}
				});
				
			});
			
		});
	</script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.blockUI.js"></script>
</body>
</html>
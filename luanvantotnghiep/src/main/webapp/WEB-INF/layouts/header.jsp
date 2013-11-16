<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <div class="navbar navbar-default">
	 	<div class="container">
        <div class="navbar-header">
        	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#"><i class="fa fa-home fa-fw"></i> Hệ thống gợi ý</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="${pageContext.request.contextPath}/service/chuongtrinhdaotao"><i class="fa fa-book fa-fw"></i> Chương trình đào tạo</a></li>
			<li><a href="${pageContext.request.contextPath}/service/kehoachhoctap">Kế hoạch học tập</i></a></li>
            <li><a href="${pageContext.request.contextPath}/service/dudoandiemhocphan">Dự đoán điểm học phần</i></a></li>
			
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-pencil fa-fw"></i> Cập nhật <b class="caret"></b></a>
              <ul class="dropdown-menu" style="width: 200px">
            	  <li class="dropdown-header">Thông tin chung</li>
                <li><a href="#">Bộ Môn</a></li>
                <li><a href="#">Ngành</a></li>
                <li><a href="#">Khoa chủ quản</a></li>
                <li><a href="#">Lớp</a></li>
                <li><a href="${pageContext.request.contextPath}/service/sinhvien">Sinh viên</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">Thông tin kế hoạch học tập</li>
                <li><a href="#">Học phần</a></li>
                <li><a href="#">Chương trình đào tạo</a></li>
                <li><a href="<c:url value="${pageContext.request.contextPath}/j_spring_security_logout"/>">Đăng xuất</a></li>
              </ul>
            </li>
          </ul>
          
        </div><!--/.nav-collapse -->
        </div>
      </div>
</body>
</html>
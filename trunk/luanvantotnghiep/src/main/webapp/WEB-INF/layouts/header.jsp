<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
          <a class="navbar-brand" href="${pageContext.request.contextPath}/service/homepage"><i class="fa fa-home fa-fw"></i> Hệ thống gợi ý</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="${fn:contains(requestScope['javax.servlet.forward.request_uri'],'/chuongtrinhdaotao')? 'active' : ''}"><a href="${pageContext.request.contextPath}/service/chuongtrinhdaotao"><i class="fa fa-book fa-fw"></i> Chương trình đào tạo</a></li>
			<li class="${fn:contains(requestScope['javax.servlet.forward.request_uri'],'/kehoachhoctap')? 'active' : ''}"><a href="${pageContext.request.contextPath}/service/kehoachhoctap"><i class="fa fa-clipboard fa-fw"></i>Kế hoạch học tập mẫu</i></a></li>
            <li class="${fn:contains(requestScope['javax.servlet.forward.request_uri'],'/dudoandiemhocphan')? 'active' : ''}"><a href="${pageContext.request.contextPath}/service/dudoandiemhocphan"><i class="fa fa-file-text fa-fw"></i>Dự đoán điểm học phần</i></a></li>
			<li class="${fn:contains(requestScope['javax.servlet.forward.request_uri'],'/khhtsinhvien')? 'active' : ''}"><a href="${pageContext.request.contextPath}/service/khhtsinhvien"><i class="fa fa-archive fa-fw"></i>Kế hoạch học tập sinh viên</i></a></li>
			
          </ul>
          <ul class="nav pull-right navbar-nav">
          	<li><a href="<c:url value="${pageContext.request.contextPath}/j_spring_security_logout"/>"><i class="fa fa-sign-out fa-fw"></i>Đăng xuất</a></li>
          </ul>
        </div><!--/.nav-collapse -->
        </div>
      </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng nhập</title>
<link rel="shortcut icon" href="http://www.google.com/s2/favicons?domain=http://www.ctu.edu.vn/" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/libs/bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/libs/FontAwesome/css/font-awesome.min.css"/>
<script src="${pageContext.request.contextPath}/resources/assets/libs/Jquery/jquery-1.8.3.min.js"></script>
</head>
<body>

<div class="panel panel-primary col-md-offset-4" style="width: 500px; margin-top:20px">
	  <div class="panel-heading">Login</div>
  <c:if test="${not empty param.login_error}">
	<div class="alert alert-danger text-center">
  		<c:out value="${fn:replace(SPRING_SECURITY_LAST_EXCEPTION.message, 'Bad credentials', 'Tên đăng nhập/ Mật khẩu chưa chính xác')}"/>.
  	</div>
  </c:if>
  <div class="panel-body">
   	<form class="form-horizontal" action="<c:url value='j_spring_security_check'/>" method="POST">
	  <div class="form-group">
	    <label for="username" class="col-md-3 control-label">Username</label>
	    <div class="col-md-8">
	      <input type="text" class="form-control" id="username" name='j_username' placeholder="Username" />
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <label for="password" class="col-md-3 control-label">Password</label>
	    <div class="col-md-8">
	      <input type="password" name='j_password' class="form-control" id="password" placeholder="Password">
	    </div>
	  </div>
	  <div class="form-group">
	    <div class="col-md-offset-3 col-md-4">
	      <div class="checkbox">
	        <label>
	          <input type="checkbox" name="_spring_security_remember_me"> Remember me
	        </label>
	      </div>
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <div class="col-md-offset-3 col-md-4">
	      	<input type="submit"  class="btn btn-primary" name="submit" value="Đăng nhập" id="login">
	    </div>
	  </div>
	  
	</form>
	</div>
</div>
<script src="${pageContext.request.contextPath}/resources/assets/libs/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
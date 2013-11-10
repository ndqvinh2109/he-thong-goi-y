<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bundles/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bundles/font-awesome.css"/>  
<script src="${pageContext.request.contextPath}/bundles/jquery.js"></script>
</head>
<body>
	<form class="form-horizontal" role="form" action="<c:url value='j_spring_security_check'/>" method="POST">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Username</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputEmail3" name='j_username' placeholder="Username">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-10">
      <input type="password" name='j_password' class="form-control" id="inputPassword3" placeholder="Password">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label>
          <input type="checkbox" name="_spring_security_remember_me"> Remember me
        </label>
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      	<input type="submit"  class="btn btn-default" name="submit" value="Đăng nhập" id="login">
    </div>
  </div>
</form>
      <script src="${pageContext.request.contextPath}/bundles/bootstrap.js"></script>
</body>
</html>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<link rel="shortcut icon" href="http://www.google.com/s2/favicons?domain=http://www.ctu.edu.vn/" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/libs/bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/main.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/libs/FontAwesome/css/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/libs/bootstrap3-editable/css/bootstrap-editable.css"/>
<script src="${pageContext.request.contextPath}/resources/assets/libs/Jquery/jquery-1.8.3.min.js"></script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<tiles:insertAttribute name="header"/>
	</div>	
	<div class="content container" id="body-div">
		<tiles:insertAttribute name="body" />
	</div>
	
	<div id="footer">
		<tiles:insertAttribute name="footer" />
	</div>
</div>
	<script src="${pageContext.request.contextPath}/resources/assets/libs/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/libs/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
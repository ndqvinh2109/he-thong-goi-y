<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bundles/bootstrap.css" />
<style type="text/css">
body {
	margin: 0;
	font-family: "Open Sans", sans-serif;
	font-size: 14px;
	line-height: 20px;
	color: #2c3e50;
	background-color: #f6f6f6;
	height:100%;
}
#wrap{
	min-height: 100%;
	height: auto !important;
}

#footer #push {
	padding-top: 10px;
	background-color: #297db6;
	color: #ffffff;
	height: 70px;
}

.content {
	margin-top: 10px;
	margin-bottom: 40px
}



</style>
</head>
<body>
	<div id="wrap">
		<tiles:insertAttribute name="header"/>
		<div class="content container" id="body-div">
		<tiles:insertAttribute name="body" />
	</div>
	</div>
	<div id="footer">
		<tiles:insertAttribute name="footer" />
	</div>
	<script src="${pageContext.request.contextPath}/bundles/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/bundles/bootstrap.js"></script>
</body>
</html>
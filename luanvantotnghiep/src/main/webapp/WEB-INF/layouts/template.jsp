<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bundles/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bundles/font-awesome.css"/>  
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bundles/jqueryUi.css"/>
<script src="${pageContext.request.contextPath}/bundles/jquery.js"></script>
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
	<script src="${pageContext.request.contextPath}/bundles/bootstrap.js"></script>
</body>
</html>
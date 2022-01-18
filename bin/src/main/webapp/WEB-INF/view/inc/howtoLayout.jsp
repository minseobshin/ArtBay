<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><tiles:getAsString name="title" /></title>
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/index.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="js/index.js"></script>
</head>
<body>
	<!-- 헤더 부분 -->
	<tiles:insertAttribute name="header" />
	
	<tiles:insertAttribute name="visual" />

	
	<tiles:insertAttribute name="aside" />
	
	<!-- 바디 부분 -->
	<tiles:insertAttribute name="body" />
	
	<!-- 풋터 부분 -->
	<tiles:insertAttribute name="footer" />
</body>
</html>
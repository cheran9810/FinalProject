<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">
a{

	text-decoration:none;
	color : #ffffff;
}
</style>
<hr>
<div class = "container">
	<div class="text-center">
	<ul class="nav nav-tabs nav-justified">
		<li role="presentation"><a href="/interceptor/admin/QAlist">Q&A 게시판</a></li>
		<li role="presentation"><a href="/interceptor/admin/boardreport">게시글 관리</a></li>
		 <li role="presentation"><a href="/interceptor/admin/commentreport">댓글 관리</a></li>
	</ul>
	</div>
</div>
<br>
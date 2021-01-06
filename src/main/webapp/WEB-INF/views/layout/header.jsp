<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀벌마켓</title>
<link rel="stylesheet" href="/resources/css/homestyle.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3.3.2 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">
header {
	background-color: white;
	margin-top: -10px;
}

.mynav {
	margin-left: 40px;
}

.floating {
	border: 1px solid black;
	position: fixed;
	right: 50%;
	top: 180px;
	margin-right: -720px;
	text-align: center;
	width: 120px;
}

.left {
	margin-left: 300px;
}
</style>
</head>
<body>
	<div class="content">
		<header id="fixed-bar">
			<div class="logo" style="margin-right: 30px;">
				<h2 class="img">
					<a href = "/"><img src="/resources/images/logo.jpg"
						style="width: 15%; height: 15%;"></a>
				</h2>
			</div>
			<nav class="mynav">
				<ul>
					<li><a href="/">사이트 소개</a></li>
					<li><a href="/trade/list">중고거래</a></li>
					<c:choose>
						<c:when test="${empty login }">
							<li><a href="/member/login">로그인</a></li>
<!-- 							<li><a href="/member/login">마이페이지</a></li> -->
							<li><a href="/member/join">회원가입</a></li>
						</c:when>
						<c:when test="${! empty login}">
							<li><a href="/member/logout">로그아웃</a></li>
							<c:if test="${id eq 'admin' }">
							<li><a href="/interceptor/admin/QAlist">관리자페이지</a></li>
							</c:if>
							<c:if test="${id ne 'admin' }">
							<li><a href="/mypage/mypage">마이페이지</a></li>
							</c:if>
							<li>${id }님 안농!${userdata.NICK }</li>
						</c:when>
					</c:choose>

				</ul>
			</nav>
			
			<span class="target"></span>
			<script src="/resources/js/main.js"></script>
		</header>
	</div>
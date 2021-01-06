<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/resources/css/homestyle.css?after">

<style type="text/css">

.mynav {
	border-bottom: 1px solid #ccc;
}
	
</style>

</head>
<body>
	<div class="content">
		<header id="fixed-bar">
			<div class = "logo" style="margin-right: 30px;">
			<h2><a href = "/"><img src = "/resources/images/logo.jpg" style = "width: 15%; height: 15%;"></a></h2>
			</div>
			<nav class="mynav">
				<ul>
					<li><a href="/mypage/mypage" >내 정보</a></li>
					<li><a href="/mypage/myscrap" >찜한 상품</a></li>
					<li><a href="/mypage/mypost" >내가 쓴 게시글</a></li>
					<li><a href="/mypage/mycomment" >내가 쓴 댓글</a></li>
					<li><a href="/member/QAlist" >문의사항</a></li>
				</ul>
				<br>
			</nav>
			<span class="target"></span>
			<script src="/resources/js/main.js"></script>
		</header>
	</div>


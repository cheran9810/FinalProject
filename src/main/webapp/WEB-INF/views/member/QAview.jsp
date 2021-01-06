<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/views/header/mypageheader.jsp?after" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
});
</script>

<style type="text/css">
td.info {
	width: 10%;
}
td:not(.info) {
	width: 40%;
}
.btn {
	background-color: #FFD700;
	width : 70px;
 	margin-left: 10px; 
	float: right;
	
	
}
a{

	text-decoration:none;
	color : #000000;
}
</style>

<div class="container">
<br><br>

	<table class="table table-bordered">
		<tr>
			<td class="info">글번호</td>
			<td >${view.qPk }</td>
			<td class="info">아이디</td>
			<td >${view.userEmail}</td>
		</tr>

		<tr>
			<td class="info">카테고리</td>
			<td >${view.qCategory }</td>
			<td class="info">제목</td>
			<td >${view.qTitle }</td>
		</tr>

		<tr>
			<td class="info" colspan="4">본문</td>
		</tr>

		<tr>
			<td colspan="4">${view.qContent }</td>
		</tr>

	</table>

	<a href="/member/QAlist"><button class="btn btn-default">목록</button></a>

<!-- 버튼 영역 -->
<!-- <div class="text-left"> -->
<!-- 	<a href="/board/list"><button class="btn btn-default">목록</button></a> -->
<!-- </div>버튼 영역 end -->

<div class="text-right">
	<c:if test="${id eq 'admin' }">
	<a href="/interceptor/admin/QAwrite?qPk=${view.qPk }"><button class="btn btn-primary">답변 작성</button></a>
	</c:if>
	<c:if test="${id eq view.userEmail }">
	<a href="/member/QAdelete?qPk=${view.qPk }"><button class="btn btn-danger">삭제</button></a>
	<a href="/member/QAupdate?qPk=${view.qPk }"><button class="btn">수정</button></a>
	</c:if>

</div>

</div><!-- .container -->
<br>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
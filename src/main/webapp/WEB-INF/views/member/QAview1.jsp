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
</style>

<div class="container">

<h1 class="pull-left">게시글 상세보기</h1>
<div class="clearfix"></div>
<hr>

	<table class="table table-bordered">
		<tr>
			<td class="info">글번호</td>
			<td colspan="3">${view.aPk }</td>
		</tr>


		<tr>
			<td class="info">제목</td>
			<td colspan="3">${view.aTitle }</td>
		</tr>

		<tr>
			<td class="info" colspan="4">본문</td>
		</tr>

		<tr>
			<td colspan="4">${view.aContent }</td>
		</tr>

	</table>
	<a href="/member/QAlist"><button class="btn btn-default">목록</button></a>

<div class="text-right">
	<c:if test="${id eq 'admin' }">
	<a href="/interceptor/admin/QAupdate?aPk=${view.aPk }"><button class="btn btn-primary">수정</button></a>
	<a href="/interceptor/admin/QAdelete?aPk=${view.aPk }"><button class="btn btn-danger">삭제</button></a>
	</c:if>
</div>


</div><!-- .container -->
<br>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
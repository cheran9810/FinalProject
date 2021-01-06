<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/views/header/adminheader.jsp" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
function openWin(){  
    window.open("/interceptor/admin/memberdelete?id=${b.USER_EMAIL }", "회원탈퇴", "width=500, height=220, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
}  

</script>
<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: center;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}

td{

text-align: center;
}
</style>
<div class="container">
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th style="width: 10%">댓글번호</th>
				<th style="width: 15%">작성자</th>
				<th style="width: 25%">내용</th>
				<th style="width: 10%">신고수</th>
				<th style="width: 10%">댓글 삭제</th>
				<th style="width: 10%">회원 탈퇴</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="b">
				<tr>
					<td>${b.COMMENTNO }</td>
					<td>${b.USERID }</td>
					<td>${b.CONTENT }</td>
					<td>${b.CNT }</td>
					<td><a href="/interceptor/admin/commentdelete?commentNo=${b.COMMENTNO }"><button class ="btn btn-info">댓글 삭제</button></a></td>
					<td><button class ="btn btn-info" onclick="javascript:openWin();">회원 탈퇴</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

<!-- 새로 페이징 만들어서 가져오기 -->
<!-- 	<div class="clearfix"></div> -->
	<jsp:include page="/WEB-INF/views/util/commentreportpaging.jsp" />
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
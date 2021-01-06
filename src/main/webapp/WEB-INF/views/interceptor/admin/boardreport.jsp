<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/views/header/adminheader.jsp" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
function openWin(ID){  
    window.open("/interceptor/admin/memberdelete?id="+ID, "회원탈퇴", "width=500, height=220, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
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
</style>
<div class="container">
	<table class="table table-hover">
		<thead>
			<tr>
				<th style="width: 10%">글번호</th>
				<th style="width: 15%">작성자</th>
				<th style="width: 25%">제목</th>
				<th style="width: 10%">신고수</th>
				<th style="width: 10%">게시글 삭제</th>
				<th style="width: 10%">회원 탈퇴</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="b">
				<tr>
					<td>${b.REG_NO }</td>
					<td>${b.USER_EMAIL }</td>
					<!-- 여기 링크 걸기 -->
					
					<td><a href="/trade/view?regNo=${b.REG_NO }">${b.TITLE }</a></td>
					<td>${b.CNT }</td>
					<td><a href="/interceptor/admin/boarddelete?regNo=${b.REG_NO }"><button class ="btn btn-info">게시글 삭제</button></a></td>
					<td><button class ="btn btn-info" onclick="javascript:openWin('${b.USER_EMAIL}');">회원 탈퇴</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

<!-- 새로 페이징 만들어서 가져오기 -->
<!-- 	<div class="clearfix"></div> -->
	<jsp:include page="/WEB-INF/views/util/boardreportpaging.jsp" />
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
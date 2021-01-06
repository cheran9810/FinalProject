<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:import url="/WEB-INF/views/header/mypageheader.jsp?after" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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

.btn {
	background-color: #FFD700;
	width : 100px;
	margin-left: 30px;
	float: right;
		border-radius: 4px;	
	
	
}

a{

	text-decoration:none;
	color : #000000;
}
</style>
<div class="container">

<br><br>
	
	<table class="table">
		<thead>
			<tr>
				<th style="width: 10%">글번호</th>
				<th style="width: 30%">제목</th>
				<th style="width: 20%">작성자</th>
				<th style="width: 10%">카테고리</th>
				<th style="width: 15%">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="b">
				<tr>
					<td>${b.Q_PK }</td>
					<td><a href="/member/QAview?qPk=${b.Q_PK }">${b.Q_TITLE }</a></td>
					<td>${b.USER_EMAIL }</td>
					<td>${b.Q_CATEGORY }</td>
					<td><fmt:formatDate value="${b.Q_DATE }" pattern="yy-MM-dd" /></td>
				</tr>
				<c:if test="${b.A_PK != null }">
				<tr class="active">
					<td>${b.A_PK }</td>
					<td><a href="/member/QAview1?aPk=${b.A_PK }">${b.A_TITLE }</a></td>
					<td></td>
					<td>답변</td>
					<td><fmt:formatDate value="${b.A_DATE }" pattern="yy-MM-dd" /></td>
				</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
	
		<div>
		<a href="/member/QAwrite"><button class="btn">문의 작성</button></a>
		</div>

	<div class="clearfix"></div>
	<jsp:include page="/WEB-INF/views/util/QAmemberpaging.jsp" />
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
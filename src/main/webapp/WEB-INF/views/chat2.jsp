<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Simple Chat</title>
</head>
<body>
	<table>
		<tr>
			<th>이메일</th>
			<th>nick</th>
		</tr>
		<c:forEach items="${list }" var="item">
			<tr>
				<%-- 클릭해서 팝업띄울때 value로 유저아이디를 전달해줌.. --%>
				<td><a href="#" >${item.nick}</a></td>
				<td><button class="parameter" value="${item.id}" onclick="window.open('/chatroom?email=${item.id}&nickName=${item.nick}','width=430,height=500,location=no,status=no,scrollbars=yes')"> ${item.id}</button></td>
			</tr>
		</c:forEach>
	</table>
	<a href="/chattingList">나의 채팅목록으로 이동</a>

</body>
</html>
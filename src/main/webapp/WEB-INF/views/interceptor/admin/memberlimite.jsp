<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/interceptor/admin/memberlimite" method="post">
	<input type="text" value="${param.type }" name="type" id="type"/>
	달력 표시
	<button>제한 버튼</button>
	<button>취소</button>
	</form>
</body>
</html>
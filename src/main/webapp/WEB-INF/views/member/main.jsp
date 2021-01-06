<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<style>
.container{
	text-align: center;
}
</style>
<div class="container">

<h1>메인화면</h1>
<hr>
<div>

<c:choose>
	<c:when test="${empty login }">
		<a href="/member/login">로그인</a>
	</c:when>
	<c:when test="${! empty login}">
		<b>${login.nick }</b>님, 반갑습니다.
	</c:when>
</c:choose>


<hr>
	<a href="/">목록</a>
</div>

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />

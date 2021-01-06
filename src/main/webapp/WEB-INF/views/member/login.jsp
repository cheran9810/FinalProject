<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {  // 뒤로가기
	$("#cancel").click(function() {
			history.back(-1);
	});
		
	$("#id").focus();
});


</script>


<style type="text/css">

.btn {
	background-color: #FFD700;
	width : 290px;
	margin-right : 50px;	

}

.center {
	display: inline-block;
	left: 50%;
	margin: 0 auto; 

}*
.form-control{
	 margin-left :58px; 
	width : 290px
	
}
.form-group {
	margin-left : 50px;
text-align: center;
}

.container {
	text-align: center;
} 

.text{

margin-left : -50px;	
}
</style>

<div class="container">


	<h1 class ="text">로그인</h1>
	<!--  --><br><br>
	<div class="center">

		<!-- 일반 -->
		<form action="/member/weblogin" method="post" class="form-horizontal">

			<div class="form-group">
	<!-- 			<label class="col-xs-4 control-label" for="id">아이디 : </label> -->
				<div class="col-xs-8">
					<input type="text" class="form-control" id="id" name="id"
						placeholder="Id" />
				</div>
			</div>

			<div class="form-group">
		<!-- 		<label class="col-xs-4 control-label" for="pw">패스워드 : </label> -->
				<div class="col-xs-8">
					<input type="password" class="form-control" id="pw" name="pw"
						placeholder="Password" />
				</div>
			</div>
			

			<div class="form-group">
				<!-- <div class="col-xs-offset-3 col-xs-10"> -->
					<button class="btn">로그인</button>
					<!-- type="reset" 때문에 새로고침 -->
				<!-- </div> -->
			</div>

		</form>

		<!-- 	-----------------네이버-------------------- -->
		<!-- <div  class=" kaka"> -->
			<div id="naver_id_login" style="text-align: center" class ="naver">
				<a href="${naverUrl}"> <img width="223"
					src="${pageContext.request.contextPath}/resources/images/naver.png" />
				</a>
				<a href="${kakaoUrl}"> <img width="223"
					src="${pageContext.request.contextPath}/resources/images/kakao.png" />
				</a>
			</div>

	</div>

</div>
	<center>

<!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>title</title>



	
<style type="text/css">
.header {
	text-align: center;
}

.footer {
	text-align: center;
}

#mytype {
	width:100px;

}

.glyphicon-chevron-left:before {
    content: "\e079";
    color: green;
}
.glyphicon-chevron-right:before {
    content: "\e079";
    color: green;
}

  /* 사이드바 래퍼 스타일 */
  
#page-wrapper {
  padding-left: 100px;
}

#sidebar-wrapper {
  position: absolute;
  width: 250px;
  height: 100%;
  margin-left: -250px;
  background: #fff;
  overflow-x: hidden;
  overflow-y: auto;
}

#page-content-wrapper {
  width: 100%;
  padding: 20px;
}

/* 사이드바 스타일 */

.sidebar-nav {
  width: 250px;
  margin: 0;
  padding: 0;
  list-style: none;
}

.sidebar-nav li {
  text-indent: 1.5em;
  line-height: 2.8em;
}

.sidebar-nav li a {
  display: block;
  text-decoration: none;
  color: #999;
}

.sidebar-nav li a:hover {
  color: #fff;
  background: #828282;
}

.sidebar-nav > .sidebar-brand {
  font-size: 1.3em;
  line-height: 3em;
}

.carousel-control {
	width: 0%;
}
.form-horizontal .form-group {
    margin-right: 0px;
    margin-left: 0px;
}
</style>

<!-- Bootstrap cdn 설정 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- 스마트 에디터2 라이브러리 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>



<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnWrite").click(function() {
		//스마트에디터의 내용을 <textare>에 적용하기
		submitContents( $("#btnWrite") );
		
	$("#cancel").click(function() {
		history.go(-1);
	});
});
</script>


</head>



<body>


<div class="container">
	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/layout/header.jsp" />
	

		<br>
		<br>
  		
 	<form action="/trade/update" method="post" style="margin:0 auto; width:800px;">
 	<input type="hidden"  name = "regNo"value=" ${view.regNo } "/>

		<div class="form-group col-md-6">
			<label for="inputState">게시글 유형을 선택하세요</label> 
			<select id="inputState" name="tradeClass"
				class="form-control" style="width: 350px">
				<option selected  value="구매">구매 합니다</option>
				<option selected value="${view.tradeClass }">${view.tradeClass}</option>
				<option value="판매">판매 합니다</option>
			</select>
		</div>
		<div class="form-group col-md-6">
				<label for="inputState">카테고리</label> 
				<select id="inputState" style="width: 350px" name="category"	class="form-control">
					<option selected>${view.category }</option>
					<option value="디지털/가전">디지털/가전</option>
					<option value="가구/인테리어">가구/인테리어</option>
					<option value="유아동/유아도서">유아동/유아도서</option>
					<option value="생활/가공식품">생활/가공식품</option>
					<option value="스포츠/레저">스포츠/레저</option>
					<option value="여성잡화">여성잡화</option>
					<option value="여성의류">여성의류</option>
					<option value="남성패션/잡화">남성패션/잡화</option>
					<option value="게임/취미">게임/취미</option>
					<option value="뷰티/미용">뷰티/미용</option>
					<option value="반려동물용품">반려동물용품</option>
					<option value="도서/티켓/음반">도서/티켓/음반</option>
					<option value="식물">식물</option>
					<option value="기타중고물품">기타중고물품</option>
				</select>
		</div>
		<div class="form-group col-md-6">
			<div><label for="InPutPrice">가격 제안</label></div>
			<input	type="text" class="form-control" value="${view.price}" id="price" name="price" placeholder="0원" maxlength="9" style="width:350px;display: inline-block;">
			<div class="col-5" style="display:inline-block;">원</div>
		</div>
		
		<div class="form-group col-md-6">
			<div><label for="quantity">수량</label></div>
			<input	type="number" class="form-control" id="quantity" value="${view.quantity}"name="quantity" maxlength="9" style="width:350px;display: inline-block;">
			
		</div>
			<div class="form-group col-md-12">
				<label for="title">제목</label>
			<input	type="text" class="form-control" id="title" name="title" value="${view.title}" />
			</div>

			<div class="form-group col-md-12">
				<label for="content">본문</label>
				<textarea rows="10" style="width: 100%" id="content" name="content">${view.content }</textarea>
			</div>
			<div class="text-center form-group col-md-12">
				<button class="btn btn-primary" id="btnWrite">작성</button>
				<input type="reset" id="cancel" class="btn btn-danger" value="취소" />
			</div>
	</form>
		
	
<script>
	

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content", //에디터가 적용될 <textarea>의 id
	sSkinURI: "/resources/se2/SmartEditor2Skin.html", //에디터 스킨
	fCreator: "createSEditor2"
})
</script>
 
<!-- // <form>태그가 submit되면 스마트에디터에 작성된 내용이 <textarea>에
//적용되도록 하는 코드
function submitContents(elClickedObj) {
	
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		elClickedObj.form.submit();
	} catch(e) { }
	
}  -->



	
	</div>

	<c:import url="/WEB-INF/views/layout/footer.jsp" />
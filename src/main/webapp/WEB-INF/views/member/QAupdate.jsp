<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/views/header/mypageheader.jsp?after" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript"
	src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
	$(document).ready(function() {

		$("#btnWrite").click(function() {
			
			submitContents($("#btnWrite"));

			$("form").submit();
		})

		$("#cancel").click(function() {
			history.go(-1);
		})
	})
</script>

<div class="container">

	<h1>문의 작성</h1>
	<hr>

	<form action="/member/QAupdate" method="post">
	
		<div class="form-group">
			<input type="hidden" id="qPk"
				name="qPk" class="form-control" value="${view.qPk }"/>
		</div>
		
		<div class="form-group">
			<select class= "form-control" name="qCategory">
				<option value="로그인">로그인</option>
				<option value="거래">거래</option>
				<option value="게시글">게시글</option>
				<option value="버그">버그</option>
			</select>
		</div>
		
		<div class="form-group">
			<label for="qTitle">제목</label> <input type="text" id="qTitle"
				name="qTitle" class="form-control" value="${view.qTitle }"/>
		</div>

		<div class="form-group">
			<label for="content">본문</label>
			<textarea rows="10" style="width: 100%" id="content" name="qContent" value="${view.qContent }" ></textarea>
		</div>

		<div class="text-right">
			<button class="btn btn-primary" id="btnWrite">수정</button>
			<input type="reset" id="cancel" class="btn btn-danger" value="취소" />
		</div>

	</form>
</div>


<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "content",
		sSkinURI : "/resources/se2/SmartEditor2Skin.html",
		fCreator : "createSEditor2"
	})


	function submitContents(elClickedObj) {

		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

		try {
			console.log(elClickedObj.form.submit());
			elClickedObj.form.submit();
		} catch (e) {}

	}
</script>
<br>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
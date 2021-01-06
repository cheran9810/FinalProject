<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:import url="/WEB-INF/views/header/mypageheader.jsp?after" />

<title>찜한 상품 : 꿀벌마켓</title>

<!-- jQuery 2.2.4.min -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$('#scrapsetting').click(function() {
		if($('.checkboxdiv').css('display') == 'none'){
			$('.checkboxdiv').show();
			$('#deleteScrap').show();
			$('#scrapAll').show();
			$('#scrapsetting').html('취소');
		} else {
			$('.checkboxdiv').hide();
			$('#deleteScrap').hide();
			$('#scrapAll').hide();
			$('#scrapsetting').html('수정');
			$("input[type=checkbox]").prop("checked", false);
		}
	});
	
})
</script>

<style>

#container {
	margin-top:20px;
    position: relative;
    z-index: 20;
    max-width: 954px;
    margin: 0 auto;
}
	
#content {
	position: relative;
	padding: 32px 51px 95px;
	display: block;
}

/* float해제 방법중 가장 널리 쓰이고 있는 방법,, */
#content:after { 
    display: block;
    clear: both;
    content: '';
}

#intro {
	margin-top:30px;
	padding-left: 90px;
}

.checkboxdiv{
	padding-left: 200px;
	display: none;
	float: right;
}

#scrapsetting{
	padding-right: 20px;
	padding-left: 20px;
	padding-top: 5px;
	padding-bottom: 5px;
	background: #fff;
	border: 1px solid #ccc;
	cursor: pointer;
	font-size: 12px;
}

#deleteScrap{
	padding-right: 20px;
	padding-left: 20px;
	padding-top: 5px;
	padding-bottom: 5px;
	background: #fff;
	border: 1px solid #ccc;
	cursor: pointer;
	font-size: 12px;
	display: none;
}

</style>

<form action="/mypage/myscrap" method="POST">
<div id = "container">
<div id = "intro"><h3>찜한 상품</h3><br><p style = "font-size: 12px;">관심있는 상품을 찜해두면  편하게 확인하고 관리할 수 있습니다.<button id = "deleteScrap">삭제</button>
	<button type = "button" id = "scrapsetting">관리</button>
</p></div>
<div id = "content">

<div class = "cards-wrap">
<c:forEach items="${userscrap }" var="s">
		<article class = "card-top">
		<div class = "card-photo">
			<a href = "#"><img src ="/upload/${s.STORED_NAME }" /></a>
		</div>
		<div class = "card-desc">
			<h2 class = "card-title">${s.TITLE }</h2>
			<div class = "card-price">
				${s.PRICE }원
			</div>
			<div class = "card-region-name">
				${s.LOCATION }
			</div>
			<div class = "card-counts"> 
			<span>작성일 <fmt:formatDate value="${s.REG_DATE }" pattern="MM-dd" /></span><span style="float: right;">작성자  ${s.USERID }</span>
		    <div class = "checkboxdiv"><input type = "checkbox" name = "checkbox" value = "${s.REG_NO}"/></div>
			</div>
		</div>
		</article>
		</c:forEach>
	</div>

</div>
</div>
</form>


<c:import url="/WEB-INF/views/layout/footer.jsp?after" />
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:import url="/WEB-INF/views/header/mypageheader.jsp?after" />

<title>내가 쓴 게시글 : 꿀벌마켓</title>

<!-- 부트스트랩 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- jQuery 2.2.4.min -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- <div class="text-right"> -->
<!-- 	<input class="form-control" type="text" id="search" name="search" /> -->
<!-- 	<button class="btn">검색</button> -->
<!-- </div> -->

<script type="text/javascript">
$(document).ready(function(){
	$(".btn_search").click(function(){
		if($("#search").val() == ""){
			alert("검색어를 입력해 주세요.")
		
		}
	})
	
        $("#checkAll").click(function(){
        if($("#checkAll").prop("checked")){
            $("input[name=checkbox]").prop("checked",true);     
        } else{
            $("input[name=checkbox]").prop("checked",false);
        }
    })	


})

</script>

<style type="text/css">
.wrap {
	margin: 0 auto;
	min-width: 1100px;
}


table {
 	table-layout: fixed;  
}
a{

	text-decoration:none;
	color : #000000;
}
table, th {
	text-align: center;
}

td:nth-child(3) {
	text-align: center;
	
	white-space:nowrap;	
	text-overflow: ellipsis;
	overflow: hidden;
}
td:nth-child(4) {
	text-align: center;
	
	white-space:nowrap;	
	text-overflow: ellipsis;
	overflow: hidden;
}

.text-right {
    margin-top: 30px;
}

.search{
width : 50px;
height : 30px;
	border :0;
	outline : 0; 
	background-color: #FFD700;
	border-radius: 4px;	

}
</style>

</head>
<body>



<div class="container">

<div class="form-inline text-left">

<form action="/mypage/mypost?search="${search } method="GET">
<div class="text-right">
	<input class="form-control" type="text" id="search" name="search" />
	<button class="search">검색</button>
</div>
</form>
</div><br>

<form action="/mypage/mypost" method="POST">
<table class="table table-hover">
   <tr>
 	  <th style="width: 5%"><input type = "checkbox" id = "checkAll" /></th>
      <th style="width: 10%">글 번호</th>
      <th style="width: 15%">제품 종류</th>
      <th style="width: 20%">글 제목</th>
      <th style="width: 35%">글 내용</th>
      <th style="width: 15%">작성일</th>
   </tr>
<c:forEach items="${regList}" var="r">
<c:set var="tmp" value="${r.REG_DATE }" />
<c:set var="dayDiff" value='<%=(new Date().getTime()-((Date)pageContext.getAttribute("tmp")).getTime()) / (1000 * 60 * 60 * 24) %>' />
<!-- new Date() : 현재시간 (java.util.Date) -->
<!-- new Date().getTime() : 현재시간 (long) -->
<!-- (Date)pageContext.getAttribute("tmp") : 등록시간 (java.util.Date) -->
<!-- ((Date)pageContext.getAttribute("tmp")).getTime() : 등록시간 (long) -->

<!-- 현재시간(long) - 등록시간(long) : 시간 차이 (밀리초 단위) -->

<!-- (현재시간(long) - 등록시간(long)) /1000 /60 /60 /24 : 시간 차이 (날짜 단위ㅋ) -->
   <tr>
	  <td>
	  	<input type = "checkbox" name = "checkbox" value = "${r.REG_NO}"/>
	  </td>   	
      <td>${r.REG_NO}</td>
      <td>${r.CATEGORY}</td>
      <td class="title">${r.TITLE}</td>
      <td><a href="/trade/view?regNo=${r.REG_NO }">${r.CONTENT}</td>
      <c:choose>
       <c:when test="${dayDiff == 0 }">
      <td><fmt:formatDate value="${r.REG_DATE}" pattern="HH:mm" /></td>
      </c:when>
       <c:otherwise>
        <td><fmt:formatDate value="${r.REG_DATE}" pattern="MM-dd"/></td>
  	  </c:otherwise>
      </c:choose>
   </tr>
</c:forEach>
</table>

<button class="btn btn-sm pull-right">삭제</button> 
</form>

<div class="form-inline">
<button onclick="location.href='/mypage/mypost'" class="btn btn-sm pull-left">전체 목록</button>
<jsp:include page="/WEB-INF/views/mypage/mypost_paging.jsp" />
</div>
</div>
<c:import url="/WEB-INF/views/footer/mypagefooter.jsp" />

</body>
</html>
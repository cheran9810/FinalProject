<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">

function updateComment(commentNo, regNo,content) {
	$.ajax({
		type: "post" 
		, url: "/comment/update" 
		, data: {
			commentNo:commentNo
			, regNo : regNo
			, content:content
		}
		, dataType: "html" 
		, success: function(res){ 
			$("#update").html(res);
		}
		, error: function(){ 
			console.log("AJAX 요청/응답 실패")
		}
	});
}

 $(document).ready(function() {
    if(${isRecommend}) {
       $("#btnRecommend")
       .prop("src", "/resources/img/heart.png");
    }

    else {
       $("#btnRecommend")
       .prop("src", "/resources/img/like.png");
    }
   
    $("#btnRecommend").click(function() {
      
       $.ajax({
          type: "get"
          , url: "/trade/recommend"
          , data: { "regNo": '${view.regNo }' }
          , dataType: "json"
          , success: function( data ) {


             if( data.result ) { //추천 성공
               $("#btnRecommend")
               .prop("src", "/resources/img/heart.png");
            
             } else { //추천 취소 성공
                $("#btnRecommend")
                .prop("src", "/resources/img/like.png");
            
             }
             //추천수 적용
               $("#recommend").html(data.cnt);
            
          }
         , error: function() {
             console.log("실패");
            
          }
       });
      
    });

     if(${isReportBoard}) {
 	      $("#btnReportBoard")
 	      .prop("src", "/resources/img/statement.png");
 	   } 

 	   else {
 	      $("#btnReportBoard")
 	      .prop("src", "/resources/img/statement.png");
 	   }
   
    $("#btnReportBoard").click(function() {
	      
 	      $.ajax({
 	         type: "get"
 	         , url: "/trade/reportBoard"
 	         , data: { "regNo": '${view.regNo }' }
 	         , dataType: "json"
 	         , success: function( data ) {

 	            if( data.result ) { //추천 성공
 	               $("#btnReportBoard")
	               alert("신고 완료");
	            
 	            } else { //추천 취소 성공
 	               $("#btnReportBoard")
 	               alert("신고 이미 완료");
	            
 	            }
 	            //추천수 적용
 	            $("#reportBoard").html(data.cnt);
	            
 	         }
 	         , error: function() {
 	            console.log("실패");
	            
 	         }
 	      });
	      
 	   });
   
    // 댓글 입력
    $("#btnCommInsert").click(function() {
	   
 	   var secretReply = "n";
 	   if( $("#secretReply").is(":checked")){
 		   secretReply = "y";
 	   }
      
       $form = $("<form>").attr({
          action: "/comment/insert",
          method: "post"
      }).append(          
    		  $("<input>").attr({
             type:"hidden",             
             name:"regNo",
             value:"${view.regNo }"
          })
       ).append(
          $("<textarea>")
             .attr("name", "content")
             .css("display", "none")
             .text($("#commentContent").val())
       ).append(
     	$("<input>").attr({
     		type:"hidden",
     		name:"secretReply",
     		value: secretReply
		})	  
       );
       $(document.body).append($form);
       $form.submit();
      
    }); 
   
 });


 function deleteComment(commentNo) {
    $.ajax({  
	type: "post"
       , url: "/comment/delete"
       , dataType: "json"
       , data: { 
         commentNo: commentNo
       }
       , success: function(data){
          if(data.success) {
            
             $("[data-commentno='"+commentNo+"']").remove();
             alert("댓글 삭제 성공");
            
         } else {
            alert("댓글 삭제 실패");
          }
       }
       , error: function() {
          console.log("error");
       }
    });
 }


 function reportComment(commentNo) {
 	   $.ajax({
 	      type: "get"
 	      , url: "/comment/report"
 	      , dataType: "json"
 	      , data: { 
 	         commentNo: commentNo
 	      }
 	      , success: function(data){
 	         if(data.result) {
	        	 alert("댓글 신고");
 	         } else {
 		            alert("신고 하셨습니다.");
 	         }
 	      }
 	      , error: function() {
 	         console.log("error");
 	      }
 	   });
 	}


</script>

<style type="text/css">
td.info {
	width: 10%;
}

td:not (.info ) {
	width: 40%;
}

.heart {
	width: 30px;
}
a{

	text-decoration:none;
	color : #000000;
}
.reportBoard{
width: 30px;
}

th{
text-align: center;
}
td{
text-align: center;
}
.remo{

	width : 15px;
	heigt : 15px;
	margin-right : 10px;

}
</style>

<div class="container">
	<c:if test="${! empty login }">
		 <c:if test="${id != view.userEmail }"> 
			<!-- 이미지로 바꾸기 -->
			<div style="text-align: right;">
			<a ><img id="btnChatting" src="/resources/img/chat.png" style="width: 40px; margin-right :10px; cursor:pointer;" 
				onclick="window.open('/chatroom?email=${view.userEmail}','_blank','width=430,height=500,location=no,status=no,scrollbars=yes')"></a>
				<a ><img id="btnReportBoard" src="" class="reportBoard"></a>
			 	<a class="btn btn-outline-dark heart"> <img id="btnRecommend"
					src="" class="heart">
				</a> 
				
				
			</div>
		 </c:if> 
	</c:if>

	<c:if test="${empty login }">
		<div style="text-align: right;">
			<a class="btn btn-outline-dark heart" href="/member/main"> <img
				src="/resources/img/like.png" class="heart">
			</a>
		</div>
	</c:if>
	<br>

	<table class="table table-bordered">
		<tr>
			<td colspan="4">
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
				
					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">


						<c:forEach items="${file }" var="v">
						<!-- <div class="item"> -->
							<img src="<c:url value='/upload/${v.storedName }'/>" alt ="${v.storedName }" width="100%"/>
							<div class="carousel-caption"></div>
						<!-- </div> -->
						</c:forEach>
						</div>
						
					<!-- Controls  -->
					<a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</td>
		</tr>
		<tr>
			<td class="info">글번호</td>
			<td >${view.regNo }</td>
			<td class="info">지역</td>
			<td>${view.location }</td>
		</tr>

		<tr>
			<td class="info">아이디입니다</td>
			<td>${view.userEmail }</td>
			<td class="info">제목</td>
			<td>${view.title}</td> 
		</tr>

		<tr>
			<td class="info">조회수</td>
			<td>${view.hit }</td>
			<td class="info">추천수</td>
			<td id="recommend">${view.recommend }</td>
		</tr>
		<tr>
			<td class="info">카테고리</td>
			<td>${view.category }</td>
			<td class="info">게시글유형</td>
			<td>${view.tradeClass }</td>

		</tr>
		</tr>
			<tr>
			<td class="info">가격</td>
			<td>${view.price }</td>
			<td class="info">수량</td>
			<td>${view.quantity }</td>
		</tr>

		<tr>
			<td colspan="4">${view.content }</td>
		</tr>

	</table>

	<!-- 버튼 영역 -->
	<div class="text-center">
		<a href="/trade/list"><button class="btn btn-default">목록</button></a>
		<c:if test="${id eq view.userEmail }"> 
			<a href="/trade/update?regNo=${view.regNo }"><button
					class="btn btn-primary">수정</button></a>

			<!-- Button trigger modal -->
			<button type="button" class="btn btn-danger" data-toggle="modal"
				data-target="#exampleModal">삭제</button>
			<div class="col-md-auto">
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">

						<div class="modal-content">
							<div class="modal-header">

								<h4 class="modal-title" id="exampleModalLabel">게시물 삭제</h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<br>
							</div>
							<div class="modal-body">
								<h4>게시글을 삭제하시겠습니까? 정말루? 삭제할꾸야?</h4>
							</div>
							<div class="modal-footer">
								        <a href="/trade/delete?regNo=${view.regNo }">  
								<button class="btn btn-danger">삭제</button>
								</a>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">취소하기</button>
							</div>
						</div>

					</div>
				</div>
	 	</c:if> 
	</div>
	<!-- 버튼 영역 end -->

	<!-- 댓글 처리 -->
	<div>

		<hr>

		<!-- 로그인상태 -->
		<c:if test="${! empty login }">
			<label for="content">댓글 작성</label>
			<div class="form-inline text-center">
				<input type="text" size="4" class="form-control" id="commentWriter"
					value="${login.nick }" readonly="readonly" />
				<textarea rows="1" cols="80" class="form-control"
					id="commentContent"></textarea>
				<input type = "checkbox" id="secretReply">비밀댓글
				<button id="btnCommInsert" class="btn">입력</button>
			</div>
			<!-- 댓글 입력 end -->
		</c:if>

		<!-- 댓글 리스트 -->
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="width: 5%;">번호</th>
					<th style="width: 10%;">작성자</th>
					<th style="width: 35%;">댓글</th>
					<th style="width: 20%;">작성일</th>
					<th style="width: 10%;">신고</th>
					<th style="width: 10%;"></th>
				</tr>
			</thead>
			<tbody id="commentBody">
				<c:forEach items="${commentList }" var="comment">
					<tr data-commentno="${comment.commentNo }">
						<td style="width: 5%;">${comment.rnum }</td>
						<td style="width: 10%;">${comment.userid }</td>
						<!-- 닉네임으로 해도 좋음 -->
						<c:choose>
							<c:when test="${comment.secretReply eq 'y' && sessionScope.id ne comment.userid }">
								<td style="width: 35%;">비밀댓글 입니다</td>	
							</c:when>
							<c:otherwise>
							<c:if test="${id eq view.userEmail }"></c:if>
								<td style="width: 35%;"><div id="update">${comment.content }</div></td> 
							</c:otherwise>
						</c:choose>
						<td style="width: 20%;"><fmt:formatDate
								value="${comment.writeDate }" pattern="yy-MM-dd hh:mm:ss" /></td>

						<c:if test="${sessionScope.id != comment.userid }">
							<!-- // -->
							<td style="width: 10%;">
								<%-- <a><img src="/resources/img/statement.png" id="report" class="${comment.commentNo }" width="20px" >
                  </a> --%> <%--          <button id="report" class="${comment.commentNo }" value="${comment.commentNo }">신고</button> --%>
								<button class="btn btn-default btn-xs"
									onclick="reportComment(${comment.commentNo});">신고</button>
							</td>
						</c:if>
						
						<c:if test="${sessionScope.id eq comment.userid }">
							<td style="width: 10%;"></td>
						</c:if>
						<td style="width: 10%;"><c:if
								test="${sessionScope.id eq comment.userid }">
								<button class="btn btn-default btn-xs" onclick="updateComment(${comment.commentNo},${comment.regNo },'${comment.content }');">수정</button>
								<button class="btn btn-default btn-xs"
									onclick="deleteComment(${comment.commentNo });">삭제</button>

							</c:if></td>

					</tr>

				</c:forEach>

			</tbody>
		</table>

	</div>


</div>


<div class = "floating">
<br>
	<span>리모컨</span>
	<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	<hr>
	<!-- <br><br> -->
	<div><a href="/member/main">즐겨찾기</a></div><br>
	
	<div><a href="/chattingList" onclick="window.open(this.href,'_blank','width=400,height=400');return false;">Chatting</a></div><br>
	
	<div><a href="/mypage/mypage">마이페이지</a></div><br>
	<hr>
	<div>
	<span><a style="display:scroll;bottom:10px;right:10px;" href="#" title"위로"><img src="/resources/img/up.png" class="remo"></a></span>
	<span><img src="/resources/img/down.png" class="remo"></span>
	<span><a href="/trade/list"><img src="/resources/img/list.png" class="remo"></a></span>
	</div>
	<div>
	<span>위로 </span>
	<span>아래 </span>
	<span>목록</span>
	</div>
</div>
<!-- .container -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
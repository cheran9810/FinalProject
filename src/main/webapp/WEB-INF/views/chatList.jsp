<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import ="com.devmg.dto.Chat" %>
<%@page import="java.util.List"%>
<%@page import="java.util.*"%>
<% List<Chat> list =(List<Chat>)request.getAttribute("list"); %>
					
				
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Merriweather" rel="stylesheet">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">
window.onload = function(){
	
    var ws;
	

    if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
        writeResponse("WebSocket is already opened.");
        return;
    }
    
//	    var btn=getParameterByName("id");
    //웹소켓 객체 만드는 코드
    //WebSocketChat이랑 연결
    var myid='${sessionScope.id }'
    //---------------------------------이부분 아이피 고쳐써야함!!!--------------------------------
    ws = new WebSocket("ws://127.0.0.1:8088/echo.do/"+myid+ "/anyone");

		//대화방열기
		ws.onopen = function(event) {
			if (event.data === undefined) {
				return;
			}
		};

		ws.onmessage = function(event) {
			
// 			alert("메세지가 도착했습니다")
			history.go(0);

			
		};


}





</script>
<script type="text/javascript">

$(document).ready(function(){
	
	$('.outChat').click(function(){
		var con_test =confirm("정말로 삭제하시겠습니까?");
		if(con_test == false){
			
			return false;
		}
		
		var senderid = $('#senderid').val();
		var recid = $('#recieverid').val();
		 var allData = { "senderid": senderid, "recieverid": recid };
		 
			$.ajax({
				type:"get"
				,url:"/test04_ok" //요청 URL
				,data:{allData} //전달 파라미터
				,dataType: "html"
				,async : false
				,success:function(res){
					
					console.log("성공")
					console.log(res)
					$('.Chattinglist').empty();
					$('.Chattinglist').append(res);
					
					
				}
				,error:function(){
					console.log("실패")
				}
			})
			
			
			
			history.go(0);
		
	})
	
	
	
	
	$('.chatlist_style').click(function(){
		
		
		
		var senderid =$(this).data("sender")
		var recid =$(this).data("rec")
		var allData = { "senderid": senderid, "recieverid": recid };
		$.ajax({
			type:"get"
			,url:"/test03_ok" //요청 URL
			,data:{allData} //전달 파라미터
			,dataType: "html"
			,async : false
			,success:function(res){
				
				console.log("성공")
				console.log(res)
			
				$('.Chattinglist').empty();
				$('.Chattinglist').append(res);
			}
			,error:function(){
		
				console.log("실패")
			}
		})
	})
	
	
	
	$('#kaka').change(function(){
		var senderid = $('#senderid').val();
		var recid = $('#recieverid').val();
		 var allData = { "senderid": senderid, "recieverid": recid };
		
// 		alert("senderid"+senderid)
// 		alert("recid"+recid)
		$.ajax({
			type:"get"
			,url:"/test03_ok" //요청 URL
			,data:{allData} //전달 파라미터
			,dataType: "html"
			,async : false
			,success:function(res){
				
				console.log("성공")
				console.log(res)
				$('.Chattinglist').empty();
				$('.Chattinglist').append(res);
			}
			,error:function(){
				console.log("실패")
			}
		})
		
	})

	
	
	
	//Show contextmenu:
	  $(document).contextmenu(function(e){
		  event.target;
		  var eventName=event.target.className;
		  var senderid;
		  var recid;
		  if(eventName!="chatlist_style"&&eventName!="person" &&eventName!="mess")
			  {
			  
			 	return;
			  }
		if(eventName=="chatlist_style"){
			senderid =event.target.getAttribute('data-sender')
			recid =event.target.getAttribute('data-rec')
			
	
		}else{
			senderid=event.target.parentElement.getAttribute('data-sender');
			recid=event.target.parentElement.getAttribute('data-rec');

		}
		$('#senderid').val(senderid);
		$('#recieverid').val(recid);
// 		alert("senderid"+senderid);
// 		alert("recieverid"+recid);
	    //Get window size:
	    var winWidth = $(document).width();
	    var winHeight = $(document).height();
	    //Get pointer position:
	    var posX = e.pageX;
	    var posY = e.pageY;
	    //Get contextmenu size:
	    var menuWidth = $(".contextmenu").width();
	    var menuHeight = $(".contextmenu").height();
	    //Security margin:
	    var secMargin = 10;
	    //Prevent page overflow:
	    if(posX + menuWidth + secMargin >= winWidth
	    && posY + menuHeight + secMargin >= winHeight){
	      //Case 1: right-bottom overflow:
	      posLeft = posX - menuWidth - secMargin + "px";
	      posTop = posY - menuHeight - secMargin + "px";
	    }
	    else if(posX + menuWidth + secMargin >= winWidth){
	      //Case 2: right overflow:
	      posLeft = posX - menuWidth - secMargin + "px";
	      posTop = posY + secMargin + "px";
	    }
	    else if(posY + menuHeight + secMargin >= winHeight){
	      //Case 3: bottom overflow:
	      posLeft = posX + secMargin + "px";
	      posTop = posY - menuHeight - secMargin + "px";
	    }
	    else {
	      //Case 4: default values:
	      posLeft = posX + secMargin + "px";
	      posTop = posY + secMargin + "px";
	    };
	    //Display contextmenu:
	    $(".contextmenu").css({
	      "left": posLeft,
	      "top": posTop
	    }).show();
	    //Prevent browser default contextmenu.
	    return false;
	  });
	  //Hide contextmenu:
	  $(document).click(function(){
	    $(".contextmenu").hide();
	  });
})
</script>

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
.chatlist_style{
	border:1px solid white; 
	background:#ccc;
	overflow:hidden;
	position:relative;
	
	
}
.chatlist_style:hover{
	background:#686868;

}
@font-face{
	src:url(/resources/font/BMJUA_ttf.ttf);
	font-family:"jua";
}
.person{
	font-size: 20px;
	font-weight:bold;
		
font-family: 'Noto Sans KR', sans-serif;
}
.mess{
		
font-family: 'Noto Sans KR', sans-serif;
}

.contextmenu {
  display: none;
  position: absolute;
  width: 200px;
  margin: 0;
  padding: 0;
  background: #FFFFFF;
  border-radius: 5px;
  list-style: none;
  box-shadow:
    0 15px 35px rgba(50,50,90,0.1),
    0 5px 15px rgba(0,0,0,0.07);
  overflow: hidden;
  z-index: 999999;
}

.contextmenu li {
  border-left: 3px solid transparent;
  transition: ease .2s;
}

.contextmenu li a {
  display: block;
  padding: 10px;

  text-decoration: none;
  transition: ease .2s;
}

.contextmenu li:hover {
  background: #ffd700;

}

.contextmenu li:hover a {
  color: black;
}

</style>


</head>
<body>

<div>
	<div style="text-align:center;">
	<h1>나의 대화 목록</h1>
	</div>

	<%-- <c:forEach items="${list}" var="item"> --%>
	
	<!-- <p> -->
	<%-- reciever : ${sessionScope.id } --%>
	<%-- sender : ${item.sender} --%>
	
	<!-- </p> -->
	
	<%-- </c:forEach> --%>

	
	
	<%-- <% for(int i=0; i<list.size();i++){%> --%>
	
	<%-- 센더:<%=list.get(i).getSender() %><br> --%>
	<%-- 리시버:<%=list.get(i).getReciever() %><br> --%>
	<%-- <%} %> --%>
	
	
	
	
	
	
	<hr>
	
	
	<div class="Chattinglist">
	
	<% session = request.getSession(); %>
	<% String myid= session.getAttribute("id").toString();%>
	<% List<String> testList = new ArrayList<String>();%>
	<% for(int i=0; i<list.size()-1;i++){%>
	
		<% for(int j=i+1; j<list.size(); j++){ %>
		
		
		<!-- 리스트내에서 중복되는것이 있는지 검사 ,1.내아이디가아니고,2.센더,리시버 자리바꿨을떄 일치하면 삭제-->
			<% if(list.get(i).getReciever().equals(list.get(j).getSender()) && 
					list.get(i).getSender().equals(list.get(j).getReciever())
					
					)
				{ %>
	
				<% 
				
				list.remove(j);
					
		
	
				
				%>
			<%} %>
		<%} %>
	<%} %>
	
	
	<!-- <hr> -->
<%-- 	<% for(int i=0; i<list.size();i++){%> --%>
	
<%-- 	센더:<%=list.get(i).getSender() %><br> --%>
<%-- 	리시버:<%=list.get(i).getReciever() %><br> --%>
<%-- 	<%} %> --%>
	<!-- <hr> -->
	
	
	
	<% for(int i=list.size()-1; i>=0;i--){%>
	<% if(myid.equals(list.get(i).getReciever())
			&& !myid.equals(list.get(i).getSender())){%>
	<div class="chatlist_style" data-sender="<%=list.get(i).getReciever() %>" data-rec="<%=list.get(i).getSender() %>" onclick="window.open('/chatroom?email=<%=list.get(i).getSender() %>&nickName=<%= list.get(i).getSender_nick()%>'
	,'_blank','top=10, left=10,  width=500,height=500,location=no,status=no,scrollbars=yes')">
	<div class="person"><%=list.get(i).getSender_nick() %>
			<% if (list.get(i).getChecked()!=0) {%> 
		<span class="badge badge-primary" style="background:red;"><%=list.get(i).getChecked() %></span>
		<% } %>
	</div>
	
		<div class="mess"><%=list.get(i).getMessage() %><br></div>
		<%=list.get(i).getSend_time() %><br>

		
	</div>	
	<% }else if(!myid.equals(list.get(i).getReciever())
			&& myid.equals(list.get(i).getSender())){%>
	
	<div class="chatlist_style" data-sender="<%=list.get(i).getSender() %>" data-rec="<%=list.get(i).getReciever() %>" onclick="window.open('/chatroom?email=<%=list.get(i).getReciever() %>&nickName=<%= list.get(i).getReceiver_nick()%>'
	,'_blank','top=10, left=10,  width=500,height=500,location=no,status=no,scrollbars=yes')">
	<div class="person"><%=list.get(i).getReceiver_nick() %></div>
	
		<div class="mess"><%=list.get(i).getMessage() %><br></div>
		<%=list.get(i).getSend_time() %><br>
	
<%-- 		<%=list.get(i).getChecked() %><br> --%>
	</div>	
		<%} %>
		<% if(list.get(i).getReciever().equals(myid)&&
				list.get(i).getSender().equals(myid)) { %>
	<div class="chatlist_style" data-sender="<%=list.get(i).getSender() %>" data-rec="<%=list.get(i).getReciever() %>"  onclick="window.open('/chatroom?email=<%=list.get(i).getReciever() %>&nickName=<%= list.get(i).getReceiver_nick()%>'
	,'_blank','top=10, left=10,  width=500,height=500,location=no,status=no,scrollbars=yes')">
	<div class="person"><%=list.get(i).getReceiver_nick() %>
			<% if (list.get(i).getChecked()!=0) {%> 
		<span class="badge badge-primary" style="background:red;"><%=list.get(i).getChecked() %></span>
		<% } %>
	</div>
	
		<div class="mess"><%=list.get(i).getMessage() %><br></div>
		<%=list.get(i).getSend_time() %><br>
		


	</div>
	
	
		<% } %>
	<% } %>
	
		우클릭해서 대화 목록 삭제	
	<div style="text-align: center; margin: 100px;"><button type="button" class="btn btn-danger" onClick="window.close()">닫기</button></div>
	
	
	</div>
	<ul class="contextmenu">
  <li><a href="#" class="outChat">대화 나가기</a></li>

</ul>
	

	
	
	
	<!-- ajax전달값 -->
	<input type="text" name="id_temp" id="kaka" style="display:none" />
	<input type="text" name="recieverid" id="recieverid" value="" style="display:none" />
	<input type="text" name="senderid" id="senderid" value="" style="display:none" />

</div>
</body>
</html>
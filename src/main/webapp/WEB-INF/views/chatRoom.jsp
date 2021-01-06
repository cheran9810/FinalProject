<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="com.devmg.dto.Chat" %>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	HttpSession sessionn = request.getSession();
%>
<%
	String id = sessionn.getAttribute("id").toString();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bbootstrap 4 -->
  
  <link rel="stylesheet" href="/resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<link rel="stylesheet" href="/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<link rel="stylesheet" href="/resources/plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/resources/dist/css/adminlte.css">
  <link rel="stylesheet" href="/resources/dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="/resources/plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="/resources/plugins/summernote/summernote-bs4.css">
  
  <link rel="stylesheet" href="/resources/css/style.css">
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
<script src="/resources/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>







<script src="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="/resources/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="/resources/plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="/resources/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="/resources/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="/resources/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="/resources/plugins/moment/moment.min.js"></script>
<script src="/resources/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="/resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="/resources/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="/resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="/resources/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/dist/js/demo.js"></script>

<script>

$(document).ready(function(){
	document.getElementById("messageinput").scrollIntoView();
	$("#messageinput").on("keypress", function (e) {
		if(event.keyCode==13)
			{
		
// 				e.preventDefault();//anchor이벤트의 기본동작을 막는다.
				
// 				$(document).height()
// 				$("body").scrollTop();
				
				

				
				send(); return false;
// 				send();
			}
		
	});
})
</script>





<style type="text/css">
#myMessage{
/* background-image: url("/resources/malpungsun.png"); */

 height:5px;
}
.direct-chat-messages{
	overFlow:visible;
}

</style>
</head>
<body>
	<hr>



            <!-- DIRECT CHAT -->
            <div class="card direct-chat direct-chat-primary">
              <div class="card-header">
                <h3 class="card-title">1:1 채팅</h3>

     
              </div>
              
              <!-- /.card-header -->
              <div class="card-body">
                <!-- Conversations are loaded here -->
                <div class="direct-chat-messages" style="height:500px;">
                  <!-- Message. Default to the left -->
                  
                  <!-- /.direct-chat-msg -->

                  <!-- Message. Default to the left -->
                  
                  <!-- /.direct-chat-msg -->
					<% List<Chat> list =(List<Chat>)request.getAttribute("list"); %>
					
					<% for(int j=0; j<list.size();j++){%>
					
					<% String myid=session.getAttribute("id").toString(); %>
        			<% if (myid.equals(list.get(j).getSender())){ %>	


                  <!-- Message to the right -->
                  <div class="direct-chat-msg right">
                    <div class="direct-chat-infos clearfix">
           	
                      <span class="direct-chat-name float-right"><%=list.get(j).getSender_nick()%> </span>
                      <span class="direct-chat-timestamp float-left"><%=list.get(j).getSend_time()%></span>
                    </div><%} else {%>
                  <div class="direct-chat-msg">
                    <div class="direct-chat-infos clearfix">
                      	<span class="direct-chat-name"><%=list.get(j).getSender_nick()%> </span>
                      	<span class="direct-chat-timestamp float-right"><%=list.get(j).getSend_time()%></span>
                    </div>	<% } %>                     
              
                    <!-- /.direct-chat-infos -->
                    <img class="direct-chat-img" src="/resources/dist/img/cherry.png" alt="message user image">
                    <!-- /.direct-chat-img -->
					<div class="direct-chat-text">

						<%=list.get(j).getMessage()%>
					

					</div>
					<!-- /.direct-chat-text -->
                  </div>
                  <!-- /.direct-chat-msg -->
                  

						
						<% } %>

				<div id="messages">
				
				</div>
			</div>
                <!--/.direct-chat-messages-->




<!-- 			Server responses get written here -->
			
			<!-- websocket javascript -->



			<!-- /.direct-chat-pane -->
              </div>
              <!-- /.card-body -->
              <div class="card-footer">
              
                  <div class="input-group">
                  <input type="text" id="sender" value="${sessionScope.id}" style="display: none;"> 
<!--                     <input	type="text" id="messageinput" onkeypress="if(event.keyCode==13) {send(); return false;}"> -->
                    <input	type="text" id="messageinput" style="width:300px;">
                    <span class="input-group-append">
                      	<button type="button" onclick="send();" class="btn btn-primary">메세지 전송</button>
                    </span>
                  </div>
                
              </div>
              <!-- /.card-footer-->
            </div>
            <!--/.direct-chat -->
            
           
				<input type="text" id="senderid" name="sender" value="${sender }" style="display:none;">
				<input type="text" id="recieverid" name="reciever" value="${reciever }" style="display:none;" >
       

	<script type="text/javascript">
	
	
	
	
	var ws;
    var messages = document.getElementById("messages");
	
	
	
	window.onload = function(){
		
		
		

	    if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
	        writeResponse("WebSocket is already opened.");
	        return;
	    }
	    
// 	    var btn=getParameterByName("id");
		var btn="${reciever}";
	    console.log(btn)
	    //웹소켓 객체 만드는 코드
	    //WebSocketChat이랑 연결
	    //---------------------------------이부분 아이피 고쳐써야함!!!--------------------------------
	    ws = new WebSocket("ws://127.0.0.1:8088/echo.do/"+"<%=id%>"+ "/" + btn);

			//대화방열기
			ws.onopen = function(event) {
				if (event.data === undefined) {
					return;
				}
				writeResponse(event.data);
			};

			ws.onmessage = function(event) {
				console.log('writeResponse');
				console.log(event.data)
				writeResponse(event.data);
				opener.document.getElementById("recieverid").value=document.getElementById("recieverid").value

				opener.document.getElementById("senderid").value = document.getElementById("senderid").value
				

				window.opener.$('#kaka').trigger('change');
				document.getElementById("messageinput").scrollIntoView();
			};

			ws.onclose = function(event) {

				writeResponse("대화 종료");
			}

		}

		function getParameterByName(name) {
			name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
			var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex
					.exec(location.search);
			return results === null ? "" : decodeURIComponent(results[1]
					.replace(/\+/g, " "));
		}

		function endmessage() {
			var text = "접속이 끊어졌습니다" + ","
					+ document.getElementById("sender").value;
			ws.send(text);
		}

		function send() {
			// var text=document.getElementById("messageinput").value+","+document.getElementById("sender").value;
			if (!document.getElementById("messageinput").value){
				return false;
			}
			//입력한 메세지
			
			var text ='${nick}'+"!@#azo6065745t5"+document.getElementById("messageinput").value + ","
// 			var text =document.getElementById("messageinput").value + ","
			//발신자
					+ document.getElementById("sender").value;
			ws.send(text);
			
			text = "";
			document.getElementById("messageinput").value = ""

// 			var parentDiv = document.getElementById('#messages');

// 			var nodes = document.querySelectorAll('h3');
// 			var first = nodes[0];
// 			var last = nodes[nodes.length - 1];
// 			console.log(last)
// 			var location = last.offsetTop;
// 			window.scrollTo({
// 				top : location,
// 				behavior : 'smooth'
// 			});

		}

		function closeSocket() {
			endmessage();
// 			setTimeout("ws.close()", 3000); 수정

			//             ws.close();
		}

		function writeResponse(text) {
			messages.innerHTML += "<br/>" + text;
			
			
		}

		function clearText() {
			console.log(messages.parentNode);
			messages.parentNode.removeChild(messages);
		}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import ="com.devmg.dto.Chat" %>
<%@page import="java.util.List"%>
<%@page import="java.util.*"%>

<script type="text/javascript">
$(document).ready(function(){
	
	
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
				
				$('.Chattinglist').empty();
				$('.Chattinglist').append(res);
			}
			,error:function(){
				
				console.log("실패")
			}
		});
	});
});


</script>



<% List<Chat> list =(List<Chat>)request.getAttribute("list"); %>











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
	
	
	

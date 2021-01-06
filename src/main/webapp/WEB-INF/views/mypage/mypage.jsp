<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<c:import url="/WEB-INF/views/header/mypageheader.jsp?after" />

<title>내 정보 : 꿀벌마켓</title>

<!-- jQuery 2.2.4.min -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$('#userpw').val('${userdata.PW}');
	$('#checkpw').val('${userdata.PW}');
	$('#usernick').val('${userdata.NICK}');
	$('#usersido').val('${userdata.SIDO} '); 
	$('#userdong').val('${userdata.DONG} ');
	
	$('#updateBtn').click(function() {
		if($('#hiddenPw').css('display') == 'none'){
			$('#hiddenPw').show();
			$('#updateBtn').html('취소');
		} else {
			$('#hiddenPw').hide();
			$('#updateBtn').html('수정');
			$('#alert-success').hide();
			$('#alert-fail').hide();
			$('#userpw').val('${userdata.PW}');
			$('#checkpw').val('${userdata.PW}');
		}
	});
	
	$('#updateBtn2').click(function() {
		if($('#hiddenPw2').css('display') == 'none'){
			$('#hiddenPw2').show();
			$('#updateBtn2').html('취소');
		} else {
			$('#hiddenPw2').hide();
			$('#updateBtn2').html('수정');
			$('#usernick').val('${userdata.NICK}');
		}
	});
	
	$('#updateBtn3').click(function() {
		if($('#hiddenPw3').css('display') == 'none'){
			$('#hiddenPw3').show();
			$('#updateBtn3').html('취소');
		} else {
			$('#hiddenPw3').hide();
			$('#updateBtn3').html('수정');
			$('#usersido').val("${userdata.SIDO} "); 
			$('#userdong').val("${userdata.DONG} ");
		}
	});
	
	$("input").keyup(function(){
		var pw1 = $("#userpw").val();
		var pw2 = $("#checkpw").val();
		var nick = $("#usernick").val();
		var sido = $("#usersido").val();
		var dong = $("#userdong").val();
		
		if(pw1 != "" || pw2 != "") {
			if(pw1 == pw2){
				$('#alert-success').show();
				$('#alert-fail').hide();
				$('#updateSuccess').removeAttr('disabled');
			} else{
				$('#alert-success').hide();
				$('#alert-fail').show();
				$('#updateSuccess').attr('disabled', 'disabled');
			}
		}
		
		if( nick == "" || sido == ""|| dong=="" || pw1 != pw2){
			$('#updateSuccess').attr('disabled', 'disabled');
		} else {
			$('#updateSuccess').removeAttr('disabled');
		}

	
	})
 
	$("#userpw").focusout(function(){
		
		
		if( $("#userpw").val().length < 6){
			alert('6글자 이상 입력해 주세요.');
			return false;
		} else {
			return true;
		}
	})

		
	$(document).ready(function(){
	    $('#hiddenPw i').on('click',function(){
	        $('input').toggleClass('active');
	        if($('input').hasClass('active')){
	            $(this).attr('class',"fa fa-eye-slash fa-lg")
	            .prev('input').attr('type',"text");
	        }else{
	            $(this).attr('class',"fa fa-eye fa-lg")
	            .prev('input').attr('type','password');
	        }
	    });
	});

})


</script>

<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

<style>
	
fieldset {
    border: 0;
}	
	
body, button, dd, dl, dt, fieldset, form, h1, h2, h3, h4, h5, h6, input, legend, li, ol, p, select, table, td, textarea, th, ul {
    margin: 0;
    padding: 0;
}

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

#content:after {
    display: block;
    clear: both;
    content: '';
}

.c_header h2 {
    font-size: 20px;
    line-height: 22px;
    position: relative;
    color: #333;
}

.c_header .contxt strong {
    font-size: 14px;
    color: #FFC96B;
}

.c_header .contxt {
    line-height: 19px;
    padding-top: 10px;
    letter-spacing: -1px;
    color: #666;
    font-size: 13px;
}
    
table {
    border-collapse: separate;
    text-indent: initial;
    border-spacing: 2px;
    font-size: 12px;
}

tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}


.tbl_model {
    position: relative;
    width: 100%;
    table-layout: fixed;
    border-spacing: 0;
    border-collapse: collapse;
    word-break: keep-all;
    border: 0;
    border-bottom: 1px solid #e5e5e5;
}


.tbl_model th {
    color: #333;
    border-right: 1px solid #e5e5e5;
    background: #f9f9f9;
    width: 20%;
}

div{
	display: block;
}

.tbl_model .thcell {
    padding: 32px 31px 32px;
}

.tbl_model td {
    color: #565656;
    width: 80%;
}

.tbl_model td, .tbl_model th {
    line-height: 14px;
    text-align: left;
    vertical-align: top;
    letter-spacing: -1px;
    border: 0;
    border-top: 1px solid #e5e5e5;
}
  
.tbl_model .contxt_tit {
    font-size: 12px;
    line-height: 16px;
    color: #333;
    padding-left: 30px;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.tbl_model .contxt_desc, .tbl_model .contxt_desc3{
    line-height: 19px;
    padding-top: 10px;
    color: #8e8e8e;
    padding-left: 30px;
}

.contxt_button{
	padding-left: 30px;
}

#updateBtn, #updateBtn2, #updateBtn3{
	padding-right: 20px;
	padding-left: 20px;
	padding-top: 5px;
	padding-bottom: 5px;
	background: #fff;
	border: 1px solid #ccc;
	cursor: pointer;
	font-size: 12px;
}

#updateSuccess{
	padding-right: 25px;
	padding-left: 25px;
	padding-top: 10px;
	padding-bottom: 10px;
	background: #fff;
	border: 1px solid #ccc;
	cursor: pointer;
	font-size: 13px;
}
#hiddenPw, #hiddenPw2, #hiddenPw3{
	display:none;
}

#alert-success, #alert-fail{
	display:none;
	line-height: 19px;
	padding-left: 120px;
}

.update{
	line-height: 19px;
    padding-top: 10px;
    color: #8e8e8e;
    padding-left: 30px;
}

.updatepost{
	text-align: center;
	margin-top: 30px;
}



</style>


<div id = "container">
<div id = "content">
	<div class = "c_header">
		<h2>연락처 및 알림 설정</h2>
		<p class = "contxt"><strong>${userdata.ID }</strong>님의 연락처 정보입니다.<br>
		회원정보는 개인정보처리방침에 따라 안전하게 보호되며, 회원님의 명백한 동의 없이 공개 또는 제 3자에게 제공되지 않습니다.</p>
	</div>
	<form id = "fm" action="/mypage/mypage" method="post">
		<fieldset>
			<table class = "tbl_model">
				<tbody>
				<tr>
					<th scope="row">
						<div class = "thcell">
							사용자 아이디
						</div>
					</th>
					
					<td>
						<div class = "tdcell">
							<p class = "contxt_tit">${userdata.ID }</p>
							<p class = "contxt_desc">꿀벌마켓 서비스의 변경/종료 등 대부분 안내에 사용할 아이디입니다.</p>
						</div>
					</td>
				</tr>
				
				<tr>
					<th scope="row">
						<div class = "thcell">
							사용자 비밀번호
						</div>
					</th>
					
					<td>
						<div class = "tdcell">
							<p class = "contxt_tit" style="font-size: 13px;">비밀번호</p>
							<p class = "contxt_desc">꿀벌마켓 서비스의 변경/종료 등 대부분 인증에 사용할 비밀번호입니다.</p>
							<div id ="hiddenPw">
							<p class = "update">변경할 비밀번호 : <input type = "password" name = "pw" id = "userpw"/><br><br>
							비밀번호 재확인 : <input type = "password" id = "checkpw"/></p>
							<div id = "alert-success"><p style = "color: blue" >비밀번호가 일치합니다.</p></div>
							<div id = "alert-fail"><p style = "color: red" >비밀번호가 일치하지 않습니다.</p></div></div>
							<p class = "contxt_button"><button type = "button" id = "updateBtn">수정</button></p>
						</div>
					</td>
				</tr>
				
				<tr>
					<th scope="row">
						<div class = "thcell">
							 닉네임
						</div>
					</th>
					
					<td>
						<div class = "tdcell">
							<p class = "contxt_tit">${userdata.NICK }</p>
							<p class = "contxt_desc">꿀벌마켓 서비스에서 사용자를 나타내는 닉네임 입니다.</p>
							<div id ="hiddenPw2"><p class = "update">변경할 닉네임 : <input type = "text" name = "nick" id = "usernick"/></p></div>
							<p class = "contxt_button"><button type = "button" id = "updateBtn2">수정</button></p>
						</div>
					</td>
				</tr>
				
				<tr>
					<th scope="row">
						<div class = "thcell">
							거주 지역
						</div>
					</th>
					
					<td>
						<div class = "tdcell">
							<p class = "contxt_tit">${userdata.SIDO }&nbsp;${userdata.DONG}</p>
							<p class = "contxt_desc">꿀벌마켓 서비스에서 사용자의 거주지역을 나타냅니다.</p>
							<div id ="hiddenPw3"><p class = "update">변경할 거주지역 :  <input type = "text" name = "sido" id = "usersido"/> 
							<input type = "text" name = "dong" id = "userdong"/></p></div>
							<p class = "contxt_button"><button type = "button" id = "updateBtn3">수정</button></p>
						</div>
					</td>
				</tr>
				</tbody>
			</table>
		</fieldset>
		
		<div class = "updatepost">
			<button id = "updateSuccess">수정완료</button>
		</div>
	</form>
</div>
</div>
<c:import url="/WEB-INF/views/footer/mypagefooter.jsp?after" />
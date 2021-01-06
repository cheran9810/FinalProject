<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
   $("#cancel").click(function() {
      history.back(-1);
   });
   
   $("#id").focus();
});
</script>

<style type="text/css">
.center{
/*    border: 1px solid black; */
   display: inline-block;
   left: 70%;  

}
.container {
  overflow: hidden;
    transform: translateX(30%); 
}  
.text{
	margin-left : 100px;
}
.btn {
	background-color: #FFD700;
	width : 200px;
	margin-left: 30px;
}
.search{
width : 50px;
height : 30px;
	border :0;
	outline : 0; 
	background-color: #FFD700;
	border-radius: 4px;	
	margin-top :-8px; 
	margin-left : 210px;
	position: absolute;
}

 #dong
{
	margin-top : 10px;
} 

.left{

	float : left;
}

</style>

<div class="container">

<H1 class="text">신규회원가입</H1>

<br><br>
<div class="center">
<form action="/member/join" method="post" class="form-horizontal" 
name="fm">
   
   <div class="form-group">
      <label class="col-xs-4 control-label" for="id">아이디 : </label>
      <div class="col-xs-8">
         <input type="text" class="form-control" id="id" name="id" placeholder="Id" required value="${ snsMember != null ? snsMember.id : ''}" ${ snsMember != null ? 'readOnly' : '' }/>
      </div>
   </div>

   <div class="form-group">
      <label class="col-xs-4 control-label" for="pw">비밀번호 : </label>
      <div class="col-xs-8">
         <input type="password" class="form-control" id="pw" name="pw" placeholder="Password" required value="${ snsMember != null ? snsMember.pw : '' }" ${ snsMember != null ? 'readOnly' : '' }/>
      </div>
   </div>
   
      <div class="form-group">
      <label class="col-xs-4 control-label" for="pw">비밀번호확인 : </label>
      <div class="col-xs-8">
         <input type="password" class="form-control" id="pw2" name="pw2" placeholder="Password" required value="${ snsMember != null ? snsMember.pw : '' }" ${ snsMember != null ? 'readOnly' : '' }/>
      </div>
   </div>
   
   
   <!-- 비밀번호 일치여부 확인 -->
     <script type="text/javascript">
    function test() {
      var p1 = document.getElementById('pw').value;
      var p2 = document.getElementById('pw2').value;
      
      if(p1.length < 6) {
          alert('입력한 글자가 6글자 이상이어야 합니다.');
          $('#pw2').val("");
          return false;
      }
      
      if( p1 != p2 ) {
        alert("비밀번호가 일치 하지 않습니다");
        $('#pw2').val("");
        $('#btn').removeAttr('disabled');
        return false;
        
      } else{
        alert("회원가입을 환영합니다!");
        return true;
      }

    }
  </script>

   <div class="form-group">
      <label class="col-xs-4 control-label" for="nick">닉네임 : </label>
      <div class="col-xs-8">
         <input type="text" class="form-control" id="nick" name="nick" placeholder="닉네임" required/>
      </div>
   </div>
   
   <div class="form-group">
      <label class="col-xs-4 control-label" for="loc">지역 : </label>
      <div class="col-xs-8">
    
					
					<input placeholder="시도" name="sido" id="sido" type="text"
						readonly="readonly" class="form-control" /> 
					<button type="button" onclick="execPostCode();" class="search">
						검색</button>
					<input placeholder="동" name="dong"
						id="dong" type="text" readonly="readonly" class="form-control" />




				</div>
   </div>
   
   
   <div class="form-group">
      <div class="col-xs-offset-3 col-xs-10">      
         <button class="btn" onclick="test()">가입</button>
      </div>
   </div>
   
</form>
</div>

</div><!-- .container -->

<!-- 주소API -->
<!-- 주소검색용 스크립트 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script>
function execPostCode() {
      new daum.Postcode({
        oncomplete: function(data) {
           
         var sido = data.sido;
         var bname = data.bname;
         
//          $("#sido").val(sido);
//          $("#dong").val(bname);
         document.getElementById('sido').value = sido;
         document.getElementById('dong').value = bname;
         }
    }).open();
}
</script>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
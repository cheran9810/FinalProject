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

.btn {
	background-color: #FFD700;
	width : 100px;
	border-radius: 4px;	
	
	
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
		
		
		//시,구 입력 안했을시 알림
		var si =$('select[name="si"]').val();
		var gu=$('select[name="gu"]').val();
		var value = ""
		
		if(gu==value ||gu=="-선택-"|| si==value || si== "-선택-"){
			alert("지역 선택을 해주세요");
			var si =$('select[name="si"]').val();
			var gu=$('select[name="gu"]').val();
			
			
		
			return false;
		}
		
		
		
		if($('select[name="category"]').val()==value || $('select[name="category"]').val()=="카테고리를 선택하세요"){
			
			alert("카테고리를 선택해 주세요");
			return false;
		}
		if($("#price").val()==value){
			
			alert("가격을 입력해 주세요");
			return false;
		}
		
		if($("#quantity").val()==value){
			
			alert("수량을 입력해 주세요");
			return false;
		}
		if($("#title").val()==value){
			
			alert("제목을 입력해 주세요");
			return false;
		}
		
		if($("#content").val()=="<p><br></p>"){
			
			alert("내용을 입력해 주세요");
			return false;
		}
		if($('select[name="tradeClass"]').val()=="판매"){
			
			if($('select[name="category"]').val()=="디지털/가전"){
				var flag=0;
// 				var fileType=new Array();
				for (var fileIndex = 0; fileIndex <$("#file")[0].files.length; fileIndex++) {
					var file = $("#file")[0].files[fileIndex];
					console.log("file value:::"+file);
					console.log("file type:::"+file.type);
					var type=file.type.substring(0,5)
					console.log(type);
					
					if(type=="video"){
						flag=1;
						break;
					}else{
						continue;
					}
				}
				if (flag!=1){
				alert("디지털/가전 카테고리는 동영상을 필수로 등록하셔야 합니다");
				return false;
				}
				
			}else{
			
				if($("#file").val()==value){
					
				
						
					alert("판매자는 사진 혹은 동영상을 최소 1개 이상 등록하셔야 합니다");
					return false;
				}
			}
		}
		console.log("file value:::::"+$("#file").val())
	
	
		//form submit 수행하기
		$("form").submit();
	
		
		
	})
	
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
	


	<!-- carousel를 구성할 영역 설정 -->
	<div  style="width: 600px; height: 400px; margin-left:25%;">
		<div id="carousel-example-generic" class="carousel slide">
			<ol class="carousel-indicators">

				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active rm"></li>

<!-- 				<li data-target="#carousel-example-generic" data-slide-to="1"></li> -->
			</ol>

			<div class="carousel-inner" role="listbox">
				<!-- 이미지의 개수만큼 item을 만든다. 중요한 포인트는 carousel-indicators의 li 태그 개수와 item의 개수는 일치해야 한다. -->
				
				<div class="item active rm">
					<!-- 아미지 설정- -->
					
					<img
						src="/resources/img/no.png"
						style="width: 600px; height: 400px;">
<!-- 					<img -->
<!-- 						src="/resources/img/kitchen_adventurer_lemon.jpg" -->
<!-- 						style="width: 600px; height: 400px;"> -->
						
					<!-- 캡션 설정 (생략 가능) -->
					<!-- 글자 색은 검은색 -->
					<div class="carousel-caption" style="color: black; ">이미지를 넣어주세요!
					</div>
				</div>
<!-- 				<div class="item rm"> -->
<!-- 					<img src="/resources/img/01.jpg" -->
<!-- 						style="width: 600px; height: 400px;"> -->
					<div class="carousel-caption" style="color: black;"></div>
<!-- 				</div> -->
			</div>
			<!-- 왼쪽 화살표 버튼 -->
			<!-- href는 carousel의 id를 가르킨다. -->
			<a class="left carousel-control" href="#carousel-example-generic" 
				role="button" data-slide="prev"> <!-- 왼쪽 화살표 --> <span onclick="vid_play_pause()"
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			</a>
			<!-- 오른쪽 화살표 버튼 -->
			<!-- href는 carousel의 id를 가르킨다. -->
			<a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <!-- 오른쪽 화살표 --> <span onclick="vid_play_pause()"
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			</a>
		</div>
	</div>


	<form action="/trade/resister" onkeydown="return captureReturnKey(event)" method="post" enctype="multipart/form-data" class="form-horizontal" style="margin:0 auto; width:800px;">

		<br>
		<br>
		<div class="form-group col-md-12">	
			<label for="inputState">지역 선택</label> 
		</div>
		<div class="form-group col-md-2" style="width: 210px;display:inline-block;" >	
	 		<select id="inputState" class="form-control" style="width: 170px;" name="si" onChange="cat1_change(this.value,gu)" >
				<option selected>-선택-</option>
				<option value='서울'>서울</option>
				<option value='부산'>부산</option>
				<option value='대구'>대구</option>
				<option value='인천'>인천</option>
				<option value='광주'>광주</option>
				<option value='대전'>대전</option>
				<option value='울산'>울산</option>
				<option value='강원'>강원</option>
				<option value='경기'>경기</option>
				<option value='경남'>경남</option>
				<option value='경북'>경북</option>
				<option value='전남'>전남</option>
				<option value='전북' >전북</option>
				<option value='제주'>제주</option>
				<option value='충남'>충남</option>
				<option value='충북'>충북</option>
			</select>
  		</div>
  		<div class="form-group col-md-4" style="display:inline-block; width:210px;">
  			<select name="gu" class="form-control" onChange="cat2_change(this.value,dong)" style=" width: 170px;">
  				<option selected>-선택-</option>
<!-- 				<option value='215'>군산시</option> -->
<!-- 				<option value='216'>김제시</option> -->
<!-- 				<option value='217'>남원시</option> -->
<!-- 				<option value='218'>익산시</option> -->
<!-- 				<option value='219'>전주시 덕진구</option> -->
<!-- 				<option value='220'>전주시 완산구</option> -->
<!-- 				<option value='221'>정읍시</option> -->
<!-- 				<option value='222'>고창군</option> -->
<!-- 				<option value='223'>무주군</option> -->
<!-- 				<option value='224'>부안군</option> -->
<!-- 				<option value='225'>순창군</option> -->
<!-- 				<option value='226'>완주군</option> -->
<!-- 				<option value='227'>임실군</option> -->
<!-- 				<option value='228'>장수군</option> -->
<!-- 				<option value='229'>진안군</option> -->
 			</select>
  		</div>
 		<div class="form-group col-md-4" style="display:inline-block;">
  			<select name="dong" class="form-control"  style="width: 170px; ">
  				<option selected>-선택-</option>
 			</select>
  		</div>
  		
  				
  				
		<div class="form-group col-md-6">
			<label for="inputState">게시글 유형을 선택하세요</label> 
			<select id="inputState" name="tradeClass"
				class="form-control" style="width: 350px">
				<option selected  value="구매">구매 합니다</option>
				<option value="판매">판매 합니다</option>
			</select>
		</div>
		<div class="form-group col-md-6">
				<label for="inputState">카테고리</label> 
				<select id="inputState" style="width: 350px" name="category"	class="form-control">
					<option selected>카테고리를 선택하세요</option>
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
			<input	type="text" class="form-control" id="price" name="price" placeholder="0원" maxlength="9" style="width:350px;display: inline-block;">
			<div class="col-5" style="display:inline-block;">원</div>
		</div>
		
		<div class="form-group col-md-6">
			<div><label for="quantity">수량</label></div>
			<input	type="number" class="form-control" id="quantity" name="quantity" maxlength="9" style="width:350px;display: inline-block;">
			
		</div>
			<div class="form-group col-md-12">
				<label for="title">제목</label>
			<input	type="text" class="form-control" id="title" name="title" />
			</div>

			<div class="form-group col-md-12">
				<label for="content">본문</label>
				<textarea rows="10" style="width: 100%" id="content" name="content"></textarea>
			</div>

		<div class="form-group col-md-6">
<!-- 				<label for="file">사진 첨부</label> <input type="file" -->
<!-- 					multiple="multiple" name="file" id="file" /> -->
	
	  		<div style="position:relative;">
				<a class='btn btn-primary' href='javascript:;'>
					첨부파일
					<input type="file" multiple="multiple" name="file" id="file" accept="video/*,image/*",
					 style=
					 'position:absolute;
					 width: 201px;
					 height:34px;
					 z-index:2;
					 top:0;
					 left:0;
					 filter: alpha(opacity=0);
					 -ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
					 opacity:0;
					 background-color:transparent;
					 color:transparent;' 
					 name="file_source" size="40">
				</a>
				&nbsp;
				<span class='label label-info' id="upload-file-info"></span>
			</div>
		</div>
			<div class="text-center form-group col-md-12">
				<button class="btn" id="btnWrite">작성</button>
				<input type="reset" id="cancel" class="btn btn-danger" value="취소" />
			</div>
	</form>
		
	
	
<!-- 시,구 스크립트.. -->	
<script>
 var cat1_num = new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16);
 var cat1_name = new Array('서울','부산','대구','인천','광주','대전','울산','강원','경기','경남','경북','전남','전북','제주','충남','충북');


 var cat2_num = new Array();
 var cat2_name = new Array();


 cat2_num[1] = new Array(17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41);
 cat2_name[1] = new Array('강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');


 cat2_num[2] = new Array(42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57);
 cat2_name[2] = new Array('강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');


 cat2_num[3] = new Array(58,59,60,61,62,63,64,65);
 cat2_name[3] = new Array('남구','달서구','동구','북구','서구','수성구','중구','달성군');


 cat2_num[4] = new Array(66,67,68,69,70,71,72,73,74,75);
 cat2_name[4] = new Array('계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');


 cat2_num[5] = new Array(76,77,78,79,80);
 cat2_name[5] = new Array('광산구','남구','동구','북구','서구');


 cat2_num[6] = new Array(81,82,83,84,85);
 cat2_name[6] = new Array('대덕구','동구','서구','유성구','중구');


 cat2_num[7] = new Array(86,87,88,89,90);
 cat2_name[7] = new Array('남구','동구','북구','중구','울주군');


 cat2_num[8] = new Array(91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108);
 cat2_name[8] = new Array('강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','횡성군');


 cat2_num[9] = new Array(109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148);
 cat2_name[9] = new Array('고양시 덕양구','고양시 일산구','과천시','광명시','광주시','구리시','군포시','김포시','남양주시','동두천시','부천시 소사구','부천시 오정구','부천시 원미구','성남시 분당구','성남시 수정구','성남시 중원구','수원시 권선구','수원시 장안구','수원시 팔달구','시흥시','안산시 단원구','안산시 상록구','안성시','안양시 동안구','안양시 만안구','오산시','용인시','의왕시','의정부시','이천시','파주시','평택시','하남시','화성시','가평군','양주군','양평군','여주군','연천군','포천군');


 cat2_num[10] = new Array(149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168);
 cat2_name[10] = new Array('거제시','김해시','마산시','밀양시','사천시','양산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','의령군','창녕군','하동군','함안군','함양군','합천군');


 cat2_num[11] = new Array(169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192);
 cat2_name[11] = new Array('경산시','경주시','구미시','김천시','문경시','상주시','안동시','영주시','영천시','포항시 남구','포항시 북구','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');


 cat2_num[12] = new Array(193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214);
 cat2_name[12] = new Array('광양시','나주시','목포시','순천시','여수시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');


 cat2_num[13] = new Array(215,216,217,218,219,220,221,222,223,224,225,226,227,228,229);
 cat2_name[13] = new Array('군산시','김제시','남원시','익산시','전주시 덕진구','전주시 완산구','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');


 cat2_num[14] = new Array(230,231,232,233);
 cat2_name[14] = new Array('서귀포시','제주시','남제주군','북제주군');


 cat2_num[15] = new Array(234,235,236,237,238,239,240,241,242,243,244,245,246,247,248);
 cat2_name[15] = new Array('공주시','논산시','보령시','서산시','아산시','천안시','금산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');


 cat2_num[16] = new Array(249,250,251,252,253,254,255,256,257,258,259,260);
 cat2_name[16] = new Array('제천시','청주시 상당구','청주시 흥덕구','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');


function cat1_change(key,sel){
 if(key == '') return;
 
 const map = new Map();
 map.set(1,'서울');
 map.set(2,'부산');
 map.set(3,'대구');
 map.set(4,'인천');
 map.set(5,'광주');
 map.set(6,'대전');
 map.set(7,'울산');
 map.set(8,'강원');
 map.set(9,'경기');
 map.set(10,'경남');
 map.set(11,'경북');
 map.set(12,'전남');
 map.set(13,'전북');
 map.set(14,'제주');
 map.set(15,'충남');
 map.set(16,'충북');
 
 for([keyy, value] of map){
	 console.log("keyy : "+keyy)
	
	 if(key==value)
	 {
		 key=keyy;
	 }
 }

 var name = cat2_name[key];
 var val = cat2_num[key];

 for(i=sel.length-1; i>=0; i--)
  sel.options[i] = null;
 sel.options[0] = new Option('-선택-','', '', 'true');
 for(i=0; i<name.length; i++){
//   sel.options[i+1] = new Option(name[i],val[i]);
  sel.options[i+1] = new Option(name[i],name[i]);
 }
}

</script>	
<script>
var cat3_num = new Array();
var cat3_name = new Array();


cat3_num[1] = new Array(1,2,3,4,5,6,7,8,9,10,11,12);
cat3_name[1] = new Array(	
		"신사동",
		"논현동",
		"압구정동",
		"청담동",	
		"삼성동",
		"대치동",
		"역삼동",
		"도곡동",
		"개포동",
		"세곡동	",
		"일원동",
		"수서동");
cat3_num[2] = new Array(1,2,3,4,5,6,7,8);
cat3_name[2] = new Array(	
		"상일동	",
		"명일동",
		"고덕동",
		"암사동",
		"천호동",
		"성내동",
		"길동",
		"둔촌동"
		);
cat3_num[3] = new Array(1,2,3,4,5,6,7,8,9,10);
cat3_name[3] = new Array(
		"삼양동",
		"송중동",
		"송천동",
		"삼각산동"  ,
		"번동",
		"수유동"  ,
		"우이동",
		"미아동",
		"인수동",
		"강북구"
		);
cat3_num[4] = new Array(1,2,3,4,5,6,7,8,9,10);
cat3_name[4] = new Array(
		"염창동",
		"등촌동",
		"화곡동",
		"가양동",
		"발산동",
		"공항동	",
		"방화동",
		"방화동",
		"방화동",
		"우장산동"
		);
		


function cat2_change(key,sel){
 if(key == '') return;
 
 
 const map = new Map();
 map.set(1,'강남구');
 map.set(2,'강동구');
 map.set(3,'강북구');
 map.set(4,'강서구');
 map.set(5,'관악구');
 map.set(6,'광진구');
 map.set(7,'구로구');
 map.set(8,'금천구');
 map.set(9,'노원구');
 map.set(10,'도봉구');
 map.set(11,'동대문구');
 map.set(12,'동작구');
 map.set(13,'마포구');
 map.set(14,'서초구');
 map.set(15,'성동구');
 map.set(16,'성북구');
 map.set(17,'송파구');
 map.set(18,'양천구');
 map.set(19,'영등포구');
 map.set(20,'용산구');
 map.set(21,'은평구');
 map.set(22,'종로구');
 map.set(23,'중구');
 map.set(24,'중랑구');
 
 //키값에 숫자매핑작업..ex)'노원구','노원구' -> 9,'노원구'
 for([keyy, value] of map){
	
	 if(key==value)
	 {
		 key=keyy;
	 }
 }
//-----------------


 var name = cat3_name[key];
 var val = cat3_num[key];

 for(i=sel.length-1; i>=0; i--)
  sel.options[i] = null;
 sel.options[0] = new Option('-선택-','', '', 'true');
 for(i=0; i<name.length; i++){
//   sel.options[i+1] = new Option(name[i],val[i]);
  sel.options[i+1] = new Option(name[i],name[i]);
 }
}

</script>	


<!-- 비디오 퍼즈 동작 스크립트 -->
<script>

	function vid_play_pause() {
		
		$('video').trigger('pause');
	
	}
	
	//ENTER 안먹게 하는것 
	function captureReturnKey(e) { 
	    if(e.keyCode==13 && e.srcElement.type != 'textarea') 
	    return false; 
	} 
</script>



<script>
	$(document)
			.ready(
					function() {
						
						/* //---------가격 정규표현식 설정 ------------
						$('#price').change(function(){
							
							v = $(this).val();
							var val =numberWithCommas($(this).val());
							$(this).val(val);
							
							var regexp = /^[0-9]*$/
							if( !regexp.test(v) ) {

								alert("숫자만 입력하세요");
								$(this).val(v.replace(regexp,''));

							}
						});
						 */
						//---------콤마-------------------------					
						function numberWithCommas(x) {
						    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						}
						//----------------------------------------
						//---------------파일 추가할때 슬라이드 동작-----------------
						$('#file').change(function() {
							var result=addPreview($(this)); //preview form 추가하기
							console.log("preiveiw 한 다음 result값:"+  result)
				            if (result=="실패"){
				            	return false;
				            }
							console.log("preiveiw 한 다음 result값2:"+  result)
							console.log($(this).val());
							var fileInput = document.getElementById("file");
				            
				            var files = fileInput.files;
				            var file;
				            //비디오 혹은 이미지파일이 아닐경우 리턴폴스
				            
				            $("#upload-file-info").empty();
				            for (var i = 0; i < files.length; i++) {
				                
				                file = files[i];
				 		
				                $("#upload-file-info").append(file.name+" ");
				            }
							
// 							$("#upload-file-info").html($(this).val());
						});
						var $slider_list

						function addPreview(input) {
							if (input[0].files) {
					
								var i = 0;
								var fileURL=new Array();
								var fileExt=new Array();
								var fileType=new Array();
								var i=0;
								
								
								for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
									var file = input[0].files[fileIndex];
									fileType[fileIndex]=file.type.substring(0,5)
									fileURL[fileIndex] = URL.createObjectURL(file);
									var filename=file.name;
									console.log("filename : "+filename)
									var filelen=filename.length;
									console.log("filelen : "+filelen)
									var lastDot = filename.lastIndexOf('.');
									console.log("lastDot : "+lastDot)
									fileExt[fileIndex] = filename.substring(lastDot,filelen).toLowerCase();
									console.log("fileExt!["+fileIndex+"] : "+fileExt[fileIndex]);
									
								}
								
								//파일 선택이 여러개였을 시의 대응
								for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
									var file = input[0].files[fileIndex];
									
									console.log("fileType[fileIndex] : "+fileType[fileIndex])
									if(fileType[fileIndex]=="video"){

									}
									else if(fileType[fileIndex]=="image"){

									}else{
										alert("image나 비디오 파일이 아닙니다")
										$('div.rm').remove();
										$('li.rm').remove();
										$("#file").val("");
										$('#upload-file-info').empty();
										$(".carousel-inner").append("<div class='item active rm'><img src='https://mblogthumb-phinf.pstatic.net/20160129_100/sjm000412_1454076447242u2en7_PNG/2.png?type=w2' style='width: 600px; height: 400px;'></div>");
										$(".carousel-indicators").append("<li data-target='#carousel-example-generic' data-slide-to='0' class='active rm'></li>");
										return "실패";
									}
									$('div.rm').remove();
									$('li.rm').remove();
									
									console.log("file"+file.name)
									
// 									var filee = document.getElementById('file');
// 									var filePath = filee.value;
									
									
									console.log("fileExt!!["+i+"] : "+fileExt[i]);
									
									
									
									var reader = new FileReader();

									reader.onload = function(img) {
										
// 										img.target.result
										if (i == 0) {
											console.log("fileType[i]2 : "+fileType[i])
											if(fileType[i]=="image")
											{
											console.log("fileExt["+i+"] : "+fileExt[i]);
											$(".carousel-inner")
													.append(
															"<div class='item active rm'><img src='" +  fileURL[i] +	"'style='width: 600px; height: 400px;'></div>");

											}else if(fileType[i]=="video"){
// 												$(".carousel-inner")
// 												.append("<div class='item active rm'><iframe src='"+fileURL[i]+"?rel=0;amp;autoplay=0;' width='600' height='400' frameborder='0' webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe></div>");
												$(".carousel-inner")
												.append("<div class='item active rm'><video width='600' height='400' name='video' controls><source src='"+ fileURL[i] +"' type='video/mp4' id='a"+i+"'></video></div>");
												console.log("fileURL" + fileURL)
												
											}
											
											$(".carousel-indicators")
													.append(
															"<li data-target='#carousel-example-generic' data-slide-to='"+i+"' class='active rm'></li>"

													);
											console.log("fileExt["+i+"] : "+fileExt[i]);

										} else {
// 											console.log(img.target.result);
											//div id="preview" 내에 동적코드추가.
											//이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
											
											if(fileType[i]=="image")
											{
												$(".carousel-inner")
														.append(
																"<div class='item rm'><img src='" +  fileURL[i] +	"' style='width: 600px; height: 400px;'></div>");
												console.log("fileExt["+i+"] : "+fileExt[i]);
											}
											else if(fileType[i]=="video"){
// 												$(".carousel-inner")
// 												.append("<div class='item rm'><iframe src='" + fileURL[i] +	"?rel=0;amp;autoplay=0;' width='600' height='400' frameborder='0' webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe></div>");
												$(".carousel-inner")
												.append("<div class='item rm'><video width='600' height='400' name='video' controls><source src='"+ fileURL[i] +"' type='video/mp4'  id='a"+i+"'></video></div>");
												console.log("fileURL" + fileURL)
												console.log("fileExt["+i+"] : "+fileExt[i]);
											}
												$(".carousel-indicators")
														.append(
																"<li data-target='#carousel-example-generic' data-slide-to='"+i+"' class='rm'></li>"
													);
												console.log("fileExt["+i+"] : "+fileExt[i]);
											
										}
										
										i++;
										
									};
									reader.readAsDataURL(file);
									
								}
							} else
								alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.

						}//-----------------------------------------여기까지 슬라이드-----------------------------------console.log 지워야함
					});
</script>
<!-- 		<video width="320" height="240" controls> -->
<!-- 			<source src="videos/example.mp4" type="video/mp4"> -->
<!-- 		</video> -->

<!-- ------------------스마트에디터------------------- -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content", //에디터가 적용될 <textarea>의 id
	sSkinURI: "/resources/se2/SmartEditor2Skin.html", //에디터 스킨
	fCreator: "createSEditor2"
})

// <form>태그가 submit되면 스마트에디터에 작성된 내용이 <textarea>에
//적용되도록 하는 코드
function submitContents(elClickedObj) {
	
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		elClickedObj.form.submit();
	} catch(e) { }
	
}
</script>
<!-- ----------------------------------------------------- -->

<!-- --------------------------슬라이드 기초 설정--------------- -->

<script>
$(function() {
	// 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
	$('#carousel-example-generic').carousel({
		// 슬리아딩 자동 순환 지연 시간
		// false면 자동 순환하지 않는다.
		interval : false,
		// hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
		pause : "hover",
		// 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
		wrap : true,
		// 키보드 이벤트 설정 여부(?)
		keyboard : true
	});
});
</script>

	
	</div>

	<c:import url="/WEB-INF/views/layout/footer.jsp" />
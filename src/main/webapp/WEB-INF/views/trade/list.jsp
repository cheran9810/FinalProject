<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
   $("#btnWrite").click(function() {
      $(location).attr("href", "/trade/resister");
   })
})
</script>
<script type="text/javascript">
<!-- 라디오박스/체크박스 부분 -->

function setDisplay(id){
    if($('input:radio[id=gangnam]').is(':checked')) {
        //나머지 지역 hide
        $( '#viewGangnam' ).show();
        $( '.view' ).not('.gangnam').hide();
        
    } else if($('input:radio[id=gangdong]').is(':checked')) {
       $( '#viewGangdong' ).show();
       $( '.view' ).not('.gangdong').hide();
       
    } else if($('input:radio[id=gangbuk]').is(':checked')) {
       $( '#viewGangbuk' ).show();
       $( '.view' ).not('.gangbuk').hide();
       
    } else if($('input:radio[id=gangseo]').is(':checked')) {
       $( '#viewGangseo' ).show();
       $( '.view' ).not('.gangseo').hide();
       
    } else if($('input:radio[id=gwanak]').is(':checked')) {
       $( '#viewGwanak' ).show();
       $( '.view' ).not('.gwanak').hide();
    
    } else if($('input:radio[id=gwangjin]').is(':checked')) {
       $( '#viewGwangjin' ).show();
       $( '.view' ).not('.gwangjin').hide();
    
    } else if($('input:radio[id=guro]').is(':checked')) {
       $( '#viewGuro' ).show();
       $( '.view' ).not('.guro').hide();
    
    } else if($('input:radio[id=geumcheon]').is(':checked')) {
       $( '#viewGeumcheon' ).show();
       $( '.view' ).not('.geumcheon').hide();
   
    } else if($('input:radio[id=gangseo]').is(':checked')) {
       $( '#viewGangseo' ).show();
       $( '.view' ).not('.gangseo').hide();
    
    } else if($('input:radio[id=nowon]').is(':checked')) {
       $( '#viewNowon' ).show();
       $( '.view' ).not('.nowon').hide();
    
    } else if($('input:radio[id=dobong]').is(':checked')) {
       $( '#viewDobong' ).show();
       $( '.view' ).not('.dobong').hide();
    
    } else if($('input:radio[id=dongdaemun]').is(':checked')) {
       $( '#viewDongdaemun' ).show();
       $( '.view' ).not('.dongdaemun').hide();
    
    } else if($('input:radio[id=dongjak]').is(':checked')) {
       $( '#viewDongjak' ).show();
       $( '.view' ).not('.dongjak').hide();
       
    } else if($('input:radio[id=mapo]').is(':checked')) {
       $( '#viewMapo' ).show();
       $( '.view' ).not('.mapo').hide();
    
    } else if($('input:radio[id=seodaemun]').is(':checked')) {
       $( '#viewSeodaemun' ).show();
       $( '.view' ).not('.seodaemun').hide();
    
    } else if($('input:radio[id=seocho]').is(':checked')) {
       $( '#viewSeocho' ).show();
       $( '.view' ).not('.seocho').hide();
    
    } else if($('input:radio[id=seongdong]').is(':checked')) {
       $( '#viewSeongdong' ).show();
       $( '.view' ).not('.seongdong').hide();
    
    } else if($('input:radio[id=seongbuk]').is(':checked')) {
       $( '#viewSeongbuk' ).show();
       $( '.view' ).not('.seongbuk').hide();
    
    } else if($('input:radio[id=songpa]').is(':checked')) {
       $( '#viewSongpa' ).show();
       $( '.view' ).not('.songpa').hide();
    
    } else if($('input:radio[id=yangcheon]').is(':checked')) {
       $( '#viewYangcheon' ).show();
       $( '.view' ).not('.yangcheon').hide();
    
    } else if($('input:radio[id=yeongdeungpo]').is(':checked')) {
       $( '#viewYeongdeungpo' ).show();
       $( '.view' ).not('.yeongdeungpo').hide();
       
    } else if($('input:radio[id=yongsan]').is(':checked')) {
       $( '#viewYongsan' ).show();
       $( '.view' ).not('.yongsan').hide();
    
    } else if($('input:radio[id=eunpyeong]').is(':checked')) {
       $( '#viewEunpyeong' ).show();
       $( '.view' ).not('.eunpyeong').hide();
    
    } else if($('input:radio[id=jongno]').is(':checked')) {
       $( '#viewJongno' ).show();
       $( '.view' ).not('.jongno').hide();
    
    } else if($('input:radio[id=jung]').is(':checked')) {
       $( '#viewJung' ).show();
       $( '.view' ).not('.jung').hide();
    
    } else if($('input:radio[id=jungnang]').is(':checked')) {
       $( '#viewJungnang' ).show();
       $( '.view' ).not('.jungnang').hide();
    }
    
    
};

</script>

<style type="text/css">
table {
	margin-top : 20px;
	 table-layout: fixed;

}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: center;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}

.searchCheck {
	width: 842px;
	border: 1px solid black;
	 float:left;
	 margin-top : -10px;
	 margin-left : 100px;
	 border-radius: 4px;	
	 padding-top: 10px;
	 padding-left: 10px;
}
#selectPrice{

float:right;
}

#search {
	float: right;
	width: 200px;
	margin-right : 10px;
}

.btn {
	background-color: #FFD700;
	float: right;
	
}
.sidebar-nav {
  margin-left : -20px;
  width: 140px;
  /* margin: 0; */
  padding: 0;
  list-style: none;
  float:left;
}

.sidebar-nav li {
  text-indent: 1.5em;
  border-bottom: 1px solid gray;
/*   line-height: 2.8em; */
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

a {
	text-decoration: none;
	color: #000000;
}
</style>

<div class="container">


<form action="/trade/list" method="get">

	<div id="page-wrapper">
	  <!-- 사이드바 -->
	  <div id="sidebar-wrapper">
	    <ul class="sidebar-nav">
	      <li class="sidebar-brand">
	        카테고리선택
	      </li>
	      <li><input type="checkbox" name="category" value="디지털/가전"><span> 디지털/가전</span></li>
	          <li><input type="checkbox" name="category" value="가구/인테리어"><span> 가구/인테리어</span></li>
    <li><input type="checkbox" name="category" value="유아동/유아도서"><span> 유아동/유아도서</span></li>
    <li><input type="checkbox" name="category" value="생활/가공식품"><span> 생활/가공식품</span></li>
    <li><input type="checkbox" name="category" value="스포츠/레저"><span> 스포츠/레저</span></li>
    <li><input type="checkbox" name="category" value="여성잡화"><span> 여성잡화</span></li>
    <li><input type="checkbox" name="category" value="여성의류"><span> 여성의류</span></li>
    <li><input type="checkbox" name="category" value="남성패션/잡화"><span> 남성패션/잡화</span></li>
    <li><input type="checkbox" name="category" value="게임/취미"><span> 게임/취미</span></li>
    <li><input type="checkbox" name="category" value="뷰티/미용"><span> 뷰티/미용</span></li>
    <li><input type="checkbox" name="category" value="반려동물용품"><span> 반려동물용품</span></li>
    <li><input type="checkbox" name="category" value="도서/티켓/음반"><span> 도서/티켓/음반</span></li>
    <li><input type="checkbox" name="category" value="식물"><span> 식물</span></li>
<li><input type="checkbox" name="category" value="기타중고물품"><span> 기타중고물품</span></li>

	    </ul>
	  </div>
	  <!-- /사이드바 -->
	
	</div>
		<div class="">
			<br>
			<br> 
			<button id="btnSearch" class="btn">검색</button>
			<input class="form-control" type="text" id="search"
				name="search" />

		</div>

<br><br>
		<div id="selectPrice">
			가격대 설정  <select name="price">
				<option value="0">선택안함</option>
				<option value="5000">~5,000 원</option>
				<option value="10000">~10,000 원</option>
				<option value="30000">~30,000 원</option>
				<option value="50000">~50,000 원</option>
				<option value="70000">~70,000 원</option>
				<option value="100000">~100,000 원</option>
			</select> <br>
			<br>
		</div>
		<br><br>

<div class="searchCheck">

    지역 선택<br><br>
    <input type="radio" name="city" id="gangnam" value="gangnam" onchange="setDisplay()">
       <label for="gangnam">강남구</label>
    <input type="radio" name="city" id="gangdong" value="gangdong" onchange="setDisplay()">
       <label for="gangdong">강동구</label>
    <input type="radio" name="city" id="gangbuk" value="gangbuk" onchange="setDisplay()">
       <label for="gangbuk">강북구</label>
    <input type="radio" name="city" id="gangseo" value="gangseo" onchange="setDisplay()">
       <label for="gangseo">강서구</label>
    <input type="radio" name="city" id="gwanak" value="gwanak" onchange="setDisplay()">
       <label for="gwanak">관악구</label>
    <input type="radio" name="city" id="gwangjin" value="gwangjin" onchange="setDisplay()">
       <label for="gwangjin">광진구</label>
    <input type="radio" name="city" id="guro" value="guro" onchange="setDisplay()">
       <label for="guro">구로구</label>
    <input type="radio" name="city" id="geumcheon" value="geumcheon" onchange="setDisplay()">
       <label for="geumcheon">금천구</label>
    <input type="radio" name="city" id="nowon" value="nowon" onchange="setDisplay()">
       <label for="nowon">노원구</label>
    <input type="radio" name="city" id="dobong" value="dobong" onchange="setDisplay()">
       <label for="dobong">도봉구</label>
    <input type="radio" name="city" id="dongdaemun" value="dongdaemun" onchange="setDisplay()">
       <label for="dongdaemun">동대문구</label>
    <input type="radio" name="city" id="dongjak" value="dongjak" onchange="setDisplay()">
       <label for="dongjak">동작구</label>
    <input type="radio" name="city" id="mapo" value="mapo" onchange="setDisplay()">
       <label for="mapo">마포구</label>
    <input type="radio" name="city" id="seodaemun" value="seodaemun" onchange="setDisplay()">
       <label for="seodaemun">서대문구</label>
    <input type="radio" name="city" id="seocho" value="seocho" onchange="setDisplay()">
       <label for="seocho">서초구</label>
    <input type="radio" name="city" id="seongdong" value="seongdong" onchange="setDisplay()">
       <label for="seongdong">성동구</label>
    <input type="radio" name="city" id="seongbuk" value="seongbuk" onchange="setDisplay()">
       <label for="seongbuk">성북구</label>
    <input type="radio" name="city" id="songpa" value="songpa" onchange="setDisplay()">
       <label for="songpa">송파구</label>
    <input type="radio" name="city" id="yangcheon" value="yangcheon" onchange="setDisplay()">
       <label for="yangcheon">양천구</label>
    <input type="radio" name="city" id="yeongdeungpo" value="yeongdeungpo" onchange="setDisplay()">
       <label for="yeongdeungpo">영등포구</label>
    <input type="radio" name="city" id="yongsan" value="yongsan" onchange="setDisplay()">
       <label for="yongsan">용산구</label>
    <input type="radio" name="city" id="eunpyeong" value="eunpyeong" onchange="setDisplay()">
       <label for="eunpyeong">은평구</label>
    <input type="radio" name="city" id="jongno" value="jongno" onchange="setDisplay()">
       <label for="jongno">종로구</label>
    <input type="radio" name="city" id="jung" value="jung" onchange="setDisplay()">
       <label for="jung">중구</label>
    <input type="radio" name="city" id="jungnang" value="jungnang" onchange="setDisplay()">
       <label for="jungnang">중랑구</label>
    <br><br>
    
    <div id="viewGangnam" class="view gangnam" style="display:none">
       강남구 지역 세부 선택 <br><br>
       <input type="checkbox" name="location" value="개포동"><span> 개포동</span>
       <input type="checkbox" name="location" value="논현동"><span> 논현동</span>
       <input type="checkbox" name="location" value="대치동"><span> 대치동</span>
       <input type="checkbox" name="location" value="도곡동"><span> 도곡동</span>
       <input type="checkbox" name="location" value="삼성동"><span> 삼성동</span>
       <input type="checkbox" name="location" value="세곡동"><span> 세곡동</span>
       <input type="checkbox" name="location" value="수서동"><span> 수서동</span>
       <input type="checkbox" name="location" value="신사동"><span> 신사동</span>
       <input type="checkbox" name="location" value="압구정동"><span> 압구정동</span>
       <input type="checkbox" name="location" value="역삼동"><span> 역삼동</span>
       <input type="checkbox" name="location" value="율현동"><span> 율현동</span>
       <input type="checkbox" name="location" value="일원동"><span> 일원동</span>
       <input type="checkbox" name="location" value="일원본동"><span> 일원본동</span>
       <input type="checkbox" name="location" value="자곡동"><span> 자곡동</span>
       <input type="checkbox" name="location" value="청담동"><span> 청담동</span>
       <br><br>
    </div>
    
    <div id="viewGangdong" class="view gangdong" style="display:none">
       강동구 지역 세부 선택<br><br>
          <input type="checkbox" name="location" value="강일동"><span> 강일동</span>
          <input type="checkbox" name="location" value="고덕동"><span> 고덕동</span>
         <input type="checkbox" name="location" value="길동"><span> 길동</span>
       <input type="checkbox" name="location" value="둔촌동"><span> 둔촌동</span>
       <input type="checkbox" name="location" value="명일동"><span> 명일동</span>
       <input type="checkbox" name="location" value="상일동"><span> 상일동</span>
       <input type="checkbox" name="location" value="성내동"><span> 성내동</span>
       <input type="checkbox" name="location" value="암사동"><span> 암사동</span>
       <input type="checkbox" name="location" value="천호동"><span> 천호동</span>
       <br><br>
    </div>
    
    <div id="viewGangbuk" class="view gangbuk" style="display:none">
       강북구 지역 세부 선택<br><br>
        <input type="checkbox" name="location" value="미아동"><span> 미아동</span>
          <input type="checkbox" name="location" value="번동"><span> 번동</span>
         <input type="checkbox" name="location" value="삼각산동"><span> 삼각산동</span>
       <input type="checkbox" name="location" value="삼양동"><span> 삼양동</span>
       <input type="checkbox" name="location" value="송중동"><span> 송중동</span>
       <input type="checkbox" name="location" value="송천동"><span> 송천동</span>
       <input type="checkbox" name="location" value="수유동"><span> 수유동</span>
       <input type="checkbox" name="location" value="우이동"><span> 우이동</span>
       <input type="checkbox" name="location" value="인수동"><span> 인수동</span>
       <br><br>
    </div>
    
    <div id="viewGangseo" class="view gangseo" style="display:none">
       강서구 지역 세부 선택<br><br>
       <input type="checkbox" name="location" value="가양동"><span> 가양동</span>
       <input type="checkbox" name="location" value="개화동"><span> 개화동</span>
       <input type="checkbox" name="location" value="공항동"><span> 공항동</span>
       <input type="checkbox" name="location" value="과해동"><span> 과해동</span>
       <input type="checkbox" name="location" value="내발산동"><span> 내발산동</span>
       <input type="checkbox" name="location" value="등촌동"><span> 등촌동</span>
       <input type="checkbox" name="location" value="마곡동"><span> 마곡동</span>
       <input type="checkbox" name="location" value="방화동"><span> 방화동</span>
       <input type="checkbox" name="location" value="염창동"><span> 염창동</span>
       <input type="checkbox" name="location" value="오곡동"><span> 오곡동</span>
       <input type="checkbox" name="location" value="오쇠동"><span> 오쇠동</span>
       <input type="checkbox" name="location" value="외발산동"><span> 외발산동</span>
       <input type="checkbox" name="location" value="우장산동"><span> 우장산동</span>
       <input type="checkbox" name="location" value="화곡동"><span> 화곡동</span>
       <input type="checkbox" name="location" value="화곡본동"><span> 화곡본동</span>
       <br><br>
    </div>
    
    <div id="viewGwanak" class="view gwanak" style="display:none">
       관악구 지역 세부 선택<br><br>
        <input type="checkbox" name="location" value="낙성대동"><span> 낙성대동</span>
        <input type="checkbox" name="location" value="난곡동"><span> 난곡동</span>
        <input type="checkbox" name="location" value="난향동"><span> 난향동</span>
        <input type="checkbox" name="location" value="남현동"><span> 남현동</span>
        <input type="checkbox" name="location" value="대학동"><span> 대학동</span>
        <input type="checkbox" name="location" value="미성동"><span> 미성동</span>
        <input type="checkbox" name="location" value="보라매동"><span> 보라매동</span>
        <input type="checkbox" name="location" value="봉천동"><span> 봉천동</span>
        <input type="checkbox" name="location" value="삼성동"><span> 삼성동</span>
        <input type="checkbox" name="location" value="서림동"><span> 서림동</span>
        <input type="checkbox" name="location" value="서원동"><span> 서원동</span>
        <input type="checkbox" name="location" value="성현동"><span> 성현동</span>
        <input type="checkbox" name="location" value="신림동"><span> 신림동</span>
        <input type="checkbox" name="location" value="신사동"><span> 신사동</span>
        <input type="checkbox" name="location" value="신원동"><span> 신원동</span>
        <input type="checkbox" name="location" value="은천동"><span> 은천동</span>
        <input type="checkbox" name="location" value="인천동"><span> 인천동</span>
        <input type="checkbox" name="location" value="조원동"><span> 조원동</span>
        <input type="checkbox" name="location" value="중앙동"><span> 중앙동</span>
        <input type="checkbox" name="location" value="청룡동"><span> 청룡동</span>
        <input type="checkbox" name="location" value="청림동"><span> 청림동</span>
        <input type="checkbox" name="location" value="행운동"><span> 행운동</span>
       <br><br>
    </div>
    
     <div id="viewGwangjin" class="view gwangjin" style="display:none">
       광진구 지역 세부 선택<br><br>
        <input type="checkbox" name="location" value="광장동"><span> 광장동</span>
        <input type="checkbox" name="location" value="구의동"><span> 구의동</span>
        <input type="checkbox" name="location" value="군자동"><span> 군자동</span>
        <input type="checkbox" name="location" value="능동"><span> 능동</span>
        <input type="checkbox" name="location" value="자양동"><span> 자양동</span>
        <input type="checkbox" name="location" value="중곡동"><span> 중곡동</span>
        <input type="checkbox" name="location" value="화양동"><span> 화양동</span>
       <br><br>
    </div>
    
     <div id="viewGuro" class="view guro" style="display:none">
       구로구 지역 세부 선택<br><br>
        <input type="checkbox" name="location" value="가리봉동"><span> 가리봉동</span>
        <input type="checkbox" name="location" value="개복동"><span> 개복동</span>
        <input type="checkbox" name="location" value="고척동"><span> 고척동</span>
        <input type="checkbox" name="location" value="구로동"><span> 구로동</span>
        <input type="checkbox" name="location" value="궁동"><span> 궁동</span>
        <input type="checkbox" name="location" value="신도림동"><span> 신도림동</span>
        <input type="checkbox" name="location" value="오류동"><span> 오류동</span>
        <input type="checkbox" name="location" value="온수동"><span> 온수동</span>
        <input type="checkbox" name="location" value="천왕동"><span> 천왕동</span>
        <input type="checkbox" name="location" value="항동"><span> 항동</span>
       <br><br>
    </div>
    
     <div id="viewGeumcheon" class="view geumcheon" style="display:none">
       금천구 지역 세부 선택<br><br>
        <input type="checkbox" name="location" value="가산동"><span> 가산동</span>
        <input type="checkbox" name="location" value="독산동"><span> 독산동</span>
        <input type="checkbox" name="location" value="시흥동"><span> 시흥동</span>
       <br><br>
    </div>
    
     <div id="viewNowon" class="view nowon" style="display:none">
       노원구 지역 세부 선택<br><br>
        <input type="checkbox" name="location" value="공릉동"><span> 공릉동</span>
        <input type="checkbox" name="location" value="상계동"><span> 상계동</span>
        <input type="checkbox" name="location" value="월계동"><span> 월계동</span>
        <input type="checkbox" name="location" value="중계동"><span> 중계동</span>
        <input type="checkbox" name="location" value="중계본동"><span> 중계본동</span>
        <input type="checkbox" name="location" value="하계동"><span> 하계동</span>
       <br><br>
    </div>
    
     <div id="viewDobong" class="view dobong" style="display:none">
       도봉구 지역 세부 선택<br><br>
        <input type="checkbox" name="location" value="도봉동"><span> 도봉동</span>
        <input type="checkbox" name="location" value="방학동"><span> 방학동</span>
        <input type="checkbox" name="location" value="쌍문동"><span> 쌍문동</span>
        <input type="checkbox" name="location" value="창동"><span> 창동</span>
       <br><br>
    </div>
    
     <div id="viewDongdaemun" class="view dongdaemun" style="display:none">
       동대문구 지역 세부 선택<br><br>
        <input type="checkbox" name="location" value="답십리동"><span> 답십리동</span>
        <input type="checkbox" name="location" value="신설동"><span> 신설동</span>
        <input type="checkbox" name="location" value="용두동"><span> 용두동</span>
        <input type="checkbox" name="location" value="이문동"><span> 이문동</span>
        <input type="checkbox" name="location" value="장안동"><span> 장안동</span>
        <input type="checkbox" name="location" value="전농동"><span> 전농동</span>
        <input type="checkbox" name="location" value="제기동"><span> 제기동</span>
        <input type="checkbox" name="location" value="청량리동"><span> 청량리동</span>
        <input type="checkbox" name="location" value="회기동"><span> 회기동</span>
        <input type="checkbox" name="location" value="휘경동"><span> 휘경동</span>
       <br><br>
    </div>
    
     <div id="viewDongjak" class="view dongjak" style="display:none">
       동작구 지역 세부 선택<br><br>
        <input type="checkbox" name="location" value="노량진동"><span> 노량진동</span>
        <input type="checkbox" name="location" value="대방동"><span> 대방동</span>
        <input type="checkbox" name="location" value="동작동"><span> 동작동</span>
        <input type="checkbox" name="location" value="본동"><span> 본동</span>
        <input type="checkbox" name="location" value="사당동"><span> 사당동</span>
        <input type="checkbox" name="location" value="상도동"><span> 상도동</span>
        <input type="checkbox" name="location" value="신대방동"><span> 신대방동</span>
        <input type="checkbox" name="location" value="흑석동"><span> 흑석동</span>
       <br><br>
    </div>
    
     <div id="viewMapo" class="view mapo" style="display:none">
       마포구 지역 세부 선택<br><br>
        <input type="checkbox" name="location" value="공덕동"><span> 공덕동</span>
        <input type="checkbox" name="location" value="구수동"><span> 구수동</span>
        <input type="checkbox" name="location" value="노고산동"><span> 노고산동</span>
        <input type="checkbox" name="location" value="당인동"><span> 당인동</span>
        <input type="checkbox" name="location" value="대흥동"><span> 대흥동</span>
        <input type="checkbox" name="location" value="도화동"><span> 도화동</span>
        <input type="checkbox" name="location" value="동교동"><span> 동교동</span>
        <input type="checkbox" name="location" value="마포동"><span> 마포동</span>
        <input type="checkbox" name="location" value="망원동"><span> 망원동</span>
        <input type="checkbox" name="location" value="상수동"><span> 상수동</span>
        <input type="checkbox" name="location" value="상암동"><span> 상암동</span>
        <input type="checkbox" name="location" value="서교동"><span> 서교동</span>
        <input type="checkbox" name="location" value="성산동"><span> 성산동</span>
        <input type="checkbox" name="location" value="신공덕동"><span> 신공덕동</span>
        <input type="checkbox" name="location" value="신수동"><span> 신수동</span>
        <input type="checkbox" name="location" value="신정동"><span> 신정동</span>
        <input type="checkbox" name="location" value="아현동"><span> 아현동</span>
        <input type="checkbox" name="location" value="연남동"><span> 연남동</span>
        <input type="checkbox" name="location" value="염리동"><span> 염리동</span>
        <input type="checkbox" name="location" value="용강동"><span> 용강동</span>
        <input type="checkbox" name="location" value="중동"><span> 중동</span>
        <input type="checkbox" name="location" value="창전동"><span> 창전동</span>
        <input type="checkbox" name="location" value="토정동"><span> 토정동</span>
        <input type="checkbox" name="location" value="하중동"><span> 하중동</span>
        <input type="checkbox" name="location" value="합정동"><span> 합정동</span>
        <input type="checkbox" name="location" value="현석동"><span> 현석동</span>
       <br><br>
    </div>
    
     <div id="viewSeodaemun" class="view seadaemun" style="display:none">
       서대문구 지역 세부 선택<br><br>
        <input type="checkbox" name="location" value="남가좌동"><span> 남가좌동</span>
        <input type="checkbox" name="location" value="냉천동"><span> 냉천동</span>
        <input type="checkbox" name="location" value="대신동"><span> 대신동</span>
        <input type="checkbox" name="location" value="대현동"><span> 대현동</span>
        <input type="checkbox" name="location" value="미근동"><span> 미근동</span>
        <input type="checkbox" name="location" value="봉원동"><span> 봉원동</span>
        <input type="checkbox" name="location" value="북가좌동"><span> 북가좌동</span>
        <input type="checkbox" name="location" value="북아현동"><span> 북아현동</span>
        <input type="checkbox" name="location" value="신촌동"><span> 신촌동</span>
        <input type="checkbox" name="location" value="연희동"><span> 연희동</span>
        <input type="checkbox" name="location" value="연천동"><span> 연천동</span>
        <input type="checkbox" name="location" value="옥천동"><span> 옥천동</span>
        <input type="checkbox" name="location" value="창천동"><span> 창천동</span>
        <input type="checkbox" name="location" value="천연동"><span> 천연동</span>
        <input type="checkbox" name="location" value="충현동"><span> 충현동</span>
        <input type="checkbox" name="location" value="합동"><span> 합동</span>
        <input type="checkbox" name="location" value="현저동"><span> 현저동</span>
        <input type="checkbox" name="location" value="홍은동"><span> 홍은동</span>
        <input type="checkbox" name="location" value="홍제동"><span> 홍제동</span>
       <br><br>
    </div>
    
     <div id="viewSeocho" class="view seocho" style="display:none">
       서초구 지역 세부 선택<br><br>
        <input type="checkbox" name="location" value="내곡동"><span> 가양동</span>
        <input type="checkbox" name="location" value="반포동"><span> 가양동</span>
        <input type="checkbox" name="location" value="반포본동"><span> 가양동</span>
        <input type="checkbox" name="location" value="방배동"><span> 가양동</span>
        <input type="checkbox" name="location" value="방배본동"><span> 가양동</span>
        <input type="checkbox" name="location" value="서초동"><span> 가양동</span>
        <input type="checkbox" name="location" value="신원동"><span> 가양동</span>
        <input type="checkbox" name="location" value="양재동"><span> 가양동</span>
        <input type="checkbox" name="location" value="염곡동"><span> 가양동</span>
        <input type="checkbox" name="location" value="우면동"><span> 가양동</span>
        <input type="checkbox" name="location" value="원지동"><span> 가양동</span>
        <input type="checkbox" name="location" value="잠원동"><span> 가양동</span>
       <br><br>
    </div>
    
     <div id="viewSeongdong" class="view seongdong" style="display:none">
       성동구 지역 세부 선택<br><br>
        <input type="checkbox" name="location" value="도선동"><span> 도선동</span>
        <input type="checkbox" name="location" value="마장동"><span> 마장동</span>
        <input type="checkbox" name="location" value="사근동"><span> 사근동</span>
        <input type="checkbox" name="location" value="상왕십리동"><span> 상왕십리동</span>
        <input type="checkbox" name="location" value="송정동"><span> 송정동</span>
        <input type="checkbox" name="location" value="옥수동"><span> 옥수동</span>
        <input type="checkbox" name="location" value="용답동"><span> 용답동</span>
        <input type="checkbox" name="location" value="응봉동"><span> 응봉동</span>
        <input type="checkbox" name="location" value="하왕십리동"><span> 하왕십리동</span>
        <input type="checkbox" name="location" value="행당동"><span> 행당동</span>
        <input type="checkbox" name="location" value="홍익동"><span> 홍익동</span>
       <br><br>
    </div>
    
     <div id="viewSeongbuk" class="view seongbuk" style="display:none">
       성북구 지역 세부 선택<br><br>
        <input type="checkbox" name="location" value="길음동"><span> 길음동</span>
        <input type="checkbox" name="location" value="돈암동"><span> 돈암동</span>
        <input type="checkbox" name="location" value="동선동"><span> 동선동</span>
        <input type="checkbox" name="location" value="동소문동"><span> 동소문동</span>
        <input type="checkbox" name="location" value="보문동"><span> 보문동</span>
        <input type="checkbox" name="location" value="삼선동"><span> 삼선동</span>
        <input type="checkbox" name="location" value="상월곡동"><span> 상월곡동</span>
        <input type="checkbox" name="location" value="석관동"><span> 석관동</span>
        <input type="checkbox" name="location" value="성북동"><span> 성북동</span>
        <input type="checkbox" name="location" value="안암동"><span> 안암동</span>
        <input type="checkbox" name="location" value="월곡동"><span> 월곡동</span>
        <input type="checkbox" name="location" value="장위동"><span> 장위동</span>
        <input type="checkbox" name="location" value="정릉동"><span> 정릉동</span>
        <input type="checkbox" name="location" value="종암동"><span> 종암동</span>
        <input type="checkbox" name="location" value="하월곡동"><span> 하월곡동</span>
       <br><br>
    </div>
    
     <div id="viewSongpa" class="view songpa" style="display:none">
       송파구 지역 세부 선택<br><br>
        <input type="checkbox" name="location" value="가락동"><span> 가락동</span>
        <input type="checkbox" name="location" value="가락본동"><span> 가락본동</span>
        <input type="checkbox" name="location" value="거여동"><span> 거여동</span>
        <input type="checkbox" name="location" value="마천동"><span> 마천동</span>
        <input type="checkbox" name="location" value="문정동"><span> 문정동</span>
        <input type="checkbox" name="location" value="방이동"><span> 방이동</span>
        <input type="checkbox" name="location" value="삼전동"><span> 삼전동</span>
        <input type="checkbox" name="location" value="석촌동"><span> 석촌동</span>
        <input type="checkbox" name="location" value="송파동"><span> 송파동</span>
        <input type="checkbox" name="location" value="신천동"><span> 신천동</span>
        <input type="checkbox" name="location" value="오금동"><span> 오금동</span>
        <input type="checkbox" name="location" value="오륜동"><span> 오륜동</span>
        <input type="checkbox" name="location" value="위례동"><span> 위례동</span>
        <input type="checkbox" name="location" value="잠실동"><span> 잠실동</span>
        <input type="checkbox" name="location" value="잠실본동"><span> 잠실본동</span>
        <input type="checkbox" name="location" value="장지동"><span> 장지동</span>
        <input type="checkbox" name="location" value="풍납동"><span> 풍납동</span>
       <br><br>
    </div>
    
    <div id="viewYangcheon" class="view yangcheon" style="display:none">
       양천구 지역 세부 선택<br><br>
        <input type="checkbox" name="location" value="목동"><span> 목동</span>
        <input type="checkbox" name="location" value="신월동"><span> 신월동</span>
        <input type="checkbox" name="location" value="신정동"><span> 신정동</span>
       <br><br>
    </div>
    
    <div id="viewYeongdeungpo" class="view yeongdeungpo" style="display:none">
       영등포구 지역 세부 선택<br><br>
        <input type="checkbox" name="location" value="당산동"><span> 당산동</span>
        <input type="checkbox" name="location" value="대림동"><span> 대림동</span>
        <input type="checkbox" name="location" value="도림동"><span> 도림동</span>
        <input type="checkbox" name="location" value="문래동"><span> 문래동</span>
        <input type="checkbox" name="location" value="신길동"><span> 신길동</span>
        <input type="checkbox" name="location" value="양평동"><span> 양평동</span>
        <input type="checkbox" name="location" value="양화동"><span> 양화동</span>
        <input type="checkbox" name="location" value="여의도동"><span> 여의도동</span>
        <input type="checkbox" name="location" value="영등포동"><span> 영등포동</span>
        <input type="checkbox" name="location" value="영등포본동"><span> 영등포본동</span>
       <br><br>
    </div>
    
    <div id="viewYongsan" class="view yongsan" style="display:none">
       용산구 지역 세부 선택<br><br>
        <input type="checkbox" name="location" value="갈월동"><span> 갈월동</span>
        <input type="checkbox" name="location" value="남영동"><span> 남영동</span>
        <input type="checkbox" name="location" value="도원동"><span> 도원동</span>
        <input type="checkbox" name="location" value="동빙고동"><span> 동빙고동</span>
        <input type="checkbox" name="location" value="동자동"><span> 동자동</span>
        <input type="checkbox" name="location" value="문배동"><span> 문배동</span>
        <input type="checkbox" name="location" value="보광동"><span> 보광동</span>
        <input type="checkbox" name="location" value="산천동"><span> 산천동</span>
        <input type="checkbox" name="location" value="서계동"><span> 서계동</span>
        <input type="checkbox" name="location" value="서빙고동"><span> 서빙고동</span>
        <input type="checkbox" name="location" value="신계동"><span> 신계동</span>
        <input type="checkbox" name="location" value="신창동"><span> 신창동</span>
        <input type="checkbox" name="location" value="용문동"><span> 신창동</span>
        <input type="checkbox" name="location" value="이촌동"><span> 이촌동</span>
        <input type="checkbox" name="location" value="이태원동"><span> 이태원동</span>
        <input type="checkbox" name="location" value="주성동"><span> 주성동</span>
        <input type="checkbox" name="location" value="청암동"><span> 청암동</span>
        <input type="checkbox" name="location" value="한남동"><span> 한남동</span>
        <input type="checkbox" name="location" value="효창동"><span> 효창동</span>
        <input type="checkbox" name="location" value="후암동"><span> 후암동</span>
       <br><br>
    </div>
    
    <div id="viewEunpyeong" class="view eunpyeong" style="display:none">
       은평구 지역 세부 선택<br><br>
        <input type="checkbox" name="location" value="갈현동"><span> 갈현동</span>
        <input type="checkbox" name="location" value="구산동"><span> 구산동</span>
        <input type="checkbox" name="location" value="녹번동"><span> 녹번동</span>
        <input type="checkbox" name="location" value="대조동"><span> 대조동</span>
        <input type="checkbox" name="location" value="불광동"><span> 불광동</span>
        <input type="checkbox" name="location" value="수색동"><span> 수색동</span>
        <input type="checkbox" name="location" value="신사동"><span> 신사동</span>
        <input type="checkbox" name="location" value="역촌동"><span> 역촌동</span>
        <input type="checkbox" name="location" value="응암동"><span> 응암동</span>
        <input type="checkbox" name="location" value="증산동"><span> 증산동</span>
        <input type="checkbox" name="location" value="진관동"><span> 진관동</span>
       <br><br>
    </div>
    
    <div id="viewJongno" class="view jongno" style="display:none">
       종로구 지역 세부 선택<br><br>
        <input type="checkbox" name="location" value="가희동"><span> 가희동</span>
        <input type="checkbox" name="location" value="견지동"><span> 견지동</span>
        <input type="checkbox" name="location" value="경운동"><span> 경운동</span>
        <input type="checkbox" name="location" value="계동"><span> 계동</span>
        <input type="checkbox" name="location" value="공평동"><span> 공평동</span>
        <input type="checkbox" name="location" value="관수동"><span> 관수동</span>
        <input type="checkbox" name="location" value="관철동"><span> 관철동</span>
        <input type="checkbox" name="location" value="관훈동"><span> 관훈동</span>
        <input type="checkbox" name="location" value="교남동"><span> 교남동</span>
        <input type="checkbox" name="location" value="교북동"><span> 교북동</span>
        <input type="checkbox" name="location" value="구기동"><span> 구기동</span>
        <input type="checkbox" name="location" value="궁정동"><span> 궁정동</span>
        <input type="checkbox" name="location" value="권농동"><span> 권농동</span>
        <input type="checkbox" name="location" value="낙원동"><span> 낙원동</span>
        <input type="checkbox" name="location" value="내수동"><span> 내수동</span>
        <input type="checkbox" name="location" value="내지동"><span> 내지동</span>
        <input type="checkbox" name="location" value="누상동"><span> 누상동</span>
        <input type="checkbox" name="location" value="누하동"><span> 누하동</span>
        <input type="checkbox" name="location" value="당주동"><span> 당주동</span>
        <input type="checkbox" name="location" value="도렴동"><span> 도렴동</span>
        <input type="checkbox" name="location" value="돈의동"><span> 돈의동</span>
        <input type="checkbox" name="location" value="동숭동"><span> 동숭동</span>
        <input type="checkbox" name="location" value="묘동"><span> 묘동</span>
        <input type="checkbox" name="location" value="무악동"><span> 무악동</span>
        <input type="checkbox" name="location" value="봉익동"><span> 봉익동</span>
        <input type="checkbox" name="location" value="부암동"><span> 부암동</span>
        <input type="checkbox" name="location" value="사간동"><span> 사간동</span>
        <input type="checkbox" name="location" value="사직동"><span> 사직동</span>
        <input type="checkbox" name="location" value="삼청동"><span> 삼청동</span>
        <input type="checkbox" name="location" value="서린동"><span> 서린동</span>
        <input type="checkbox" name="location" value="세종로"><span> 세종로</span>
        <input type="checkbox" name="location" value="소격동"><span> 소격동</span>
        <input type="checkbox" name="location" value="송월동"><span> 송월동</span>
        <input type="checkbox" name="location" value="송현동"><span> 송현동</span>
        <input type="checkbox" name="location" value="수송동"><span> 수송동</span>
        <input type="checkbox" name="location" value="숭인동"><span> 숭인동</span>
        <input type="checkbox" name="location" value="신교동"><span> 신교동</span>
        <input type="checkbox" name="location" value="신영동"><span> 신영동</span>
        <input type="checkbox" name="location" value="안국동"><span> 안국동</span>
        <input type="checkbox" name="location" value="연건동"><span> 연건동</span>
        <input type="checkbox" name="location" value="연지동"><span> 연지동</span>
        <input type="checkbox" name="location" value="예지동"><span> 예지동</span>
        <input type="checkbox" name="location" value="옥인동"><span> 옥인동</span>
        <input type="checkbox" name="location" value="와룡동"><span> 와룡동</span>
        <input type="checkbox" name="location" value="운니동"><span> 운니동</span>
        <input type="checkbox" name="location" value="원남동"><span> 원남동</span>
        <input type="checkbox" name="location" value="원서동"><span> 원서동</span>
        <input type="checkbox" name="location" value="이화동"><span> 이화동</span>
        <input type="checkbox" name="location" value="익선동"><span> 익선동</span>
        <input type="checkbox" name="location" value="인사동"><span> 인사동</span>
        <input type="checkbox" name="location" value="인의동"><span> 인의동</span>
        <input type="checkbox" name="location" value="장사동"><span> 장사동</span>
        <input type="checkbox" name="location" value="재동"><span> 재동</span>
        <input type="checkbox" name="location" value="적선동"><span> 적선동</span>
        <input type="checkbox" name="location" value="중학동"><span> 중학동</span>
        <input type="checkbox" name="location" value="창성동"><span> 창성동</span>
        <input type="checkbox" name="location" value="창신동"><span> 창신동</span>
        <input type="checkbox" name="location" value="청운동"><span> 청운동</span>
        <input type="checkbox" name="location" value="청진동"><span> 청진동</span>
        <input type="checkbox" name="location" value="체부동"><span> 체부동</span>
        <input type="checkbox" name="location" value="충신동"><span> 충신동</span>
        <input type="checkbox" name="location" value="통의동"><span> 통의동</span>
        <input type="checkbox" name="location" value="통인동"><span> 통인동</span>
        <input type="checkbox" name="location" value="팔판동"><span> 팔판동</span>
        <input type="checkbox" name="location" value="평동"><span> 평동</span>
        <input type="checkbox" name="location" value="평창동"><span> 평창동</span>
        <input type="checkbox" name="location" value="필운동"><span> 필운동</span>
        <input type="checkbox" name="location" value="행촌동"><span> 행촌동</span>
        <input type="checkbox" name="location" value="혜화동"><span> 혜화동</span>
        <input type="checkbox" name="location" value="홍지동"><span> 홍지동</span>
        <input type="checkbox" name="location" value="홍파동"><span> 홍파동</span>
        <input type="checkbox" name="location" value="화동"><span> 화동</span>
        <input type="checkbox" name="location" value="효자동"><span> 효자동</span>
        <input type="checkbox" name="location" value="효제동"><span> 효제동</span>
        <input type="checkbox" name="location" value="훈정동"><span> 훈정동</span>
       <br><br>
    </div>
    
    <div id="viewJung" class="view jung" style="display:none">
       중구 지역 세부 선택<br><br>
        <input type="checkbox" name="location" value="남창동"><span> 남창동</span>
        <input type="checkbox" name="location" value="남학동"><span> 남학동</span>
        <input type="checkbox" name="location" value="다동"><span> 다동</span>
        <input type="checkbox" name="location" value="다산동"><span> 다산동</span>
        <input type="checkbox" name="location" value="동화동"><span> 동화동</span>
        <input type="checkbox" name="location" value="무교동"><span> 무교동</span>
        <input type="checkbox" name="location" value="무학동"><span> 무학동</span>
        <input type="checkbox" name="location" value="묵정동"><span> 묵정동</span>
        <input type="checkbox" name="location" value="방산동"><span> 방산동</span>
        <input type="checkbox" name="location" value="북창동"><span> 북창동</span>
        <input type="checkbox" name="location" value="신림동"><span> 신림동</span>
        <input type="checkbox" name="location" value="삼각동"><span> 삼각동</span>
        <input type="checkbox" name="location" value="서소문동"><span> 서소문동</span>
        <input type="checkbox" name="location" value="소공동"><span> 소공동</span>
        <input type="checkbox" name="location" value="수표동"><span> 수표동</span>
        <input type="checkbox" name="location" value="수하동"><span> 수하동</span>
        <input type="checkbox" name="location" value="순화동"><span> 순화동</span>
        <input type="checkbox" name="location" value="신당동"><span> 신당동</span>
        <input type="checkbox" name="location" value="쌍림동"><span> 쌍림동</span>
        <input type="checkbox" name="location" value="약수동"><span> 약수동</span>
        <input type="checkbox" name="location" value="예관동"><span> 예관동</span>
        <input type="checkbox" name="location" value="예장동"><span> 예장동</span>
        <input type="checkbox" name="location" value="오장동"><span> 오장동</span>
        <input type="checkbox" name="location" value="입정동"><span> 입정동</span>
        <input type="checkbox" name="location" value="장교동"><span> 장교동</span>
        <input type="checkbox" name="location" value="정동"><span> 정동</span>
        <input type="checkbox" name="location" value="주교동"><span> 주교동</span>
        <input type="checkbox" name="location" value="주자동"><span> 주자동</span>
        <input type="checkbox" name="location" value="중림동"><span> 중림동</span>
        <input type="checkbox" name="location" value="청구동"><span> 청구동</span>
        <input type="checkbox" name="location" value="초동"><span> 초동</span>
        <input type="checkbox" name="location" value="황학동"><span> 황학동</span>
        <input type="checkbox" name="location" value="흥인동"><span> 흥인동</span>
       <br><br>
    </div>
    
    <div id="viewJungnang" class="view jungnang" style="display:none">
       중랑구 지역 세부 선택<br><br>
        <input type="checkbox" name="location" value="망우동"><span> 망우동</span>
        <input type="checkbox" name="location" value="망우본동"><span> 망우본동</span>
        <input type="checkbox" name="location" value="면목동"><span> 면목동</span>
        <input type="checkbox" name="location" value="면목본동"><span> 면목본동</span>
        <input type="checkbox" name="location" value="묵동"><span> 묵동</span>
        <input type="checkbox" name="location" value="상봉동"><span> 상봉동</span>
        <input type="checkbox" name="location" value="신내동"><span> 신내동</span>
        <input type="checkbox" name="location" value="중화동"><span> 중화동</span>
       <br><br>
    </div>
    
    

    
</div>
</form>
<br><br><br>
<hr>

<table class="table table-hover">
<thead>
   <tr>
      <th style="width: 15%">글번호</th>
      <th style="width: 15%">제목</th>
      <th style="width: 20%">카테고리</th>
      <th style="width: 10%">가격</th>
      <th style="width: 15%">작성자</th>
      <th style="width: 20%">주소</th>
      <th style="width: 15%">작성일</th>
   </tr>
</thead>
<tbody>
<c:forEach items="${list }" var="b">
   <tr>
      <td>${b.regNo }</td>
      <td><a href="/trade/view?regNo=${b.regNo }">${b.title }</a></td>
      <td>${b.category }</td>
      <td>${b.price }</td>
      <td>${b.userEmail }</td>
      <td>${b.location }</td>
      <td><fmt:formatDate value="${b.regDate }" pattern="yy-MM-dd HH:mm:ss" /></td>
   </tr>
</c:forEach>
</tbody>
</table>

<button id="btnWrite" class="btn"><strong>글쓰기</strong></button>

<div class="clearfix"></div>

<jsp:include page="/WEB-INF/views/util/paging.jsp" />

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />


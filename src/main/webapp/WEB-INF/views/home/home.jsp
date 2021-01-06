<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<c:import url="/WEB-INF/views/layout/header.jsp" />
    

<style>
.home-hot-section{
	margin-bottom: 60px;
}

    ul,li{list-style:none;}
    .slide{height:720px;overflow:hidden;position:relative;}
    .slide ul{width:calc(100% * 4);display:flex;transition:1s;}
    .slide li{width:calc(100% / 4);height:720px;}
    .slide li:nth-child(1){background-image:url("/resources/images/visual_main5_1.jpg")}
    .slide li:nth-child(2){background-image:url("/resources/images/visual_main5_2.jpg")}
    .slide li:nth-child(3){background-image:url("/resources/images/visual_main5_3.jpg")}
    .slide li:nth-child(4){background-image:url("/resources/images/visual_main5_4.jpg")}
    .slide input{display:none;}
    .slide .bullet{position:absolute;bottom:20px;left:0;right:0;text-align:center;z-index:10;}
    .slide .bullet label{width:10px;height:10px;border-radius:10px;border: none;display:inline-block;background:#fff;font-size:0;transition:0.5s;cursor:pointer;}
    /* 슬라이드 조작 */
    #pos1:checked ~ ul{margin-left:0;}
    #pos2:checked ~ ul{margin-left:-100%;}
    #pos3:checked ~ ul{margin-left:-200%;}
    #pos4:checked ~ ul{margin-left:-300%;}
    /* bullet 조작 */
    #pos1:checked ~ .bullet label:nth-child(1),
    #pos2:checked ~ .bullet label:nth-child(2),
    #pos3:checked ~ .bullet label:nth-child(3),
    #pos4:checked ~ .bullet label:nth-child(4){background:#666;}

    }

@font-face {
  font-family: font777;
  src: url('/resources/font/BMJUA_TTF.TTF');
}
   
@font-face {
  font-family: font888;
  src: url('/resources/font/BMHANNAPRO.TTF');
}

.slide li span {
display: inline-block;
vertical-align:middle;
   float:left;
   width: 300px;
   height: 315px;
   font-size: 14px;
    line-height: 24px;
   color: #fff;
    font-family: 'NotoSans', sans-serif; 
    margin: 10px;
   padding-top: 270px;
   padding-left: 330px;
   
} 

.slide p{
   font-size: 55px;
   text-align: center;
   color: #fff;
   font-family: font888;
   margin-top: 150px;
}	


.slide li{
	background
}

.home-hot-title h3{
	font-family: font777;
}

</style>


<section class = "home-main-section">
	<div class="slide">
    <input type="radio" name="pos" id="pos1" checked>
    <input type="radio" name="pos" id="pos2">
    <input type="radio" name="pos" id="pos3">
    <input type="radio" name="pos" id="pos4">
    <ul>
      <li>
      	<p>이웃주민들과 <br>중고거래를 시작해 보세요!</p>
      
      </li>
      <li></li>
      <li></li>
      <li></li>
    </ul>
    <p class="bullet">
      <label for="pos1">1</label>
      <label for="pos2">2</label>
      <label for="pos3">3</label>
      <label for="pos4">4</label>
    </p>
  </div>
</section>

<section class = "home-hot-section">
	<div class = "home-hot-content">
		<div class = "home-hot-title">
			<h3>중고거래 인기매물</h3>
		</div>
		<c:if test="${empty login }">
		
		</c:if>
	<div class = "cards-wrap">
	<c:forEach items="${list }" var="list">
		<article class = "card-top">
		<div class = "card-photo">
		<c:if test="${empty login }">
		<a href="/member/login"><img src ="/upload/${list.STORED_NAME }" alt="${list.STORED_NAME }" /></a>
		</c:if>
		<c:if test="${! empty login}">
			<a href="/trade/view?regNo=${list.REG_NO }"><img src ="/upload/${list.STORED_NAME }" alt="${list.STORED_NAME }" /></a>
		</c:if>
		</div>
		<div class = "card-desc">
			<h2 class = "card-title">${list.TITLE }</h2>
			<div class = "card-price">
				${list.PRICE }원
			</div>
			<div class = "card-region-name">
				${list.LOCATION }
			</div>
			<div class = "card-counts"> 
				<span>댓글  ${list.CNT }개</span>
			</div>
		</div>
		</article>
</c:forEach>
	</div>
	</div>
</section>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
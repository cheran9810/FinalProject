<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="paging text-center">
	<ul class="pagination">

		<%-- 처음 페이지 버튼 --%>
		<%-- 첫 페이지가 아닐 때 버튼 노출 --%>
		<c:if test="${myCommentPaging.curPage ne 1 }">
			<li><a href="/mypage/mycomment?search=${param.search }"> <span>&larr;</span></a></li>
		</c:if>





		<%-- 이전 페이지 버튼 --%>
		<%-- 첫 페이지면 금지 표시 --%>
		<c:if test="${myCommentPaging.curPage ne 1 }">
			<li><a href="/mypage/mycomment?curPage=${myCommentPaging.curPage-1 }&search=${param.search }" aria-label="Previous"> <span>&laquo;</span></a></li>
		</c:if>
		<c:if test="${myCommentPaging.curPage eq 1 }">
			<li class="disabled"><span>&laquo;</span></li>
		</c:if>

	



		<%-- 페이징 번호 표시 --%>
		<%-- 현재 페이지 번호는 active 클래스 부여 -> 파랑 바탕 버튼 --%>
		<c:forEach begin="${myCommentPaging.startPage }" end="${myCommentPaging.endPage }" var="page"
			varStatus="stat">
			
			<c:if test="${myCommentPaging.curPage eq page }">
				<li class="active"><a href="/mypage/mycomment?curPage=${page }&search=${param.search }">${page }</a></li>
			</c:if>
			
			<c:if test="${myCommentPaging.curPage ne page }">
				<li><a href="/mypage/mycomment?curPage=${page }&search=${param.search }">${page }</a></li>
			</c:if>
			
		</c:forEach>





		<%-- 다음 페이지 버튼 --%>
		<%-- 마지막 페이지면 동작 안함 --%>
		<c:if test="${myCommentPaging.curPage ne myPostPaging.totalPage }">
			<li><a href="/mypage/mycomment?curPage=${myCommentPaging.curPage+1 }&search=${param.search }" aria-label="Next"> <span>&raquo;</span></a></li>
		</c:if>
		<c:if test="${myCommentPaging.curPage eq myPostPaging.totalPage }">
			<li class="disabled"><span>&raquo;</span></li>
		</c:if>
		
		
		
		<%-- 마지막 페이지 버튼 --%>
		<%-- 마지막 페이지가 아닐 때 버튼 노출 --%>
		<c:if test="${myCommentPaging.curPage ne myCommentPaging.totalPage }">
			<li><a href="/mypage/mycomment?curPage=${myCommentPaging.totalPage }&search=${param.search }"> <span>&rarr;</span></a></li>
		</c:if>
		
	</ul>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<form action="/comment/commentUpdate" method="post" >

<input type="hidden"  name = "commentNo"value="${comment.commentNo } "/>
<input type="hidden"  name = "regNo"value=" ${comment.regNo } "/>

<input class="form-control" style="width: 200px;"
				name = "content" id="commentContent" value="${comment.content}">
<button style="float:right;" id="btnCommUp">확인</button>

</form>
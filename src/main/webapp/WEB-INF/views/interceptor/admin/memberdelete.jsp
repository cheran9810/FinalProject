<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		$('.close').click(function() {
			self.opener = self;

			window.close();
		});

		$('.submit').click(function() {

			$.ajax({
				url : '/interceptor/admin/memberdelete',
				data : {
					id : id.value,
					check : check.value
				},
				method : "POST",
				dataType : "json"

			});
			// window.close();
		});
	});
</script>
</head>
<body>
	<div>
		<input type="hidden" name="id" id="id" value="${member.id }" />
	</div>

	<div>
		<label>탈퇴를 원하시면 "탈퇴 완료"를 정확히 작성하세요</label><br> <input type="text"
			name="check" id="check" />
	</div>

	<input type="button" value="확인" class="submit" />
	<input type="button" class="close" value="취소" />
</body>
</html>
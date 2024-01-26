<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 실패시 되돌아 가기</title>
</head>
<body>
	<div>로그인 실패페이지</div>
	<div><button onclick="back()">되돌아가기</button></div>
</body>
</html>
<script>
	function back(){
	/* window.history.back(); */
	location.href = "form_1.jsp";
	}
</script>
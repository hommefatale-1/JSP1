<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="board_add_save.jsp">
		<div>
			<div>제목 : <input name="title" type="text"></div>
			<div>내용 :</div>
			<textarea name="contents" rows="20" cols="100"></textarea>
			<div>
			<input type="submit" value="작성">
			<input type="button" value="취소" onclick="history.back()">
			</div>
		</div>
	</form>
</body>
</html>
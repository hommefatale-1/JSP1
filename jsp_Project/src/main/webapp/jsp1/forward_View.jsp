<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>포워딩된 페이지!!!!!</div>
	<div>아이디 : <%= request.getParameter("id") %></div>
	<div>이름 : <%= request.getParameter("name") %></div>
</body>
</html>

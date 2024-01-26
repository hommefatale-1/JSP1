<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage = "error_View.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포워드 호출</title>
</head>
<body>
	<!-- 포워드페이지만 호출되어 화면에 표시됨 -->
	<%-- --%>
	<% request.setCharacterEncoding("UTF-8"); %>
	<div>gkgkgkgkgkgkgkggkk!~!!!</div>
	<jsp:forward page="forward_View.jsp">
		<jsp:param value="seung-in" name="name"/>
		<jsp:param value="hommefatale01" name="id"/>
	</jsp:forward>
</body>
</html>
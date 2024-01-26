<%@page import="org.apache.catalina.connector.Response"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 아이디 비번 분류</title>
<style>

</style>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	if(id.equals("test") && pwd.equals("1234")){
		response.sendRedirect("login_Success.jsp");
	}else{
		response.sendRedirect("login_Fail.jsp");
	}
	%>
</body>
</html>
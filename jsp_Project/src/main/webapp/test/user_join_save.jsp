<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<!--post 방식의 한글처리  -->
	<% request.setCharacterEncoding("UTF-8");%>
	
	<%
	 String userid = request.getParameter("id");
	 String userpwd = request.getParameter("pwd");	
	 String username = request.getParameter("name");
	 String gender = request.getParameter("gender");
		String sql
		="INSERT INTO TBL_MEMBER1(USERID, PWD, USERNAME) VALUES ('" 
			+ userid +"','" 
			+ userpwd + "','" 
			+ username +"')";
		
		stmt.executeUpdate(sql);
	
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
	String no = request.getParameter("no");
	String sql = "UPDATE STUDENT SET STU_DEPT='컴퓨터정보' WHERE STU_NO='"+ no +"'";
	stmt.executeUpdate(sql);
	%>
</body>
</html>
<script>
	location.href="student.jsp";s
</script>
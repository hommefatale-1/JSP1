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
	String sql="DELETE FROM STUDENT WHERE STU_NO='"+ no + "'";
	stmt.executeUpdate(sql);
	%>
</body>
</html>
<script>
 	location.href="student.jsp";
</script>
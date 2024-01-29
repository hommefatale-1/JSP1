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
	String name = request.getParameter("name");
	String dept = request.getParameter("dept");
	
	String sql="INSERT INTO STUDENT(STU_NO, STU_NAME, STU_DEPT) VALUES('"+no+"','"+name+"','"+dept+"')";
	stmt.executeUpdate(sql);
	%>
	
</body>
</html>
<script>
 location.href="student.jsp";
</script>
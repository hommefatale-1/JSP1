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
	request.setCharacterEncoding("UTF-8");
	String sql="SELECT * FROM STUDENT";
	ResultSet rs = stmt.executeQuery(sql);
	%>
	<form action="student_Add.jsp">
<table border="1">
		<tr>
		<th>학번</th>
		<th>이름</th>
		<th>학과</th>
		</tr>

	<%
	while(rs.next()){
	%>
	<tr>
		<td><%= rs.getString("STU_NO")%></td>
		<td><a href="#" onclick="fnstudent_List('<%= rs.getString("STU_NO")%>')"><%= rs.getString("STU_NAME")%></a></td>
		<td><%= rs.getString("STU_DEPT") %></td>
	</tr>
	<%
	}
	%>
	
</table>
	<input type="submit" value="학생추가" >
	</form>
</body>
</html>
<script>

	function fnstudent_List(STU_NO) {
		location.href="student_List.jsp?no="+STU_NO;
	}
</script>
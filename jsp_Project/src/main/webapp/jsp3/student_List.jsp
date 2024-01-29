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
	String sql="SELECT * FROM STUDENT WHERE STU_NO='"+ no +"'";
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	%>
	<table border="1">
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>학과</th>
		</tr>
	<tr>
		<td><%= rs.getString("STU_NO") %></td>
		<td><%= rs.getString("STU_NAME") %></td>
		<td><%= rs.getString("STU_DEPT") %></td>
	</tr>
	</table>
	<input type="button" onclick="student('u','<%= rs.getString("STU_NO") %>')" value="수정">
	<input type="button" onclick="student('d','<%= rs.getString("STU_NO") %>')" value="삭제">
</body>
</html> 
<script>
	function student(txt,STU_NO) {
		if(txt == 'u'){
		 location.href="student_List_Update.jsp?no="+STU_NO;	
		}else{
			location.href="student_List_Delete.jsp?no="+STU_NO;	
		}
	}
</script>
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

	String sql = "SELECT * FROM STUDENT WHERE STU_NO='" + no + "'";
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	%>
	<form>
		<table>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학과</th>
			</tr>
			<tr>
				<td><%= no %></td>
			</tr>
		</table>
	</form>
</body>
</html>
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
		
		String userid = request.getParameter("id");
		String sql = "SELECT * FROM" 
			+ " TBL_MEMBER1 WHERE USERID = '" + userid + "'";
		ResultSet rs =  stmt.executeQuery(sql);
		rs.next();
		String name =rs.getString("USERNAME");	
	%>
	<div>
		<div>아이디 : <input type="text" name="id" value="<%= userid %>" disabled></div>
		<div>비밀번호 : <input type="password" name="pwd"></div>
		<div>이름 : <input type="text" name="name" value="<%= name %>"></div>
		<div>성별 : 
			<% if(rs.getString("GENDER").equals("남자")){ %> 
				<label><input type="radio" name="gender" value="남자" checked>남자 </label>
				<label><input type="radio" name="gender" value="여자" >여자 </label>	
			<% } else { %>
				<label><input type="radio" name="gender" value="남자">남자 </label>
				<label><input type="radio" name="gender" value="여자" checked>여자 </label>
			<% } %>
		</div>
		<input  type="submit" value="수정하기">
		
	</div>
	
</body>
</html>
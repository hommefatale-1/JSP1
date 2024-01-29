<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 확인</title>
</head>
<body>
	<form name="check">
	<%@ include file="dbconn.jsp" %>
	<%
	 	String userId = request.getParameter("userId");
		String sql = "SELECT *FROM TBL_MEMBER1"
				+ " WHERE USERID = '" + userId +"'";
		ResultSet rs = stmt.executeQuery(sql);
		%>
		<% 
			if(rs.next()){
				out.println("중복된 아이디가 있습니다");
				out.println("<input name='userID'>");
				out.println("<input type='button' value='중복체크'" + "onclick='idCheck()'>");
			}else{
				out.println("사용가능한 아이디 입니다.");
				%>	
				<input type="button" value="사용하기" onclick="popClose('<%= userId %>')">
				<% 
			}
		%>
	
	</form>
</body>
</html>
<script>
	function popClose(userId) {
		opener.document.join.userId.value = userId;
		window.close();
	}
	
</script>
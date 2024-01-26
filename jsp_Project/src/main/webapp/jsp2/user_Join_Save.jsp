<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div {
		margin : 5px 0px;
	}
	.txt_input{
		width: 80px;
		display : inline-block;
	}
	
	.select_input{
		width: 73px;
		display : inline-block;
	}
	
</style>
</head>
<body>
<!--입력받은 3개의 데이터를 DB에 저장  -->
	<%@ include file="dbconn.jsp" %>
	<!--post 방식의 한글처리  -->
	<% request.setCharacterEncoding("UTF-8");%>

	<%
		/*파라미터 정보 가져오기  */
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		/*oracle정보 호촐하여 저장  */
		String sql
		="INSERT INTO TBL_MEMBER1(USERID, PWD, USERNAME, GENDER) VALUES ('" 
			+ id +"','" 
			+ pwd + "','" 
			+ name +"','" 
			+ gender +"')";
		
		stmt.executeUpdate(sql);
	
		%>
	
</body>
</html>
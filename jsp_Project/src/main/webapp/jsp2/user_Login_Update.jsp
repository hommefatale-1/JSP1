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
	<%@ include file="dbconn.jsp"%>
	<%
		
		String id = request.getParameter("id");
		String sql = "SELECT * FROM" 
			+ " TBL_MEMBER1 WHERE USERID = '" + id + "'";
		ResultSet rs =  stmt.executeQuery(sql);
		/* 가져온값을 받는다  */
		rs.next();
		/*rs.getString("name")DB에서 가져옴  */
		String name =rs.getString("USERNAME");
		
	
	%>
	<h1>회원정보수정</h1>
	<form action="user_Login_Update_Result.jsp" method="post">
		<input type="text" name="id" value="<%= id %>" hidden> </div>
		<div> <span class="txt_input">아이디 : </span><input type="text" name= "id" value="<%= id %>" disabled> </div>
		<div> <span class="txt_input">패스워드 : </span><input type="text" name="pwd" > </div>
		<div> <span class="txt_input">이름 : </span><input type="text" name="name" value="<%= name %>" > </div>
		<div>
			<span class="select_input">성 별 :</span>
				<% if(rs.getString("GENDER").equals("남성")){ %> 
				<label><input type="radio" name="gender" value="남성" checked>남성 </label>
				<label><input type="radio" name="gender" value="여성" >여성 </label>	
			<% } else { %>
				<label><input type="radio" name="gender" value="남성">남성 </label>
				<label><input type="radio" name="gender" value="여성" checked>여성 </label>
			<% } %>
		</div>
		<div> <span class="txt_input"></span><input type="submit" value="회원정보 수정"> </div>
	</form>
</body>
</html>
<script>
	
</script>
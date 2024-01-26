<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<% 
	/* 폼에 선언된 파라미터 정보 가져오기 */
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	/* DB 정보에 아이디와 비번을 비교하여 spl저장 */
	String sql = "SELECT * FROM "
			+"TBL_MEMBER1 WHERE USERID ='" + id
			+ "' AND PWD = '" + pwd +"'";
	/*  */
	ResultSet rs = stmt.executeQuery(sql);
	
	if(rs.next()){
		out.println("로그인 성공");
	%>	
	<form name="userInfo" action="user_update.jsp" method="post"> 
			<div>
				<!--id(PK)값을  user_Login_Updete.jsp 넘겨줌 회원수정을 위해서 -->
				<label><input type="text" name="id" value="<%= id%>" hidden ></label>
				<label><input type="submit" value="회원정보 수정" onclick="bnt('u')" ></label>
			
			</div>
	 </form>

	<%
	}else{
		out.println("로그인 실패");
	}
	%>
</body>
</html>
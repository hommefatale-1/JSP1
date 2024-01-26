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
		request.setCharacterEncoding("UTF-8"); 
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		/* 아이디 비번 로그인 확인  */
		/* String sql = "SELECT * FROM "
				+"TBL_MEMBER1 WHERE USERID ='" + id
				+ "' AND PWD = '" + pwd +"'";
 */
		/*sql문 준비  */		
 		String sql = "SELECT * FROM "
				+"TBL_MEMBER1 WHERE USERID ='" + id + "'" ;
		/*ResultSet 결과물을 가져오는 인터페이스 = select문 사용할 경우  executeQuery */
		ResultSet rs = stmt.executeQuery(sql);
	
		
		/* if(rs.next()){
			out.println("로그인 성공");
		}else{
			out.println("로그인 실패");
		} */
		if(rs.next()){
		if(rs.getString("PWD").equals(pwd)){
			out.println(rs.getString("USERNAME") + "님 환영합니다");			
	%>
			<form action="membership_Registration_Modify.jsp" method="post">
			<div>
			<label><input type="text" name="id" value="<%= id%>" hidden></label>
			<label><input type="submit" value="회원정보 수정"></label>
			</div>
			</form>
	<%
		}else{
			out.println("패스워드를 확인하세요");
		 }
		}else{
		out.println("없는 아이디!");
		 }
	%>
		
</body>
</html>
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
		/*파라미터 정보 가져오기  */
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String userName = request.getParameter("name");
		String gender = request.getParameter("gender");
		/* 패스워드가 빈값일 경우 */
		String pwdStr = "";
		if(pwd != "" && pwd != null){
			pwdStr = "PWD = '" + pwd + "',";
		} else {
			pwdStr = "";
		}
		/*로그인하고 회원정보를 데이터베이스에 수정 */
		String sql
			= "UPDATE TBL_MEMBER1 SET "
					+ pwdStr
					+ "PWD = '" + pwd + "',"
					+ "USERNAME = '" + userName +"', "
					+ "GENDER = '" + gender +"' "
					+ "WHERE USERID = '" + userId + "'";
					
		stmt.executeUpdate(sql);
		out.println("수정되었습니다.!");
	%>
	
</body>
</html>
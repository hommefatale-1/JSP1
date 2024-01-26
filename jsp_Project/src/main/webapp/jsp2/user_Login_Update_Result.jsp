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
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String pwd1 = request.getParameter("pwd1");
		String name = request.getParameter("name");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String gender = request.getParameter("gender");
		String comment = request.getParameter("comment");
		String phone = phone1 + phone2 + phone3;
		
		/* 취미가 빈 값일 경우 */
		String[] hobby = {};
		if(request.getParameterValues("hobby") != null){
			hobby = request.getParameterValues("hobby");
		}		
		/* 패스워드가 빈값일 경우 */
		String pwdStr = "";
		if(pwd != "" && pwd != null){
			pwdStr = "PWD = '" + pwd + "',";
		} else {
			pwdStr = "";
		}
		 /*로그인 데이터베이스 수정 */
		stmt.executeUpdate(
			"UPDATE TBL_MEMBER1 SET "
			+ pwdStr
			+ "USERNAME = '" + name + "',"
			+ "PHONE = '" + phone + "',"
			+ "GENDER = '" + gender + "',"
			+ "HOBBY1 = '" + (hobby.length>0 ? hobby[0] : "") + "',"
			+ "HOBBY2 = '" + (hobby.length>1 ? hobby[1] : "") + "',"
			+ "HOBBY3 = '" + (hobby.length>2 ? hobby[2] : "") + "',"
			+ "CMT = '" + comment+ "' "
			+ "WHERE USERID = '" + id + "'"
		); 

		out.println("수정되었습니다.!");
	%>
	
</body>
</html>
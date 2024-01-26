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
		/*파라미터 정보 가져오기  */
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String pwd2 = request.getParameter("pwd2");
		String name = request.getParameter("name");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String gender = request.getParameter("gender");
		
		String[] hobby = {};
		if(request.getParameterValues("hobby") != null){
			hobby = request.getParameterValues("hobby");
		}		
		String comment = request.getParameter("comment");
		String phone = phone1 + phone2 + phone3;
		
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
		
	%>
	<!--로그인 수정 페이지 출력화면  -->	
	<div>아이디 : <%= id %></div>

	<div>비밀번호 : <%= pwd %></div>

	<div>비밀번호 확인 : <%= pwd2 %></div>

	<div>이름 : <%= name %></div>

	<div>연락처 : <%= phone1 %>-<%= phone2 %>-<%= phone3 %></div>

	<div>성별 : <%= gender %></div>

	<div>취미 : 

		<% for(int i=0;i<hobby.length;i++){

			out.print(hobby[i] + " ");

		}%>

	</div>

	<div>가입인사 : <%= comment %></div>
	
	
</body>
</html>
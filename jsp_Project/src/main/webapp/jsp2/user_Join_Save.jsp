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
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("userId");
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
	

		/*oracle정보 호촐하여 저장  */
		stmt.executeUpdate("INSERT INTO TBL_MEMBER1 VALUES('" + id 
		+ "','" 
		+ pwd + "','" 
		+ name + "','" 
		+ phone + "','"  
		+ gender +  "','" 
		+ (hobby.length>0 ? hobby[0] : "") + "','" 
		+ (hobby.length>1 ? hobby[1] : "") + "','" 
		+ (hobby.length>2 ? hobby[2] : "") + "','" 
		+ comment + "')");
		%>
	
</body>
</html>
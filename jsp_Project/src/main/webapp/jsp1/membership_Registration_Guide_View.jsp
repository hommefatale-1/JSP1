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
	<!--post 방식의 한글처리  -->
	<% request.setCharacterEncoding("UTF-8");%>

	<%
		/*파라미터 정보 가져오기  */
		String id = request.getParameter("id");

		String pwd = request.getParameter("pwd");

		String pwd1 = request.getParameter("pwd1");

		String name = request.getParameter("name");

		String phone1 = request.getParameter("phone1");

		String phone2 = request.getParameter("phone2");

		String phone3 = request.getParameter("phone3");

		String gender = request.getParameter("gender");
		/* hobby가 아무것도 체크안할경우 빈값이다  */
		String[] hobby = {};
			if(hobby.length > 0){	
				hobby = request.getParameterValues("hobby");
			}
		String comment = request.getParameter("comment");
		
		

		stmt.executeUpdate("INSERT INTO TBL_MEMBER1 VALUES('" + id 
			+ "','" 
			+ pwd + "','" 
			+ name + "','" 
			+ phone1 + "-" 
			+ phone2 + "-" 
			+ phone3 + "','" 
			+ gender +  "','" 
			+ (hobby.length>0 ? hobby[0] : "") + "','" 
			+ (hobby.length>1 ? hobby[1] : "") + "','" 
			+ (hobby.length>2 ? hobby[2] : "") + "','" 
			+ comment + "')");

	%>

	<div>아이디 : <%= id %></div>

	<div>비밀번호 : <%= pwd %></div>

	<div>비밀번호 확인 : <%= pwd1 %></div>

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
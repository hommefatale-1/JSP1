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
	<%
		if(request.isRequestedSessionIdValid()){
			/* 세션 하니씩 제거 */
			/* session.removeAttribute("userID");
			session.removeAttribute("userName");
			session.removeAttribute("status"); */
			/* 세션 한번에 제거 */
			session.invalidate();
		}else{
			out.println("세션없다");
		}
	%>
	<!--아이디 패스워드 입력받아서 버튼 클릭시 user_Login_View.jsp 이동 -->
	<form action="user_Login_View.jsp" method="get">
		<div>
			<label>아이디 : <input type="text" name="id"></label>
		</div>
		<div>
			<label>패스워드 : <input type="password" name="pwd"></label>
		</div>
		<div><input type="submit" value="로그인"></div>
	</form>	
</body>
</html>

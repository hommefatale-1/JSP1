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
<!--아이디, 패스워드, 이름 입력후 가입버튼 클릭시 user_Join_Save.jsp 이동  -->
<form action="user_Join_Save.jsp" method="post">
	
		<div> <span class="txt_input">아이디 : </span><input type="text" name="id" > </div>
		<div> <span class="txt_input">패스워드 : </span><input type="text" name="pwd" > </div>
		<div> <span class="txt_input">이름 : </span><input type="text" name="name" > </div>
		<div>
			<label><span class="select_input">성 별 :</span> </label>
				<label><input type="radio" name="gender" value="남성" checked>남성 </label> 
				<label><input type="radio" name="gender" value="여성">여성 </label>
		</div>
		<div><input id="bnt" type="submit" onclick="sign_Up()" value="가입하기"></div>
	
</from>

</body>
</html>

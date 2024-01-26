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
	<form action="user_Join_Save.jsp" name="join" >
		<div>
		 <span class="txt_input">아이디 : </span><input type="text" name="userId" >
		 <input type="button" value="중복확인" onclick="idCheck()" > 
		</div>
		<div> <span class="txt_input">비밀번호 : </span><input type="text" name="pwd" > </div>
		<div><span class="txt_input">비밀확인 : </span><input type="password" name="pwd1"></div>
		<div> <span class="txt_input">이름 : </span><input type="text" name="name" > </div>
		<div>
			<span class="select_input">연락처 :</span> <select name="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="019">019</option>
			</select> - <input type="text" maxlength="4" size="4" name="phone2"> -
			<input type="text" maxlength="4" size="4" name="phone3">
		</div>
		<div>
			<label><span class="select_input">성 별 :</span> </label>
				<label><input type="radio" name="gender" value="남성" checked>남성 </label> 
				<label><input type="radio" name="gender" value="여성">여성 </label>
		</div>
		<div>
			<span class="select_input">취 미 :</span> <label><input
				type="checkbox" name="hobby" value="독서" checked>독서</label> <label><input
				type="checkbox" name="hobby" value="운동"> 운동</label> <label><input
				type="checkbox" name="hobby" value="영화"> 영화</label>
		</div>
		<div>
			<textarea name="comment" cols="100" placeholder="가입인사를 입력해주세요.">
            </textarea>
		</div>
		<div><input id="bnt" type="submit" onclick="sign_Up()" value="가입하기"></div>	
</from>
</body>
</html>
<script>
	 var join = document.join;
	function idCheck() {
		pop = window.open("user_idCheck.jsp?userId=" + join.userId.value, "join", "width=300, height=300");
	}
</script>

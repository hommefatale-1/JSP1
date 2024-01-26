<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	<%--action:다른페이지 불러오기 --%>
	<form name ="login" action="form_View.jsp" method="post">
	<%--아이디 입력받기 --%>
	<div>아이디 : <input type="text" name="id" ></div>
	<%--패시워드 입력받기 --%>
	<div>패스워드 : <input type="password" name="pwd"></div>
	<div><input type="button" onclick="ckeck()" value="로그인"></div>
	</form>
</body>
</html>

<script>
function ckeck() {
	/*form태그에 login정보를 login에 저장  */
	var login = document.login;
	if(login.id.value == ""){
		alert("아이디 입력해 주세요");
		/*아이디란정보 입력란으로 자동으로 이동*/
		login.id.focus();
		return;
	}else if(login.pwd.value == ""){
		alert("비번을 입력해 주세요");
		return;
	}else{
		login.submit();
	}
}
</script>
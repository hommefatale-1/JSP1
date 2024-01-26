<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>회원가입</title>
<style>
div {
	margin: 5px 0px;
}

.txt_input {
	width: 90px;
	display: inline-block;
}

.select_input {
	width: 73px;
	display: inline-block;
}
</style>
</head>
<body>
	<h3>회원가입</h3>
	<form action="membership_Registration_Guide_View.jsp" name="join"
		method="post">
		<div>
			<span class="txt_input">아이디 : </span><input type="text" name="id"  placeholder="영어+숫자만 입력">
			<input type="button" value="중복검사">
		</div>
		<div>
			<span class="txt_input">비밀번호 : </span><input type="password" name="pwd">
		</div>
		<div>
			<span class="txt_input">비밀확인 : </span><input type="password" name="pwd1">
		</div>
		<div>
			<span class="txt_input">이 름 : </span><input type="text" name="name">
		</div>

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
			<span class="select_input">성 별 :</span> <label><input
				type="radio" name="gender" value="남성" checked>남성 </label> <label><input
				type="radio" name="gender" value="여성">여성 </label>
		</div>
		<div>
			<span class="select_input">취 미 :</span> <label><input
				type="checkbox" name="hobby" value="독서" checked>독서</label> <label><input
				type="checkbox" name="hobby" value="운동"> 운동</label> <label><input
				type="checkbox" name="hobby" value="영화"> 영화</label>
		</div>
		<div>
			<textarea name="comment" cols="30" placeholder="가입인사를 입력해주세요.">
            </textarea>
		</div>
		<div>
			<input id="bnt" type="button" onclick="sign_Up()" value="가입하기">
			<input type="reset" name="" value="다시쓰기">
		</div>
	</form>
</body>
</html>
<script>
	function sign_Up() {
		/* form의 name join을 호출 */
		var join = document.join;
		const regType = /^[a-zA-Z0-9]*$/;
		/* join객체내 name=id에 값을 호출 */
		let data = join.id.value;
		if (!regType.test(data)) {
			alert("아이디가 조건에 맞지 않습니다");
			return;
		}
		if(data.length <5){
			alert("아이디 5글자 이상 입력해주세요");
			return;
		}
		if(join.pwd.value != join.pwd1.value){
			alert("비밀번호가 다릅니다 같게 해주세요");
			return;
		}
		join.submit();
	}
	/*아이디 한글사용xaksemfrl*/
</script>
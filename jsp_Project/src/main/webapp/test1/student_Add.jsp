<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="student_List_Add.jsp" name="join">
		<input type="text" name="no">
		<input type="text" name="name">
		<input type="text" name="dept">
		<input type="button" onclick="fnstudent_add()" value="추가하기">
	</form>
</body>
</html>
<script>
	function fnstudent_add() {
		var join = document.join;
		if(join.no.value.length !=  8){
			alert("8자리 입력해주세요");
		}else if(join.name.value == ""){
			alert("이름을 입력해 주세요");
		}else if(join.dept.value == ""){
			alert("학과를 입력해 주세요");
		}else{
			join.submit();
		}
	}
</script>
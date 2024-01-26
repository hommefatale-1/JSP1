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
	<%@ include file="dbconn.jsp" %>
	<% 
	/* 폼에 선언된 파라미터 정보 가져오기 */
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	/* DB 정보에 아이디와 비번을 비교하여 spl저장 */
	String sql = "SELECT * FROM "
			+"TBL_MEMBER1 WHERE USERID ='" + id
			+ "' AND PWD = '" + pwd +"'";
	ResultSet rs = stmt.executeQuery(sql);
	/* 로그인 성공시 */
	if(rs.next()){
		if(rs.getInt("CNT") >= 4){
			out.println("비밀번호 5번 이상 실패! 관리자 문의 하셈");
		}else{
			out.println("로그인 성공");
		sql = "UPDATE TBL_MEMBER1 SET" 
					+ " CNT = 0 "
					+ "WHERE USERID = '" + id + "'";
		stmt.executeQuery(sql);
		%>
	<form name="userInfo" action="user_Login_Update.jsp" method="post"> 
			<div>
				<!--id(PK)값을  user_Login_Updete.jsp 넘겨줌 회원수정을 위해서 -->
				<label><input type="text" name="id" value="<%= id%>" hidden ></label>
				<label><input type="submit" value="게시판" formaction="board_list.jsp" ></label>
				<label><input type="submit" value="회원정보 수정" onclick="bnt('u')" ></label>
				<label><input type="submit" value="회원정보 삭제" onclick="bnt('d')" ></label>
			</div>
	</form>
		<% 	
		}
		/* 로그인 실패시 */
		}else{
		String idSql = "SELECT * FROM TBL_MEMBER1" 
		+ " WHERE USERID ='" + id+ "'";
		ResultSet rsId = stmt.executeQuery(idSql);
		if(rsId.next()){
			//1. 아이디는 있는데 패스워드가 다를 경우
			int cnt = rsId.getInt("CNT");
			if((cnt+1) >= 5){
				out.println("5번 틀리셨습니다 관리자에게 문의 바랍니다");
			}else{
				out.println((cnt+1) + "번 이상 실패!");
				stmt.executeUpdate(
				"UPDATE TBL_MEMBER1 SET "
				+ "CNT = CNT+1 "
				+ "WHERE USERID = '" + id + "'"
				);
			}
		}else{
			//2.아이디가 없는경우
			out.println("아이디를 확인해주세요");
		}
		%>
			<!-- 되돌아가기 -->
			<input type="submit" value="되돌아가기" onclick="bnt_back('<%= id %>')">
		 	<input type="submit" value="되돌아가기" onclick="history.back()"> 
		<%	
		}
		%>
</body>
</html>
<script>
	/*  */
	 function bnt(txt) {
		var userInfo = document.userInfo;
		if(txt == 'u'){
			userInfo.action = "user_Login_Update.jsp";
		}else{
			userInfo.action = "user_Login_Delete.jsp";
		}
	}
	/* 되돌아가기 기능 */
	function bnt_back(id){
		location.href="user_Login.jsp?id=" + id;
	}  
</script>
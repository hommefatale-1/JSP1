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
	<%@ include file="dbconn.jsp"%>
	<%
		/*파라미터 정보 가져오기  */
		request.setCharacterEncoding("UTF-8");
	
		String userId = request.getParameter("id");
		
		/*로그인하고 회원정보를 데이터베이스에 삭제 */
		String sql
			= "DELETE FROM TBL_MEMBER1  "			
					+ "WHERE USERID = '" + userId + "'";
		
					
		int cnt = stmt.executeUpdate(sql);
		if(cnt > 0 ){
			out.println("삭제되었습니다");			
		}else{
			out.println("다시 시도해 주세요");
		}
		out.println("삭제되었습니다.!" + cnt);
	%>
	
</body>
</html>
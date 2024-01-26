<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	
	<%
		request.setCharacterEncoding("UTF-8");
		String boardNo= request.getParameter("BOARDNO");
		String sql = "SELECT * FROM" 
				+ " TBL_BOARD WHERE BOARDNO = '" + boardNo + "'";
		ResultSet rs =  stmt.executeQuery(sql);
		rs.next();
	%>
	<form action="board_list_update_save.jsp" method="post">
	<div>
			<input type="text" name="boardNo" value="<%= boardNo%>" hidden >
			<div>제목 : <input name="title" type="text" value="<%= rs.getString("title")%>"></div>
			<div>내용 :</div>
			<textarea name="contents" rows="20" cols="100"><%= rs.getString("contents")%></textarea>
			<div>
			<input type="submit" value="수정하기">
			<input type="button" value="되돌아가기" onclick="history.back()">
			</div>
	</div>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, tr, th {
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse: collapse;
		text-align: center;
	}
	th {
		background-color:skyblue;
		width: 25%;
	}
	table{
	
	}
	td{
		width: 75%;
	}
</style>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
	
	
		String boardNo= request.getParameter("BOARDNO");
		/* 조회수 증가 */
		stmt.executeUpdate(
				"UPDATE TBL_BOARD SET"
				+ " HIT = HIT+1"
				+ " WHERE BOARDNO = " + boardNo
				);
		String sql = "SELECT BOARDNO, TITLE, B.USERID, USERNAME, HIT,CONTENTS, " 
			+ "TO_CHAR(CDATETIME, 'YY/MM/DD HH24:MI') AS CDATETIME, " 
			+ "TO_CHAR(UDATETIME, 'YY/MM/DD HH24:MI') AS UDATETIME " 
			+ "FROM TBL_BOARD B "
			+ "INNER JOIN TBL_MEMBER1 M ON B.USERID = M.USERID WHERE BOARDNO = '"+ boardNo +"'";
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
	%>
	
	<table>
		<tr>
			<th>제목</th>
			<td><%= rs.getString("TITLE") %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%= rs.getString("USERNAME") %></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%= rs.getString("HIT") %></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td> <%= rs.getString("UDATETIME") %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%= rs.getString("CONTENTS") %></td>
		</tr>
	</table>
	<!--게시글 삭제  -->
	<input type="button" onclick="board_delet('<%= rs.getString("boardNo") %>')" onclick="" value="삭제">
</body>
</html>
<script>
	function board_delet(boardNo) {
		if(confirm("삭제합니까?")){
			location.href="board_list_delet.jsp?BOARDNO=" + boardNo;
		}
		
	}
</script>
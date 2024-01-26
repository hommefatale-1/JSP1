<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, tr, td, th {
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse: collapse;
		text-align: center;
	}
	th {

		background-color:skyblue;
	}
	a {
		color : black;
		font-weight : bold;
		text-decoration : none;
	}
	a:visited {
		color : black;
	}

	a:hover {

		color : blue;

	}	
</style>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
		String sql = "SELECT BOARDNO, TITLE, B.USERID, USERNAME, HIT," 
						+ "TO_CHAR(CDATETIME, 'YY/MM/DD HH24:MI') AS CDATETIME, " 
						+ "TO_CHAR(UDATETIME, 'YY/MM/DD HH24:MI') AS UDATETIME " 
						+ "FROM TBL_BOARD B "
						+ "INNER JOIN TBL_MEMBER1 M ON B.USERID = M.USERID";
		ResultSet rs = stmt.executeQuery(sql);
		
	%>
	<form action="board_view.jsp" method="post">
	<table>
		<tr>
			<th style="width:10%;">번호</th>
			<th style="width:40%;">제목</th>
			<th style="width:10%;">작성자</th>
			<th style="width:10%;">조회수</th>
			<th style="width:15%;">작성날짜</th>
			<th style="width:15%;">수정날짜</th>
		</tr>
	<%
		while(rs.next()){
	%>	
	
		<tr>
			<td><%= rs.getString("BOARDNO") %></td>
			<td><a href="#" onclick="boardview('<%= rs.getString("BOARDNO") %>')"><%= rs.getString("TITLE") %></a></td>
			<td><%= rs.getString("USERNAME") %></td>
			<td><%= rs.getString("HIT") %></td>
			<td><%= rs.getString("CDATETIME") %></td>
			<td><%= rs.getString("UDATETIME") %></td>
		</tr>

	<%
		}
	%>	
	</table>
	</form>	
</body>
</html>
<script>
function boardview(BOARDNO){
	location.href="board_view.jsp?BOARDNO=" + BOARDNO;
	
}
</script>

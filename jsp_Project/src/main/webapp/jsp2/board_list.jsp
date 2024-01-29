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
	String sql = "SELECT B.BOARDNO, TITLE, B.USERID, USERNAME, HIT," 
			+ "TO_CHAR(B.CDATETIME, 'YY/MM/DD HH24:MI') AS CDATETIME, " 
			+ "TO_CHAR(B.UDATETIME, 'YY/MM/DD HH24:MI') AS UDATETIME, "
			+ "C.CNT "
			+ "FROM TBL_BOARD B "
			+ "INNER JOIN TBL_MEMBER1 M ON B.USERID = M.USERID "
			+ "LEFT JOIN ( "
			+ "SELECT B.BOARDNO, COUNT(*) AS CNT "
			+ "FROM TBL_BOARD B "
			+ "INNER JOIN TBL_COMMENT C ON B.BOARDNO = C.BOARDNO "
			+ "GROUP BY B.BOARDNO "
			+ ") C ON B.BOARDNO = C.BOARDNO "
		;

		String keyword = request.getParameter("keyword");
		if(keyword != null){
		 sql += " WHERE TITLE LIKE '%" + keyword + "%'";
		}
		sql += " ORDER BY CDATETIME DESC";
		ResultSet rs = stmt.executeQuery(sql);
		
	%>
	<form name="board_list" method="get">
	<table>
		<div>
			검색어:<input type="text" name="keyword" value="<%= keyword%>">
			<input type="button" value="검색하기" onclick="search()">
		</div>
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
			<td><a href="#" onclick="boardview('<%= rs.getString("BOARDNO") %>')">
					<%= rs.getString("TITLE") %>
					<% if(rs.getString("CNT") != null){
						out.println("<span>(" + rs.getString("CNT") + ")</sapn>");
					}%> 
				</a>
			</td>
			<td><%= rs.getString("USERNAME") %></td>
			<td><%= rs.getString("CDATETIME") %></td>
			<td><%= rs.getString("UDATETIME") %></td>
		</tr>

	<%
		}
	%>	
	</table>
	<div><input type="submit" value="글쓰기" formaction="board_add.jsp" ></div>
	</form>	
</body>
</html>
<script>
	function boardview(BOARDNO){
		location.href="board_view.jsp?BOARDNO=" + BOARDNO;
	}
	var board = document.board_list;
	function search() {
		location.href="board_list.jsp?keyword=" + board.keyword.value;
	}
</script>

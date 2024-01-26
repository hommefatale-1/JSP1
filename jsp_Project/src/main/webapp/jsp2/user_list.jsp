<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, tr, td {
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse: collapse;
		text-align: center;
	}
	th {
		background-color: aqua;
	}
	
</style>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
		out.println(session.getAttribute("userId"));
	
		String sql = "SELECT * FROM TBL_MEMBER1";	
		String word = request.getParameter("keyword");
		String keyword = word != null ? word : "";
		
		if(keyword != null){
		 sql += " WHERE USERNAME LIKE '%" +keyword + "%'"
				+ " OR USERID LIKE '%" + keyword + "%'";
		 }
		ResultSet rs = stmt.executeQuery(sql);
		
	%>
	
	<form name="user_list">
	<div>
		검색어:<input type="text" name="keyword" value="<%= keyword%>">
		<input type="button" value="검색하기" onclick="search()">
	</div>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>핸드폰번호</th>
			<th>성별</th>
			<th>취미1</th>
			<th>취미2</th>
			<th>취미3</th>
			<th>수정</th>
			<th>삭제</th>
			<th>비밀번호 초기화</th>
		</tr>
	<%
		while(rs.next()){
	%>	
		<tr>
			<td><%= rs.getString("USERID") %></td>
			<td><%= rs.getString("USERNAME") %></td>
			<td><%= rs.getString("PHONE") %></td>
			<td><%= rs.getString("GENDER") %></td>
			<td><%= rs.getString("HOBBY1") %></td>
			<td><%= rs.getString("HOBBY2") %></td>
			<td><%= rs.getString("HOBBY3") %></td>
			<td><input type="button" onclick="userUpdate('<%= rs.getString("USERID") %>')" value="수정"></td>
			<td><input type="button" onclick="userDelete('<%= rs.getString("USERID") %>')" value="삭제"></td>
			<td>
			<%
			if(rs.getInt("CNT") >= 4){
				%>	
			<input type="button" onclick="userinit('<%= rs.getString("USERID") %>')" value="초기화">
			<%
			}
			%>
			</td>
		</tr>	
	<%
		}
	%>	
	</table>
	</form>
</body>
</html>
<script>
	function userUpdate(id){
		location.href="user_Login_Update.jsp?id=" + id;
	}
	function userDelete(id){
		location.href="user_Login_Delete.jsp?id=" + id;
	}
	function userinit(id){
		location.href="user_login_init.jsp?id=" + id;
	}
	var user = document.user_list;
	function search() {
		location.href="user_list.jsp?keyword=" + user.keyword.value;
	}
</script>

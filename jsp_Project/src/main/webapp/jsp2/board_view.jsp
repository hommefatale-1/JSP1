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
	<form name="boardView"> 
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
		<%
		String sessionId =	"";
		String sessionStatus =  "";
		String userId = rs.getString("USERId");
		if(request.isRequestedSessionIdValid()){
			sessionId = (String)session.getAttribute("userId");
			sessionStatus = (String)session.getAttribute("status");
		}
		if(userId.equals(sessionId) || "A".equals(sessionStatus) ){
		%>
		<input type="button" onclick="board_delet('<%= boardNo%>')" value="삭제">
		<input type="button" onclick="board_Update('<%= boardNo%>')" value="수정">
		<%
		}
		%>	
		<hr>
		<%
		 rs = stmt.executeQuery(
			" SELECT * FROM TBL_COMMENT "
			+ "WHERE BOARDNO ="+boardNo
		);
		while(rs.next()){
			out.print("<div style='margin-bottom:5px;'>");
			out.print("<span style='font-weight:bold;'>" + rs.getString("USERID") + " : </span>");
			out.print("<span style='display : inline-block; width : 400px;'>" + "댓글: "+ rs.getString("CMT") + "</span>");
			out.print("<span>" + rs.getString("UDATETIME") + "</span>");
			out.print("<a href='#' onclick='cmtDelete(" + rs.getString("COMMENTNO") +"," + boardNo + ")'>✖ </a>");			
			out.print("</div>");
		%>
		<!-- 댓글 수정하기 -->
		<a href='#' onclick='cmtModify('<%= rs.getString("CMT") %>')">🆖 </a>")
		<%
		out.print("</div>");
		}
		%>
		<br>
		<div><textarea name="comment" rows="5" cols="50"></textarea></div>
		<div>
		<!-- 수정 버튼 추가 및 이름 부여 -->
			<input name="insertBtn" type="button" onclick="fnComment(<%= boardNo %>, '<%= sessionId %>')" value="댓글달기">
			<input name="updateBtn" style="display:none;" type="button" onclick="fnComment(<%= boardNo %>, '<%= sessionId %>')" value="수정하기"> 
		</div>
	
		
	</form>
</body>
</html>
<script>
	function board_delet(boardNo) {
		if(confirm("삭제합니까?")){
			location.href="board_list_delet.jsp?BOARDNO=" + boardNo;
		}	
	}
	function board_Update(boardNo) {
		if(confirm("수정하겠습니까?")){
			location.href="board_list_update.jsp?BOARDNO=" + boardNo;
		}	
	}
	function fncomment(boardNo, userId) {
		var cmt = document.boardView.comment.value;
		if(cmt == "" || cmt == undefined){
			alert("댓글을 입력해 주세요!");
			return;
		}if(userId == "" || userId == undefined || userId== "null"){
			alert("로그인 후 입력해주세요");
			location.href="user_Login.jsp";
			return;
		}
		location.href="board_comment.jsp?boardNo="+boardNo+"&userId="+userId+"&comment="+cmt;
	}
	function cmtDelete(commentNo, boardNo) {
		if(!confirm("삭제하겠습니까?")){
			return;	
		}
		location.href="comment_delete.jsp?commentNo="+ commentNo +"&boardNo="+ boardNo;
	}
	function cmtModify(commentNo) {
		var form = document.boardView;
		form.comment.value = domment;
		form.insertBtn.style.display="nene";
		form.updateBtn.style.display="inline-block"

	}
</script>
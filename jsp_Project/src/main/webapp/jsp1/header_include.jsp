<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage = "error_View.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더파일 가져오기</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div>메인페이지!!</div>
	
		<jsp:include page="header.jsp"></jsp:include>

</body>
</html>
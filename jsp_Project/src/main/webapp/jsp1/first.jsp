<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첫페이지시작</title>
</head>

<body>

	<h2 style="color: red">JSP START</h2>
	
	<%--(선언문, declation)변수선언 및 메소드 작성--%>
	<%!
	int cn = 1;
	int sum(int x, int y){
		return x + y;
	}
	%>
	
	<%--(스크립틀릿, scriptlet)변수선언, 자바 로직코드 작성(if,for,클래스등등)--%>
	<% 
	int cnt = 1;
	Calendar c = Calendar.getInstance();
		
		for(int i=1; i<=10; i++){
			out.println(i + "<div>" + cn);
			cnt++;
			if(cnt == 5){
				break;				
			}
		}
	%>
	<%--(표현식, expression)호출결과 출력--%>
	<p><%= sum(1, 5) %></p>
	<strong><%= c.HOUR+1 %></strong>
	<em><%= sum(1, 5) %></em>
</body>

</html>

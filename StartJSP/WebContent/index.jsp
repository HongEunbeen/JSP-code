<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Hello</title>
</head>
<body>
	<h2>안녕하세요? JSP입니다</h2>
	<hr>
	<%= "홍은빈의 홈페이지 입니다." %>
	<% int a=1;
		av = 1;
		//a
	%>
	<%=av %>
	<%! int av;%>
	<%String aaa = out.println("aaa"); %>
	<!-- <%=a%> -->
	<%--aaaaa --%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	[로그인 성공] <br>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
	%>
	<b><font color = "yellowgreen" size = 6> <%= id %></font>님의 방문을 축하합니다.</b>
</body>
</html>
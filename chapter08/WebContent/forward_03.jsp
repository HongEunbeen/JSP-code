<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");//request 객체에 넣어기 때ㅜㅁㄴ에 사용이 가능하다(forward)
		String hoddy = request.getParameter("hobby");
	%>
	<%="id : " + id + " 취미 : " + hoddy %>
</body>
</html>
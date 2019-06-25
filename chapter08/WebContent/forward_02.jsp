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
	request.setCharacterEncoding("UTF-8");
	out.println("편재 페이지는 forward_02.jsp 입니다.<br>");
%>
<jsp:forward page="forward_03.jsp"/>

<%= "forward이후의 실행 문자열 입니다." %>
</body>
</html>
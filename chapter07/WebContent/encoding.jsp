<%@page import="java.net.URLEncoder"%>
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
	String name = "홍길동";
	String encodeingValue = URLEncoder.encode(name, "UTF-8"); //-> get을 사용할때 parameter에 한글을 사용할 수 있게 해주는다.(return이 encoding 된 타입으로 나오게 된다.)
	response.sendRedirect("index.jsp?name" + encodeingValue);
%>

</body>
</html>
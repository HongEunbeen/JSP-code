<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	includeTest
	<%
		request.setCharacterEncoding("UTF-8");//서술형 시 대소문자 구별해서 작성하기
		String name = request.getParameter("name");
		String pageName = request.getParameter("pageName");
		//Main에 준 request를 이 test도 사용이 가능하다.
	%>
	
	현재 페에지는 <%= pageName %> 입니다.<br>
	<b><%=name %>님의 방문을 환영합니다. </b>
</body>
</html>
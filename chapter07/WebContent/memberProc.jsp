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
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String job = request.getParameter("job");
%>

id : <%= id %><br>
pw : <%= pw %><br>
name : <%=name %><br>
job : <%=job %><br>

<!-- request에는 기본적으로 Header에 딸려 가는 내용이 있다. -->
ID : <%= request.getRemoteAddr() %><br>
브라우저 : <%= request.getHeader("User-Agent")%><br>
전송방식 :  <%= request.getMethod() %><br>
<!-- butter은 8kb가 기본이다.(8122) 1kb = 1024 -->
<p>
	서버의 버퍼 크기 : <%= response.getBufferSize() %><br>
	문자세 : <%=response.getCharacterEncoding() %><br>
</p>
</body>
</html>
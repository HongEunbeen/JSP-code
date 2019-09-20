<%@page import="mirim.hs.kr.MemberM"%>
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
		MemberM mem = new MemberM();
			mem.setId("Hong");
			mem.setName("홍길동");
			mem.setPw("1234");
	%>
	ID : <%=mem.getId()%> <br>
	이름 : <%=mem.getName()%> <br>
	PW : <%=mem.getPw()%> <br><br>

	<jsp:useBean id="member" class="mirim.hs.kr.MemberM"/>
	<jsp:setProperty name="member" property="name" value="홍길동"/>
	<jsp:setProperty name="member" property="id" value="hong"/>
	<jsp:setProperty name="member" property="pw" value="1234"/>
	
	이름 : <jsp:getProperty name="member" property="name" /><br>
	ID : <jsp:getProperty name="member" property="id" /><br>
	PW : <jsp:getProperty name="member" property="pw" /><br><br>
	
	ID : ${member.id}<br>
	이름 : ${member.name}<br>
	PW : ${member.pw}<br>
	
	<pre>
		{EL 표기법}
		- pageScope : page영역을 참조하는 객체
		- requestScope : request영역을 참조하는 객체
		- sessionScope : session영역을 참조하는 객체
		- applicationScope : application 영역을 참조하는 객체
		- param : 요청 파라미터를 참조하는 객체
		- paramValues : 요청 파라미터(배열)을 참조하는 객체
		- initParam : 초기화 파라미터를 참조하는 객체
		- cookie : cookie 객체를 참조하는 객체
	</pre>
</body>
</html>
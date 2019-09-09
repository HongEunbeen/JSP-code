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
		//String id = request.getParameter("id");
		//String pw = request.getParameter("pw");
	%>
	
	ID : ${param.id } <br>
	PW : ${param.pw } <br>
	
	<hr>
	
	ID : ${param["id"] } <br>
	PW : ${param["pw"] } <br>
	
	<hr>
	
	application 영역 ㅣ ${applicationScope.application_Key }<br>
	session 영역 ㅣ  ${sessionScope.session_Key }<br>
	page 영역 ㅣ  ${pageScope.page_Key }<br> <!-- page영역은 form만 사용한다. -->
	request 영역 ㅣ  ${requestScope.request_Key }<br><!-- include나 forward 해야 한다. (submit버튼으로는 안됌)-->
	
	<hr>
	<!-- web.xml에 명시함 -->
	${initParam.id }<br>
	${initParam.pw }<br>
	${initParam.name }<br>

</body>
</html>
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
	String name = "홍길동";
	String pageName = "include_02.jsp";	
%>
현재 페이지는 include_01.jsp입니다.<br>
<hr>

<jsp:include page = "<%=pageName%>" flush="false">
	<jsp:param name="pageName" value="<%=pageName %>"/>
	<jsp:param name="name" value="<%=name %>"/><!-- key와 name 순서 바뀌어서 자동 완성 되기 때문에 순서 주의 하기 -->
</jsp:include>

<hr>
include_01.jsp 하단 입니다.

</body>
</html>
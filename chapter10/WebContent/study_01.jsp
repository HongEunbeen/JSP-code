<%@page import="mirim.hs.kr.TestBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%--
		TestBean test = new TestBean();
		test.setId("Hong");
		out.println(test.getId());
	--%>

		<jsp:useBean id="test1" class="mirim.hs.kr.TestBean" scope ="request"/>
		<jsp:setProperty name="test1" property="id" value="Hong"/>
		<jsp:getProperty name="test1" property="id"/>
		<jsp:forward page="study_02.jsp"/>
		
	<%-- <jsp:useBean id="test2" class="mirim.hs.kr.TestBean"/>
	<%
	test2.setId("Hong");
	%>
	<jsp:getProperty name="test2" property="id"/> --%>	
	<!-- 섞어서 사용해도 되지만 java에서 new 를 한거릴 uesBean으로 사용 x -->
</body>
</html>
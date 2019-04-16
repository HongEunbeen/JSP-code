<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:forward page="templateTest.jsp">
	<jsp:param name="CONTENTPAGE" value="content.jsp"/>
</jsp:forward>
<!-- 실행시 제어권을 template에 넘기고 param으로 content를 넘긴다. -->
<!-- name이 key 이다. -->
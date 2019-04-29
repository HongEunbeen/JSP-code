<%@page import="java.io.File"%>
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
		String dirPath = application.getRealPath("/WEB-INF/movie");
		//out.print(dirPath);
		File dir = new File(dirPath);//해당 파일 관리해주는 변수
		String fileNames[] = dir.list();//파일 안에 있는 이름은 String 배열로 리턴해준다
	
	%>
	<h4>영화 목록</h4>
	<%
		for(String filename : fileNames){%>
			<a href = "movieReader.jsp?NAME=<%= filename %>"><%= filename %></a><br>
		<%}%>
</body>
</html>
<!-- WEB-INF은 외부에서 접근할 수 없다 내부에서만 접근할 수 있는 폴더이다 -->
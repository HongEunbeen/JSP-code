<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Date"%>
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
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	Date date = new Date();
	Long time = date.getTime();
	//out.println(time);
	String filename = time + ".txt";
	
	PrintWriter writer = null;
	
	try {
		String filePath = application.getRealPath("/WEB-INF/bbs/" + filename);
		writer = new PrintWriter(filePath);
		writer.printf("제목 : %s %n", title);
		writer.printf("글쓴이 : %s %n", name);
		writer.println(content);
		
		out.println("<font color='red'>게시물</font>이 저장되었습니다.");
		writer.flush();
	}
	catch(Exception e) {
		out.println("오류발생");
	}
	finally {
		writer.close();
	}
	
%>



</body>
</html>















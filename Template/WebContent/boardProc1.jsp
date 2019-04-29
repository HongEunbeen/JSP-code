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
	
	String filename = time + ".txt";
	
	PrintWriter writer = null;//out으로 변수명 x
	
	try{
		String filePath = application.getRealPath("/WEB-INF/dbs/" + filename);
		writer = new PrintWriter(filePath);
		writer.printf("제목 : %s %n", title);//파일 축력
		writer.println("글쓴이 : " + name + "<br>");
		writer.println("내용 : " + content + "<br>");
		out.print("게시물이 저장되었습니다.");//웹 브라우저 출력
		writer.flush();//반드시 작성해 주어야 됨
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		writer.close();
	}
	
%>
</body>
</html>
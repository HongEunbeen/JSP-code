<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>드라이버 테스트</h2>

<%

	Connection conn = null;//db와 연결을 시켜주는 클래스(lib에 등록한 드라이브)
	
	try{//반드시 써주어야 됌
		String url = "jdbc:mysql://localhost:3307/mirim";
		String user = "test";
		String password = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");//lib에 등록한 드라이버의 클래스들을 불러낸다.
		DriverManager.getConnection(url, user, password);//연결
		out.println("연결성공");
		
		
		
	}catch(Exception e){
		out.println("연결실패");
		e.printStackTrace();
	}

%>
</body>
</html>
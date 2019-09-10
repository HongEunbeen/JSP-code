<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
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
	String password = request.getParameter("password");	
	String name = request.getParameter("name");	
	Timestamp register = new Timestamp(System.currentTimeMillis());
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		String url = "jdbc:mysql://localhost:3307/mirim";
		String user = "test";
		String pwd = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,user,pwd);
		String sql = "insert into member values (?, ?, ?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(0, id);
		pstmt.setString(1, password);
		pstmt.setString(2, name);
		pstmt.setTimestamp(3, register);
		pstmt.executeUpdate();
		
		out.print("회원가입 성공");
		
	}catch(Exception e){
		out.print("회원가입 실패");
		e.printStackTrace();
	}finally{
		//if(rs!=null){try{rs.close();}catch(Exception e){e.printStackTrace();}}
		if(pstmt!=null){try{pstmt.close();}catch(Exception e){e.printStackTrace();}}
		if(conn!=null){try{conn.close();}catch(Exception e){e.printStackTrace();}}
		
		
	}
%>
</body>
</html>
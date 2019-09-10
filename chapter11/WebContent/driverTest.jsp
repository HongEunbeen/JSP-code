<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{//반드시 써주어야 됌
		String url = "jdbc:mysql://localhost:3307/mirim";
		String user = "test";
		String password = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");//lib에 등록한 드라이버의 클래스들을 불러낸다.
		DriverManager.getConnection(url, user, password);//연결
		out.println("연결성공");
		
		try{
			String sql = "select * from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			out.println("<table>");
				out.println("<tr>");
					out.println("<td>id</td>");
					out.println("<td>password</td>");
					out.println("<td>name</td>");
					out.println("<td>reg_date</td>");
				out.println("</tr>");
				while(rs.next()){
					out.println("<tr>");
						out.println("<td>"+rs.getString(0)+"</td>");
						out.println("<td>"+rs.getString(1)+"</td>");
						out.println("<td>"+rs.getString(2)+"</td>");
						out.println("<td>"+rs.getString(3)+"</td>");
					out.println("</tr>");
				}
			out.println("</table>");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs!=null){try{rs.close();}catch(Exception e){e.printStackTrace();}}
			if(pstmt!=null){try{pstmt.close();}catch(Exception e){e.printStackTrace();}}
			if(conn!=null){try{conn.close();}catch(Exception e){e.printStackTrace();}}
		}
		
		
	}catch(Exception e){
		out.println("연결실패");
		e.printStackTrace();
	}

%>
</body>
</html>
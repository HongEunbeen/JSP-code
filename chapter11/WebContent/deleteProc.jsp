<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");	
		String password = request.getParameter("password");	
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//try밖에 해주어야지 finally에서 close가능
		
		try{
			String url = "jdbc:mysql://localhost:3307/mirim";
			String user = "test";
			String pwd = "1234";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url,user,pwd);
			String sql = "select password from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				String rPass = rs.getString("password");
				if(rPass.equals(password)){
					sql = "delete from member where id = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					out.println("레코드 삭제 성공");
				}else{
					out.println("비밀번호가 틀립니다.");
				}
			}else{
				out.println("id가 존재하지 않습니다.");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs!=null){try{rs.close();}catch(Exception e){e.printStackTrace();}}
			if(pstmt!=null){try{pstmt.close();}catch(Exception e){e.printStackTrace();}}
			if(conn!=null){try{conn.close();}catch(Exception e){e.printStackTrace();}}
		}
	%>
	
</body>
</html>
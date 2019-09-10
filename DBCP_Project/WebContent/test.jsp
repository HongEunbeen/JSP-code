<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Member 테이블 레코드 표시</h2>
<table border=1>
<tr>
	<td width="100">아이디</td>
	<td width="100">패스워드</td>
	<td width="100">이름</td>
	<td width="200">가입일자</td>
</tr>

<%
Connection conn=null;
PreparedStatement pstmt = null;
ResultSet rs = null;	
try{
	Context initCtx = new InitialContext();
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource)envCtx.lookup("basicjsp");//connection하는 곳
	conn = ds.getConnection();	
	
	pstmt = conn.prepareStatement("select * from member");
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		String id = rs.getString("id");
		String passwd = rs.getString("password");
		String name = rs.getString("name");
		Timestamp register = rs.getTimestamp("reg_date"); %>
		<tr>
			<td><%= id %></td>
			<td><%= passwd %></td>
			<td><%= name %></td>
			<td><%= register %></td>
		</tr>
		
<%	}
}
catch(Exception e){
	out.println("회원가입 실패");
	e.printStackTrace();
}
finally{
	if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e){ e.printStackTrace(); } }
	if(conn!=null){ try{ conn.close(); } catch(Exception e){ e.printStackTrace(); } }
	if(rs!=null){ try{ rs.close(); } catch(Exception e){ e.printStackTrace(); } }
}


%>
</table>


</body>
</html>
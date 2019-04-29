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
		String pw = request.getParameter("pw");
		
		if(id.equals("choi")){
			if(pw.equals("1234")){
				%><jsp:forward page = "loginOk.jsp"/><% 
			}else{
				%><jsp:forward page = "loginProc.jsp"/><% 
			}
		}else{
			%><jsp:forward page = "insert.jsp"/><% 
		}
		
	%>
</body>
</html>
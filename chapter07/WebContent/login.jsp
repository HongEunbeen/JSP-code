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
		
		if(id.equals("choi")){//회원
			response.sendRedirect("index.jsp?name=" + id);//redirect 를 할 줄 알아야 한다. -> 사용자의 요청이 들어오면 controller가 다 받는다. 이걸 controller해서 redirect로 받는다.  
		}else{//비회원
			response.sendRedirect("join.jsp");
		}
	%>
	
	<!-- 
		ID = <%= id %>
		http://localhost:8087/chapter07/login.jsp?id=hong 
	-->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="mirim.hs.kr.*" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	LogonDBBean logon = LogonDBBean.getInstance();
	int check = logon.userCheck(id, password);
	
	if(check == 1){
		Cookie cookie = new Cookie("coupang", id);
		cookie.setMaxAge(60*20);//초(60초 * 20)
		response.addCookie(cookie);
		response.sendRedirect("cookieName.jsp");
	}else if(check == 0){
		response.sendRedirect("cookieLoginForm.jsp");
	}else if(check == -1){
		response.sendRedirect("insertMemberForm.jsp");
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
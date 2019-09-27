<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = "";
	try{
		Cookie[] cookies = request.getCookies();
		if(cookies!=null){
			for(int i=0; i<cookies.length; i++){
				if(cookies[i].getName().equals("coupang")){
					id = cookies[i].getValue();
				}	
			}
			if(id.equals("")){//비회원
				response.sendRedirect("cookieLoginForm.jsp");
			}
			
		}else{//쿠키 아예 없음
			response.sendRedirect("cookieLoginForm.jsp");
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=id %>님이 로그인 하셨습니다.<br>
	<form method="post" action="cookieLogout.jsp">
		<input type="submit" value="로그아웃">
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("coupang")){
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}//if
		}//for
	}//if
    
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert('로그아웃 되었습니다.');
		location.href="cookieName.jsp";
	</script>
</body>
</html>
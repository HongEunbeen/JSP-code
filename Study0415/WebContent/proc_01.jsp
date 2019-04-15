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
		//String strNumber = request.getParameter("number");
		int number = Integer.parseInt(request.getParameter("number"));
		
		if(number <= 10){
			out.print("입력 받은 숫자는 " + number + "이고, 10보다 작습니다."); 
		}
	%>
</body>
</html>
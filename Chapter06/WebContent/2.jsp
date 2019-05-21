<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
안녕하세요
<% 
	String name = "홍길동";
	for(int i=1;i<7;i++){
		out.println("<h"+i+">"); //<h1><h2> ...... <h6>
		out.println("류현진 화이팅~~~~");
		out.println("</h"+i+">"); //</h1></h2> ...... </h6>
	}

%>

</body>
</html>
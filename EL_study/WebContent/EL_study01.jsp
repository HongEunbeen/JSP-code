<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%=10 %> : ${10} <br>
	<%= 99.99 %> : ${99.99} <br>
	<%="ABCD" %> : ${"ABCD"} <br>
	<%= true %> : ${true} <br>
	
	<hr>
	<%= 1+2 %> : ${1+2} <br>
	<%= 1-2 %> : ${1-2} <br>
	<%= 1*2 %> : ${1*2} <br>
	<%= (double)1/2 %> : ${1/2} <br> <!-- 결과값 실수 아닌 정수 주의(형변환) -->
	<%= (1>2)? 1 : 2%> : ${(1>2)? 1 : 2} <br>
	<%= (1>2) || (1<2) %> : ${(1>2) || (1<2)} <br>
</body>
</html>
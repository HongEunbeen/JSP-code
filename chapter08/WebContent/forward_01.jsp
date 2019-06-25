<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method = "post" action = "forward_02.jsp">
		ID : <input type = "text" name = "id"><br>
		취미 : 
		<select name = "hobby">
			<option value = "WOW">WOW</option>
			<option value = "만화보기">만화보기</option>
			<option value = "WOW">오버워치</option>
		</select><br>
		<input type = "submit" value = "입력완료"><br>
	</form>
</body>
</html>
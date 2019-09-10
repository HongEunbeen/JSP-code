<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> Member 회원정보 삭제</h2>
<form action="deleteProc.jsp" method = "post">
	아이디 : <input type="text" name = "id"><br>
	비밀번호 : <input type="text" name = "password"><br>
	<input type="submit" value="삭제"><br>
</form>
</body>
</html>
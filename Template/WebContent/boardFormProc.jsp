<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기 - 입력화면</title>
</head>
<body>
<h2>글쓰기</h2>

<form action="boardProc1.jsp" method="post">
이름 : <input type="text" name="name"> <br>
제목 : <input type="text" name="title"> <br>
<textarea rows="10" cols="40" name="content"></textarea> <br>
<input type="submit" value="작성">
</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="test1" class ="mirim.hs.kr.TestBean" scope = "request"></jsp:useBean>
	<jsp:getProperty name="test1" property="id" />
	<!-- study_01의 객체를 같이 공유하게 된다. -> 같은 이름으로 생성 시 (기존에 누군가가 생성을 했으면 ~!!) -->
	<!-- reqeust 생략 시 page로 들어가게 되어서 새로운 객체가 생성되게 된다 그래서 꼭 scope를 작성해주어야 한다. -->
</body>
</html>
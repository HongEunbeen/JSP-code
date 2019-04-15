<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		String str1 = "전역변수";
	%>
	<%!
		public String getStr(){
			return str1;
		}//전역변수만 사용 가능
	%>
	<%
		String str2 = "지역변수입니다.";//지역 변수
		out.println(str1 + "<br>");
		out.println(str2 + "<br>");
	%>
	<hr>
	<%
		String str3 = "지역변수입니다.";
	%>
	<%=str2 %><br>
	<%=getStr() %><br>
</body>
</html>
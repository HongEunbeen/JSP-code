<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<img src = "image/image05.jpg" width = "400" height = "250"><br>
	<%
		BufferedReader reader = null;
		try{
			String filePath = application.getRealPath("WEB-INF/little.txt");
			//out.println(filePath);
			reader = new BufferedReader(new FileReader(filePath));
			//buffer은 라인별로 읽어 와줌
			while(true){
				String str = reader.readLine();
				if(str == null) break;
				else out.print(str + "<br>");
			}
		}catch(Exception e){
			
		}finally{
			reader.close();
			//메모리 낭비로 인한 것들을 막기 위해 close해야 한다.
		}
		//예외처리 반드시 해주어야 한다.
		//파일처리 데이터베이스 연동, 인터넷 할 때에는 예외처리 무조건 -> 경로와 인터넷 속성 때문에(예기치 못한 상황 때문에)
	%>
</body>
</html>
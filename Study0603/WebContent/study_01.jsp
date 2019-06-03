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
	out.println("출력");
	//JspWriter out2 = new JspWriter(); -> error(추상 메소드여서 new 불가능)
	JspWriter out2 = pageContext.getOut();
	out2.println("출력2");
	
	//HttpServletRequest request2 = new HttpServletRequest();
	ServletRequest request2 = pageContext.getRequest();
	
	/* String name = request.getParameter("name");
	out.println(name); 
	//get 방식으로 url에 주기
	*/
	String name = request.getParameter("name");
	out.println(name); 
	
	ServletRequest request3 = pageContext.getRequest();
	
	String name2 = request3.getParameter("name");
	out.println(name2); 
	//두번 name이 찍히게 된다. request 객체가 2개가 된다.
	
	ServletResponse response2 = pageContext.getResponse();
		
%>
</body>
</html>
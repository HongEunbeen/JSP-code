<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
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
		
	%>
	<!-- request.getParameter 메소드 사용 -->
	<b>request.getParameter() 메서드 사용</b><p>
	name : <%=request.getParameter("name") %>
	address : <%=request.getParameter("address") %><p>
	<b>request.getParameterValues() 메서드 사용</b><p>
	pet :
	<%
		String pet[]= request.getParameterValues("pet");
		if(pet!=null){
			for(int i = 0; i < pet.length; i++){
				out.print(pet[i] + "   ");
			}
		}
		//checkbox는 아무것도 선택 안 할수 있기 때문에 null 처리를 해준다(안해주면 error)
		
	%>
	
	<p><b>request.getParamterNames() 메서드 사용</b></p><br>
	
	<%
	//request.getHeaderNames() -> header에 있는 key 만 가지고 온다.
	//key 값은 있을 수도 있도 없을 수 도 있다. 
		Enumeration en = request.getParameterNames();
		while(en.hasMoreElements()){//key값이 있으면 옯겨 준다. return 타입 잘 보기
			String key = (String)en.nextElement();
			out.println(key + "<br>");
		}
		//checkbox는 check를 해야지 불려와진다.!	
	%>
	<!-- 책에 없는 중요한 내용!!! -->
	<b>request.getParameterMap() 메서드 사용</b><p>
	<%
	//return type이 Map 이다.<String, String[]> -> value가 String[]인 이유는 checkbox 일 수 있기 때문이다.
	//<name , name[0]> <checkbox, check[0], chekc[1]>
		Map map = request.getParameterMap();
		String nameParam[] = (String[])map.get("name");
		String petParam[] = (String[])map.get("pet");
		
		out.println("이름 : " + nameParam[0] + "<br>");
		
		if(petParam!=null){
			for(int i =0; i < petParam.length; i++){
				out.println(petParam[i] + "<br>");
			}
		}
	%>
	<p>
	<hr>
	<b>헤더 목록 출력</b><p>
	<%
	//기본적으로 다라오는 header의 기본값들을 볼 수 있다.
		Enumeration headerEn = request.getHeaderNames();
		while(headerEn.hasMoreElements()){//true
			String headerKey = (String)headerEn.nextElement();
			String headerValue = request.getHeader(headerKey);
			
			out.println(headerKey + " : ");	
			out.println(headerValue + "<br>");
			//쿠키 값이 가장 중요하다.
		}
	
	%>
</body>
</html>
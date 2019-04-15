<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>권역을 선택하세요</h2>
<%
	String str[] = {"JAVA", "JSP", "ANDROID", "HTML5"};
	
	for(int i = 0; i < str.length; i++){
		out.print("str[" + i + "]의 값은" + str[i] + "입니다.<br>");
	}
%>

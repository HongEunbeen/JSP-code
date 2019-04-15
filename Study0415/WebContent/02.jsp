<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.lang.StringBuilder"%>
<%-- 
<%
	String str[] = {"JSP", "JAVA", "Android", "HTML5", "수학"};
	int i = (int)(Math.random() * str.length);
%>
<%=str[i]%>재미있따.

--%>
<%
	StringBuffer sf = new StringBuffer("학교 망해라");
	sf.reverse();
	out.println(sf.toString());
%>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
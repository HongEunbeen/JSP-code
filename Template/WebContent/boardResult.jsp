<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String str = request.getParameter("result");
	if(str.equals("ok")){
		out.println("<font color='red'>게시물</font>이 저장되었습니다.");
	}else{
		out.println("<font color='red'>게시물</font> 저장에 실패했습니다.");
	}
%>
<meta http-equiv='refresh' content='3;url=list.jsp'>
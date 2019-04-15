<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String local = request.getParameter("local");
		String tel = request.getParameter("tel");
		
		String localNum = "";
		
		if(local.equals("서울")){
			localNum = "02";
		}else if(local.equals("경기")){
			localNum = "03";
		}else if(local.equals("강원")){
			localNum = "051";		
		}
		out.print("<b>" + name + "</b>의 전화번호는 " +  localNum + "-" + tel + "입니다.");
	%>
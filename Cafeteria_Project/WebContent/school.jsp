<%@page import="mirim.hs.kr.SchoolSchedule"%>
<%@page import="mirim.hs.kr.SchoolMenu"%>
<%@page import="java.util.List"%>
<%@page import="mirim.hs.kr.SchoolException"%>
<%@page import="mirim.hs.kr.School"%>
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
	try {
	    School school = School.find(School.Region.SEOUL, "미림여자고등학교");
	
	    List<SchoolMenu> menu = school.getMonthlyMenu(2019, 5);
	    List<SchoolSchedule> schedule = school.getMonthlySchedule(2018, 12);
	
	    // 2019년 1월 2일 점심 급식 식단표
	    out.println(menu.get(11).lunch);
	
	    // 2018년 12월 5일 학사일정
	    out.println(schedule.get(25));
	
	} catch (SchoolException e) {
	    e.printStackTrace();
	}
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mirim.hs.kr.MemberMDAO" %>
<%@ page import="mirim.hs.kr.MemberM" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->
<jsp:useBean id="member" class="mirim.hs.kr.MemberM" scope="request" />
<jsp:setProperty name="member" property="email"/>
<jsp:setProperty name="member" property="password"/>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>jsp 게시판 웹사이트</title>
	</head>
	<body>
		request.setCharacterEncoding("UTF-8");
		<%
		MemberMDAO membermDAO = new MemberMDAO(); //인스턴스생성
		int result = membermDAO.login(member.getEmail(), member.getPassword());
		
		//로그인 성공
		if(result == 1){
			session.setAttribute("userID", member.getEmail()); 
			%>
			<jsp:forward page = "index.jsp"/>
			<%
		}
		//로그인 실패
		else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		//아이디 없음
		else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디 입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		//DB오류
		else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('DB오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}		
	
			%>
	</body>
</html>
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
<jsp:setProperty name="member" property="name"/>
<jsp:setProperty name="member" property="weight"/>
<jsp:setProperty name="member" property="height"/>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>jsp 게시판 웹사이트</title>
	</head>
	<body>
	
		
		<%
		request.setCharacterEncoding("UTF-8");
		String arr[] = request.getParameterValues("number");
		
		
		
		if (member.getEmail() == null || member.getPassword() == null || member.getName() == null ||  member.getWeight() == 0 ||  member.getHeight() == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
			script.println("</script>");
		}else if ( member.getWeight() == 0 ||  member.getHeight() == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
				script.println("alert('정확한 키와 몸무게를 설정해 주세요')");
				script.println("history.back()");
			script.println("</script>");
		}else{
			String input = "";
			if(arr != null){
				for(String ar : arr){
					input += (ar + ".");
				}
			}
			
			member.setNumber(input);
			
			MemberMDAO membermDAO = new MemberMDAO(); //인스턴스생성
			int result = membermDAO.join(member);				
			if(result == -1){ // 아이디가 기본키기. 중복되면 오류.
				PrintWriter script = response.getWriter();
				script.println("<script>");
					script.println("alert('이미 존재하는 아이디 입니다.')");
					script.println("history.back()");
				script.println("</script>");
			}
			//가입성공
			else {
				
				PrintWriter script = response.getWriter();
				script.println("<script>");
					script.println("location.href = 'login.jsp'");
				script.println("</script>");
			}
		}
			%>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%//JAVA 로직(100%) - 톰캣이 서블릿으로 바꿀때 그냥 <% 지워버린다. 여기서 ;없으면 에러 뜬다.
	request.setCharacterEncoding("UTF-8");//한글이 있으면 한글로 인식해라 POST방식으로 넘기면 무조건 해주어야 한다.
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String gen = request.getParameter("gen");
	
	if(gen.equals("M")){
		 gen = "남자";
	}else{
		gen = "여자"; 
	}
		//객체를 생성하지 않아도 톰캣이 서블릿으로 만들어 주면서 9개의 내장 객체를 만들어 준다.
		//톰캣이 메모리에 만들어 줬다. -> 내장객체명이 있어야 한다.()
		
	String intoice = request.getParameter("inotice");
	String cntoice = request.getParameter("cnotice");
	String dntoice = request.getParameter("dnotice");
	
	String job = request.getParameter("job");
	//<%= 출력하라는 뜻 - out.println(); -> ; 기호 사용하면 x 
	//system.out.println -> 콘솔에 출력하는 것
	//out.println -> 웹에 출력하는 것 (PrintWriter == out)
	%>
	
	이름 : <%= name %> <br>
	아이디 : <%= id %> <br>
	비밀번호 : <%= pw %> <br>
	성별 : <%= gen %> <br>
	공지 메일 : <%= notice(intoice) %><br>
	광고 메일 : <%= notice(cntoice) %><br>
	배송 메일 : <%= notice(dntoice) %><br>
	직업 : <%= job %>
	
	<%!//메서드, 글로벌 변수, 전역 변수 선언하는 공간
	
		String str2 = "전역변수";
		public String notice(String notice){
			if(notice==null) return "받지 않음";
			else return "받음";
		}
	%>
	
</body>
</html>
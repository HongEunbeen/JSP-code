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
초기화 파라미터 목록 : <br>
application 영역에 값을 넣는 방법 중 2번(1번은 getAttri, setAttri)
<%
	Enumeration en = application.getInitParameterNames();
	while(en.hasMoreElements()){
		String initKey = (String)en.nextElement();
		String initValue = application.getInitParameter(initKey);
		out.println(initKey + " : ");
		out.println(initValue + "<br>");
	}//while
		

%>
<!-- 65p -->
<br>
서버 정보 : <%application.getServerInfo();//return string %><br> <!-- dynamic안에 있는 모든 jsp가 사용할 수 있다. -->
서블릿 규약 메이저 버전 : <%= application.getMajorVersion() %><br>
서블릿 규약 마이너 버전 : <%= application.getMinorVersion() %><br>
<!-- 지금 사용하는 버전은 4.0 version -->
<hr>

<%
	String key = request.getParameter("key");
	String value = request.getParameter("value");//원래는 폼에서 넘어와야 한다. ->get 방식으로 받아오기
	//request는 include, forword한 jsp 끼리 공유한다. 
	//이 값을 다 같이 공유하고 싶으면 application에 setAttri해서 넣는다.
	//친구들하고만 사용하고 싶으면 session에 setAttri해서 넣는다.
	if(key!=null && value != null){
		application.setAttribute(key, value); //key = string, value = object
	}else{
		out.println("application 기본 객체의 기본 설정을 안 했습니다.");
	}
	
%>

<%
	if(key!=null && value != null){
		out.println(application.getAttribute("id"));
	}else{
		out.println("application 기본 객체의 기본 설정을 안 했습니다.");
	}
%>
<br>
<hr>

<%
	String name1 = (String)application.getAttribute("id");
	out.println(name1); //->어느 jsp에서 이렇게 찍어도 나오게 됌

%>
<br>
<hr>

<b>application  기본 객체의 속성 보기</b><br>

<%
	Enumeration en1 =  application.getAttributeNames(); // ->기본적으로 제공 key + 내가 set한 key
	while(en1.hasMoreElements()){
		String key1 = (String)en1.nextElement();
		Object value1 = application.getAttribute(key1); //return이 object가 있을 수 있기 때문에 string으로 casting 하면 안된다
		out.println(key1 + "<br>");
	}
%>
<br>
<hr>
<pre>
	* 웹 어플리케이션은 네 개의 영역(Scope)을 가진다.
		- PAGE 영역 : 하나의 JSP 페이지를 처리할 때 사용되는 영역(내장객체 이름과 유일하게 다르다. -> pageContext)
		- REQUEST 영역 : 하나의 HTTP 요청을 처리할 때 사용되는 영역 -> FORWARD , INCLUDE 사용(P67)
		- SESSION 영역 : 하나의 웹 브라우저와 관련된 영역 -> 웹 브라우저 마다 하나의 SESSION이 만들어 지고 접근할때 마다 공유한다 그래서 회원인증, 회원관리 등에 사용한다. 독립적이 ㄴ페이지를 유기적으로 연결된 페이지 처럼 만들어 준다.
		- APPLICATION 영역 : 하나의 웹 어플리케이션 관련된 영역
		
	* 기본 객체별로 속성의 활용
		- pageContext : PAGE영역을 담당. 하나의 JSP 페이지 내에서 공유될 값을 저장(주로 커스텀 태그에서 새로운 변수를 추가할 때 사용)
		- request : REQUST영역을 담당. 한 번의 요청을 처리하는 데 사용되는 모든 JSP페이지에서 공유될 값을 저장한다. 주로 하나의 요청을 처리하는데 사용되는 JSP 페이지 사이에서 정보를 전달하기 위해서 사용된다.
		- session : SESSION영역을 담당. 한 사용자(웹 브라우저) -> 당 한개씩 생성된 와 관련된 정보를 jsp 페이지들이 공유하지 위해서 사용된다.(사용자의 로그인 정보와 같은 것들을 저장한다.)
		- application : APPLICATION영역을 담당. 모든 사용자와 관련해서 공유할 정보를 저장한다. 임시 디렉터리 경로와 같은 웹 어플리케이션의 설정 정보를 주로 저장한다.

</pre>




</body>
</html>
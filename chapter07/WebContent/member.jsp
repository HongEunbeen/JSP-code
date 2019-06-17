<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type = "text/javascript">
	function check(){
		if(document.mem.id.value==""){
			alert("ID를 입력해 주세요");
			document.mem.id.focus();
			return;
		}
		if(document.mem.pw.value==""){
			alert("PASSWORD를 입력해 주세요");
			document.mem.pw.focus();
			return;
		}
		if(document.mem.name.value==""){
			alert("NAME를 입력해 주세요");
			document.mem.name.focus();
			return;
		}
		
		document.mem.submit();
		
	}	
</script>
</head>
<body>

<pre>
	* JSP에서 기본적으로 제공되는 내장객체는 9개(시험문제 x)
	
	- request, response, out : 입출력과 관련
	- session, application, pageContext : 현재 실행되는 외부환경 정보와 관련
	- page : jsp 페이지 그 차제를 의미
	- config : 서블릿을 초기화 하는 동안 참조할 정보를 전해주는 역할
	- exception : 예외 객체
	request, reponse, session 가장 중요
</pre>

<b>내장 객체중 request, response 연습</b><br>
<!-- 유효성 체크는 javascript로! -->
<form name = "mem" method="post" action = "memberProc.jsp"><!-- get 사용시에는 method 사용 x 가능 -->
	아이디 : <input type = "text" name = "id" size=10><br><!-- name은 key가 된다. -->
	비밀번호 : <input type = "password" name = "pw" size=10><br>
	이름 : <input type = "text" name = "name" size=10><br>
	직업 : <select name = "job">
			<option value = "학생">학생</option>
			<option value = "교사">교사</option>
			<option value = "기타">기타</option>
		</select><br>
	<input type = "button" value = "등록" onclick = "check()"><br>
	<!--<input type = "submit" value = "등록"><br>-->
	<input type = "reset" value = "취소">
</form>
</body>
</html>
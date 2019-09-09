<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- c를 이름으로 지정하는 것은 개발자의 약속 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String name1 = "홍길동";
%>
이름 : <%= name1 %> <br>
<%
	name1 = "";
%>
이름 : <%= name1 %> <br>

<hr>

<c:set var="name2" value="홍길순"/>
이름 : <c:out value="${name2 }"/><br>
<c:remove var="name2"/>
이름 : <c:out value="${name2 }"/><br>
<hr>

<%
	try{
		out.println(2/0);
	}catch(Exception e){
%>	
		<%="익셉션 발생"%>
<%
		out.println(e.getMessage());
	}
%>
<c:catch var="message">
<%=2/0 %>
</c:catch>
익셉션 발생:
<c:out value="${message}"/>

<%if((1+2)==3)%>
	<%="1 + 2 = 3"%>
<%} %>
	
<c:if test="${1+2==3}">
1 + 2 = 3
</c:if>


<%if((1+2)!=3)%>
	<%="1 + 2 != 3" %>
<%} %>
	
<c:if test="${1+2!=3}">
1 + 2 != 3
</c:if>


<% for(int i = 1; i <= 10; i+=2){ %>
	<%=i %><br>
<% } %>

<br>
<c:forEach var="i" begin="1" end="10" step="2">
	${i }<br>
</c:forEach>


</body>
</html>
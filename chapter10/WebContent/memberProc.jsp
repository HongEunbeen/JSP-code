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
	request.setCharacterEncoding("UTF-8");
/* 	String id = request.getParameter("id");
	String name = request.getParameter("name"); */
%>

<jsp:useBean id="test" class = "mirim.hs.kr.TestBean"></jsp:useBean>
<%-- <jsp:setProperty name="test" property="id"/>
<!-- property가 id이면 톰캣이 form으로 찾아가서 id를 찾아서 내부적으로 setId를 호출한다. -->
<!-- value에 값을 주게 되면 value 값이 들어간다 value값이 없을 때 form 에서 가져온다. -->
<jsp:setProperty name="test" property="name"/>
<!-- property가 name이면 톰캣이 form으로 찾아가서 form 이름이 name를 찾아서 내부적으로 setName를 호출한다. -->
<!-- form 이름하고 멤버변수 이름이 같아야 하는 이유이다. --> --%>
<jsp:setProperty name="test" property="*"/>
<!-- 이렇게 하면 많은 form들(갯수 무한정)을 한번에 가져올 수 있다. -> form 이름과 멤버변수가 같아야 하는 이유 -->
<!-- Spring의 autowiled 와 같은 기능이다. -->
<%= test.getId() %>
<%= test.getName() %>


</body>
</html>
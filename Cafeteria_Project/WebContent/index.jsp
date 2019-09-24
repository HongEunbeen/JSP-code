
<%@page import="java.io.PrintWriter"%>
<%@page import="mirim.hs.kr.MenuDAO"%>
<%@page import="mirim.hs.kr.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap 4 Website Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  </style>
</head>
<body>
<%
		String userID = null;
		String date1 = null;

		String code = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}

		if (request.getParameter("date1") != null) {
			date1 = (String) request.getParameter("date1");
		}
		if (request.getParameter("code") != null) {
			code = (String) request.getParameter("code");
		}
		
	%>
	<div class="jumbotron text-center" style="margin-bottom:0">
	  <h1>급식 알리미</h1>
	  <p>미림여자정보과학고등학교 급식 알리미</p> 
	</div>
	
	<nav class="navbar navbar-expand-sm bg-light justify-content-center">
	    <ul class="navbar-nav nav-justified">
	      <li class="nav-item active">
	        <a class="nav-link" href="index.jsp">급식 검색하기</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="cafeteria.jsp">오늘의 급식 보기</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="bmi.jsp">BMI 보기</a>
	      </li> 
	      <%if (userID == null) {
			%>
				<li class="nav-item dropdown">
				    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">로그인</a>
				    <div class="dropdown-menu">
				      <a class="dropdown-item" href="login.jsp">로그인</a>
				      <a class="dropdown-item" href="join.jsp">회원가입</a>
				    </div>
				  </li> 
		<%
			} else {
		%>
			 <li class="nav-item">
		        <a class="nav-link" href="logout.jsp">로그아웃하기</a>
		      </li> 
		<%
			}
			%>  
	      
	    </ul>  
	</nav>
	
	<div class="container">
	    	<form action = "index.jsp" method ="get">
			  <div>
			    <input class="form-control" type="date" name="date1" min="2019-09-01" max="2019-09-30"value="<%=date1%>">
			  </div>
			  <div>
			    <select class="form-control"name="code">
			    	<option value="1">조식</option>
			    	<option value="2">중식</option>
			    	<option value="3">석식</option>
			    </select>
			</div>
			  <div class="input-group mb-3">
			  <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">찾기</button>
			</div>
	    	</form>
		  <h2>9월 급식</h2>
		  <p>미림여자정보과학고등학교</p>            
		  <table class="table table-bordered table-sm">
		    <%
		    	MenuDAO menuDAO = new MenuDAO();
				ArrayList<Menu> list = menuDAO.getMenu(date1, code);
				if(list.isEmpty()){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('급식이 존재하지 않습니다.')");
					script.println("location.href = 'index.jsp'");
					script.println("</script>");
				}
				for(int i = 0; i < list.size(); i++){
				%>
	    	<thead>
		    	<tr>
		    		<th colspan="4"><%= list.get(i).getDate() %></th>
		    	</tr>
	    	</thead>
	    	<tbody>
	    		<%if(list.get(i).getCode() == 1){%>
		    	<tr>
		    		<td><%="아침" %></td>
		    		<td><%=list.get(i).getMenu() %></td>
		    		<td><%=list.get(i).getInfo() %></td>
		    		<td><%=list.get(i).getKcal() %></td>
		    	</tr>
		    	<%}%>
		    	<%if(list.get(i).getCode() == 2){%>
		    	<tr>
		    		<td><%="점심" %></td>
		    		<td><%=list.get(i).getMenu() %></td>
		    		<td><%=list.get(i).getInfo() %></td>
		    		<td><%=list.get(i).getKcal() %></td>
		    	</tr>
		    	<%}%>
		    	<%if(list.get(i).getCode() == 3){%>
		    	<tr>
		    		<td><%="저녁" %></td>
		    		<td><%=list.get(i).getMenu() %></td>
		    		<td><%=list.get(i).getInfo() %></td>
		    		<td><%=list.get(i).getKcal() %></td>
		    	</tr>
		    	<%}%>

		   	 <%} %>
		    </tbody>
		  </table>
		</div>
	
</body>
</html>
<%@page import="mirim.hs.kr.MemberM"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="mirim.hs.kr.MemberMDAO"%>
<%@page import="mirim.hs.kr.MenuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해야 이용하실 수 있습니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		MemberMDAO memberDAO = new MemberMDAO();
		MemberM member = new MemberM();
		member = memberDAO.bmi(userID);
		int w = member.getWeight();
		int h = member.getHeight(); 
		
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
	  <h2>BMI 계산</h2>
	  <p>회원가입시 작성된 몸무게와 키로 bmi를 계산합니다.</p>
		<button type="button" class="btn btn-info btn-lg" data-toggle="collapse" data-target="#modifyUser">정보수정</button>
	 	<div id="modifyUser" class="collapse">
			<form method="post" action="UserModifyResult.jsp">
				<h3 style="text-align: center;">정보 수정</h3>
				<div class="form-group">
					<input type="text" class="form-control" name="email" value="<%=userID%>" readonly>
				</div>
				<div class="form-group">
					<label>몸무게</label>
					<input type="number" class="form-control" name="weight" value="<%=w%>">
				</div>
				<div class="form-group">
					<label>키</label>
					<input type="number" class="form-control" name="height"value="<%=h%>">
				</div>
				<input type="submit" class="btn btn-primary form-control" value="회원정보 수정">
			</form>
		</div>
	  <%

		double d_w = (double)w;
		double d_h = (double)h;
		d_h *= 0.01;
	  	double bmi =  d_w / (d_h*d_h);
	  	System.out.println(bmi);
	  	if(bmi < 17.96){
	  		out.print("<h2>bmi 지수가 "+ bmi +"로 저체중입니다.</h2>");
	  		out.print("<div class='progress' style='height:30px'>");
	  		out.print("<div class='progress-bar' style='width:20%;height:30px'></div>");
	  		out.print("</div>");
	  	}else if(bmi < 23.98){
	  		out.print("<h2>bmi 지수가 "+ bmi +"로 정상입니다.</h2>");
	  		out.print("<div class='progress' style='height:30px'>");
	  		out.print("<div class='progress-bar bg-success' style='width:50%;height:30px'></div>");
	  		out.print("</div>");
	  	}else if(bmi < 25){
	  		out.print("<h2>bmi 지수가 "+ bmi +"로 과체중입니다.</h2>");
	  		out.print("<div class='progress' style='height:30px'>");
	  		out.print("<div class='progress-bar bg-warning' style='width:70%;height:30px'></div>");
	  		out.print("</div>");
	  	}else{
	  		out.print("<h2>bmi 지수가 "+ bmi +"로 비만입니다.</h2>");
	  		out.print("<div class='progress' style='height:30px'>");
	  		out.print("<div class='progress-bar bg-danger' style='width:90%;height:30px'></div>");
	  		out.print("</div>");
	  	}
	  %>
	  </div>

</body>
</html>
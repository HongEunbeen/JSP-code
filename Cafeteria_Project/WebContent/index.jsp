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
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<div class="jumbotron text-center" style="margin-bottom:0">
	  <h1>급식 알리미</h1>
	  <p>미림여자정보과학고등학교 급식 알리미</p> 
	</div>
	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  <a class="navbar-brand" href="#">Navbar</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="collapsibleNavbar">
	    <ul class="navbar-nav nav-justified">
	      <li class="nav-item active">
	        <a class="nav-link" href="index.jsp">급식 검색하기</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="cafeteria.jsp">급식표 보기</a>
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
	  </div>  
	</nav>
	<div class="container">
	    <div class="row">
	    	<form action = "indexProc.jsp" method ="post">
	    	  <div class="input-group mb-3">
			  <label for="example-date-input" class="col-2 col-form-label">Date</label>
			  <div class="col-10">
			    <input class="form-control" type="date" value="2011-08-19" id="example-date-input">
			  </div>
			</div>
			  <div class="input-group mb-3">
			  <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">찾기</button>
			</div>
	    	</form>
	    </div>
	</div>
	<%
	Connection conn=null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;	
	try{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("basicjsp");//connection하는 곳
		conn = ds.getConnection();	
		
		pstmt = conn.prepareStatement("select menu from menu");
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			String menu = rs.getString("menu");
	%>
			<tr>
				<td><%= menu %></td>
			</tr>
			
	<%	}
	}
	catch(Exception e){
		out.println("급식 로딩 실패");
		e.printStackTrace();
	}
	finally{
		if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e){ e.printStackTrace(); } }
		if(conn!=null){ try{ conn.close(); } catch(Exception e){ e.printStackTrace(); } }
		if(rs!=null){ try{ rs.close(); } catch(Exception e){ e.printStackTrace(); } }
	}%>
</body>
</html>
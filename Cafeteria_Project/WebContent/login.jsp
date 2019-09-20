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
	        <a class="nav-link" href="#">급식표 보기</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">BMI 보기</a>
	      </li>   
	      <li class="nav-item dropdown">
		    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">로그인</a>
		    <div class="dropdown-menu">
		      <a class="dropdown-item" href="login.jsp">로그인</a>
		      <a class="dropdown-item" href="join.jsp">회원가입</a>
		    </div>
		  </li> 
	    </ul>
	  </div>  
	</nav>
  <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">로그인</h5>
            <form class="form-signin"  method="post" action="loginProc.jsp">
            
               <div class="input-group mb-3">
	              	 <div class="input-group-prepend">
				    	<span class="input-group-text">email</span>
				 	</div>
	                <input type="email" id="email" name = "email" class="form-control" placeholder="email" required>
	              </div>
               <div class="input-group mb-3">
	              	 <div class="input-group-prepend">
				    	<span class="input-group-text">password</span>
				 	</div>
	                <input type="password" id="password" name="password" class="form-control" placeholder="password" required>
	            </div>
              <div class="custom-control custom-checkbox mb-3">
                <input type="checkbox" class="custom-control-input" id="customCheck1">
                <label class="custom-control-label" for="customCheck1">Remember password</label>
              </div>
              
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">로그인</button>
              <hr class="my-4">
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="button">회원가입</button>
             
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
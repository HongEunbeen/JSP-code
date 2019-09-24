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
	      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
	        <div class="card card-signin my-5">
	          <div class="card-body">
	            <h5 class="card-title text-center">Join Us</h5>
	            <form class="form-signin" method="post" action="joinProc.jsp">
	              <div class="input-group mb-3">
	               	<div class="input-group-prepend">
				    	<span class="input-group-text">email</span>
				 	</div>
	                <input type="email" id="email" name = "email" class="form-control" placeholder="email" required autofocus>
	              </div>
	              
	              <div class="input-group mb-3">
	              	 <div class="input-group-prepend">
				    	<span class="input-group-text">password</span>
				 	</div>
	                <input type="password" id="password" name = "password" class="form-control" placeholder="password" required>
	              </div>
              
	              <div class="input-group mb-3">
 					<div class="input-group-prepend">
				    	<span class="input-group-text">name</span>
				 	</div>
	                <input type="text" id="name" name = "name" class="form-control" placeholder="name" required>
	              </div>
              
				  <div class="input-group mb-3 row">
				    <div class="col">
				      <input type="number" id="height" name = "height" class="form-control" placeholder="키">
				    </div>
				    <div class="col">
				      <input type="number" id="weight" name = "weight" class="form-control" placeholder="몸무게">
				    </div>
				  </div>
				  <div class="input-group mb-3 row">
				    <div class="col">
					   	<input type = "checkbox" class="form-control" value = "1" name = "number">①난류
					   	<input type = "checkbox" class="form-control" value = "2" name = "number">②우유
					   	<input type = "checkbox" class="form-control" value = "3" name = "number">③메밀
					   	<input type = "checkbox" class="form-control" value = "4" name = "number">④땅콩
					   	<input type = "checkbox" class="form-control" value = "5" name = "number">⑤대두
					</div>
					<div class="col">
					   	<input type = "checkbox" class="form-control" value = "6" name = "number">⑥밀
					   	<input type = "checkbox" class="form-control" value = "7" name = "number">⑦고등어
					   	<input type = "checkbox" class="form-control" value = "8" name = "number">⑧게
					   	<input type = "checkbox" class="form-control" value = "9" name = "number">⑨새우
					   	<input type = "checkbox" class="form-control" value = "10" name = "number">⑩돼지고기
					</div>
					<div class="col">
					   	<input type = "checkbox" class="form-control" value = "11" name = "number">⑪복숭아
					   	<input type = "checkbox" class="form-control" value = "12" name = "number">⑫토마토
					   	<input type = "checkbox" class="form-control" value = "13" name = "number">⑬아황산염
					   	<input type = "checkbox" class="form-control" value = "14" name = "number">⑭호두
					   	<input type = "checkbox" class="form-control" value = "15" name = "number">⑮닭고기
					</div>
					<div class="col">
					   	<input type = "checkbox" class="form-control" value = "16" name = "number">⑯쇠고기
					   	<input type = "checkbox" class="form-control" value = "17" name = "number">⑰오징어
					   	<input type = "checkbox" class="form-control" value = "18" name = "number">⑱조개류(굴,전복,홍합)
				  </div>
				  </div>
             	<hr class="my-4">
              	<button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">회원가입</button>
            </form>
          </div>
        </div>
      </div>
    </div>
</body>
</html>
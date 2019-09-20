<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- 뷰포트 -->
	<meta name="viewport" content="width=device-width" initial-scale="1">
	<!-- 스타일시트 참조  -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<title>jsp 게시판 웹사이트</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<!-- 네비게이션  -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">APP STORE</a>
		</div>
		<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">메인</a></li>
				<li><a href="AppList.jsp">앱 목록</a></li>
				<li class="active"><a href="SearchApp.jsp">앱 검색하기</a></li>
				<li><a href="RecommApp.jsp">앱 추천받기</a></li>
				<%
					if (userID == null) {
				%>
						<li><a href="Login.jsp">로그인</a></li>
						<li><a href="Join.jsp">회원가입</a></li>
				<%
					} else {
				%>
					<li><a href="MyInfo.jsp">마이 페이지</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</nav>
	<!-- 로긴폼 -->
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<!-- 점보트론 -->
			<div class="jumbotron" style="padding-top: 20px;">
				<!-- 로그인 정보를 숨기면서 전송post -->
				<form method="post" action="JoinResult.jsp">
				
					<h3 style="text-align: center;">회원가입</h3>
				
					<div class="form-group">
						<input type="email" class="form-control" placeholder="name@example.com"
							name="email" maxlength="30">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="password" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호 확인"
							name="password-hak" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름"
							name="name" maxlength="20">
					</div>
					<div class="form-group">
						<input type="number" class="form-control" placeholder="전화번호"
							name="phone" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="회사이름"
							name="company" maxlength="20">
					</div>
					<div class="form-group">
						<input type="number" class="form-control" placeholder="회사 전화번호"
							name="comphone" maxlength="20">
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active"> 
								<input type="radio" name="gender" autocomplete="off" value="남자" checked>남자
							</label> 
							<label class="btn btn-primary"> 
								<input type="radio" name="gender" autocomplete="off" value="여자" >여자
							</label>
						</div>
					</div>
					<div class="form-group">
					    <label for="age">나이</label>
					    
					    <select class="form-control" id="age" name = "age">
					      <%
					      	for(int i = 0; i < 100; i++){
					      		out.println("<option value = '"+i+"'>" + i + "</option>");
					      	}
					      %>
					    </select>
					</div>

					<input type="submit" class="btn btn-primary form-control"
						value="회원가입">
				</form>
			</div>
		</div>
	</div>
	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>

</body>
</html>
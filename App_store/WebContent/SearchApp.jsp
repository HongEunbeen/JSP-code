<%@page import="mirim.hs.kr.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mirim.hs.kr.App"%>
<%@page import="mirim.hs.kr.AppDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>jsp 게시판 웹사이트</title>
</head>
<body>
	<%
 		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String)session.getAttribute("userID");
		}
		String sortString = "NONE";
		
		String listSort = "ANO";
		String category = null;
		String search = null;
		String option = null;
		
		ArrayList<App> searchlist = null;
		if (request.getParameter("listSort") != null) {
			listSort = request.getParameter("listSort");
		}
		if (request.getParameter("category") != null) {
			category = request.getParameter("category");
		}
		if (request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		if (request.getParameter("option") != null) {
			option = request.getParameter("option");
		}

		AppDAO appDAO = new AppDAO();
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
		<div class="container">
			<div class="row">
				<ul class="nav nav-pills">
					<li class="nav-item"><a class="nav-link" href="SearchApp.jsp">전체</a></li>
					<li class="nav-item"><a class="nav-link" href="SearchApp.jsp?listSort=<%=listSort %>&category=<%="여행"%>">여행</a></li>
					<li class="nav-item"><a class="nav-link" href="SearchApp.jsp?listSort=<%=listSort %>&category=<%="자동차/교통"%>">자동차/교통</a></li>
					<li class="nav-item"><a class="nav-link" href="SearchApp.jsp?listSort=<%=listSort %>&category=<%="커뮤니케이션"%>">커뮤니케이션</a></li>
					<li class="nav-item"><a class="nav-link" href="SearchApp.jsp?listSort=<%=listSort %>&category=<%="홈/인테리어"%>">홈/인테리어</a></li>
					<li class="nav-item"><a class="nav-link" href="SearchApp.jsp?listSort=<%=listSort %>&category=<%="교육/라이브러리"%>">교육/라이브러리</a></li>
					<li class="nav-item"><a class="nav-link" href="SearchApp.jsp?listSort=<%=listSort %>&category=<%="엔터테이먼트"%>">엔터테이먼트</a></li>
					<li class="nav-item"><a class="nav-link" href="SearchApp.jsp?listSort=<%=listSort %>&category=<%="금융"%>">금융</a></li>
					<li class="nav-item"><a class="nav-link" href="SearchApp.jsp?listSort=<%=listSort %>&category=<%="건강/운동"%>">건강/운동</a></li>
					<li class="nav-item"><a class="nav-link" href="SearchApp.jsp?listSort=<%=listSort %>&category=<%="지도/내비게이션"%>">지도/내비게이션</a></li>
					<li class="nav-item"><a class="nav-link" href="SearchApp.jsp?listSort=<%=listSort %>&category=<%="사진"%>">사진</a></li>
					<li class="nav-item"><a class="nav-link" href="SearchApp.jsp?listSort=<%=listSort %>&category=<%="생산성"%>">생산성</a></li>
					<li class="nav-item"><a class="nav-link" href="SearchApp.jsp?listSort=<%=listSort %>&category=<%="쇼핑"%>">쇼핑</a></li>
					<li class="nav-item"><a class="nav-link" href="SearchApp.jsp?listSort=<%=listSort %>&category=<%="스포츠"%>">스포츠</a></li>
					<li class="nav-item"><a class="nav-link" href="SearchApp.jsp?listSort=<%=listSort %>&category=<%="날씨"%>">날씨</a></li>
					<li class="nav-item"><a class="nav-link" href="SearchApp.jsp?listSort=<%=listSort %>&category=<%="라이프스타일"%>">라이프스타일</a></li>
					<li class="nav-item"><a class="nav-link" href="SearchApp.jsp?listSort=<%=listSort %>&category=<%="오디오"%>">음악 및 오디오</a></li>
					<li class="nav-item"><a class="nav-link" href="SearchApp.jsp?listSort=<%=listSort %>&category=<%="게임"%>">게임</a></li>
				</ul>
			</div>
			<div class="row">
				<form method="post" action="SearchApp.jsp">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<tr>
							<td>
								<select class="form-control" name="option">
									<option value = "none" selected>ALL</option>
									<option value = "title">제목</option>
									<option value = "email">이메일</option>
									<option value = "company">회사</option>
								</select>
							</td>
							<td><input type="text" class="form-control" name="search"/></td>
						</tr>
					</table>	
					<input type="submit" class="btn btn-primary pull-right" value="검색하기" />
				</form>
			</div>		
            <div class="row">
            	<div class="col-md-4 pull-right">
                 	<div class="input-group pull-right">
                 		<div class="btn-group">
                     		<a id="headerUserButton" class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown" href="AppList.jsp">
                         		<%=sortString %> <span class="caret"></span>
                         	</a>
		                     <ul class="dropdown-menu">
		                     	 <li><a href= "SearchApp.jsp?listSort=<%="ANO" %><%if(category != null){ %>&category=<%=category%><%}%>"><%sortString = "NONE"; %>NONE</a></li>
		                         <li><a href= "SearchApp.jsp?listSort=<%="CDATE" %><%if(category != null){ %>&category=<%=category%><%}%>"><%sortString = "최근 등록 순"; %>최근 등록 순</a></li>
		                         <li><a href= "SearchApp.jsp?listSort=<%="TITLE" %><%if(category != null){ %>&category=<%=category%><%}%>"><%sortString = "앱 이름 순"; %>앱 이름 순</a></li>
		                     </ul>
                 		</div><!--- /.btn-group --->
                 	</div>
                 </div>
             </div>
			<div class="row">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">번호</th>
							<th style="background-color: #eeeeee; text-align: center;">앱 이름</th>
							<th style="background-color: #eeeeee; text-align: center;">개발자</th>
							<th style="background-color: #eeeeee; text-align: center;">회사명</th>
							<th style="background-color: #eeeeee; text-align: center;">범주</th>
						</tr>
					</thead>
					<tbody>
						<%
							String text_search = "none";	
							String text_option = "none";
							
							if(request.getParameter("option") != null){
								text_option = request.getParameter("option");
							}
							if(request.getParameter("search") != null){
								text_search = request.getParameter("search");
							}
							ArrayList<App> list = appDAO.getCategoryList(category, listSort, text_search, text_option);
							String userCom = appDAO.getCompany(userID);
							for (int i = 0; i < list.size(); i++) {
						%>
							<tr>
								<td><%=(i+1)%></td>
								<td><a href="AppInfo.jsp?ANO=<%=list.get(i).getNo()%>"><%=list.get(i).getTitle()%></a></td>
								<td><%=list.get(i).getEmail()%></td>
								<td><%=list.get(i).getCompany()%></td>
								<td><%=list.get(i).getCategory()%></td>
							</tr>
						<%
							}
						%>
					</tbody>
				</table>
				
			</div>
		</div>	
		<!-- 애니매이션 담당 JQUERY -->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<!-- 부트스트랩 JS  -->
		<script src="js/bootstrap.js"></script>
	
	</body>
	</html>
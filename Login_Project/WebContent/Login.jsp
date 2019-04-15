<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script type = "text/javascript">
	function check(){
		if(document.frm01.id.value == ""){
			alert("아이디를 입력해주세요,,,");
			document.frm01.id.focus();
			return;
		}
		if(document.frm01.pw.value == ""){
			alert("비밀번호를 입력해주세요,,,");
			document.frm01.pw.focus();
			return;
		}
		frm01.submit();//유효성 체크가 끝났기 때문에 frm01의 action으로 가라는 것!
	}
</script>
<meta charset="UTF-8">
<title>로그인 폼</title>
</head>
<body>
		<form name = "frm01" action = "loginProc.jsp" method = "post">
			<table border = 1>
				<tr>
					<td align = "center">아이디</td>
					<td><input type = "text" name = "id"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type = "password" name = "pw"></td>
				</tr>
				<tr>
					<td colspan = "2" align = "center">
						<input type = "button" value = "로그인" onclick = "check()">
						<input type = "reset" value = "취소">
					</td>
				</tr>
			</table>
		</form>
</body>
</html>
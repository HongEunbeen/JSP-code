<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	폼에 데이터를 입력한 후 [전송] 버튼을 클릭하세요.<br>
	<hr>
	
	<form method = "post" action = "viewProc.jsp">
		이름 : <input type = "text" name = "name" size = 10><br>
		주소 : <input type = "text" name = "address" size = 30><br>
		좋아하는 동물 : 	<input type = "checkbox" name = "pet" value= "dog">강아지
					<input type = "checkbox" name = "pet" value= "cat">고양이
					<input type = "checkbox" name = "pet" value= "pig">돼지
					<input type = "checkbox" name = "pet" value= "bird">새<br>
					<!-- pet에 해당하는 value를 getparameter. values로 리턴한다. -->
		<input type = "submit" value = "전송">
		
	</form>
</body>
</html>
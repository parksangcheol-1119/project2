<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>공통링크</h2>
	<table border="1" width="90%">
		<tr>
			<td>
				<!-- 로그인 여부를 판단하기 위해 session영역의 속성을
					사용한다. session영역에 아무런 속성도 없다면 
					로그아웃 상태이다. -->
				<% if(session.getAttribute("USER_ID")==null){ %>
					<a href="./member/Login.jsp">로그인</a>			
				<% }else{ %>
					<a href="./member/Logout.jsp">로그아웃</a>
				<% } %>
				
			</td>
		</tr>
	</table>
</body>
</html>
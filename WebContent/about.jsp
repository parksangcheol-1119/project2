<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>About - Cinema Theatre Website Template</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
		<style>
	.wrap{
		float : left
	}
	
	.logo {
		position: abslute;
	}
	.top {
		position: absolute;
		text-align:right;
		top: -155px;
		width:200px;
	}
	
	.login {
		position: fixed;
		top: 220px;
		left: 20px;
	}
	</style>
	
</head>
<body>
<%
//세션 영역에 회원인증 정보가 없다면 로그아웃 상태
if(session.getAttribute("USER_ID")==null){ 
%>
		<div id="header" class="header">
		<div class="logo">
			<a href="index.jsp" id="logo"><img src="images/logo.png" alt=""></a>
			<ul>
				<li class="selected">
					<a href="index.jsp">Home</a>
				</li>
				<li>
					<a href="movies.jsp">Movies</a>
					<ul>
						<li>
							<a href="#">Now Showing</a>
						</li>
						<li>
							<a href="#">Comming Soon</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="ticket-info.jsp">Ticket Info</a>
				</li>
				<li>
					<a href="rentals.jsp">Rentals</a>
				</li>
				<li>
					<a href="about.jsp">About</a>
				</li>
				<li>
					<a href="blog.jsp">Blog</a>
				</li>
				
			</ul>
		</div>
		<div class="top">
			<li>
				<a href="">사이트맵</a>
				<a href="./Login/Login.jsp">로그인</a>
				<a href="">ㅁㅁㅁㅁ</a>
				<a href="">ㅇㅇㅇㅇ</a>
			</li>
		</div>
	</div>
	<% 
}else{
//세션영역에 회원인증 정보가 있을때이므로 로그인이 된 상태
%>
	<div class="login">
		<table border='1' bgcolor="ffffff">
			<tr>
				<td style="text-align:center;">				
					<%=session.getAttribute("USER_NAME") %> 회원님, 
						로그인 하셨습니다.
					<br />
					즐거운 시간 보내세요 ^^*
					<br />
					<a href="./Login/Logout.jsp">[로그아웃]</a>
				</td>
			</tr>
		</table>
	</div>
<div id="header" class="header">
		<div class="logo">
			<a href="index.jsp" id="logo"><img src="images/logo.png" alt=""></a>
			<ul>
				<li class="selected">
					<a href="index.jsp">Home</a>
				</li>
				<li>
					<a href="movies.jsp">Movies</a>
					<ul>
						<li>
							<a href="#">Now Showing</a>
						</li>
						<li>
							<a href="./calendar.jsp">calendar</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="ticket-info.jsp">Ticket Info</a>
				</li>
				<li>
					<a href="rentals.jsp">Rentals</a>
				</li>
				<li>
					<a href="about.jsp">About</a>
				</li>
				<li>
					<a href="blog.jsp">Blog</a>
				</li>
				
			</ul>
		</div>
		<div class="top">
			<li>
				<a href="">사이트맵</a>
				<a href="./Login/Logout.jsp">로그아웃</a>
				<a href="">정보수정</a>
				<a href="">ㅇㅇㅇㅇ</a>
			</li>
		</div>
	</div>
<% } %>
	<div id="body" class="about">
	
	<a>
	 <%@ include file="../model2/List.jsp" %>
	</a>
	
 
	</div>



		
</body>
</html>
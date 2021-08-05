<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Cinema Theater Website Template</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<!-- 고정이 되지 않아 로그인 wrap 클래스를 float 속성으로 왼쪽 고정 -->
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
							<a href="./restService.jsp">Now Showing</a>
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
							<a href="../K_OpenAPI/WebContent/restService.jsp">Now Showing</a>
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
	<div id="body" class="home">
		<div>
			<div>
				<a href="movies.jsp"><img src="images/baby-with-dog.jpg" alt=""></a>
				<h2><a href="movies.jsp">Movie Title</a></h2>
				<p>
					This website template has been designed by Free Website Templates for you, for free. You can replace all this text with your own text. You can remove any link to our website from this website template, you're free to use this website template without linking back to us. If you're having problems editing this website template, then don't hesitate to ask for help on the Forums.
				</p>
				<a href="movies.jsp">Read More</a>
			</div>
			<ul>
				<li>
					<h3>Movie Title</h3>
					<span>Cinema 2</span> <a href="movies.jsp"><img src="images/surfer.jpg" alt=""></a>
				</li>
				
				<li>
					<h3>Movie Title</h3>
					<span>Cinema 3</span> <a href="movies.jsp"><img src="images/soldiers.jpg" alt=""></a>
				</li>
				<li>
					<h3>Movie Title</h3>
					<span>Cinema 4</span> <a href="movies.jsp"><img src="images/ballet-dancer.jpg" alt=""></a>
				</li>
			</ul>
		</div>

		<div>
			<div>
				<h3><a href="rentals.jsp">Rental Services</a></h3>
				<ul>
					<li>
						<a href="rentals.jsp"><img src="images/conference.jpg" alt=""></a>
						<h4>Conference Rooms</h4>
						<p>
							In sed nibh mauris. Curabitur scelerisque dignissim viverra. Etiam interdum enim nec turpis.
						</p>
					</li>
					<li>
						<a href="rentals.jsp"><img src="images/cinema.jpg" alt=""></a>
						<h4>Cinema Rental</h4>
						<p>
							Donec odio nunc, consectetur fringilla tincidunt nec, cursus vitae ipsum.
						</p>
					</li>
				</ul>
			</div>
			<div>
				<h3><a href="blog.jsp">From The Blog</a></h3>
				<ul>
					<li>
						<a href="blog.jsp"><img src="images/trainor.jpg" alt=""></a>
						<div>
							<span>Posted on August 8, 2023 by Admin</span>
							<h4>Blog Post Title One</h4>
							<p>
								Donec odio nunc, consectetur fringilla tincidunt nec, cursus vitae ipsum. <a href="blog.jsp" class="more">Read More</a>
							</p>
						</div>
					</li>
					<li>
						<a href="blog.jsp"><img src="images/lava.jpg" alt=""></a>
						<div>
							<span>Posted on August 8, 2023 by Admin</span>
							<h4>Blog Post Title Two</h4>
							<p>
								Donec odio nunc, consectetur fringilla tincidunt nec, cursus vitae ipsum. <a href="blog.jsp" class="more">Read More</a>
							</p>
						</div>
					</li>
					<li>
						<a href="blog.jsp"><img src="images/castle.jpg" alt=""></a>
						<div>
							<span>Posted on August 8, 2023 by Admin</span>
							<h4>Blog Post Title One</h4>
							<p>
								Donec odio nunc, consectetur fringilla tincidunt nec, cursus vitae ipsum. <a href="blog.jsp" class="more">Read More</a>
							</p>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div id="footer">
		<div>
			<div>
				<span>Quick Links</span>
				<ul>
					<li>
						<a href="index.jsp">Home</a>
					</li>
					<li>
						<a href="ticket-info.jsp">Ticket Info</a>
					</li>
					<li>
						<a href="#">Location</a>
					</li>
					<li>
						<a href="movies.jsp">Now Showing</a>
					</li>
					<li>
						<a href="rentals.jsp">Rentals</a>
					</li>
					<li>
						<a href="about.jsp">Contact</a>
					</li>
					<li>
						<a href="movies.jsp">Comming Soon</a>
					</li>
					<li>
						<a href="about.jsp">The Company</a>
					</li>
					<li>
						<a href="blog.jsp">Blog</a>
					</li>
				</ul>
			</div>
			<div class="section">
				<span>Recent Tweets</span>
				<ul>
					<li>
						<p>
							Sed id mattis tellus. Proin egestas velit vel neque placerat sed interdum neque porta.
						</p>
						<span><a href="#">- 1 day ago</a></span>
					</li>
					<li>
						<p>
							Praesent at urna ac urna congue convallis.
						</p>
						<span><a href="#">- 2 day ago</a></span>
					</li>
				</ul>
			</div>
			<div>
				<span>Sign Up For Our Mailing List</span>
				<p>
					Praesent at urna ac urna congue convallis. Maecenas sed placerat turpis. Duis in dolor ut nibh molestie faucibus.
				</p>
				<form action="about.jsp">
					<input type="text" onclick="this.value='';" onfocus="this.select()" onblur="this.value=!this.value?'Enter Email Address Here':this.value;" value="Enter Email Address Here">
					<input type="submit" value="">
				</form>
			</div>
			<p>
				&#169; 2023 Cinema Theatre
			</p>
			<div class="connect">
				<span>Stay Connected:</span> <a href="http://freewebsitetemplates.com/go/facebook/" id="facebook">facebook</a> <a href="http://freewebsitetemplates.com/go/twitter/" id="twitter">twitter</a> <a href="http://freewebsitetemplates.com/go/googleplus/" id="googleplus">google+</a>
			</div>
		</div>
	</div>
</body>
</html>
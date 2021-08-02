<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Movies - Cinema Theater Website Template</title>
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
//세션 영역에 회원인증 정보가 없다면 로그아웃 상태  ㄷㅗ
if(session.getAttribute("USER_ID")==null){ 
%>
	<div id="header">
		<div>
			<a href="index.jsp" id="logo"><img src="images/logo.png" alt=""></a>
			<ul>
				<li>
					<a href="index.jsp">Home</a>
				</li>
				<li class="selected">
					<a href="movies.jsp">Movies</a>
					<ul>
						<li class="selected">
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
			<div class="top">
			<li>
				<a href="">사이트맵</a>
				<a href="../Login/movie=deralis.jsp">로그아웃</a>
				<a href="">ㅁㅁㅁㅁ</a>
				<a href="">ㅇㅇㅇㅇ</a>
			</li>
		</div>
		</div>
	</div>
	<div id="body" class="movies">
		<h2>Movies</h2>
		<img src="images/baby-with-dog3.jpg" alt="">
		<div>
			<h3>Synopsis</h3>
			<p>
				This website template has been designed by <a href="http://www.freewebsitetemplates.com/">Free Website Templates</a> for you, for free. You can replace all this text with your own text. You can remove any link to our website from this website template, you're free to use this website template without linking back to us. If you're having problems editing this website template, then don't hesitate to ask for help on the <a href="http://www.freewebsitetemplates.com/forums/">Forums</a>.
			</p>
			<p>
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ullamcorper ornare turpis, tempor iaculis velit gravida ut. Fusce lobortis justo non elit volutpat eu euismod odio adipiscing. Pellentesque pharetra justo in tortor fringilla ac sodales tellus viverra. Fusce eu erat turpis, et sodales metus. Vestibulum neque quam, lobortis in pretium sed, varius ut purus. Donec turpis purus, lacinia a tincidunt nec, sodales convallis orci.
			</p>
		</div>
		<div class="section">
			<h3>Details</h3>
			<span>Drama, Adventure</span>
			<p>
				<span>Starring:</span> Janet S. Foster, Alexander S. Irwin, Rosendo P. Fowler,
			</p>
			<p>
				<span>Directed By:</span> Barbara J. Hernandez
			</p>
			<p>
				<span>Screenplay By:</span> Melissa J. Soper
			</p>
			<p>
				<span>Runs For:</span> 120 minutes
			</p>
			<p>
				<span>Showtimes:</span> 11:30     1:30     3:30     5:30     7:30     10:30
			</p>
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
				<form action="index.jsp">
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
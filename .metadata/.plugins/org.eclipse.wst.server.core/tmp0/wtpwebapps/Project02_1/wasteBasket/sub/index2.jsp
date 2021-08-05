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
	<div class="login">
		<table bgcolor="ffffff" border="1">
			<tr>
				<td>아이디</td>
				<td></td>
			</tr>
			<tr>
				<td>비번</td>
				<td></td>
			</tr>
		</table>
	</div>
	<div id="header" class="header">
		<div class="logo">
			<a href="index.html" id="logo"><img src="images/logo.png" alt=""></a>
			<ul>
				<li class="selected">
					<a href="index.html">Home</a>
				</li>
				<li>
					<a href="movies.html">Movies</a>
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
					<a href="ticket-info.html">Ticket Info</a>
				</li>
				<li>
					<a href="rentals.html">Rentals</a>
				</li>
				<li>
					<a href="about.html">About</a>
				</li>
				<li>
					<a href="blog.html">Blog</a>
				</li>
				
			</ul>
		</div>
		<div class="top">
			<li>
				<a href="">사이트맵</a>
				<a href="./Login/Logout.jsp">사이트맵 | 로그아웃 | ㅁㄹㅇㄹ | ㅁㅇㅇㅇ</a>
				<a href="">정보수정</a>
				<a href="">ㅇㅇㅇㅇ</a>
			</li>
		</div>
	</div>
	
	<div id="body" class="home">
		<div>
			<div>
				<a href="movies.html"><img src="images/baby-with-dog.jpg" alt=""></a>
				<h2><a href="movies.html">Movie Title</a></h2>
				<p>
					This website template has been designed by Free Website Templates for you, for free. You can replace all this text with your own text. You can remove any link to our website from this website template, you're free to use this website template without linking back to us. If you're having problems editing this website template, then don't hesitate to ask for help on the Forums.
				</p>
				<a href="movies.html">Read More</a>
			</div>
			<ul>
				<li>
					<h3>Movie Title</h3>
					<span>Cinema 2</span> <a href="movies.html"><img src="images/surfer.jpg" alt=""></a>
				</li>
				
				<li>
					<h3>Movie Title</h3>
					<span>Cinema 3</span> <a href="movies.html"><img src="images/soldiers.jpg" alt=""></a>
				</li>
				<li>
					<h3>Movie Title</h3>
					<span>Cinema 4</span> <a href="movies.html"><img src="images/ballet-dancer.jpg" alt=""></a>
				</li>
			</ul>
		</div>

		<div>
			<div>
				<h3><a href="rentals.html">Rental Services</a></h3>
				<ul>
					<li>
						<a href="rentals.html"><img src="images/conference.jpg" alt=""></a>
						<h4>Conference Rooms</h4>
						<p>
							In sed nibh mauris. Curabitur scelerisque dignissim viverra. Etiam interdum enim nec turpis.
						</p>
					</li>
					<li>
						<a href="rentals.html"><img src="images/cinema.jpg" alt=""></a>
						<h4>Cinema Rental</h4>
						<p>
							Donec odio nunc, consectetur fringilla tincidunt nec, cursus vitae ipsum.
						</p>
					</li>
				</ul>
			</div>
			<div>
				<h3><a href="blog.html">From The Blog</a></h3>
				<ul>
					<li>
						<a href="blog.html"><img src="images/trainor.jpg" alt=""></a>
						<div>
							<span>Posted on August 8, 2023 by Admin</span>
							<h4>Blog Post Title One</h4>
							<p>
								Donec odio nunc, consectetur fringilla tincidunt nec, cursus vitae ipsum. <a href="blog.html" class="more">Read More</a>
							</p>
						</div>
					</li>
					<li>
						<a href="blog.html"><img src="images/lava.jpg" alt=""></a>
						<div>
							<span>Posted on August 8, 2023 by Admin</span>
							<h4>Blog Post Title Two</h4>
							<p>
								Donec odio nunc, consectetur fringilla tincidunt nec, cursus vitae ipsum. <a href="blog.html" class="more">Read More</a>
							</p>
						</div>
					</li>
					<li>
						<a href="blog.html"><img src="images/castle.jpg" alt=""></a>
						<div>
							<span>Posted on August 8, 2023 by Admin</span>
							<h4>Blog Post Title One</h4>
							<p>
								Donec odio nunc, consectetur fringilla tincidunt nec, cursus vitae ipsum. <a href="blog.html" class="more">Read More</a>
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
						<a href="index.html">Home</a>
					</li>
					<li>
						<a href="ticket-info.html">Ticket Info</a>
					</li>
					<li>
						<a href="#">Location</a>
					</li>
					<li>
						<a href="movies.html">Now Showing</a>
					</li>
					<li>
						<a href="rentals.html">Rentals</a>
					</li>
					<li>
						<a href="about.html">Contact</a>
					</li>
					<li>
						<a href="movies.html">Comming Soon</a>
					</li>
					<li>
						<a href="about.html">The Company</a>
					</li>
					<li>
						<a href="blog.html">Blog</a>
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
				<form action="about.html">
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
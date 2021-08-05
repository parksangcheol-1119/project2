<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Blog - Cinema Theater Website Template</title>
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
	<div id="header">
		<div>
			<a href="index.jsp" id="logo"><img src="images/logo.png" alt=""></a>
			<ul>
				<li>
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
				<li class="selected">
					<a href="blog.jsp">Blog</a>
				</li>
			</ul>
		<div class="top">
			<li>
				<a href="">사이트맵</a>
				<a href="./Login/Login.jsp">로그아웃</a>
				<a href="">ㅁㅁㅁㅁ</a>
				<a href="">ㅇㅇㅇㅇ</a>
			</li>
		</div>
		</div>
	</div>
	<div id="body" class="blog">
		<ul>
			<li>
				<a href="blog-single-post.jsp"><img src="images/trainor2.jpg" alt=""></a>
				<div>
					<div>
						<h4><a href="blog-single-post.jsp">Blog Post TItle 1</a></h4>
						<span>Posted on August 8, 2023 by <a href="#">Admin</a> in <a href="blog-single-post.jsp">Category 1</a></span> <a href="blog-single-post.jsp">1 Comments</a>
					</div>
					<p>
						This website template has been designed by <a href="http://www.freewebsitetemplates.com/">Free Website Templates</a> for you, for free. You can replace all this text with your own text. You can remove any link to our website from this website template, you're free to use this website template without linking back to us. If you're having problems editing this website template, then don't hesitate to ask for help on the <a href="http://www.freewebsitetemplates.com/forums/">Forums</a>.
					</p>
					<a href="blog-single-post.jsp">Read More</a>
				</div>
			</li>
			<li>
				<a href="blog-single-post.jsp"><img src="images/lava2.jpg" alt=""></a>
				<div>
					<div>
						<h4><a href="blog-single-post.jsp">Blog Post TItle 2</a></h4>
						<span>Posted on August 8, 2023 by <a href="#">Admin</a> in <a href="blog-single-post.jsp">Category 1</a></span> <a href="blog-single-post.jsp">1 Comments</a>
					</div>
					<p>
						This website template has been designed by <a href="http://www.freewebsitetemplates.com/">Free Website Templates</a> for you, for free. You can replace all this text with your own text. You can remove any link to our website from this website template, you're free to use this website template without linking back to us. If you're having problems editing this website template, then don't hesitate to ask for help on the <a href="http://www.freewebsitetemplates.com/forums/">Forums</a>.
					</p>
					<a href="blog-single-post.jsp">Read More</a>
				</div>
			</li>
			<li>
				<a href="blog-single-post.jsp"><img src="images/castle2.jpg" alt=""></a>
				<div>
					<div>
						<h4><a href="blog-single-post.jsp">Blog Post TItle 3</a></h4>
						<span>Posted on August 8, 2023 by <a href="#">Admin</a> in <a href="blog-single-post.jsp">Category 1</a></span> <a href="blog-single-post.jsp">1 Comments</a>
					</div>
					<p>
						This website template has been designed by <a href="http://www.freewebsitetemplates.com/">Free Website Templates</a> for you, for free. You can replace all this text with your own text. You can remove any link to our website from this website template, you're free to use this website template without linking back to us. If you're having problems editing this website template, then don't hesitate to ask for help on the <a href="http://www.freewebsitetemplates.com/forums/">Forums</a>.
					</p>
					<a href="blog-single-post.jsp">Read More</a>
				</div>
			</li>
		</ul>
		<div>
			<div>
				<h4>Categories</h4>
				<ul>
					<li>
						<a href="#">Category Title 1</a>
					</li>
					<li>
						<a href="#">Category Title 2</a>
					</li>
					<li>
						<a href="#">Category Title 3</a>
					</li>
					<li>
						<a href="#">Category Title 4</a>
					</li>
				</ul>
			</div>
			<div>
				<h4>Popular Blog Posts</h4>
				<ul>
					<li>
						<span>Posted on August 8, 2023 by Admin</span>
						<h5>Blog Post Title One</h5>
						<p>
							Donec odio nunc, consectetur fringilla tincidunt nec, cursus vitae ipsum.
						</p>
						<a href="#">Read More</a>
					</li>
					<li>
						<span>Posted on August 8, 2023 by Admin</span>
						<h5>Blog Post Title Two</h5>
						<p>
							Donec odio nunc, consectetur fringilla tincidunt nec, cursus vitae ipsum.
						</p>
						<a href="#">Read More</a>
					</li>
					<li>
						<span>Posted on August 8, 2023 by Admin</span>
						<h5>Blog Post Title Three</h5>
						<p>
							Donec odio nunc, consectetur fringilla tincidunt nec, cursus vitae ipsum.
						</p>
						<a href="#">Read More</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="section">
			<a href="#">&#60; Older Posts</a> <a href="#">Newer Posts &#62;</a>
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
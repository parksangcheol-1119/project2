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
				<a href="./Login/Logout.jsp">로그아웃</a>
				<a href="">정보수정</a>
				<a href="">ㅇㅇㅇㅇ</a>
			</li>
		</div>
	</div>
<% } %>
	<div id="body" class="blog-single">
		<div>
			<img src="images/trainor3.jpg" alt="">
			<div>
				<h4>Blog Post TItle 1</h4>
				<span>Posted on August 8, 2023 by <a href="#">Admin</a> in <a href="blog-single-post.jsp">Category 1</a></span>
			</div>
			<p>
				This website template has been designed by <a href="http://www.freewebsitetemplates.com/">Free Website Templates</a> for you, for free. You can replace all this text with your own text. You can remove any link to our website from this website template, you're free to use this website template without linking back to us. If you're having problems editing this website template, then don't hesitate to ask for help on the <a href="http://www.freewebsitetemplates.com/forums/">Forums</a>.
			</p>
			<p>
				Vivamus convallis tempor lacus, vel adipiscing risus faucibus ut. Proin lobortis ullamcorper lectus et commodo. Cras lobortis congue lectus, non fringilla urna hendrerit eu. Proin faucibus fringilla lorem, at ultricies sem porta vitae. Phasellus dignissim porttitor lorem, eu eleifend nisi rutrum sed.
			</p>
			<div class="comment">
				<span>1 Comment</span>
				<p>
					<img src="images/user.jpg" alt=""> <span>Jane Doe December 3, 2023 at 3:25 pm </span> Pellentesque nec tempor massa. Maecenas tortor elit, ultricies eget placerat ac, eleifend sit amet nunc. Praesent aliquam fermentum semper.
				</p>
				<a href="#">Reply</a> <span>Leave A Reply</span>
			</div>
			<form action="index.jsp">
				<div>
					<label for="name"><span>Name *</span>
						<input type="text" id="name">
					</label>
					<label for="email"><span>Email *</span>
						<input type="text" id="email">
					</label>
					<label for="website"><span>Website *</span>
						<input type="text" id="website">
					</label>
				</div>
				<div>
					<label for="comment">Comment</label>
					<textarea name="comment" id="comment" cols="30" rows="10"></textarea>
					<input type="submit" value="">
				</div>
			</form>
		</div>
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
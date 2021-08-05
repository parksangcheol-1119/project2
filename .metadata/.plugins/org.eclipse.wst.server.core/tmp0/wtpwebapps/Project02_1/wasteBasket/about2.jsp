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
				<li class="selected">
					<a href="about.jsp">About</a>
				</li>
				<li>
					<a href="blog.jsp">Blog</a>
				</li>
			</ul>
			<div class="top">
			<li>
				<a href="">사이트맵</a>
				<a href="../Login/Logout_about.jsp">로그아웃</a>
				<a href="">ㅁㅁㅁㅁ</a>
				<a href="">ㅇㅇㅇㅇ</a>
			</li>
		</div>
		</div>
	</div>
	<div id="body" class="about">
		<h2>About</h2>
		<div>
			<div>
				<h4>주변 영화관</h4>
				<img src="images/cinema4.jpg" alt="">
				<h3>We Have Free Templates for Everyone</h3>
				<p>
					Our website templates are created with inspiration, checked for quality and originality and meticulously sliced and coded. What’s more, they're absolutely free! You can do a lot with them. You can modify them. You can use them to design websites for clients, so long as you agree with the <a href="http://www.freewebsitetemplates.com/about/terms">Terms of Use</a>. You can even remove all our links if you want to.
				</p>
				<h3>We Have More Templates for You</h3>
				<p>
					Looking for more templates? Just browse through all our <a href="http://www.freewebsitetemplates.com/">Free Website Templates</a> and find what you’re looking for. But if you don’t find any website template you can use, you can try our <a href="http://www.freewebsitetemplates.com/freewebdesign/">Free Web Design</a> service and tell us all about it. Maybe you’re looking for something diferent, something special. And we love the challenge of doing something diferent and something special.
				</p>
				<h3>Be Part of Our Community</h3>
				<p>
					If you're experiencing issues and concerns about this website template, join the discussion <a href="http://www.freewebsitetemplates.com/forums/">on our forum</a> and meet other people in the community who share the same interests with you.
				</p>
				<h3>Template details</h3>
				<p>
					Design version 5 <br> Code version 2 <br><br>
				</p>
				<p>
					Website Template details, discussion and updates for this <a href="http://www.freewebsitetemplates.com/discuss/cinematheaterwebsitetemplate/">Cinema Theatre Website Template</a>.<br><br>
				</p>
				<p>
					Website Template design by <a href="http://www.freewebsitetemplates.com/">Free Website Templates</a>.<br><br>
				</p>
				<p>
					Please feel free to remove some or all the text and links of this page and replace it with your own About content.
				</p>
			</div>
			<div>
				<h4>Contact</h4>
				<img src="images/retro-telephone.jpg" alt=""> <span class="address">Cinema Theatre, 1076 Stout Street, New Holland, PA 17557</span> <span class="phone-num">717-354-7008</span> <span class="fax-num">717-354-7009</span> <span class="email">info@cinematheatre.com</span>
				<form action="index.jsp">
					<label for="name"><span>Name *</span>
						<input type="text" id="name">
					</label>
					<label for="email"><span>Email *</span>
						<input type="text" id="email">
					</label>
					<label for="subject"><span>Subject</span>
						<input type="text" id="subject">
					</label>
					<label for="comment"><span class="comment">Comment</span>
						<textarea name="comment" id="comment" cols="30" rows="10"></textarea>
					</label>
					<input type="submit" value="">
				</form>
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
					<%=session.getAttribute("USER_NAME") %> 회원님, 
					로그인 하셨습니다.
				<br />
				즐거운 시간 보내세요 ^^*
				<br />
				<a href="Logout.jsp">[로그아웃]</a>
			</td>
			
		</tr>
	</table>
<% } %>
</body>
</html>
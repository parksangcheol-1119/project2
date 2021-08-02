<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login.jsp</title>
<style>
 header{
                display:flex;
                justify-content: center;
            }
            form{
                padding:10px;
            }
            .input-box{
                position:relative;
                margin:10px 0;
            }
            .input-box > input{
                background:transparent;
                border:none;
                border-bottom: solid 1px #ccc;
                padding:20px 0px 5px 0px;
                font-size:14pt;
                width:100%;
            }
            input::placeholder{
                color:transparent;
            }
            input:placeholder-shown + label{
                color:#aaa;
                font-size:14pt;
                top:15px;

            }
            input:focus + label, label{
                color:#8aa1a1;
                font-size:10pt;
                pointer-events: none;
                position: absolute;
                left:0px;
                top:0px;
                transition: all 0.2s ease ;
                -webkit-transition: all 0.2s ease;
                -moz-transition: all 0.2s ease;
                -o-transition: all 0.2s ease;
            }

            input:focus, input:not(:placeholder-shown){
                border-bottom: solid 1px #8aa1a1;
                outline:none;
            }
            input[type=submit]{
                background-color: #8aa1a1;
                border:none;
                color:white;
                border-radius: 5px;
                width:100%;
                height:35px;
                font-size: 14pt;
            }
            #forgot{
                text-align: right;
                font-size:12pt;
                color:rgb(164, 164, 164);
                margin:10px 0px;
            }
            
            
</style>

</head>
<body>

<!-- 
로그인 실패시 에러메세지 출력 (06세션의 Login 교안)
 -->
	<span style="color:red; font-size:1.5em;">		
	<%=request.getAttribute("ERROR_MSG")==null ?
		"" : request.getAttribute("ERROR_MSG") %>
</span>
<%
//세션 영역에 회원인증 정보가 없다면 로그아웃 상태
if(session.getAttribute("USER_ID")==null){ 
%>
	<script>
	//로그인 폼의 입력값을 검증하는 JS함수 정의
	function loginValidate(fn){
		if(!fn.user_id.value){
			alert("아이디를 입력하세요");
			fn.user_id.focus();
			return false;
		}
		if(fn.user_pw.value==""){
			alert("패스워드를 입력하세요");
			fn.user_pw.focus();
			return false;
		}
	}
	</script>	
	
	
	<header>
	<h2>Login</h2>
	</header>

	<form action="LoginProcessMap.jsp" method="POST" name="loginfrm"
	onsubmit="return loginValidate(this);">
	
	 <div class="input-box">
	 <input id="username" type="text" name="user_id" placeholder="아이디"> 
	 <label for="username">아이디</label>
	 </div>
	
	<div class="input-box"> <input id="password" type="password" name="user_pw" placeholder="비밀번호"> 
	<label for="password">비밀번호</label> 
	</div>
	
	
	<div id="forgot"></div>
	 <input type="submit" value="로그인" >
	</form>	
	
	
	<form action="../member/join.jsp" method="POST" name="loginfrm"
	onsubmit="return loginValidate(this);">
	
		 <div class="member" id="member"></div>
	 	 <input type="submit" value="회원가입">
	 </form>	
<% 
}else{
//세션영역에 회원인증 정보가 있을때이므로 로그인이 된 상태
%>
	<table border='1'>
		<tr>
			<td style="text-align:center;">				
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//폼태그를 통해 전송되는 파라미터를 받을때 사용하는 메소드
String user_id1 = request.getParameter("user_id");
out.print(user_id1);

//각 4가지 영역에 저장할때 사용하는 메소드
pageContext.setAttribute("user_id", "aaa");
request.setAttribute("user_id", "bbb");
session.setAttribute("user_id", "ccc");
application.setAttribute("user_id", "ddd");

//4가지 영역에 저장된 속성을 읽어올때 사용하는 메소드
String user_id2 = (String)pageContext.getAttribute("user_id");
String user_id3 = (String)request.getAttribute("user_id");
String user_id4 = (String)session.getAttribute("user_id");
String user_id5 = (String)application.getAttribute("user_id");
out.println("user_id2="+ user_id2);
out.println("user_id3="+ user_id3);
out.println("user_id4="+ user_id4);
out.println("user_id5="+ user_id5);
%>

<form>
	<input type="text" name="user_id" />
	<input type="submit" value="전송하기" />
</form>
</body>
</html>
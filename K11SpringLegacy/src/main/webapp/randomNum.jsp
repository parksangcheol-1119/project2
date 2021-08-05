<%@page import="common.LottoCreater"%> 
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>RandomNum</h2>
	<%
	Random random = new Random();
	out.println("난수:"+ random.nextInt(100));
	%>    
	
	<h2>Lotto6/45</h2>
	<%
	LottoCreater lottoCreater = new LottoCreater();
	int[] lottoNum = lottoCreater.lotto(); 
	for(int lo : lottoNum){
		out.println(lo);
	}
	%>
</body>
</html> 


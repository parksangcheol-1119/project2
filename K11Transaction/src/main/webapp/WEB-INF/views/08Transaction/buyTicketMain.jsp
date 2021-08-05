<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script>
$(function(){
	
});
</script>
</head>
<body>
<div class="container">

	<h2>트랜잭션(Transaction)</h2>
	
	<h3>트랜잭션 처리후 티켓 구매하기</h3>
	
	<h4>제약조건 : check(countNum<=5) 이므로 티켓구매는 5장까지만
	가능함. 그 이상은 제약조건 위배 사항임.</h4>
	
	<form action="buyTicketAction.do" method="post" name="ticketFrm">
	<!-- table>tr*3>td*2 -->
	<table class="table table-bordered" 
		style="width:500px;">
		<tr>
			<td>고객아이디</td>
			<td>
				<input type="text" name="customerId" />
			</td>
		</tr>
		<tr>
			<td>티켓구매수</td>
			<td>
				<select name="amount">
				<%
				for(int i=1 ; i<=10 ; i++){
				%>
					<option value="<%=i%>"><%=i%>장</option>
				<%
				}
				%>
				</select>				
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit" class="btn btn-warning">구매하기</button>
			</td>
		</tr>
	</table>
	</form>








</div>

</body>
</html>
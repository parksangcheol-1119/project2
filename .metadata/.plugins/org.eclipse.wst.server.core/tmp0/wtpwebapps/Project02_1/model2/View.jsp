<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일첨부형 게시판</title>
</head>
<body>
<h2>파일첨부형 게시판-내용보기(View)</h2>
<table border="1" width="90%">
	<colgroup>
		<col width="15%"/>
		<col width="35%"/>
		<col width="15%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<td>번호</td>
		<td>${dto.idx }</td>
		<td>작성자</td>
		<td>${dto.name }</td>
	</tr>
	<tr>
		<td>작성일</td>
		<td>${dto.postdate }</td>
		<td>조회수</td>
		<td>${dto.visitcount }</td>
	</tr>
	<tr>
		<td>제목</td>
		<td colspan="3">${dto.title }</td>
	</tr>
	<tr> 
		<td>내용</td>
		<td colspan="3" height="100">${dto.content }</td>
	</tr>
	<tr> 
		<td>첨부파일</td>
		<td>
		<!-- 첨부한 파일이 있을때만 다운로드 링크 활성화 -->
		<c:if test="${not empty dto.ofile }">
			${dto.ofile }<!-- 기존 파일명 출력 -->
			<a href="../mvcboard/download.do?ofile=${dto.ofile }&sfile=${dto.sfile 
				}&idx=${dto.idx }">
				[다운로드]
			</a>		
		</c:if>		
		</td>
		<td>다운로드수</td>
		<td>${dto.downcount }</td>
	</tr>
	<tr>
		<td colspan="4" align="center">
			<!--  
			비회원제 게시판의 경우 수정, 삭제를 위해 먼저 비밀번호 검증을
			진행해야 한다. 따라서 동일한 요청명으로 진입하는 대신 파라미터
			mode를 통해 수정/삭제를 구분하여 분기한다. 
			-->
			<button type="button" 
			onclick="location.href='./pass.do?mode=edit';">
				수정하기			
			</button>							
			<button type="button" 
			onclick="location.href='./pass.do?mode=delete&idx=${param.idx}';">
				삭제하기			
			</button>		 
			<button type="button" onclick="location.href='./mvcboard/list.do';">
				리스트바로가기
			</button>
		</td>
	</tr>
</table>
<!-- 댓글 작성 폼 추가 -->
 <h2>댓글쓰기</h2>
<script>
function commentValidate(f){
	if(f.name.value==""){
		alert("작성자를 입력하세요");
		f.name.focus();
		return false;
	}
	if(f.pass.value==""){
		alert("비밀번호를 입력하세요");
		f.pass.focus();
		return false;
	}
	if(f.comments.value==""){
		alert("댓글 내용을 입력하세요");
		f.comments.focus();
		return false;
	}
}
</script>
<form name="commentFrm" method="post" action="./commentWrite.comm" onsubmit="return commentValidate(this);">
<input type="hidden" name="board_idx" value="${param.idx }" />
<table border="1" width="90%">
	<colgroup>
		<col width="30%"/>
		<col width="40%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<td>작성자 : <input type="text" name="name" size="10" /></td>
		<td colspan="2">비밀번호 : <input type="password" name="pass" size="10" /></td>
	</tr>
	<tr>
		<td colspan="2">
			<textarea name="comments" style="width:100%;height:70px;"></textarea>
		</td>
		<td><input type="submit" value="댓글쓰기" style="width:80px;height:77px;" /></td>
	</tr>
</table>
 </form>
 
</body>
</html>

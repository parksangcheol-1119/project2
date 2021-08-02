<%@page import="utils.JSFunction"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 String[] paramArr = new String[20];
 int idx = 0;
 Enumeration<String> forms = request.getParameterNames();
 while(forms.hasMoreElements()){	
 	String paramName = (String)forms.nextElement();	
 	paramArr[idx++] = request.getParameter(paramName);
 }
 MemberDTO dto = new MemberDTO();
 /*
0 id
1 name
2 pass
3 passc
4 2021-06-01
5 34672
6 대전 동구 판교1길 3
7 address
8 naver.com
9 naver.com
10 KT
11 on
12 on
13 null
*/

 dto.setId(paramArr[0]);
 dto.setNAME(paramArr[1]);
 dto.setPass(paramArr[2]);  
 dto.setBirthday(paramArr[4]);   
 dto.setZipcode(paramArr[5]); 
 dto.setAddress1(paramArr[6]);  
 dto.setAddress2(paramArr[7]); 
 dto.setEmail(paramArr[8]);   
 dto.setEmail2(paramArr[9]);   
 dto.setPhone(paramArr[10]);  


 
 MemberDAO dao = new MemberDAO(application);
 int result = dao.memberRegist(dto);
 if(result==1){
 	JSFunction.alertLocation("회원가입이 완료되었습니다", "../Login/Login.jsp", out);
 }
 else{
 	JSFunction.alertBack("회원가입시 오류가 발생하였습니다", out);
 }
 
 %>
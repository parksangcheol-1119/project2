<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
   <script>
		function openZipSearch() {
		new daum.Postcode({
		oncomplete: function(data) {
		$('[name=zip]').val(data.zonecode); // 우편번호 (5자리)
		$('[name=addr1]').val(data.address);
		$('[name=addr2]').val(data.buildingName);
		}
		}).open();
		}
    $( function() {
  
        //날짜선택을 편리하게 - Date Picker
        $("#birthday").datepicker({
            dateFormat : "yy-mm-dd"
        });    
    } );

    
    //아이디 검증을 위한 전역변수
    var idObj;
    var idFlag;
    window.onload = function(){
        idObj = document.loginFrm.user_id;//아이디 객체
    }
	function idCheck(fn){
		if(!idCapsule()){
            idObj.value="";
            idObj.focus();
            return;
        }
        if(fn.user_id.value==""){
            alert("아이디를 입력후 중복확인을 해주세요.");
            fn.user_id.focus();		
        }	
        else{
            fn.user_id.readOnly = true;
            window.open("./pages/id_overapping.jsp?id="+fn.user_id.value,
                    "idover", "width=300,height=200");
        }
    }
    function loginValdidate(fn){        
        //일반적인방법
        if(fn.user_id.value==""){
            alert("아이디를 입력해주세요");
			fn.user_id.readOnly = false;
			fn.user_id.focus();return false;
        } 
        if(!idCapsule()){
            idObj.value="";
            idObj.focus();
            return false;
        }
        var p1 = fn.pass1;
        var p2 = fn.pass2;
        if(p1.value==""){alert("패스워드를 입력해주세요");p1.focus();return false;}
	    if(p2.value==""){alert("패스워드확인을 입력해주세요");p2.focus();return false;}
        if(isPassword(p1.value)==false){
            alert('패스워드는 숫자와 특수기호가 하나이상 포함되야합니다.');
			p1.value="";p2.value="";p1.focus();
            return false;
        }
        if(p1.value!=p2.value){
            alert("패스워드가 틀립니다. 다시 입력해주세요");
            p1.value="";p2.value="";p1.focus();
            return false;
        }        
        if(fn.name.value==""){
            alert("이름을 입력해주세요");fn.name.focus();return false;
        } 
        //return false;
    }
    function isPassword(param){
        //숫자나 특수기호가 확인되면 true로 변경한다.
        var isNum = false, isSpec = false;
        //숫자가 포함되었는지 확인
        for(var i=0 ; i<param.length ; i++){
            if(param[i].charCodeAt(0)>=48 && param[i].charCodeAt(0)<=57){
                isNum = true;
                console.log("숫자포함됨");
                break;
            }
        }
        for(var i=0 ; i<param.length ; i++){
            if((param[i].charCodeAt(0)>=33 && param[i].charCodeAt(0)<=47)
                || (param[i].charCodeAt(0)>=58 && param[i].charCodeAt(0)<=64)
                || (param[i].charCodeAt(0)>=91 && param[i].charCodeAt(0)<=96)){
                isSpec = true;
                console.log("특수기호포함됨");
                break;
            }
        }
        if(isNum==true && isSpec==true)
            return true;
        else
            return false;
    }
    //아이디가 8~12자 사이가 아니면 false를 반환한다.
    var idLength = function(param){	
        if(!(param.value.length>=8 && param.value.length<=12)){		
            return false;
        }
        return true;
    }
    //아스키코드로 숫자인지 여부확인 : 숫자라면 true를 반환한다.
    function isNumber(param){		
        for(var i=0 ; i<param.length ; i++){
            if(!(param[i].charCodeAt(0)>=48 && param[i].charCodeAt(0)<=57)){
                return false;
            }		
        }
        return true;
    }
    //아이디의 첫문자는 숫자로 시작할수 없다
    var idStartAlpha = function(param){	
        if(isNumber(param.value.substring(0,1))==true){		
            return false;
        }	
        return true;
    }
    //아스키코드로 숫자 or 알파벳인지 확인. 아니면 false반환
    function isAlphaNumber(param){
        for(var i=0 ; i<param.value.length ; i++){			
            if(!((param.value[i].charCodeAt(0)>=97 && param.value[i].charCodeAt(0)<=122) 
                    || (param.value[i].charCodeAt(0)>=65 && param.value[i].charCodeAt(0)<=90)
                    || (param.value[i].charCodeAt(0)>=48 && param.value[i].charCodeAt(0)<=57))){
                return false;	
            }
        }
        return true;
    }
    //아이디검증 로직을 하나로 묶는다.
    function idCapsule(){        
        //1.아이디는 8~12자 이내여야 한다. 즉 7자를 쓰거나 13자를 쓰면 잘못된 아이디로 판단하고 재입력을 요구한다.
        if(!idLength(idObj)){
            alert('아이디는 8~12자만 가능합니다.');
            return false;
        }        
        //2.아이디는 반드시 영문으로 시작해야 한다. 만약 숫자로 시작하면 잘못된 아이디로 판단한다.
        if(!idStartAlpha(idObj)){
            alert("아이디는 숫자로 시작할수 없습니다.");
            return false;
        }	
        //3.영문과 숫자의 조합으로만 구성해야 한다. 특수기호가 들어가거나 한글이 들어갈 경우 잘못된 아이디로 판단한다.
        if(!isAlphaNumber(idObj)){
            alert("아이디는 영문과 숫자만 포함할수 있습니다.");
            return false;
        }        
        return true;
    }
	function inputEmail(frm){		
		if (frm.email_domain.value=='1') {
            /*
            select에서 직접입력을 선택하면
            readonly속성을 비활성화하고, 입력된 내용을 비워준다. 
            */
			frm.email2.readOnly = false;
			frm.email2.value = '';
			frm.email2.focus();
		}
		else {
            /*
            특정 도메인을 선택하면
            선택한 도메인을 입력하고, readonly속성은 활성화한다.
            */
			frm.email2.readOnly = true;
			frm.email2.value = frm.email_domain.value;
		}
	}
	function commonFocusMove(obj, mLength, next_obj){        
        var strLength = obj.value.length;        
        if(strLength>=mLength){
            eval("document.loginFrm."+next_obj+".focus()");
        }        
    } 
    </script>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <script>
    function zipcodeFind(){
        new daum.Postcode({
            oncomplete: function(data) {
                //DAUM 우편번호API가 전달해주는 값을 콘솔에 출력
                console.log("zonecode", data.zonecode);
                console.log("address", data.address);
                //회원 가입폼에 적용
                var f = document.loginFrm;//<form>태그의 DOM객체를 변수에 저장
                f.zipcode.value = data.zonecode;
                f.address1.value = data.address;
                f.address2.focus();
                
            }
        }).open();
    }
    </script>
<link rel="stylesheet" href="./joincss.css">
</head>
<body>
	<form action="joinProcess.jsp" method="post" name="loginFrm" onsubmit="return loginValdidate(this)">
		<div class="wrap wd668">
	      <div class="container">
	        <div class="form_txtInput">
	          <h2 class="sub_tit_txt">회원가입</h2>
	          <p class="exTxt"></p>
	          <div class="join_form">
	            <table>
	              <colgroup>
	                <col width="30%"/>
	                <col width="auto"/>
	              </colgroup>
	              
	              
	              <tbody>
	                <tr>
	                  <th><span>아이디</span></th>
	                  <td colspan="3"><input type="text" name="id" id="id" placeholder="ID 를 입력하세요."></td>
	                </tr>
	               
	               
	                <tr>
	                  <th><span>이름</span></th>
	                  <td colspan="3"><input type="text" name="name" id="name" placeholder=""></td>
	                </tr>
	               
	               
	                <tr>
	                  <th><span>비밀번호</span></th>
	                  <td colspan="3"><input type="password" name="pass" id="pass" placeholder="비밀번호를 입력해주세요."></td>
	                </tr>
	               
	               
	                <tr>
	                  <th><span>비밀번호 확인</span></th>
	                  <td colspan="3"><input type="password" name="passc" id="passc" placeholder="비밀번호를 확인하세요"></td>
	                </tr>
	              
	              
	                <tr>
	                <th><span>생년월일</span> </th>
	                <td colspan="3">
	                    <input type="text" class="w02" name="birthday" id="birthday" value="" />
	                    <img src="./images/pick.jpg" alt="" class="pick" />
	                </td>
	               
	               
	                <tr>
	                <th><span>주소</span></th>
	                <td colspan="3">
	                    <input type="text" class="w03" name="zip" id="addnum" value="" />
	                    <button type="button" onclick="openZipSearch()">우편번호찾기</button> 
	                </td>
	           		</tr>
	    			<tr>
	                <td></td>
	                <td colspan="3">
	                    <input type="text" class="w04" name="addr1" id="addr1" value="" />                
	                    <input type="text" class="w04" name="addr2" id="addr2" value="" />
	                </td>           
	              
	               
	                <tr class="email">
	                  <th><span>이메일</span></th>
	                  <td colspan="2">
	                  	<table>
	                  		<tr>
	                  			<td><input type="text" id="email1" class="email"></td>
	                  			<td><span class="mar10">@</span></td>
	                  			<td><input type="text" id="email2" class="email email2" name="email2"></td>
	                  		</tr>
	                  	</table>
	                  </td>
	                  <td style="width: 100px;">
	                  	<select name="email_domain" class="email email2" onchange="inputEmail(this.form);">
                        <option value="1">직접입력</option>
                        <option value="naver.com">naver.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="nate.com">nate.com</option>
                    </select>
	                  </td>
	                </tr>
	
	                  <th><span>휴대폰 번호</span></th>
	                    <td style="width: 100px;">
	               		<select name="mobile1" class="s02" id="telecom" onchange="commonFocusMove(this, 3, 'mobile2');">
							<option value="선택해주세요" selected>선택해주세요</option>
	                        <option value="KT">KT</option>
	                        <option value="SKT">SKT</option>
	                        <option value="LGT">LGT</option>
	                    </select></td>
	                  <td colspan="2"><input type="text" name="mobile2" id="phone" placeholder="휴대폰번호를 입력하세요."></td>               
	                </tr>
	              </tbody>
	            </table>
	            <div class="exform_txt"><span>표시는 필수적으로 입력해주셔야 가입이 가능합니다.</span></div>
	          </div><!-- join_form E  -->
	          <div class="agree_wrap">
	            <div class="checkbox_wrap">
	              <input type="checkbox" id="news_letter" name="news_letter" class="agree_chk">
	              <label for="news_letter">[선택]뉴스레터 수신동의</label>
	            </div>
	            <div class="checkbox_wrap mar27">
	              <input type="checkbox" id="marketing" name="marketing" class="agree_chk">
	              <label for="marketing">[선택]마케팅 목적 개인정보 수집 및 이용에 대한 동의</label>
	              <ul class="explan_txt">
	                <li><span class="red_txt">항목 : 성별, 생년월일</span></li>
	                <li>고객님께서는 위의 개인정보 및 회원정보 수정 등을 통해 추가로 수집하는 개인정보에<br/>
	                  대해 동의하지 않거나 개인정보를 기재하지 않음으로써 거부하실 수 있습니다.<br/>
	                  다만 이때 회원 대상 서비스가 제한될 수 있습니다.
	                </li>
	              </ul>
	            </div>
	          </div>
	          <div class="btn_wrap">
	          	<input type="submit">
	            <!-- <a href="javascript:formname.submit();">완료</a>-->
	          </div>
	        </div> <!-- form_txtInput E -->
	      </div><!-- content E-->
	    </div> <!-- container E -->
	</form>
</body>
</html>
/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.45
 * Generated at: 2021-06-13 14:59:25 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.homework;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class memberRegistForm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <title>Registration02.html</title>\r\n");
      out.write("    <!-- \r\n");
      out.write("        웹폰트 : https://fonts.google.com/\r\n");
      out.write("        jQuery UI : \r\n");
      out.write("     -->   \r\n");
      out.write("    <style>\r\n");
      out.write("        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');\r\n");
      out.write("        *{margin:0px auto; font-family: 'Noto Sans KR', sans-serif;}\r\n");
      out.write("        .AllWrap{padding:50px;}\r\n");
      out.write("        .wrap_regiform{border: 1px solid red; width: 720px; padding:5px 10px;}\r\n");
      out.write("        .wrap_regiform>p{text-align: right;}\r\n");
      out.write("        .wrap_regiform table{border-top: 2px solid #000000; border-left:1px solid silver; border-right:1px solid silver; border-bottom:1px solid silver; width:100%;}\r\n");
      out.write("        .wrap_regiform tr td:nth-child(1){border: 0px solid blue; font-weight: bold; font-size: 0.9em; padding:5px 0 5px 40px;}\r\n");
      out.write("        .wrap_regiform tr td:nth-child(1) span.red{color:red;}\r\n");
      out.write("        .wrap_regiform tr td:nth-child(2){border: 0px solid blue; font-size: 0.8em; padding:5px 0 5px 5px;}\r\n");
      out.write("        .wrap_regiform tr td:nth-child(2) .comment{ color: #777777;}\r\n");
      out.write("        .wrap_regiform tr td:nth-child(2) img.pick{ position: relative; top:11px; left:-4px; margin-top:-5px; width:33px;}\r\n");
      out.write("        .wrap_regiform tr td:nth-child(2) button{background-color: #333333; color:#ffffff; font-size: 1em; padding:5px; width:100px; border:2px solid #333333;}\r\n");
      out.write("        .wrap_regiform tr td:nth-child(2) button:hover{background-color: #727272; cursor:pointer;}\r\n");
      out.write("        .wrap_regiform tr td:nth-child(2) label{position: relative; height:20px; top:-2px; left:10px;}\r\n");
      out.write("        .wrap_regiform td input{padding:6px; border: 1px solid #cccccc;}\r\n");
      out.write("        .wrap_regiform td select{padding:5px; border: 1px solid #cccccc;}\r\n");
      out.write("        .w01{width:320px;}\r\n");
      out.write("        .w02{width:200px;}\r\n");
      out.write("        .w03{width:100px;}\r\n");
      out.write("        .w04{width:230px;}\r\n");
      out.write("        .w05{width:150px;}\r\n");
      out.write("        .w06{width:80px;}\r\n");
      out.write("        .s01{width:140px;}\r\n");
      out.write("        .s02{width:70px;}\r\n");
      out.write("    </style>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"/resources/demos/style.css\">\r\n");
      out.write("    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>\r\n");
      out.write("    <script src=\"https://code.jquery.com/ui/1.12.1/jquery-ui.js\"></script>\r\n");
      out.write("    <script>\r\n");
      out.write("    $( function() {\r\n");
      out.write("        //라디오를 버튼모양으로 바꿔주는 jQuery UI\r\n");
      out.write("        $(\"input[type=radio]\").checkboxradio({\r\n");
      out.write("            icon: false\r\n");
      out.write("        });\r\n");
      out.write("\r\n");
      out.write("        //날짜선택을 편리하게 - Date Picker\r\n");
      out.write("        $(\"#birthday\").datepicker({\r\n");
      out.write("            dateFormat : \"yy-mm-dd\"\r\n");
      out.write("        });    \r\n");
      out.write("    } );\r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("    //아이디 검증을 위한 전역변수\r\n");
      out.write("    var idObj;\r\n");
      out.write("    var idFlag;\r\n");
      out.write("    window.onload = function(){\r\n");
      out.write("        idObj = document.loginFrm.user_id;//아이디 객체\r\n");
      out.write("    }\r\n");
      out.write("\tfunction idCheck(fn){\r\n");
      out.write("\t\tif(!idCapsule()){\r\n");
      out.write("            idObj.value=\"\";\r\n");
      out.write("            idObj.focus();\r\n");
      out.write("            return;\r\n");
      out.write("        }\r\n");
      out.write("        if(fn.user_id.value==\"\"){\r\n");
      out.write("            alert(\"아이디를 입력후 중복확인을 해주세요.\");\r\n");
      out.write("            fn.user_id.focus();\t\t\r\n");
      out.write("        }\t\r\n");
      out.write("        else{\r\n");
      out.write("            fn.user_id.readOnly = true;\r\n");
      out.write("            window.open(\"./pages/id_overapping.jsp?id=\"+fn.user_id.value,\r\n");
      out.write("                    \"idover\", \"width=300,height=200\");\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("    function loginValdidate(fn){        \r\n");
      out.write("        //일반적인방법\r\n");
      out.write("        if(fn.user_id.value==\"\"){\r\n");
      out.write("            alert(\"아이디를 입력해주세요\");\r\n");
      out.write("\t\t\tfn.user_id.readOnly = false;\r\n");
      out.write("\t\t\tfn.user_id.focus();return false;\r\n");
      out.write("        } \r\n");
      out.write("        if(!idCapsule()){\r\n");
      out.write("            idObj.value=\"\";\r\n");
      out.write("            idObj.focus();\r\n");
      out.write("            return false;\r\n");
      out.write("        }\r\n");
      out.write("        var p1 = fn.pass1;\r\n");
      out.write("        var p2 = fn.pass2;\r\n");
      out.write("        if(p1.value==\"\"){alert(\"패스워드를 입력해주세요\");p1.focus();return false;}\r\n");
      out.write("\t    if(p2.value==\"\"){alert(\"패스워드확인을 입력해주세요\");p2.focus();return false;}\r\n");
      out.write("        if(isPassword(p1.value)==false){\r\n");
      out.write("            alert('패스워드는 숫자와 특수기호가 하나이상 포함되야합니다.');\r\n");
      out.write("\t\t\tp1.value=\"\";p2.value=\"\";p1.focus();\r\n");
      out.write("            return false;\r\n");
      out.write("        }\r\n");
      out.write("        if(p1.value!=p2.value){\r\n");
      out.write("            alert(\"패스워드가 틀립니다. 다시 입력해주세요\");\r\n");
      out.write("            p1.value=\"\";p2.value=\"\";p1.focus();\r\n");
      out.write("            return false;\r\n");
      out.write("        }        \r\n");
      out.write("        if(fn.name.value==\"\"){\r\n");
      out.write("            alert(\"이름을 입력해주세요\");fn.name.focus();return false;\r\n");
      out.write("        } \r\n");
      out.write("        //return false;\r\n");
      out.write("    }\r\n");
      out.write("    function isPassword(param){\r\n");
      out.write("        //숫자나 특수기호가 확인되면 true로 변경한다.\r\n");
      out.write("        var isNum = false, isSpec = false;\r\n");
      out.write("        //숫자가 포함되었는지 확인\r\n");
      out.write("        for(var i=0 ; i<param.length ; i++){\r\n");
      out.write("            if(param[i].charCodeAt(0)>=48 && param[i].charCodeAt(0)<=57){\r\n");
      out.write("                isNum = true;\r\n");
      out.write("                console.log(\"숫자포함됨\");\r\n");
      out.write("                break;\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("        for(var i=0 ; i<param.length ; i++){\r\n");
      out.write("            if((param[i].charCodeAt(0)>=33 && param[i].charCodeAt(0)<=47)\r\n");
      out.write("                || (param[i].charCodeAt(0)>=58 && param[i].charCodeAt(0)<=64)\r\n");
      out.write("                || (param[i].charCodeAt(0)>=91 && param[i].charCodeAt(0)<=96)){\r\n");
      out.write("                isSpec = true;\r\n");
      out.write("                console.log(\"특수기호포함됨\");\r\n");
      out.write("                break;\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("        if(isNum==true && isSpec==true)\r\n");
      out.write("            return true;\r\n");
      out.write("        else\r\n");
      out.write("            return false;\r\n");
      out.write("    }\r\n");
      out.write("    //아이디가 8~12자 사이가 아니면 false를 반환한다.\r\n");
      out.write("    var idLength = function(param){\t\r\n");
      out.write("        if(!(param.value.length>=8 && param.value.length<=12)){\t\t\r\n");
      out.write("            return false;\r\n");
      out.write("        }\r\n");
      out.write("        return true;\r\n");
      out.write("    }\r\n");
      out.write("    //아스키코드로 숫자인지 여부확인 : 숫자라면 true를 반환한다.\r\n");
      out.write("    function isNumber(param){\t\t\r\n");
      out.write("        for(var i=0 ; i<param.length ; i++){\r\n");
      out.write("            if(!(param[i].charCodeAt(0)>=48 && param[i].charCodeAt(0)<=57)){\r\n");
      out.write("                return false;\r\n");
      out.write("            }\t\t\r\n");
      out.write("        }\r\n");
      out.write("        return true;\r\n");
      out.write("    }\r\n");
      out.write("    //아이디의 첫문자는 숫자로 시작할수 없다\r\n");
      out.write("    var idStartAlpha = function(param){\t\r\n");
      out.write("        if(isNumber(param.value.substring(0,1))==true){\t\t\r\n");
      out.write("            return false;\r\n");
      out.write("        }\t\r\n");
      out.write("        return true;\r\n");
      out.write("    }\r\n");
      out.write("    //아스키코드로 숫자 or 알파벳인지 확인. 아니면 false반환\r\n");
      out.write("    function isAlphaNumber(param){\r\n");
      out.write("        for(var i=0 ; i<param.value.length ; i++){\t\t\t\r\n");
      out.write("            if(!((param.value[i].charCodeAt(0)>=97 && param.value[i].charCodeAt(0)<=122) \r\n");
      out.write("                    || (param.value[i].charCodeAt(0)>=65 && param.value[i].charCodeAt(0)<=90)\r\n");
      out.write("                    || (param.value[i].charCodeAt(0)>=48 && param.value[i].charCodeAt(0)<=57))){\r\n");
      out.write("                return false;\t\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("        return true;\r\n");
      out.write("    }\r\n");
      out.write("    //아이디검증 로직을 하나로 묶는다.\r\n");
      out.write("    function idCapsule(){        \r\n");
      out.write("        //1.아이디는 8~12자 이내여야 한다. 즉 7자를 쓰거나 13자를 쓰면 잘못된 아이디로 판단하고 재입력을 요구한다.\r\n");
      out.write("        if(!idLength(idObj)){\r\n");
      out.write("            alert('아이디는 8~12자만 가능합니다.');\r\n");
      out.write("            return false;\r\n");
      out.write("        }        \r\n");
      out.write("        //2.아이디는 반드시 영문으로 시작해야 한다. 만약 숫자로 시작하면 잘못된 아이디로 판단한다.\r\n");
      out.write("        if(!idStartAlpha(idObj)){\r\n");
      out.write("            alert(\"아이디는 숫자로 시작할수 없습니다.\");\r\n");
      out.write("            return false;\r\n");
      out.write("        }\t\r\n");
      out.write("        //3.영문과 숫자의 조합으로만 구성해야 한다. 특수기호가 들어가거나 한글이 들어갈 경우 잘못된 아이디로 판단한다.\r\n");
      out.write("        if(!isAlphaNumber(idObj)){\r\n");
      out.write("            alert(\"아이디는 영문과 숫자만 포함할수 있습니다.\");\r\n");
      out.write("            return false;\r\n");
      out.write("        }        \r\n");
      out.write("        return true;\r\n");
      out.write("    }\r\n");
      out.write("\tfunction inputEmail(frm){\t\t\r\n");
      out.write("\t\tif (frm.email_domain.value=='1') {\r\n");
      out.write("            /*\r\n");
      out.write("            select에서 직접입력을 선택하면\r\n");
      out.write("            readonly속성을 비활성화하고, 입력된 내용을 비워준다. \r\n");
      out.write("            */\r\n");
      out.write("\t\t\tfrm.email2.readOnly = false;\r\n");
      out.write("\t\t\tfrm.email2.value = '';\r\n");
      out.write("\t\t\tfrm.email2.focus();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\telse {\r\n");
      out.write("            /*\r\n");
      out.write("            특정 도메인을 선택하면\r\n");
      out.write("            선택한 도메인을 입력하고, readonly속성은 활성화한다.\r\n");
      out.write("            */\r\n");
      out.write("\t\t\tfrm.email2.readOnly = true;\r\n");
      out.write("\t\t\tfrm.email2.value = frm.email_domain.value;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction commonFocusMove(obj, mLength, next_obj){        \r\n");
      out.write("        var strLength = obj.value.length;        \r\n");
      out.write("        if(strLength>=mLength){\r\n");
      out.write("            eval(\"document.loginFrm.\"+next_obj+\".focus()\");\r\n");
      out.write("        }        \r\n");
      out.write("    } \r\n");
      out.write("    </script>\r\n");
      out.write("\r\n");
      out.write("    <script src=\"//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js\"></script>\r\n");
      out.write("    <script>\r\n");
      out.write("    function zipcodeFind(){\r\n");
      out.write("        new daum.Postcode({\r\n");
      out.write("            oncomplete: function(data) {\r\n");
      out.write("                //DAUM 우편번호API가 전달해주는 값을 콘솔에 출력\r\n");
      out.write("                console.log(\"zonecode\", data.zonecode);\r\n");
      out.write("                console.log(\"address\", data.address);\r\n");
      out.write("                //회원 가입폼에 적용\r\n");
      out.write("                var f = document.loginFrm;//<form>태그의 DOM객체를 변수에 저장\r\n");
      out.write("                f.zipcode.value = data.zonecode;\r\n");
      out.write("                f.address1.value = data.address;\r\n");
      out.write("                f.address2.focus();\r\n");
      out.write("            }\r\n");
      out.write("        }).open();\r\n");
      out.write("    }\r\n");
      out.write("    </script>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("<form action=\"registProcess.jsp\" method=\"post\" name=\"loginFrm\" onsubmit=\"return loginValdidate(this)\">\r\n");
      out.write("<div class=\"AllWrap\">\r\n");
      out.write("    <div class=\"wrap_regiform\">\r\n");
      out.write("        <p>*필수입력사항</p>\r\n");
      out.write("        <table class=\"regi_table\">\r\n");
      out.write("            <colgroup>\r\n");
      out.write("                <col width=\"180px\">\r\n");
      out.write("                <col width=\"*\">\r\n");
      out.write("            </colgroup>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td><span class=\"red\">*</span> 아이디</td>\r\n");
      out.write("                <td>\r\n");
      out.write("                    <input type=\"text\" class=\"w01\" name=\"user_id\" value=\"nakjasabal\" />       \r\n");
      out.write("                    <button type=\"button\" onclick=\"idCheck(this.form);\">중복확인</button>             \r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td></td>\r\n");
      out.write("                <td>\r\n");
      out.write("                    <span class=\"comment\">※ 3~15자의 영문과 숫자만 가능합니다.</span>                \r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td><span class=\"red\">*</span> 비밀번호</td>\r\n");
      out.write("                <td>\r\n");
      out.write("                    <input type=\"text\" class=\"w01\" name=\"pass1\" value=\"ab1!\" />                   \r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td></td>\r\n");
      out.write("                <td>\r\n");
      out.write("                    <span class=\"comment\">\r\n");
      out.write("                        ※ 영문/숫자/특수문자 조합 6~20자 이상 입력해주세요. (아이디/전화번호 사용불가)<br>\r\n");
      out.write("                        ※ 1234** 비밀번호는 홈페이지 사용에 제한됩니다.\r\n");
      out.write("                    </span>\r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td><span class=\"red\">*</span> 비밀번호확인</td>\r\n");
      out.write("                <td>\r\n");
      out.write("                    <input type=\"text\" class=\"w01\" name=\"pass2\" value=\"ab1!\" />\r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td><span class=\"red\">*</span> 이름</td>\r\n");
      out.write("                <td>\r\n");
      out.write("                    <input type=\"text\" class=\"w01\" name=\"name\" value=\"성낙현\" />\r\n");
      out.write("                    \r\n");
      out.write("                    <label for=\"radio-1\">남</label>\r\n");
      out.write("                    <input type=\"radio\" name=\"gender\" id=\"radio-1\" value=\"남\" checked>\r\n");
      out.write("                    <label for=\"radio-2\">여</label>\r\n");
      out.write("                    <input type=\"radio\" name=\"gender\" id=\"radio-2\" value=\"여\">\r\n");
      out.write("                    \r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td><span class=\"red\">*</span> 생년월일</td>\r\n");
      out.write("                <td style=\"padding: 0px 0 5px 5px;\">\r\n");
      out.write("                    <input type=\"text\" class=\"w02\" name=\"birthday\" id=\"birthday\" value=\"2021-11-11\" />\r\n");
      out.write("                    <img src=\"./images/pick.jpg\" alt=\"\" class=\"pick\" />\r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td><span class=\"red\">*</span> 주소</td>\r\n");
      out.write("                <td>\r\n");
      out.write("                    <input type=\"text\" class=\"w03\" name=\"zipcode\" value=\"12345\" />\r\n");
      out.write("                    <button type=\"button\" onclick=\"zipcodeFind();\">우편번호찾기</button> \r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td></td>\r\n");
      out.write("                <td>\r\n");
      out.write("                    <input type=\"text\" class=\"w04\" name=\"address1\" value=\"서울시 구로구 고척로49\" />                \r\n");
      out.write("                    <input type=\"text\" class=\"w04\" name=\"address2\" value=\"동부골든아파트\" />\r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td><span class=\"red\">*</span> 이메일</td>\r\n");
      out.write("                <td>\r\n");
      out.write("                    <input type=\"text\" class=\"w05\" name=\"email1\" value=\"nakjasabal\" />\r\n");
      out.write("                    @\r\n");
      out.write("                    <input type=\"text\" class=\"w05\" name=\"email2\" value=\"naver.com\" />\r\n");
      out.write("                    <select name=\"email_domain\" class=\"s01\" onchange=\"inputEmail(this.form);\">\r\n");
      out.write("                        <option value=\"1\">직접입력</option>\r\n");
      out.write("                        <option value=\"naver.com\">naver.com</option>\r\n");
      out.write("                        <option value=\"hanmail.net\">hanmail.net</option>\r\n");
      out.write("                        <option value=\"gmail.com\">gmail.com</option>\r\n");
      out.write("                    </select>\r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td><span class=\"red\">*</span> 휴대폰번호</td>\r\n");
      out.write("                <td>\r\n");
      out.write("                    <select name=\"mobile1\" class=\"s02\" onchange=\"commonFocusMove(this, 3, 'mobile2');\">\r\n");
      out.write("                        <option value=\"\"></option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"010\" selected>010</option>\r\n");
      out.write("                        <option value=\"011\">011</option>\r\n");
      out.write("                        <option value=\"016\">016</option>\r\n");
      out.write("                        <option value=\"017\">017</option>\r\n");
      out.write("                        <option value=\"018\">018</option>\r\n");
      out.write("                        <option value=\"019\">019</option>\r\n");
      out.write("                    </select>\r\n");
      out.write("                    -\r\n");
      out.write("                    <input type=\"text\" class=\"w06\" name=\"mobile2\" maxlength=\"4\" \r\n");
      out.write("                        value=\"7906\" onkeyup=\"commonFocusMove(this, 4, 'mobile3');\" />\r\n");
      out.write("                    -\r\n");
      out.write("                    <input type=\"text\" class=\"w06\" name=\"mobile3\" maxlength=\"4\" \r\n");
      out.write("                        value=\"3600\" onkeyup=\"commonFocusMove(this, 4, 'tel1');\" />\r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td>전화번호</td>\r\n");
      out.write("                <td>\r\n");
      out.write("                    <select name=\"tel1\" class=\"s02\" onchange=\"commonFocusMove(this, 3, 'tel2');\">\r\n");
      out.write("                        <option value=\"\"></option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"02\" selected>02</option>                        \r\n");
      out.write("                        <option value=\"031\">031</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"032\">032</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"033\">033</option>\r\n");
      out.write("                    </select>\r\n");
      out.write("                    -\r\n");
      out.write("                    <input type=\"text\" class=\"w06\" name=\"tel2\" maxlength=\"4\" value=\"1234\" onkeyup=\"commonFocusMove(this, 4, 'tel3');\" />\r\n");
      out.write("                    -\r\n");
      out.write("                    <input type=\"text\" class=\"w06\" name=\"tel3\" maxlength=\"4\" value=\"5678\" />\r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("        </table>\r\n");
      out.write("        <div style=\"text-align: center; margin-top:10px;\">\r\n");
      out.write("            <input type=\"submit\" value=\"회원가입\">\r\n");
      out.write("            <input type=\"reset\" value=\"작성내용리셋\">\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("</form>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

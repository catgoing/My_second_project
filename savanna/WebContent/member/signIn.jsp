<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/savanna/js/bootstrap.js"></script>

<!-- Bootstrap core CSS -->
<link href="/savanna/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/savanna/css/savanna.css" rel="stylesheet">
<link href="/savanna/css/member.css" rel="stylesheet">
<title>로그인</title>
<script>
	function idInquiry(){
		location.href = "inquiryId.jsp";
	}
	
	function qwdInquiry(){
		location.href = "inquiryPwd.jsp";
	}
</script>
</head>
<body>
	<%@ include file="/common/menu.jspf" %>
	
	
<h1>로그인</h1>

	    <form action="/savanna/controller?type=doSignIn" method="post" name="fr">
	    
          <div id="wrapper">
            <!-- content-->
            <div id="content">
            
                <!-- ID -->
                <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id" style="margin-bottom: 40px">
                        <input type="text" id="id" name="id" class="int" maxlength="12">
                        <span id="alertTxt">사용불가</span>
                    </span>
                    <span id="id_check"></span>
                </div>

                <!-- PW -->
                <div>
                    <h3 class="join_title"><label for="pw">비밀번호</label></h3>
                    <span class="box int_pass" style="margin-bottom: 60px">
                        <input type="password" id="pw" name="pwd" class="int" maxlength="12">
                    </span>
                    <span id="check1"></span>
                </div>
                
                <!-- SIGNIN BTN-->
                <div class="btn_area" style="margin: 20px 0 0 0">
                  <button type="submit" id="signinbtn" style="margin: 0">
                      <span>로그인</span>
                  </button>
                </div>
           		<div class="btn_area">
                <button type="button" id="idinquirybtn" style="margin: 0" onclick="idInquiry()">
                      <span>아이디 찾기</span>
                </button>
                <button type="button" id="qwdinquirybtn" style="margin: 0" onclick="qwdInquiry()">
                      <span>패스워드 찾기</span>
                </button>
                </div>
                
              </div>
            </div>
           </form>


</body>
</html>
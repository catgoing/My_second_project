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
<title>패스워드 찾기</title>
<style>
footer {
   width:100%;
   position:absolute;
   bottom:0;
}
</style>
</head>
<body>
	<%@ include file="/common/menu.jspf" %>
<h1>패스워드 찾기</h1>
<form action="/savanna/controller?type=inquiryPwd" method="post">
          <div id="wrapper">
            <!-- content-->
            <div id="content">
            
                <!-- 아이디 -->
                <div>
                    <h3 class="join_title"><label for="id">아이디</label></h3>
                    <span class="box int_signid">
                        <input type="text" id="id" name="id" class="int" maxlength="12">
                    </span>
                </div>
                <br>
                
                <!-- 이름 -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_signname">
                        <input type="text" id="name" name="name" class="int" maxlength="12">
                    </span>
                </div>

                
                <!-- SIGNIN BTN-->
                <div class="btn_area" style="margin: 20px 0 0 0">
                  <button type="submit" id="signinbtn" style="margin: 0">
                      <span>확인</span>
                  </button>
                </div>
              </div>
            </div>
           </form>
	<%@ include file="/common/foot.jspf" %>
</body>
</html>
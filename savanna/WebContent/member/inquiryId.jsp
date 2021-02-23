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
<title>아이디 찾기</title>
</head>
<body>
	<%@ include file="/common/menu.jspf" %>
<h1>아이디 찾기</h1>
<form action="/savanna/controller?type=inquiryId" method="post">
          <div id="wrapper">
            <!-- content-->
            <div id="content">
                
                <!-- 이름 -->
                <div>
                    <h3 class="join_title">
                        <label for="id">이름</label>
                    </h3>
                    <span class="box int_signid">
                        <input type="text" id="id" name="name" class="int" maxlength="12">
                    </span>
                </div>

                <!-- 휴대전화 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">휴대전화</label></h3>
                    <span class="box int_signpass">
                        <input type="text" id="pswd1" name="phone" class="int" maxlength="12">
                    </span>
                </div>
                <br>
                
                <!-- SIGNIN BTN-->
                <div class="btn_area" style="margin: 20px 0 0 0">
                  <button type="submit" id="signinbtn" style="margin: 0">
                      <span>확인</span>
                  </button>
                </div>
              </div>
            </div>
           </form>


</body>
</html>
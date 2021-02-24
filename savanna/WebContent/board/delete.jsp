<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
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
<title>리뷰 삭제(패스워드 확인)</title> 
</head>
<script>
	function reviewDelete_go(frm) {
		if (frm.pwd.value == "${user.pwd}") { //암호 일치
			var isDelete = confirm("정말 삭제할까요?");
			if (isDelete) {
				frm.submit();
			} else {
				history.back();
			}
		} else {
			alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
			frm.pwd.value = "";
			frm.pwd.focus();
		}
	}

</script>
<%@ include file="/common/menu.jspf" %>
<body>
	<form action="../controller?type=reviewDelete" method="post" name="fr">
		<h1>패스워드 확인</h1>
	    <div id="wrapper">
           <!-- content-->
           <div id="content">
               <!-- PW -->
               <div>
                   <h3 class="join_title"><label for="pw">회원 비밀번호를 입력하세요</label></h3>
                    <span class="box int_pass" style="margin-bottom: 20px">
                        <input type="password" id="pwdchk" name="pwd" class="int" maxlength="12">
                    </span>
                    <span id="error"></span>
                    <hr>
                <!-- OKBTN-->
                <div class="btn_area" style="margin: 20px 0 0 0">
                  <button type="button" id="okbtn" style="margin: 0" onclick="reviewDelete_go(this.form)">
                      <span>확인</span>
                  </button>
                  <input type="hidden" id="rev_no" name="rev_no" value="${rvo.rev_no }">
              </div>
                </div>
        	</div>
        </div>
    </form>		

		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
</body>
</html>










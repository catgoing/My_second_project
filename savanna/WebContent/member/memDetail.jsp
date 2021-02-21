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
<title>회원정보</title>
</head>
<script>

	var sel_accept = '${vo.sel_accept }';
	
	$(function (){
		if( sel_accept == 'on'){
			$("input[type=checkbox]").prop("checked",true);
		}
	});
	
	function withdrawal(frm){
		frm.action = "/savanna/controller?type=adminWithdrawal";
		frm.submit();
	}
	
	function goList(){
		location.href = "/savanna/controller?type=memList"
	}

</script>
<body>
	<%@ include file="/common/menu.jspf" %>
	<h1>회원정보</h1>

       <!-- GO LIST BTN-->
      <div class="btn_area" style="margin: 20px 0 0 0">
        <button type="button" id="signinbtn" style="margin: 0" onclick="goList()">
            <span>목록으로</span>
        </button>
      </div>
	
	<form action="controller?type=adminUpdate" method="post" id="fr_info">
	
	<div id="wrapper">
            <!-- content-->
            <div id="content">
            
                <!-- MEMBER.NO -->
                <div>
                    <h3 class="join_title"><label for="mem_no">회원번호</label></h3>
                    <span class="box int_mem_no">
                        <input type="text" id="mem_no" name="mem_no" class="int" readonly  value="${vo.mem_no }" maxlength="20">
                    </span>
                </div>
                
                <!-- ID -->
                <div>
                    <h3 class="join_title"><label for="id">아이디</label></h3>
                    <span class="box int_id">
                        <input type="text" id="id" name="id" class="int" readonly value="${vo.id }" maxlength="20">
                    </span>
                </div>
                
                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="name" name="name" class="int" value="${vo.name }" maxlength="20">
                    </span>
                    <span class="error_next_box"></span>
                </div>
            
                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pw">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="text" id="pw" name="pwd" class="int" maxlength="12" value="${vo.pwd }" onchange="check_pw()">
                        <span id="alertTxtpw">사용불가</span>
                    </span>
                    <span id="check1"></span>
                </div>
 
                <!-- PHONE -->
                <div>
                  <h3 class="join_title"><label for="phone">휴대전화</label></h3>
                  <span class="box int_phone">
                      <input type="text" id="phone" name="phone" class="int" value="${vo.phone }" maxlength="13">
                  </span>
                  <span class="error_next_box"></span>
                 </div>

                <!-- EMIAL -->
                <div>
                  <h3 class="join_title"><label for="email">이메일</label></h3>
                  <span class="box int_email">
                      <input type="email" id="email" name="email" class="int" value="${vo.email }" maxlength="20">
                  </span>
                  <span class="error_next_box"></span>
                 </div>

                <!-- ADDRESS -->
                <div>
                  <h3 class="join_title"><label for="addr">주소</label></h3>
                  <span class="box int_addr">
                      <input type="text" id="addr" name="addr" class="int" value="${vo.addr }" maxlength="50">
                  </span>
                  <span class="error_next_box"></span>
                 </div>
                 
                <!-- REGDATE -->
                <div>
                  <h3 class="join_title"><label for="regdate">가입일</label></h3>
                  <span class="box int_regdate">
                      <input type="text" id="regdate" name="regdate" class="int" readonly value="${vo.regdate }" maxlength="50">
                  </span>
                  <span class="error_next_box"></span>
                 </div>
                 
                 <br>
                 
                <!-- SELECTIVE AGREEMENT --> 
                <div>
                  <span class="join_title"><label for="regdate">선택약관 동의</label></span>
                 <input type="checkbox" name=sel_accept id="sel_accept">
                </div>
                 
                <!-- UPDATE BTN-->
                <div class="btn_area">
                <button type="submit" id="updatebtn" style="width: 49%; margin-bottom: 0;">
                      <span>수정</span>
                </button>              
                <button type="button" id="withdrawalbtn" style="width: 49%;  margin-bottom: 0;" onclick="withdrawal(this.form)">
                      <span>탈퇴</span>
                </button>
                </div>
                

                <br><br><br>
                
              </div>
            </div>
	</form>
</body>
</html>
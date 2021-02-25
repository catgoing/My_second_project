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
<link href="/savanna/css/sidebar.css" rel="stylesheet">
<title>내정보</title>
<style>
footer {
   width:100%;
   position:relative;
   bottom:0;
}

#wrapper{
	height: 1000px;
}

</style>
</head>
<script>
	var sel_accept = '${user.sel_accept }';
	
	$(function (){
		if( sel_accept == 'on'){
			$("input[type=checkbox]").prop("checked",true);
		}
	});
	
	 var check_SC = 0;
     var check_length = 0;
     var phone_result = 1;
     var phone_length = 0;
     var phone_isNumber = 0;
     var pw = null; 
     var pw2 = null;
     var SC = ["!","@","#","$","%", "^", "&", "*", "(", ")", "-", "=", "'\'", "/", "+", "."];
     
     
     $(function(){
 		$('#pw2').keyup(function(){
 			
 			pw2 = document.getElementById('pw2').value;
 			if(pw !='' && pw2 !=''){
 	              if(pw == pw2){
 	                  document.getElementById('check2').innerHTML='비밀번호가 일치합니다'
 	                  document.getElementById('check2').style.color='blue';
 	              }
 	              else{
 	                  document.getElementById('check2').innerHTML='비밀번호가 일치하지 않습니다';
 	                  document.getElementById('check2').style.color='red';
 	              }
 	          }
     	 });
      });
     
     
     $(function(){
    	 $('#pw').keyup(function(){
    		 
    		 pw = document.getElementById('pw').value;
    		 
    		 for(var i=0;i<SC.length;i++){
                 if(pw.indexOf(SC[i]) != -1){
                     check_SC = 1;
                 }
             }
       
             if(check_SC == 0){
           	  document.getElementById('check1').innerHTML='특수문자를 하나 이상 포함해야 합니다';
                 document.getElementById('check1').style.color='red';
                 document.getElementById('alertTxtpw').style.display="inline";
             }
             
             if(pw.length < 4 || pw.length > 12){
                 document.getElementById('check1').innerHTML='비밀번호는 4~12글자만 가능합니다';
                 document.getElementById('check1').style.color='red';
                 document.getElementById('alertTxtpw').style.display="inline";
             } else check_length = 1;
             
             if(check_SC == 1 && check_length == 1){
           	  document.getElementById('check1').innerHTML='';
           	  document.getElementById('alertTxtpw').style.display="none";
             }
    	 });
    		 
     });
     
     

	
	function withdrawal(){
		location.href = "/savanna/member/withdrawal.jsp"
	}
	
	
	
	$(function(){ // 휴대전화번호 체크
		
		var userPhoneCheck = RegExp(/^[0-9]{10,11}$/);
		var phone = document.getElementById('phone').value;
		
		$('#phone').keyup(function(){
			
			phone_isNumber = 0;
			phone_length = 0;
			
			phone = document.getElementById('phone').value;
			
			if(!userPhoneCheck.test($('#phone').val())){
				phone_isNumber = 1;
				document.getElementById('phone_check').innerHTML=
					'휴대전화는 숫자만 입력이 가능합니다';
				document.getElementById('phone_check').style.color='red';

			} else phone_isNumber = 0;
			
			if(phone.length < 10 ){
				phone_length = 1;
				document.getElementById('phone_check').innerHTML=
					'올바르지 않은 번호입니다';
				document.getElementById('phone_check').style.color='red';
			} else phone_length = 0;

			if(phone_length == 0 && phone_isNumber == 0) {
				phone_result = 0;
				document.getElementById('phone_check').innerHTML='';
			}

			
		});	
	}
	);
	
	
	  function null_check(){
			if(document.getElementById('id').value == "" || id_result != 0){
				alert("아이디를 확인해주세요");
				fr.id.focus();
				return false;
			} else if(document.getElementById('pw').value == ""){
				alert("패스워드를 입력해주세요");
				fr.pw.focus();
				return false;
			} else if(document.getElementById('pw2').value == ""){
				alert("패스워드를 입력해주세요");
				fr.pw2.focus();
				return false;
			} else if(document.getElementById('name').value == ""){
				alert("이름을 입력해주세요");
				fr.name.focus();
				return false;
			} else if(document.getElementById('phone').value == "" || phone_result == 1){
				alert("올바른 휴대전화번호를 입력해주세요");
				fr.phone.focus();
				return false;
			} else if(document.getElementById('email').value == ""){
				alert("이메일을 입력해주세요");
				fr.email.focus();
				return false;
			} else if(document.getElementById('addr').value == ""){
				alert("주소를 입력해주세요");
				fr.addr.focus();
				return false;
			} else if(pw != pw2) {
				alert("패스워드가 일치하지 않습니다");
				fr.pw2.focus();
				return false;
			} else if(check_SC == 0 || check_length == 0){
				alert("패스워드를 확인해주세요");
				fr.pw.focus();
				return false;
			}
			
			else return true;
			
			}

</script>
<body>
	<%@ include file="/common/menu.jspf" %>
	<%@ include file="/common/memberSidebar.jspf" %>
	
	<br>	
	<h1 style="margin-right:0;">내정보</h1>
	<br>
	
	<form action="/savanna/controller?type=update" method="post" id="fr_info" name="fr" onsubmit="return null_check()">
       <div id="wrapper">
            <!-- content-->
            <div id="content">
            
                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="name" name="name" class="int" value="${user.name }" maxlength="20">
                    </span>
                    <span class="error_next_box"></span>
                </div>
            
                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pw">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" id="pw" name="pwd" class="int" maxlength="12" value="${user.pwd }" onchange="check_pw()">
                        <span id="alertTxtpw">사용불가</span>
                    </span>
                    <span id="check1"></span>
                </div>
                
                
                <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pw">비밀번호 확인</label></h3>
                    <span class="box int_pass">
                        <input type="password" id="pw2" class="int" maxlength="12" onchange="check_pw()">
                        <span id="alertTxtpw">사용불가</span>
                    </span>
                    <span id="check2"></span>
                </div>


                <!-- PHONE -->
                <div>
                  <h3 class="join_title"><label for="phone">휴대전화</label></h3>
                  <span class="box int_phone">
                      <input type="text" id="phone" name="phone" class="int" value="${user.phone }" maxlength="11" placeholder="숫자만 입력">
                  </span>
                  <span class="error_next_box"></span>
                  <span id="phone_check"></span>
                 </div>

                <!-- EMIAL -->
                <div>
                  <h3 class="join_title"><label for="email">이메일</label></h3>
                  <span class="box int_email">
                      <input type="email" id="email" name="email" class="int" value="${user.email }" maxlength="20">
                  </span>
                  <span class="error_next_box"></span>
                 </div>

                <!-- ADDRESS -->
                <div>
                  <h3 class="join_title"><label for="addr">주소</label></h3>
                  <span class="box int_addr">
                      <input type="text" id="addr" name="addr" class="int" value="${user.addr }" maxlength="50">
                  </span>
                  <span class="error_next_box"></span>
                 </div>
                 
                <!-- REGDATE -->
                <div>
                  <h3 class="join_title"><label for="regdate">가입일</label></h3>
                  <span class="box int_regdate">
                      <input type="text" id="regdate" name="regdate" class="int" readonly value="${user.regdate }" maxlength="50">
                  </span>
                  <span class="error_next_box"></span>
                 </div>
                 
                 <br>
                 
                <!-- SELECTIVE AGREEMENT --> 
                <div>
                  <span class="join_title"><label for="regdate">선택약관 동의</label></span>
                 <input type="checkbox" name=sel_accept id="sel_accept">
                </div>
                <br>
                 
                <!-- UPDATE BTN-->
                <div class="btn_area">
                <input type="hidden" name="mem_no" value="${user.mem_no }">
                <input type="hidden" name="id" value="${user.id }">
                <button type="submit" id="updatebtn">
                      <span>수정하기</span>
                </button>
                <br><br><br>                

                <button type="button" id="withdrawalbtn" onclick="withdrawal()">
                      <span>탈퇴하기</span>
                </button>
                </div>
                
              </div>
            </div>
          </form>
          
	<%@ include file="/common/foot.jspf" %>
</body>
</html>
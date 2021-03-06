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
<link href="/savanna/css/sidebar.css" rel="stylesheet">
<title>패스워드 확인</title> 
<style>
footer {
   width:100%;
   position: relative;
   bottom:0;
}
</style>
</head>
<script>

var id = '${user.id }';

$(function (){
	
	$("#okbtn").click(function(){
		
		var pwdchk = $('#pwdchk').val();
		
		$.ajax({
			url : '/savanna/controller?type=doPwdCheck&id=' + id + '&pwd=' + pwdchk,
			type : 'get',
			success : function(data){
				console.log(data);
				if(data == 0){
					document.getElementById('error').innerHTML=
						'패스워드가 일치하지 않습니다';
					 document.getElementById('error').style.color='red';
					 
				} else location.href = "/savanna/controller?type=myInfo";
				
			}
		})
    });

})


	
</script>
<body>
	<%@ include file="/common/menu.jspf" %>
	<%@ include file="/common/memberSidebar.jspf" %>
	<br>
	
	
<h1 style="margin-right:0;">패스워드 확인</h1>

	    <form name="fr">
	    
          <div id="wrapper" style="height:500px">
            <!-- content-->
            <div id="content">

                <!-- PW -->
                <div>
                    <h3 class="join_title"><label for="pw">비밀번호</label></h3>
                    <span class="box int_signpass" style="margin-bottom: 20px">
                        <input type="password" id="pwdchk" name="pwd" class="int" maxlength="12">
                    </span>
                    <span id="error"></span>
                </div>
                <br>
                
                <!-- OKBTN-->
                <div class="btn_area" style="margin: 20px 0 0 0">
                  <button type="button" id="okbtn" style="margin: 0">
                      <span>확인</span>
                  </button>
                
              </div>
            </div>
            </div>
           </form>


	<%@ include file="/common/foot.jspf" %>
</body>
</html>
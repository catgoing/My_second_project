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
<script type="text/javascript" src="js/bootstrap.js"></script>

<!-- Bootstrap core CSS -->
<link href="/savanna/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/savanna/css/savanna.css" rel="stylesheet">
<title>패스워드 확인</title> 
</head>
<script>

var id = '${user.id }';

$(function (){
	
	
	$("#btn").click(function(){
		
		var pwdchk = $('#pwdchk').val();
		
		$.ajax({
			url : '/savanna/controller?type=doPwdCheck?id=' + id + '&pwd=' + pwdchk,
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
<h1>패스워드 확인</h1>

<form name="fr">
	<p>패스워드를 입력해주세요</p>
	<input type="password" id="pwdchk">
	<input type="button" id="btn" value="확인">
	<p id="error"></p>
</form>


</body>
</html>
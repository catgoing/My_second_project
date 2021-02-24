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
<title>회원가입</title>
<link href="/savanna/css/savanna.css" rel="stylesheet">
<link href="/savanna/css/member.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>

	$(function (){
		$('#id_allchk').click(function(){
			if($("#id_allchk").prop("checked")) { // 전체선택이 체크됐을 때
				$("input[type=checkbox]").prop("checked",true); // 전체 checkbox들을 체크 
				} else { // 전체선택 체크박스가 해제된 경우 
					$("input[type=checkbox]").prop("checked",false); // 모든 checkbox들의 체크를 해제
				}
		});
	});
	
	$(function (){
		$('#accept').click(function(){
			if($('#sel_accept').prop("checked") && $('#accept').prop("checked")) { // 전체선택이 체크됐을 때
				$('#id_allchk').prop("checked",true); // 전체 checkbox들을 체크 
				} else { // 전체선택 체크박스가 해제된 경우 
					$('#id_allchk').prop("checked",false); // 모든 checkbox들의 체크를 해제
				}
		});
	});
	
	$(function (){
		$('#sel_accept').click(function(){
			if($('#accept').prop("checked") && $('#sel_accept').prop("checked") ) { // 전체선택이 체크됐을 때
				$('#id_allchk').prop("checked",true); // 전체 checkbox들을 체크 
				} else { // 전체선택 체크박스가 해제된 경우 
					$('#id_allchk').prop("checked",false); // 모든 checkbox들의 체크를 해제
				}
		});
	});
	
	function acceptCheck(){
		let accept = document.frm.accept;
		
		 if (accept.checked == false) {
             alert("필수 약관에 동의해야 합니다.");
             return false; //서버전송 취소
         }
	}
			
		
</script>
</head>
<body>
	<%@ include file="/common/menu.jspf" %>


<h1 style="text-align:center;">이용약관</h1>


   <form name="frm" action="signUp.jsp" method="get" onsubmit="return acceptCheck()">
        <p align="center">
            <input type="checkbox" name="allCheck" id="id_allchk">
            <label for="id_allchk">전체(필수, 선택포함) 약관에 동의합니다</label>
        </p>
        <p align="center">이용약관(필수)</p>
        <fieldset style="width:500px; margin:auto;">
        <div id="terms" name="txt" >
	            저희 SAVANNA 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 서비스의 이용과 관련하여 이를 이용하는 회원(이하 ‘회원’) 또는 
	            비회원과의 관계를 설명하며, 아울러 여러분의 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
        </div>
        <p>
            <input type="checkbox" name="accept" id="accept">
            <label for="accept">(필수)약관에 동의합니다.</label>
        </p>
        </fieldset>
                <p align="center">
            <input type="checkbox" name="sel_accept" id="sel_accept">
            <label for="sel_accept">(선택)프로모션 제공에 동의합니다.</label>
        </p>
        <br>
        
        <div class="btn_area" style="width:500px; margin:auto;" >
           <button type="submit" id="btnJoin">
                <span>확인</span>
           </button>
        </div>

    </form>
	<hr>
	<%@ include file="/common/foot.jspf" %>
</body>
</html>
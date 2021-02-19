<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>

	$(function (){
		$('#id_allchk').click(function(){
			if($("#id_allchk").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다 
				$("input[type=checkbox]").prop("checked",true); // 전체선택 체크박스가 해제된 경우 
				} else { //해당화면에 모든 checkbox들의 체크를해제시킨다. 
					$("input[type=checkbox]").prop("checked",false); 
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


<h1>이용약관</h1>

   <form name="frm" action="signUp.jsp" method="get" onsubmit="return acceptCheck()">
        <p>
            <input type="checkbox" name="allCheck" id="id_allchk">
            <label for="id_allchk">전체(필수, 선택포함) 약관에 동의합니다</label>
        </p>
        <p>이용약관(필수)</p>
        <fieldset>
        <div id="terms" name="txt" width="500px">
	            저희 SAVANNA 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 서비스의 이용과 관련하여 이를 이용하는 회원(이하 ‘회원’) 또는 
	            비회원과의 관계를 설명하며, 아울러 여러분의 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
        </div>
        <p>
            <input type="checkbox" name="accept" id="accept">
            <label for="accept">(필수)약관에 동의합니다.</label>
        </p>
        </fieldset>
                <p>
            <input type="checkbox" name="sel_accept" id="sel_accept">
            <label for="sel_accept">(선택)프로모션 제공에 동의합니다.</label>
        </p>
        <input type="submit" value="등록">
    </form>

</body>
</html>
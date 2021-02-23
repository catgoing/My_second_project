<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드결제</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
	table { width:350px; }

</style>
</head>
<script>
	// 입력하고 다음 입력폼으로 커서 옮기기
	$(function(){ 
		$('.cardinfo1').keyup (function(){
			var maxlen = $(this).attr("maxlength");
			console.log(maxlen);
			if(this.value.length >= maxlen){
				console.log("dd"+maxlen);
				$(this).next('.cardinfo1').focus();
				return false;
			}
		});
		$('.cardinfo2').keyup (function(){
			var maxlen = $(this).attr("maxlength");
			console.log(maxlen);
			if(this.value.length >= maxlen){
				console.log("dd"+maxlen);
				$(this).next('.cardinfo2').focus();
				return false;
			}
		});
	});
	
	function creditcardpay_proc(frm){
		var querytext = $("input.cardinfo1").val();
		if (querytext == "") {
			alert('카드번호를 입력하세요.');
		    $("input.cardinfo1").focus(); 
		    return false;
		}
		var querytext = $("input.cardinfo2").val();
		if (querytext == "") {
			alert('유효기간이 빈칸입니다.');
		    $("input.cardinfo2").focus(); 
		    return false;
		}
		var querytext = $("input.cardinfo3").val();
		if (querytext == "") {
			alert('CVC번호는 필수 입력항목입니다.');
		    $("input.cardinfo3").focus(); 
		    return false;
		}
		
		opener.parent.location = "/savanna/controller?type=payCreditCard";
		frm.method = "post";
		$("#inputcardinfo").val().submit();
		window.close("childPage");

	}
	function cancel(){
		window.close("childPage");
	}
	
</script>
<body>
	<div class="creditCardForm">
	<h3>카드 정보를 입력해주세요</h3>
	
	<form name="inputcardinfo" method="post">
	<table>
	<tbody>
		<tr>
			<td style="width: 30%">카드번호</td>
			<td><input type="text" name="cardnumber1" class="cardinfo1" maxlength="4" style="width:40px"  pattern="[0-9]+">
			<input type="text" name="cardnumber2" class="cardinfo1" maxlength="4" style="width:40px"  pattern="[0-9]+">
			<input type="text" name="cardnumber3" class="cardinfo1" maxlength="4" style="width:40px"  pattern="[0-9]+">
			<input type="text" name="cardnumber4" class="cardinfo1" maxlength="4" style="width:40px"  pattern="[0-9]+"></td>
		</tr>
		<tr>
			<td style="width: 30%">유효기간</td>
			<td><input type="text" name="valid" class="cardinfo2" maxlength="2" style="width:40px" placeholder="MM"  pattern="[0-9]+">
			<input type="text" name="valid" class="cardinfo2" maxlength="2" style="width:40px" placeholder="YY"  pattern="[0-9]+"></td>
		</tr>
		<tr>
			<td style="width: 30%">CVC</td>
			<td><input type="text" name="cvc" class="cardinfo3" maxlength="3" style="width:40px"  pattern="[0-9]+"></td>
		</tr>
	</tbody>
	<tfoot>
		<td></td>
		<td><input type="submit" value="구매진행" onclick="creditcardpay_proc(this.form)">
			<input type="submit" value="취    소" onclick="cancel(this.form)"></td>
	</tfoot>
	</table>
	</form>
	</div>
</body>
</html>
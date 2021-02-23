<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript" src="js/bootstrap.js"></script>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/savanna/css/savanna.css" rel="stylesheet">

<title>:: 결제 페이지 ::</title>

</head>
<style>
	div .panel{
        width: 800px;
        margin: auto;
    }
    div #orderlist, #paymentselect, #sel, #buttons{
    	width: 60%;
    	margin: auto;
    }
    table {
        width: 70%;
        margin: auto;
    }
    .popup {
   		width: 70%;
   		margin-left: 10px;
    }
   .table>thead>tr>th {
    	text-align: center;
	    valign: bottom;
	    border-bottom: 2px solid #ddd;
	}
	.table>thead>tr>td { 
	    padding: 8px;
    	line-height: 1.42857143;
    	vertical-align: top;
	}
    table .th1 {
        border-bottom: 1px solid #ddd;   
    }
    .info2 {
    	text-align: center;
    }
    #th_info{
    	align: center;
    	valign: middle;
    }
    #th_addr{
    	text-align: center;
	    valign: bottom;
	    border-top: 2px solid #ddd;
	    border-bottom: 2px solid #ddd;
    }
    #addr {
        text-align: center;
    }
    .payment_card {
    	
    }
    .btn {
    	border: 1px solid #ff4aa5;
		padding: 3px 7px;
    }
    
</style>
<script>
    function back_cart(frm){
    	frm.action = "controller?type=cartList";
    	frm.method = "post";
    	frm.submit();
    }
	
    /*$(function(){ 
        $(':input:radio[name=paymentmethod]:checked').on("click", function(){
            var check = $(this).val();
            
            if(check == 'deposit'){
                $(".paymentselect").siblings(".payment_card").css("display", "none");
                $(".paymentselect").siblings(".payment_deposit").css("display", "block");

                $("select#set_bank").removeProp("disabled");
				$("select#set_card").prop("disabled");

            } else if(check == 'card'){
                $(".paymentselect").siblings(".payment_deposit").css("display", "none");
                $(".paymentselect").siblings(".payment_card").css("display", "block");
                
                $("select#set_card").removeProp("disabled");
                $("select#set_bank").prop("disabled");
            }
        });
    });*/
    $(function() {
    	$("#set_card").click(function(){
    		$("#cardinfo").show();
    	});
	});
    
    /* function set_paymentmethod(frm){
    	if(!$(':input:radio[name=paymentmethod]:checked').val()){
    		alert("결제수단을 선택하세요");
    		return false;
    	} else{
	    	if(frm.paymentmethod.value == 'card'){
	    		if($('select option:selected').val()=='disable'){
	    			alert("카드를 선택하세요");
	    			return false;
	    		} else {
		    		$("#cardinfo").css("display","block");
	    		}
	    	} else if(frm.paymentmethod.value == 'deposit'){
	 	    	frm.action = "/savanna/controller?type=GoOrder";
	    		frm.method="post";
	       		frm.submit();
	    	}    		
    	}
    } */
    
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
	
	function set_paymentmethod(frm){
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
		
		if(!$(':input:radio[name=paymentmethod]:checked').val()){
    		alert("결제수단을 선택하세요");
    		return false;
    	} else{
	    	if(frm.paymentmethod.value == 'card'){
	    		if($('select option:selected').val()=='disable'){
	    			alert("카드를 선택하세요");
	    			return false;
	    		} else {
	    			frm.action = "/savanna/controller?type=payCreditCard";
	    			frm.method = "post";
	    			frm.submit();
	    		}
			}
    	}
	}
    
</script>    
<body>
	<%@ include file="/common/menu.jspf" %>
 <div class="panel">
    <div id="orderlist">
        <table class = "table">
            <thead>
                <tr>
                    <th class="th1" id="th_info" colspan="3">상품 확인</th>
                </tr>
                <tr>
                    <th>상품명</th>
                    <th>수량</th>
                    <th>가격</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="cvo" items="${cartlist }">
                <tr>
                    <td>${cvo.book_name }</td>
                    <td style="text-align: center">${cvo.cart_quan }</td>
                    <td style="text-align: center"><fmt:formatNumber value="${cvo.cart_price }" pattern="###,###"/>원</td>
                </tr>
            </c:forEach>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="3" class="info2">배송비 :  <fmt:formatNumber value="${shipcharge }" pattern="###,###"/>원</td>
                </tr>
                <tr>
                    <td colspan="3" class="info2" style="border-top: none">총 결제금액 :  <fmt:formatNumber value="${totprice }" pattern="###,###"/>원</td>
                </tr>    
            </tfoot>
        </table>

        <table class="table">
	        <tbody>
	            <tr>
	                <th class="th1" id="th_addr">배송지 확인</th>
	            </tr>
	            <tr>
	                <td id="addr">${addr }</td>	                
	            </tr>
    	    </tbody>
        </table> 
	</div>
        
    
    <form id="payform">
    <div id="paymentselect">
        <table class="table">
            <thead>
                <tr>
                    <th class="th1" colspan="2">결제방식 확인</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <!-- <td>
                        <input type="radio" name="paymentmethod" value="deposit" id="deposit" class="payment">
                        <label for="deposit">무통장 입금</label>
                    </td> -->
                    <td>
                        <input type="radio" name="paymentmethod" value="card" id="card" class="payment"> 
                        <label for="card">카드결제</label>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="sel" class="payment_card" >
        <table class="popup">
            <tbody>
                <tr>
                    <td id="cards" >
                        카드사 선택
                    </td>
                    <td width="60%">
                        <select name="setcard" id="set_card">
                            <option value="disable" selected disabled>카드를 선택하세요</option>
                            <option value="sscard">삼성카드</option>
                            <option value="hdcard">현대카드</option>
                            <option value="shcard">신한카드</option>
                            <option value="kbcard">KB국민카드</option>
                            <option value="hanacard">하나카드</option>
                        </select>
                    </td>
                </tr>
            </tbody>
            <tfoot id="cardinfo" style="display :none ">
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
            </tfoot>
        </table>
    </div>

    <div id="buttons">
    <table class="table">
        <tr>
            <td>
                <input type="button" value="장바구니로 돌아가기" class="btn" onclick="back_cart(this.form)">
            </td>
            <td>
                <input type="button" value="확인" class="btn" onclick="set_paymentmethod(this.form)">
                <input type="hidden" name="addr" value="${addr }">
            </td>   
        </tr> 
    </table>
    </div>
	</form>	
</div>  


</body>
</html>
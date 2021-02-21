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
    div panel {
        width: 80%;
        margin: auto;
    }
    div {
        width: 80%;
        margin: auto;
    }
    table {
        width: 70%;
        margin: auto;
    }
    table .th1 {
        border-bottom: 1px solid black;   
    }
    table #paymethod, #buttons {
        width: 70%;
        margin: auto;
    }
    table #banks, #cards {
        width: 40%;
    }
    #addr {
        text-align: center;
    }
</style>
<script>
    function back_cart(frm){
    	frm.action = "controller?type=cartList";
    	frm.method = "post";
    	frm.submit();
    }

    $(function(){ 
        $(".payment").change(function(){
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
    });
    
    function set_paymentmethod(frm){
    	if(frm.paymentmethod.value == 'card'){
    		window.name = "parentPage";
    		window.open("controller?type=creditCardProc","childPage","width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
    	} else if(frm.paymentmethod.value == 'deposit'){
 	    	frm.action = "/savanna/controller?type=GoOrder";
    		frm.method="post";
       		frm.submit();
    	}
    }
</script>    
<body>
	<%@ include file="/common/menu.jspf" %>
 <div class="panel">
    <div id="orderlist_check">
        <table id = "product">
            <thead>
                <tr>
                    <th class="th1" colspan="3">상품 확인</th>
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
                    <td>${cvo.cart_quan }</td>
                    <td>${cvo.cart_price }</td>
                </tr>
            </c:forEach>
            </tbody>
            <tfoot>
                <tr>
                    <td>배송비 : </td>
                    <td colspan="2">${shipcharge }</td>
                </tr>
                <tr>
                    <td>총 결제금액 : </td>
                    <td colspan="2">${totprice }</td>
                </tr>    
            </tfoot>
        </table>

        <table>
            <tr>
                <th class="th1">배송지 확인</th>
            </tr>
            <tr>
                <td id="addr">${addr }</td>
            </tr>
        </table> 
	</div>
        
    
    <form>
    <div id="paymentselect">
        <table id="paymethod">
            <thead>
                <tr>
                    <th class="th1" colspan="2">결제방식 확인</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <input type="radio" name="paymentmethod" value="deposit" id="deposit" class="payment">
                        <label for="deposit">무통장 입금</label>
                    </td>
                    <td>
                        <input type="radio" name="paymentmethod" value="card" id="card" class="payment"> 
                        <label for="card">카드결제</label>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div id="sel" class="payment_deposit" style="display: none">
        <table id="popup">
            <tbody>
                <tr>
                    <td id="banks" style="text-align: center">
                        입금할 은행
                    </td>
                    <td  width="60%">
                        <select name="setbank" id="set_bank">
                            <option value="shinhan">신한은행 : 000-00-000000</option>
                            <option value="KB">국민은행 : 000000-00-000000</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        예금주 
                    </td>
                    <td  width="60%">
                        savanna 
                    </td>
                </tr> 
            </tbody>
        </table>    
    </div>

    <div id="sel" class="payment_card" style="display: none">
        <table id="popup">
            <tbody>
                <tr>
                    <td id="cards" style="text-align: center">
                        카드사 선택
                    </td>
                    <td width="60%">
                        <select name="setcard" id="set_card">
                            <option value="sscard">삼성카드</option>
                            <option value="hdcard">현대카드</option>
                            <option value="shcard">신한카드</option>
                            <option value="kbcard">KB국민카드</option>
                            <option value="hanacard">하나카드</option>
                        </select>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="buttoncls">
    <table id="buttons">
        <tr>
            <td>
                <input type="button" value="장바구니로 돌아가기" class="btn btn-default" onclick="back_cart(this.form)">
            </td>
            <td>
                <input type="button" value="확인" class="btn btn-default" onclick="set_paymentmethod(this.form)">
            </td>   
        </tr> 
    </table>
    </div>
	</form>	
</div>  


</body>
</html>
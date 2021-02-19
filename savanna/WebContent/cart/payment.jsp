<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<style>
    .orderlist_check { border: 2px solid blue; background-color: antiquewhite}
    .address { border: 2px solid yellow; background-color: aqua}
    .paymethodview { border: 2px solid orange; background-color: aquamarine}
    .paymentselect { margin: 10px; border: 2px solid pink; background-color: deeppink}
    #sel { 
        display: none;
        width: 500px;
        height: 60px;
    }
    #popup {
        width: 100%   
    }
    table {
    	border: 1px solid black;
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
    <div class="orderlist_check">
    <h3> 구입할 상품을 확인하세요 </h3>
    <table class = "product">
        <thead>
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
                <td>배송비 : ${shipcharge }</td>
            </tr>
            <tr>
                <td>총 결제금액 : ${totprice }</td>
            </tr>    
        </tfoot>
    </table>
        
	<h3> 배송지를 확인하세요 </h3>
        ${addr }
	</div>
    
	<div class="paymethodview">
	<h3> 결제 방식을 선택하세요 </h3>
    
    <form>
        
        <div class="paymentselect">
            <table >
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
            </table>
        </div>

        <div id="sel" class="payment_deposit">
            <table id="popup">
                <tr>
                    <td style="text-align: center">
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
            </table>    
        </div>

        <div id="sel" class="payment_card">
            <table id="popup">
                <tr>
                    <td style="text-align: center">
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
            </table>
        </div>
        
        <table id="buttons">
            <tr>
                <td>
                    <input type="button" value="장바구니로 돌아가기" onclick="back_cart(this.form)">
                </td>
                <td>
                    <input type="button" value="확인" onclick="set_paymentmethod(this.form)">
                </td>   
            </tr> 
	   </table>
        
	</form>	
        
	</div>


</body>
</html>
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
<link href="/savanna/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/savanna/css/savanna.css" rel="stylesheet">
<link href="/savanna/css/sidebar.css" rel="stylesheet">

<title>:: 장바구니 ::</title>
</head>
<style>
	.cartwrqpper {
        width: 800px;
        margin: auto;
    }
    h1 {
	    margin-right: 100px;
	    text-align: center;
	    font-weight: bold;
	}
    table {
        max-width: 700px;
        margin:auto;
    }
	th, td {
    	text-align: center;
    }
    .btn {
    	border: 1px solid #ff4aa5;
		padding: 3px 7px;
    }
    .btn:hover {
		background-color: #292929;
		color: white;
	}
	.productcol{
        width:30%;
        text-align:left;
    }
    .pricecol{
        width: 30%
        text-align: right;
    }
    .quantcol{
        width: 20%
    }
    .textcol{
        text-align: center;
        font-size: 1.2em;
    }
    #lastline{
    	border-top : 1px solid #ddd;
    	height: 2px;
    	padding: 0;
    }
    #btnlist {
   		list-style: none;;
    }
    #btnlist li{
	    float:left; 
    }
    #btnlist li .btn{
    	margin:3px;
    }
</style>
<script>
	//전체구입
	function order_go(frm){
		var len = $('.quant').length
        
		var values = [];
        values.push($('.quant').val());
        
		for(var i = 0; i < len; i++){
			if(values[i] == 0){
				alert("품절/절판 상품은 구매하실 수 없습니다");
				return false;
			}
			if(values[i]!=0){
                frm.action = "/savanna/controller?type=orderPayment";
                frm.method = "post";
                frm.submit();  
            }
		}
	}
	//수량변경
	function editQuan(frm){
		if($(".quant").val() > 0 ){
			frm.action = "/savanna/controller?type=editQuan";
			frm.method = "post";
			frm.submit();	
		}else{
			alert("최소 수량은 1개입니다.");
			$(".quant").val(1);
		}
	}
	//전체삭제
	function clear_cart(frm){
		frm.action = "/savanna/controller?type=clearCart";
		frm.method = "post";
		frm.submit();
	}
	//찜목록 이동
	function wish_insert(frm) {
		frm.action="/savanna/controller?type=insertWishList";
		frm.method="post";
		frm.submit();
	}
	$(function (){ 
		//전체선택
		$('#selall').click(function(){ 
			if($("#selall").prop("checked")) { // 전체선택이 체크됐을 때
				$("input[type=checkbox]").prop("checked",true); // 전체 checkbox들을 체크 
			} else { // 전체선택 체크박스가 해제된 경우 
				$("input[type=checkbox]").prop("checked",false); // 모든 checkbox들의 체크를 해제
			}
		});
	
		//체크한 상품 삭제
		$("#seldelbtn").click(function(){
			$("input:checkbox[type=checkbox]:checked").each(function(){
			var datas = "book_no=" + $(this).val();
				
				if($("input:checkbox[type=checkbox]:checked").length == 0){
					alert("삭제할 품목을 선택해주세요!");
				} else {
					$.ajax("/savanna/controller?type=deleteInCart",{
						type : "post",
						data : datas, 
						dataType : "text",
						success : function(data){ 
							location.reload(); //화면 새로고침
						},
						error : function(jqXHR, testStatus, errorThrown){
							alert("[예외발생] Ajax 처리실패!! \n"
									+ "jqXHR : " + jqXHR.readyState + "\n"
									+ "testStatus : " + testStatus + "\n"
									+ "errorThrown : " + errorThrown);
						}
					});
				}
			});
		}); 
	});	
		/* //체크한 상품 구입
		$("#selbuybtn").click(function(){
			var values = [];
			$("input:checkbox[type=checkbox]:checked").each(function(){
				if($("input:checkbox[type=checkbox]:checked").length == 0){
					alert("구입할 품목을 선택해주세요!");
				} else {
					values.push($(this).val());
					var datas = {
						"book_array" : values
					$.ajax("/savanna/controller?type=orderPayment2",{
						type : "post",
						data : datas, 
						success : function(data){ 
							location.reload(); //화면 새로고침
						},
						error : function(jqXHR, testStatus, errorThrown){
							alert("[예외발생] Ajax 처리실패!! \n"
									+ "jqXHR : " + jqXHR.readyState + "\n"
									+ "testStatus : " + testStatus + "\n"
									+ "errorThrown : " + errorThrown);
						}
					});
				}
			});
		});
	}); */
	
</script>

<body>

	<%@ include file="/common/menu.jspf" %>
	<%@ include file="/common/memberSidebar.jspf" %>
	<br>
	<h1>장바구니</h1>
	<div class="cartwrqpper">
	<table class="table">
		<thead>
			<tr>
				<th class="title"><input type=checkbox id="selall" style="display:none"><label for="selall">전체선택</label></th>
				<th class="title">상품명</th>
				<th class="title">가격</th>
				<th class="title">수량</th>
				<th class="title">선택</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${not empty cartlist }">
		<c:forEach var = "cvo" items="${cartlist }">
			<tr>
				<td>
					<input type="checkbox" name="check" class="cb" value="${cvo.book_no}">
				</td>
				<td class="productcol">${cvo.book_name  }</td>
				<td class="pricecol"><fmt:formatNumber value="${cvo.cart_price  }" pattern="###,###"/>원</td>
				<td class="quantcol" >
				<c:if test="${cvo.cart_quan > 0 }">
				<form>
					<input type="number" name="quant" class="quant" size="3" min="1" max="10"
							value="${cvo.cart_quan }">
					<input type="button" class="btn" id="quanbtn" value="수정" onclick="editQuan(this.form)">
				</form>
				</c:if>
				<c:if test="${cvo.cart_quan == 0 }">
					<input type="number" name="quant" class="quant" size="3" value="0" disabled>품절/절판
				</c:if>
				</td>
				<form>
				<td class="deletecol" >
				<form>
					<input type="button" class="btn" id="wishbtn" value="찜목록이동" onclick="wish_insert(this.form)">
					<input type="button" class="btn" id="delbtn" value="삭제" onclick="deleteInCart(this.form)">
					<input type="hidden" name="book_no" value="${cvo.book_no }">
					<input type="hidden" name="price" value="${cvo.cart_price }">
				</form>
				</td>
				</form>
			</tr>
		</c:forEach>
		</c:if>
		<c:if test="${empty cartlist }">
			<tr>
				<td colspan="5">장바구니가 비어있습니다.</td>
			</tr>
		</c:if>
			<tr>
				<td colspan="5" id="lastline"></td>
				<tr>
		</tbody>
		</table>
		<div id="btnline">
		<form>
		<ul id="btnlist">
			<li><input type="button" class="btn" id="seldelbtn" value="선택삭제" ></li>
            <li><input type="button" class="btn" value="전체삭제" onclick="clear_cart(this.form)"></li>
            <li><input type="button" class="btn" value="전체구입" onclick="order_go(this.form)">
				<input type="hidden" name="book_no" value="${cvo.book_no }"></li>
		</ul>
		</form>
		</div>
		<div>
		<table id="table2">
		<tbody>
			<tr>
                <td class="textcol" colspan="3">상품가격 : <fmt:formatNumber value="${cvo.allitemsPrice }" pattern="###,###"/> 원&nbsp;+
								배송비 : <fmt:formatNumber value="${cvo.shippingCharge }" pattern="###,###"/> 원<br>
								총 결제가격 : <fmt:formatNumber value="${cvo.totalPrice }" pattern="###,###"/> 원
                </td>
			</tr>
		</tbody>
		</table>
		</div>
	</div>
</body>
</html>
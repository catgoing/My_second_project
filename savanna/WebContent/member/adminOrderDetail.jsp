<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>주문 상세정보</title>
<script>
	
	function goList(){
		location.href = "/savanna/controller?type=adminOrderList";
	}
	
	function isAdmin(){
		if('${user.id}' != 'a'){
			alert("권한이 없습니다");
			location.href = "/savanna/controller?type=MainPage";
		}
	}

</script>
</head>
<body>
	<%@ include file="/common/menu.jspf" %>
	<%@ include file="/common/adminSidebar.jspf" %>

<c:set var="isAdmin" value="${user.id }"/>
<c:if test="${'a' eq isAdmin }"> <!-- 관리자 아이디일 때만 아래 내용 출력 -->

	
	<form action="controller?type=adminOrderUpdate" method="post" id="fr_info">
	
	<div id="wrapper">
            <!-- content-->
            <div id="content" style="margin-left: 50px;">
       
	<h1>주문 상세정보</h1>

      <!-- GO LIST BTN-->
      <div class="btn_area">
        <button type="button" id="signinbtn" style="margin-left: 130px; width:200px; height:40px; line-height:0;" onclick="goList()">
            <span>목록으로</span>
        </button>
      </div>
            
                <!-- 주문번호 -->
                <div>
                    <h3 class="join_title"><label for="buylist_no">주문번호</label></h3>
                    <span class="box int_buylist_no">
                        <input type="text" id="buylist_no" name="buylist_no" class="int" readonly value="${vo.buylist_no }" maxlength="20">
                    </span>
                </div>
                
                <!-- 주문 상태 -->
                <div>
                    <h3 class="join_title"><label for="status">상태</label></h3>
                    <span class="box int_status">
                    <c:set var="status" value="${vo.status }" />
                    <c:if test="${status eq '0'}">
                    	<select name="status" style="height:20px">
		                   	<option value="0" selected>결제완료</option>
				            <option value="1">배송중</option>
				            <option value="2">배송완료</option>
				            <option value="3">구매취소</option>
                    	</select>
                    </c:if>
                    <c:if test="${status eq '1'}">
                    	<select name="status" style="height:20px">
		                   	<option value="0">결제완료</option>
				            <option value="1" selected>배송중</option>
				            <option value="2">배송완료</option>
				            <option value="3">구매취소</option>
                    	</select>
                    </c:if>
                    <c:if test="${status eq '2'}">
                    	<select name="status" style="height:20px">
		                   	<option value="0">결제완료</option>
				            <option value="1">배송중</option>
				            <option value="2" selected>배송완료</option>
				            <option value="3">구매취소</option>
                    	</select>
                    </c:if>
                    <c:if test="${status eq '3'}">
                    	<select name="status" style="height:20px">
		                   	<option value="0">결제완료</option>
				            <option value="1">배송중</option>
				            <option value="2">배송완료</option>
				            <option value="3" selected>구매취소</option>
                    	</select>
                    </c:if>
                       <!--  <input type="text" id="status" name="status" class="int" value="${vo.status }" maxlength="20"> -->
                    </span>
                </div>
                
                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="id">아이디</label></h3>
                    <span class="box int_id">
                        <input type="text" id="id" name="id" class="int" readonly value="${vo.id }" maxlength="20">
                    </span>
                </div>
            
                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="book_name">상품명</label></h3>
                    <span class="box int_book_name">
                        <input type="text" id="book_name" name="book_name" class="int" maxlength="12" readonly value="${vo.book_name }">
                    </span>
                </div>
 
                <!-- PHONE -->
                <div>
                  <h3 class="join_title"><label for="quan">수량</label></h3>
                  <span class="box int_quan">
                      <input type="text" id="quan" name="quan" class="int" value="${vo.quan }" readonly maxlength="13">
                  </span>
                 </div>

                <!-- EMIAL -->
                <div>
                  <h3 class="join_title"><label for="price">가격</label></h3>
                  <span class="box int_price">
                      <input type="email" id="price" name="price" class="int" value="${vo.price }" readonly maxlength="20">
                  </span>
                 </div>

                <!-- ADDRESS -->
                <div>
                  <h3 class="join_title"><label for="addr">주소</label></h3>
                  <span class="box int_addr">
                      <input type="text" id="addr" name="addr" class="int" value="${vo.addr }" maxlength="50">
                  </span>
                 </div>
                 
                <!-- REGDATE -->
                <div>
                  <h3 class="join_title"><label for="pur_date">구매일</label></h3>
                  <span class="box int_pur_date">
                      <input type="text" id="pur_date" name="pur_date" class="int" readonly value="${vo.pur_date }" maxlength="50">
                  </span>
                 </div>
                 
                 <br>
                 
                 
                <!-- UPDATE BTN-->
                <div class="btn_area">
                <button type="submit" id="updatebtn" style="width: 100%; margin-bottom: 0;">
                      <span>수정</span>
                </button>              
                </div>
    
                <br><br><br>
                
              </div>
            </div>
	</form>
  </c:if>             
</body>
</html>
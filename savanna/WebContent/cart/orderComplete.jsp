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

<title>Insert title here</title>
<!-- 자동새로고침 -->
<meta http-equiv="refresh" content="10; url=/savanna/main.jsp">
</head>
<style>
	#ordercomple{
		width: 800px;
        margin: auto;
	}
	.orderinfo {
		list-style:none;
		margin:auto;
		text-align:center;
	}
	.btn {
    	border: 1px solid #ff4aa5;
		padding: 3px 7px;
    }
    
</style>
<body>
	<%@ include file="/common/menu.jspf" %>
	<div id="ordercomple">
	<h3>주문이 완료되었습니다.</h3>
	<ul id="orderinfo">
		<li>배송지 : ${addr }</li>
		<li>결제가격 : <fmt:formatNumber value="${tot }" pattern="###,###"/>원</li>
		<li>결제정보 : ${card }<br>${cardnum[0] }-${cardnum[1] }-${cardnum[2] }-${cardnum[3] }</li>
	</ul>
	
	<p>10초 뒤 자동으로 main화면으로 돌아갑니다.</p>
	<br>
	<input type="button" class="btn" value="구매내역" onclick="구매내역.jsp">
	</div>
</body>
</html>
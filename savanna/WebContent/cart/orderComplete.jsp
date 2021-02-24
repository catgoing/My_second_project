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

<title>Insert title here</title>
<!-- 자동새로고침 -->
<meta http-equiv="refresh" content="10; url=/savanna/main.jsp">
</head>
<style>
	#complewrapper{
		width: 800px;
        margin: auto;
        text-align: center;
		height: 500px;
		min-height: 100%;
	}
	#orderinfo {
		list-style:none;
		margin:auto;
		text-align:center;
	}
	#btnwrapper {
		display: inline-block;
	}
	.btn {
		border: 1px solid #ff4aa5;
		padding: 3px 7px;
    }
    .footer {
	   width:100%;
	   position:absolute;
	   bottom:0;
	}
</style>
<body>
	<%@ include file="/common/menu.jspf" %>
	<%@ include file="/common/memberSidebar.jspf" %>
	<div id="complewrapper">
	<br><br>
	<h3 style="text-align:center">주문이 완료되었습니다.</h3>
	<br><br>
	<ul id="orderinfo">
		<li>배송지 : ${addr }</li>
		<li>결제가격 : <fmt:formatNumber value="${tot }" pattern="###,###"/>원</li>
		<li>결제정보 : ${card }<br>${cardnum[0] }-${cardnum[1] }-${cardnum[2] }-${cardnum[3] }</li>
		<br>
		<li>10초 뒤 자동으로 main화면으로 돌아갑니다.</li>
	</ul>
	<br>
	<div id="btnwrapper">
		<input type="button" class="btn" value="구매내역" onclick="javascript:location.href='/savanna/controller?type=buyList'">
	</div>
	</div>
	
	<%@ include file="/common/foot.jspf"%>

	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="refresh" content="10; url=main.jsp">
</head>
<body>
	<h2>주문이 완료되었습니다.</h2>
	10초 뒤 자동으로 main화면으로 돌아갑니다.
	돌아가지않을 시 홈버튼을 눌러주세요!
	
	
	<input type="button" value="구매내역" onclick="구매내역.jsp">
	<input type="button" value="홈" onclick="javascript:location.href='main.jsp'">
</body>
</html>
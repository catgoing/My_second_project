<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>employee list</h1>
	<h3>no, name, job, department</h3>
	<ul>
		<c:forEach var="vo" items="${list }">
			<li>
				${vo.EMPLOYEE_ID }
			</li>
		</c:forEach>
	</ul>
</body>
</html>
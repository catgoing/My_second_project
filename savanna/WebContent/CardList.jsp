<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cardlist for customer</title>
<style>
	body {
	}
	.container {
		background-color: lightblue;
		width: 80%;
		display: flex;
		flex: 50px;
		justify-content: space-between;
		align-items: center;
		overflow: auto;
		border: 1px solid black;
	}
	.card {
		background-color: lightcoral;
		padding: 0px;
		margin: 20px;
		min-width: 30vh;
		min-height: 50vh;
		box-shadow: 0 20px 20px rgba(0,0,0,0.2);
		border: 1px solid black;
	}
	.img-container {
		background-color: peru;
		padding: 0px;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.img-placeholder {
		background-color: lightgreen;
		padding: 0px;
		width: 25vh;
		height: 25vh;
		border-radius: 50%;
	}
	ul>li {
		list-style: none;
	}
</style>
</head>
<body>
	<h1>Cardlist</h1>
	<div class="container">
		<c:forEach var="vo" items="${list }">
		<ul class="card">
			<li class="img-container">
				<div class="img-placeholder"></div>
				</li>
			<li>${vo.book_name }</li>
			<li>${vo.writer }</li>
			<li>${vo.publisher }</li>
			<li>${vo.price }<li>
			<li>${vo.stock }</li>
		</ul>
		</c:forEach>	
	</div>
</body>
</html>
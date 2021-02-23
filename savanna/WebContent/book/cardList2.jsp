<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<style>
body {
}
.container {
	background-color: white;
	width: 80%;
	display: flex;
	flex: 50px;
	justify-content: space-between;
	align-items: center;
	overflow: auto;
	border: 1px solid black;
}
.card {
	padding: 0px;
	margin: 20px;
	min-width: 30vh;
	min-height: 40vh;
	box-shadow: 0 20px 20px rgba(0,0,0,0.2);
	border: 1px solid black;
	border-radius: 5%;
}
.img-container {
	background-color: white;
	padding: 0px;
	margin: 5px 5px 5px 5px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 5%;
}
.img-placeholder {
	background-color: peru;
	padding: 0px;
	width: 25vh;
	height: 25vh;
	border-radius: 5%;
	box-shadow: 0 20px 20px rgba(0,0,0,0.2);
}
.card li {
	list-style: none;
	margin-left: 10px;
}
.price {
	text-align: right;
	margin-right: 10px;
}
</style>
	<div class="container">
		<h2></h2>
		<c:forEach var="vo" items="${list }">
			<ul class="card">
			<a href="controller?type=EnterDetail&book_no=${vo.book_no }">
			
				<li class="img-container">
					<div class="img-placeholder"></div>
				</li>
				<li><h3>${vo.book_name }</h3></li>
				<li><h4>${vo.writer }</h4></li>
				<li><h5>${vo.publisher }</h5></li>
				<li><h3 class="price">${vo.price }₩<h3><li>
			</a>
			</ul>
		</c:forEach>	
	</div>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<style>
.cardList {
	position: relative;
	left: 150px;
}
.container {
	background-color: white;
	width: 90%;
	display: flex;
	flex: 50px;
	overflow: visible;
	border: none;
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
	background-color: white;
	padding: 0px;
	width: 23vh;
	height: 35vh;
	align-items: center;
	justify-content: center;
	border-radius: 5%;
	box-shadow: 0 20px 20px rgba(0,0,0,0.2);
	overflow: none;
}
img {
	width: 23vh;
	height: 35vh;
	object-fit: contain;
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
<div class="cardList">
	<h2></h2>
	<c:forEach var="vo" items="${list }" varStatus="i">
		<c:if test="${i.count%4 eq 1}">
			<div class="container">
		</c:if>
		<ul class="card">
		<a href="controller?type=EnterDetail&book_no=${vo.book_no }">
		
			<li class="img-container">
				<div class="img-placeholder">
					<img class="img" src="images/${vo.book_no}.jpg" alt="제품이미지">
				</div>
			</li>
			<li><h3>${vo.book_name }</h3></li>
			<li><h4>${vo.writer }</h4></li>
			<li><h5>${vo.publisher }</h5></li>
			<li><h3 class="price">${vo.price }원<h3><li>
		</a>
		</ul>
		<c:if test="${i.count%4 eq 0}">
			</div>
		</c:if>
	</c:forEach>
</div>

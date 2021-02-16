<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<tr>
	<td><label for="book_name">제목</label></td>
	<td>${vo.book_name}</td>
</tr>
<tr>
	<td><label for="writer">작가</label></td>
	<td>${vo.writer}</td>
</tr>
<tr>
	<td><label for="publisher">출판사</label></td>
	<td>${vo.publisher}</td>
</tr>
<tr>
	<td><label for="pub_date">출판일</label></td>
	<td>${vo.pub_date}</td>
</tr>
<tr>
	<td><label for="price">가격</label></td>
	<td>${vo.price }</td>
</tr>
<tr>
	<td><label for="book_desc">책소개</label></td>
	<td>${vo.book_desc}</td>
</tr>
<tr>
	<td><label for="stock">재고</label></td>
	<td>${vo.stock}</td>
</tr>
<tr>
	<td><label for="category">분류</label></td>
	<td>${vo.category }</td>
</tr>
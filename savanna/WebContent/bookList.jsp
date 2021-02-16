<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>booklist for admin</title>
<style>
	table, td {
		border: 1px solid black;
		border-collapse: collapse;
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
		width: 15vh;
		height: 15vh;
		border-radius: 50%;
	}
	
		.paging { list-style: none; }
	.paging li {
		float: left;
		margin-right: 8px;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
		border: 1px solid #00B3DC;
		font-weight: bold;
		color: black;
	}
	.paging .disable {
		border: 1px solid silver;
		padding: 3px 7px;
		color: silver;
	}
	.paging .now {
		border: 1px solid #ff4aa5;
		padding: 3px 7px;
		background-color: #ff4aa5;
	}
	.paging li a:hover {
		background-color: #00B3DC;
		color: white;
	}
	
</style>
<script>
	function enterCreateBookView(frm) {
		frm.action = "controller?type=EnterCreateBook";
		frm.submit();
	}
</script>
</head>
<body>
	<h1>booklist for admin</h1>
	<div class="container">
	<table>
	<thead>
		<tr>
			<th width="5%">인덱스</th>
			<th width="10%">썸네일</th>
			<th width="30%">서명</th>
			<th width="15%">저자</th>
			<th width="15%">출판사</th>
			<th width="10%">가격</th>
			<th width="10%">재고</th>
		<tr>
	</thead>
	<tbody>
	<c:forEach var="vo" items="${list }">
		<tr class="book">
			<td>${vo.book_no }</td>
			<td class="img-container">
				<div class="img-placeholder"></div>
			</td>
			<td>
				<a href="controller?type=EnterDetail&book_no=${vo.book_no }">
				${vo.book_name }
				</a>
			</td>
			<td>${vo.writer }</td>
			<td>${vo.publisher }</td>
			<td>${vo.price }</td>
			<td class="stock">&lt;&lt;${vo.stock }&gt;&gt;</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
		<tr><td colspan="8">
			<form method="post">
				<input type="button" value="신규 등록" onclick="enterCreateBookView(this.form)">
				<input type="button" value="재고 수정(카트방식)">
				<input type="button" value="돌아가기" onclick="history.back()">
			</form>
		</td>
		</tr>
			<tr>
			<td colspan="8">
				<ol class="paging">
			<%--[이전으로]에 대한 사용여부 처리 시작페이지번호가 1인 경우 비활성화 --%>
			<c:choose>
				<c:when test="${pvo.curBlockBeginIdx == 1 }">		
					<li class="disable">이전으로</li>
				</c:when>
				<c:otherwise>
					<li><a href="controller?type=PagedAdminLogin&cPage=${pvo.curBlockBeginIdx - 1}">이전으로</a></li>
				</c:otherwise>	
			</c:choose>		
			<%-- 블록내에 표시할 페이지 태그 작성(시작페이지 ~ 끝페이지)
				현재페이지와 페이지 번호 같으면 현재페이지 처리--%>
			<c:forEach var="pageNo" begin="${pvo.curBlockBeginIdx }" end="${pvo.curBlockEndIdx }">
				<c:if test="${pageNo == pvo.curPage }">
					<li class="now">${pageNo }</li>
				</c:if>
				<c:if test="${pageNo != pvo.curPage }">
					<li>
						<a href="controller?type=PagedAdminLogin&cPage=${pageNo }">${pageNo }</a>
					</li>
				</c:if>		
			</c:forEach>		
				<%--[다음으로]에 대한 사용여부 처리
				endPage가 전체페이지수(totalPage)보다 작은경우 활성화 --%>	
				<c:if test="${pvo.curBlockEndIdx < pvo.totalPage }">	
					<li>
						<a href="controller?type=PagedAdminLogin&cPage=${pvo.curBlockEndIdx + 1}">다음으로</a>
					</li>
				</c:if>
				<c:if test="${pvo.curBlockEndIdx >= pvo.totalPage }">	
					<li class="disable">다음으로</li>
				</c:if>
				</ol>
			</td>
		</tr>
	</tfoot>
	</table>
	</div>
</body>
</html>
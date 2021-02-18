<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역</title>
<link href="/savanna/css/menu.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="/common/menu.jspf" %>
	<h1>구매내역</h1>
	<table>
		<thead>
			<tr class="title">
				<th class="book_name">책이름</th>
				<th class="quan">수량</th>
				<th class="price">가격</th>
				<th class="pur_date">주문일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
				<a href="main.jsp"></a>
				<tr class="list" onclick="location.href = '/savanna/controller?type=memDetail?id=${vo.id }'">
					<td>${vo.mem_no }</td>
					<td>${vo.id }</td>
					<td>${vo.pwd }</td>
					<td>${vo.name}</td>
					<td>${vo.phone }</td>
					<td>${vo.addr }</td>
					<td>${vo.email }</td>
					<td>${vo.regdate }</td>
				</tr>
				
		</c:forEach>
		</tbody>
		<tfoot>
		 	<tr>
		 	<td colspan="7">
		 		<ol class="paging">
		 				<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
				<c:if test="${pageNo == pvo.nowPage }">
					<li class="now">${pageNo }</li>
				</c:if>
				<c:if test="${pageNo != pvo.nowPage }">
					<li>
						<a href="/savanna/controller?type=memList?cPage=${pageNo }">${pageNo }</a>
					</li>
				</c:if>		
			</c:forEach>
		 	</ol>
		 	</td>
		 	</tr>
   
		</tfoot>
	</table>
	
</body>
</html>
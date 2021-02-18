<%@page import="com.savanna.model.vo.PageVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.savanna.model.dao.ReviewDAO"%>
<%@page import="com.savanna.model.vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 게시판</title>
<style>
	#bbs table {
		width: 580px;
		margin-left: 10px;
		border-collapse: collapse;
		font-size: 14px;
	}
	#bbs table caption {
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	#bbs table th, #bbs table td {
		text-align: center;
		border: 1px solid black;
		padding: 4px 10px;
	}
	#bbs .align-left { text-align: left; }
	
	.title { background-color: lightsteelblue; }
	
	.no { width: 10%; }
	.bookno { width: 10%; }
	.writer { width: 15%; }
	.regdate { width: 20%; }
	.hit { width: 15%; }
	
	/***** 페이지 표시 부분 스타일(시작) ****/
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
	/***** 페이지 표시 부분 스타일(끝) ****/
</style>
<script>
	function enterCreateBookView(frm) {
		frm.action = "controller?type=reviewlist";
		frm.submit();
	}
</script>
</head>
<body>

<div id="bbs">
<table>
	<caption>리뷰 목록</caption>
	<thead>
		<tr class="title">
			<th class="no">리뷰 번호</th>
			<th class="bookno">책번호</th>
			<th class="subject">제목</th>
			<th class="writer">글쓴이</th>
			<th class="regdate">날짜</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty list }">
		<tr>
			<td colspan="5">
				<p>현재 등록된 게시글이 없습니다.</p>
			</td>
		</tr>
	</c:if>
	<c:if test="${not empty list }">
		<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.rev_no }</td>
			<td>${vo.book_no }</td>
			<td class="align-left">
				<a href="view.jsp?rev_no=${vo.rev_no }&cPage=${pvo.curPage}">${vo.rev_content }</a>
			</td>
			<td>${vo.id }</td>			
			<td>${vo.rev_date }</td>

		</tr>
		</c:forEach>
	</c:if>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="4">
				<ol class="paging">
			<%--[이전으로]에 대한 사용여부 처리 시작페이지번호가 1인 경우 비활성화 --%>
			<c:choose>
				<c:when test="${pvo.curBlockBeginIdx == 1 }">		
					<li class="disable">이전으로</li>
				</c:when>
				<c:otherwise>
					<li><a href="list.jsp?cPage=${pvo.curBlockBeginIdx - 1}">이전으로</a></li>
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
				curBlockEndIdx가 전체페이지수(totalPage)보다 작은경우 활성화 --%>	
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
			<td>
				<input type="button" value="글쓰기"
					onclick="javascript:location.href='write.jsp'">
			</td>
		</tr>
	</tfoot>
</table>

</div>


</body>
</html>













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
<meta name="viewport" content="width=device-width", initial-scale="1">
<script src="/savanna/js/bootstrap.min.js"></script>
<link href="/savanna/css/bootstrap.min.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>리뷰 게시판</title>
<link rel="stylesheet" type="text/css" href="/savanna/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/savanna/css/savanna.css">
<style>
	#container { width: 70%; margin: 0 auto; /* 가로로 중앙에 배치 */
				 padding-top: 10%; /* 테두리와 내용 사이의 패딩 여백 */ }

	#list { text-align: center; }
	.table > thead { color: #000000; background-color: #ffffff; }
	.table > thead > tr > th { text-align: center; }
	.table-hover > tbody > tr:hover { background-color: #bfbfbf; }
	.table > tbody > tr > td { text-align: center; }
	.table > tbody > tr > #title { text-align: left; }
	div > #paging { text-align: center; }

	h3 {  }

	.title { background-color: #eeeeee; }

	.no { width: 10%; }
	.bookno { width: 10%; }
	.writer { width: 15%; }
	.regdate { width: 20%; }

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
		background-color: #999999;
		color: white;
	}

	/***** 페이지 표시 부분 스타일(끝) ****/
</style>

</head>
<%@ include file="/common/menu.jspf" %>
<hr>
<div id="container">
	<div align="right">
		<!-- Login 검증 -->
		<!-- jstl의 if문은 else가 없어서 따로 검증해야함. -->
		<c:if test="${id != null}">
			<%-- <%@include file="loginOk.jsp" %> --%>
		</c:if>
		<c:if test="${id == null}">
			<%-- <%@include file="login.jsp" %> --%>
		</c:if>
	</div>
	<div id="list">
		<b><h3 style="font-weight : bold;">리뷰 게시판</h3></b>
	</div>
	<div>
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th width="15%">리뷰 번호</th>
					<th width="15%">책 번호</th>
					<th width="40%">리뷰 내용</th> <th width="10%">작성자</th>
					<th width="20%">작성일</th>
				</tr> </thead>
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
							<a href="board/view.jsp?rev_no=${vo.rev_no }&cPage=${pvo.curPage}">${vo.rev_content }</a>
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
					<li><a href="controller?type=${curList }&cPage=${pvo.curBlockBeginIdx - 1}">이전으로</a></li>
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
						<a href="controller?type=${curList }&cPage=${pageNo }">${pageNo }</a>
					</li>
				</c:if>
			</c:forEach>
				<%--[다음으로]에 대한 사용여부 처리
				curBlockEndIdx가 전체페이지수(totalPage)보다 작은경우 활성화 --%>
				<c:if test="${pvo.curBlockEndIdx < pvo.totalPage }">
					<li>
						<a href="controller?type=${curList }&cPage=${pvo.curBlockEndIdx + 1}">다음으로</a>
					</li>
				</c:if>
				<c:if test="${pvo.curBlockEndIdx >= pvo.totalPage }">
					<li class="disable">다음으로</li>
				</c:if>
				</ol>
				<form class="navbar-form navbar-rignt" action="search.jsp">
					<div class="form-group">
						<input type="text" name="search" class="form-control" placeholder="작성자를 입력하세요">
						<button type="submit" class="btn btn-default">검색</button>
					</div>
				</form>
			</td>
			<td>
				<div id="write">
						<input type="button" value="글쓰기" onclick="javascript:location.href='/savanna/board/write.jsp'">
					<!--
					<c:if test="${id == null}">
						<input type="button" value="글쓰기" onclick="javascript:location.href='/savanna/member/signIn.jsp'">
					</c:if>
					-->
				</div>
			</td>
		</tr>
	</tfoot>
		</table> <!-- Paging 처리 -->
		<div id="paging"> ${pageCode}
		</div>
	</div>
</div>
<hr>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>

</body>
</html>

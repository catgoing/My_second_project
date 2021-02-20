<%@page import="java.util.List"%>
<%@page import="com.savanna.model.vo.ReviewVO"%>
<%@page import="com.savanna.model.vo.CommVO"%>
<%@page import="com.savanna.model.dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	//파라미터 값 확인
	String rev_no = request.getParameter("rev_no");
	String cPage = request.getParameter("cPage");

	//2. 게시글(rev_no) 데이터 조회
	ReviewVO rvo = ReviewDAO.selectOne(rev_no);

	//3. 게시글(b_idx)에 딸린 댓글이 있으면 조회(검색, 찾기)
	List<CommVO> list = ReviewDAO.getCommList(rev_no);	
	
	//EL, JSTL 사용을 위한 scope 상에 속성 등록하고 화면 표시
	session.setAttribute("rvo", rvo);
	session.setAttribute("cPage", cPage);
	pageContext.setAttribute("c_list", list);	
%>

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width", initial-scale="1">
<script src="../js/bootstrap.min.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>게시글상세</title>
<link rel="stylesheet" type="text/css" href="/savanna/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/savanna.css">	
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
	#bbs table th {
		border: 1px solid black;
		padding: 4px 10px;
		width: 25%;
		background-color: lightsteelblue;
	}
	#bbs table td {
		border: 1px solid black;
		padding: 4px 10px;
	}
	#comment { 
		border : 1px solid black;
		padding: 4px 10px;
	}
</style>
<script>

	function update_go(frm) {
		frm.action = "../controller?type=reviewUpdate";
		frm.submit();
	}
	function delete_go(frm) {
		frm.action = "../controller?type=reviewDelete";
		frm.submit();
	}
	function list_go(frm) {
		frm.action = "../controller?type=reviewPage";
		frm.submit();
	}
	function commInsert_go(frm) {
		frm.action = "../controller?type=commInsert";
		frm.submit();
	}
	function commDelete_go(frm) {
		frm.action = "../controller?type=commDelete";
		frm.submit();
	}
</script>
</head>
<%@ include file="/common/menu.jspf" %>
<body>

<div id="bbs">
<%-- 게시글 내용 표시 --%>
<form method="post" name="frm">
	<table>
		<caption>상세보기</caption>
		<tbody>
			<tr>
				<th>책번호</th>
				<td>${rvo.book_no }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${rvo.id }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${rvo.rev_content }</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수정" onclick="javascript:location.href='update.jsp'">
					<input type="button" value="삭제" onclick="delete_go(this.form)">
					<input type="button" value="목록" onclick="list_go(this.form)">
					<input type="hidden" name="cPage" value="${cPage }">
				</td>
			</tr>
		</tfoot>
	</table>
</form>

<hr>

<%-- 게시글에 대한 댓글 작성 영역 --%>
<form method="post">
	<h3>댓글 작성하기</h3>
	<div id="comment">
	<p>작성자 : <input type="text" name="id">
		댓글 비밀번호 : <input type="password" name="comm_pwd"></p>
	<p>내용 : <textarea name="comm_content" rows="4" cols="55"></textarea>
	<input type="submit" value="작성하기" onclick="commInsert_go(this.form)">
	<input type="hidden" name="rev_no" value="${rvo.rev_no }"></p>
	</div>
</form>

<hr>
<h3>등록된 댓글들</h3>
	<c:if test="${empty c_list }">
		<tr>
			<td colspan="5">
				<p>등록된 댓글이 없습니다. 첫번째 댓글을 작성하세요!</p>
			</td>
		</tr>
	</c:if>
	<%-- 게시글에 작성된 댓글 표시 영역 --%>
<c:if test="${not empty c_list }">	
<c:forEach var="cvo" items="${c_list }">
<div class="comment">
	<form method="post">
		<p>이름 : ${cvo.id } &nbsp; 날짜 : ${cvo.comm_date }</p>
		<p>내용 : ${cvo.comm_content }</p>
		<input type="submit" value="댓글삭제" onclick="commDelete_go(this.form)">
		<input type="hidden" name="rev_no" value="${rvo.rev_no }">
		<input type="hidden" name="comm_no" value="${cvo.comm_no }">
		<input type="hidden" name="comm_pwd" value="${cvo.comm_pwd }">
		<%--댓글 삭제처리후 게시글 상세페이지로 이동시 --%>
		<input type="hidden" name="rev_no" value="${cvo.rev_no }">
	</form>
</div>
<hr>
</c:forEach>
</c:if>
</div>
<hr>

</body>
</html>
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
<link rel="stylesheet" href="/savanna/css/writeform.css" />
<script src="/savanna/js/bootstrap.min.js"></script>
<link href="/savanna/css/bootstrap.min.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<link rel="stylesheet" type="text/css" href="/savanna/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/savanna/css/savanna.css">	
<style>
	#comment { 
		border : 1px solid black;
		padding: 4px 10px;
	}

	#comm {
		border : 1px solid black;
		margin-top : none;
		padding-top : none;
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
	<footer id="footer" class="wrapper" method="post">
		<div class="inner">
			<section>
				<div class="box" >
					<div class="content">
						<h2 class="align-center" style="font-weight: bold;">게시글 상세보기</h2>
						<form method="post">
							<div class="field half first">
								<label for="name">작성자</label>
								<input name="id" id="id" type="text" value="${user.id}" readonly>
							</div>
							<div class="field half">
								<label for="name">작성일자</label>
								<input name="rev_date" id="rev_date" type="text" value="${rvo.rev_date}" readonly>
							</div>							
							<div class="field">
								<label for="book">책번호</label>
								<!--
								<div class="select-wrapper">
									  
									<select name="book" id="book">
									<c:forEach var="bvo" items="${list }">
										<option value="1">${bvo.book_no }</option>
									</c:forEach>	
									</select>
								</div>
								-->
								<input type="text" name="book_no" title="책번호" value="${rvo.book_no }" readonly>
							</div>
							<div class="field">
								<label for="message">리뷰 내용</label>
								<textarea name="rev_content" id="message" rows="6" readonly>${rvo.rev_content }</textarea>
							</div>
							<ul class="actions align-center">
								<li><input value="수정하기" type="button" onclick="javascript:location.href='update.jsp'"></li>
								<li><input value="삭제하기" type="button" onclick="javascript:location.href='delete.jsp'"></li>
								<li><input value="목록" type="button" onclick="list_go(this.form)"></li>
							</ul>
						</form>
						<hr>
							<%-- 게시글에 대한 댓글 작성 영역 --%>		
						<div id="comm">
							<section>
								<div class="box">
									<div class="content">
										<h3 class="align-center" style="font-weight: bold;">댓글 작성하기</h3>
										<form action="/savanna/controller?type=commInsert" method="post">
											<div class="field">
												<label for="message">댓글 내용</label>
												<textarea name="comm_content" id="comm_content"  placeholder="댓글을 입력하세요"></textarea>
											</div>
											<div class="field half">
												<label for="pwd">비밀번호</label>
												<input type="password" name="comm_pwd" size="40" title="비밀번호"><label>* 댓글 수정 및 삭제시 사용</label>
											</div>
											<ul class="actions align-center">
												<li><input value="작성하기" class="button special" type="submit" onclick="javascript:location.href='view.jsp?rev_no=${vo.rev_no }&cPage=${pvo.curPage}'"></li>
												<li><input value="다시 작성" class="button" type="reset"></li>
												<li><input type="hidden" name="rev_no" value="${rvo.rev_no }"></li>
												<li><input type="hidden" name="id" value="${user.id }"></li>
											</ul>
										</form>
									</div>
								</div>
							</section>
						</div>
						<hr>
						<div>
							<h3 style="font-weight:bold;">등록된 댓글들</h3>
							<c:if test="${empty c_list }">
								<tr>
									<td colspan="5">
										<p style="font-weight: bold;">등록된 댓글이 없습니다. 첫번째 댓글을 작성하세요!</p>
									</td>
								</tr>
							</c:if>
							<%-- 게시글에 작성된 댓글 표시 영역 --%>
							<c:if test="${not empty c_list }">	
							<c:forEach var="cvo" items="${c_list }">
							<div class="comment">
								<form method="post">
									<p>이름 : ${user.id} &nbsp; 날짜 : ${cvo.comm_date }</p>
									<p>내용 : ${cvo.comm_content }</p>
									<input value="수정하기" type="button" onclick="javascript:location.href='comm_update.jsp'">
									<input value="삭제하기" type="button" onclick="javascript:location.href='comm_del.jsp'">
									<input type="hidden" name="comm_no" value="${cvo.comm_no }">
								</form>
							</div>
							<hr>
							</c:forEach>
							</c:if>
						</div>							
					</div>
				</div>
			</section>
		</div>
	</footer>
<%@ include file="/common/foot.jspf" %>
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.scrolly.min.js"></script>
		<script src="assets/js/jquery.scrollex.min.js"></script>
		<script src="assets/js/skel.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
</body>
</html>
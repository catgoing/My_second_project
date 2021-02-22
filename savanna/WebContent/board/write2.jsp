<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.savanna.model.dao.BookDAO"%>
<%@page import="com.savanna.model.vo.BookVO"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="/savanna/css/writeform.css" />
<script src="/savanna/js/bootstrap.min.js"></script>
<link href="/savanna/css/bootstrap.min.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<link rel="stylesheet" type="text/css" href="/savanna/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/savanna/css/savanna.css">	

<script>
	function reviewInsert(frm) {
		frm.action = "../controller?type=reviewInsert";
		frm.submit();
	}

	function list_go(frm) {
		frm.action = "../controller?type=reviewPage";
		frm.submit();
	}
	
	function sendData() {
		var firstForm = document.forms[0];
		for (var i=0; i<firstForm.elements.length; i++) {
			console.log(firstForm.elements[i]);
			if (firstForm.elements[i].value.trim() == "") {
				alert(firstForm.elements[i].title + " 입력하세요");
				firstForm.elements[i].focus();
				return;
			}
		}
		firstForm.submit();
	}
</script>
</head>
<%@ include file="/common/menu.jspf" %>
<body>
	<footer id="footer" class="wrapper">
		<div class="inner">
			<section>
				<div class="box">
					<div class="content">
						<h2 class="align-center" style="font-weight: bold;">리뷰 작성하기</h2>
						<form action="/savanna/controller?type=reviewInsert" method="post">
							<div class="field half first">
								<label for="name">작성자</label>
								<input name="id" id="id" type="text" value="${user.id}" readonly>
							</div>
							<div class="field half">
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
								<input name="book_no" id="book_no" type="text">
							</div>
							<div class="field">
								<label for="message">리뷰 내용</label>
								<textarea name="rev_content" id="message" rows="6" placeholder="리뷰 내용을 입력하세요"></textarea>
							</div>
							<div class="field half">
								<label for="pwd">비밀번호</label>
								<input type="password" name="rev_pwd" size="40" title="비밀번호"> * 게시글 수정 및 삭제시 사용
							</div>
							<ul class="actions align-center">
								<li><input value="작성하기" class="button special" type="submit"></li>
								<li><input value="다시 작성" class="button" type="reset"></li>
								<li><input value="목록" class="button" type="submit"></li>
							</ul>
						</form>
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
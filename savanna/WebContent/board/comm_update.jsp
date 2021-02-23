<%@page import="com.savanna.model.vo.CommVO"%>
<%@page import="java.util.List"%>
<%@page import="com.savanna.model.dao.ReviewDAO"%>
<%@page import="com.savanna.model.vo.ReviewVO"%>
<%@page import="com.savanna.model.vo.CommVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="/savanna/css/writeform.css" />
<script src="/savanna/js/bootstrap.min.js"></script>
<link href="/savanna/css/bootstrap.min.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>리뷰 수정</title>
<link rel="stylesheet" type="text/css" href="/savanna/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/savanna/css/savanna.css">	

<script>	
	function commUpdate_go(frm) {
		frm.action = "../controller?type=commUpdate";
		frm.submit();
	}
	
	function list_go(frm) {
		frm.action = "../controller?type=reviewPage";
		frm.submit();
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
						<h2 class="align-center" style="font-weight: bold;">리뷰 수정하기</h2>
						<form action="/savanna/controller?type=commUpdate" method="post">
							<div class="field half">
								<label for="message">작성자</label>
								<input name="id" id="comm_id" type="text" value="${user.id}" readonly>
							</div>							
							<div class="field">
								<label for="message">댓글 내용</label>
								<textarea name="comm_content" id="message" >${cvo.comm_content }</textarea>
							</div>
							<ul class="actions align-center">
								<li><input value="수정하기" class="button special" type="button" onclick="commUpdate_go(this.form)"></li>
								<li><input value="다시 작성" class="button" type="reset"></li>
								<li><input value="목록" class="button" type="submit" onclick="list_go(this.form)"></li>
							</ul>
							<div>
								<input type="hidden" id="rev_no" name="rev_no" value="${rvo.rev_no }">
								<input type="hidden" id="comm_no" name="comm_no" value="${cvo.comm_no }">
								<input type="hidden" id="comm_date" name="comm_date" value="${cvo.comm_date }">
							</div>
						</form>
					</div>
				</div>
			</section>
		</div>
	</footer>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
</body>
</html>








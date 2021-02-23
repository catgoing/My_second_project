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
		if (frm.comm_pwd.value == "${cvo.comm_pwd}") { //암호 일치
			var isUpdate = confirm("수정하시겠습니까?");
			if (isUpdate) {
				frm.submit();
			} else {
				history.back();
			}
		} else {
			alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
			frm.comm_pwd.value = "";
			frm.comm_pwd.focus();
		}
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
							<div class="field">
								<label for="message">댓글 내용</label>
								<textarea name="comm_content" id="comm_content" >${cvo.comm_content }</textarea>
							</div>
							<div class="field half">
								<label for="pwd">비밀번호</label>
								<input type="password" name="comm_pwd" size="40" title="비밀번호"><label>* 댓글 작성시 사용한 비밀번호</label>
							</div>
							<ul class="actions align-center">
								<li><input value="수정하기" class="button special" type="button" onclick="commUpdate_go(this.form)"></li>
								<li><input value="다시 작성" class="button" type="reset"></li>
								<li><input value="목록" class="button" type="submit" onclick="list_go(this.form)"></li>
							</ul>
							<div>
								<input type="hidden" id="rev_no" name="rev_no" value="${rvo.rev_no }">
								<input type="hidden" id="comm_no" name="comm_no" value="${cvo.comm_no }">
								<input type="hidden" id="id" name="id" value="${vo.id }">
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








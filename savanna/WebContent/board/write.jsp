<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width", initial-scale="1">
<script src="../js/bootstrap.min.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<link rel="stylesheet" type="text/css" href="/savanna/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/savanna.css">	

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
<hr>
<body>
<!--  
<h2 style="text-align: center;">리뷰를 작성해 주세요</h2>
	<article>
		<div class="container" >
			<form name="form" id="form" role="form" method="post" action="${pageContext.request.contextPath}/board/saveBoard">
				<div class="mb-3">
					<label for="title">책번호</label>
					<input type="text" class="form-control" name="book_no" id="title" placeholder="제목을 입력해 주세요">
				</div>
				<br>
				<div class="mb-3">
					<label for="reg_id">작성자</label>
					<input type="text" class="form-control" name="id" id="reg_id" placeholder=${vo.id } >
				</div>
				<br>
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="rev_content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
				</div>
				<br>
				<div class="mb-3">
					<label for="reg_pwd">비밀번호</label>
					<input type="text" class="form-control" name="rev_pew" id="rev_pwd" placeholder="게시글 수정 및 삭제 시 사용할 비밀번호를 입력해 주세요" >
				</div>
				<br>
			</form>
			<div >
				<input type="button" class="btn btn-sm btn-primary" value="작성하기" onclick="reviewInsert(this.form)">
				<input type="button" class="btn btn-sm" value="다시 작성" onclick="reviewInsert(this.form)">
				<input type="button" class="btn btn-sm" value="목록" onclick="list_go(this.form)">
			</div>
		</div>
	</article>
-->	
<hr>
<div class="container">
	<div class="row">
	<form action="../controller?type=reviewInsert" method="post">
		<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="2" style="background-color: #eeeeee; text-align: center;">글쓰기 양식</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>책번호</th>
					<td><input type="text" class="form-control"  name="book_no" size="40" title="책번호"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" class="form-control" name="id" size="40" title="작성자" value="${user.id}" readonly></td>
				</tr>						
				<tr>
					<th>내용</th>
					<td><textarea  class="form-control"placeholder="리뷰 내용을 입력하세요" name="rev_content" rows="5" cols="35" title="내용"></textarea></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="rev_pwd" size="40" title="비밀번호"> * 게시글 수정 및 삭제시 사용
					</td>
				</tr>			
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">

					</td>
				</tr>		
			</tfoot>
		</table>
						<input type="button" class="btn btn-primary pull-right" value="작성" onclick="reviewInsert(this.form)">
						<input type="reset" value="다시작성">
						<input type="button" value="목록" onclick="list_go(this.form)"> 		
	</form>
	</div>
</div>
<hr>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
</body>
</html>
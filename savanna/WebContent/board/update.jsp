<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width", initial-scale="1">
<script src="../js/bootstrap.min.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>게시글수정</title>
<link rel="stylesheet" type="text/css" href="/savanna/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/savanna.css">	
<style>
	div { margin-left : 120px;
		  margin-right : 120px;
		}
	div th {text-align : left; }
	tbody { margin-bottom : 50px; }
</style>
<script>
	<!-- 
	function sendData() {
		var firstForm = document.forms[0];
		for (var i=0; i<firstForm.elements.length; i++) {
			if (firstForm.elements[i].value.trim() == "") {
				alert(firstForm.elements[i].title + " 입력하세요");
				firstForm.elements[i].focus();
				return;
			}
		}
		//암호 일치여부 확인
		var pwd1 = document.myForm.pwd.value; //확인용 암호 입력
		var pwd2 = "${rvo.rev_pwd}"; //DB에 저장된 암호 값
		if (pwd1 != pwd2) {
			alert("암호가 다릅니다. 다시 확인하세요!");
			document.myForm.pwd.value = "";
			document.myForm.pwd.focus();
			return;
		}
		document.myForm.submit();
	}
	-->
	function del_go(frm) {
		if (frm.rev_pwd.value == "${rvo.rev_pwd}") { //암호 일치
			var isDelete = confirm("정말 삭제할까요?");
			if (isDelete) {
				frm.submit();
			} else {
				history.back();
			}
		} else {
			alert("비밀번호가 일치하지 않습니다. 확인하세요");
			frm.rev_pwd.value = "";
			frm.rev_pwd.focus();
		}
	}
	
	function update(frm) {
		frm.action = "../controller?type=reviewUpdate";
		frm.submit();
	}
	
	function list_go(frm) {
		frm.action = "../controller?type=reviewPage";
		frm.submit();
	}
</script>

</head>
<%@ include file="/common/menu.jspf" %>
<hr>
<body>
<h2 style="text-align: center;">리뷰를 수정해 주세요</h2>
<div class="container">
	<div class="row">
	<form action="../controller?type=reviewInsert" method="post">
		<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
		<caption>게시글수정</caption>
		<tbody>
			<tr>
				<th>책번호</th>
				<td>
					<input type="text" name="book_no" size="12" title="책번호"
							value="${rvo.book_no }">
				</td>
			</tr>		
			<tr>
				<th>내용</th>
				<td>
					<textarea name="rev_content" rows="8" cols="50" title="내용">${rvo.rev_content }</textarea>
				</td>
			</tr>
			<tr>
				<th>패스워드(확인용)</th>
				<td>
					<input type="password" name="rev_pwd" size="12" title="패스워드">
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="hidden" id="rev_no" name="rev_no" value="${rvo.rev_no }">
					<input type="hidden" id="id" name="id" value="${vo.id }">
					<input type="hidden" id="rev_date" name="rev_date" value="${rvo.rev_date }">
				</td>
			</tr>
		</tfoot>
		</table>
						<input type="button" class="btn btn-primary pull-right" value="수정" onclick="update(this.form)">
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








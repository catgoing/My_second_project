<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<style>
	h1 { margin-left : 80px;}
	div { margin-left : 80px;
		  margin-right : 80px;
		  border : 2px solid black;}
	div th {text-align : left; }
	tbody { margin-bottom : 30px; }
</style>
<script>
	function reviewInsert(frm) {
		frm.action = "../controller?type=reviewInsert";
		frm.submit();
	}

	function list_go(frm) {
		frm.action = "controller?type=reviewPage";
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
<body>
<h1>[리뷰를 작성해 주세요]</h1>
<div>
<form action="../controller?type=reviewInsert" method="post">
	<table>
		<tbody>
			<tr>
				<th>책번호</th>
				<td><input type="text" name="book_no" size="45" title="책번호"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="id" size="45" title="작성자"></td>
			</tr>						
			<tr>
				<th>내용</th>
				<td><textarea name="rev_content" rows="5" cols="35" title="내용"></textarea></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="rev_pwd" size="12" title="비밀번호"> * 게시글 수정 및 삭제시 사용
				</td>
			</tr>			
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="저장" onclick="reviewInsert(this.form)">
					<input type="reset" value="다시작성">
					<input type="button" value="목록" onclick="list_go(this.form)">
				</td>
			</tr>		
		</tfoot>
	</table>
</form>

</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글수정</title>
<style>
	h1 { margin-left : 80px;}
	div { margin-left : 80px;
		  margin-right : 80px;
		  border : 2px solid black;}
	div th {text-align : left; }
	tbody { margin-bottom : 30px; }
</style>
<script>
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
	
	function modify(frm) {
		frm.action = "../controller?type=modify";
		frm.submit();
	}
	
	function list_go(frm) {
		frm.action = "../controller?type=reviewPage";
		frm.submit();
	}
</script>

</head>
<body>

<div id="bbs">
<form method="post" name="myForm">
	<table>
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
					<input type="button" value="수정" onclick="modify(this.form)">
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








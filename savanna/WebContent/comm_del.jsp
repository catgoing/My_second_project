<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--전달받은 파라미터 값 사용 비밀번호 확인 후
	비밀번호 일치 : DB에서 댓글 삭제 요청 처리
	비밀번호 불일치 : 암호가 다르다 메시지 표시 
--%>
<%
	request.setCharacterEncoding("UTF-8");

	String comm_no = request.getParameter("comm_no");
	String comm_pwd = request.getParameter("comm_pwd");
	String rev_no = request.getParameter("rev_no");
	
	//EL, JSTL 사용을 위해 scope에 속성 설정
	pageContext.setAttribute("comm_no", comm_no);
	pageContext.setAttribute("comm_pwd", comm_pwd);
	pageContext.setAttribute("rev_no", rev_no);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글삭제(암호확인)</title>
<script>
	function ans_del(frm) {
		var pwd1 = frm.pwd.value; //새로 입력한 암호
		var pwd2 = "${comm_pwd}"; // DB에 저장된 실제 암호
		if (pwd1 != pwd2) {
			alert("비밀번호가 일치하지 않습니다.");
			frm.pwd.value = "";
			frm.pwd.focus();
			return false;
		}
		var isDelete = confirm("정말 삭제하시겠습니까?");
		if (isDelete) {
			frm.submit(); //삭제처리 진행
		} else {
			history.back(); //삭제 작업 취소하고 이전페이지로 이동
		}
	}
</script>
</head>
<body>

<form action="comm_del_ok.jsp" method="post">
	비밀번호 : <input type="password" name="pwd">
	<input type="button" value="삭제" onclick="ans_del(this.form)">
	<input type="hidden" name="comm_no" value="${comm_no }">
	<input type="hidden" name="rev_no" value="${rev_no }">
</form>

</body>
</html>
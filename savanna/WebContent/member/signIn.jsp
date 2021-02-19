<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>

<!-- Bootstrap core CSS -->
<link href="/savanna/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/savanna/css/savanna.css" rel="stylesheet">
<title>로그인</title>
<script>
	function idInquiry(){
		location.href = "inquiryId.jsp";
	}
	
	function qwdInquiry(){
		location.href = "inquiryPwd.jsp";
	}
</script>
</head>
<body>
	<%@ include file="/common/menu.jspf" %>
<h1>로그인</h1>
	    <form action="/savanna/controller?type=doSignIn" method="post">
        <table>
            <tr>
                <td>아이디</td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td>패스워드</td>
                <td><input type="password" name="pwd"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="로그인">
                </td>
            </tr>
            <tr>
                <td>
                    <input type="button" value="아이디 찾기" onclick="idInquiry()">
                </td>
                <td>
                    <input type="button" value="비밀번호 찾기" onclick="qwdInquiry()">
                </td>
            </tr>
        </table> 
        </form>

</body>
</html>
<%@page import="com.savanna.model.ReviewDAO"%>
<%@page import="com.savanna.model.DAO"%>
<%@page import="com.savanna.model.vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String rev_no = Integer.toString(((ReviewVO)session.getAttribute("rvo")).getRev_no());
	//DB 데이터 삭제 처리
	try {
		ReviewDAO.delete(rev_no);
%>		
		<script>
			//정상삭제 처리 되었을 때
			alert("게시글이 삭제되었습니다.");
			location.href = "list.jsp?cPage=${cPage}";
		</script>
<%
	} catch (Exception e) {
%>
		<script>
			location.href = "view.jsp?rev_no=${rvo.rev_no}&cPage=${cPage}";
		</script>
<%		
	}
%>

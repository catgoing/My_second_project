<%@page import="com.savanna.model.dao.ReviewDAO"%>
<%@page import="com.savanna.model.vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 파라미터 값을 DB에 입력하고 list.jsp 이동 --%>
<%

	//전달받은 데이터 VO에 저장후 DB에 입력 처리(DB연동 작업)
	ReviewVO rvo = new ReviewVO();
	rvo.setBook_no((Integer.parseInt(request.getParameter("book_no"))));
	rvo.setId(request.getParameter("id"));
	rvo.setRev_content(request.getParameter("rev_content"));
	rvo.setRev_pwd(request.getParameter("rev_pwd"));
	

	//DB에 입력(저장) 처리
	ReviewDAO.insert(rvo);
	%>	
<script>
	alert("게시글을 작성하였습니다.");
	location.href = "list.jsp";
</script>	
<!-- 
	//화면전환(목록페이지로 이동)
	response.sendRedirect("list.jsp");
 -->	

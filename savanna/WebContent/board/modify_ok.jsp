<%@page import="com.savanna.model.dao.ReviewDAO"%>
<%@page import="com.savanna.model.vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	//세션에 있는 데이터 사용 b_idx 값 찾기
	ReviewVO r = (ReviewVO)session.getAttribute("rvo");
	int rev_no = r.getRev_no();
	
	//사용할 데이터 준비(전달된 파라미터 값으로 VO객체 만들기)
	ReviewVO rvo = new ReviewVO();
	
	//bvo.setB_idx(((BBSVO)session.getAttribute("bvo")).getB_idx());
	rvo.setRev_no(rev_no);
	rvo.setBook_no((Integer.parseInt(request.getParameter("book_no"))));
	rvo.setId(request.getParameter("name"));
	rvo.setRev_content(request.getParameter("content"));

	//DB 데이터 수정 요청
	ReviewDAO.update(rvo);
	

	
%>
<script>
		alert("게시글이 수정되었습니다.");
		location.href = "view.jsp?rev_no=${rvo.rev_no}&cPage=${cPage}";
</script>



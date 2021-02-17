<%@page import="com.savanna.model.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	int comm_no = Integer.parseInt(request.getParameter("comm_no"));
	int rev_no = Integer.parseInt(request.getParameter("rev_no"));
	
	//DB 데이터 삭제 처리(comm_no 값 사용)
	ReviewDAO.deleteComment(comm_no);
	
	//화면전환 : view.jsp(게시글번호, 페이지번호 전달)
	//게시글 번호 : 파라미터 값 사용
	//페이지 번호 : 세션에 저장된 "cPage" 값 사용
	String cPage = (String) session.getAttribute("cPage");
	
	response.sendRedirect("view.jsp?rev_no="+ rev_no + "&cPage=" + cPage);
%>








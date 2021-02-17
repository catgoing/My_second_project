<%@page import="com.savanna.model.vo.CommVO"%>
<%@page import="com.savanna.model.ReviewDAO"%>
<%@page import="com.savanna.model.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	//페이지 값 추출(상세페이지 이동시 전달할 값)
	String cPage = (String) session.getAttribute("cPage");
	
	CommVO cvo = new CommVO();
	cvo.setRev_no(Integer.parseInt(request.getParameter("rev_no")));
	cvo.setId(request.getParameter("id"));
	cvo.setComm_content(request.getParameter("content"));
	cvo.setComm_pwd(request.getParameter("comm_pwd"));
	
	//cvo 데이터 DB에 입력
	ReviewDAO.insertComment(cvo);
	
	//입력 후 화면전환(페이지 이동 처리)
	response.sendRedirect("view.jsp?rev_no="+ cvo.getRev_no()
		+ "&cPage=" + cPage);
%>	










	
	
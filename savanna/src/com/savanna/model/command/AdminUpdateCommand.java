package com.savanna.model.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.savanna.model.dao.DAO;
import com.savanna.model.vo.MemberVO;

public class AdminUpdateCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
//		System.out.println("update 실행");
		
		request.setCharacterEncoding("UTF-8");
		
		MemberVO vo = new MemberVO();
		
		vo.setId(request.getParameter("id"));
		vo.setPwd(request.getParameter("pwd"));
		vo.setName(request.getParameter("name"));
		vo.setAddr(request.getParameter("addr"));
		vo.setPhone(request.getParameter("phone"));
		vo.setEmail(request.getParameter("email"));
		vo.setRegdate(request.getParameter("regdate"));
		vo.setMem_no(request.getParameter("mem_no"));
		
		
		DAO.update(vo);
			
		return "doUpdate.jsp";
	}
	
	

}

package com.savanna.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.savanna.model.dao.DAO;
import com.savanna.model.vo.MemberVO;


public class DoSignInCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doSignIn 시작");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.println("id: " + id + " pwd: " + pwd);
		MemberVO vo1 = new MemberVO();
		vo1.setId(id);
		vo1.setPwd(pwd);
		
		
		MemberVO vo = DAO.signIn(vo1);
		System.out.println("vo: " + vo);
		
		HttpSession httpSession = request.getSession(true);
		
		httpSession.setAttribute("user", vo);
		
		
		
		if(vo != null && pwd.equals(vo.getPwd().toString())) {
			request.setAttribute("vo", vo);
			
			return "main_sign_in.jsp";
		}
		
		else {
			return "error.jsp";
		}
		
		
	}
	
	

}

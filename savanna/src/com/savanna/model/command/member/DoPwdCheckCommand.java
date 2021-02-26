package com.savanna.model.command.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.dao.MemberDAO;
import com.savanna.model.vo.MemberVO;

import oracle.security.o3logon.a;


public class DoPwdCheckCommand implements Command{
		
	
	public DoPwdCheckCommand() {
	
	}
	
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();

		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String type = req.getParameter("type");
		
		int result = 0;
		
		MemberVO vo1 = new MemberVO();
		vo1.setId(id);
		vo1.setPwd(pwd);
//		System.out.println(vo1);
		
		result = MemberDAO.pwdCheck(vo1);
//		System.out.println("pwdcheck: " + result);

		
		req.setAttribute("result", result);	
		out.print(result);
		
		if("withdrawal".equals(type)) {
			return "member/withdrawal.jsp";
		}
		
		return "member/pwdCheck.jsp";
	}

}

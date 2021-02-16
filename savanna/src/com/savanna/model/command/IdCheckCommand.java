package com.savanna.model.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.dao.DAO;
import com.savanna.model.vo.MemberVO;

@WebServlet("/idCheck")
public class IdCheckCommand extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		String id = req.getParameter("id");
//		System.out.println("id: " + id);
		MemberVO vo1 = new MemberVO();
		vo1.setId(id);
		
		
		int result = DAO.idCheck(vo1);
//		System.out.println(result);

		
		req.setAttribute("result", result);	
		out.print(result);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		super.doPost(req, resp);
		
		
	}

}

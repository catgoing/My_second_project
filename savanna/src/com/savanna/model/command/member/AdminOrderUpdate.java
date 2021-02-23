package com.savanna.model.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.dao.MemberDAO;
import com.savanna.model.vo.BuyVO;


public class AdminOrderUpdate implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		BuyVO vo = new BuyVO();
		
		vo.setBuylist_no(request.getParameter("buylist_no"));
		vo.setAddr(request.getParameter("addr"));
		vo.setStatus(request.getParameter("status"));

		
		MemberDAO.orderUpdate(vo);
			
		return "controller?type=adminOrderList";
	}

}

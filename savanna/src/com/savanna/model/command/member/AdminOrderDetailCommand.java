package com.savanna.model.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.dao.MemberDAO;
import com.savanna.model.vo.BuyVO;

public class AdminOrderDetailCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String buylist_no = request.getParameter("buylist_no");
		
		BuyVO vo = MemberDAO.orderDetail(buylist_no);
		request.setAttribute("vo", vo);
		
		return "member/adminOrderDetail.jsp";
	}

}

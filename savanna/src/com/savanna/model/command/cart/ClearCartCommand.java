package com.savanna.model.command.cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.savanna.model.command.Command;
import com.savanna.model.dao.CartDAO;
import com.savanna.model.vo.MemberVO;

public class ClearCartCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("카트 비우기 실행!");
		
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("user");
		String id = mvo.getId();
		
		System.out.println(id);
		
		CartDAO.clearCart(id);
		
		return "controller?type=cartList";
	}

}

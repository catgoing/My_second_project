package com.savanna.model.command.cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.savanna.model.command.Command;
import com.savanna.model.dao.CartDAO;
import com.savanna.model.vo.BookVO;
import com.savanna.model.vo.MemberVO;

public class CartInsertCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("user");
		String id = mvo.getId();
		System.out.println(id);
		
		int book_no = Integer.parseInt(request.getParameter("book_no"));
		System.out.println("bookno : " + request.getParameter("book_no"));
		
		boolean result = CartDAO.insertCart(book_no, id);

		String path = "";
		
		if(result) {
			path = "cart/jungbok.jsp";
		} else {
			path = "controller?type=cartList";
		}
		return path;
	}

}

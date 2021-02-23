package com.savanna.model.command.cart;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.savanna.model.command.Command;
import com.savanna.model.dao.CartDAO;
import com.savanna.model.vo.CartVO;
import com.savanna.model.vo.MemberVO;

public class OrderPaymentCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		MemberVO mvo = (MemberVO)session.getAttribute("user");
		String id = mvo.getId();
		System.out.println("id > " + id);
		
		String addr = "";
		List<CartVO> list = CartDAO.cartList(id);
		for(CartVO cvo : list) {
			addr = cvo.getAddr();
		}
		
		request.setAttribute("cartlist", list);
		
		CartVO vo = (CartVO)session.getAttribute("cvo");
		int shipcharge = vo.getShippingCharge();
		int totprice = vo.getTotalPrice();
		
		request.setAttribute("shipcharge", shipcharge );
		request.setAttribute("totprice", totprice );
		request.setAttribute("addr", addr);
		
		return "cart/payment.jsp";
	}

}

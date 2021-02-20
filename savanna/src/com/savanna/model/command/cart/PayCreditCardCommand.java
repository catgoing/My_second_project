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

public class PayCreditCardCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		MemberVO mvo = (MemberVO)session.getAttribute("user");
		String id = mvo.getId();
		System.out.println(id);
		
		//id, 책번호를 이용하여 CartVO정보를 가져오고 구매이력에 전달
		List<CartVO> list = CartDAO.cartList(id);
		
		for(CartVO vo : list) {
			vo.setTotalPrice(vo.getCart_price());
			System.out.println(vo.getTotalPrice());
			System.out.println(vo.toString());
			CartDAO.sendOrder(vo);
		}
		
		//장바구니 비우기~~
		CartDAO.clearCart(id);
		
		return "controller?type=paymentComplete";
	}

}

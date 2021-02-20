package com.savanna.model.command.cart;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.savanna.model.command.Command;
import com.savanna.model.dao.CartDAO;
import com.savanna.model.vo.CartVO;
import com.savanna.model.vo.MemberVO;

public class OrderGoCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		MemberVO mvo = (MemberVO)session.getAttribute("user");
		String id = mvo.getId();
		System.out.println(id);
		
		String path = "";
		// 선택한 결제수단정보 가져오기
		String paymentMethod = request.getParameter("paymentmethod");
		String setCard = request.getParameter("setcard");
		String setBank = request.getParameter("setbank");

		if(paymentMethod.equals("deposit")) {
			/*
			String bank = request.getParameter("setbank");
			String account = "";
				if(bank.equals("shinhan")) {
					account = "111-11-111111";
					bank = "신한은행";
				} else if (bank.equals("KB")) {
					account = "111111-11-111111"; 
					bank = "KB국민은행";
				}
				request.setAttribute("bank", bank);
				request.setAttribute("account", account);
			*/	
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
				
				path = "controller?type=paymentComplete";
				
		} else if(paymentMethod.equals("card")) {
			/*
			String card = request.getParameter("setcard");
			String creditCard = "";
				if(card.equals("sscard")) {
					creditCard = "삼성카드";
				} else if(card.equals("hdcard")) {
					creditCard = "현대카드";
				} else if(card.equals("shcard")) {
					creditCard = "신한카드";
				} else if(card.equals("kbcard")) {
					creditCard = "KB국민카드";
				} else if(card.equals("hanacard")) {
					creditCard = "하나카드";
				}
				//request.setAttribute("card", card);
				//request.setAttribute("creditCard", creditCard);
			*/
			
				path = "controller?type=creditCardProc";
		}
		return path;
	}

}

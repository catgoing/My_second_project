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
		String addr = mvo.getAddr();
		
		int tot = 0;
		int shipPrice = 0;
		//id, 책번호를 이용하여 CartVO정보를 가져오고 구매이력에 전달
		List<CartVO> list = CartDAO.cartList(id);
		
		for(CartVO vo : list) {
			//mapper에 totalPrice로 설정되어있어서 각 상품의 가격을 totalPrice에 넣음
			vo.setTotalPrice(vo.getCart_price()); 
			vo.setAddr(addr);
			
			shipPrice = vo.getShippingCharge();
			tot += vo.getTotalPrice();
			CartDAO.sendOrder(vo);
			System.out.println(vo.toString());
		}
		tot += tot + shipPrice;
		
		// 결제완료 페이지에 출력할 정보 전달
		String cardcom = request.getParameter("setcard");

		String[] cardnum = new String[4];
		cardnum[0] = (String)request.getParameter("cardnumber1");
		cardnum[1] = (String)request.getParameter("cardnumber2");
		cardnum[2] = (String)request.getParameter("cardnumber3");
		cardnum[3] = (String)request.getParameter("cardnumber4");
		
		request.setAttribute("list", list);
		request.setAttribute("addr", addr);
		request.setAttribute("card", cardcom);
		request.setAttribute("cardnum", cardnum);
		request.setAttribute("tot", tot);
		
		//장바구니 비우기~~
		CartDAO.clearCart(id);
		
		return "controller?type=paymentComplete";
	}

}

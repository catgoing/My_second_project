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

public class CartListCommand implements Command {
	HttpSession session;
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//System.out.println(">>CartListCommand do get() 실행!");
		System.out.println("카트 리스트 실행!");
		
		HttpSession session = request.getSession();
		
		MemberVO mvo = (MemberVO)session.getAttribute("user");
		String id = mvo.getId();
		System.out.println(id);

		List<CartVO> list = CartDAO.cartList(id);
		int tot = CartDAO.totalPrice(id);	//전체가격
		System.out.println(list);
		
		// 배송비, 전체가격, 최종가격을 따로 CartVO에 저장
		CartVO cvo = new CartVO();
		if(tot >= 20000) {		   //배송비 처리(전체가격기준)
			cvo.setShippingCharge(0);
		}else if (0 < tot && tot < 20000){
			cvo.setShippingCharge(2500);
		}
		
		cvo.setAllitemsPrice(tot); //전체가격 입력
		cvo.setTotalPrice(tot + cvo.getShippingCharge()); //최종가격

		System.out.println("배송비 > " + cvo.getShippingCharge());
		System.out.println("전체가격 > " + cvo.getAllitemsPrice());
		System.out.println("최종결제금액 > " + cvo.getTotalPrice());
		
		request.setAttribute("cvo", cvo); 
		request.setAttribute("cartlist", list);
		
		return "/cart/cartList.jsp";
	}
}

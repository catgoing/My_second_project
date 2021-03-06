package com.savanna.model.command.cart;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.savanna.model.command.Command;
import com.savanna.model.dao.CartDAO;
import com.savanna.model.vo.BookVO;
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
		
		String path = null;
		if(mvo == null) {
			path = "controller?type=MainPage";
		}
		else {
			String id = mvo.getId();
			System.out.println(id);
			
			List<CartVO> list = CartDAO.cartList(id);
			for(CartVO vo : list) {
				BookVO bvo = CartDAO.checkSoldOut(vo.getBook_no());
				int bookstock = bvo.getStock();
			
				if(bookstock == 0) {
					vo.setCart_quan(0);
				}else if (bookstock > 0 ) {
					continue;
				}
			}
			
			int tot = CartDAO.totalPrice(id);	//전체가격
			
			CartVO cvo = new CartVO(); 
			if(tot >= 20000) {		   // 배송비 처리(전체가격기준)
				cvo.setShippingCharge(0);
			}else if (0 < tot && tot < 20000){
				cvo.setShippingCharge(2500);
			}
			
			cvo.setAllitemsPrice(tot); //전체가격 입력
			cvo.setTotalPrice(tot + cvo.getShippingCharge()); //최종가격
	
			System.out.println("배송비 > " + cvo.getShippingCharge());
			System.out.println("전체가격 > " + cvo.getAllitemsPrice());
			System.out.println("최종결제금액 > " + cvo.getTotalPrice());
			
			session.setAttribute("cvo", cvo); 
			request.setAttribute("cartlist", list);
			
			path ="/cart/cartList.jsp";
		}
		
		return path;
	}
}

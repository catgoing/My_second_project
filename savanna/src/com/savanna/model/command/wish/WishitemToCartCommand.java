package com.savanna.model.command.wish;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.savanna.model.command.Command;
import com.savanna.model.dao.CartDAO;
import com.savanna.model.dao.WishDAO;
import com.savanna.model.vo.MemberVO;

public class WishitemToCartCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("user");
		String id = mvo.getId();
		int book_no = Integer.parseInt(request.getParameter("book_no"));
		
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("book_no", book_no);
		
		String path = "";
		boolean result = CartDAO.insertCart(book_no, id);		
		if(result) {
			path = "cart/jungbok.jsp";
		} else {
			
			WishDAO.deleteWish(map);		
			
			path = "controller?type=cartList";
		}
		
		return path;
	}
	
}

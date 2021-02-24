package com.savanna.model.command.wish;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.savanna.model.command.Command;
import com.savanna.model.dao.BookDAO;
import com.savanna.model.dao.CartDAO;
import com.savanna.model.dao.WishDAO;
import com.savanna.model.vo.BookVO;
import com.savanna.model.vo.MemberVO;
import com.savanna.model.vo.WishVO;

public class InsertWishCommand implements Command{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		if((MemberVO)session.getAttribute("user") == null) return "controller?type=signIn";

		
		MemberVO mvo = (MemberVO)session.getAttribute("user");
		String id = mvo.getId();
		
		int book_no = Integer.parseInt(request.getParameter("book_no"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("book_no", book_no);
		
		// DB작업
		int result = WishDAO.jungbokCheck(map);
		String path = "";

		if(result == 0) {
			WishDAO.insertWishList(map);
			CartDAO.deleteProduct(map); //카트에서 삭제
			
			path = "controller?type=cartList";
		} else if (result > 0){
			path = "cart/jungbok2.jsp";
		}
		
		return path;
	}

}

package com.savanna.model.command.cart;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.savanna.model.command.Command;
import com.savanna.model.dao.CartDAO;
import com.savanna.model.vo.MemberVO;

public class DeleteInCartCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		//id, 책번호 가져옴
		MemberVO mvo = (MemberVO)session.getAttribute("user");
		String id = mvo.getId();
		System.out.println(id);
		int book_no = Integer.parseInt(request.getParameter("book_no"));
		
		//map에 추가하여 작업
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("book_no", book_no);
		
		// 상품삭제
		CartDAO.deleteProduct(map);
		
		return "controller?type=cartList";
	}

}

package com.savanna.model.command.wish;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.savanna.model.command.Command;
import com.savanna.model.dao.WishDAO;
import com.savanna.model.vo.MemberVO;

public class DeleteWishCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("user");
		String id = mvo.getId();
		
		int book_no = Integer.parseInt(request.getParameter("book_no"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("book_no", book_no);
		
		WishDAO.deleteWish(map);
		
		return "controller?type=wishList";
	}

}

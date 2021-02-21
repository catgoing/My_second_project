package com.savanna.model.command.wish;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.savanna.model.command.Command;
import com.savanna.model.command.paging.ListPaging;
import com.savanna.model.dao.WishDAO;
import com.savanna.model.vo.MemberVO;
import com.savanna.model.vo.WishVO;

public class WishListCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("user");
		String id = mvo.getId();

		//페이징처리 & 출력할 데이터 처리 (페이지당 게시물 수, 블록당 페이지 수)
		new ListPaging<WishVO>().PagingDistributor(new WishDAO(), request, id, 3, 2);
		
		return "wishlist/wishlist.jsp";
	}

}

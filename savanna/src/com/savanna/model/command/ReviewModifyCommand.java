package com.savanna.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.ReviewDAO;
import com.savanna.model.vo.ReviewVO;

public class ReviewModifyCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("ReviewModify");
		ReviewVO rvo = new ReviewVO();
		
		rvo.setRev_no((Integer.parseInt(request.getParameter("rev_no"))));
		rvo.setBook_no((Integer.parseInt(request.getParameter("book_no"))));
		rvo.setId(request.getParameter("name"));
		rvo.setRev_content(request.getParameter("content"));		
		
		int result = ReviewDAO.update(rvo);
		System.out.println(result);			
		return "controller?type=PagedAdminLogin";
	}	
}

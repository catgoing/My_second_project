package com.savanna.model.command.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.savanna.model.command.Command;
import com.savanna.model.dao.MemberDAO;
import com.savanna.model.dao.ReviewDAO;
import com.savanna.model.vo.MemberVO;
import com.savanna.model.vo.ReviewVO;

public class ReviewUpdateCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("ReviewUpdate");
		ReviewVO rvo = new ReviewVO();
		
		rvo.setRev_no((Integer.parseInt(request.getParameter("rev_no"))));
		rvo.setBook_no((Integer.parseInt(request.getParameter("book_no"))));
		rvo.setId(request.getParameter("name"));
		rvo.setRev_content(request.getParameter("rev_content"));
		rvo.setRev_date(request.getParameter("rev_date"));
		rvo.setRev_pwd(request.getParameter("rev_pwd"));
		
		HttpSession httpSession = request.getSession(true);
		//수정된 정보 세션에 저장
		httpSession.setAttribute("rvo", rvo);
		
		int result = ReviewDAO.update(rvo);
		System.out.println(result);			
			
		return "controller?type=reviewPage";
	}
		
}

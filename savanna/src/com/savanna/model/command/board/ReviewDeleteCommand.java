package com.savanna.model.command.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.savanna.model.command.Command;
import com.savanna.model.dao.ReviewDAO;

public class ReviewDeleteCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int rev_no = Integer.parseInt(request.getParameter("rev_no"));
		
		//DB 데이터 삭제 처리(rev_no 값 사용)
		ReviewDAO.delete(rev_no);
		//화면전환 
		return "controller?type=reviewPage";
	}		
		

}

package com.savanna.model.command.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.savanna.model.command.Command;
import com.savanna.model.dao.ReviewDAO;

public class CommDeleteCommand implements Command{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		int comm_no = Integer.parseInt(request.getParameter("comm_no"));
		int rev_no = Integer.parseInt(request.getParameter("rev_no"));
		
		//DB 데이터 삭제 처리(comm_no 값 사용)
		ReviewDAO.deleteComment(comm_no);
		
		return "controller?type=reviewPage";
	}
}

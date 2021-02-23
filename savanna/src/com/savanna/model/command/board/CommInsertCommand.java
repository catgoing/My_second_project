package com.savanna.model.command.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.dao.ReviewDAO;
import com.savanna.model.vo.CommVO;

public class CommInsertCommand implements Command{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		CommVO cvo = new CommVO();
		cvo.setRev_no((Integer.parseInt(request.getParameter("rev_no"))));
		cvo.setId(request.getParameter("id"));
		cvo.setComm_content(request.getParameter("comm_content"));
		
		ReviewDAO.insertComment(cvo);
			
		return "controller?type=reviewList";
	}
}

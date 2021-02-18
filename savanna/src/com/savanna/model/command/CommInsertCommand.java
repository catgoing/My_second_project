package com.savanna.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.ReviewDAO;
import com.savanna.model.vo.CommVO;

public class CommInsertCommand implements Command{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		CommVO cvo = new CommVO();
		cvo.setComm_no(Integer.parseInt(request.getParameter("comm_no")));
		cvo.setRev_no((Integer.parseInt(request.getParameter("rev_no"))));
		cvo.setId(request.getParameter("id"));
		cvo.setComm_content(request.getParameter("comm_content"));
		cvo.setComm_date(request.getParameter("comm_date"));
		cvo.setComm_pwd(request.getParameter("comm_pwd"));
		
		
		ReviewDAO.insertComment(cvo);
			
		return "write_ok.jsp";
	}
}

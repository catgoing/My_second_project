package com.savanna.model.command.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.savanna.model.command.Command;
import com.savanna.model.dao.MemberDAO;
import com.savanna.model.dao.ReviewDAO;
import com.savanna.model.vo.CommVO;
import com.savanna.model.vo.MemberVO;
import com.savanna.model.vo.ReviewVO;

public class commUpdateCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("ReviewUpdate");
		CommVO cvo = new CommVO();
		
		cvo.setComm_no((Integer.parseInt(request.getParameter("comm_no"))));
		cvo.setRev_no((Integer.parseInt(request.getParameter("rev_no"))));
		cvo.setId(request.getParameter("id"));
		cvo.setComm_content(request.getParameter("comm_content"));
		cvo.setComm_date(request.getParameter("comm_date"));
		cvo.setComm_pwd(request.getParameter("comm_pwd"));
		
		HttpSession httpSession = request.getSession(true);
		//수정된 정보 세션에 저장
		httpSession.setAttribute("comm", cvo);
		
		int result = ReviewDAO.updateComment(cvo);
		System.out.println(result);			
			
		return "controller?type=reviewPage";
	}
		
}

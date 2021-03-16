package com.savanna.model.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.dao.MemberDAO;
import com.savanna.model.vo.MemberVO;

public class AdminWithdrawalCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		MemberVO vo = new MemberVO();
		vo.setId(request.getParameter("id"));
		
//		System.out.println(vo);
		MemberDAO.withdrawal1(vo); // 회원정보 탈퇴테이블에 복사
		MemberDAO.withdrawal2(vo); // 회원정보 삭제
		return "controller?type=adminMemList";
	}
}

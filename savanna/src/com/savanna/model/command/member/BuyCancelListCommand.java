package com.savanna.model.command.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.savanna.model.command.Command;
import com.savanna.model.dao.MemberDAO;
import com.savanna.model.vo.BuyVO;
import com.savanna.model.vo.MemPagingVO2;
import com.savanna.model.vo.MemberVO;

public class BuyCancelListCommand implements Command{

	public BuyCancelListCommand() {

	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("user");
		String cPage = request.getParameter("cPage");
		String command = "buyCancelList";
		if( null != vo ) {

			String id = vo.getId();

			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");

			MemPagingVO2 p = new MemPagingVO2();
			Map<String, String> map = new HashMap<String, String>();
			
			p = p.paging(MemberDAO.cancelPsbCount(id), 15, 7, cPage);
			map = p.begin_end_id(p, id);


			// 현재 페이지에 표시할 데이터 조회
			List<BuyVO> list = MemberDAO.cancelPsbList(map); 

			request.setAttribute("buylist", list); // 최종 데이터 리스트
			request.setAttribute("pvo", p); // 페이지 정보
			request.setAttribute("cPage", cPage); // 현재 페이지
			request.setAttribute("id", id); // id값 유지를 위해 jsp 페이지로 전달
			request.setAttribute("command", command); // idx값 유지를 위해 jsp 페이지로 전달


		}

		return "member/buyCancel.jsp";
	}



}

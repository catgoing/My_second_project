package com.savanna.model.command.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.dao.MemberDAO;
import com.savanna.model.vo.BuyVO;
import com.savanna.model.vo.MemPagingVO;
import com.savanna.model.vo.MemPagingVO2;

public class AdminOrderListCommand implements Command{
	
	public AdminOrderListCommand() {
	
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String command = "adminOrderList";

			request.setCharacterEncoding("UTF-8");
			String cPage = request.getParameter("cPage");
			
			response.setContentType("text/html;charset=UTF-8");
			
			MemPagingVO2 p = new MemPagingVO2();
			Map<String, String> map = new HashMap<String, String>();
			
			p = p.paging(MemberDAO.adminOrderCount(), 15, 7, cPage);
			map = p.begin_end(p);

			List<BuyVO> list = MemberDAO.adminOrderList(map);
		
			request.setAttribute("orderlist", list); // 최종 데이터 리스트
			request.setAttribute("pvo", p); // 페이지 정보
			request.setAttribute("command", command); // idx값 유지를 위해 jsp 페이지로 전달

		
		return "member/adminOrderList.jsp";
	}
	
	

}

package com.savanna.model.command.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.command.paging.ListPaging;
import com.savanna.model.dao.MemberDAO;
import com.savanna.model.vo.MemberVO;

public class MemSearchCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(">> SearchController doGet() 실행~~~");
		String idx = request.getParameter("idx");
		String keyword = request.getParameter("keyword");
		System.out.println("> idx: "+ idx + ", keyword: " + keyword);
		
		String path = "";
		if (keyword == null || keyword.equals("")) { //search.jsp 로 이동
			path = "/savanna/controller?type=memList";
		} else { //검색값이 입력되었으니 DB에서 검색처리
			List<MemberVO> list = MemberDAO.getSearch(idx, keyword);
			System.out.println(">> 동적검색결과 list : " + list);
			
			//동적 검색 형태 확인
			String title = "";
			switch (idx) {
				case "0" : title = "아이디"; break;
				case "1" : title = "이름"; break;
				case "2" : title = "휴대전화"; break;
				case "3" : title = "이메일"; break;
			}
			
			//동적검색 결과 응답페이지로 전달
			request.setAttribute("list", list);
			request.setAttribute("title", title);
			new ListPaging<MemberVO>().PagingDistributor(new MemberDAO(), request, 10, 5);
			
			path = "member/memList.jsp";
		}
		return path;
	}

}

package com.savanna.model.command.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.command.paging.PagingFactory;
import com.savanna.model.dao.BookDAO;
import com.savanna.model.dao.ReviewDAO;
import com.savanna.model.vo.BookVO;
import com.savanna.model.vo.PageVO;
import com.savanna.model.vo.ReviewVO;

public class ReviewListCommand implements Command{
	

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PageVO page = PagingFactory.getPage(ReviewDAO.getTotalCount(), request.getParameter("cPage"));

		Map<String, Integer> map = new HashMap<>();
		map.put("begin", page.getCurPageRecordBeginIdx());
		map.put("end", page.getCurPageRecordEndIdx());

		//DB에서 현재페이지 표시할 게시글 조회
		List<ReviewVO> list = ReviewDAO.getList(map);

		request.setAttribute("list", list);
		request.setAttribute("pvo", page);
		return "board/list.jsp";
	}

}

package com.savanna.model.command.book;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.dao.BookDAO;
import com.savanna.model.vo.BookVO;
import com.savanna.model.vo.PageVO;
import com.savanna.model.vo.ReviewVO;

public class ListPagingCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PageVO page = new PageVO();

		page.setTotalRecord(ReviewDAO.getTotalCount());
		page.setTotalPage();

		page.initPage();

		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			page.setCurPage(Integer.parseInt(cPage));
		}

		page.setCurPageRecordEndIdx(page.getCurPage() * page.getRecordPerPage()); //현재페이지번호 * 페이지당 글수
		page.setCurPageRecordBeginIdx(page.getCurPageRecordEndIdx() - page.getRecordPerPage() + 1);

		if (page.getCurPageRecordEndIdx() > page.getTotalRecord()) {
			page.setCurPageRecordBeginIdx(page.getTotalRecord());
		   }

		int curPage = page.getCurPage();
		int curBlockBeginIdx = (curPage - 1) / page.getPagePerBlock() * page.getPagePerBlock() + 1;
		page.setCurBlockBeginIdx(curBlockBeginIdx);
		page.setCurBlockEndIdx(page.getCurBlockBeginIdx() + page.getPagePerBlock() - 1);

		if (page.getCurBlockEndIdx() > page.getTotalPage()) {
			page.setCurBlockEndIdx(page.getTotalPage());
		}


		Map<String, Integer> map = new HashMap<>();
		map.put("begin", page.getCurPageRecordBeginIdx());
		map.put("end", page.getCurPageRecordEndIdx());

		//DB에서 현재페이지 표시할 게시글 조회
		List<ReviewVO> list = ReviewDAO.getList(map);

		request.setAttribute("list", list);
		request.setAttribute("pvo", page);
		return "book/bookList.jsp";
	}

	public boolean isLoginValidate() {
		return true;
	}

}

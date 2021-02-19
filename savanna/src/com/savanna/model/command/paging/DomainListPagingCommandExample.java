package com.savanna.model.command.paging;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.dao.StaticBookDAO;
import com.savanna.model.vo.PageVO;

public class DomainListPagingCommandExample implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PageVO page = PageFactory.getPage(StaticBookDAO.getBookCount(), request.getParameter("cPage"));
		request.setAttribute("pvo", page);
		request.setAttribute("list", StaticBookDAO.getPagedBookList(
										getRecordRange(page.getCurPageRecordBeginIdx(), page.getCurPageRecordEndIdx())
									));
		
		return "book/bookList.jsp";
	}
	
	public Map<String, Integer> getRecordRange(int recordBeginIdx, int recordEndIdx) {
		return new HashMap<String, Integer>() {{
					put("begin", recordBeginIdx);
					put("end", recordEndIdx);
				}};
	}

	public boolean isLoginValidate() {
		return true;
	}

}

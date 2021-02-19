package com.savanna.model.command.paging;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.savanna.model.dao.BookDAO;
import com.savanna.model.dao.SuperDAO;
import com.savanna.model.vo.PageVO;

public class ListPaging<T> {

	public void PagingDistributor(SuperDAO<T> dao, HttpServletRequest request)
			throws ServletException, IOException {
		PagingDistributor(dao, request, 3, 3);
	}
	public void PagingDistributor(SuperDAO<T> dao, HttpServletRequest request, int recordPerPage, int pagePerBlock)
			throws ServletException, IOException {
		PageVO page = PageFactory.getPage(dao.getTotalCount(), request.getParameter("cPage"), recordPerPage, pagePerBlock);
		request.setAttribute("pvo", page);
		request.setAttribute("list", dao.getPagedList(
										getRecordRange(page.getCurPageRecordBeginIdx(), page.getCurPageRecordEndIdx())
									));
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

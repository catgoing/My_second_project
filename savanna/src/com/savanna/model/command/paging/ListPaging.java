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
	public static Map<String, Integer> getRecordRange(int recordBeginIdx, int recordEndIdx) {
		return new HashMap<String, Integer>() {{
					put("begin", recordBeginIdx);
					put("end", recordEndIdx);
				}};
	}
	
	public void PagingDistributor(SuperDAO<T> dao, HttpServletRequest request, String id, int recordPerPage, int pagePerBlock)
			throws ServletException, IOException {
		PageVO page = PageFactory.getPage(dao.getTotalCount2(id), request.getParameter("cPage"), recordPerPage, pagePerBlock);
		request.setAttribute("pvo", page);
		request.setAttribute("list", dao.getPagedList2(
										getRecordRange(id, page.getCurPageRecordBeginIdx(), page.getCurPageRecordEndIdx())
									));
	}
	public static Map<String, Object> getRecordRange(String id, int recordBeginIdx, int recordEndIdx) {
		return new HashMap<String, Object>() {{
					put("id", id);
					put("begin", recordBeginIdx);
					put("end", recordEndIdx);
				}};
	}
	
	public boolean isLoginValidate() {
		return true;
	}

}

package com.savanna.model.command.paging;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.savanna.model.dao.BookDAO;
import com.savanna.model.vo.BookVO;
import com.savanna.model.vo.PageVO;

public interface PagingFactory {
	public static PageVO getPage(String cPage){
		PageVO page = new PageVO();

		page.setCurPage(isCurPageNotNull(cPage) ? Integer.parseInt(cPage) : 1);
		page.setTotalRecord(BookDAO.getBookCount());
		page.setTotalPage();
		page.initPage();
		page.setCurPageRecordEndIdx(page.getCurPage() * page.getRecordPerPage());
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

		return page;
	}
	static boolean isCurPageNotNull(String cPage) {
		return cPage != null ? true : false;
	}
}

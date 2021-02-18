package com.savanna.model.command.paging;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.savanna.model.dao.BookDAO;
import com.savanna.model.vo.BookVO;
import com.savanna.model.vo.PageVO;

public interface PagingFactory {
	public static PageVO getPage(int recordCount, String cPage){
		PageVO page = new PageVO();

		page.setCurPage(isCurPageNotNull(cPage) ? Integer.parseInt(cPage) : 1);
		page.initPage(recordCount);

		return page;
	}
	static boolean isCurPageNotNull(String cPage) {
		return cPage != null ? true : false;
	}
}

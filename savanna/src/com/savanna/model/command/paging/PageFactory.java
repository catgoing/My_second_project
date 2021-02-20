package com.savanna.model.command.paging;

import com.savanna.model.vo.PageVO;

public interface PageFactory {
	public static PageVO getPage(int recordCount, String cPage, int recordPerPage, int pagePerBlock){
		PageVO page = new PageVO(recordPerPage, pagePerBlock);

		page.setCurPage(isCurPageNotNull(cPage) ? Integer.parseInt(cPage) : 1);
		page.initPage(recordCount);

		return page;
	}
	static boolean isCurPageNotNull(String cPage) {
		return cPage != null ? true : false;
	}
}

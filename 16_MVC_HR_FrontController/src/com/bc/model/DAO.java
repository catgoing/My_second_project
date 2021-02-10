package com.bc.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.BookVO;
import com.bc.mybatis.DBService;

public class DAO {

	//직원 전체 목록 조회
	public static List<BookVO> getBookList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<BookVO> list = ss.selectList("mystudy.booklist");
		ss.close();
		return list;
	}
}












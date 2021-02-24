package com.savanna.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.savanna.model.vo.BookVO;
import com.savanna.mybatis.DBService;

public class BookDAO implements SuperDAO {
	
	@Override
	public int getTotalCount() {
		return BookDAO.getBookCount();
	}
	@Override
	public List getPagedList(Map map) {
		return this.getPagedBookList(map);
	}

	public static List<BookVO> getBookList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<BookVO> list = ss.selectList("mystudy.bookList");
		ss.close();
		return list;
	}
	
	public List<BookVO> getPagedBookList(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<BookVO> list = ss.selectList("mystudy.pagedBookList", map);
		ss.close();
		return list;
	}
	
	public static int getBookCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("mystudy.bookCount");
		ss.close();
		return totalCount;
	}
	
	public static BookVO getBookDetail(int book_no) {
		SqlSession ss = DBService.getFactory().openSession();
		BookVO vo = ss.selectOne("mystudy.bookdetail", book_no);
		ss.close();
		return vo;
	}

	public static int deleteBook(int book_no) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("mystudy.deletebook", book_no);
		ss.close();
		return result;
	}
	
	public static int insertBook(BookVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("mystudy.insertbook", vo);
		ss.close();
		return result;
	}
	
	public static int updateBook(BookVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("mystudy.updatebook", vo);
		ss.close();
		return result;
	}
	
	@Override
	public int getTotalCount2(String str) {
		return 0;
	}
	@Override
	public List getPagedList2(Map map) {
		return null;
	}
}












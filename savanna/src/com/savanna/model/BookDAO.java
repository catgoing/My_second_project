package com.savanna.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.savanna.model.vo.BookVO;
import com.savanna.mybatis.DBService;

public class BookDAO {
	
	public static List<BookVO> getBookList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<BookVO> list = ss.selectList("mystudy.booklist");
		ss.close();
		return list;
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
	
}












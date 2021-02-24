package com.savanna.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.savanna.model.vo.BookVO;
import com.savanna.mybatis.DBService;

public class StaticBookDAO {
	public static int searchBookCount(Map<String, String> map) {
		System.out.println(map.get("keyword"));
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.selectOne("book.searchBookCount", map);
		ss.close();
		return result;
	}
	public static List<BookVO> searchBook(Map<String, String> map) {
		System.out.println(map.get("keyword"));
		SqlSession ss = DBService.getFactory().openSession(true);
		List<BookVO> result = ss.selectList("book.searchBook", map);
		ss.close();
		return result;
	}
}












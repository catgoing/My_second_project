package com.savanna.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.savanna.model.vo.BookVO;
import com.savanna.model.vo.WishVO;
import com.savanna.mybatis.DBService;

public class WishDAO implements SuperDAO{


	//찜목록의 전체 건수 조회(id당)
	public static int getWishCount(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		int count = ss.selectOne("mystudy.getwishcount", id);
		ss.close();
		return count;
	}

	//페이지에 해당하는 찜목록조회(id당)
	public static List<WishVO> getWishList(Map<String, Object> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<WishVO> list = ss.selectList("mystudy.selectwishlist", map);
		ss.close();
		return list;
	}

	//중복조회(map : id, book_no)
	public static int jungbokCheck(Map<String, Object> map) {
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.selectOne("mystudy.jungbok", map);
		ss.close();
		return result;
	}

	//찜목록에 추가(map : id, book_no)
	public static void insertWishList(Map<String, Object> map) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("mystudy.insertwish", map);
		ss.close();
	}

	//찜목록에서 삭제(map : id, book_no)
	public static void deleteWish(Map<String, Object> map) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("mystudy.deletewish", map);
		ss.close();
	}

	/*
	//메모추가(map : id, book_no, memo)
	public static void updateWishMemo(Map<String, Object> map) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("mystudy.updatewishmemo", map);
		ss.close();
	}
	*/


	@Override
	public int getTotalCount() {
		return 0;
	}


	@Override
	public List getPagedList(Map map) {
		return null;
	}

	@Override
	public int getTotalCount2(String id) {
		return getWishCount(id);
	}

	@Override
	public List getPagedList2(Map map) {
		return getWishList(map);
	}
}

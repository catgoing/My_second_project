package com.savanna.model.command.paging;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.savanna.model.vo.BuyVO;
import com.savanna.model.vo.MemberVO;
import com.savanna.mybatis.DBService;

public class PagingExampleDAO {


	// 동적검색 결과 수 조회
	public static int getSearchCount(String idx, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("idx", idx);
		map.put("keyword", keyword);
		
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("member.searchCount", map);
		ss.close();
		return totalCount;
	}
	
	// 검색결과에 해당하는 회원목록 가져오기
	public static List<MemberVO> getsearchList(Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list = ss.selectList("member.searchList", map);
		ss.close();
		return list;
	}

}













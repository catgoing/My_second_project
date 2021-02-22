package com.savanna.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.savanna.model.vo.BuyVO;
import com.savanna.model.vo.MemberVO;
import com.savanna.mybatis.DBService;

public class MemberDAO implements SuperDAO{

	//회원가입
	public static int signUp(MemberVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("member.signUp", vo);
		ss.close();
		return result;
	}
	
	public static MemberVO signIn(MemberVO vo1) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO vo = ss.selectOne("member.signIn", vo1);
		ss.close();
		return vo;
	}
	
	//아이디 중복 조회 
	public static int idCheck(MemberVO vo1) {
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.selectOne("member.id_check", vo1);
		ss.close();
		return result;
	}
	
	// 정보수정 전 패스워드 확인
	public static int pwdCheck(MemberVO vo1) {
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.selectOne("member.pwd_check", vo1);
		ss.close();
		return result;
	}
	
	// 정보수정
	public static MemberVO update(MemberVO vo1) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO vo = ss.selectOne("member.update", vo1);
		ss.close();
		return vo;
	}
	
	// 회원데이터 탈퇴테이블로 복사
	public static int withdrawal1(MemberVO vo1) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("member.withdrawal1", vo1);
		ss.close();
		return result;
	}
	
	// 회원데이터 탈퇴테이블로 복사
	public static int withdrawal2(MemberVO vo1) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("member.withdrawal2", vo1);
		ss.close();
		return result;
	}
	
	public static List<MemberVO> getMemList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list = ss.selectList("member.memList");
		ss.close();
		return list;
	}
	
	// 전체 회원수 조회
	public static int getMemberCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("member.totalCount");
		ss.close();
		return totalCount;
	}
	
	// 페이지에 해당하는 회원목록 가져오기
	public static List<MemberVO> getList(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list = ss.selectList("member.list", map);
		ss.close();
		return list;
	}
	
	// 아이디 찾기
	public static String inquiryId(MemberVO vo1) {
		SqlSession ss = DBService.getFactory().openSession();
		String id = ss.selectOne("member.inquiryId", vo1);
		System.out.println("dao id: " + id);
		ss.close();
		return id;
	}
	// 패스워드 찾기
	public static String inquiryPwd(MemberVO vo1) {
		SqlSession ss = DBService.getFactory().openSession();
		String pwd = ss.selectOne("member.inquiryPwd", vo1);
		ss.close();
		return pwd;
	}
	
	// 회원 상세정보
	public static MemberVO memDetail(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO vo = ss.selectOne("member.memDetail", id);
		ss.close();
		return vo;
	}
	
	//동적검색
	public static List<MemberVO> getSearch(String idx, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("idx", idx);
		map.put("keyword", keyword);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list = ss.selectList("member.search", map);
		ss.close();
		return list;
	}
	
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

	
	// 구매목록
	public static List<BuyVO> buyList(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<BuyVO> list = ss.selectList("member.buyList", map);
		ss.close();
		return list;
}


	@Override
	public int getTotalCount() {
		return this.getMemberCount();
	}

	@Override
	public List getPagedList(Map map) {
		return this.getList(map);

	}

	@Override
	public int getTotalCount2(String str) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List getPagedList2(Map map) {
		// TODO Auto-generated method stub
		return null;
	}
}












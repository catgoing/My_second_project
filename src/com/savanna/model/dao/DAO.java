package com.savanna.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.savanna.model.vo.MemberVO;
import com.savanna.mybatis.DBService;


public class DAO {

	//회원가입
	public static int signUp(MemberVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("member.signUp", vo);
		ss.close();
		return result;
	}
	
	//로그인 결과
//	public static List<MemberVO> signIn(String id) {
//		SqlSession ss = DBService.getFactory().openSession();
//		List<MemberVO> list = ss.selectOne("member.signIn", id);
//		ss.close();
//		return list;
//	}
	
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
	
	public static int pwdCheck(MemberVO vo1) {
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.selectOne("member.pwd_check", vo1);
		ss.close();
		return result;
	}
	
	//동적검색
	public static List<MemberVO> getSearch(String idx, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("idx", idx);
		map.put("keyword", keyword);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list = ss.selectList("HR.search", map);
		ss.close();
		return list;
	}
		
}












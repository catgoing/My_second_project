package com.savanna.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.savanna.model.vo.BookVO;
import com.savanna.model.vo.MemberVO;
import com.savanna.mybatis.DBService;

public class DAO {

	//직원 전체 목록 조회
	public static List<BookVO> getBookList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<BookVO> list = ss.selectList("mystudy.booklist");
		ss.close();
		return list;
	}
	
	//회원가입
	public static int signUp(MemberVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("mystudy.sign_up", vo);
		ss.close();
		return result;
	}

	//로그인
	public static MemberVO signIn(MemberVO vo1) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO vo = ss.selectOne("mystudy.sign_in", vo1);
		ss.close();
		return vo;
	}
	
	//아이디 중복 조회 
	public static int idCheck(MemberVO vo1) {
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.selectOne("mystudy.id_check", vo1);
		ss.close();
		return result;
	}
	
	//정보 수정 시 패스워드 확인
	public static int pwdCheck(MemberVO vo1) {
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.selectOne("mystudy.pwd_check", vo1);
		ss.close();
		return result;
	}
	
	
}












package com.savanna.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.savanna.model.vo.CommVO;
import com.savanna.model.vo.ReviewVO;
import com.savanna.mybatis.DBService;


public class ReviewDAO implements SuperDAO {
	@Override
	public int getTotalCount() {
		return this.getReivewCount();
	}

	@Override
	public List getPagedList(Map map) {
		return this.getList(map);
	}
	
	// 게시글(REVIEWS)의 전체 건수 조회
	private int getReivewCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("board.reviewCount");
		ss.close();
		return totalCount;
	}
	
	//페이지에 해당하는 글목록(게시글) 가져오기
	private List<ReviewVO> getList(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<ReviewVO> list = ss.selectList("board.reviewList", map);
		ss.close();
		return list;
	}
	
	//페이지에 해당하는 글목록(게시글) 가져오기
	private List<ReviewVO> getListSearch(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<ReviewVO> list = ss.selectList("board.reviewSearch", map);
		ss.close();
		return list;
	}
	
	//게시글 번호에 해당하는 게시글 하나 조회
	public static ReviewVO selectOne(String rev_no) {
		SqlSession ss = DBService.getFactory().openSession();
		ReviewVO rvo = ss.selectOne("board.one", rev_no);
		ss.close();
		return rvo;
	}
	
	//게시글 입력 처리
	public static int insert(ReviewVO rvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("board.review_insert", rvo);
		ss.close();
		return result;
	}
	
	//게시글 수정 처리
	public static int update(ReviewVO rvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("board.review_update", rvo);
		ss.close();
		return result;
	}
	
	//게시글 삭제 처리
	public static int delete(int rev_no) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("board.review_delete", rev_no);
		ss.close();
		return result;
	}	
	
	//================= 댓글관련 =====================
	public static List<CommVO> getCommList(String rev_no) {
		SqlSession ss = DBService.getFactory().openSession();
		List<CommVO> c_list = ss.selectList("board.commList", rev_no);
		ss.close();
		return c_list;
	}
	
	//댓글 입력
	public static int insertComment(CommVO cvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("board.comm_insert", cvo);
		ss.close();
		return result;
	}
	
	//댓글 수정 처리
	public static int updateComment(CommVO cvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("board.review_update", cvo);
		ss.close();
		return result;
	}
	
	//댓글 삭제
	public static int deleteComment(int comm_no) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("board.comm_delete", comm_no);
		ss.close();
		return result;
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

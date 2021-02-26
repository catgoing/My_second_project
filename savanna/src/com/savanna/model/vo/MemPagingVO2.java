package com.savanna.model.vo;

import java.util.HashMap;
import java.util.Map;

//회원목록의 페이징 처리를 위한 값을 저장 관리
public class MemPagingVO2 {
	private int nowPage = 1; //현재 페이지
	private int nowBlock = 1; //현재 블록(페이지 담는 단위)
	
	private int numPerPage = 10; //하나의 페이지에 표시할 리스트 수
	private int pagePerBlock = 5; //블록당 표시하는 페이지 개수
	
	private int totalCount = 0; //총 회원수
	private int totalPage = 0; //전체 페이지 개수
	private int totalBlock = 0; //전체 블록 개수
	
	private int begin = 0; //현재 페이지상의 시작 회원번호
	private int end = 0; //현재 페이지상의 마지막 회원번호
	
	private int beginPage = 0; //현재 블록의 시작 페이지 번호
	private int endPage = 0; //현재 블록의 끝 페이지 번호
	
	public MemPagingVO2() {
	
	}
	
	public MemPagingVO2 paging(int count, int listcount_per_page, int pagePerBlock, String cPage) {
		
		MemPagingVO2 p = new MemPagingVO2();
		
		//1. 검색한 데이터의 수를 구하기
		p.setTotalCount(count); // 총 데이터 수
		p.setNumPerPage(listcount_per_page);
		p.setTotalPage();
		p.setPagePerBlock(pagePerBlock);
//		System.out.println("> 전체 검색결과 수 : " + p.getTotalMember());
//		System.out.println("> 전체 페이지 수 : " + p.getTotalPage());
		
		//2. 현재 페이지 구하기
//		System.out.println("cpage: " + cPage);
		
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		} else p.setNowPage(1);
//		
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage()); //현재 페이지 번호 * 페이지당 데이터 수
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1); 
		
		// 끝 번호가 데이터 건수보다 많은 경우 총 데이터 수와 일치화
		if (p.getEnd() > p.getTotalMember()) {
			p.setEnd(p.getTotalMember());
		}
		
		//----- 블록(block) 계산하기 -----------
		//4. 블록의 시작페이지, 끝페이지 구하기(현재 페이지 번호 사용)
		//시작페이지 구하기
		int nowPage = p.getNowPage();
		int beginPage = (nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
		
		//4-1. 끝페이지(endPage)가 전체 페이지수(totalPage) 보다 크면
		// 끝 페이지 값을 전체 페이지 수로 변경 처리
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		begin_end(p);
		
//		System.out.println(">>시작페이지(beginPage) : " + p.getBeginPage());
//		System.out.println(">>끝페이지(endPage) : " + p.getEndPage());
		

		
		
		return p;
	}
	
	public Map<String, String> begin_end(MemPagingVO2 p){
		
		Map<String, String> map = new HashMap<>();
		map.put("begin", Integer.toString(p.getBegin()));
		map.put("end", Integer.toString(p.getEnd()));
		
		return map;
	}
	
	public Map<String, String> begin_end_id(MemPagingVO2 p, String id){
		
		Map<String, String> map = new HashMap<>();
		map.put("begin", Integer.toString(p.getBegin()));
		map.put("end", Integer.toString(p.getEnd()));
		map.put("id", id);
		
		return map;
	}
	
	public Map<String, String> idx_keyword(MemPagingVO2 p, String idx, String keyword){
		
		Map<String, String> map = new HashMap<>();
		map.put("begin", Integer.toString(p.getBegin()));
		map.put("end", Integer.toString(p.getEnd()));
		map.put("idx", idx);
		map.put("keyword", keyword);
		
		return map;
	}
	
	//전체 페이지 개수 구하기
	//totalMember 값을 페이지당 표시할 회원의 개수 값을 나누고,
	//나머지가 있으면 페이지 하나 더 추가
	public void setTotalPage() {
		totalPage = totalCount / numPerPage;
		if (totalCount % numPerPage > 0) totalPage++;
	}
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getPagePerBlock() {
		return pagePerBlock;
	}
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	public int getTotalMember() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getBegin() {
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


}

















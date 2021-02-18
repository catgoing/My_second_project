package com.savanna.model.vo;

//게시판의 페이징 처리를 위한 값을 저장 관리
public class PageVO {
	private int curPage = 1; //현재페이지
	private int curBlock = 1; //현재 블록(페이지 담는 단위)
	
	private int recordPerPage = 3; //하나의 페이지에 표시할 게시글 수
	private int pagePerBlock = 3; //블록당 표시하는 페이지 갯수
	
	private int totalRecord = 0; //총 게시물 갯수(원본 게시글 수)
	private int totalPage = 0; //전체 페이지 갯수
	private int totalBlock = 0; //전체 블록 갯수
	
	private int curPageRecordBeginIdx = 0; //현재 페이지상의 시작 글번호
	private int curPageRecordEndIdx = 0; //현재 페이지상의 마지막 글번호
	
	private int curBlockBeginIdx = 0; //현재 블록의 시작 페이지 번호
	private int curBlockEndIdx = 0; //현재 블록의 끝 페이지 번호

	public void initPage(int recordCount) {
		this.setRecordScale(recordCount);
		this.setRangeOfPageNo();
		this.setRangeOfBlockNo();
		this.logging();
	}
	public void setRecordScale(int recordCount) {
		this.setTotalRecord(recordCount);
		this.setTotalPage();
	}
	public void setTotalPage() {
		this.setTotalPage(this.getTotalRecord() % this.getRecordPerPage() > 0
						? (this.getTotalRecord() / this.getRecordPerPage())+1
						: this.getTotalRecord() / this.getRecordPerPage());
	}
	public void setRangeOfPageNo() {
		this.setCurPageRecordBeginIdx((this.getCurPage()-1) * this.getRecordPerPage() + 1);
		this.setCurPageRecordEndIdx(this.getCurPageRecordEndIdx() > this.getTotalRecord()
									? this.getTotalRecord()
									: this.getCurPage() * this.getRecordPerPage());
	}
	public void setRangeOfBlockNo() {
		this.setCurBlockBeginIdx((int)((this.getCurPage()-1) / this.getPagePerBlock()) * this.getPagePerBlock() + 1);
		this.setCurBlockEndIdx(this.getCurBlockEndIdx() > this.getTotalPage()
								? this.getTotalPage()
								: this.getCurBlockBeginIdx() + this.getPagePerBlock() - 1);
	}
	public void logging() {
		System.out.println("--------------");
		System.out.println("> 전체 게시글 수 : " + this.getTotalRecord());
		System.out.println("> 전체 페이지 수 : " + this.getTotalPage());
		System.out.println(">> 현재페이지 : " + this.getCurPage());
		System.out.println(">> 시작글번호(begin) : " + this.getCurPageRecordBeginIdx());
		System.out.println(">> 끝 글번호(end) : " + this.getCurPageRecordEndIdx());
		System.out.println(">> 시작페이지(beginPage) : " + this.getCurBlockBeginIdx());
		System.out.println(">> 끝페이지(endPage) : " + this.getCurBlockEndIdx());
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	public int getRecordPerPage() {
		return recordPerPage;
	}
	public void setRecordPerPage(int recordPerPage) {
		this.recordPerPage = recordPerPage;
	}
	public int getPagePerBlock() {
		return pagePerBlock;
	}
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
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
	public int getCurPageRecordBeginIdx() {
		return curPageRecordBeginIdx;
	}
	public void setCurPageRecordBeginIdx(int curPageRecordBeginIdx) {
		this.curPageRecordBeginIdx = curPageRecordBeginIdx;
	}
	public int getCurPageRecordEndIdx() {
		return curPageRecordEndIdx;
	}
	public void setCurPageRecordEndIdx(int curPageRecordEndIdx) {
		this.curPageRecordEndIdx = curPageRecordEndIdx;
	}
	public int getCurBlockBeginIdx() {
		return curBlockBeginIdx;
	}
	public void setCurBlockBeginIdx(int curBlockBeginIdx) {
		this.curBlockBeginIdx = curBlockBeginIdx;
	}
	public int getCurBlockEndIdx() {
		return curBlockEndIdx;
	}
	public void setCurBlockEndIdx(int curBlockEndIdx) {
		this.curBlockEndIdx = curBlockEndIdx;
	}
	
}

















package com.savanna.model.vo;

public class ReviewVO {
	private int rev_no, book_no;
	private String id, rev_content, rev_date, rev_pwd;
	
	public ReviewVO() {
		super();
	}
	
	public ReviewVO(int rev_no, int book_no, String id, String rev_content, String rev_date, String rev_pwd) {
		super();
		this.rev_no = rev_no;
		this.book_no = book_no;
		this.id = id;
		this.rev_content = rev_content;
		this.rev_date = rev_date;
		this.rev_pwd = rev_pwd;
	}



	public int getRev_no() {
		return rev_no;
	}
	
	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}
	
	public int getBook_no() {
		return book_no;
	}
	
	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getRev_content() {
		return rev_content;
	}
	
	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}
	
	public String getRev_date() {
		return rev_date;
	}
	
	public void setRev_date(String rev_date) {
		this.rev_date = rev_date;
	}

	public String getRev_pwd() {
		return rev_pwd;
	}
	
	public void setRev_pwd(String rev_pwd) {
		this.rev_pwd = rev_pwd;
	}

	@Override
	public String toString() {
		return "ReviewVO [rev_no=" + rev_no + ", book_no=" + book_no + ", id=" + id + ", rev_content=" + rev_content
				+ ", rev_date=" + rev_date + ", rev_pwd=" + rev_pwd + "]";
	}
	
	
}


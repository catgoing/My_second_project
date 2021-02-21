package com.savanna.model.vo;

public class WishVO {
	
	private int wish_no, book_no;
	private String id, memo, wish_date;
	
	private String book_name, writer, pub_date, publisher;
	private int price;

	public WishVO() {}
	
	public WishVO(int wish_no, int book_no, String id, String wish_date, String book_name, String writer,
			String pub_date, int price) {
		this.wish_no = wish_no;
		this.book_no = book_no;
		this.id = id;
		this.wish_date = wish_date;
		this.book_name = book_name;
		this.writer = writer;
		this.pub_date = pub_date;
		this.price = price;
	}

	public WishVO(int wish_no, int book_no, String id, String wish_date) {
		super();
		this.wish_no = wish_no;
		this.book_no = book_no;
		this.id = id;
		this.wish_date = wish_date;
	}
	
	// wishlist DB
	public int getWish_no() {
		return wish_no;
	}

	public void setWish_no(int wish_no) {
		this.wish_no = wish_no;
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

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getWish_date() {
		return wish_date;
	}

	public void setWish_date(String wish_date) {
		this.wish_date = wish_date;
	}
	
	// VO저장용 Book데이터
	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPub_date() {
		return pub_date;
	}

	public void setPub_date(String pub_date) {
		this.pub_date = pub_date;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	
}

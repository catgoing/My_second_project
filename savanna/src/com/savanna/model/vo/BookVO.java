package com.savanna.model.vo;

public class BookVO {
	private int book_no;
	private String book_name;
	private String writer;
	private String publisher;
	private String pub_date;
	private int price;
	private String book_desc;
	private int stock;
	private String category;
	public int getBook_no() {
		return book_no;
	}
	public void setBook_no(int book_no) {
		this.book_no = book_no;
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
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
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
	public String getBook_desc() {
		return book_desc;
	}
	public void setBook_desc(String book_desc) {
		this.book_desc = book_desc;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public BookVO(int book_no, String book_name, String writer, String publisher, String pub_date, int price,
			String book_desc, int stock, String category) {
		super();
		this.book_no = book_no;
		this.book_name = book_name;
		this.writer = writer;
		this.publisher = publisher;
		this.pub_date = pub_date;
		this.price = price;
		this.book_desc = book_desc;
		this.stock = stock;
		this.category = category;
	}
}
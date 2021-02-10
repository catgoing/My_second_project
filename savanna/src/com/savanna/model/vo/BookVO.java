package com.savanna.model.vo;

public class BookVO {
	private int bookNo;
	private String book_name;
	private String writer;
	private String publisher;
	private String pub_date;
	private int price;
	private String book_desc;
	private int stock;
	private String category;
	@Override
	public String toString() {
		return "Book [bookNo=" + bookNo + ", bookName=" + book_name + ", writer=" + writer + ", publisher=" + publisher
				+ ", pubDate=" + pub_date + ", price=" + price + ", bookDesc=" + book_desc + ", stock=" + stock
				+ ", category=" + category + "]";
	}
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public String getBookName() {
		return book_name;
	}
	public void setBookName(String bookName) {
		this.book_name = bookName;
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
	public String getPubDate() {
		return pub_date;
	}
	public void setPubDate(String pubDate) {
		this.pub_date = pubDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getBookDesc() {
		return book_desc;
	}
	public void setBookDesc(String bookDesc) {
		this.book_desc = bookDesc;
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
	public BookVO(int bookNo, String bookName, String writer, String publisher, String pubDate, int price,
			String bookDesc, int stock, String category) {
		super();
		this.bookNo = bookNo;
		this.book_name = bookName;
		this.writer = writer;
		this.publisher = publisher;
		this.pub_date = pubDate;
		this.price = price;
		this.book_desc = bookDesc;
		this.stock = stock;
		this.category = category;
	}
	public BookVO() {
	}
	
}
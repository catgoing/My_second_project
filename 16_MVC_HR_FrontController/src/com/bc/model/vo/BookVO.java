package com.bc.model.vo;

public class BookVO {
	private int bookNo;
	private String bookName;
	private String writer;
	private String publisher;
	private String pubDate;
	private int price;
	private String bookDesc;
	private int stock;
	private String category;
	@Override
	public String toString() {
		return "Book [bookNo=" + bookNo + ", bookName=" + bookName + ", writer=" + writer + ", publisher=" + publisher
				+ ", pubDate=" + pubDate + ", price=" + price + ", bookDesc=" + bookDesc + ", stock=" + stock
				+ ", category=" + category + "]";
	}
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
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
		return pubDate;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getBookDesc() {
		return bookDesc;
	}
	public void setBookDesc(String bookDesc) {
		this.bookDesc = bookDesc;
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
		this.bookName = bookName;
		this.writer = writer;
		this.publisher = publisher;
		this.pubDate = pubDate;
		this.price = price;
		this.bookDesc = bookDesc;
		this.stock = stock;
		this.category = category;
	}
	public BookVO() {
	}
	
}
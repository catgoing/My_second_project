package com.savanna.model.vo;

public class BuyVO {
	
	private String book_no, book_name, quan, pur_date, price, addr;
	
	public BuyVO() {
	}
	
	
	public BuyVO(String book_no, String book_name, String quan, String pur_date, String price, String addr) {
		super();
		this.book_no = book_no;
		this.book_name = book_name;
		this.quan = quan;
		this.pur_date = pur_date;
		this.price = price;
		this.addr = addr;
	}

	public String getBook_no() {
		return book_no;
	}

	public void setBook_no(String book_no) {
		this.book_no = book_no;
	}
	
	public String getBook_name() {
		return book_name;
	}
	
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getQuan() {
		return quan;
	}

	public void setQuan(String quan) {
		this.quan = quan;
	}

	public String getPur_date() {
		return pur_date;
	}

	public void setPur_date(String pur_date) {
		this.pur_date = pur_date;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}


	public String getAddr() {
		return addr;
	}


	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	
	
}
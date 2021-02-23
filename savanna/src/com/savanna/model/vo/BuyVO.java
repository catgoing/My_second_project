package com.savanna.model.vo;

public class BuyVO {
	
	private String book_no, book_name, quan, pur_date, price, 
					addr, buylist_no, status, status_print, id;
	
	public BuyVO() {
	}
	
	
	public BuyVO(String book_no, String book_name, String quan, String pur_date, 
				String price, String addr, String buylist_no, String status, String status_print, String id) {
		super();
		this.book_no = book_no;
		this.book_name = book_name;
		this.quan = quan;
		this.pur_date = pur_date;
		this.price = price;
		this.addr = addr;
		this.buylist_no = buylist_no;
		this.status = status;
		this.status_print = status_print;
		this.id = id;
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


	public String getBuylist_no() {
		return buylist_no;
	}


	public void setBuylist_no(String buylist_no) {
		this.buylist_no = buylist_no;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		
		this.status = status;
		
		setStatus_print(status);
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getStatus_print() {
		return status_print;
	}


	public void setStatus_print(String status) {
		
		String buyStatus = "";
		
		switch (Integer.parseInt(status)) {
		case 0:
			buyStatus = "결제완료";
			break;
		case 1:
			buyStatus = "배송중";
			break;
		case 2:
			buyStatus = "배송완료";
			break;
		case 3:
			buyStatus = "주문취소";
			break;
		}
		
		switch (status) {
		case "결제완료":
			buyStatus = "0";
			break;
		case "배송중":
			buyStatus = "1";
			break;
		case "배송완료":
			buyStatus = "2";
			break;
		case "주문취소":
			buyStatus = "3";
			break;

		}
		
		this.status_print = buyStatus;
		
	}
	
	
	
	
	
}
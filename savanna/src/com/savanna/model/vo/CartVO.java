package com.savanna.model.vo;

public class CartVO {
	//DB 데이터
	private int cart_no;
	private String id;
	private int book_no;
	private String book_name;
	private String addr;
	private int cart_price; //각 상품의 가격
	private int cart_quan;

	//여기서 작성
	private int shippingCharge; //배송비(기본 2500원~)
	private int allitemsPrice;	//전체가격
	private int totalPrice; 	//최종결제가격
	
	public CartVO() {}
	
	public CartVO(String id, int book_no, String book_name, String addr, int cart_price,
			int cart_quan) {
		super();
		this.id = id;
		this.book_no = book_no;
		this.book_name = book_name;
		this.addr = addr;
		this.cart_price = cart_price;
		this.cart_quan = cart_quan;
	}
	
	public CartVO(int shippingCharge, int allitemsPrice, int totalPrice) {
		super();
		this.shippingCharge = shippingCharge;
		this.allitemsPrice = allitemsPrice;
		this.totalPrice = totalPrice;
	}

	public int getAllitemsPrice() {
		return allitemsPrice;
	}

	public void setAllitemsPrice(int allitemsPrice) {
		this.allitemsPrice = allitemsPrice;
	}

	public int getShippingCharge() {
		return shippingCharge;
	}
	
	//배송비 설정 (기본 2500원, 2만원 이상 무배)
	public void setShippingCharge(int shippingCharge) {
		this.shippingCharge = shippingCharge;
	}

	public int getTotalPrice() {
		return totalPrice;
	}
	
	//최종결제가격(전체 가격 + 배송비)
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
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
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getCart_price() {
		return cart_price;
	}
	public void setCart_price(int cart_price) {
		this.cart_price = cart_price;
	}
	public int getCart_quan() {
		return cart_quan;
	}
	public void setCart_quan(int cart_quan) {
		this.cart_quan = cart_quan;
		//수량이 변경되면 수량합계가격(cart_price) 저장
		cart_price = cart_price * cart_quan;
	}

	@Override
	public String toString() {
		return "CartVO [cart_no=" + cart_no + ", id=" + id + ", book_no=" + book_no + ", book_name=" + book_name + ", addr="
				+ addr + ", cart_price=" + cart_price + ", cart_quan=" + cart_quan + ", shippingCharge=" + shippingCharge
				+ ", totalPrice=" + totalPrice + "]";
	}

}

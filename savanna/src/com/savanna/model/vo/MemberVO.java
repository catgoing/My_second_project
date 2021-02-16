package com.savanna.model.vo;

public class MemberVO {
	
	String id, pwd, name, addr, phone, email, mem_no, regdate;
	
	public MemberVO() {
	
	}

	public MemberVO(String id, String pwd, String name, String addr, String phone, String email, String mem_no, String regdate) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.addr = addr;
		this.phone = phone;
		this.email = email;
		this.mem_no = mem_no;
		this.regdate = regdate;
	}
	
//	public void SignIn(String id, String pwd) {
//		this.id = id;
//		this.pwd = pwd;
//	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMem_no() {
		return mem_no;
	}

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	
	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate.substring(0, 10);
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", addr=" + addr + ", phone=" + phone
				+ ", email=" + email + ", mem_no=" + mem_no + "]";
	}
	
	
	
	

}

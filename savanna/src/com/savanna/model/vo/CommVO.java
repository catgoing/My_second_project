package com.savanna.model.vo;

public class CommVO {
	private int comm_no, rev_no;
	private String id, comm_content, comm_date, comm_pwd;
	
	public CommVO() {
		super();
	}

	public CommVO(int comm_no, int rev_no, String id, String comm_content, String comm_date, String comm_pwd) {
		super();
		this.comm_no = comm_no;
		this.rev_no = rev_no;
		this.id = id;
		this.comm_content = comm_content;
		this.comm_date = comm_date;
		this.comm_pwd = comm_pwd;
	}

	public int getComm_no() {
		return comm_no;
	}

	public void setComm_no(int comm_no) {
		this.comm_no = comm_no;
	}

	public int getRev_no() {
		return rev_no;
	}

	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getComm_content() {
		return comm_content;
	}

	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}

	public String getComm_date() {
		return comm_date;
	}

	public void setComm_date(String comm_date) {
		this.comm_date = comm_date;
	}

	public String getComm_pwd() {
		return comm_pwd;
	}

	public void setComm_pwd(String comm_pwd) {
		this.comm_pwd = comm_pwd;
	}

	@Override
	public String toString() {
		return "CommVO [comm_no=" + comm_no + ", rev_no=" + rev_no + ", id=" + id + ", comm_content=" + comm_content
				+ ", comm_date=" + comm_date + ", comm_pwd=" + comm_pwd + "]";
	}
	
}
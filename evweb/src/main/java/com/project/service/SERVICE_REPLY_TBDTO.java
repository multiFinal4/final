package com.project.service;

import java.sql.Date;

public class SERVICE_REPLY_TBDTO {
	private String reply_no;
	private String board_no;
	private String manager_id;
	private String reply_contant;
	private Date reply_date;
	
	public SERVICE_REPLY_TBDTO() {}
	public SERVICE_REPLY_TBDTO(String reply_no, String board_no, String manager_id, String reply_contant,
			Date reply_date) {
		super();
		this.reply_no = reply_no;
		this.board_no = board_no;
		this.manager_id = manager_id;
		this.reply_contant = reply_contant;
		this.reply_date = reply_date;
	}
	@Override
	public String toString() {
		return "SERVICE_REPLY_TBDTO [reply_no=" + reply_no + ", board_no=" + board_no + ", manager_id=" + manager_id
				+ ", reply_contant=" + reply_contant + ", reply_date=" + reply_date + "]";
	}
	public String getReply_no() {
		return reply_no;
	}
	public void setReply_no(String reply_no) {
		this.reply_no = reply_no;
	}
	public String getBoard_no() {
		return board_no;
	}
	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public String getReply_contant() {
		return reply_contant;
	}
	public void setReply_contant(String reply_contant) {
		this.reply_contant = reply_contant;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	
}

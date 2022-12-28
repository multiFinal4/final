package com.project.service;

import java.sql.Date;

public class Service_TBDTO {
	private String board_no;
	private String manager_id;
	private String board_category;
	private String board_title;
	private String board_content;
	private Date board_date;
	
	public Service_TBDTO() {}
	public Service_TBDTO(String board_no, String manager_id, String board_category, String board_title,
			String board_content, Date board_date) {
		super();
		this.board_no = board_no;
		this.manager_id = manager_id;
		this.board_category = board_category;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
	}
	@Override
	public String toString() {
		return "Service_TBDTO [board_no=" + board_no + ", manager_id=" + manager_id + ", board_category="
				+ board_category + ", board_title=" + board_title + ", board_content=" + board_content + ", board_date="
				+ board_date + "]";
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
	public String getBoard_category() {
		return board_category;
	}
	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	
	
}

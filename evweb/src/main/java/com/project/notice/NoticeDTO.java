package com.project.notice;

import java.util.Date;

public class NoticeDTO {
	private int notice_no;
	private String notice_title;
	private String notice_content;
	private String manager_id;
	private Date notice_writedate;
	

	public NoticeDTO(int notice_no, String notice_title, String notice_content, String manager_id,
			Date notice_writedate) {
		super();
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.manager_id = manager_id;
		this.notice_writedate = notice_writedate;
	}

	@Override
	public String toString() {
		return "noticeDTO [notice_no=" + notice_no + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", manager_id=" + manager_id + ", notice_writedate=" + notice_writedate + "]";
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getManager_id() {
		return manager_id;
	}

	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}

	public Date getNotice_writedate() {
		return notice_writedate;
	}

	public void setNotice_writedate(Date notice_writedate) {
		this.notice_writedate = notice_writedate;
	}
	
}

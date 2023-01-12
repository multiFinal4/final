package com.project.notice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;


//순수하게 값을 저장하기 위해 사용
public class NoticeDTO {
	private String notice_no;
	private String notice_title;
	private String notice_content;
	private String manager_id;
	private String notice_writedate;
	private String notice_fix;
	
	//클라이언트가 전송하는 바이너리 파일 데이터를 스프링 MVC내부에서 MultipartFile객체로 만들어서 저장
	//첨부 파일이 여러 개인 경우 List에 저장하거나 배열로 관리
	private List<MultipartFile> files;
	
	public NoticeDTO() {
	}

	public NoticeDTO(String notice_no, String notice_title, String notice_content, String manager_id,
			String notice_writedate, List<MultipartFile> files, String notice_fix) {
		super();
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.manager_id = manager_id;
		this.notice_writedate = notice_writedate;
		this.notice_fix = notice_fix;
	}

	@Override
	public String toString() {
		return "NoticeDTO [notice_no=" + notice_no + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", manager_id=" + manager_id + ", notice_writedate=" + notice_writedate
				+ ", notice_fix=" + notice_fix + ", files=" + files + "]";
	}

	public String getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(String notice_no) {
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

	public String getNotice_writedate() {
		return notice_writedate;
	}

	public void setNotice_writedate(String notice_writedate) {
		this.notice_writedate = notice_writedate;
	}
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	public String getNotice_fix() {
		return notice_fix;
	}

	public void setNotice_fix(String notice_fix) {
		this.notice_fix = notice_fix;
	}
}

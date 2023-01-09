package com.project.file;

public class BoardFileDTO {
	private String category;
	private int board_no;
	private String file_no;
	private String originalFilename;
	private String storeFilename;
	private String notice_no;
	public BoardFileDTO() {}
	
	public BoardFileDTO(String originalFilename, String storeFilename) {
		super();
		this.originalFilename = originalFilename;
		this.storeFilename = storeFilename;
	}

	
	public BoardFileDTO(String category, String file_no, String originalFilename, String storeFilename,
			String notice_no) {
		super();
		this.category = category;
		this.file_no = file_no;
		this.originalFilename = originalFilename;
		this.storeFilename = storeFilename;
		this.notice_no = notice_no;
	}

	public BoardFileDTO(String category, int board_no, String file_no, String originalFilename, String storeFilename,
			String notice_no) {
		super();
		this.category = category;
		this.board_no = board_no;
		this.file_no = file_no;
		this.originalFilename = originalFilename;
		this.storeFilename = storeFilename;
		this.notice_no = notice_no;
	}

	@Override
	public String toString() {
		return "BoardFileDTO [category=" + category + ", board_no=" + board_no + ", file_no=" + file_no
				+ ", originalFilename=" + originalFilename + ", storeFilename=" + storeFilename + ", notice_no="
				+ notice_no + "]";
	}

	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getFile_no() {
		return file_no;
	}
	public void setFile_no(String file_no) {
		this.file_no = file_no;
	}
	public String getOriginalFilename() {
		return originalFilename;
	}
	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}
	public String getStoreFilename() {
		return storeFilename;
	}
	public void setStoreFilename(String storeFilename) {
		this.storeFilename = storeFilename;
	}

	public String getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(String notice_no) {
		this.notice_no = notice_no;
	}
	
}

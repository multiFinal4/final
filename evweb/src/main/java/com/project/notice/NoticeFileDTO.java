package com.project.notice;

public class NoticeFileDTO {
		private String Notice_no;
		private String originalFilename;
		private String storeFilename;
		private String NoticeFileno;
		
		private NoticeFileDTO() {
		}
		
		public NoticeFileDTO(String originalFilename, String storeFilename) {
			super();
			this.originalFilename = originalFilename;
			this.storeFilename = storeFilename;
		}
		//Noticefile의 상세정보 - insert
		public NoticeFileDTO(String originalFilename, String storeFilename, String NoticeFileno) {
			super();
			this.originalFilename = originalFilename;
			this.storeFilename = storeFilename;
			this.NoticeFileno = NoticeFileno;
		}
		//select
		public NoticeFileDTO(String Notice_no, String originalFilename, String storeFilename, String NoticeFileno) {
			super();
			this.Notice_no = Notice_no;
			this.originalFilename = originalFilename;
			this.storeFilename = storeFilename;
			this.NoticeFileno = NoticeFileno;
		}

		@Override
		public String toString() {
			return "NoticeFileDTO [Notice_no=" + Notice_no + ", originalFilename=" + originalFilename + ", storeFilename="
					+ storeFilename + ", NoticeFileno=" + NoticeFileno + "]";
		}

		public String getNotice_no() {
			return Notice_no;
		}
		public void setNotice_no(String Notice_no) {
			this.Notice_no = Notice_no;
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

		public String getNoticeFileno() {
			return NoticeFileno;
		}

		public void setNoticeFileno(String NoticeFileno) {
			this.NoticeFileno = NoticeFileno;
		}
		
	}


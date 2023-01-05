package com.project.faq;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "faq")
public class FaqDTO {
	@Id
	private String _id;
	private String title;
	private String content;
	
	public FaqDTO() {
	}
	
	public FaqDTO(String _id, String title, String content) {
		super();
		this._id = _id;
		this.title = title;
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "faqDTO [_id=" + _id + ", title=" + title + ", content=" + content + "]";
	}

	public String get_id() {
		return _id;
	}

	public void set_id(String _id) {
		this._id = _id;
	}

	public String gettitle() {
		return title;
	}

	public void settitle(String title) {
		this.title = title;
	}

	public String getcontent() {
		return content;
	}

	public void setcontent(String content) {
		this.content = content;
	}
	
}

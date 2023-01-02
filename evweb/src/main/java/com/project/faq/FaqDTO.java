package com.project.faq;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "faq")
public class FaqDTO {
	private String _id;
	private String faq_title;
	private String faq_content;
	
	public FaqDTO() {}
	public FaqDTO(String _id, String faq_title, String faq_content) {
		super();
		this._id = _id;
		this.faq_title = faq_title;
		this.faq_content = faq_content;
	}
	
	@Override
	public String toString() {
		return "faqDTO [_id=" + _id + ", faq_title=" + faq_title + ", faq_content=" + faq_content + "]";
	}

	public String get_id() {
		return _id;
	}

	public void set_id(String _id) {
		this._id = _id;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	
}

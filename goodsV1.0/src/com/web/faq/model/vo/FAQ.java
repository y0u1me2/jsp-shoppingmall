package com.web.faq.model.vo;

public class FAQ {

	private String faq_Title;
	private String faq_Content;
	private String faq_Cg;
	public FAQ() {
		super();
	}
	public FAQ(String faq_Title, String faq_Content, String faq_Cg) {
		super();
		this.faq_Title = faq_Title;
		this.faq_Content = faq_Content;
		this.faq_Cg = faq_Cg;
	}
	public String getFaq_Title() {
		return faq_Title;
	}
	public void setFaq_Title(String faq_Title) {
		this.faq_Title = faq_Title;
	}
	public String getFaq_Content() {
		return faq_Content;
	}
	public void setFaq_Content(String faq_Content) {
		this.faq_Content = faq_Content;
	}
	public String getFaq_Cg() {
		return faq_Cg;
	}
	public void setFaq_Cg(String faq_Cg) {
		this.faq_Cg = faq_Cg;
	}
	@Override
	public String toString() {
		return "FAQ [faq_Title=" + faq_Title + ", faq_Content=" + faq_Content + ", faq_Cg=" + faq_Cg + "]";
	}
	
}

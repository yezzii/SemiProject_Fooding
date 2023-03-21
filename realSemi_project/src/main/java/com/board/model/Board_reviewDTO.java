package com.board.model;

public class Board_reviewDTO {
	private int review_idx;
	private String review_title;
	private String review_writer;
	private String review_content;
	private int review_viewcnt;
	private String review_date;
	
	
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_writer() {
		return review_writer;
	}
	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_viewcnt() {
		return review_viewcnt;
	}
	public void setReview_viewcnt(int review_viewcnt) {
		this.review_viewcnt = review_viewcnt;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	
}

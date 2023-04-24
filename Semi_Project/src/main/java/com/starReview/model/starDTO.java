package com.starReview.model;

public class starDTO {

	private int star_review_idx;
	private int store_num;
	private String member_id;
	private String review;
	private String star_count;
	public int getStar_review_idx() {
		return star_review_idx;
	}
	public void setStar_review_idx(int star_review_idx) {
		this.star_review_idx = star_review_idx;
	}
	public int getStore_num() {
		return store_num;
	}
	public void setStore_num(int store_num) {
		this.store_num = store_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getStar_count() {
		return star_count;
	}
	public void setStar_count(String star_count) {
		this.star_count = star_count;
	}
}
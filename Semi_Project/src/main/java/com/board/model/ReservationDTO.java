package com.board.model;

public class ReservationDTO {
	
	private int booking_idx;
	private String member_id;
	private String date;
	private String d_day;
	private int main_idx;
	private int member_cnt;
	private int price;
	
	public int getBooking_idx() {
		return booking_idx;
	}
	public void setBooking_idx(int booking_idx) {
		this.booking_idx = booking_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getD_day() {
		return d_day;
	}
	public void setD_day(String d_day) {
		this.d_day = d_day;
	}
	public int getMain_idx() {
		return main_idx;
	}
	public void setMain_idx(int main_idx) {
		this.main_idx = main_idx;
	}
	public int getMember_cnt() {
		return member_cnt;
	}
	public void setMember_cnt(int member_cnt) {
		this.member_cnt = member_cnt;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
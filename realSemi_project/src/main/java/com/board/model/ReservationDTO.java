package com.board.model;

public class ReservationDTO {
	
	private String member_id;
	private String booking_date;
	private int main_idx;
	private int member_cnt;
	private int price;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getBooking_date() {
		return booking_date;
	}
	public void setBooking_date(String booking_date) {
		this.booking_date = booking_date;
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

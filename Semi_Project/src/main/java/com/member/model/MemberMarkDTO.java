package com.member.model;

public class MemberMarkDTO {

	private int idx;
	private String mem_id;
	private int marked_storeidx;
	private int mark_YN;

	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getMarked_storeidx() {
		return marked_storeidx;
	}
	public void setMarked_storeidx(int marked_storeidx) {
		this.marked_storeidx = marked_storeidx;
	}
	public int getMark_YN() {
		return mark_YN;
	}
	public void setMark_YN(int mark_YN) {
		this.mark_YN = mark_YN;
	}
	
}

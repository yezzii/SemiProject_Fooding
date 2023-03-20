package com.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDTO;

public class MemberWirterOkAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		//회원등록 폼 페이지에서 넘어온 데이터들을 등록시키는 비지니스 로직.
		
		String member_id = 
				request.getParameter("mem_id");
		String member_name = 
				request.getParameter("mem_name");
		String member_pwd = 
				request.getParameter("mem_pwd");
		String member_email = 
				request.getParameter("mem_email");
		String member_phone = 
				request.getParameter("mem_phone");
		
		MemberDTO dto = new MemberDTO();
		
		dto.setMember_name(member_name);
		dto.setMember_id(member_id);
		
		
		return null;
	}

}

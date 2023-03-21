package com.member.action;	//real

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

public class MemberWirterOkAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//회원등록 폼 페이지에서 넘어온 데이터들을 등록시키는 비지니스 로직.

		int member_accout =
				Integer.parseInt(request.getParameter("member_accout").trim());
		String member_id = 
				request.getParameter("member_id").trim();
		String member_name = 
				request.getParameter("member_name").trim();
		String member_pwd = 
				request.getParameter("member_pwd").trim();
		String member_email = 
				request.getParameter("member_email").trim();
		String member_phone = 
				request.getParameter("member_phone").trim();
		
		MemberDTO dto = new MemberDTO();
		
		dto.setMember_accout(member_accout);
		dto.setMember_name(member_name);
		dto.setMember_id(member_id);
		dto.setMember_pwd(member_pwd);
		dto.setMember_phone(member_phone);
		dto.setMember_email(member_email);
		
		MemberDAO dao = MemberDAO.getInstance();
		
		int res = dao.insertMember(dto);
		
		PrintWriter out = response.getWriter();
		
		if(res>0) {
			out.println("<script>");
			out.println("alert('회원등록성공')");
			out.println("location.href='select.go'");
			out.println("<script>");
		}else {
			out.println("<script>");
			out.println("alert('회원등록실패')");
			out.println("history.back()");
			out.println("<script>");
		}

		return null;
	}
}
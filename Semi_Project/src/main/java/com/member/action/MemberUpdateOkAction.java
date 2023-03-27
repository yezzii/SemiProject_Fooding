package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

public class MemberUpdateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		String member_id = request.getParameter("member_id").trim();		
		String member_pwd = request.getParameter("member_pwd").trim();		
		String member_email = request.getParameter("member_email").trim();		
		String member_phone = request.getParameter("member_phone").trim();
		String member_name =request.getParameter("member_name").trim();
		String member_mark = request.getParameter("member_mark").trim();
		String member_storenum = request.getParameter("member_storenum").trim();
		int member_account = Integer.parseInt(request.getParameter("member_account"));
		
		String db_pwd = request.getParameter("db_pwd").trim();
		
		MemberDTO dto = new MemberDTO();
		
		dto.setMember_id(member_id);
		dto.setMember_pwd(member_pwd);
		dto.setMember_email(member_email);
		dto.setMember_phone(member_phone);
		dto.setMember_id(member_id);
		dto.setMember_name(member_name);
		dto.setMember_mark(member_mark);
		dto.setMember_storenum(member_storenum);
		
		MemberDAO dao = MemberDAO.getInstance();
		
		PrintWriter out = response.getWriter();
		

			int check = dao.updateMember(dto);
			
			if(check > 0) {
				out.println("<script>");
				out.println("alert('회원 정보 수정 성공!!!')");
				out.println("location.href='content.do?id="+dto.getMember_id()+"'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('회원 정보 수정 실패~~~')");
				out.println("history.back()");
				out.println("</script>");
			}
	
		
		return null;
	
	}

}

package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

public class MemberProfileUpdateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		String member_id =request.getParameter("id").trim();
		
		
		String member_pwd = request.getParameter("member_pwd").trim();		
		String member_email = request.getParameter("member_email").trim();		
		String member_phone = request.getParameter("member_phone").trim();
		
		
		
		MemberDTO dto = new MemberDTO();
		
	
		dto.setMember_pwd(member_pwd);
		dto.setMember_email(member_email);
		dto.setMember_phone(member_phone);
	
		
		MemberDAO dao = MemberDAO.getInstance();
		
		PrintWriter out = response.getWriter();
		

			int check = dao.updateProfileMember(dto);
			
			if(check > 0) {
				out.println("<script>");
				out.println("alert('회원 정보 수정 성공!!!')");
				out.println("location.href='account-profile.jsp'");
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

package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

import sha256.Encryption;


public class MemberJoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		//한글처리 작업 진행.
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html charset=utf-8");
		
		String member_id = request.getParameter("member_id");
		String member_name = request.getParameter("member_name");
		String Raw_pwd = request.getParameter("member_pwd");
		String member_pwd = Encryption.encodeSha256(Raw_pwd);
		String member_email = request.getParameter("member_email");
		String member_phone = request.getParameter("member_phone");
		

		MemberDTO dto = new MemberDTO();

		dto.setMember_id(member_id);
		dto.setMember_name(member_name);
		dto.setMember_pwd(member_pwd);
		dto.setMember_email(member_email);
		dto.setMember_phone(member_phone);
		dto.setMember_type(1);

		MemberDAO dao = MemberDAO.getInstance();

		int result = dao.MemberJoin(dto);

		PrintWriter out = response.getWriter();

		if(result > 0) {
			out.println("<script>");
			out.println("alert('"+dto.getMember_id()+"님 환영합니다.')");
			out.println("location.href='index.jsp'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('회원가입 실패')");
			out.println("history.back()");
			out.println("</script>");
		}

		return null;
	}

}

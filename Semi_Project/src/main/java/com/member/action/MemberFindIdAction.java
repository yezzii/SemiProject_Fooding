package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;

public class MemberFindIdAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		String member_name = request.getParameter("send_name");
		String member_email = request.getParameter("send_email");
		
		MemberDAO dao = MemberDAO.getInstance();
		
		String foundId = dao.MemberFindId(member_name, member_email);
		
		PrintWriter out = response.getWriter();
		
		if(foundId == null) {
			out.println("<script>");
			out.println("alert('이름이나 이메일을 잘못입력하셨습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('아이디 : "+foundId+"')");
			out.println("location.href('member/main.jsp')");
			out.println("</script>");
		}
		
		return null;
	}

}

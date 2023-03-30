package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;

public class MemberFindPwdAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
	
		
		String member_name = request.getParameter("name");
		String member_email = request.getParameter("email");
		
		MemberDAO dao = MemberDAO.getInstance();
		
		String foundPwd = dao.MemberFindPwd(member_name, member_email);
		
		PrintWriter out = response.getWriter();
		
		if(foundPwd == null) {
			out.println("<script>");
			out.println("alert('이름이나 이메일을 잘못씀.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('아이디 : "+foundPwd+"')");
			out.println("location.href('../main.jsp')");
			out.println("</script>");
		}
		
		
		return null;
	}

}

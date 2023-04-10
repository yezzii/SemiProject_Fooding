package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

import sha256.Encryption;


public class MemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException ,ServletException {

		MemberDAO dao = MemberDAO.getInstance();
		
		String id = request.getParameter("id");
		String Raw_pwd = request.getParameter("pwd");
		String pwd = Encryption.encodeSha256(Raw_pwd);
		
		HttpSession session = request.getSession();

		PrintWriter out = response.getWriter();

		session = request.getSession(true);

		MemberDTO memdto = dao.MemberLogin(id, pwd);

		if (memdto != null) {
			
			if (memdto.getMember_type() == 0) {
				
				session.setAttribute("id", memdto.getMember_id());
				session.setAttribute("name", memdto.getMember_name());
				session.setAttribute("type", memdto.getMember_type());
				
				out.println("<script>");
				out.println("alert('" + session.getAttribute("name") + " 관리자님 오늘도 환영합니다.')");
				out.println("location.href='index.jsp'");
				out.println("</script>");
				
			} else if (memdto.getMember_type() == 1) {

				session.setAttribute("id", memdto.getMember_id());
				session.setAttribute("email", memdto.getMember_email());
				session.setAttribute("phone", memdto.getMember_phone());
				session.setAttribute("name", memdto.getMember_name());
				session.setAttribute("type", memdto.getMember_type());

				out.println("<script>");
				out.println("alert('" + session.getAttribute("name") + " 회원님 다시 오신걸 환영합니다.')");
				out.println("location.href='index.jsp'");
				out.println("</script>");

			} else if (memdto.getMember_type() == 2) {

				session.setAttribute("id", memdto.getMember_id());
				session.setAttribute("email", memdto.getMember_email());
				session.setAttribute("phone", memdto.getMember_phone());
				session.setAttribute("name", memdto.getMember_name());
				session.setAttribute("type", memdto.getMember_type());
				session.setAttribute("storenum", memdto.getMember_storenum());

				out.println("<script>");
				out.println("alert('" + session.getAttribute("name") + " 사장님 다시 오신걸 환영합니다.')");
				out.println("location.href='index.jsp'");
				out.println("</script>");
			}
		}else {
			
				out.println("<script>");
				out.println("alert('아이디 및 비밀번호를 확인해주세요')");
				out.println("history.back()");
				out.println("</script>");
			
		}

		return null;
	}

}

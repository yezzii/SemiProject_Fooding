package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.CompanyDTO;
import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

import sha256.Encryption;

public class MemberLoginAction implements MemberAction {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String member_type = request.getParameter("member_chk");
		String id = request.getParameter("id");
		String Raw_pwd = request.getParameter("pwd");
		String pwd = Encryption.encodeSha256(Raw_pwd);

		MemberDAO dao = MemberDAO.getInstance();

		MemberDTO memdto = null;

		CompanyDTO comdto = null;

		HttpSession session = request.getSession();

		PrintWriter out = response.getWriter();

		session = request.getSession(true);
		if (member_type.equals("normal")) {
			memdto = dao.NormalLogin(id, pwd);

			if (memdto.getMember_id().equals("")) {
				out.println("<script>");
				out.println("alert('아이디 및 비밀번호를 확인해주세요')");
				out.println("history.back()");
				out.println("</script>");
			} else {

				session.setAttribute("id", memdto.getMember_id());
				session.setAttribute("email", memdto.getMember_email());
				session.setAttribute("phone", memdto.getMember_phone());
				session.setAttribute("name", memdto.getMember_name());

				out.println("<script>");
				out.println("alert('" + session.getAttribute("name") + " 회원님 다시 오신걸 환영합니다.')");
				out.println("location.href='main.jsp'");
				out.println("</script>");
			}
		} else if (member_type.equals("company")) {
			comdto = dao.CompanyLogin(id, pwd);

			if (comdto.getCompany_id().equals("")) {
				out.println("<script>");
				out.println("alert('아이디 및 비밀번호를 확인해주세요')");
				out.println("history.back()");
				out.println("</script>");
			} else {

				session.setAttribute("id", comdto.getCompany_id());
				session.setAttribute("email", comdto.getCompany_email());
				session.setAttribute("phone", comdto.getCompany_phone());
				session.setAttribute("name", comdto.getCompany_name());
				session.setAttribute("storenum", comdto.getCompany_storenum());

				out.println("<script>");
				out.println("alert('" + session.getAttribute("name") + " 사업자님 다시 오신걸 환영합니다.')");
				out.println("location.href='main.jsp'");
				out.println("</script>");
			}
		}

		return null;
	}

}

package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.CompanyDTO;
import com.member.model.MemberDAO;

import sha256.Encryption;

public class CompanyJoinAction implements MemberAction {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		String company_id = request.getParameter("company_id");
		String company_name = request.getParameter("company_name");
		String Raw_pwd = request.getParameter("company_pwd");
		String company_pwd = Encryption.encodeSha256(Raw_pwd);
		String company_email = request.getParameter("company_email");
		String company_phone = request.getParameter("company_phone");
		String company_storenum = request.getParameter("company_storenum");

		CompanyDTO dto = new CompanyDTO();

		dto.setCompany_id(company_id);
		dto.setCompany_name(company_name);
		dto.setCompany_pwd(company_pwd);
		dto.setCompany_email(company_email);
		dto.setCompany_phone(company_phone);
		dto.setCompany_storenum(company_storenum);

		MemberDAO dao = MemberDAO.getInstance();

		int result = dao.CompanyJoin(dto);

		PrintWriter out = response.getWriter();

		if(result > 0) {
			out.println("<script>");
			out.println("alert('"+dto.getCompany_id()+"님 환영합니다.')");
			out.println("location.href='select.go'");
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

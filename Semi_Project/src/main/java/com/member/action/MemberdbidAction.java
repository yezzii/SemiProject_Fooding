package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.member.model.MemberDAO;

public class MemberdbidAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// DB에 있는 아이디와 회원가입창에 쓴 아이디가 중복이 되는지 
		// 확인하는 비지니스 로직.
		
		//한글처리 작업 진행.
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html charset=utf-8");
		
		String company_id
			 = request.getParameter("company_id").trim();
	System.out.println(company_id);
		
		MemberDAO dao = MemberDAO.getInstance();
		
		int result = dao.idCheck(company_id);
		
		PrintWriter out = response.getWriter();
		if(result == 1) {
			out.println("<script>");
			out.println("alert('중복 아이디입니다.'");
			out.println("history.back()");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('사용 가능한 아이디입니다.'");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return null;
	}

}

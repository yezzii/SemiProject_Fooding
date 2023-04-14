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
		
		//한글처리 작업 진행.
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html charset=utf-8");

		String member_name = request.getParameter("paramName");
		String member_email = request.getParameter("paramEmail");
		
		System.out.println(member_name);
		System.out.println(member_email);
		
		MemberDAO dao = MemberDAO.getInstance();
		
		String foundId = dao.MemberFindId(member_name, member_email);
		
		PrintWriter out = response.getWriter();
		
		
		out.write(foundId);
		
	
		return null;
	}

}

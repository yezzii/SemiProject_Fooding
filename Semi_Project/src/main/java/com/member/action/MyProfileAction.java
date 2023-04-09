package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

import sha256.Encryption;

public class MyProfileAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		
		String id = request.getParameter("id");
		String Rawpwd = request.getParameter("pwd");
		String pwd = Encryption.encodeSha256(Rawpwd);
		
		MemberDTO dto = new MemberDTO();
		
		
		MemberDAO dao = MemberDAO.getInstance();
		
		MemberDTO check = dao.myProfile(id);
		
		PrintWriter out = response.getWriter();
		
		if(pwd.equals(dto.getMember_pwd())) {
			
		}
		
		request.setAttribute("info", check);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("member/member_profile.jsp");
		
		return forward;
	}

}

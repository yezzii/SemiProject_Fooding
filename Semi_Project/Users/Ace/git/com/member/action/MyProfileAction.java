package com.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

public class MyProfileAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		
		String password = request.getParameter("pwd");
		
		MemberDTO dto = new MemberDTO();
		
		dto.setMember_pwd(password);
		
		MemberDAO dao = MemberDAO.getInstance();
		
		MemberDTO check = dao.myProfile(password);
		
		request.setAttribute("pwd", check);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("member/member_profile.jsp");
		
		return forward;
	}

}

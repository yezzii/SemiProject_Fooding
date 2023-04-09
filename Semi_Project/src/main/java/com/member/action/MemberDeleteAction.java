package com.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		
		String member_id = request.getParameter("id").trim();
		System.out.println(member_id);
		
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = dao.getMemberSelect(member_id);
		
		request.setAttribute("DTO", dto);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("member/member_delete.jsp");
		
		return forward;
	}

}




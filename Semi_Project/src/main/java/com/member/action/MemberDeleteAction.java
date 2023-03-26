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

		
		String member_id ="test";	//request.getParameter("id").trim();
				
		request.setAttribute("DeleteMemId", member_id);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("member/member_delete.jsp");
		
		return forward;
	}

}

package com.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

public class MemberUpdateAction implements Action {

	@Override		//회원정보수정하는 기능.
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String member_id =request.getParameter("id").trim();
			System.out.println(member_id);
			System.out.println();
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = dao.getMemberSelect(member_id);
		
		request.setAttribute("MemInfo", dto);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("member/member_update.jsp");
		
		return forward;
	}

}

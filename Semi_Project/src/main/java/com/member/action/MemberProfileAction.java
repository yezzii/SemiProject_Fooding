package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;
import com.mysql.cj.Session;

public class MemberProfileAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// 요청 : 게시물 전체 목록을 보여달라는 요청.
		// 응답 : DB의 board 테이블 전체 게시물 목록을

		HttpSession session = request.getSession();
		
		String id =	(String)session.getAttribute("id");
		
		MemberDAO dao = MemberDAO.getInstance();
	
		MemberDTO MemberProfile = dao.getMemberProfile(id);


		request.setAttribute("List", MemberProfile);

		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("account-profile.jsp");
		
		return forward;
	}

}

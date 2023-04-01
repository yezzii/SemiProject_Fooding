package com.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberKakaoJoinAction implements Action {

@Override
public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException {
	

			String member_id = request.getParameter("member_id").trim();
			String member_name = request.getParameter("member_name").trim();
			String member_email = request.getParameter("member_email").trim();
			
			request.setAttribute("member_id", member_id);
			request.setAttribute("member_name", member_name);
			request.setAttribute("member_email", member_email);
			
			ActionForward forward = new ActionForward();
			
			// view page 로 이동 시에는 false 값 지정.
			forward.setRedirect(false);
			
			forward.setPath("member/member_kakao_join.jsp");
			
			return forward;
		}

	}

